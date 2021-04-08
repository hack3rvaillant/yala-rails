# frozen_string_literal: true

require 'spec_helper'
require 'rails_helper'

RSpec.describe 'Homepage' do
  context 'As a First Time Visitor' do
    describe 'I can visit the homepage' do
      it 'So that I can discover the value proposition' do
        visit '/'

        expect(page).to have_selector 'h1', text: 'Yala'
        expect(page).to have_selector 'h2', text: 'Create an online learning community for your organization.'
        meta_description =
          Nokogiri::HTML(page.source).css("meta[name='description']")[0]
                  .attributes['content'].value
        expect(meta_description).to eq 'Create an online learning community for your organization.' \
          ' Your Awesome Learning Adventure just starts here'
      end
    end
  end
end
