require 'minitest/autorun'
require 'minitest/reporters'
require_relative '../lib/job-simulation'
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new


describe "Test Terrible Company" do
  it "returned :worker and :waiting types" do
    simulation = JobSimulation.new(6, 10)
    simulation.workers.must_be_kind_of Stack
    simulation.waiting.must_be_kind_of Queue
  end

  it "Start values for :workers and :waiting" do
    simulation = JobSimulation.new(6, 10)
    simulation.workers.to_s.must_equal '["Worker #1", "Worker #2", "Worker #3", "Worker #4", "Worker #5", "Worker #6"]'
    simulation.waiting.to_s.must_equal '["Worker #7", "Worker #8", "Worker #9", "Worker #10"]'
  end

  it "Outcome of :workers and :waiting after 6 people are fired" do
    simulation = JobSimulation.new(6, 10)
    simulation.cycle
    simulation.workers.to_s.must_equal '["Worker #7", "Worker #8", "Worker #9", "Worker #10", "Worker #6", "Worker #5"]'
    simulation.waiting.to_s.must_equal '["Worker #4", "Worker #3", "Worker #2", "Worker #1"]'
  end




end # End of describe "Test Terrible Company"
