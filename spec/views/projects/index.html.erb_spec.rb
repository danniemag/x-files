# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'projects/index' do
  let(:fund) do
    Fund.create!(
      title: 'Fund',
      total: 10_000
    )
  end

  before do
    assign(:projects, [
             Project.create!(
               payment_date: Date.current + 1.month,
               title: 'Project 1',
               fund:
             ),
             Project.create!(
               payment_date: Date.current + 2.months,
               title: 'Project 2',
               fund:
             )
           ])
  end

  it 'renders a list of projects' do
    render
    cell_selector = 'tr>td'
    assert_select cell_selector, text: Regexp.new('Project'.to_s), count: 2
    assert_select cell_selector, text: 'Fund', count: 2
  end
end
