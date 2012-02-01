require 'rack'
require 'http_router'
require 'simple/core_ext' unless defined?(ActiveSupport)

class Simple
  class Base
    
    attr_accessor :params, :request

    @@namespace, @@env = [], {}

    class << self
      attr_accessor :env

      def params; _params.merge(env['router.params']); end
      def session; env['rack.session'] ||= {}; end
      def namespace(route, &block); @@namespace.push(route); block.yield; @@namespace.pop; end

      [:group, :resource, :resources, :segment, :path].each {|name| alias_method name, :namespace }

      [:get, :post, :delete, :put, :head].each do |http_method|
        class_eval <<-EVAL
        def #{http_method}(route, options={}, &block)
          if options[:redirect]
            return router.#{http_method}(@@namespace * '/' + route).redirect(options[:redirect])
          end
          router.#{http_method}(@@namespace * '/' + route) {|env| @@env=env; instance_eval(&block) }
        end
        EVAL
      end

    end

    def call(env)
      @request    = Rack::Request.new(env)
      @params     = @request.params.symbolize_keys
      return not_found unless router.recognize(env)
      self.class.env = env
      router.call(env)
    end

    def not_found
      [404, {"Content-Type" => "text/plain"}, ["Not Found"]]
    end

    private

    def self._params
      (env['rack.request.form_hash'] || {}).symbolize_keys.merge (env['rack.request.query_hash'] || {}).symbolize_keys
    end
    
    def router
      self.class.router
    end  
    
    def self.router
      @@router ||= HttpRouter.new
    end

  end
end
