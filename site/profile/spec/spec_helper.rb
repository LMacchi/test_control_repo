require 'puppetlabs_spec_helper/module_spec_helper'
RSpec.configure do |c|
  c.trusted_node_data = true
  c.default_trusted_facts = {
    pp_role        => 'sbi_node2',
    pp_app_tier    => 'CRT',
    pp_service     => 'APP',
    pp_datacenter  => 'ODC',
    pp_application => 'SBI'
  }
}
