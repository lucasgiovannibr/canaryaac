var PlayButtonOver=new Image();PlayButtonOver.src=JS_DIR_IMAGES+'mmorpg/version_'+g_Version+'/button_playnow_over.png';var FacebookButtonOver=new Image();FacebookButtonOver.src=JS_DIR_IMAGES+'mmorpg/version_'+g_Version+'/fb_original_button_over.png';var PulsatingInterval;function ShowHelperDiv(a_ID)
{document.getElementById(a_ID).style.visibility='visible';document.getElementById(a_ID).style.display='block';}
function HideHelperDiv(a_ID)
{document.getElementById(a_ID).style.visibility='hidden';document.getElementById(a_ID).style.display='none';}
function BuildHelperDiv(a_DivID,a_IndicatorDivContent,a_Title,a_Text)
{var l_Qutput='';l_Qutput+='<span class="HelperDivIndicator" onMouseOver="ActivateHelperDiv($(this), \''+a_Title+'\', \''+a_Text+'\');" onMouseOut="$(\'#HelperDivContainer\').hide();" >'+a_IndicatorDivContent+'</span>';return l_Qutput;}
function BuildHelperDivLink(a_DivID,a_IndicatorDivContent,a_Title,a_Text,a_SubTopic)
{var l_Qutput='';l_Qutput+='<a href="../common/help.php?subtopic='+a_SubTopic+'" target="_blank" ><span class="HelperDivIndicator" onMouseOver="ActivateHelperDiv($(this), \''+a_Title+'\', \''+a_Text+'\');" onMouseOut="$(\'#HelperDivContainer\').hide();" >'+a_IndicatorDivContent+'</span></a>';return l_Qutput;}
function ActivateHelperDiv(a_Object,a_Title,a_Text)
{var l_Left=(a_Object.offset().left+a_Object.width());var l_Top=a_Object.offset().top;$('#HelperDivContainer').css('top',l_Top);$('#HelperDivContainer').css('left',l_Left);$('#HelperDivHeadline').html(a_Title);$('#HelperDivText').html(a_Text);$('#HelperDivContainer').show();}
function ButtonFade_MouseOver(a_Version)
{clearInterval(PulsatingInterval);$('#ButtonPlayNowOver').stop(true,true);$('#ButtonPlayNowOver').fadeIn();}
function ButtonFade_MouseOut(a_Version)
{$('#ButtonPlayNowOver').fadeOut();if(g_Version==2){StartPulsating();}}
function FB_Login_MouseOver()
{$('#FadeContainer1').css('filter','alpha(opacity=50)');$('#FadeContainer1').css('opacity','0.50');$('#FadeContainer1').css('-moz-opacity','0.50');$('#FadeContainer2').css('filter','alpha(opacity=50)');$('#FadeContainer2').css('opacity','0.50');$('#FadeContainer2').css('-moz-opacity','0.50');}
function FB_Login_MouseOut()
{$('#FadeContainer1').css('filter','alpha(opacity=100)');$('#FadeContainer1').css('opacity','1.00');$('#FadeContainer1').css('-moz-opacity','1.00');$('#FadeContainer2').css('filter','alpha(opacity=100)');$('#FadeContainer2').css('opacity','1.00');$('#FadeContainer2').css('-moz-opacity','1.00');}
function PulsatingButton()
{$('#ButtonPlayNowOver').delay(100).fadeIn(2500).delay(100).fadeOut(2500);}
function StartPulsating()
{PulsatingButton();PulsatingInterval=setInterval(PulsatingButton,5200);}
$(window).ready(function()
{var InfiniteRotator={init:function(a_Identifier)
{var l_InitialFadeIn=1000;var l_ItemInterval=10000;var l_FadeTime=1500;var l_Delay=3000;var l_NumberOfItems=$(a_Identifier).length;var l_Max=l_NumberOfItems-1;var l_Min=0;var l_CurrentItem=Math.round(Math.random()*(l_Max-l_Min+1)-0.5)+l_Min;$(a_Identifier).eq(l_CurrentItem).addClass('CurrentActive');$(a_Identifier).eq(l_CurrentItem).delay(l_InitialFadeIn).fadeIn(l_FadeTime);var l_IntervalID=setInterval(function()
{var $l_ActiveElement=$('#QuoteSlideshow div.CurrentActive');var $l_NextElement=$('#QuoteSlideshow div:first');if($l_ActiveElement.next().length!=0){$l_NextElement=$l_ActiveElement.next();}
$l_NextElement.addClass('NextActive');$(a_Identifier).not($('.CurrentActive')).not($('.NextActive')).css({display:'none'});$l_ActiveElement.fadeOut(l_FadeTime,function()
{$(this).css({display:'none'});});$l_ActiveElement.removeClass('CurrentActive');$l_NextElement.delay(l_Delay);$l_NextElement.addClass('CurrentActive');$l_NextElement.removeClass('NextActive');$l_NextElement.fadeIn(l_FadeTime);},l_ItemInterval);}};InfiniteRotator.init('.PlayerQuote');$('#ButtonPlayNowOver').fadeOut();if(g_Version==2){StartPulsating();}});function ActivateWebsiteFrame()
{g_Deactivated=false;if(document.getElementById('DeactivationContainer')!=null){document.getElementById('DeactivationContainer').style.display="none";}}
function DeactivateWebsiteFrame()
{if(document.getElementById('DeactivationContainer')!=null){document.getElementById('DeactivationContainer').style.display="block";}}
$(document).ready(function(){$('#CreateAccountAndCharacterForm').submit(function(event){$("#CreateAccountAndCharacterForm").unbind("submit");grecaptcha.execute();event.preventDefault();});AddCapsLockEventListeners();});function ReCaptchaCallback(a_Response)
{if(a_Response.length>0){$('#CreateAccountAndCharacterForm input[name=g-recaptcha-response]').val(a_Response);document.forms.CreateAccountAndCharacter.submit();}}
var player=null;var l_ElementTag=document.createElement('script');l_ElementTag.src="https://www.youtube.com/iframe_api";var l_FirstScriptTag=document.getElementsByTagName('script')[0];l_FirstScriptTag.parentNode.insertBefore(l_ElementTag,l_FirstScriptTag);function onYouTubeIframeAPIReady()
{player=new YT.Player('YouTubeVideo');return;}
function StopVideoIfExists()
{if(typeof player!=null&&player.stopVideo instanceof Function){player.stopVideo();}
return;}