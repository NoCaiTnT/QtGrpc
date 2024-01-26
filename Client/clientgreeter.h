#ifndef GREETERCLIENT_H
#define GREETERCLIENT_H

#include <memory>
#include <string>
#include <grpcpp/grpcpp.h>
#include "helloworld.grpc.pb.h"

using grpc::Channel;
using grpc::ClientContext;
using grpc::Status;
using helloworld::Greeter;
using helloworld::HelloReply;
using helloworld::HelloRequest;

class ClientGreeter
{
public:
    ClientGreeter(std::shared_ptr<Channel> channel)
        : stub_(Greeter::NewStub(channel)){};

    std::string SayHello(const std::string& user);

private:
    std::unique_ptr<Greeter::Stub> stub_;
};

#endif // GREETERCLIENT_H
