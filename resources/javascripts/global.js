var g_CapsLockIsEnabled=null;if(typeof document.msCapsLockWarningOff!=='undefined'){document.msCapsLockWarningOff=true;}
function AddCapsLockEventListeners(){$('input[type=password]').keyup(function(e){ShowOrHideCapsLockWarning(e);});$('input[type=password]').focus(function(e){ShowOrHideCapsLockWarning(e);});$('input[type=password]').blur(function(e){HideCapsLockWarning();});$(document).keydown(function(e){CheckForCapsLockItself(e);})
$(document).keypress(function(e){CheckPressedKey(e);})}
function CheckForCapsLockItself(e)
{e=e||event;if(e.keyCode==20&&g_CapsLockIsEnabled!==null){g_CapsLockIsEnabled=!g_CapsLockIsEnabled;}}
function CheckPressedKey(e)
{e=e||event;var chr=GetChar(e);if(!chr){return;}
if(chr.toLowerCase()==chr.toUpperCase()){return;}
g_CapsLockIsEnabled=(chr.toLowerCase()==chr&&e.shiftKey)||(chr.toUpperCase()==chr&&!e.shiftKey);}
function GetChar(e)
{if(e.which==null){return String.fromCharCode(e.keyCode);}
if(e.which!=0&&e.charCode!=0){return String.fromCharCode(e.which);}
return null;}
function ShowOrHideCapsLockWarning()
{if(g_CapsLockIsEnabled){var l_PasswordFields=$('input[type=password]');var l_Top=($(':focus').offset().top+18);var l_Left=($(':focus').offset().left+18);$('#CapsLockWarning').css({top:l_Top,left:l_Left});$('#CapsLockWarning').show();}else{$('#CapsLockWarning').hide();}}
function HideCapsLockWarning()
{$('#CapsLockWarning').hide();}

