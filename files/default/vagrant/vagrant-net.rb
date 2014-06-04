provide "ipaddress"
depends "ipaddress", "network/interfaces", "etc/passwd"

collect_data(:default) do
  if etc["passwd"].any? { |k,v| k == "vagrant"}
    if network["interfaces"]["eth1"]
      network["interfaces"]["eth1"]["addresses"].each do |ip, params|
        if params['family'] == ('inet')
          ipaddress ip
        end
      end
    end
  end
end
