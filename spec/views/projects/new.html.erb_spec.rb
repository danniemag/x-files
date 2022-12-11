# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'projects/new' do
  let(:fund) do
    Fund.create!(
      title: 'Fund',
      total: 10_000
    )
  end

  before do
    assign(:project, Project.new(
                       title: 'Project',
                       fund:
                     ))
  end

  it 'renders new project form' do
    render

    assert_select 'form[action=?][method=?]', projects_path, 'post' do
      assert_select 'input[name=?]', 'project[title]'

      assert_select 'select[name=?]', 'project[fund_id]'
    end
  end
end
