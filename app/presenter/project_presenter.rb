# frozen_string_literal: true

class ProjectPresenter
  attr_reader :project

  #
  # @param project [Project]
  # @return [ProjectPresenter]
  #
  def initialize(project)
    @project = project
  end

  def to_hash
    {} if project.blank?

    {
      date: project.payment_date,
      title: project.title,
      payments_due: applicants_names
    }
  end

  def applicants_names
    Applicant
      .approved
      .includes(:project)
      .where(projects: {title: project.title})
      .map(&:name)
      .join(', ')
  end

  def to_json(*)
    to_hash.to_json
  end
end
