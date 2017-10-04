require 'spec_helper'

site = ENV['TEST_HOST'] || 'https://www.bukalapak.com'
describe site, type: :feature, js: true do
  before :all do
    Capybara.app_host = site
  end

  after :all do
    page.execute_script "window.close();"
  end

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