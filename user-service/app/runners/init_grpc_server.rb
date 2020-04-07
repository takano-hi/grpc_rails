require "user_services_pb"

class Server < UserServices::Service
  def filter(room_id)
    user = User.new(id: room_id, name: "Hiroki")
    [user]
  end
end

class InitGrpcServer
  def self.run
    port = "50051"
    endpoint = "0.0.0.0:#{port}"
    s = GRPC::RpcServer.new
    s.add_http2_port(endpoint, :this_port_is_insecure)
    GRPC.logger.info("... running insecurely on #{port}")
    s.handle(Server.new)
    s.run_till_terminated_or_interrupted([1, "int", "SIGQUIT"])
  end
end
