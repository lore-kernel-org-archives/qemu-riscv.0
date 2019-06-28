Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hgulC-0000WF-OI
	for mharc-qemu-riscv@gnu.org; Fri, 28 Jun 2019 13:34:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55027)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hgul5-0000EW-Jw
 for qemu-riscv@nongnu.org; Fri, 28 Jun 2019 13:34:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hgul2-0000mN-DC
 for qemu-riscv@nongnu.org; Fri, 28 Jun 2019 13:33:59 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:41711)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hgul2-0000fR-71
 for qemu-riscv@nongnu.org; Fri, 28 Jun 2019 13:33:56 -0400
Received: by mail-pf1-f195.google.com with SMTP id m30so3319973pff.8
 for <qemu-riscv@nongnu.org>; Fri, 28 Jun 2019 10:33:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=8AbRazPuGbBA4/wcOJ0NXPkCs6Kyha3rsVtogdXoPZc=;
 b=l+V+asTgoDy7E1rCU0Y42qGSjjldR0s0c0WUoIQSHukr8d7OimP/a+Q7+0wrm9vIjG
 HMMaV8Oc+tZkRRQYpPj58uy6ixXo0pcD19feGzTLoTzn+12uDr+g2dwA+bKjqm8IdDSl
 JAiHpm4kgB2+GK4fo3K29vYXrTaEB3Bc5AfTFXWaXYvvvKLp27eC3ABlCYv4uSCBfA2J
 8quncA60fs/j6I/oHmSt8HHJFWlPBbDOOehOU7qHXjUcjAAhdP6q97+O8k9nLYLmvBsq
 u2kHmCy813SYoCbXSa0a/yFk8tNOMrgUtPLak4qBy+hWEJa993S5uy/dCNVVQXtAuk0F
 BOcQ==
X-Gm-Message-State: APjAAAWp6hpgoCmzbLxq7MC/bYSeyRyo+kQLejWKtm9CiZKfhg4GrJfM
 /Y3p/VzELqOmtkPREagkoy8E9A==
X-Google-Smtp-Source: APXvYqxfodMerfjoAXuAZBJVvxFtBLdj0y5A0PYRaLJYrY0ggS0qGIs+o+tz1+mErYtldZexIfaOsw==
X-Received: by 2002:a63:c20e:: with SMTP id b14mr10160941pgd.96.1561743230047; 
 Fri, 28 Jun 2019 10:33:50 -0700 (PDT)
Received: from localhost (220-132-236-182.HINET-IP.hinet.net.
 [220.132.236.182])
 by smtp.gmail.com with ESMTPSA id i14sm4626583pfk.0.2019.06.28.10.33.49
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 28 Jun 2019 10:33:49 -0700 (PDT)
Date: Fri, 28 Jun 2019 10:32:18 -0700
Message-Id: <20190628173227.31925-26-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190628173227.31925-1-palmer@sifive.com>
References: <20190628173227.31925-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-devel@nongnu.org,       qemu-riscv@nongnu.org,
 Atish Patra <atish.patra@wdc.com>, Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.210.195
Subject: [Qemu-riscv] [PULL 25/34] riscv: virt: Add cpu-topology DT node.
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 28 Jun 2019 17:34:02 -0000

From: Atish Patra <atish.patra@wdc.com>

Currently, there is no cpu topology defined in RISC-V.
Define a device tree node that clearly describes the
entire topology. This saves the trouble of scanning individual
cache to figure out the topology.

Here is the linux kernel patch series that enables topology
for RISC-V.

http://lists.infradead.org/pipermail/linux-riscv/2019-June/005072.html

CPU topology after applying this patch in QEMU & above series in kernel

/ # cat /sys/devices/system/cpu/cpu2/topology/thread_siblings_list
2
/ # cat /sys/devices/system/cpu/cpu2/topology/physical_package_id
0
/ # cat /sys/devices/system/cpu/cpu2/topology/core_siblings_list
0-7

Signed-off-by: Atish Patra <atish.patra@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 hw/riscv/virt.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 487f61404b21..28d96daf8c5b 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -191,6 +191,7 @@ static void *create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
 
     for (cpu = s->soc.num_harts - 1; cpu >= 0; cpu--) {
         int cpu_phandle = phandle++;
+        int intc_phandle;
         nodename = g_strdup_printf("/cpus/cpu@%d", cpu);
         char *intc = g_strdup_printf("/cpus/cpu@%d/interrupt-controller", cpu);
         char *isa = riscv_isa_string(&s->soc.harts[cpu]);
@@ -203,9 +204,12 @@ static void *create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
         qemu_fdt_setprop_string(fdt, nodename, "status", "okay");
         qemu_fdt_setprop_cell(fdt, nodename, "reg", cpu);
         qemu_fdt_setprop_string(fdt, nodename, "device_type", "cpu");
+        qemu_fdt_setprop_cell(fdt, nodename, "phandle", cpu_phandle);
+        qemu_fdt_setprop_cell(fdt, nodename, "linux,phandle", cpu_phandle);
+        intc_phandle = phandle++;
         qemu_fdt_add_subnode(fdt, intc);
-        qemu_fdt_setprop_cell(fdt, intc, "phandle", cpu_phandle);
-        qemu_fdt_setprop_cell(fdt, intc, "linux,phandle", cpu_phandle);
+        qemu_fdt_setprop_cell(fdt, intc, "phandle", intc_phandle);
+        qemu_fdt_setprop_cell(fdt, intc, "linux,phandle", intc_phandle);
         qemu_fdt_setprop_string(fdt, intc, "compatible", "riscv,cpu-intc");
         qemu_fdt_setprop(fdt, intc, "interrupt-controller", NULL, 0);
         qemu_fdt_setprop_cell(fdt, intc, "#interrupt-cells", 1);
@@ -214,6 +218,20 @@ static void *create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
         g_free(nodename);
     }
 
+    /* Add cpu-topology node */
+    qemu_fdt_add_subnode(fdt, "/cpus/cpu-map");
+    qemu_fdt_add_subnode(fdt, "/cpus/cpu-map/cluster0");
+    for (cpu = s->soc.num_harts - 1; cpu >= 0; cpu--) {
+        char *core_nodename = g_strdup_printf("/cpus/cpu-map/cluster0/core%d",
+                                              cpu);
+        char *cpu_nodename = g_strdup_printf("/cpus/cpu@%d", cpu);
+        uint32_t intc_phandle = qemu_fdt_get_phandle(fdt, cpu_nodename);
+        qemu_fdt_add_subnode(fdt, core_nodename);
+        qemu_fdt_setprop_cell(fdt, core_nodename, "cpu", intc_phandle);
+        g_free(core_nodename);
+        g_free(cpu_nodename);
+    }
+
     cells =  g_new0(uint32_t, s->soc.num_harts * 4);
     for (cpu = 0; cpu < s->soc.num_harts; cpu++) {
         nodename =
-- 
2.21.0


