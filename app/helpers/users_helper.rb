module UsersHelper

    def render_avatar(user, width = 'auto', height = 'auto')
        if !user.avatar.nil? && !user.avatar_content_type.nil?
            image_tag 'data:' + user.avatar_content_type + ';base64,' + user.avatar , class: 'user-avatar pure-img', style: 'width: ' + width + ';height: ' + height
        else
            image_tag 'default-avatar.jpg' , class: 'user-avatar pure-img', style: 'width: ' + width + ';height: ' + height
        end
    end
end
