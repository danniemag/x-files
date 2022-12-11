# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'applicants/index' do
  let(:fund) do
    Fund.create!(
      title: 'Fund',
      total: 10_000
    )
  end

  let(:project) do
    Project.create!(
      payment_date: Date.current + 1.month,
      title: 'Project',
      fund:
    )
  end

  before do
    assign(:applicants, [
             Applicant.create!(
               name: 'Applicant 1',
               overview: 'Overview',
               funding: 500,
               project:,
               status: 0
             ),
             Applicant.create!(
               name: 'Applicant 2',
               overview: 'Overview',
               funding: 500,
               project:,
               status: 4
             )
           ])
  end

  it 'renders a list of applicants' do
    render
    cell_selector = 'tr>td'
    assert_select cell_selector, text: Regexp.new('Applicant'), count: 2
    assert_select cell_selector, text: 'Project', count: 2
    assert_select cell_selector, text: 'Applied', count: 1
    assert_select cell_selector, text: 'Approved', count: 1
  end
end
