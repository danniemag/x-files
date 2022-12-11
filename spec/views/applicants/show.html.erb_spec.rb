# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'applicants/show' do
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
    assign(:applicant, Applicant.create!(
                         name: 'Applicant Name',
                         overview: 'Overview',
                         funding: 500,
                         project:,
                         status: 3
                       ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Applicant Name/)
    expect(rendered).to match(/Overview/)
    expect(rendered).to match(/500/)
    expect(rendered).to match(/Project/)
    expect(rendered).to match(/Declined/)
  end
end
