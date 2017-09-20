class ResolvedProblemClearer < ProblemClearer

private

  def problem_type
    :resolved
  end

  def criteria
    @criteria = Problem.resolved
  end
end
