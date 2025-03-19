resource "kubernetes_namespace" "longhorn-ns" {
  metadata {
    name = "longhorn-system"
  }
}

resource "helm_release" "longhorn" {
  name        = "longhorn"
  namespace   = kubernetes_namespace.longhorn-ns.id
  repository  = "https://charts.longhorn.io"
  chart       = "longhorn"

  set {
    name  = "defaultSettings.defaultDataPath"
    value = "/opt"
  }
}
