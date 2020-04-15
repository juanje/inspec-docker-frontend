# copyright: 2020, Juanje Ojeda

title "Avoid deploy development images"

control "non-production-1.0" do
  impact 0.7
  title "Node should be running"
  desc "Some regresion tests to avoid deploy development images"
  describe processes('node') do
    it { should_not exist }
  end
  describe port(3000) do
    it { should_not be_listening }
  end
  describe file('/usr/src/app/build/index.js') do
    it { should_not exist }
  end
  describe file('/usr/src/app/node_modules') do
    it { should_not exist }
  end
end
