<embedvideo>

	<input type="text" placeholder="video" name="url" onkeyup={ getVideoEmbed(url) }>
	<div class="ui segment padded">
	   <iframe src='{video}' allowtransparency='true' frameborder='0' scrolling='no' class='wistia_embed' name='wistia_embed' allowfullscreen mozallowfullscreen webkitallowfullscreen oallowfullscreen msallowfullscreen width='80%' height='238'></iframe> 
	</div>

    getVimeoId = function(url) {
    var regExp = /^.*(vimeo\.com\/)((channels\/[A-z]+\/)|(groups\/[A-z]+\/videos\/))?([0-9]+)/;
    var match = url.match(regExp);
        if (match && match[5].length == 8) {
            return 'https://player.vimeo.com/video/' + match[5];
        } else {
            return null;
        }
    };

    getYoutubeId = function(url) {
    var regExp = /^.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*).*/;
    var match = url.match(regExp);

        if (match && match[2].length == 11) {
            return 'https://www.youtube.com/embed/' + match[2] + '?controls=0autoplay=1&modestbranding=1&showinfo=0&rel=0';
        } else {
            return null;
        }
    };

    getWistiaId = function(url) {
    var regExp = /https?:\/\/(.+)?(wistia\.com|wi\.st)\/medias\/([^#\&\?]*).*/;
    var match = url.match(regExp);
            //console.log(match);
            if (match) {
                return 'https://fast.wistia.net/embed/iframe/' + match[3] + '?videoFoam=true';
            } else {
                return null;
            }
    };

     getVideoEmbed = function(url) {
            if (url === undefined) {
                return null;
            }
            var src = getWistiaId(url);

            if (src === null) {
                src = getYoutubeId(url);
            }
            if (src === null) {
                src = getVimeoId(url);
            }
            return src;
        };


</embedvideo>