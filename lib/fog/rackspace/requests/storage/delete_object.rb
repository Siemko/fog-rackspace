module Fog
  module Rackspace
    class Storage
      class Real
        # Delete an existing object
        #
        # ==== Parameters
        # * container<~String> - Name of container to delete
        # * object<~String> - Name of object to delete
        # @raise [Fog::Rackspace::Storage::NotFound] - HTTP 404
        # @raise [Fog::Rackspace::Storage::BadRequest] - HTTP 400
        # @raise [Fog::Rackspace::Storage::InternalServerError] - HTTP 500
        # @raise [Fog::Rackspace::Storage::ServiceError]
        def delete_object(container, object)
          request(
            :expects  => 204,
            :method   => 'DELETE',
            :path     => "#{Fog::Rackspace.escape(container)}/#{Fog::Rackspace.escape(object)}"
          )
        end
      end

      class Mock
        def delete_object(container, object)
          c = mock_container! container
          c.mock_object! object
          c.remove_object object

          response = Excon::Response.new
          response.status = 204
          response
        end
      end
    end
  end
end
