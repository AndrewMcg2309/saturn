module "public_application_records" {
  source  = "terraform-aws-modules/route53/aws//modules/records"
  zone_id = var.hosted_zone

  records = [
    {
      type = "A"
      name = "andrewmcgowan.ie"

      alias = {
        name                   = module.public_traefik_alb.lb_dns_name
        zone_id                = module.public_traefik_alb.lb_zone_id
        evaluate_target_health = true
      }
    }
  ]
}
