require_relative  './Stack.rb'
require_relative  './Queue.rb'

class JobSimulation
  attr_reader :workers, :waiting, :roll

  def initialize (jobs_available, job_seekers)
    @jobs_available = jobs_available
    @job_seekers = job_seekers
    @workers = Stack.new
    (1..jobs_available).each do |num|
      @workers.push("Worker ##{num}")
    end
    @waiting = Queue.new
    ((jobs_available + 1)..job_seekers).each do |num|
      @waiting.enqueue("Worker ##{num}")
    end
    @roll = nil
    # # For testing
    # @roll = [6, 2, 3]
    # @count = 0
  end

  def cycle
    ## For tests
    # roll = @roll[@count]

    @roll = rand(1..6)
    @roll.times do
      fired = @workers.pop
      @waiting.enqueue(fired)
      puts "FIRED: #{fired}"
    end

    @roll.times do
      hired = @waiting.dequeue
      @workers.push(hired)
      puts "HIRED: #{hired}"
    end
    ## For tests
    # @count += 1
  end


end # End of class JobSimulation

## Allows us to run our code and see what's happening:
sim = JobSimulation.new(6,10)
puts "------------------------------"
puts "Before the simulation starts"
puts "Employed: #{sim.workers}"
puts "Waitlist: #{sim.waiting}"
puts "------------------------------"
print "<enter to cycle>\n"

count = 0
until gets.chomp != ""
  puts "-------Cycle #{count+=1}-------"
  sim.cycle
  puts "Employed: #{sim.workers}"
  puts "Waitlist: #{sim.waiting}"
end
