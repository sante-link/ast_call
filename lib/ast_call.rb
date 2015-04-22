require "ast_call/version"

require 'ruby-asterisk'
require 'yaml'

class RubyAsterisk::AMI
  def originate2(caller, context, callee, priority, callerid)
    execute 'Originate', {'Channel' => caller, 'Context' => context, 'Exten' => callee, 'Priority' => priority.to_s, 'Callerid' => "\"#{callerid}\" <#{callee}>", 'Timeout' => '30000'}
  end
end

module AstCall
  class Caller
    def config
      return @config if @config

      files = [ "#{ENV['HOME']}/.config/ast-call/config.yml", '/usr/local/etc/ast-call.yml', '/etc/ast-call.yml' ]
      files.each do |file|
        if File.exists?(file) then
          @config = YAML.load_file(file)
          return @config
        end
      end

      raise 'No suitable configuration file found'
    end

    def connect
      @ami = RubyAsterisk::AMI.new(config['manager']['host'], config['manager']['port'])
      @ami.login(config['login']['username'], config['login']['secret'])
      @ami
    end

    def originate(exten)
      @ami ||= connect
      res = @ami.originate2(config['originate']['channel'], config['originate']['context'], exten, config['originate']['priority'], config['originate']['callerid'])
      raise res.message unless res.success
    end
  end
end
