from kubernetes import client, config

# test_capitalize.py

def capital_case(x):
    return x.capitalize()

def test_capital_case():
    assert capital_case('semaphore') == 'Semaphore'


def test_list_all_pods():
    # Configs can be set in Configuration class directly or using helper utility
    config.load_incluster_config()

    v1 = client.CoreV1Api()
    print("Listing pods with their IPs:")
    
    ret = v1.list_namespaced_pod("sonobuoy")
    for i in ret.items:
        print("%s\t%s\t%s" % (i.status.pod_ip, i.metadata.namespace, i.metadata.name))

    assert False