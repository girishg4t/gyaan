### Init Containers ->
specialized containers that run before app containers in a Pod . Init containers can contain utilities or setup scripts not present in an app image.
Init containers are exactly like regular containers, except:
    Init containers always run to completion.
    Each init container must complete successfully before the next one starts.
- Init containers can contain utilities or custom code for setup that are not present in an app image.

Example :
```
Spec:  
initContainers:
  - name: init-myservice
 image: busybox:1.28
```  

### probes ->

Container probes
A Probe is a diagnostic performed periodically by the kubelet on a Container. To perform a diagnostic, the kubelet calls a Handler implemented by the Container. There are three types of handlers:

    ExecAction: Executes a specified command inside the Container. The diagnostic is considered successful if the command exits with a status code of 0.

    TCPSocketAction: Performs a TCP check against the Container’s IP address on a specified port. The diagnostic is considered successful if the port is open.

    HTTPGetAction: Performs an HTTP Get request against the Container’s IP address on a specified port and path. The diagnostic is considered successful if the response has a status code greater than or equal to 200 and less than 400.

Each probe has one of three results:

    Success: The Container passed the diagnostic.
    Failure: The Container failed the diagnostic.
    Unknown: The diagnostic failed, so no action should be taken.
The kubelet can optionally perform and react to three kinds of probes on running Containers:

    livenessProbe: Indicates whether the Container is running. If the liveness probe fails, the kubelet kills the Container, and the Container is subjected to its restart policy. If a Container does not provide a liveness probe, the default state is Success.

    readinessProbe: Indicates whether the Container is ready to service requests. If the readiness probe fails, the endpoints controller removes the Pod’s IP address from the endpoints of all Services that match the Pod. The default state of readiness before the initial delay is Failure. If a Container does not provide a readiness probe, the default state is Success.

    startupProbe: Indicates whether the application within the Container is started. All other probes are disabled if a startup probe is provided, until it succeeds. If the startup probe fails, the kubelet kills the Container, and the Container is subjected to its restart policy. If a Container does not provide a startup probe, the default state is Success


- Define a liveness command
Many applications running for long periods of time eventually transition to broken states, and cannot recover except by being restarted. Kubernetes provides liveness probes to detect and remedy such situations.
    - Define a liveness HTTP request  : Another kind of liveness probe uses an HTTP GET
    - Define a TCP liveness probe : A third type of liveness probe uses a TCP Socket.

- Startup probes
Sometimes, you have to deal with legacy applications that might require an additional startup time on their first initialization. In such cases, it can be tricky to set up liveness probe parameters without compromising the fast response to deadlocks that motivated such a probe

- Define readiness probes
Sometimes, applications are temporarily unable to serve traffic. For example, an application might need to load large data or configuration files during startup, or depend on external services after startup. In such cases, you don’t want to kill the application, but you don’t want to send it requests either. Kubernetes provides readiness probes to detect and mitigate these situations. A pod with containers reporting that they are not ready does not receive traffic through Kubernetes Services.

Example :  
```
livenessProbe:
  httpGet:
    path: /healthz
    port: liveness-port
  failureThreshold: 1
  periodSeconds: 10

startupProbe:
  httpGet:
    path: /healthz
    port: liveness-port
  failureThreshold: 30
  periodSeconds: 10

readinessProbe:
  exec:
    command:
    - cat
    - /tmp/healthy
  initialDelaySeconds: 5
  periodSeconds: 5
```

### PodPresets ->
which are objects for injecting certain information into pods at creation time. The information can include secrets, volumes, volume mounts, and environment variables.

Example :  
```
apiVersion: settings.k8s.io/v1alpha1
kind: PodPreset
metadata:
  name: allow-database
spec:
  selector:
    matchLabels:
      role: frontend
  env:
    - name: DB_PORT
      value: "6379"
  volumeMounts:
    - mountPath: /cache
      name: cache-volume
  volumes:
    - name: cache-volume
      emptyDir: {}
```

The new PodPreset will act upon any pod that has label role: frontend.

```
apiVersion: v1
kind: Pod
metadata:
  name: website
  labels:
    app: website
    role: frontend
spec:
  containers:
    - name: website
      image: nginx
      ports:
        - containerPort: 80
```

### PodLifecycle states ->

The phase of a Pod is a simple, high-level summary of where the Pod is in its lifecycle. The phase is not intended to be a comprehensive rollup of observations of Container or Pod state, nor is it intended to be a comprehensive state machine

Pending    : The Pod has been accepted by the Kubernetes system, but one or more of the Container images has not been created. This includes time before being scheduled as well as time spent downloading images over the network, which could take a while.
Running    : The Pod has been bound to a node, and all of the Containers have been created. At least one Container is still running, or is in the process of starting or restarting.
Succeeded :    All Containers in the Pod have terminated in success, and will not be restarted.
Failed :    All Containers in the Pod have terminated, and at least one Container has terminated in failure. That is, the Container either exited with non-zero status or was terminated by the system.
Unknown    : For some reason the state of the Pod could not be obtained, typically due to an error in communicating with the host of the Pod

### Kubernetes API server ->

In Kubernetes, everything is an API call served by the Kubernetes API server (kube-apiserver). The API server is a gateway to an etcd datastore that maintains the desired state of your application cluster. To update the state of a Kubernetes cluster, you make API calls to the API server describing your desired state.

