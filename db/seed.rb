require 'application.rb'

Task.all.destroy!
Feature.all.destroy!
Release.all.destroy!

statuses = ['Ready', 'In Progress', 'Verify', 'Done']
points = [0, 1, 2, 3, 5, 8, 13, 20, 40, 60, 100]
(1..50).each do |i|
  f = Feature.new(:description => "Feature #{i}")
  f.save
  (5..rand(20)).each do |j|
    f.tasks.new(:description => "Task #{i} #{j}",
               :points => points[rand(points.length)],
               :status => statuses[rand(statuses.length)]).save
  end
end
