Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hiaqP-0006oQ-OZ
	for mharc-qemu-riscv@gnu.org; Wed, 03 Jul 2019 04:42:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51706)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hiaq9-0006Rl-4g
 for qemu-riscv@nongnu.org; Wed, 03 Jul 2019 04:42:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hiaq6-0008F8-2J
 for qemu-riscv@nongnu.org; Wed, 03 Jul 2019 04:42:09 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:45533)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hiaq5-0007jh-OK
 for qemu-riscv@nongnu.org; Wed, 03 Jul 2019 04:42:05 -0400
Received: by mail-lj1-f196.google.com with SMTP id m23so1442224lje.12
 for <qemu-riscv@nongnu.org>; Wed, 03 Jul 2019 01:41:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=8AbRazPuGbBA4/wcOJ0NXPkCs6Kyha3rsVtogdXoPZc=;
 b=ZOzTNVE+/1S5ZAQX1/z6tTd2R6oL7whGXLbu3ogXgI1zxYWTNt9tvjk/Al4DjnYfnC
 GBVhY1wbQBKJfcMSjyJ7vIj70TPzpWbEY6aglyX3MwXWws4w6qcyFHWfTxFCUGmEcXgD
 2HqNBkAmAL9L7cTOBnsJtG6+3dmeoKxt91SVl9kTFar+k0IjaQXfpkfRycpfcuK/qhro
 BTtmT21hEaPTzGDDZi99Z7UKn7Or414acAGbu05I1QzkWMW/LZ2tyOnKrhuoKJD2jfel
 TyvW53h760xWSo4ha4Y53yJEldSCF/lMGAd6iZwy54uQLwD6R2gtHsqvOvZsQK/18eWi
 MlkA==
X-Gm-Message-State: APjAAAVWtL8YoajdFsSRMBRYTTORLVbKRuewbONMeXfD/dbgLSCVhou+
 siej7tzdB+dDVbD2NtKMdLj6dw==
X-Google-Smtp-Source: APXvYqyntEe6/cQ3QzcERYAO3kMrAmy4lREpqg2kj8uDd6qVasZewNi+/M1+ksf8IyVIkrpBJ7yBMA==
X-Received: by 2002:a2e:9b84:: with SMTP id z4mr20728835lji.75.1562143313867; 
 Wed, 03 Jul 2019 01:41:53 -0700 (PDT)
Received: from localhost ([134.17.27.127])
 by smtp.gmail.com with ESMTPSA id o24sm326736ljg.6.2019.07.03.01.41.52
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 03 Jul 2019 01:41:53 -0700 (PDT)
Date: Wed,  3 Jul 2019 01:40:41 -0700
Message-Id: <20190703084048.6980-26-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190703084048.6980-1-palmer@sifive.com>
References: <20190703084048.6980-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-devel@nongnu.org,       qemu-riscv@nongnu.org,
 Atish Patra <atish.patra@wdc.com>, Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.208.196
Subject: [Qemu-riscv] [PULL 25/32] riscv: virt: Add cpu-topology DT node.
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
X-List-Received-Date: Wed, 03 Jul 2019 08:42:13 -0000

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


