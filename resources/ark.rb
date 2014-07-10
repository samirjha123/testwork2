actions :install, :remove

state_attrs :alternatives_priority,
            :app_home,
            :app_home_mode,
            :bin_cmds,
            :checksum,
            :md5,
            :default,
            :mirrorlist,
            :owner,
            :url

attribute :url, :regex => /^(file|https?):\/\/.*(tar.gz|tgz|bin|zip)$/, :default => nil
attribute :mirrorlist, :kind_of => Array, :default => nil
attribute :checksum, :regex => /^[0-9a-f]{32}$|^[a-zA-Z0-9]{40,64}$/, :default => nil
attribute :md5, :regex => /^[0-9a-f]{32}$|^[a-zA-Z0-9]{40,64}$/, :default => nil
attribute :app_home, :kind_of => String, :default => nil
attribute :app_home_mode, :kind_of => Integer, :default => 0755
attribute :bin_cmds, :kind_of => Array, :default => nil
attribute :owner, :default => "root"
attribute :default, :equal_to => [true, false], :default => true
attribute :alternatives_priority, :kind_of => Integer, :default => 1
attribute :retries, :kind_of => Integer, :default => 0
attribute :retry_delay, :kind_of => Integer, :default => 2

# we have to set default for the supports attribute
# in initializer since it is a 'reserved' attribute name
def initialize(*args)
  super
  @action = :install
  @supports = {:report => true, :exception => true}
end
