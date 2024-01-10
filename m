Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 811EFC3DA6E
	for <qemu-riscv@archiver.kernel.org>; Wed, 10 Jan 2024 10:27:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rNVnH-0001Va-HF; Wed, 10 Jan 2024 05:26:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <conor@kernel.org>)
 id 1rNVnB-0001TK-6K; Wed, 10 Jan 2024 05:26:37 -0500
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <conor@kernel.org>)
 id 1rNVn2-0002D8-E3; Wed, 10 Jan 2024 05:26:36 -0500
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 35D27B81D39;
 Wed, 10 Jan 2024 10:26:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61258C433C7;
 Wed, 10 Jan 2024 10:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1704882382;
 bh=uPSJ912E61NbL3SdyNp468Rm4sZc7AW7SrhxoDRUMQI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=W3xsss4hqo9INtOd534kPBiu1MD1d5vdtxCFziKW0BR6y9Ve/ofmshkGy9LqLNvta
 4Qb56CetnKKBnG+LE5pZUUXqrJ9l+jsC1PLwdsP3J+XWv6agSF+Dt8hKkhWoj43sXh
 4o+NGxvd2K9onZORVd8hzZ+XkDCk0vD3N9BBpBkANq/XE+G8kpWJra+vxtk+1L35qo
 8zwf0IvZMoXwh8BunomqBkiU7rMjOlGgy7RAWMi/dq+d++kmBcV3PBf81lwB2HQmB6
 UydLWRh4z5vKjCoEg2Ypt4Rmwe3EMFpcnDpBmxYHH8C6DWCyWOFYVp2z9njlSknlHG
 fI64ZO7Ec7x3g==
From: Conor Dooley <conor@kernel.org>
To: qemu-riscv@nongnu.org
Cc: conor@kernel.org, Conor Dooley <conor.dooley@microchip.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org
Subject: [PATCH v3 2/2] target/riscv: support new isa extension detection
 devicetree properties
Date: Wed, 10 Jan 2024 10:25:37 +0000
Message-Id: <20240110-sasquatch-vaporizer-b1d92e7ea9dc@spud>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240110-mold-renovate-256db1b5c70e@spud>
References: <20240110-mold-renovate-256db1b5c70e@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=9231;
 i=conor.dooley@microchip.com; h=from:subject:message-id;
 bh=LxX43HW+Y5e5cnoGrSoLBUm1B7Y77YwtssNL3z2KIuk=;
 b=owGbwMvMwCFWscWwfUFT0iXG02pJDKnzCubNfSz3izXuoOFO1/98GToPFFSswndszwvO6vtqc
 Fz/YsjkjlIWBjEOBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAExkVzcjw3PFAyc3M920d5z4
 w+DoFQamD1eez3/4kk/G8o6BZomr2T+G/zG3n05xMv6YaeCakcbC6MygfiS2gDFzR998Hd59Z7c
 rsQMA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp;
 fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2604:1380:4601:e00::1;
 envelope-from=conor@kernel.org; helo=ams.source.kernel.org
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.493,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Conor Dooley <conor.dooley@microchip.com>

A few months ago I submitted a patch to various lists, deprecating
"riscv,isa" with a lengthy commit message [0] that is now commit
aeb71e42caae ("dt-bindings: riscv: deprecate riscv,isa") in the Linux
kernel tree. Primarily, the goal was to replace "riscv,isa" with a new
set of properties that allowed for strictly defining the meaning of
various extensions, where "riscv,isa" was tied to whatever definitions
inflicted upon us by the ISA manual, which have seen some variance over
time.

Two new properties were introduced: "riscv,isa-base" and
"riscv,isa-extensions". The former is a simple string to communicate the
base ISA implemented by a hart and the latter an array of strings used
to communicate the set of ISA extensions supported, per the definitions
of each substring in extensions.yaml [1]. A beneficial side effect was
also the ability to define vendor extensions in a more "official" way,
as the ISA manual and other RVI specifications only covered the format
for vendor extensions in the ISA string, but not the meaning of vendor
extensions, for obvious reasons.

