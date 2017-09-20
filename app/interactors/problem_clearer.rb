LOG_REMAINING = "%4.6s remains\r"

class ProblemClearer
  ##
  # Base class for problem clearers
  #
  def execute
    puts "#{nb_problem} #{problem_type} problems to remove"
    nb_problem.tap do |nb|
      if nb > 0
        criteria.each do |problem|
          print format(LOG_REMAINING, criteria.count)
          ProblemDestroy.new(problem).execute
        end
        puts "Done...   now repairing database"
        repair_database
      end
    end
  end

private

  def problem_type
    raise "Implement in child class"
  end

  def criteria
    raise "Implement in child class"
  end

  def nb_problem
    @count ||= criteria.count
  end

  def repair_database
    Mongoid.default_client.command repairDatabase: 1
  end
end
