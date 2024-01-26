#include "clientgreeter.h"

std::string ClientGreeter::SayHello(const std::string &user)
{
    // Data we are sending to the server.
    HelloRequest request;
    request.set_name(user);

    // Container for the data we expect from the server.
    HelloReply reply;

    // Context for the client. It could be used to convey extra information to
    // the server and/or tweak certain RPC behaviors.
    ClientContext context;

    // The actual RPC.
    Status status = stub_->SayHello(&context, request, &reply);

    // Act upon its status.
    if (status.ok()) {
        return reply.message();
    } else {
        std::string error = "RPC failed: ";
        std::string errorinfo = status.error_message();
        return error+errorinfo;
    }
}
