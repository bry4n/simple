require 'rack'
require 'http_router'
require 'simple/core_ext' unless defined?(ActiveSupport)

class Simple
  class Base

    class << self
     
      attr_accessor :env, :request

      def reset!
        @namespace, @env = [], {}
      end

      def inherited(subclass)
        subclass.reset!
        super
      end
      
      def params; _params.merge(env['router.params']); end
      def session; env['rack.session'] ||= {}; end
      
      def namespace(path, &blk)
        @namespace.push(path)
        blk.yield
        @namespace.pop
      end
      alias_method :path, :namespace
      alias_method :resource, :namespace
      alias_method :resources, :namespace
      alias_method :segment, :namespace
      alias_method :group, :namespace

      def get(path, options = {}, &blk); route(:get, path, options, &blk); end
      def post(path, options = {}, &blk); route(:post, path, options, &blk); end
      def put(path, options = {}, &blk); route(:put, path, options, &blk); end
      def delete(path, options = {}, &blk); route(:delete, path, options, &blk); end
      def head(path, options = {}, &blk); route(:head, path, options, &blk); end
      
      def call(env)
        @request  = Rack::Request.new(env)
        @params   = @request.params.symbolize_keys 
        return not_found unless router.recognize(env)
        @env = env
        compile_response(env)
      end

      private

      def _params
        (env['rack.request.form_hash'] || {}).symbolize_keys.merge (env['rack.request.query_hash'] || {}).symbolize_keys
      end
      
      def compile_response(env)
        data = router.call(env)
        return data if data.is_a?(Array)
        response = Rack::Response.new(data, 200)
        response.finish
      end
      
      def not_found
        response ||= Rack::Response.new("Not Found", 404)
        response.finish
      end

      def route(method, path, options = {}, &blk)
        router.send(method.to_sym, @namespace * '/' + path, options) {|env| @env=env; instance_eval(&blk) }
      end

      def router
        @router ||= HttpRouter.new
      end

    end

  end
  
  API = Class.new(Base)

end
