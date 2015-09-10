module GamesHelper

    # Pass a b64 string (image) and it's content type to create an image.
    # If you just want the url ( e.g. for background images), set "url_only" to true. 
    def render_b64(image, content_type, width = 'auto', height = 'auto', class_name = 'pure-img')
        if !image.nil? && !content_type.nil?
            image_tag 'data:' + content_type + ';base64,' + image , class: class_name, style: 'width: ' + width + ';height: ' + height
        else
            image_tag 'default-cover.jpg' , class: class_name, style: 'width: ' + width + ';height: ' + height
        end
    end

    # Use this function to get a b64-url only, and not a full image tag.
    # Had to divide the render_b64 function because of problems I couldn't solve yet.
    def render_b64_url(image, content_type)
        if !image.nil? && !content_type.nil?
            return ('data:' + content_type + ';base64' + image)
        else
            return image_url('default-cover.jpg')
        end
    end
end
