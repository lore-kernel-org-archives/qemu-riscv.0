Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA95DEDE98C
	for <qemu-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 08:08:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qghOK-0001Lq-7r; Thu, 14 Sep 2023 04:08:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nikita.shubin@maquefel.me>)
 id 1qghOF-0001KN-Jk; Thu, 14 Sep 2023 04:07:56 -0400
Received: from forward500b.mail.yandex.net ([178.154.239.144])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nikita.shubin@maquefel.me>)
 id 1qghOC-0006bc-1i; Thu, 14 Sep 2023 04:07:55 -0400
Received: from mail-nwsmtp-smtp-production-main-87.sas.yp-c.yandex.net
 (mail-nwsmtp-smtp-production-main-87.sas.yp-c.yandex.net
 [IPv6:2a02:6b8:c08:9396:0:640:dd2a:0])
 by forward500b.mail.yandex.net (Yandex) with ESMTP id B26775F44D;
 Thu, 14 Sep 2023 11:07:44 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-87.sas.yp-c.yandex.net
 (smtp/Yandex) with ESMTPSA id e7bUnJIDWmI0-ciehItRr; 
 Thu, 14 Sep 2023 11:07:44 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail;
 t=1694678864; bh=895IpPp3dk48HzdPUE7ryLM47FTpnsIu5w75agZ7u9U=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=c9JrbuEQL0Kchc8CgJ8ke4F4ygUo8qmVeOLW6+ZKmSUAJA7FPCGaYnE3aHd7lB9zN
 52Q8cbR7D+XEiFnB5fd3OIxGMl3r2t0dDR7omxLwkRdnTAf8N+7/gi8wiSPNwZb1CX
 7WBusQ0v5C17tlKo+jRfBTtNDlBiuhIN+MAVggt4=
Authentication-Results: mail-nwsmtp-smtp-production-main-87.sas.yp-c.yandex.net;
 dkim=pass header.i=@maquefel.me
From: Nikita Shubin <nikita.shubin@maquefel.me>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Sunil V L <sunilvl@ventanamicro.com>
Cc: Nikita Shubin <n.shubin@yadro.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Subject: [RFC PATCH v2 1/2] hw/riscv: hart: replace array access with
 qemu_get_cpu()
Date: Thu, 14 Sep 2023 11:07:39 +0300
Message-Id: <20230914080740.7561-2-nikita.shubin@maquefel.me>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230914080740.7561-1-nikita.shubin@maquefel.me>
References: <20230914080740.7561-1-nikita.shubin@maquefel.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.144;
 envelope-from=nikita.shubin@maquefel.me; helo=forward500b.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

From: Nikita Shubin <n.shubin@yadro.com>

Replace all RISCVHartArrayState->harts[idx] with
qemu_get_cpu()/cpu_by_arch_id().

cpu_index is guaranteed to be continuus by cpu_get_free_index(), so they
can be accessed in same order they were added.

"Hart IDs might not necessarily be numbered contiguously in a
multiprocessor system, but at least one hart must have
a hart ID of zero."

This states that hart ID zero should always be present, this makes using
cpu_by_arch_id(0) safe.

Signed-off-by: Nikita Shubin <n.shubin@yadro.com>
---
 hw/riscv/boot.c            |  6 ++++--
 hw/riscv/sifive_u.c        |  7 +++++--
 hw/riscv/spike.c           | 17 ++++++++++-------
 hw/riscv/virt-acpi-build.c |  2 +-
 hw/riscv/virt.c            | 17 +++++++++--------
 5 files changed, 29 insertions(+), 20 deletions(-)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 52bf8e67de..041f966e58 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -36,7 +36,8 @@
 
 bool riscv_is_32bit(RISCVHartArrayState *harts)
 {
-    return harts->harts[0].env.misa_mxl_max == MXL_RV32;
+    RISCVCPU *hart = RISCV_CPU(cpu_by_arch_id(0));
+    return hart->env.misa_mxl_max == MXL_RV32;
 }
 
 /*
@@ -385,6 +386,7 @@ void riscv_setup_rom_reset_vec(MachineState *machine, RISCVHartArrayState *harts
                                uint64_t fdt_load_addr)
 {
     int i;
+    RISCVCPU *hart = RISCV_CPU(cpu_by_arch_id(0));
     uint32_t start_addr_hi32 = 0x00000000;
     uint32_t fdt_load_addr_hi32 = 0x00000000;
 
@@ -414,7 +416,7 @@ void riscv_setup_rom_reset_vec(MachineState *machine, RISCVHartArrayState *harts
         reset_vec[4] = 0x0182b283;   /*     ld     t0, 24(t0) */
     }
 
