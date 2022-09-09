<?php
/**
 * Validator class
 *
 * @package   CanaryAAC
 * @author    Lucas Giovanni <lucasgiovannidesigner@gmail.com>
 * @copyright 2022 CanaryAAC
 */

namespace App\Model\Functions;

use Symfony\Component\Mailer\Transport;
use Symfony\Component\Mailer\Mailer;
use Symfony\Component\Mime\Email;

class Calendar{

    private $active_year;
    private $active_month;
    private $active_day;
    private $events = [];

    public function __construct($date = null)
    {
        $this->active_year = $date != null ? date('Y', strtotime($date)) : date('Y');
        $this->active_month = $date != null ? date('m', strtotime($date)) : date('m');
        $this->active_day = $date != null ? date('d', strtotime($date)) : date('d');
    }

    public function addEvent($txt, $date, $days = 1, $color = '')
    {
        $color = $color ? ' ' . $color : $color;
        $this->events[] = [$txt, $date, $days, $color];
    }

    public function __toString()
    {
        $num_days = date('t', strtotime($this->active_day . '-' . $this->active_month . '-' . $this->active_year));
        $num_days_last_month = date('j', strtotime('last day of previous month', strtotime($this->active_day . '-' . $this->active_month . '-' . $this->active_year)));
        $days = [1 => 'Monday', 2 => 'Tuesday', 3 => 'Wednesday', 4 => 'Thursday', 5 => 'Friday', 6 => 'Saturday', 0 => 'Sunday'];
        $first_day_of_week = array_search(date('D', strtotime($this->active_year . '-' . $this->active_month . '-1')), $days);

        $html = '<div style="display: flex; flex-wrap: wrap;">';
        foreach ($days as $day) {
            $html .= '<div style="display: flex; align-items: center; justify-content: center; width:120px; height: 24px; color: #fff; background-color:#5f4d41; border: 1px solid #FAF0D7;"><b>' . $day . '</b></div>';
        }
        $html .= '</div><div style="display: flex; flex-wrap: wrap;">';
        
        for ($i = $first_day_of_week; $i > 0; $i--) {
            $html .= '<div style="height:82px; background-clip: padding-box; overflow: hidden; vertical-align:top; background-color:#D4C0A1;">
                    <div style="font-weight: bold; margin-left: 3px; margin-bottom: 2px;">
                    <span style="vertical-align: text-bottom;">
                    ' . ($num_days_last_month-$i+1) . '
                    </span>
                    </div>
                    </div>
                    ';
        }        
        
        for ($i = 1; $i <= $num_days; $i++) {
            $selected = 'E7D1AF';
            if ($i == $this->active_day) {
                $selected = 'f3e5d0';
            }
                $html .= '<div style="height:82px; width:120px; border: 1px solid #FAF0D7; background-clip: padding-box; overflow: hidden; vertical-align:top; background-color:#'. $selected .';">
                        <div style="font-weight: bold; margin-left: 3px; margin-bottom: 2px;">';
                $html .= '<span style="vertical-align: text-bottom;">' . $i . '</span></div>';
                foreach ($this->events as $event) {
                    for ($d = 0; $d <= ($event[2]-1); $d++) {
                        if (date('y-m-d', strtotime($this->active_year . '-' . $this->active_month . '-' . $i . ' -' . $d . ' day')) == date('y-m-d', strtotime($event[1]))) {
                            $html .= '<div class="event' . $event[3] . '">';
                            $html .= $event[0];
                            $html .= '</div>';
                        }
                    }
                }
                $html .= '</div>';
        }
        
        
        for ($i = 1; $i <= (42-$num_days-max($first_day_of_week, 0)); $i++) {
            $html .= '<div style="height:82px; width:120px; border: 1px solid #FAF0D7; background-clip: padding-box; overflow: hidden; vertical-align:top; background-color:#D4C0A1;">
            <div style="font-weight: bold; margin-left: 3px; margin-bottom: 2px;">';
            $html .= '<span style="vertical-align: text-bottom;">' . $i . '</span></div></div>';
        }
        $html .= '</div>';
        return $html;
    }
}