Add support for setting these two new properties in the devicetrees for
the various devicetree platforms supported by QEMU for RISC-V. The Linux
kernel already supports parsing ISA extensions from these new
properties, and documenting them in the dt-binding is a requirement for
new extension detection being added to the kernel.

A side effect of the implementation is that the meaning for elements in
"riscv,isa" and in "riscv,isa-extensions" are now tied together as they
are constructed from the same source. The same applies to the ISA string
provided in ACPI tables, but there does not appear to be any strict
definitions of meanings in ACPI land either.

Link: https://lore.kernel.org/qemu-riscv/20230702-eats-scorebook-c951f170d29f@spud/ [0]
Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/riscv/extensions.yaml [1]
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 hw/riscv/sifive_u.c |  7 ++----
 hw/riscv/spike.c    |  6 ++---
 hw/riscv/virt.c     |  6 ++---
 target/riscv/cpu.c  | 53 +++++++++++++++++++++++++++++++++++++++++++++
 target/riscv/cpu.h  |  1 +
 5 files changed, 60 insertions(+), 13 deletions(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index ec76dce6c9..2f227f15bc 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -171,7 +171,6 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
         int cpu_phandle = phandle++;
         nodename = g_strdup_printf("/cpus/cpu@%d", cpu);
         char *intc = g_strdup_printf("/cpus/cpu@%d/interrupt-controller", cpu);
-        char *isa;
         qemu_fdt_add_subnode(fdt, nodename);
         /* cpu 0 is the management hart that does not have mmu */
         if (cpu != 0) {
@@ -180,11 +179,10 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
             } else {
                 qemu_fdt_setprop_string(fdt, nodename, "mmu-type", "riscv,sv48");
             }
-            isa = riscv_isa_string(&s->soc.u_cpus.harts[cpu - 1]);
+            riscv_isa_write_fdt(&s->soc.u_cpus.harts[cpu - 1], fdt, nodename);
         } else {
-            isa = riscv_isa_string(&s->soc.e_cpus.harts[0]);
+            riscv_isa_write_fdt(&s->soc.e_cpus.harts[0], fdt, nodename);
         }
-        qemu_fdt_setprop_string(fdt, nodename, "riscv,isa", isa);
         qemu_fdt_setprop_string(fdt, nodename, "compatible", "riscv");
         qemu_fdt_setprop_string(fdt, nodename, "status", "okay");
         qemu_fdt_setprop_cell(fdt, nodename, "reg", cpu);
@@ -194,7 +192,6 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
         qemu_fdt_setprop_string(fdt, intc, "compatible", "riscv,cpu-intc");
         qemu_fdt_setprop(fdt, intc, "interrupt-controller", NULL, 0);
         qemu_fdt_setprop_cell(fdt, intc, "#interrupt-cells", 1);
-        g_free(isa);
         g_free(intc);
         g_free(nodename);
     }
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index 81f7e53aed..64074395bc 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -59,7 +59,7 @@ static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
     MachineState *ms = MACHINE(s);
     uint32_t *clint_cells;
     uint32_t cpu_phandle, intc_phandle, phandle = 1;
-    char *name, *mem_name, *clint_name, *clust_name;
+    char *mem_name, *clint_name, *clust_name;
     char *core_name, *cpu_name, *intc_name;
     static const char * const clint_compat[2] = {
         "sifive,clint0", "riscv,clint0"
@@ -113,9 +113,7 @@ static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
             } else {
                 qemu_fdt_setprop_string(fdt, cpu_name, "mmu-type", "riscv,sv48");
             }
