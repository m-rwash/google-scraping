require 'rails_helper'

RSpec.describe Keyword, type: :model do
  
  it "has valid fabricator" do
  	expect(Fabricate(:keyword)).to be_valid
  end

  context "validation" do
    let(:keyword) {Fabricate(:keyword)}
    context "presence" do
      it "#name" do
      	expect(keyword).to validate_presence_of(:keyword)
      end
    end
  end
end
