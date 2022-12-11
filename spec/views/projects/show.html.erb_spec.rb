# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'projects/show' do
  let(:fund) do
    Fund.create!(
      title: 'Fund',
      total: 10_000
    )
  end

  before do
    assign(:project, Project.create!(
                       payment_date: Date.current + 1.month,
                       title: 'Project',
                       fund:
                     ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Fund/)
  end
end
