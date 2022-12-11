# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'funds/edit' do
  let(:fund) do
    Fund.create!(
      title: 'Title',
      total: 10_000
    )
  end

  before do
    assign(:fund, fund)
  end

  it 'renders the edit fund form' do
    render

    assert_select 'form[action=?][method=?]', fund_path(fund), 'post' do
      assert_select 'input[name=?]', 'fund[title]'

      assert_select 'input[name=?]', 'fund[total]'
    end
  end
end
