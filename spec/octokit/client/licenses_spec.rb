require 'helper'

describe Octokit::Client::Licenses do

  describe ".licenses", :vcr do
    it "returns all licenses" do
      licenses = Octokit.licenses :accept => "application/vnd.github.drax-preview+json"
      expect(licenses).to be_kind_of Array
    end
  end

  describe ".license", :vcr do
    it "returns a particular license" do
      license = Octokit.license 'mit', :accept => "application/vnd.github.drax-preview+json"
      expect(license.name).to eq("MIT License")
    end
  end

	describe ".license_contents", :vcr do
		it "returns a repository's license file" do
			response = Octokit.license_contents 'benbalter/licensee', :accept => "application/vnd.github.drax-preview+json"
			expect(response.license.key).to eql("mit")
			content = Base64.decode64 response.license.content
			expect(content).to match(/MIT/)
		end
	end
end # Octokit::Licenses
