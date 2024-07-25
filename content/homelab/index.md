---
title: Home Lab
description: My home lab was designed to test enterprise-style challenges
date: 2024-07-27T00:00:00
menu:
  main:
    weight: 40
---

The Origin
----------

My home lab was born [from a need](/#about) to quickly learn how to troubleshoot
challenging issues faced by enterprise networks, primarily because I was the only
Linux administrator in a company of 24k employees despite being freshly out of
college. This lab allowed me to replicate simplified versions of issues that were
observed in the workplace and gave me the flexibility to experiment with more
significant changes that required much more planning.

This lab paved my way into configuration management systems, so that I could find
a way to replace an unreliable "tarball-series" deployment strategy used across
many routinely failing servers.

Network Growth
--------------

As time went on, my home lab grew to include those more "critical core services"
that are often vital to enterprise operations. These services were implemented
with both physical and virtual redundancy, using every best practice I could
justify deploying. At one point, I even had three ISPs and a pair of wireless
access points.

**Network Diagram**:

![Network Diagram](/homelab/network.webp)

My ultimate goal became a robust and secure hybrid cload that was deployed and
maintained entirely from automation. I was able to deploy brand new clustered
services locally or remotely just by defining devices in inventory management,
and I made all changes using version control, and reviewed logs to verify success.

**Netbox Inventory**:

<a href="/homelab/netbox.webp">
   <img src="/homelab/netbox_thumb.webp" alt="Netbox Inventory"></a>

The journey of learning included:

- Out-of-Band network management using Raspberry Pi and cellular modem
- To Do ...

Some Photos
-----------

<table>
  <tr><td colspan="2">(click/tap to view larger images)</td></tr>
  <tr>
    <td rowspan="2" width="50%"><a href="/homelab/rack.webp">
        <img src="/homelab/rack_thumb.webp" alt="Server Rack"></a>
    </td>
    <td><a href="/homelab/rack_behind.webp">
        <img src="/homelab/rack_behind_thumb.webp" alt="Behind of Server Rack"></a>
    </td>
  </tr>
  <tr>
    <td><a href="/homelab/ups.webp">
        <img src="/homelab/ups_thumb.webp" alt="Uninterruptible Power Supply"></a>
    </td>
  <tr>
  <tr>
    <td><a href="/homelab/oob.webp">
        <img src="/homelab/oob_thumb.webp" alt="Out-of-Band Management"></a>
    </td>
    <td><a href="/homelab/wap.webp">
        <img src="/homelab/wap_thumb.webp" alt="Wireless Access Point"></a>
    </td>
  </tr>
</table>
