region = "ap-south-1"

algorithm = "RSA"

rsa_bits = "4096"

ami_id = "ami-0a7cf821b91bcccbc"

instance_type = "t2.large"

vpc_name = "proton-stg-vpc"

subnet_names = ["proton-stg-subnet-public-ap-south-1a", "proton-stg-subnet-public-ap-south-1b", "proton-stg-subnet-public-ap-south-1c"]

vpc_cidr = "10.0.0.0/16"

subnet_cidr_blocks = ["10.0.0.0/20", "10.0.16.0/20", "10.0.32.0/20"]

availability_zones = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]

internet_gateway_name = "proton-igw"

route_table_name = "proton-stg-rt-public"

eip_names = ["proton-nifi-stg-eip", "proton-node-stg-eip", "proton-frontend-stg-eip", "proton-mongodb-stg-eip", "proton-debezium-stg-eip"]

key_names = ["proton-nifi-server-stg", "proton-node-server-stg", "proton-frontend-server-stg", "proton-mongodb-server-stg", "proton-debezium-server-stg"]

local_file_names = ["nifi-private-key", "node-private-key", "frontend-private-key", "mongodb-private-key", "debezium-private-key"]

volume_sizes = [30, 30, 30, 200, 30] # Set the volume sizes for each instance

instance_names = ["proton-nifi-server-stg", "proton-node-server-stg", "proton-frontend-server-stg", "proton-mongodb-server-stg", "proton-debezium-server-stg"]

# NIFI SG Ports and names
nifi_sg_ports = [22, 8765, 8883, 8080, 9092, 8787, 8443]
nifi_sg_name  = "proton-nifi-server-stg-SG"

# NODE SG Ports and names
node_sg_ports = [22, 80, 8083, 8080, 9092, 5601, 443, 9200, 3000, 29092]
node_sg_name  = "proton-node-server-stg-SG"

# FRONTEND SG Ports and names
frontend_sg_ports = [22, 3000]
frontend_sg_name  = "proton-frontend-server-stg-SG"

# MONGODB SG Ports and names
mongodb_sg_ports = [22, 80, 5044, 8080, 8200, 5601, 9200, 9300, 3001, 30001, 30002, 30003]
mongodb_sg_name  = "proton-mongodb-server-stg-SG"

# DEBEZIUM SG Ports and names
debezium_sg_ports = [22, 80, 8083, 8080, 9092, 5601, 9200, 3000, 29092]
debezium_sg_name  = "proton-debezium-server-stg-SG"
