# escher.daemon or something like that

from subprocess import call


def list():
    call(["make", "list"])


def get_ip(id):
    call(["make", "get-ip", f'id="{id}"'])


def launch(image, instance_type, key, security_group, subnet):
    call(["make", "launch",
          f'image="{image}"',
          f'type="{instance_type}"',
          f'key="{key}"',
          f'security-group="{security_group}"',
          f'subnet="{subnet}"'
          ])


def destroy(id):
    call(["make", "destroy", f'id="{id}"'])


if __name__ == "__main__":
    id = "i-01a8284c1e5d9d963"
    get_ip(id)
    # for i in range(10):
    #     launch("ami-50552a2a", "p2.xlarge", "escherpad", "sg-e218a997", "subnet-78d3d250")
    destroy(id)
