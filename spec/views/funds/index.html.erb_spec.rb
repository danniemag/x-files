# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'funds/index' do
  before do
    assign(:funds, [
             Fund.create!(
               title: 'Project 1',
               total: 20_000
             ),
             Fund.create!(
               title: 'Projects 2',
               total: 20_000
             )
           ])
  end

  it 'renders a list of funds' do
    render
    cell_selector = 'tr>td'
    assert_select cell_selector, text: Regexp.new('Project'.to_s), count: 2
    assert_select cell_selector, text: '20000', count: 2
  end
end
