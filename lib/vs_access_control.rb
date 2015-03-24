require "vs_access_control/version"

# include VsAccessControl to the class you want access control
# tell to AccessControl which methods allow access like
#
# allow_access :create do
#   user_signed_in?
# end
#
# default is close all access

module VsAccessControl
  def self.included(base)
    base.extend ClassMethods

    base.instance_eval do
      before_action :auth?

      class << self
        attr_accessor :auth_procs_hash
      end

      self.auth_procs_hash = {}
    end
  end

  module ClassMethods

    def allow_access(*actions, &auth_block)
      auth_proc = auth_block || :not_required

      actions.each do |action|
        auth_procs_hash[action] = auth_proc
      end
    end
  end

  private

  def auth?
    auth_proc = self.class.auth_procs_hash[action_name.to_sym]

    return access_denied if auth_proc.nil?

    if auth_proc != :not_required
      # it will call the block when you define the allow_access
      # access_denied if false
      unless self.instance_eval &auth_proc
        return access_denied
      end
    end
  end

  def access_denied
    render :text => "Not authorized.", :status => 403
  end
end
