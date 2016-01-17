yaourt_server = 'http://repo.archlinux.fr/$arch'
yaourt_conf = <<-CONF

[archlinuxfr]
SigLevel = Never
Server = #{yaourt_server}

CONF

execute "echo #{Shellwords.escape(yaourt_conf)} | sudo tee -a /etc/pacman.conf" do
  not_if "grep -q #{Shellwords.escape(yaourt_server)} /etc/pacman.conf"
end

package 'yaourt'

define :yaourt do
  package = params[:name]
  execute "yaourt -S #{package}" do
    not_if "yaourt -Q #{package}"
  end
end