$(document).ready(function(){
    CheckForMobileAdjustments();
    $(window).resize(function(){
        CheckForMobileAdjustments();
    });
    $('#MobileShortMenuIcon').click(function(){
        $('#MobileMenuIcon').prop('checked',false);
    });
    $('#MobileMenuIcon').click(function(){
        $('#MobileShortMenuIcon').prop('checked',false);
    });
    $('#MobileShortMenuIcon, #MobileMenuIcon').change(function(){
        CheckForMenuPosition();
    });
});
function CheckForMenuPosition(){
    if($('#MobileMenuIcon').is(':checked')){
        $('#MobileMenu').css('height','100%');
        $('#MobileMenu').css('overflow-y','scroll');
    }else{
        $('#MobileMenu').css('height','70px');
        $('#MobileMenu').css('overflow-y','unset');
    }
}
function CheckForMobileAdjustments(){
    if(window.matchMedia('(max-width: 768px)').matches){
        if($('#webshop').length>0&&$('#HelperDivContainer').length>0){
            $('#HelperDivContainer').remove();
        }
var AvailableScreenWidth=window.screen.availWidth;
if(window.matchMedia("(orientation: landscape)").matches){
    if(window.screen.availHeight>AvailableScreenWidth){
        AvailableScreenWidth=window.screen.availHeight;
    }
}
var ImageSizeBuffer=20;
var TableSizeBuffer=30;
var TableEventCalenderBuffer=40;
var ObserverInputBuffer=70;
var ObserverInnerTableBuffer=ReportTableBuffer=50;
var ReportTableBufferForum=57;
var ForumImageBuffer=62;
var AuctionFilterTableBuffer=67;
    $('.BoxContent img').each(function(){
        $(this).css('max-width',((AvailableScreenWidth)-ImageSizeBuffer));
    });
    $('.TableContainer .InnerTableContainer').each(function(){
        $(this).css('max-width',((AvailableScreenWidth)-TableSizeBuffer));
    });
    $('.TableContainer .TableScrollbarWrapper').each(function(){
        $(this).css('width',((AvailableScreenWidth)-TableSizeBuffer));
    });
    $(' #EventSchedule .TableContainer .InnerTableContainer').each(function(){
        $(this).css('max-width',((AvailableScreenWidth)-TableEventCalenderBuffer));
    });
    $('.ThreadReviewPosting img, .PostText img').each(function(){
        $(this).css('max-width',((AvailableScreenWidth)-ForumImageBuffer));
    });
    $('#ConnectTibiaObserver .TableContentContainer div').each(function(){
        $(this).css('max-width',((AvailableScreenWidth)-ObserverInnerTableBuffer));
    });
    $('#ConnectTibiaObserver #TibiaObserverTokenInput').each(function(){
        $(this).css('max-width',((AvailableScreenWidth)-ObserverInputBuffer));
    });
    $('#reason_description, #translation_input, #comment_input, #reasonid_select').each(function(){
        $(this).css('width',((AvailableScreenWidth)-ReportTableBuffer));
    });
    $('.ForumReport').each(function(){
        $(this).css('width',((AvailableScreenWidth)-ReportTableBufferForum));
    });
    $('.AuctionInputSearch, .AuctionFilterCategory').each(function(){
        $(this).css('width',((AvailableScreenWidth)-AuctionFilterTableBuffer));
        if($(this).hasClass('AuctionFilterCategory')){
            $(this).css('width',parseInt($(this).css('width'))+8);
        }
    });
    $('.InInputResetButton').each(function(){
        $(this).css('left',parseInt($('.AuctionInputSearch').css('width'))-parseInt($(this).css('width'))*0.75);
    });
    $('.TableContainer').each(function(){
        var TableScrollbarWrapper=$(this).find('.TableScrollbarWrapper');
        var InnerTableContainer=$(this).find('.InnerTableContainer');
        var ScrollWidth=$(this).find('.InnerTableContainer')[0].scrollWidth;
        if(ScrollWidth>((AvailableScreenWidth)-TableSizeBuffer)){
            $(this).find('.TableScrollbarContainer').width(ScrollWidth);
            InnerTableContainer.css('margin-bottom',5);
            TableScrollbarWrapper.css('display','block');
            TableScrollbarWrapper.scroll(function(Event){
                InnerTableContainer.scrollLeft(Event.target.scrollLeft);
            });
            InnerTableContainer.scroll(function(Event){
                TableScrollbarWrapper.scrollLeft(Event.target.scrollLeft);
            });
        }
    });
    var NewsImageBuffer=20;
    var NewsTableBuffer=20;
    $('.Content .NewsTable img').each(function(){
        $(this).removeAttr('width');$(this).removeAttr('height');
        $(this).removeAttr('vspace');$(this).removeAttr('hspace');
    });
    $('.Content .NewsTable img').each(function(){
        $(this).css('max-width',((AvailableScreenWidth)-NewsImageBuffer));
    });
    $('.Content .NewsTable figure').each(function(){
        $(this).css('margin-left',0);
    });
    $('.Content .NewsTable figure').each(function(){
        $(this).css('margin-right',0);
    });
    $('.Content .NewsTable .NewsTableContainer table').each(function(){
        $(this).css('display','block');
    });
    $('.Content .NewsTable .NewsTableContainer table').each(function(){
        $(this).css('width','unset');
    });
    $('.Content .NewsTable .NewsTableContainer table').each(function(){
        $(this).css('height','unset');
    });
    $('.Content .NewsTable .NewsTableContainer table').each(function(){
        $(this).css('overflow-x','scroll');
    });
    $('.Content .NewsTable .NewsTableContainer table').each(function(){
        $(this).css('max-width',(AvailableScreenWidth)-NewsTableBuffer);
    });
}else{
    $('.TableContainer .InnerTableContainer').each(function(){
        $(this).css('max-width','unset');
    });
    $('.TableContainer .TableScrollbarWrapper').each(function(){
        $(this).css('width','unset');
    });
}
return;
}
$(document).ready(function(){g_PasswordToolTipIsActive=0;if($('.PWStrengthContainer').length>0){g_PasswordToolTipIsActive=1;}
if($('#password1').length>0){$("#password1").change(function(){CheckPasswordStrength($('#password1').val());});$("#password1").keyup(function(){CheckPasswordStrength($('#password1').val());});if($('#password1').val().length>0){CheckPasswordStrength($('#password1').val());}
$(".Themeboxes").css({zIndex:10})}});function CheckPasswordStrength(a_Password)
{if(a_Password.length>0){$('.PWStrengthToolTip').show();$('#password_errormessage .CanBeHiddenWhenToolTipIsOn').hide();$('.BoxInputText #password_errormessage').hide();}
l_Feedback='very weak';l_CSSClass='PWStrengthIndicator';l_Warning='';l_Suggestions='';l_Result={'score':0,'feedback':{'warning':'','suggestions':Array(0)}};l_RulesFullfilled=ValidatePassword(a_Password);if(l_RulesFullfilled==true){l_Result=zxcvbn(a_Password);}
if(l_Result.score>3){l_Feedback='strong';l_CSSClass+=' PWStrengthLevel4';}else if(l_Result.score==3){l_Feedback='medium';l_CSSClass+=' PWStrengthLevel3';}else if(l_Result.score==2){l_Feedback='weak';l_CSSClass+=' PWStrengthLevel2';}else if(l_Result.score==1){l_Feedback='very weak';l_CSSClass+=' PWStrengthLevel1';}else{l_Feedback='very weak';l_CSSClass+=' PWStrengthLevel0';}
$('.PWStrengthIndicator').text(l_Feedback);$('.PWStrengthIndicator').attr('class',l_CSSClass);$('.PWStrengthSuggestions').text(l_Suggestions);$('.PWStrengthWarning').text(l_Warning);if(l_Result.score<=2){if(l_Result.feedback.warning.length>0){l_Warning+=l_Result.feedback.warning;$('.PWStrengthWarning').append('<div class="PWStrengthToolTipHeadline" >Warning</div>');$('.PWStrengthWarning').append('<div>'+l_Warning+'</div>');}
if(l_Result.feedback.suggestions.length>0){$('.PWStrengthSuggestions').append('<div class="PWStrengthToolTipHeadline" >Tip</div>');for(var i=0;i<l_Result.feedback.suggestions.length;i++){$('.PWStrengthSuggestions').append('<div>'+l_Result.feedback.suggestions[i]+'</div>');}}}
if(l_RulesFullfilled==true){$('.PWStrengthToolTip').hide();}
return;}
function ValidatePassword(a_Password)
{var l_ReturnValue=true;var PWRules=[[62,((a_Password.length>=30||a_Password.length<10)?false:true)],[63,((a_Password.match(/[^!-~]+/)!==null)?false:true)],[65,((a_Password.match(/^[A-Za-z]*$/)!==null)?false:true)],[84,((a_Password.match(/[a-z]/)===null)?false:true)],[85,((a_Password.match(/[A-Z]/)===null)?false:true)],[86,((a_Password.match(/[0-9]/)===null)?false:true)]];for(var i=0;i<PWRules.length;i++){if(PWRules[i][1]==true){$('#PWRule'+PWRules[i][0]).removeClass('InputIndicatorNotOK');$('#PWRule'+PWRules[i][0]).addClass('InputIndicatorOK');}else{l_ReturnValue=false;$('#PWRule'+PWRules[i][0]).addClass('InputIndicatorNotOK');$('#PWRule'+PWRules[i][0]).removeClass('InputIndicatorOK');}}
return l_ReturnValue;}
function SetCookie(a_Name,a_Value,a_ExpireDateUTCString)
{var l_CookieExpireString='';if(a_ExpireDateUTCString!=false){l_CookieExpireString+=' expires='+a_ExpireDateUTCString+';';}
document.cookie=a_Name+'='+encodeURIComponent(a_Value)+'; domain='+JS_COOKIE_DOMAIN+';'+l_CookieExpireString+' path=/;';return;}
function GetCookieValue(a_Name)
{var l_RequestedCookieValue=null;var l_ConsentCookieEQ=a_Name+'=';var l_AllCookies=document.cookie.split(';');for(var i=0;i<l_AllCookies.length;i++){var l_SingleCookie=l_AllCookies[i];while(l_SingleCookie.charAt(0)==' '){l_SingleCookie=l_SingleCookie.substring(1,l_SingleCookie.length);}
if(l_SingleCookie.indexOf(l_ConsentCookieEQ)==0){l_RequestedCookieValue=decodeURIComponent(l_SingleCookie.substring(l_ConsentCookieEQ.length,l_SingleCookie.length));break;}}
return l_RequestedCookieValue;}
function HideCookieDialog()
{$('#cookiedialogbox').hide();}
function ShowCookieDialog()
{$('#cookiedialogbox').show();}
function HideCookieDetails()
{$('#cookiedetailsbox').hide();}
function ShowCookieDetails()
{$('#cookiedetailsbox').show();}
function SetConsentCookie(consent,acceptall)
{var cc_advertising=false;var cc_social=false;if(consent==true){if(acceptall==true){cc_advertising=true;cc_social=true;}else{cc_advertising=$("#cc_advertising").is(':checked');cc_social=$('#cc_social').is(':checked');}}
var settings={consent:consent,advertising:cc_advertising,socialmedia:cc_social};SetCookie('CookieConsentPreferences',JSON.stringify(settings),GetConsentCookieExpireDateUTCString());location.reload();}
function ProlongConsentCookie()
{var l_ConsentCookie=GetCookieValue('CookieConsentPreferences');if(l_ConsentCookie!=null){SetCookie('CookieConsentPreferences',l_ConsentCookie,GetConsentCookieExpireDateUTCString());$('#cookiedialogbox').hide();}}
function GetConsentCookieExpireDateUTCString()
{var l_ExpireDate=new Date;l_ExpireDate.setFullYear(l_ExpireDate.getFullYear()+1);return l_ExpireDate.toUTCString();}
$(document).ready(function(){var l_CurrentDomain=window.location.host.toString();var l_CookieDomain=JS_COOKIE_DOMAIN;if((l_CookieDomain.includes(l_CurrentDomain)==true)||(l_CurrentDomain.includes(l_CookieDomain)==true)){ProlongConsentCookie();}});function FansiteFilterAction(a_Element)
{if(a_Element=='Language_All'||a_Element=='SocialMedia_All'||a_Element=='Content_All'){if($('#'+a_Element).hasClass('FilterIsActive')){return;}}
if(a_Element=='Language_All'){$('.FilterElementLanguage').addClass('FilterIsActive');}else if(a_Element=='SocialMedia_All'){$('.FilterElementSocialMedia').addClass('FilterIsActive');}else if(a_Element=='Content_All'){$('.FilterElementContent').addClass('FilterIsActive');}
if($('#'+a_Element).hasClass('FilterIsActive')){$('#'+a_Element).removeClass('FilterIsActive');}else{$('#'+a_Element).addClass('FilterIsActive');}
if($('#'+a_Element).hasClass('FilterElementLanguage')){$('.FilterLanguageAll').removeClass('FilterIsActive');}else if($('#'+a_Element).hasClass('FilterElementSocialMedia')){$('.FilterSocialMediaAll').removeClass('FilterIsActive');}else if($('#'+a_Element).hasClass('FilterElementContent')){$('.FilterContentAll').removeClass('FilterIsActive');}
if($('.FilterElementLanguage').hasClass('FilterIsActive')==false){$('#Language_All').addClass('FilterIsActive');}
if($('.FilterElementSocialMedia').hasClass('FilterIsActive')==false){$('#SocialMedia_All').addClass('FilterIsActive');}
if($('.FilterElementContent').hasClass('FilterIsActive')==false){$('#Content_All').addClass('FilterIsActive');}
var l_Filter='';l_Filter='.FilterElementLanguage.FilterIsActive';if($('#Language_All').hasClass('FilterIsActive')){l_Filter='.FilterElementLanguage';}
var l_ActiveLanguageList=$(l_Filter).not('.FilterAll').map(function(){return '.Filter'+$(this).attr('id');}).get().join(', ');var l_LanguageRows=$(l_ActiveLanguageList).map(function(){return '#'+$(this).attr('id');}).get();l_Filter='.FilterElementSocialMedia.FilterIsActive';if($('#SocialMedia_All').hasClass('FilterIsActive')){l_Filter='.FilterElementLanguage';}
var l_ActiveSocialMediaList=$(l_Filter).not('.FilterAll').map(function(){return '.Filter'+$(this).attr('id');}).get().join(', ');var l_SocialMediaRows=$(l_ActiveSocialMediaList).map(function(){return '#'+$(this).attr('id');}).get();l_Filter='.FilterElementContent.FilterIsActive';if($('#Content_All').hasClass('FilterIsActive')){l_Filter='.FilterElementLanguage';}
var l_ActiveContentList=$(l_Filter).not('.FilterAll').map(function(){return '.Filter'+$(this).attr('id');}).get().join(', ');var l_ContentRows=$(l_ActiveContentList).map(function(){return '#'+$(this).attr('id');}).get();var l_FilteredListRowIDs=$(l_LanguageRows).filter(l_SocialMediaRows).filter(l_ContentRows).get().join(', ');$('.FilterResultRow').hide();$(l_FilteredListRowIDs).show();if(a_Element=='Language_All'){$('.FilterElementLanguage').removeClass('FilterIsActive');}else if(a_Element=='SocialMedia_All'){$('.FilterElementSocialMedia').removeClass('FilterIsActive');}else if(a_Element=='Content_All'){$('.FilterElementContent').removeClass('FilterIsActive');}
return;}

