job "UI" {
  datacenters = ["dc1"]

  group "Conv-UI" {
    count = 1
    network {
      mbits = 10
      #I am setting the network speed for this container at 10 Megabits/sec
      port "db" {
        #to = 7443
        static = 5000
      }
    }

    # Specifying disk size
    ephemeral_disk {
      // Disk size 200 MB
      size = 200
    }

    restart {
      attempts = 0
      #Mode = "fail"
      #delay    = "10s"
    }

    task "ui" {
      driver = "exec"

      config {
        command = "/bin/bash"
        args    = ["-c", "cd /home/koy5cob/BoCSE/WebApp/bin/Debug/net6.0 && /usr/bin/dotnet WebApp.dll"]
      }

      resources {
        cpu    = 100
        memory = 256
      }
    }
  }
}