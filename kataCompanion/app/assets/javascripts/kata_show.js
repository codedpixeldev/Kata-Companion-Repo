$.getScript('http://www.youtube.com/iframe_api');

     var player;
     function onYouTubePlayerAPIReady() {
         player = new YT.Player('player', {
           height: '500',
           width: '500',
           videoId: videoId,
             playerVars: { 'start': 0, 'autoplay': 0, 'controls': 1 },
           events: {
             'onReady': onPlayerReady,
             'onStateChange': onPlayerStateChange,
           }
             
         });         
     }

function onPlayerStateChange(evt) 
{
    if (evt.data==1) 
    {
        // this will seek to a certain point when video starts
        // but you're better off using 'start' parameter
        // player.seekTo(22);   
    }
}

     function onPlayerReady(evt) {

     }

$(function() {
    
    $(document).on('click', '#btnSeek', function() {
        player.seekTo($(this).data('seek'), true);
    });
});