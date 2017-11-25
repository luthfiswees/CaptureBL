require 'spec_helper'

describe "Bukalapak", type: :feature, js: true do
  describe 'homepage' do
    it "shows homepage" do
      visit '/'
      expect(page).to have_content "Login"
      expect(page).to have_content "Daftar"
    end

    it "capture homepage" do
      visit '/'
      Percy::Capybara.snapshot(page, name: 'homepage bukalapak')
    end
  end
end