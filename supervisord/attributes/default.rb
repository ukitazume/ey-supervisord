default['supervisord'] = {
  'is_the_instance' => (node['dna']['instance_role'] == 'solo') || (node['dna']['instance_role'] == 'util' && node['dna']['name'] =~ /^supervisord_worker/),
  'version' => '3.1.3',
}