function MouseOverBigButton(source)
{source.firstChild.style.visibility="visible";}
function MouseOutBigButton(source)
{source.firstChild.style.visibility="hidden";}
function CopyContentOfFormInput(a_SourceID,a_FormInputID)
{$("#"+a_SourceID).click(function(){$("#"+a_FormInputID).select();document.execCommand("copy");});$("#"+a_FormInputID).click(function(){$(this).select();});}
function SetCookie(a_Name,a_Value,a_ExpireDateUTCString=false)
{var l_CookieExpireString='';if(a_ExpireDateUTCString!=false){l_CookieExpireString+=' expires='+a_ExpireDateUTCString+';';}
document.cookie=a_Name+'='+a_Value+'; domain='+JS_COOKIE_DOMAIN+';'+l_CookieExpireString+' path=/;';return;}
function GetCookieValue(a_Name)
{var l_RequestedCookieValue=null;var l_ConsentCookieEQ=a_Name+'=';var l_AllCookies=document.cookie.split(';');for(var i=0;i<l_AllCookies.length;i++){var l_SingleCookie=l_AllCookies[i];while(l_SingleCookie.charAt(0)==' '){l_SingleCookie=l_SingleCookie.substring(1,l_SingleCookie.length);}
if(l_SingleCookie.indexOf(l_ConsentCookieEQ)==0){l_RequestedCookieValue=l_SingleCookie.substring(l_ConsentCookieEQ.length,l_SingleCookie.length);break;}}
return l_RequestedCookieValue;}
function HideCookieDialog()
{$('#cookiedialogbox').hide();}
function ShowCookieDialog()
{$('#cookiedialogbox').show();}
function HideCookieDetails()
{$('#cookiedetailsbox').hide();}
function ShowCookieDetails()
{$('#cookiedetailsbox').show();}
function SetConsentCookie(consent=false,acceptall=false)
{var cc_advertising=false;var cc_social=false;if(consent==true){if(acceptall==true){cc_advertising=true;cc_social=true;}else{cc_advertising=$("#cc_advertising").is(':checked');cc_social=$('#cc_social').is(':checked');}}
var settings={consent:consent,advertising:cc_advertising,socialmedia:cc_social};SetCookie('CookieConsentPreferences',JSON.stringify(settings),GetConsentCookieExpireDateUTCString());location.reload();}
function ProlongConsentCookie()
{var l_ConsentCookie=GetCookieValue('CookieConsentPreferences');if(l_ConsentCookie!=null){SetCookie('CookieConsentPreferences',l_ConsentCookie,GetConsentCookieExpireDateUTCString());$('#cookiedialogbox').hide();}}
function GetConsentCookieExpireDateUTCString()
{var l_ExpireDate=new Date;l_ExpireDate.setFullYear(l_ExpireDate.getFullYear()+1);return l_ExpireDate.toUTCString();}
$(document).ready(function(){var l_CurrentDomain=window.location.host.toString();var l_CookieDomain=JS_COOKIE_DOMAIN;if((l_CookieDomain.includes(l_CurrentDomain)==true)||(l_CurrentDomain.includes(l_CookieDomain)==true)){ProlongConsentCookie();}});function FansiteFilterAction(a_Element)
{if(a_Element=='Language_All'||a_Element=='SocialMedia_All'||a_Element=='Content_All'){if($('#'+a_Element).hasClass('FilterIsActive')){return;}}
if(a_Element=='Language_All'){$('.FilterElementLanguage').addClass('FilterIsActive');}else if(a_Element=='SocialMedia_All'){$('.FilterElementSocialMedia').addClass('FilterIsActive');}else if(a_Element=='Content_All'){$('.FilterElementContent').addClass('FilterIsActive');}
if($('#'+a_Element).hasClass('FilterIsActive')){$('#'+a_Element).removeClass('FilterIsActive');}else{$('#'+a_Element).addClass('FilterIsActive');}
if($('#'+a_Element).hasClass('FilterElementLanguage')){$('.FilterLanguageAll').removeClass('FilterIsActive');}else if($('#'+a_Element).hasClass('FilterElementSocialMedia')){$('.FilterSocialMediaAll').removeClass('FilterIsActive');}else if($('#'+a_Element).hasClass('FilterElementContent')){$('.FilterContentAll').removeClass('FilterIsActive');}
if($('.FilterElementLanguage').hasClass('FilterIsActive')==false){$('#Language_All').addClass('FilterIsActive');}
if($('.FilterElementSocialMedia').hasClass('FilterIsActive')==false){$('#SocialMedia_All').addClass('FilterIsActive');}
if($('.FilterElementContent').hasClass('FilterIsActive')==false){$('#Content_All').addClass('FilterIsActive');}
var l_Filter='';l_Filter='.FilterElementLanguage.FilterIsActive';if($('#Language_All').hasClass('FilterIsActive')){l_Filter='.FilterElementLanguage';}
var l_ActiveLanguageList=$(l_Filter).not('.FilterAll').map(function(){return '.Filter'+$(this).attr('id');}).get().join(', ');var l_LanguageRows=$(l_ActiveLanguageList).map(function(){return '#'+$(this).attr('id');}).get();l_Filter='.FilterElementSocialMedia.FilterIsActive';if($('#SocialMedia_All').hasClass('FilterIsActive')){l_Filter='.FilterElementLanguage';}
var l_ActiveSocialMediaList=$(l_Filter).not('.FilterAll').map(function(){return '.Filter'+$(this).attr('id');}).get().join(', ');var l_SocialMediaRows=$(l_ActiveSocialMediaList).map(function(){return '#'+$(this).attr('id');}).get();l_Filter='.FilterElementContent.FilterIsActive';if($('#Content_All').hasClass('FilterIsActive')){l_Filter='.FilterElementLanguage';}
var l_ActiveContentList=$(l_Filter).not('.FilterAll').map(function(){return '.Filter'+$(this).attr('id');}).get().join(', ');var l_ContentRows=$(l_ActiveContentList).map(function(){return '#'+$(this).attr('id');}).get();var l_FilteredListRowIDs=$(l_LanguageRows).filter(l_SocialMediaRows).filter(l_ContentRows).get().join(', ');$('.FilterResultRow').hide();$(l_FilteredListRowIDs).show();if(a_Element=='Language_All'){$('.FilterElementLanguage').removeClass('FilterIsActive');}else if(a_Element=='SocialMedia_All'){$('.FilterElementSocialMedia').removeClass('FilterIsActive');}else if(a_Element=='Content_All'){$('.FilterElementContent').removeClass('FilterIsActive');}
return;}