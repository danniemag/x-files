# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'projects/edit' do
  let(:fund) do
    Fund.create!(
      title: 'Fund',
      total: 10_000
    )
  end
  let(:project) do
    Project.create!(
      payment_date: Date.current + 1.month,
      title: 'Title',
      fund:
    )
  end

  before do
    assign(:project, project)
  end

  it 'renders the edit project form' do
    render

    assert_select 'form[action=?][method=?]', project_path(project), 'post' do
      assert_select 'input[name=?]', 'project[title]'

      assert_select 'select[name=?]', 'project[fund_id]'

      assert_select 'input[name=?]', 'project[payment_date]'
    end
  end
end
