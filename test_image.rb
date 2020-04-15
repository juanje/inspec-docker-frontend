IMAGE_REPO = attribute('image_repo')
IMAGE_TAG  = attribute('image_tag') 


describe docker_container('frontend') do
  it { should exist }
  it { should be_running }
  its('repo') { should eq IMAGE_REPO }
  its('tag') { should eq IMAGE_TAG }
  its('command') { should eq "nginx -g 'daemon off;'" }
end

# Image size should be lower than 100MB
describe docker.images.where { size.match(/^\d{2}(\.\d)*\s*MB/) } do
  its('repositories') { should include IMAGE_REPO }
  its('tags') { should include IMAGE_TAG }
end
