require 'spec_helper'

describe ApplicationModel do
  subject { described_class }

  its(:ancestors) { should include(ActiveRecord::Base) }
  its(:abstract_class) { should be_true }
end
