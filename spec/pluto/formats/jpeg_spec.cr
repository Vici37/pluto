require "../../spec_helper"

describe Pluto::Formats::JPEG do
  describe ".from_jpeg" do
    it "works" do
      data = File.read("samples/pluto.jpg")
      image = Pluto::Image.from_jpeg(data)

      image.pixels[240][320].should eq 4005796096
      image.width.should eq 640
      image.height.should eq 480
      image.type.should eq Image::Type::RGB
    end
  end

  describe "#to_jpeg" do
    it "works" do
      data_before = File.read("samples/pluto.jpg")
      data_after = Pluto::Image.from_jpeg(data_before).to_jpeg

      data_after.size.should eq 61892
      data_after.includes?("JFIF").should be_true
      data_after.includes?("<CREATOR: gd-jpeg v1.0 (using IJG JPEG v80), quality = 100").should be_true
    end
  end
end
