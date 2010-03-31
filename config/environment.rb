HOME_TEXT = "<p class='first'>
Fulfill your singing potential by learning vocal training technique used by over 120 Grammy winners.
</p>
<p class='first'>
<img alt='Voice Lessons in Speech Level Singing' src='/images/female_recording.jpg' />
Kelly offers private, one-one-one lessons for those looking to increase range and strength, eliminate vocal breaks, correct bad habits, repair damage or add quality to their voice.</p>
<h2>Can you sing from chest voice to head voice without cracking?</h2>
<p>Kelly can teach you to experience the full range of your voice without cracking or straining. By focusing on vocal exercises that blend the chest and head together, Kelly teaches you how to sing freely in a balanced voice.</p>
<h2>Does your voice get tired or hoarse?</h2>
<p>Many singers experience throat tightness or fatigue as they sing higher. Kelly teaches a balance between air flow and muscle which relieves the throat of voice damaging tension.</p>
<h2>Can you sing as high as you'd like?</h2>
<p>When a singer can't get past their bridges, they assume all higher notes are out of their range. By helping students transition correctly between their bridges, Kelly helps singers drastically improve their range.</p>"
LESSONS_TEXT = "<p class='first'>
<img alt='Los Angeles Voice Lessons' src='/images/female_singing.jpg' />
Kelly offers private,
<b>one-on-one</b>
vocal lessons for students of all ages. Her clients range from professional vocalists to those just starting out.
</p>
<p class='first'>
Increase your
<b>range and strength,</b>
while adding
<b>quality and color</b>

to your voice by studying the technique of legends!
</p>
<h2>What to expect from your lesson:</h2>
<p>Lessons with Kelly are custom tailored to the individual client, allowing each singer to reach their highest vocal potential. Kelly believes her students make faster and more dramatic progress by getting personal, individualized attention. Each lesson will vary as students reach new levels and pursue unique vocal styles.</p>
<p>Students are given vocal exercises designed to help them with their specific problems and goals. Many students feel marked improvement in their singing after only one lesson! The skills learned from the exercises are then applied to songs of your choosing, making each lesson comfortable yet empowering.</p>
<h2>Availability:</h2>
<p>Private lessons are available everyday from 1pm to 8pm. Weekly hour-long lessons are the most common and recommended for steady progress. You will be given a CD recording of each private  lesson to take home and practice.</p>
<h2>Pricing:</h2>
<ul>
<li>
Half-hour lesson:

<span>$35</span>
</li>
<li>
Hour long lesson:
<span>$70</span>
</li>
</ul>
<p>Payments are due at the beginning of each lesson, either by cash or check.</p>
<h2>Discounted monthly packages</h2>
<p>
Students who intend to take lessons regularly for more than a few weeks at a time are offered special discounted bundles of $240 per month.
Please email
<a href='mailto:kellykernohan@hotmail.com'>kellykernohan@hotmail.com</a>

for more info.
</p>
<h2>24 Hour Cancellation Policy:</h2>
<p>Lesson times are very limited. Due to high demand, all lessons not canceled or re-scheduled at least 24 hours before their start time will be charged at full rate.</p>"

SPEECH_LEVEL_SINGING_TEXT = "<p class='first'>
<img alt='Kelly Kernohan is a Speech Level Singing Certified Instructor' src='/images/svp.gif' />
Speech Level Singing™ (SLS) is a revolutionary vocal training technique that maximizes your vocal abilities in any style of singing.
</p>
<p class='first'>From Opera to Rock; Jazz to Pop or R&B, over 120 Grammy award winners have studied this revolutionary technique.</p>
<p>Speech Level Singing is founded on the concept of singing in the same comfortable manner as you speak, providing a healthy technique for all voices and all styles. The SLS technique allows you to sing through your entire range (three or more octaves) without breaking, straining, or changing quality. The larynx (the bump on your neck) houses your vocal cords. A singer who uses improper technique will find that the larynx will rise as they sing higher. The result sounds 'shouty', creates tension, and damages the vocal cords.</p>
<p>Speech Level Singing teaches the larynx to stay relaxed through your entire range and teaches the cords to make the proper adjustments while balancing air flow. As a result, the singer will be able to produce the correct resonance shifts through their bridges without any disconnection. With this technique you'll be able to sing through all your bridges in a strong, balanced voice ready for any pitch, any volume, or any style!</p>"

CONTACT_TEXT = "<p>
The
<b>Kelly Kernohan Vocal Studio</b>
is located at:
</p>
<ul>
<li>11950 San Vicente Boulevard</li>
<li>Los Angeles, CA 90049</li>
</ul>
<p>

Kelly can be reached via email at
<a href='mailto:kellykernohan@hotmail.com' title='Private singing lessons with Kelly Kernohan'>kellykernohan@hotmail.com</a>.
</p>"
# Be sure to restart your server when you modify this file

# Uncomment below to force Rails into production mode when
# you don't control web/app server and can't set it the proper way
# ENV['RAILS_ENV'] ||= 'production'

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.2' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|

  config.time_zone = 'UTC'
  config.gem "djanowski-snippets", :lib => 'snippets', :source => 'http://gems.github.com'
  config.gem "settings"
  config.gem "haml"
  config.gem "citrusbyte-milton", :lib => 'milton', :source => 'http://gems.github.com'


  config.action_controller.session = {
    :session_key => '_kernohan_rails_session',
    :secret      => 'ca0522c4d79373fb3cffc62c540d4bc0c57dd863dfb0466047f1e6b82d8e358fa9961d7adc584a5b8668e303a3f31538988b54fb5de875b7bf798619bb3b2ca8'
  }

end