### Controller ->
 when you create a new Pod using the API server, the Kubernetes scheduler (a controller) notices the change and makes a decision about where to place the Pod in the cluster. It then writes that state change using the API server (backed by etcd). The kubelet (a controller) then notices that new change and sets up the required networking functionality to make the Pod reachable within the cluster. Here, two separate controllers react to two separate state changes to make the reality of the cluster match the intention of the user.

### Kubernetes Networking ->



### Pause Container -> 
In Kubernetes, the pause container serves as the "parent container" for all of the containers in your pod. The pause container has two core responsibilities. First, it serves as the basis of Linux namespace sharing in the pod. And second, with PID (process ID) namespace sharing enabled, it serves as PID 1 for each pod and reaps zombie processes.

The pause container is a container which holds the network namespace
for the pod.  It does nothing 'useful'.  (It's actually just a little
bit of assembly that goes to sleep and never wakes up)

This means that your 'apache' container can die, and come back to
life, and all of the network setup will still be there.  Normally if
the last process in a network namespace dies the namespace would be
destroyed and creating a new apache container would require creating
all new network setup.  With pause, you'll always have that one last
thing in the namespace. 


### ReplicaSet ->  
ReplicaSet can also manage the pod which are not created as the part of replicaset i.e. why they have selector section init.
A ReplicaSet’s purpose is to maintain a stable set of replica Pods running at any given time. As such, it is often used to guarantee the availability of a specified number of identical Pods.
Deployment is an object which can own ReplicaSets and update them and their Pods via declarative, server-side rolling updates. While ReplicaSets can be used independently, today they’re mainly used by Deployments as a mechanism to orchestrate Pod creation, deletion and updates. When you use Deployments you don’t have to worry about managing the ReplicaSets that they create. Deployments own and manage their ReplicaSets.

### Replication Controller ->
A ReplicationController ensures that a specified number of pod replicas are running at any one time. In other words, a ReplicationController makes sure that a pod or a homogeneous set of pods is always up and available.  

A ReplicationController is similar to a process supervisor, but instead of supervising individual processes on a single node, the ReplicationController supervises multiple pods across multiple nodes.  

Deployment is a higher-level API object that updates its underlying Replica Sets and their Pods in a similar fashion as kubectl rolling-update. Deployments are recommended if you want this rolling update functionality, because unlike kubectl rolling-update, they are declarative, server-side, and have additional features  

### Deployment -> 

A Deployment provides declarative updates for Pods and ReplicaSets.

You describe a desired state in a Deployment, and the Deployment Controller changes the actual state to the desired state at a controlled rate. You can define Deployments to create new ReplicaSets, or to remove existing Deployments and adopt all their resources with new Deployments.


### DaemonSet -> 
When using Kubernetes, most of the time you don’t care where your pods are running, but sometimes you want to run a single pod on all your nodes. For example, you might want to run fluentd on all your nodes to collect logs, or you might want to run a monitoring process like the Datadog agent. In these cases, using a DaemonSet tells Kubernetes to make sure there is one instance of the pod on nodes in your cluster.

A DaemonSet ensures that all (or some) Nodes run a copy of a Pod. As nodes are added to the cluster, Pods are added to them. As nodes are removed from the cluster, those Pods are garbage collected. Deleting a DaemonSet will clean up the Pods it created.
Some typical uses of a DaemonSet are:
running a cluster storage daemon, such as glusterd, ceph, on each node.
running a logs collection daemon on every node, such as fluentd or logstash.
running a node monitoring daemon on every node, such as Prometheus Node Exporter,

### Headless Service -> 
Sometimes you don’t need load-balancing and a single Service IP. In this case, you can create what are termed “headless” Services, by explicitly specifying "None" for the cluster IP (.spec.clusterIP).
You can use a headless Service to interface with other service discovery mechanisms, without being tied to Kubernetes’ implementation.

### StatefulSets -> 
This help to solve the porblem replication, since deployment create pod randomly so slaves can not perform replication as if master dies and new master is up with new name so slaves cannot perform replication now, so solve this problem in stateful sets each pod comes up with unique name (sticky identity ) and even if that pods dies it will come up with the same name again


StatefulSet is the workload API object used to manage stateful applications.
Manages the deployment and scaling of a set of Pods , and provides guarantees about the ordering and uniqueness of these Pods.
Like a Deployment , a StatefulSet manages Pods that are based on an identical container spec. Unlike a Deployment, a StatefulSet maintains a sticky identity for each of their Pods. These pods are created from the same spec, but are not interchangeable: each has a persistent identifier that it maintains across any rescheduling.

### CR ->  
Custom resources are extensions of the Kubernetes API.  Once a custom resource is installed, users can create and access its objects using kubectl, just as they do for built-in resources like Pods.

Custom controllers
On their own, custom resources simply let you store and retrieve structured data. When you combine a custom resource with a custom controller, custom resources provide a true declarative API.

Kubernetes provides two ways to add custom resources to your cluster:

CRDs are simple and can be created without any programming.
API Aggregation requires programming, but allows more control over API behaviors like how data is stored and conversion between API versions.

A declarative API allows you to declare or specify the desired state of your resource and tries to keep the current state of Kubernetes objects in sync with the desired state. The controller interprets the structured data as a record of the user's desired state, and continually maintains this state.

### CRD ->  
When you create a new CustomResourceDefinition (CRD), the Kubernetes API Server creates a new RESTful resource path for each version you specify. The CRD can be either namespaced or cluster-scoped, as specified in the CRD's scope field.

Create custom objects, After the CustomResourceDefinition object has been created, you can create custom objects. Custom objects can contain custom fields. These fields can contain arbitrary JSON.
