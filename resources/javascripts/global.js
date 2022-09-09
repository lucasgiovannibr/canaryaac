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