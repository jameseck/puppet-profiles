require 'facter'

dest_ip = '192.168.1.0/24'

mgmt_ip_info = `ip route get #{dest_ip} | head -n 1`.chomp
if mgmt_ip_info.include? "broadcast" then
    mgmt_vars = mgmt_ip_info.scan(/^(broadcast) ([0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}) dev (.*?)  src ([0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}) $/)
else
    mgmt_vars = mgmt_ip_info.scan(/^([0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}) via ([0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}) dev (.*?)  src ([0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}) $/)
end

mgmt_interface = mgmt_vars[0][2]
mgmt_ip = mgmt_vars[0][3]
                                                                                                                                                                                                                   
Facter.add(:mgmt_ip) do                                                                                                                                                                                         
    confine :kernel => 'Linux'                                                                                                                                                                                     
    setcode do                                                                                                                                                                                                     
        mgmt_ip                                                                                                                                                                                                    
    end                                                                                                                                                                                                            
end                                                                                                                                                                                                                
                                                                                                                                                                                                                   
Facter.add(:mgmt_interface) do                                                                                                                                                                                  
    confine :kernel => 'Linux'                                                                                                                                                                                     
    setcode do
        mgmt_interface
    end
end

