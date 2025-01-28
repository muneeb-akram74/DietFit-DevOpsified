# 1st Issue
The first error I am facing is about port, let me explain the error and solution of it.
   
The **critical issue** occurs in the **final step**, which is trying to run the container:

### Error Explanation:
```
TASK [Run the DietFit container] ***************************************************************************************
fatal: [localhost]: FAILED! => {"changed": true, "cmd": ["docker", "run", "-d", "--name", "dietfit_container", "-p", "8080:80", "muneeb6774/dietfit:latest"], "delta": "0:00:00.280547", "end": "2025-01-28 11:02:15.101806", "msg": "non-zero return code", "rc": 125, "start": "2025-01-28 11:02:14.821259", "stderr": "docker: Error response from daemon: driver failed programming external connectivity on endpoint dietfit_container (f7a2f875f879d36951438b043e52f768e654b660855f4074aca73bbff96096f0): Bind for 0.0.0.0:8080 failed: port is already allocated.", "stderr_lines": ["docker: Error response from daemon: driver failed programming external connectivity on endpoint dietfit_container (f7a2f875f879d36951438b043e52f768e654b660855f4074aca73bbff96096f0): Bind for 0.0.0.0:8080 failed: port is already allocated."], "stdout": "e9fb9cd9fda6e12def4cc5b78bdc87e8b473bd22a75b5cfccdc2dbdca6b483f2", "stdout_lines": ["e9fb9cd9fda6e12def4cc5b78bdc87e8b473bd22a75b5cfccdc2dbdca6b483f2"]}
```

### What the error means:
- **Error Code 125**: This indicates that the Docker container failed to start due to an error in the command execution.
- **Error Message**: The error `Bind for 0.0.0.0:8080 failed: port is already allocated` means that Docker tried to bind port **8080** on the host system to port **80** in the container, but port **8080** is already being used by another service or container.

### How to fix it:
1. **Check which process is using port 8080**:
   You can find the process that is using port 8080 by running:
   ```bash
   sudo lsof -i :8080
   ```
   Or:
   ```bash
   sudo netstat -tuln | grep 8080
   ```

2. **Stop the process** using port 8080 if it's not required or change the port your Docker container is trying to bind to. For example, you can change the `docker run` command to use a different port like 8081:
   ```bash
   docker run -d --name dietfit_container -p 8081:80 muneeb6774/dietfit:latest
   ```

3. **Remove any containers using port 8080**: If there is an old container using port 8080, you can stop and remove it:
   ```bash
   docker ps  # list running containers
   docker stop <container_id>  # stop the container
   docker rm <container_id>  # remove the container
   ```

   In my opinio, the most reliable and better way is to change the port to 8081.

Once we have cleared the port or changed it, try running the playbook again. It will certaily run successfully.

--- --- --- ---
--- --- --- ---
