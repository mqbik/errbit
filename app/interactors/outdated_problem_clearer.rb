class OutdatedProblemClearer < ProblemClearer
  ##
  # Clear all problems older than configured time.
  #

private

  def problem_type
    :outdated
  end

  def criteria
    @criteria ||= Problem.where(:last_notice_at.lt => Errbit::Config.errbit_problem_destroy_after_days.to_f.days.ago)
  end
end
