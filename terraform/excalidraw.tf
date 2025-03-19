resource "kubernetes_namespace" "excalidraw-ns" {
  metadata {
    name = "excalidraw-ns"
  }
}

resource "helm_release" "excalidraw" {
  name        = "excalidraw"
  namespace   = kubernetes_namespace.excalidraw-ns.id
  repository  = "https://pmoscode-helm.github.io/excalidraw/"
  chart       = "excalidraw"

  set {
    name  = "ingress.enabled"
    value = "true"
  }

  set {
    name  = "ingress.hosts[0].host"
    value = "excalidraw.${var.domain}"
  }

  set {
    name  = "ingress.hosts[0].paths[0].path"
    value = "/"
  }

  set {
    name  = "ingress.hosts[0].paths[0].pathType"
    value = "Prefix"
  }
}
