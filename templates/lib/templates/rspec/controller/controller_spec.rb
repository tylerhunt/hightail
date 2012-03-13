require 'spec_helper'

describe <%= class_name %>Controller do
  subject { response }
<% for action in actions -%>

  describe 'GET :<%= action %>' do
    before { get(:<%= action %>) }

    it { should be_success }
    it { should render_template(:<%= action %>) }
  end
<% end -%>
end
