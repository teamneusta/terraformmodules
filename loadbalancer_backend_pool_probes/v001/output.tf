output "data" {
  value = merge(
    {
      for probe in azurerm_lb_probe.probe :
      substr(probe.name, 0, length(probe.name) - 6) => {
        id   = probe.id
        name = substr(probe.name, 0, length(probe.name) - 6)
      }
    },
    {
      for probe in azurerm_lb_probe.probe_http :
      substr(probe.name, 0, length(probe.name) - 6) => {
        id   = probe.id
        name = substr(probe.name, 0, length(probe.name) - 6)
      }
  })
}
