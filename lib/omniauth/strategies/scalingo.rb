require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Scalingo < OmniAuth::Strategies::OAuth2
      option :client_options, {
        :site => 'https://auth.scalingo.com',
        :authorize_url => 'https://auth.scalingo.com/oauth/authorize',
        :token_url => 'https://auth.scalingo.com/oauth/token'
      }

      def request_phase
        super
      end

      def authorize_params
        super.tap do |params|
          %w[scope client_options].each do |v|
            if request.params[v]
              params[v.to_sym] = request.params[v]
            end
          end
        end
      end

      uid { raw_info['id'].to_s }

      info do
        {
          'uuid'       => raw_info['id'],
          'username'   => raw_info['username'],
          'email'      => raw_info['email'],
          'first_name' => raw_info['first_name'],
          'last_name'  => raw_info['last_name'],
          'flags'      => raw_info['flags'],
        }
      end

      extra do
        {:raw_info => raw_info, :all_emails => emails}
      end

      def raw_info
        access_token.options[:mode] = :query
        @raw_info ||= access_token.get('user').parsed
      end

      def callback_url
        full_host + script_name + callback_path
      end
    end
  end
end

OmniAuth.config.add_camelization 'scalingo', 'Scalingo'
