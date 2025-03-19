resource "kubernetes_namespace" "ittools-ns" {
  metadata {
    name = "ittools"
  }
}

resource "helm_release" "ittools" {
  name        = "it-tools"
  namespace   = kubernetes_namespace.ittools-ns.id
  repository  = "https://charts.plcnk.net"
  chart       = "it-tools"

  set {
    name  = "ingress.main.enabled"
    value = "true"
  }

  set {
    name  = "ingress.main.hosts[0].host"
    value = "tools.${var.domain}"
  }

  set {
    name  = "ingress.main.hosts[0].paths[0].path"
    value = "/"
  }

  set {
    name  = "ingress.main.hosts[0].paths[0].pathType"
    value = "Prefix"
  }

  set {
    name  = "ingress.main.hosts[0].paths[0].service.identifier"
    value = "main"
  }

  set {
    name  = "ingress.main.hosts[0].paths[0].service.port"
    value = "http"
  }
}
