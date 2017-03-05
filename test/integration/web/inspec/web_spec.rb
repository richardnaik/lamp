require 'inspec'

# verify that services are running
describe service 'httpd' do
  it { should be_enabled }
  it { should be_running }
end

describe service 'php-fpm' do
  it { should be_enabled }
  it { should be_running }
end

# verify that applicable ports are listening
describe port(80) do
  it { should be_listening }
end

describe port(443) do
  it { should be_listening }
end
