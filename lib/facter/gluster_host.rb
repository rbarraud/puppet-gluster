# GlusterFS module by James
# Copyright (C) 2010-2013+ James Shubin
# Written by James Shubin <james@shubin.ca>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

require 'facter'
require 'resolv'

# try and pick the _right_ ip that gluster should use by default...
fqdn = Facter.value('fqdn')
if not fqdn.nil?
	ip = Resolv.getaddress "#{fqdn}"
	if not ip.nil?
		Facter.add('gluster_host_ip') do
			#confine :operatingsystem => %w{CentOS, RedHat, Fedora}
			setcode {
				ip
			}
		end
	end
end

# vim: ts=8
