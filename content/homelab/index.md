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

My home lab developed out of [my need](/#about) to quickly learn how to
troubleshoot complex issues in enterprise networks. As the only Linux
administrator in a company of 24,000 employees, I faced unique challenges,
especially as a recent college graduate. This lab allowed me to simulate
simplified versions of the issues encountered at work and provided the
flexibility to experiment with larger changes that required careful planning.

This lab allowed me to explore configuration management systems, which helped
me find a more reliable replacement for the “tarball-series” deployment
strategy that was in use.

Network Growth
--------------

As time went on, my home lab expanded to include essential services crucial
for enterprise operations. I implemented both physical and virtual redundancy,
adhering to best practices wherever possible. At one point, I was managing
connections from three ISPs, alongside a couple of wireless access points.

**Network Diagram**:

![Network Diagram](/homelab/network.webp)

My ultimate goal has been a robust and secure hybrid cloud environment, fully automated for deployment and maintenance. I developed the capability to deploy new clustered services, both locally and remotely, simply by defining devices in an inventory management system.



My ultimate goal became a robust and secure hybrid cload that was deployed and
maintained entirely from automation. I was able to deploy brand new clustered
services locally or remotely just by defining devices in inventory management,
and then make any modifications using version control.

**Netbox Inventory**:

<a href="/homelab/netbox.webp">
   <img src="/homelab/netbox_thumb.webp" alt="Netbox Inventory"></a>

The journey of learning included:

- Out-of-Band network management using Raspberry Pi and cellular modem
- Automated deployment and configuration of physical, virtual, andcloud resources
- Encrypted off-site backups using a variety of cost-saving measures
- Exploring how malware behaves in various simulated environments
- VLAN and subnet management using different routing solutions
- Every best practice I could find, including a subnet with every silly option applied
- Cost analysis to determine exact break-even points between self-hosted, VPS, and cloud
- Modified UPS that was able to supply four days of run time on batter power

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
