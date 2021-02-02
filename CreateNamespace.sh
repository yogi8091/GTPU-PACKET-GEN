echo " == Creating the VETH Pair == "
ip link add veth0 type veth peer name veth1

ip link add veth0 type veth peer name veth1

echo " == Creating the LEFT_NS == "
ip netns add LEFT_NS
echo " == Assign veth0 to LEFT_NS == "
ip link set veth0 netns LEFT_NS
ip netns exec LEFT_NS ip addr add 192.168.50.100/24 dev veth0
ip netns exec LEFT_NS ip link set dev veth0 up


echo " == Creating the RIGHT_NS == "
ip netns add RIGHT_NS
echo " == Assign veth1 to LEFT_NS == "
ip link set veth1 netns RIGHT_NS
ip netns exec RIGHT_NS ip addr add 192.168.50.200/24 dev veth1
ip netns exec RIGHT_NS ip link set dev veth1 up

