require 'spec_helper'
describe 'no_ext_acl' do

  context 'with defaults for all parameters' do
    it { should contain_class('no_ext_acl') }
  end
end
