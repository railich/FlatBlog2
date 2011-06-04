# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

Category.create!([{:name =>'News'}, {:name =>'Sport'}, {:name =>'Humor'},{:name =>'World'}]) if Category.all.count.zero?

Article.create!([
  {
    :category_id => 1,
    :title => "EventMachine and Passenger",
    :body => "In order to fully explain this post, we first need to cover some back story. Originally, Gaug.es was hosted on Heroku. Recently, we moved Gaug.es to RailsMachine (before the great AWS outage luckily), where we are already happily hosting Harmony.

At Heroku, we were running on 1.9.2 and thin. The most common RailsMachine stack is REE 1.8 and Passenger. Sticking with the common stack meant it would be a far easier and faster transition to Railsmachine, so we tweaked a few things and switched.",
    :url => "http://railstips.org",
    :tags => "eventmachine, passenger, and pusher",
    :rating => 10
  },
  {
    :category_id => 1,
    :title => "SSH Tunneling in Ruby",
    :body => "The other day I wanted to do some queries in production, but our servers are pretty locked down to the outside world. I was well aware that I could just make an ssh tunnel to connect to the database server, but I decided I wanted to do it in Ruby.

I am not the brightest of crayons in the box, so it took me a bit. Since I struggled with it for a few, I figured others probably will someday as well and decided to post my solution here.",
    :url => "http://railstips.org",
    :tags => "ruby and ssh",
    :rating => 6
  },
  {
    :category_id => 1,
    :title => "Give Yourself Constraints",
    :body => "Recently, I had a hernia and surgery to fix it. This knocked me out of the game and onto the couch for a couple weeks. During my recovery, I had a lot of time to think. I also had a lot of time to miss what I do every day.

This was the longest period in several years for me without creating. Once I felt good enough to get back at it, even if only for a few hours, I decided to focus all this pent up energy on something new.",
    :url => "http://railstips.org",
    :tags => "applications, gauges, and thoughts"
  },
  {
    :category_id => 1,
    :title => "Improving Your Methods",
    :body => "I am always looking for ways to improve my efficiency while coding. One of the things that has been bothering me lately is how I run tests. Back in the day, I used autotest. Of late, I have been using watchr. Finally, this week I worked out something that does exactly what I want.",
    :url => "http://railstips.org",
    :tags => "clogging and testing"
  }
])

