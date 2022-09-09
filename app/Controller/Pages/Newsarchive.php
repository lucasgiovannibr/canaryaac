<?php
/**
 * Newsarchive Class
 *
 * @package   CanaryAAC
 * @author    Lucas Giovanni <lucasgiovannidesigner@gmail.com>
 * @copyright 2022 CanaryAAC
 */

namespace App\Controller\Pages;

use App\Model\Entity\News as EntityNews;
use App\Model\Functions\News;
use \App\Utils\View;
use App\Model\Functions\Server;

class Newsarchive extends Base{

    public static function viewNewsArchiveById($request, $id)
    {
        if (!filter_var($id, FILTER_VALIDATE_INT)){
            $request->getRouter()->redirect('/newsarchive');
        }
        $news = EntityNews::getNews('id = "'.$id.'"')->fetchObject();
        if (!$news) {
            $request->getRouter()->redirect('/newsarchive');
        }
        $arrayNews = [
            'id' => $news->id,
            'title' => $news->title,
            'body' => $news->body,
            'type' => $news->type,
            'date' => date('M d Y', strtotime($news->date)),
            'time' => date('H:i', strtotime($news->date)),
            'category' => News::convertCategoryName($news->category),
            'category_img' => News::convertCategoryBigImage($news->category),
            'player_id' => $news->player_id,
            'article_text' => $news->article_text,
            'article_image' => $news->article_image,
            'hidden' => $news->hidden,
        ];
        $content = View::render('pages/newsarchive_view', [
            'new' => $arrayNews,
        ]);
        return parent::getBase('Newsarchive', $content, 'newsarchive');
    }

    public static function getAllNews($request)
    {
        $postVars = $request->getPostVars();

        $filter_begin_day = $postVars['filter_begin_day'] ?? date('d');
        $filter_begin_month = $postVars['filter_begin_month'] ?? date('m');
        $filter_begin_year = $postVars['filter_begin_year'] ?? date('Y');
        $final_begin_date = $filter_begin_day . '-' . $filter_begin_month . '-' . $filter_begin_year;
        $convert_begin_date = strtotime($final_begin_date);

        $filter_end_day = $postVars['filter_end_day'] ?? date('d');
        $filter_end_month = $postVars['filter_end_month'] ?? date('m');
        $filter_end_year = $postVars['filter_end_year'] ?? date('Y');
        $final_end_date = $filter_end_day . '-' . $filter_end_month . '-' . $filter_end_year;
        $convert_end_date = strtotime($final_end_date);

        $selectNews = EntityNews::getNews();
        while ($news = $selectNews->fetchObject()) {
            $arrayNews[] = [
                'id' => $news->id,
                'title' => $news->title,
                'body' => $news->body,
                'type' => $news->type,
                'date' => date('M d Y', strtotime($news->date)),
                'time' => date('H:i', strtotime($news->date)),
                'category' => News::convertCategoryName($news->category),
                'category_img' => News::convertCategoryImage($news->category),
                'player_id' => $news->player_id,
                'article_text' => $news->article_text,
                'article_image' => $news->article_image,
                'hidden' => $news->hidden,
            ];
        }
        $filters = [
            'filter_ticker' => $postVars['filter_ticker'] ?? 0,
            'filter_article' => $postVars['filter_article'] ?? 0,
            'filter_news' => $postVars['filter_news'] ?? 0,
            'filter_cipsoft' => $postVars['filter_cipsoft'] ?? 0,
            'filter_community' => $postVars['filter_community'] ?? 0,
            'filter_development' => $postVars['filter_development'] ?? 0,
            'filter_support' => $postVars['filter_support'] ?? 0,
            'filter_technical' => $postVars['filter_technical'] ?? 0,
        ];
        $returnNews = [
            'filters' => $filters,
            'news' => $arrayNews
        ];
        return $returnNews ?? '';
    }

    public static function viewNewsArchive($request)
    {
        $arrayDate = [
            'to_day' => date('d'),
            'to_month' => date('m'),
            'to_year' => date('Y'),
            'from_day' => date('d'),
            'from_month' => date('m', strtotime('-1 month')),
            'from_year' => date('Y'),
        ];
        $allNews = self::getAllNews($request);
        $content = View::render('pages/newsarchive', [
            'news' => $allNews['news'],
            'filter' => $allNews['filters'],
            'date' => $arrayDate,
        ]);
        return parent::getBase('Newsarchive', $content, 'newsarchive');
    }
    
}