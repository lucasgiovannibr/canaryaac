$(document).ready(function() {

    // functionality for special case in payment process
    $('#ConfirmationForm').submit(function( event ) {
      $('#SubmitButtonContainer .BigButton input').attr('disabled', 'disabled');
      $('#SubmitButtonContainer .BigButton').hide();
      $('.HideAfterSubmit').hide();
      $('#ChangePaymentMethodBlock').closest('tr').hide();
      $('.HideBeforeSubmit').show();
    });
  
    // change submit event for forms using the reCaptcha
    // display the trigger the invisible Google reCaptcha instead of submitting the form
    $('#CreateAccountAndCharacterForm, #CreateCharacterForm').submit(function( event ) {
      $("#CreateAccountAndCharacterForm, #CreateCharacterForm").unbind("submit");
      grecaptcha.execute();
      event.preventDefault();
    });
  
    // ???
    $("tr[id^='applicationtext-']").hide();
  
    // initialize anniversary count down
    var g_Now = Math.floor(new Date().getTime() / 1000);
    if (g_Now < JS_ANNIVERSARY_THEMEBOX_STEP_3 && g_Now >= JS_ANNIVERSARY_THEMEBOX_STEP_1) {
      var g_AnniversaryDate = new Date((JS_ANNIVERSARY_THEMEBOX_STEP_3 * 1000));
      InitializeFancyAnniversaryCountDown(g_AnniversaryDate, g_Now);
    }
  
    // we activate the caps lock warning if required
    if (typeof g_ActivateCapsLockWarning !== 'undefined' && g_ActivateCapsLockWarning == true) {
      AddCapsLockEventListeners();
    }
  
    // initalise all character aucion count downs on the page
    InitAllCharacterAuctionCountDowns();
    InitAllCharacterAuctionBidListener();
  
    // mobile menu scroll behaviour
    let lastScroll = 0;
    $(window).bind('scroll', function () {
      let currentScroll = window.pageYOffset;
      if ($('#MobileMenuIcon').is(':checked') != true) {
        if (currentScroll - lastScroll > 0) {
          if (currentScroll > 100) {
            // scroll down - hide
            $('#MobileMenu').stop( true, false).animate({'top': '-75px'}, 400);
          }
        } else {
          //console.log('### up');
          // scrolled up - show
          $('#MobileMenu').stop( true, false).animate({'top': '0px'}, 400);
        }
      }
      lastScroll = currentScroll;
    });
  });
  
  
  //define a call back function for the Google reCaptcha verification
  //when the reCaptcha was successfully the form will get submitted immediatelly
  function ReCaptchaCallback(a_Response)
  {
    if (a_Response.length > 0) {
      if ($('#CreateAccountAndCharacterForm').html() != null) {
        $('#CreateAccountAndCharacterForm input[name=g-recaptcha-response]').val(a_Response);
        document.forms.CreateAccountAndCharacter.submit();
      } else {
        $('#CreateCharacterForm input[name=g-recaptcha-response]').val(a_Response);
        document.forms.CreateCharacterForm.submit();
      }
    }
  }
  
  
  // Set the correct selected method to invite new players to Tibia.
  //
  // @param a_Selection active selection
  function UpdateTellAFriendInviteOptions(a_Selection)
  {
    if (a_Selection == 0) {
      // share by link
      $('#TAF_Link').slideDown('slow');
      $('#TAF_Email').slideUp('slow');
      $('#TAF_Facebook').slideUp('slow');
      $('#TAF_Option_Link').addClass('TAF_ActiveSelection');
      $('#TAF_Option_Email').removeClass('TAF_ActiveSelection');
      $('#TAF_Option_Facebook').removeClass('TAF_ActiveSelection');
      $('#TAF_Option_Link .TAF_Option_GoldBorder').css('visibility', 'visible');
      $('#TAF_Option_Email .TAF_Option_GoldBorder').css('visibility', 'hidden');
      $('#TAF_Option_Facebook .TAF_Option_GoldBorder').css('visibility', 'hidden');
    } else if (a_Selection == 1) {
      // share by email
      $('#TAF_Link').slideUp('#TAF_Link');
      $('#TAF_Email').slideDown('#TAF_Link');
      $('#TAF_Facebook').slideUp('#TAF_Link');
      $('#TAF_Option_Link').removeClass('TAF_ActiveSelection');
      $('#TAF_Option_Email').addClass('TAF_ActiveSelection');
      $('#TAF_Option_Facebook').removeClass('TAF_ActiveSelection');
      $('#TAF_Option_Link .TAF_Option_GoldBorder').css('visibility', 'hidden');
      $('#TAF_Option_Email .TAF_Option_GoldBorder').css('visibility', 'visible');
      $('#TAF_Option_Facebook .TAF_Option_GoldBorder').css('visibility', 'hidden');
    } else {
      // share by facebook
      $('#TAF_Link').slideUp('#TAF_Link');
      $('#TAF_Email').slideUp('#TAF_Link');
      $('#TAF_Facebook').slideDown('#TAF_Link');
      $('#TAF_Option_Link').removeClass('TAF_ActiveSelection');
      $('#TAF_Option_Email').removeClass('TAF_ActiveSelection');
      $('#TAF_Option_Facebook').addClass('TAF_ActiveSelection');
      $('#TAF_Option_Link .TAF_Option_GoldBorder').css('visibility', 'hidden');
      $('#TAF_Option_Email .TAF_Option_GoldBorder').css('visibility', 'hidden');
      $('#TAF_Option_Facebook .TAF_Option_GoldBorder').css('visibility', 'visible');
    }
  }
  
  
  //
  //
  // // Hides and unhides the HTML elements with the specified names
  //
  // @param a_ElementsToHide HTML ID of the element to hide as string
  //                         or an array of IDs as strings
  // @param a_ElementsToShow HTML ID of the element to make visible
  //                         as string or an array of IDs as strings
  function ToggleVisibility(a_ElementsToHide, a_ElementsToShow)
  {
    if (typeof (a_ElementsToHide) == 'object') { // array
      for (var i = 0; i < a_ElementsToHide.length(); ++i) {
        document.getElementById(a_ElementsToHide[i]).style.display = 'none';
      }
    } else if (typeof (a_ElementsToHide) == 'string') {
      document.getElementById(a_ElementsToHide).style.display = 'none';
    }
  
    if (typeof (a_ElementsToShow) == 'object') { // array
      for (var i = 0; i < a_ElementsToShow.length(); ++i) {
        document.getElementById(a_ElementsToShow[i]).style.display = 'block';
      }
    } else if (typeof (a_ElementsToShow) == 'string') {
      document.getElementById(a_ElementsToShow).style.display = 'block';
    }
  }
  
  function ToggleTrigger($a_This, a_TriggerName) {
    if($a_This.checked) {
      document.getElementById(a_TriggerName).style.display = 'block';
    } else {
      document.getElementById(a_TriggerName).style.display = 'none';
    }
  }
  
  // Adds a limitation of the maximum text length on a text area
  // input, that is enforced by JS
  //
  // All previously assigned event handlers of the text area are preserved.
  //
  // @param TextAreaID HTML ID of the text area
  // @param MaxLen Positive int specifying the maximum number of characters
  // that can be entered in the text area
  function SetLenLimit(TextAreaID, MaxLen)
  {
    var TextArea = document.getElementById(TextAreaID);
    if (TextArea == null) {
      CipLogError('SetLenLimit(): Input "' + TextAreaID + '" not found');
      return;
    }
  
    EnforceLenLimitClosure = function()
    {
      if (TextArea.value.length > MaxLen) {
        TextArea.value = TextArea.value.substring(0, MaxLen);
      }
    };
    AddEventHandler(TextArea, 'onkeyup', EnforceLenLimitClosure);
    AddEventHandler(TextArea, 'onblur', EnforceLenLimitClosure);
  }
  
  // Installs an event handler on a text area input that dynamically updates
  // a counter showing the remaining allowed number of characters
  //
  // All previously assigned event handlers of the text area are preserved.
  //
  // @param TextAreaID HTML ID of the text area
  // @param CounterID HTML ID of the span or div element where the remaining
  // number of characters will be put in
  // @param MaxLen Positive int specifying the maximum number of characters
  // that can be entered in the text area
  function SetRemainingLenCounter(TextAreaID, CounterID, MaxLen)
  {
    var TextArea = document.getElementById(TextAreaID);
    if (TextArea == null) {
      CipLogError('SetLenLimit(): Text area input "' + TextAreaID + '" not found');
      return;
    }
    var Counter = document.getElementById(CounterID);
    if (Counter == null) {
      CipLogError('SetLenLimit(): Counter input "' + CounterID + '" not found');
      return;
    }
  
    UpdateCounterClosure = function()
    {
      Counter.innerHTML = MaxLen - TextArea.value.length;
    };
    AddEventHandler(TextArea, 'onkeyup', UpdateCounterClosure);
    AddEventHandler(TextArea, 'onblur', UpdateCounterClosure);
    TextArea.onkeyup();
  }
  
  // -------------------
  // debugging functions
  // -------------------
  
  // Set to true to enable error logging
  var EnableDebug = true;
  
  // Default error logger, logs to the FireBug console
  function CipLogError(ErrMsg)
  {
    if (EnableDebug) {
      console.error(ErrMsg);
    }
  }
  
  // -------------------------
  // internal helper functions
  // -------------------------
  
  // Adds a new event handler function to the specified event handler of
  // a DOM object
  //
  // The new event will be appended to the end of the call chain and
  // will fire after the previous events have sucessfully completed.
  //
  // @param Element DOM object that we want to add the event handler to
  // @param EventHandlerName Name of the event handler function that we
  // want to add the event to, e.g. 'onclick' or
  // 'onkeyup'
  // @param Function New event handler to be added to the existing ones
  function AddEventHandler(Element, EventHandlerName, Function)
  {
    var EventHandler = Element[EventHandlerName];
    if (EventHandler) {
      Element[EventHandlerName] = function()
      {
        EventHandler();
        Function();
      };
    } else {
      Element[EventHandlerName] = Function;
    }
  }
  
  
  var g_ActiveCharacter = 0;
  
  function FocusCharacter(a_CharacterNumber, a_CharacterName, a_NumberOfCharacters)
  {
    // it it was clicked on the same row there is nothing to do
    if (a_CharacterNumber == g_ActiveCharacter) {
      return;
    } else {
      g_ActiveCharacter = a_CharacterNumber;
    }
    // reset other row lines
    for (var i = 0; i <= a_NumberOfCharacters; i++) {
      if (i != a_CharacterNumber && $('#CharacterRow_' + i) != null) {
        $('#CharacterRow_' + i).css('fontWeight', 'normal');
        $('#CharacterRow_' + i).css('cursor', 'pointer');
        $('#CharacterOptionsOf_' + i).css('display', 'none');
        $('#CharacterNameOf_' + i).css('fontSize', '10pt');
      }
    }
    // set the new selected line
    $('#CharacterRow_' + a_CharacterNumber).css('fontWeight', 'bold');
    $('#CharacterRow_' + a_CharacterNumber).css('cursor', 'auto');
    $('#CharacterOptionsOf_' + a_CharacterNumber).css('display', 'block');
    $('#CharacterNameOf_' + a_CharacterNumber).css('fontSize', '13pt');
    // set form fields
    $('[name="selectedcharacter"]').each(function() {
      $(this).attr("value", $('#CharacterNameOf_' + a_CharacterNumber).innerHTML);
    });
  }
  
  function InRowWithOverEffect(a_RowID, a_Color)
  {
    document.getElementById(a_RowID).style.backgroundColor = a_Color;
  }
  
  function OutRowWithOverEffect(a_RowID, a_Color)
  {
    document.getElementById(a_RowID).style.backgroundColor = a_Color;
  }
  
  function InMiniButton(a_Button, a_IsPreviewString)
  {
    a_Button.src = JS_DIR_IMAGES + "account/" + a_IsPreviewString + "play-button-over.gif";
  }
  
  function OutMiniButton(a_Button, a_IsPreview)
  {
    a_Button.src = JS_DIR_IMAGES + "account/" + a_IsPreview + "play-button.gif";
  }
  
  function ShowHelperDiv(a_ID)
  {
    document.getElementById(a_ID).style.visibility = 'visible';
    document.getElementById(a_ID).style.display = 'block';
  }
  
  function HideHelperDiv(a_ID)
  {
    document.getElementById(a_ID).style.visibility = 'hidden';
    document.getElementById(a_ID).style.display = 'none';
  }
  
  var g_EntityMap = {
    "&" : "&amp;",
    "<" : "&lt;",
    ">" : "&gt;",
    '"' : '&quot;',
    "'" : '&#39;',
    "/" : '&#x2F;'
  };
  
  function escapeHtml(a_String)
  {
    return String(a_String).replace(/[&<>"'\/]/g, function(s)
    {
      return g_EntityMap[s];
    });
  }
  
  // build the helper div to display on mouse over
  function BuildHelperDiv(a_DivID, a_IndicatorDivContent, a_Title, a_Text)
  {
    var l_Qutput = '';
    l_Qutput += '<span class="HelperDivIndicator" onMouseOver="ActivateHelperDiv($(this), \'' + a_Title + '\', \'' + escapeHtml(a_Text) + '\');" onMouseOut="$(\'#HelperDivContainer\').hide();" >' + a_IndicatorDivContent + '</span>';
    return l_Qutput;
  }
  
  // build the helper div to display on mouse over
  function BuildHelperDivLink(a_DivID, a_IndicatorDivContent, a_Title, a_Text, a_SubTopic)
  {
    var l_Qutput = '';
    l_Qutput += '<span class="HelperDivIndicator" onMouseOver="ActivateHelperDiv($(this), \'' + a_Title + '\', \'' + a_Text + '\', \'' + a_DivID + '\');" onMouseOut="$(\'#HelperDivContainer\').hide();" >' + a_IndicatorDivContent + '</span>';
    return l_Qutput;
  }
  
  // displays a helper div at the current mause position
  function ActivateHelperDiv(a_Object, a_Title, a_Text, a_HelperDivPositionID)
  {
    // initialize variables
    var l_Left = 0;
    var l_Top = 0;
    var l_WindowHeight = $(window).height();
    var l_PageHeight = $(document).height();
    var l_ScrollTop = $(document).scrollTop();
    // set the new content of the tool tip
    $('#HelperDivHeadline').html(a_Title);
    $('#HelperDivText').html(a_Text);
    // check additional parameter and set the position
    if (a_HelperDivPositionID.length > 0) {
      l_Left = $('#' + a_HelperDivPositionID).offset().left;
      l_Top = $('#' + a_HelperDivPositionID).offset().top;
    } else {
      l_Left = (a_Object.offset().left + a_Object.width());
      l_Top = a_Object.offset().top;
    }
    // get new tool tip height
    var l_ToolTipHeight = $('#HelperDivContainer').outerHeight();
    // check if the tool tip fits in the browser window
    if ((l_Top - l_ScrollTop + l_ToolTipHeight) > l_WindowHeight) {
      var l_TopBefore = l_Top;
      l_Top = (l_ScrollTop + l_WindowHeight - l_ToolTipHeight);
      if (l_Top < l_ScrollTop) {
        l_Top = l_ScrollTop;
      }
      $('.HelperDivArrow').css('top', (l_TopBefore - l_Top));
    } else {
      $('.HelperDivArrow').css('top', -1);
    }
    // set position and display the tool tip
    $('#HelperDivContainer').css('top', l_Top);
    $('#HelperDivContainer').css('left', l_Left);
    $('#HelperDivContainer').show();
  }
  
  // toggle collapsable tables
  function CollapseTable(a_ID)
  {
    $('#' + a_ID).slideToggle('slow');
    if ($('#Indicator_' + a_ID).attr('class') == 'CircleSymbolPlus') {
      $('#Indicator_' + a_ID).css('background-image', 'url(' + JS_DIR_IMAGES + 'global/content/circle-symbol-minus.gif)');
      $('#Indicator_' + a_ID).attr('class', 'CircleSymbolMinus');
    } else {
      $('#Indicator_' + a_ID).css('background-image', 'url(' + JS_DIR_IMAGES + 'global/content/circle-symbol-plus.gif)');
      $('#Indicator_' + a_ID).attr('class', 'CircleSymbolPlus');
    }
  }
  
  // toggle guild application text
  function ToggleApplicationText(a_ID) {
    $("#applicationtext-" + a_ID).toggle("fast");
    if ($('#applicationcircle-' + a_ID).attr('class') == 'CircleSymbolPlus') {
      $('#applicationcircle-' + a_ID).css('background-image', 'url(' + JS_DIR_IMAGES + 'global/content/circle-symbol-minus.gif)');
      $('#applicationcircle-' + a_ID).attr('class', 'CircleSymbolMinus');
    } else {
      $('#applicationcircle-' + a_ID).css('background-image', 'url(' + JS_DIR_IMAGES + 'global/content/circle-symbol-plus.gif)');
      $('#applicationcircle-' + a_ID).attr('class', 'CircleSymbolPlus');
    }
  }
  
  function SetMinimumLayout() {
    $("#ArtworkHelper1").hide();
    $("#MenuColumn").hide();
    $("#ThemeboxesColumn").hide();
    $("#ContentColumn").css("margin", "0px");
    $("#MainHelper2").css("margin-left", "0px");
    $("#MainHelper2").css("padding-top", "0px");
    $("#MainHelper2").css("height", "0px");
    $("#DeactivationContainer").css("height", "auto");
    $("#MainHelper1").css("min-width", "auto");
    $("#Bodycontainer").css("min-width", "auto");
    $("#Bodycontainer").css("max-width", "auto");
    $("#Bodycontainer").css("height", "0px");
    $("#Footer").hide();
    $("#webshop").css("width", "560px");
    $("#webshop").css("margin", "17px");
    $("body").css("background-color", "#fff2db");
  }
  
  /* ---------------------- */
  /* anniversary count down */
  /* ---------------------- */
  
  //preload images
  var g_ImageObject = new Object();
  g_ImageObject[0] = new Image();
  g_ImageObject[1] = new Image();
  g_ImageObject[2] = new Image();
  g_ImageObject[3] = new Image();
  g_ImageObject[4] = new Image();
  g_ImageObject[5] = new Image();
  g_ImageObject[6] = new Image();
  g_ImageObject[7] = new Image();
  g_ImageObject[8] = new Image();
  g_ImageObject[9] = new Image();
  g_ImageObject[0].src = JS_DIR_IMAGES + 'global/themeboxes/anniversary/number-0.png';
  g_ImageObject[1].src = JS_DIR_IMAGES + 'global/themeboxes/anniversary/number-1.png';
  g_ImageObject[2].src = JS_DIR_IMAGES + 'global/themeboxes/anniversary/number-2.png';
  g_ImageObject[3].src = JS_DIR_IMAGES + 'global/themeboxes/anniversary/number-3.png';
  g_ImageObject[4].src = JS_DIR_IMAGES + 'global/themeboxes/anniversary/number-4.png';
  g_ImageObject[5].src = JS_DIR_IMAGES + 'global/themeboxes/anniversary/number-5.png';
  g_ImageObject[6].src = JS_DIR_IMAGES + 'global/themeboxes/anniversary/number-6.png';
  g_ImageObject[7].src = JS_DIR_IMAGES + 'global/themeboxes/anniversary/number-7.png';
  g_ImageObject[8].src = JS_DIR_IMAGES + 'global/themeboxes/anniversary/number-8.png';
  g_ImageObject[9].src = JS_DIR_IMAGES + 'global/themeboxes/anniversary/number-9.png';
  
  // calculate remaining time for the anniversary countdown
  function getTimeRemaining(a_EndTime, a_InitOrRefresh) {
    var l_InitOrRefresh = a_InitOrRefresh;
    if (l_InitOrRefresh > 0) {
      l_InitOrRefresh = (l_InitOrRefresh);
    } else {
      l_InitOrRefresh =  Math.floor(Date.parse(new Date()) / 1000);
    }
    var l_TimeStamp =  (Math.floor(Date.parse(a_EndTime) / 1000) - l_InitOrRefresh);
    var l_Days = Math.floor(l_TimeStamp / (60 * 60 * 24));
    var l_Hours = Math.floor((l_TimeStamp / (60 * 60)) % 24);
    var l_Minutes = Math.floor((l_TimeStamp / 60) % 60);
    var l_Seconds = Math.floor((l_TimeStamp / 1) % 60);
    return {
      'total': l_TimeStamp,
      'days': l_Days,
      'hours': l_Hours,
      'minutes': l_Minutes,
      'seconds': l_Seconds
    };
  }
  
  //initialize the clock for the anniversary countdown
  function InitializeFancyAnniversaryCountDown(a_EndTime, a_InitTime)
  {
    var l_DaysFirst = $('.FancyAnniversaryCountDown .DaysFirst');
    var l_DaysLast = $('.FancyAnniversaryCountDown .DaysLast');
    var l_HoursFirst = $('.FancyAnniversaryCountDown .HoursFirst');
    var l_HoursLast = $('.FancyAnniversaryCountDown .HoursLast');
    var l_MinutesFirst = $('.FancyAnniversaryCountDown .MinutesFirst');
    var l_MinutesLast = $('.FancyAnniversaryCountDown .MinutesLast');
    var l_SecondsFirst = $('.FancyAnniversaryCountDown .SecondsFirst');
    var l_SecondsLast = $('.FancyAnniversaryCountDown .SecondsLast');
  
    function UpdateFancyClock(a_InitOrRefresh) {
      var l_TimeRemaining = getTimeRemaining(a_EndTime, a_InitOrRefresh);
      l_DaysFirst.css('background-image', 'url(' + g_ImageObject[('0' + l_TimeRemaining.days).slice(-2, -1)].src + ')');
      l_DaysLast.css('background-image', 'url(' + g_ImageObject[('0' + l_TimeRemaining.days).slice(-1)].src + ')');
      l_HoursFirst.css('background-image', 'url(' + g_ImageObject[('0' + l_TimeRemaining.hours).slice(-2, -1)].src + ')');
      l_HoursLast.css('background-image', 'url(' + g_ImageObject[('0' + l_TimeRemaining.hours).slice(-1)].src + ')');
      l_MinutesFirst.css('background-image', 'url(' + g_ImageObject[('0' + l_TimeRemaining.minutes).slice(-2, -1)].src + ')');
      l_MinutesLast.css('background-image', 'url(' + g_ImageObject[('0' + l_TimeRemaining.minutes).slice(-1)].src + ')');
      l_SecondsFirst.css('background-image', 'url(' + g_ImageObject[('0' + l_TimeRemaining.seconds).slice(-2, -1)].src + ')');
      l_SecondsLast.css('background-image', 'url(' + g_ImageObject[('0' + l_TimeRemaining.seconds).slice(-1)].src + ')');
      if (l_TimeRemaining.total <= 0) {
        clearInterval(l_IntervalTime);
      }
    }
  
    UpdateFancyClock(a_InitTime);
    var l_IntervalTime = setInterval(function() { UpdateFancyClock(0); }, 1000);
  }
  
  
  function RefreshTournamentLeaderboardPage(a_TournamentWorld, a_TournamentCycle, a_SelectedLeaderboardPage, a_CycleAvailableForWorld)
  {
    if (document.cookie.split(';').filter(function(item) {
      return item.indexOf('tournamentleaderboardcheckbox=1') >= 0
    }).length) {
     jQuery.ajax({
        type: "POST",
        url: (JS_DIR_COMMUNITY + 'buildtournamentleaderboardpage.php'),
        data: {'tournamentworld' :  a_TournamentWorld, 'tournamentcycle' : a_TournamentCycle, 'selectedleaderboardpage' : a_SelectedLeaderboardPage, 'cycleavailableforworld' : a_CycleAvailableForWorld},
  
        success: function (Output) {
          var LeaderboardPageDiv = $("#tournamentleaderboardpage");
          LeaderboardPageDiv.empty(); // clear the content of the table
          LeaderboardPageDiv.replaceWith(Output.table); // replace with the new table
  
          var PaginationDiv = $("#tournamentleaderboardpagination");
          PaginationDiv.empty();
          PaginationDiv.append(Output.pagination);
        }
      });
    }
  }
  
  
  function CreateAndUpdateCookieForTournamentCheckBox()
  {
    var CookieValue = 1;
    if (document.cookie.split(';').filter(function(item) {
      return item.indexOf('tournamentleaderboardcheckbox=1') >= 0
    }).length) {
      CookieValue = 0;
    }
    var date = new Date();
    date.setTime(date.getTime() + (24*60*60*1000));
    var expires = "; expires=" + date.toUTCString();
    document.cookie = "tournamentleaderboardcheckbox" + "=" + (CookieValue) + expires + "; path=/";
  }
  
  
  /**
  * Postpone the manual payment note for character trades for 24 hours.
  * @return void
  */
  function PostponeCharacterTradeManualPaymentNote()
  {
    var date = new Date();
    date.setTime(date.getTime() + (24 * 60 * 60 * 1000));
    document.cookie = "postponecharactertrademanualpaymentnote" + "=1" + "; expires=" + date.toUTCString() + "; path=/";
  }
  
  
  /**
  * Show or hide entires in long tables.
  * @param a_ID string  The ID of the table that has to be collapsed or expand.
  * @return void
  */
  function ShowOrHide(a_ID)
  {
    if ($('#' + a_ID).hasClass('CollapsedBlock') ) {
      $('#' + a_ID).removeClass('CollapsedBlock');
      $('#' + a_ID + ' .ShowMoreOrLess a').text('show less');
      $('#' + a_ID + ' .IndicateMoreEntries').css('display', 'none');
    } else {
      $('#' + a_ID).addClass('CollapsedBlock');
      $('#' + a_ID + ' .ShowMoreOrLess a').text('show all');
      $('#' + a_ID + ' .IndicateMoreEntries').css('display', 'table-row');
    }
  }
  
  
  /**
  * Smoothly scroll to an anchor position.
  * @param a_AnchorName string  The name of the anchor to scroll to.
  * @return void
  */
  function ScrollToAnchor(a_AnchorName)
  {
    var l_Ancor = $('a[name="' + a_AnchorName + '"]');
    $('html, body').animate({
      scrollTop: (l_Ancor.offset().top - 100)
    }, 'slow');
  }
  
  
  /**
  * Start a character auction count down.
  * @param a_Duration integer   The duration of the timer.
  * @param a_ID string          The CSS ID of the target.
  * @param a_TimeString string  The time string to display after the count down.
  * @return void
  */
  function StartCharacterAuctionCountDown(a_Duration, a_ID, a_TimeString)
  {
    var l_Hours = 0;
    var l_Minutes = 0;
    var l_Seconds = 0;
    // start the timer
    var l_IntervalID = setInterval(function () {
      if (a_Duration < (86400)) {
        var l_TempDuration = a_Duration;
        // calculate (and subtract) whole days
        var l_Days = Math.floor(l_TempDuration / 86400);
        l_TempDuration = (l_TempDuration - (l_Days * 86400));
        // calculate (and subtract) whole hours
        var l_Hours = Math.floor(l_TempDuration / 3600);
        l_TempDuration = (l_TempDuration - (l_Hours * 3600));
        // calculate (and subtract) whole minutes
        var l_Minutes = Math.floor(l_TempDuration / 60);
        l_TempDuration = (l_TempDuration - (l_Minutes * 60));
        // calculate (and subtract) whole seconds
        l_Seconds = Math.floor(l_TempDuration % 60);
        // format the numbers
        l_Hours = l_Hours < 10 ? "0" + l_Hours : l_Hours;
        l_Minutes = l_Minutes < 10 ? "0" + l_Minutes : l_Minutes;
        l_Seconds = l_Seconds < 10 ? "0" + l_Seconds : l_Seconds;
        // dislay the count down
        $l_TextString = 'in ';
        if (l_Days > 0) {
          $l_TextString += l_Days + 'd ';
        }
        if (l_Days > 0 || l_Hours > 0) {
          $l_TextString += l_Hours + 'h '
        }
        if (l_Days > 0 || l_Hours > 0 || l_Minutes > 0) {
          $l_TextString += l_Minutes + 'm '
        }
        $l_TextString += l_Seconds + 's';
        $l_TextString += ', ' + a_TimeString;
        a_ID.text($l_TextString);
      }
      // decrement the timer
      --a_Duration;
      // stop the timer and display text
      if (a_Duration < 0) {
        a_ID.text('Auction Ended!');
        clearInterval(l_IntervalID);
      }
    }, 1000);
  }
  
  
  /**
  * Initialise all character auction count downs on the page.
  * @return void
  */
  function InitAllCharacterAuctionCountDowns()
  {
    var l_Auctions = $('.AuctionTimer');
    $('.AuctionTimer').each(function(l_Index, l_Element) {
      var l_Target = $('#' + l_Element.id);
      var l_AuctionEnd = $('#' + l_Element.id).attr('data-timestamp');
      var l_TimeSting = $('#' + l_Element.id).attr('date-timestring');
      var l_CurrentTimestampUTC = new Date().getTime();
      var l_Duration = (l_AuctionEnd - (l_CurrentTimestampUTC / 1000));
      if (l_Duration >  0) {
        StartCharacterAuctionCountDown(l_Duration, l_Target, l_TimeSting);
      }
    });
  }
  
  
  /**
  * Add thousands separator to input field.
  * @param a_InputField The input field.
  * @return void
  */
  function AddThousandsSeparator(a_InputField)
  {
    var l_FormatedValue = a_InputField.value;
    var l_OriginalValue = a_InputField.value;
    var l_CurrentValue = (a_InputField.value).replace(/,/g, '');
    if (l_CurrentValue.length == 0) {
      a_InputField.value = '';
    } else if (/^\d+$/.test(l_CurrentValue)) {
      l_CurrentValue = parseInt(l_CurrentValue);
      a_InputField.data = l_CurrentValue;
      l_FormatedValue = (l_CurrentValue).toLocaleString('en-US');
      a_InputField.value = l_FormatedValue;
    } else {
      if (a_InputField.data != undefined) {
        a_InputField.value = (a_InputField.data).toLocaleString('en-US');
      } else {
        a_InputField.value = '';
      }
    }
    return;
  }
  
  
  /**
  * Add thousands separator to input field.
  * @param a_InputField The input field.
  * @return void
  */
  function InitAllCharacterAuctionBidListener()
  {
    $('#currentcharactertrades input.MyMaxBidInput').keyup(function(){
      AddThousandsSeparator(this);
    });
  }
  
  
  /**
  * Toggle visibility of deleted posts.
  * @param a_PostID string  The id of the forum post.
  * @return void
  */
  function ToggleDeletedPostByID(a_PostID)
  {
    $('#Post_' + a_PostID + ' .PostBody').toggle();
    var l_ImageURL = JS_DIR_IMAGES + 'global/general/plus.gif';
    if ($('#Post_' + a_PostID + ' .PostBody').is(':visible')) {
      l_ImageURL = JS_DIR_IMAGES + 'global/general/minus.gif';
    }
    $('#Post_' + a_PostID + ' .ToggleDeletedPostImage').css('background-image', 'url(' + l_ImageURL + ')');
    // return from function
    return;
  }
  
  
  /**
  * Toggle visibility of deleted posts.
  * @return void
  */
  function ToggleDeletedPosts()
  {
    var l_CookieName = 'HideDeletedPosts';
    var l_CurrentValue = GetCookieValue(l_CookieName);
    var $l_NewValue = true;
    var l_ImageURL = JS_DIR_IMAGES + 'global/general/plus.gif';
    if (l_CurrentValue == null || l_CurrentValue == false || l_CurrentValue == 'false') {
      // deleted posts are currently shown but have to be hidden now
      $('.DeletedPost').hide();
      $l_NewValue = true;
      // change the label
      $('.HideDeletedPostsButton .BigButtonText').text('Show Deleted Posts');
    } else {
      // deleted posts are currently hidden but have to be shown now
      $('.DeletedPost').show();
      $l_NewValue = false;
      // change the label
      $('.HideDeletedPostsButton .BigButtonText').text('Hide Deleted Posts');
      // change indicating image
      l_ImageURL = JS_DIR_IMAGES + 'global/general/minus.gif';
    }
    // set the cookie
    var l_ExpireDate = new Date;
    l_ExpireDate.setFullYear(l_ExpireDate.getFullYear() + 10);
    SetCookie(l_CookieName, $l_NewValue, l_ExpireDate.toUTCString());
    // change images
    $('.ToggleDeletedPostImage').css('background-image', 'url(' + l_ImageURL + ')');
    // return from function
    return;
  }
  
  /**
  * Signals with red if the user is about to fill in unallowed data in the registration form.
  * @param $a_Element HTML-name of the form element.
  * @return void
  */
  function CheckInputRegistration($a_Element)
  {
    l_Pattern = /^[ 0-9a-zA-Z-]+$/;
  
    if ($a_Element.name == 'housenr') {
      l_Pattern = /^[ 0-9a-zA-Z-\/]+$/;
    } else if ($a_Element.name == 'zip') {
      l_Pattern = /^[ 0-9a-zA-Z]+$/;
    }
  
    if ($a_Element.value.match(l_Pattern) != null || $a_Element.value == '') {
      $a_Element.style.backgroundColor = '';
    } else {
      $a_Element.style.backgroundColor = '#FF0000';
    }
    return;
  }