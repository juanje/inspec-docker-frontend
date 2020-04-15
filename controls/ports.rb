# copyright: 2020, Juanje Ojeda

title "Service basic controls"

control "ports-1.0" do
  impact 0.9
  title "Listening at the rigth ports"
  describe port(8080) do
    it { should be_listening }
  end
end
