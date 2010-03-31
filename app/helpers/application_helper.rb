# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def google_map(street, city, state, zip)
    # src="http://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=11950+San+Vicente+Boulevard&amp;sll=28.381735,-95.712891&amp;sspn=43.365593,93.076172&amp;ie=UTF8&amp;hq=&amp;hnear=11950+San+Vicente+Blvd,+Los+Angeles,+California+90049&amp;ll=34.051963,-118.471767&amp;spn=0.020303,0.045447&amp;z=15&amp;output=embed">
    <<-EOS
    <iframe width="288" 
            height="192" 
            frameborder="0" 
            scrolling="no" 
            marginheight="0" 
            marginwidth="0" 
            src="http://maps.google.com/maps?q=#{ street ? street.gsub(/ /,'+') : ''},+#{city ? city.gsub(/ /,'+') : ''}+#{state ? state.gsub(/ /,'+') : ''}+#{zip ? zip.gsub(/ /,'+') : ''}&amp;output=embed&amp;z=14&amp;iwloc=near">
    </iframe>
    EOS
  end
end
