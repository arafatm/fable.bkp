require 'application.rb'

DataMapper::Model.descendants.each {|m| m.all.destroy!}

statuses = ['Ready', 'In Progress', 'Verify', 'Done']
points = [0, 1, 2, 3, 5, 8, 13, 20, 40, 60, 100]

d = Date.today
(1..5).each do |i|
  r = Release.new(:description => "Release #{i}",
                 :date => (d + 14*i))
  if !r.save
    puts r.errors.to_yml 
    return
  end
end

(1..5).each do |i|
  f = Feature.new(:description => "Feature #{i}")
  puts f.errors unless f.save 
  if !f.save
    puts f.errors.to_yml 
    return
  end

  (5..rand(20)).each do |j|
    r = Release.all[rand(Release.all.length)]
    t = Story.new(:description => "Story #{i} #{j}",
                 :points => points[rand(points.length)],
                 :status => statuses[rand(statuses.length)],
                 :feature => f,
                 :release => r)
    if !t.save
      puts t.errors.to_yml 
      return
    end
  end
end
