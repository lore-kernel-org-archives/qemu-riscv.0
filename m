Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB40BC61DE4
	for <qemu-riscv@archiver.kernel.org>; Mon, 31 Aug 2026 02:17:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x0rZU-0003fJ-O0; Sun, 30 Aug 2026 22:16:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1x0rZS-0003e1-W0
 for qemu-riscv@nongnu.org; Sun, 30 Aug 2026 22:16:27 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1x0rZR-0007bx-2y
 for qemu-riscv@nongnu.org; Sun, 30 Aug 2026 22:16:26 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-395cf2535acso2884183a91.1
 for <qemu-riscv@nongnu.org>; Sun, 30 Aug 2026 19:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1788142584; x=1788747384; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=lra/eGV1qBbWwyW2TOgrfmZZq5qvjxYH2/l0+JSydtI=;
 b=TVvwFcWgvQj7ZoOfT6aNKmcBejlB9d8QL0HR6/Yc+Qs9J6i1jCwys7OcOD1Ki8/dTT
 BmhS+mEDpPDIa6V289TrH41GdbvxRIoPJYNqkQna0AAblnzE159iBVXEPJAZ/3bOjwF9
 eaodKS+gtkK5eQj22+INOYgjx12HC0tGiqFeXXwyIFhrvyRtyaCLN2T9RgULq3JMqt3E
 8Oa9niHI+8P8VPvY2l/diJrhRbkX+1MYEaH+273MLfQ5wI7f8aRe+IWygv6Gj8/etU/B
 Kz9ddvlJUkNnFa5yy2sfulFjZ7KCW8C0Vwjs8NkZxfNNbtYf/Mm1I1o18iFt5gCm7Hg7
 g+AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788142584; x=1788747384;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=lra/eGV1qBbWwyW2TOgrfmZZq5qvjxYH2/l0+JSydtI=;
 b=rqc+7L8aadeO3a6kmVee4z+B81ZI6H/rlEt84MgIoLQvcyiRZP8JeruN/57ujnXHIc
 hJEHeSBPn1ulkpFy4F26ZYR68ev0dVZz6wdAUyA06kIpAXE/015x0tKkmUMtP9jIa9Iv
 OdpYULDWhxD/5MEJEDBkmDE/xljiJi1LwOR2y7gurRu2OaAjanU9t94B1tSUiqQUSbFZ
 MmiPSUZ6G7ZVyHHZFB9aA8u1acQZD+b6oETVhc9Ad9+N1NDa0P+p15Hz84DEKiZNbmF4
 A0PFngaOwgPVskxRl7Fok3aXR0pHJ7+XGZcCjMdHv+HyhBvVserqVgRY3Fc9VWIMB0MO
 kDJw==
X-Forwarded-Encrypted: i=1;
 AKwUvBxhzzd/u+8Icuj2SFlWdFeZ7k/PFAxAgpN+vvCkb9zMfJc5RuGfVFfPt2/kkstepHByauDCOUj3JHZO@nongnu.org
X-Gm-Message-State: AFuF++mNQG4QrcdDA8PHU6Q1nKFmO4FH+n1mFoqvIDDWzOJghllag49x
 ManOPYpD6JKb8GzbKQgbkvOCRdD/9xasFrnYyzbIjvXjgxviM4t1F6vN
X-Gm-Gg: AYBFou1daEY9PSm7lNU4SLDHiNbV+9DjF3/FCEAiEglIHmacgwx1B5QjBFBd3RndoGf
 qEcdeLKaxP+y0BeAoxCsrZ0f165owgnbFpKg6dEG0I3eMi5EImEGtYZbUlrArS8nv/VSxvVu1B8
 XmTkXgXiRSyxojc/e9mKB7xkGMBcAOLbk0tu6uwP2U6QGD2QXVg0zs+r0k4dp/QQuKv2ov1BUrH
 nCccaU8RU3ue698m8TWMvk8qJ43cROQZUHF4DQtRd9H7H+G//AQYTkKFtY8xX93Sxmt2hBU/mBN
 wysCDUyh9UnRY3xYEf6uaWwrnfCdt00gdfbg1kA+B5mAgkeOER5Iygks8ceeARs0pYRA+SJpZQC
 96tpAuBxqpSAGOq5c4TWc/+p/iX8OEiikxJ3j8/qCsn3GZbGgM869q10hfvS+JrV43epIMleqtD
 IGV72uj2mrYbqzTpLBpou26791rVvwRDRcR0GvpDLDkjncU9Rmn0ZA3XY3XH2OdETWTDs9ftniv
 WXnptddumq0jctbm6vO4qBxJPLk7X9YkF0gXYoKeghOS1o0kGbxgY8we24vhgsUjNImKSIGtmPJ
 E7HCXlajuJT6wtgT6lvY
