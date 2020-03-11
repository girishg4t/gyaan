
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

Pending	: The Pod has been accepted by the Kubernetes system, but one or more of the Container images has not been created. This includes time before being scheduled as well as time spent downloading images over the network, which could take a while.
Running	: The Pod has been bound to a node, and all of the Containers have been created. At least one Container is still running, or is in the process of starting or restarting.
Succeeded :	All Containers in the Pod have terminated in success, and will not be restarted.
Failed :	All Containers in the Pod have terminated, and at least one Container has terminated in failure. That is, the Container either exited with non-zero status or was terminated by the system.
Unknown	: For some reason the state of the Pod could not be obtained, typically due to an error in communicating with the host of the Pod