-            name = riscv_isa_string(&s->soc[socket].harts[cpu]);
-            qemu_fdt_setprop_string(fdt, cpu_name, "riscv,isa", name);
-            g_free(name);
+            riscv_isa_write_fdt(&s->soc[socket].harts[cpu], fdt, cpu_name);
             qemu_fdt_setprop_string(fdt, cpu_name, "compatible", "riscv");
             qemu_fdt_setprop_string(fdt, cpu_name, "status", "okay");
             qemu_fdt_setprop_cell(fdt, cpu_name, "reg",
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index f9fd1341fc..c47b2d397a 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -215,7 +215,7 @@ static void create_fdt_socket_cpus(RISCVVirtState *s, int socket,
     int cpu;
     uint32_t cpu_phandle;
     MachineState *ms = MACHINE(s);
-    char *name, *cpu_name, *core_name, *intc_name, *sv_name;
+    char *cpu_name, *core_name, *intc_name, *sv_name;
     bool is_32_bit = riscv_is_32bit(&s->soc[0]);
     uint8_t satp_mode_max;
 
@@ -236,9 +236,7 @@ static void create_fdt_socket_cpus(RISCVVirtState *s, int socket,
             g_free(sv_name);
         }
 
-        name = riscv_isa_string(cpu_ptr);
-        qemu_fdt_setprop_string(ms->fdt, cpu_name, "riscv,isa", name);
-        g_free(name);
+        riscv_isa_write_fdt(cpu_ptr, ms->fdt, cpu_name);
 
         if (cpu_ptr->cfg.ext_zicbom) {
             qemu_fdt_setprop_cell(ms->fdt, cpu_name, "riscv,cbom-block-size",
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 5b5da970f2..1c8c81ca4c 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -31,6 +31,7 @@
 #include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
 #include "fpu/softfloat-helpers.h"
+#include "sysemu/device_tree.h"
 #include "sysemu/kvm.h"
 #include "sysemu/tcg.h"
 #include "kvm/kvm_riscv.h"
@@ -1875,6 +1876,58 @@ char *riscv_isa_string(RISCVCPU *cpu)
     return isa_str;
 }
 
+#ifndef CONFIG_USER_ONLY
+static char **riscv_isa_extensions_list(RISCVCPU *cpu, int *count)
+{
+    int maxlen = ARRAY_SIZE(riscv_single_letter_exts) + ARRAY_SIZE(isa_edata_arr);
+    char **extensions = g_new(char *, maxlen);
+
+    for (int i = 0; i < sizeof(riscv_single_letter_exts) - 1; i++) {
+        if (cpu->env.misa_ext & RV(riscv_single_letter_exts[i])) {
+            extensions[*count] = g_new(char, 2);
+            snprintf(extensions[*count], 2, "%c",
+                     qemu_tolower(riscv_single_letter_exts[i]));
+            (*count)++;
+        }
+    }
+
+    for (const RISCVIsaExtData *edata = isa_edata_arr; edata->name; edata++) {
+        if (isa_ext_is_enabled(cpu, edata->ext_enable_offset)) {
+            extensions[*count] = g_strdup(edata->name);
+            (*count)++;
+        }
+    }
+
+    return extensions;
+}
+
+void riscv_isa_write_fdt(RISCVCPU *cpu, void *fdt, char *nodename)
+{
+    const size_t maxlen = sizeof("rv128i");
+    g_autofree char *isa_base = g_new(char, maxlen);
+    g_autofree char *riscv_isa;
+    char **isa_extensions;
+    int count = 0;
+    int xlen = 16 << cpu->env.misa_mxl_max;
+
+    riscv_isa = riscv_isa_string(cpu);
+    qemu_fdt_setprop_string(fdt, nodename, "riscv,isa", riscv_isa);
+
+    snprintf(isa_base, maxlen, "rv%di", xlen);
+    qemu_fdt_setprop_string(fdt, nodename, "riscv,isa-base", isa_base);
+
+    isa_extensions = riscv_isa_extensions_list(cpu, &count);
+    qemu_fdt_setprop_string_array(fdt, nodename, "riscv,isa-extensions",
+                                  isa_extensions, count);
+
+    for (int i = 0; i < count; i++) {
+        g_free(isa_extensions[i]);
+    }
+
+    g_free(isa_extensions);
+}
+#endif
+
 #define DEFINE_CPU(type_name, initfn)      \
     {                                      \
         .name = type_name,                 \
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 5f3955c38d..192d0c2d31 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -510,6 +510,7 @@ char *riscv_isa_string(RISCVCPU *cpu);
 #define cpu_mmu_index riscv_cpu_mmu_index
 
 #ifndef CONFIG_USER_ONLY
+void riscv_isa_write_fdt(RISCVCPU *cpu, void *fdt, char *nodename);
 void riscv_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
                                      vaddr addr, unsigned size,
                                      MMUAccessType access_type,
-- 
2.39.2


