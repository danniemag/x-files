# frozen_string_literal: true

# Controller for upcoming Payments
class PaymentsController < ApplicationController

  def index
    respond_to do |format|
      format.html
      format.json do
        render json: response_dataset, status: :ok
      end
    end
  end

  private

  def response_dataset
    {
      data: projects,
      page: 1,
      page_size: 1,
      count: projects.size
    }
  end

  def projects
    results.map do |project|
      ::ProjectPresenter.new(project).to_hash
    end
  end

  def results
    ::ProjectsQuery.new.find(options)
  end

  def options
    {
      page_size:,
      page:,
      filters: request.query_parameters[:filters],
      q: request.query_parameters[:q]
    }
  end

  def page_size
    request.query_parameters[:page_size]
  end

  def page
    request.query_parameters[:page]
  end
end