X-Received: by 2002:a17:90b:47:b0:384:927f:3db9 with SMTP id
 98e67ed59e1d1-398da5981f2mr4222565a91.1.1788142583697; 
 Sun, 30 Aug 2026 19:16:23 -0700 (PDT)
Received: from donnager-debian.. ([180.150.112.50])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-396b186807bsm20071240a91.12.2026.08.30.19.16.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Aug 2026 19:16:23 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Michael Ellerman <mpe@kernel.org>,
 Portia Stephens <portias@oss.tenstorrent.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v2 10/16] hw/riscv/atlantis: Rework device tree creation
Date: Mon, 31 Aug 2026 11:44:51 +0930
Message-ID: <20260831021500.82565-11-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260831021500.82565-1-joel@jms.id.au>
References: <20260831021500.82565-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=joel.stan@gmail.com; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Remove the direct use of MachineState from the device tree creation to
allow separation between the SoC (TTAtlantisState) and the QEMU
MachineState.

Fix this for the device tree pointer by passing it directly to the
functions that use it, instead of casting the TTAtlantisState to a
MachineState.

MachineState::smp.cpus is replaced with TTAtlantisState::cpus.num_harts,
as these are equivalent after tt_atlantis_machine_init.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 hw/riscv/tt_atlantis.c | 51 +++++++++++++++++++-----------------------
 1 file changed, 23 insertions(+), 28 deletions(-)

diff --git a/hw/riscv/tt_atlantis.c b/hw/riscv/tt_atlantis.c
index 35b3be072a06..c471c7cebf12 100644
--- a/hw/riscv/tt_atlantis.c
+++ b/hw/riscv/tt_atlantis.c
@@ -80,9 +80,8 @@ static uint32_t next_phandle(void)
     return fdt_phandle++;
 }
 
-static void create_fdt_memory(TTAtlantisState *s)
+static void create_fdt_memory(void *fdt, TTAtlantisState *s)
 {
-    void *fdt = MACHINE(s)->fdt;
     hwaddr size_lo = MACHINE(s)->ram_size;
     hwaddr size_hi = 0;
 
@@ -104,9 +103,9 @@ static void create_fdt_memory(TTAtlantisState *s)
     }
 }
 
