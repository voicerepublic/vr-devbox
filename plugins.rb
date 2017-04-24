[
  { :name => "vagrant-vbguest", :version => ">= 0.13.0" },
  { :name => "vagrant-cachier", :version => ">= 1.2.1"},
  { :name => "vagrant-triggers", :version => ">= 0.5.3"}
].each do |plugin|

  if not Vagrant.has_plugin?(plugin[:name], plugin[:version])
    #raise "#{plugin[:name]} #{plugin[:version]} is required. Please run `vagrant plugin install #{plugin[:name]}`"
    system "vagrant plugin install #{plugin[:name]}"
  end
end
