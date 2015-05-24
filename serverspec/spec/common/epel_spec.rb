require 'spec_helper'

describe package('epel-release'), :if => os[:family] == 'redhat' do
  it { should be_installed }
end

describe file('/etc/yum.repos.d/epel.repo'), :if => os[:family] == 'redhat' do
  it { should be_file }
  it { should contain "download.fedoraproject.org/pub/epel/" }
end
