To run tests locally, modify "tests/test.yaml" appropriately.

One simple way to run Riak locally is using Docker, with the

    https://github.com/hectcastro/docker-riak

image. Once installed, run

    DOCKER_RIAK_CLUSTER_SIZE=1 DOCKER_RIAK_SEARCH=on DOCKER_RIAK_BASE_HTTP_PORT=8097 DOCKER_RIAK_PROTO_BUF_PORT_OFFSET=-11 ./bin/start-cluster.sh

to launch a single Riak node, exposing ports 8098 and 8087 for HTTP and
protobufs, respectively.
