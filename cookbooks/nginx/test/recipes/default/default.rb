describe port(80) do
  it { should be_listening }
end

describe pacakge('nginx') do
  it { should be_installed }
end
