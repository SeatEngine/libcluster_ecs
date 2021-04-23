defmodule ClusterEcsTest do
  use ExUnit.Case
  alias Cluster.Strategy.State

  # Need to figure out how to stub this out
  test "gets those ips" do
    state = %State {
      topology: ClusterEcs.Strategy,
      config: [
        cluster: "arn:aws:ecs:us-east-2:915236037149:cluster/staging-ecs-cluster",
        service_name: "-Dat2-",
        region: "us-east-2",
        app_prefix: "mega_maid",
      ]
    }

    assert {:ok, ips} = ClusterEcs.Strategy.get_nodes(state)
    assert MapSet.difference(MapSet.new([:"mega_maid@10.1.171.197", :"mega_maid@10.1.156.253"]), ips) == MapSet.new([])
  end
end