-static void create_fdt_aclint(TTAtlantisState *s, uint32_t *intc_phandles)
+static void create_fdt_aclint(void *fdt, TTAtlantisState *s,
+                              uint32_t *intc_phandles)
 {
-    void *fdt = MACHINE(s)->fdt;
     g_autofree char *name = NULL;
     g_autofree uint32_t *aclint_mtimer_cells = NULL;
     uint32_t aclint_cells_size;
@@ -206,10 +205,9 @@ static void create_fdt_one_aplic(void *fdt,
     qemu_fdt_setprop_cell(fdt, name, "phandle", aplic_phandle);
 }
 
-static void create_fdt_pmu(TTAtlantisState *s)
+static void create_fdt_pmu(void *fdt, TTAtlantisState *s)
 {
     char pmu_name[] = "/pmu";
-    void *fdt = MACHINE(s)->fdt;
     RISCVCPU *hart = &s->cpus.harts[0];
 
     qemu_fdt_add_subnode(fdt, pmu_name);
@@ -217,32 +215,29 @@ static void create_fdt_pmu(TTAtlantisState *s)
     riscv_pmu_generate_fdt_node(fdt, hart->pmu_avail_ctrs, pmu_name);
 }
 
-static void create_fdt_cpu(TTAtlantisState *s, const MemMapEntry *memmap,
+static void create_fdt_cpu(void *fdt, TTAtlantisState *s,
                            uint32_t aplic_s_phandle,
                            uint32_t imsic_s_phandle)
 {
-    MachineState *ms = MACHINE(s);
-    void *fdt = MACHINE(s)->fdt;
-    g_autofree uint32_t *intc_phandles = g_new0(uint32_t, ms->smp.cpus);
+    g_autofree uint32_t *intc_phandles = g_new0(uint32_t, s->cpus.num_harts);
+    int num_harts = s->cpus.num_harts;
 
     fdt_create_cpu_socket_subnode(fdt, TT_ACLINT_TIMEBASE_FREQ);
 
-    create_fdt_socket_cpus(fdt, s->cpus.harts, 0, s->cpus.num_harts,
+    create_fdt_socket_cpus(fdt, s->cpus.harts, 0, num_harts,
                            s->cpus.hartid_base, &fdt_phandle, intc_phandles,
                            false, false);
 
-    create_fdt_memory(s);
-
-    create_fdt_aclint(s, intc_phandles);
+    create_fdt_aclint(fdt, s, intc_phandles);
 
     /* M-level IMSIC node */
     uint32_t msi_m_phandle = next_phandle();
-    create_fdt_one_imsic(fdt, &s->memmap[TT_ATL_MIMSIC], ms->smp.cpus,
+    create_fdt_one_imsic(fdt, &s->memmap[TT_ATL_MIMSIC], num_harts,
                          intc_phandles, msi_m_phandle,
                          IRQ_M_EXT, TT_IMSIC_GUEST_BITS);
 
     /* S-level IMSIC node */
-    create_fdt_one_imsic(fdt, &s->memmap[TT_ATL_SIMSIC], ms->smp.cpus,
+    create_fdt_one_imsic(fdt, &s->memmap[TT_ATL_SIMSIC], num_harts,
                          intc_phandles, imsic_s_phandle,
                          IRQ_S_EXT, TT_IMSIC_GUEST_BITS);
 
@@ -252,13 +247,13 @@ static void create_fdt_cpu(TTAtlantisState *s, const MemMapEntry *memmap,
     create_fdt_one_aplic(fdt, &s->memmap[TT_ATL_MAPLIC],
                          msi_m_phandle, intc_phandles,
                          aplic_m_phandle, aplic_s_phandle,
-                         IRQ_M_EXT, s->cpus.num_harts);
+                         IRQ_M_EXT, num_harts);
 
     /* S-level APLIC node */
     create_fdt_one_aplic(fdt, &s->memmap[TT_ATL_SAPLIC],
                          imsic_s_phandle, intc_phandles,
                          aplic_s_phandle, 0,
-                         IRQ_S_EXT, s->cpus.num_harts);
+                         IRQ_S_EXT, num_harts);
 }
 
 static void create_fdt_uart(void *fdt, const MemMapEntry *mem, int irq,
@@ -317,10 +312,9 @@ static void create_fdt_i2c(void *fdt, const MemMapEntry *mem, uint32_t irq,
     qemu_fdt_setprop_cell(fdt, name, "#size-cells", 0);
 }
 
-static void create_fdt_i2c_device(TTAtlantisState *s, int bus,
+static void create_fdt_i2c_device(void *fdt, TTAtlantisState *s, int bus,
                                   const char *compat, int addr)
 {
-    void *fdt = MACHINE(s)->fdt;
     hwaddr base = s->memmap[TT_ATL_I2C0 + bus].base;
     g_autofree char *name = g_strdup_printf("/soc/i2c@%"HWADDR_PRIX"/sensor@%x",
                                             base, addr);
@@ -330,14 +324,15 @@ static void create_fdt_i2c_device(TTAtlantisState *s, int bus,
     qemu_fdt_setprop_cell(fdt, name, "reg", addr);
 }
 
-static void finalize_fdt(TTAtlantisState *s)
+static void finalize_fdt(void *fdt, TTAtlantisState *s)
 {
     uint32_t aplic_s_phandle = next_phandle();
     uint32_t imsic_s_phandle = next_phandle();
     uint32_t periph_clk_phandle = next_phandle();
-    void *fdt = MACHINE(s)->fdt;
 
-    create_fdt_cpu(s, s->memmap, aplic_s_phandle, imsic_s_phandle);
+    create_fdt_cpu(fdt, s, aplic_s_phandle, imsic_s_phandle);
+
+    create_fdt_memory(fdt, s);
 
     /*
      * We want to do this, but the Linux aplic driver was broken before v6.16
@@ -359,8 +354,8 @@ static void finalize_fdt(TTAtlantisState *s)
     }
 
     /* I2C peripherals: qemu specific */
-    create_fdt_i2c_device(s, 0, "dallas,ds1338", 0x6f);
-    create_fdt_i2c_device(s, 4, "ti,tmp105", 0x48);
+    create_fdt_i2c_device(fdt, s, 0, "dallas,ds1338", 0x6f);
+    create_fdt_i2c_device(fdt, s, 4, "ti,tmp105", 0x48);
 }
 
 static void create_fdt(TTAtlantisState *s)
@@ -377,7 +372,7 @@ static void create_fdt(TTAtlantisState *s)
 
     qemu_fdt_add_subnode(ms->fdt, "/aliases");
 
-    create_fdt_pmu(s);
+    create_fdt_pmu(ms->fdt, s);
 }
 
 static void load_fdt(TTAtlantisState *s)
@@ -408,7 +403,7 @@ static void load_fdt(TTAtlantisState *s)
         g_strfreev(node_path);
     }
 
-    create_fdt_memory(s);
+    create_fdt_memory(ms->fdt, s);
 }
 
 static void mmio_map_unimplemented(MemoryRegion *memory, SysBusDevice *dev,
@@ -439,7 +434,7 @@ static void tt_atlantis_machine_done(Notifier *notifier, void *data)
      * dynamic sysbus devices. Our FDT needs to be finalized.
      */
     if (machine->dtb == NULL) {
-        finalize_fdt(s);
+        finalize_fdt(machine->fdt, s);
     }
 
     mem_size = machine->ram_size;
-- 
2.47.3