-    if (!harts->harts[0].cfg.ext_icsr) {
+    if (!hart->cfg.ext_icsr) {
         /*
          * The Zicsr extension has been disabled, so let's ensure we don't
          * run the CSR instruction. Let's fill the address with a non
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index ec76dce6c9..3d09d0ee0e 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -168,6 +168,7 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
     qemu_fdt_setprop_cell(fdt, "/cpus", "#address-cells", 0x1);
 
     for (cpu = ms->smp.cpus - 1; cpu >= 0; cpu--) {
+        RISCVCPU *hart;
         int cpu_phandle = phandle++;
         nodename = g_strdup_printf("/cpus/cpu@%d", cpu);
         char *intc = g_strdup_printf("/cpus/cpu@%d/interrupt-controller", cpu);
@@ -180,9 +181,11 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
             } else {
                 qemu_fdt_setprop_string(fdt, nodename, "mmu-type", "riscv,sv48");
             }
-            isa = riscv_isa_string(&s->soc.u_cpus.harts[cpu - 1]);
+            hart = RISCV_CPU(qemu_get_cpu(cpu - 1));
+            isa = riscv_isa_string(hart);
         } else {
-            isa = riscv_isa_string(&s->soc.e_cpus.harts[0]);
+            hart = RISCV_CPU(qemu_get_cpu(0));
+            isa = riscv_isa_string(hart);
         }
         qemu_fdt_setprop_string(fdt, nodename, "riscv,isa", isa);
         qemu_fdt_setprop_string(fdt, nodename, "compatible", "riscv");
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index 81f7e53aed..f3ec6427a1 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -97,29 +97,32 @@ static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
     qemu_fdt_add_subnode(fdt, "/cpus/cpu-map");
 
     for (socket = (riscv_socket_count(ms) - 1); socket >= 0; socket--) {
+        uint32_t num_harts = s->soc[socket].num_harts;
+        uint32_t hartid_base = s->soc[socket].hartid_base;
+
         clust_name = g_strdup_printf("/cpus/cpu-map/cluster%d", socket);
         qemu_fdt_add_subnode(fdt, clust_name);
 
-        clint_cells =  g_new0(uint32_t, s->soc[socket].num_harts * 4);
+        clint_cells =  g_new0(uint32_t, num_harts * 4);
 
-        for (cpu = s->soc[socket].num_harts - 1; cpu >= 0; cpu--) {
+        for (cpu = num_harts - 1; cpu >= 0; cpu--) {
+            int cpu_index = hartid_base + cpu;
+            RISCVCPU *hart = RISCV_CPU(qemu_get_cpu(cpu_index));
             cpu_phandle = phandle++;
 
-            cpu_name = g_strdup_printf("/cpus/cpu@%d",
-                s->soc[socket].hartid_base + cpu);
+            cpu_name = g_strdup_printf("/cpus/cpu@%d", cpu_index);
             qemu_fdt_add_subnode(fdt, cpu_name);
             if (is_32_bit) {
                 qemu_fdt_setprop_string(fdt, cpu_name, "mmu-type", "riscv,sv32");
             } else {
                 qemu_fdt_setprop_string(fdt, cpu_name, "mmu-type", "riscv,sv48");
             }
-            name = riscv_isa_string(&s->soc[socket].harts[cpu]);
+            name = riscv_isa_string(hart);
             qemu_fdt_setprop_string(fdt, cpu_name, "riscv,isa", name);
             g_free(name);
             qemu_fdt_setprop_string(fdt, cpu_name, "compatible", "riscv");
             qemu_fdt_setprop_string(fdt, cpu_name, "status", "okay");
-            qemu_fdt_setprop_cell(fdt, cpu_name, "reg",
-                s->soc[socket].hartid_base + cpu);
+            qemu_fdt_setprop_cell(fdt, cpu_name, "reg", cpu_index);
             qemu_fdt_setprop_string(fdt, cpu_name, "device_type", "cpu");
             riscv_socket_fdt_write_id(ms, cpu_name, socket);
             qemu_fdt_setprop_cell(fdt, cpu_name, "phandle", cpu_phandle);
diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
index 7331248f59..d885220cc9 100644
--- a/hw/riscv/virt-acpi-build.c
+++ b/hw/riscv/virt-acpi-build.c
@@ -158,7 +158,7 @@ static void build_rhct(GArray *table_data,
     isa_offset = table_data->len - table.table_offset;
     build_append_int_noprefix(table_data, 0, 2);   /* Type 0 */
 
-    cpu = &s->soc[0].harts[0];
+    cpu = RISCV_CPU(cpu_by_arch_id(0));
     isa = riscv_isa_string(cpu);
     len = 8 + strlen(isa) + 1;
     aligned_len = (len % 2) ? (len + 1) : len;
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 5edc1d98d2..f3132ecc1b 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -239,16 +239,18 @@ static void create_fdt_socket_cpus(RISCVVirtState *s, int socket,
     uint32_t cpu_phandle;
     MachineState *ms = MACHINE(s);
     char *name, *cpu_name, *core_name, *intc_name, *sv_name;
+    uint32_t num_harts = s->soc[socket].num_harts;
+    uint32_t hartid_base = s->soc[socket].hartid_base;
     bool is_32_bit = riscv_is_32bit(&s->soc[0]);
     uint8_t satp_mode_max;
 
-    for (cpu = s->soc[socket].num_harts - 1; cpu >= 0; cpu--) {
-        RISCVCPU *cpu_ptr = &s->soc[socket].harts[cpu];
+    for (cpu = num_harts - 1; cpu >= 0; cpu--) {
+        int cpu_index = hartid_base + cpu;
+        RISCVCPU *cpu_ptr = RISCV_CPU(qemu_get_cpu(cpu_index));
 
         cpu_phandle = (*phandle)++;
 
-        cpu_name = g_strdup_printf("/cpus/cpu@%d",
-            s->soc[socket].hartid_base + cpu);
+        cpu_name = g_strdup_printf("/cpus/cpu@%d", cpu_index);
         qemu_fdt_add_subnode(ms->fdt, cpu_name);
 
         if (cpu_ptr->cfg.satp_mode.supported != 0) {
@@ -275,8 +277,7 @@ static void create_fdt_socket_cpus(RISCVVirtState *s, int socket,
 
         qemu_fdt_setprop_string(ms->fdt, cpu_name, "compatible", "riscv");
         qemu_fdt_setprop_string(ms->fdt, cpu_name, "status", "okay");
-        qemu_fdt_setprop_cell(ms->fdt, cpu_name, "reg",
-            s->soc[socket].hartid_base + cpu);
+        qemu_fdt_setprop_cell(ms->fdt, cpu_name, "reg", cpu_index);
         qemu_fdt_setprop_string(ms->fdt, cpu_name, "device_type", "cpu");
         riscv_socket_fdt_write_id(ms, cpu_name, socket);
         qemu_fdt_setprop_cell(ms->fdt, cpu_name, "phandle", cpu_phandle);
@@ -717,12 +718,12 @@ static void create_fdt_pmu(RISCVVirtState *s)
 {
     char *pmu_name;
     MachineState *ms = MACHINE(s);
-    RISCVCPU hart = s->soc[0].harts[0];
+    RISCVCPU *hart = RISCV_CPU(qemu_get_cpu(0));
 
     pmu_name = g_strdup_printf("/pmu");
     qemu_fdt_add_subnode(ms->fdt, pmu_name);
     qemu_fdt_setprop_string(ms->fdt, pmu_name, "compatible", "riscv,pmu");
-    riscv_pmu_generate_fdt_node(ms->fdt, hart.cfg.pmu_num, pmu_name);
+    riscv_pmu_generate_fdt_node(ms->fdt, hart->cfg.pmu_num, pmu_name);
 
     g_free(pmu_name);
 }
-- 
2.39.2


