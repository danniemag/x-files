# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'funds/new' do
  before do
    assign(:fund, Fund.new(
                    title: 'Title',
                    total: 10_000
                  ))
  end

  it 'renders new fund form' do
    render

    assert_select 'form[action=?][method=?]', funds_path, 'post' do
      assert_select 'input[name=?]', 'fund[title]'

      assert_select 'input[name=?]', 'fund[total]'
    end
  end
end
