FactoryGirl.define do
  factory :image do
    file { Rack::Test::UploadedFile.new(Rails.root.join('test', 'files', 'image.png'), 'image/png') }
  end
end