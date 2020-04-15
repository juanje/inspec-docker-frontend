# copyright: 2020, Juanje Ojeda

title "Service running"

control "service-1.0" do
  impact 0.9
  title "Web server running"
  describe processes('nginx:') do
    it { should exist }
  end
  describe processes('node') do
    it { should_not exist }
  end
  describe file('/usr/share/nginx/html/index.html') do
    it { should exist }
    its('content') { should match /<title>PROYECTO<\/title>/ }
  end
end
