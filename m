Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 414D0C369CB
	for <qemu-riscv@archiver.kernel.org>; Wed, 23 Apr 2025 11:08:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u7Xwb-0004VA-BT; Wed, 23 Apr 2025 07:07:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1u7XwT-0004Q0-Mn
 for qemu-riscv@nongnu.org; Wed, 23 Apr 2025 07:07:02 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1u7XwR-0000MV-2f
 for qemu-riscv@nongnu.org; Wed, 23 Apr 2025 07:07:01 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-2243803b776so97151335ad.0
 for <qemu-riscv@nongnu.org>; Wed, 23 Apr 2025 04:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1745406417; x=1746011217; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Cr0Gf4k6g9qYz+9x5ZLTfRCeFjNoU92UFjwLG9yy81g=;
 b=PKVW0TrAWidPsVAOMGpyiiX2DBSfreJfMHs0KQ0wrrWjYDSR1J0D8eNz778gDsTQAQ
 3qH3Jfough5f2DYW/GYBWc3DpWJ+3jeWSJUcqmQQcRtTt4HpobK9G4Eya/rD0df3Hmlm
 OLnt+e6nq5ilZ1w0HWEIkpEaAKdQXLZi3TICNk/K90GrVqu2azst3jKPjHDwEQKQzgwX
 s2q33M+72qS3vR0ssNqgvNy96GrrGph1CosjX4Xk1jVQJbGq7SNeZJP0LVAnZgUFVdDJ
 GV55isP9cn4QKwPBDkhFBgJTAbOWNnF0LeWuRSAgaMMD146Cv11xHjATiwS9cUg1QySm
 oTFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745406417; x=1746011217;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Cr0Gf4k6g9qYz+9x5ZLTfRCeFjNoU92UFjwLG9yy81g=;
 b=JuBFNXyr5FKhzr1jjMnoyIboLYPff/ptlKwWku17GSGASlhBeFHzgr28815DAvXWdT
 Gpr8EJOSW9Figmn38d0EzhC6jJcOqGzE5/GdUbfRlt1HIlEVL8KfLWIOAu97Qa6Qkp2D
 br+/s+mN7ETduGnONCUfIBgCZHmvk6OGfwx1buYnaVG8va3U5lSmdhXI/TF+KuasDuZ/
 esIvYQ5M35LtotIicW1iPX/jFgjEiDF3piLI3ck7o0mURbzj+BvtuUC5C9IqviHQ2m5Y
 iZFE+An+MvnCMtDBP5y5AwddR8DvxbWjSIACvivKoaGQwb9SP6AYxedC0yM3RcmAMKah
 ifJQ==
X-Gm-Message-State: AOJu0Yx3bDfG5xQo+T9pwmQeujK1Uaweh982Wq0H3n4U+PWW6hGouuRM
 R5KL3PsJaLi20hCeA59/YVq/kirS/EQEg2v5umc6VLpkCmhyMRrdIFBKiMd2SpU=
X-Gm-Gg: ASbGncsCa1ZN4Qavrlwjo9uM81TxJcwS7PugeUpixcglPv2K3LbFfKKqc2l5djQxDOF
 hYFTvX7JzPzUpB3Kbny6EfgL//R5+sw8Q3YVn+9BAs432EoaspD4lHAVJdzbctFvM9eH9lmto+4
 t/ftM2WARAVhoB/2xb45rP1C8RdMwfUcNeB+2V/QbxQzA4r9q7jCAqGo4VhcG1BM9Su2fzQGkpR
 EEklP6NAMQwDupf+UyE4XIgDOE5ol5RitKsYkSuLAr/h7LYbguQVDa9KlvOEdHZDy6FhW7mz/NW
 g5GTDOxy1sraqBarbu+13NInjbBnRXqyEi9apWLxmyOn4XO/3xpF+1fDqVxGL/Y=
X-Google-Smtp-Source: AGHT+IFzq6UOCzcyvBlecYcIr4Vblw1o5wR1C7wTpMko07+6wiW9jcnSom2h7DZT40JBHU9PYVx1Bg==
X-Received: by 2002:a17:902:d48f:b0:220:ff3f:6cba with SMTP id
 d9443c01a7336-22c53618d09mr287159115ad.38.1745406417221; 
 Wed, 23 Apr 2025 04:06:57 -0700 (PDT)
Received: from localhost.localdomain ([2804:7f0:bcc0:89f4:3b90:a265:963d:8357])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22c50fdf3b1sm101509895ad.248.2025.04.23.04.06.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Apr 2025 04:06:56 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 6/9] hw/riscv/virt.c: use s->memmap in create_fdt_sockets()
 path
Date: Wed, 23 Apr 2025 08:06:27 -0300
Message-ID: <20250423110630.2249904-7-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250423110630.2249904-1-dbarboza@ventanamicro.com>
References: <20250423110630.2249904-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_FILL_THIS_FORM_SHORT=0.01 autolearn=ham autolearn_force=no
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

create_fdt_sockets() and all its fdt helpers (create_fdt_socket_aplic(),
create_fdt_imsic(), create_fdt_socket_plic(), create_fdt_socket_aclint()
and create_fdt_socket_memory()) can use s->memmap from their
RISCVVirtState pointer instead of having an extra memmap argument.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 hw/riscv/virt.c | 89 ++++++++++++++++++++++++++-----------------------
 1 file changed, 47 insertions(+), 42 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 02f3659d38..dcaf28d1a4 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -301,14 +301,13 @@ static void create_fdt_socket_cpus(RISCVVirtState *s, int socket,
     }
 }
 
-static void create_fdt_socket_memory(RISCVVirtState *s,
-                                     const MemMapEntry *memmap, int socket)
+static void create_fdt_socket_memory(RISCVVirtState *s, int socket)
 {
     g_autofree char *mem_name = NULL;
     uint64_t addr, size;
     MachineState *ms = MACHINE(s);
 
-    addr = memmap[VIRT_DRAM].base + riscv_socket_mem_offset(ms, socket);
+    addr = s->memmap[VIRT_DRAM].base + riscv_socket_mem_offset(ms, socket);
     size = riscv_socket_mem_size(ms, socket);
     mem_name = g_strdup_printf("/memory@%lx", (long)addr);
     qemu_fdt_add_subnode(ms->fdt, mem_name);
@@ -319,7 +318,7 @@ static void create_fdt_socket_memory(RISCVVirtState *s,
 }
 
 static void create_fdt_socket_clint(RISCVVirtState *s,
-                                    const MemMapEntry *memmap, int socket,
+                                    int socket,
                                     uint32_t *intc_phandles)
 {
     int cpu;
@@ -340,21 +339,22 @@ static void create_fdt_socket_clint(RISCVVirtState *s,
         clint_cells[cpu * 4 + 3] = cpu_to_be32(IRQ_M_TIMER);
     }
 
-    clint_addr = memmap[VIRT_CLINT].base + (memmap[VIRT_CLINT].size * socket);
+    clint_addr = s->memmap[VIRT_CLINT].base +
+                 (s->memmap[VIRT_CLINT].size * socket);
     clint_name = g_strdup_printf("/soc/clint@%lx", clint_addr);
     qemu_fdt_add_subnode(ms->fdt, clint_name);
     qemu_fdt_setprop_string_array(ms->fdt, clint_name, "compatible",
                                   (char **)&clint_compat,
                                   ARRAY_SIZE(clint_compat));
     qemu_fdt_setprop_cells(ms->fdt, clint_name, "reg",
-        0x0, clint_addr, 0x0, memmap[VIRT_CLINT].size);
+        0x0, clint_addr, 0x0, s->memmap[VIRT_CLINT].size);
     qemu_fdt_setprop(ms->fdt, clint_name, "interrupts-extended",
         clint_cells, s->soc[socket].num_harts * sizeof(uint32_t) * 4);
     riscv_socket_fdt_write_id(ms, clint_name, socket);
 }
 
 static void create_fdt_socket_aclint(RISCVVirtState *s,
-                                     const MemMapEntry *memmap, int socket,
+                                     int socket,
                                      uint32_t *intc_phandles)
 {
     int cpu;
@@ -381,8 +381,10 @@ static void create_fdt_socket_aclint(RISCVVirtState *s,
     aclint_cells_size = s->soc[socket].num_harts * sizeof(uint32_t) * 2;
 
     if (s->aia_type != VIRT_AIA_TYPE_APLIC_IMSIC) {
-        addr = memmap[VIRT_CLINT].base + (memmap[VIRT_CLINT].size * socket);
+        addr = s->memmap[VIRT_CLINT].base +
+               (s->memmap[VIRT_CLINT].size * socket);
         name = g_strdup_printf("/soc/mswi@%lx", addr);
+
         qemu_fdt_add_subnode(ms->fdt, name);
         qemu_fdt_setprop_string(ms->fdt, name, "compatible",
             "riscv,aclint-mswi");
@@ -397,13 +399,13 @@ static void create_fdt_socket_aclint(RISCVVirtState *s,
     }
 
     if (s->aia_type == VIRT_AIA_TYPE_APLIC_IMSIC) {
-        addr = memmap[VIRT_CLINT].base +
+        addr = s->memmap[VIRT_CLINT].base +
                (RISCV_ACLINT_DEFAULT_MTIMER_SIZE * socket);
         size = RISCV_ACLINT_DEFAULT_MTIMER_SIZE;
     } else {
-        addr = memmap[VIRT_CLINT].base + RISCV_ACLINT_SWI_SIZE +
-            (memmap[VIRT_CLINT].size * socket);
-        size = memmap[VIRT_CLINT].size - RISCV_ACLINT_SWI_SIZE;
+        addr = s->memmap[VIRT_CLINT].base + RISCV_ACLINT_SWI_SIZE +
+               (s->memmap[VIRT_CLINT].size * socket);
+        size = s->memmap[VIRT_CLINT].size - RISCV_ACLINT_SWI_SIZE;
     }
     name = g_strdup_printf("/soc/mtimer@%lx", addr);
     qemu_fdt_add_subnode(ms->fdt, name);
@@ -420,14 +422,15 @@ static void create_fdt_socket_aclint(RISCVVirtState *s,
     g_free(name);
 
     if (s->aia_type != VIRT_AIA_TYPE_APLIC_IMSIC) {
-        addr = memmap[VIRT_ACLINT_SSWI].base +
-            (memmap[VIRT_ACLINT_SSWI].size * socket);
+        addr = s->memmap[VIRT_ACLINT_SSWI].base +
+               (s->memmap[VIRT_ACLINT_SSWI].size * socket);
+
         name = g_strdup_printf("/soc/sswi@%lx", addr);
         qemu_fdt_add_subnode(ms->fdt, name);
         qemu_fdt_setprop_string(ms->fdt, name, "compatible",
             "riscv,aclint-sswi");
         qemu_fdt_setprop_cells(ms->fdt, name, "reg",
-            0x0, addr, 0x0, memmap[VIRT_ACLINT_SSWI].size);
+            0x0, addr, 0x0, s->memmap[VIRT_ACLINT_SSWI].size);
         qemu_fdt_setprop(ms->fdt, name, "interrupts-extended",
             aclint_sswi_cells, aclint_cells_size);
         qemu_fdt_setprop(ms->fdt, name, "interrupt-controller", NULL, 0);
@@ -438,7 +441,7 @@ static void create_fdt_socket_aclint(RISCVVirtState *s,
 }
 
 static void create_fdt_socket_plic(RISCVVirtState *s,
-                                   const MemMapEntry *memmap, int socket,
+                                   int socket,
                                    uint32_t *phandle, uint32_t *intc_phandles,
                                    uint32_t *plic_phandles)
 {
@@ -452,7 +455,8 @@ static void create_fdt_socket_plic(RISCVVirtState *s,
     };
 
     plic_phandles[socket] = (*phandle)++;
-    plic_addr = memmap[VIRT_PLIC].base + (memmap[VIRT_PLIC].size * socket);
+    plic_addr = s->memmap[VIRT_PLIC].base +
+                (s->memmap[VIRT_PLIC].size * socket);
     plic_name = g_strdup_printf("/soc/plic@%lx", plic_addr);
     qemu_fdt_add_subnode(ms->fdt, plic_name);
     qemu_fdt_setprop_cell(ms->fdt, plic_name,
@@ -491,7 +495,7 @@ static void create_fdt_socket_plic(RISCVVirtState *s,
     }
 
     qemu_fdt_setprop_cells(ms->fdt, plic_name, "reg",
-        0x0, plic_addr, 0x0, memmap[VIRT_PLIC].size);
+        0x0, plic_addr, 0x0, s->memmap[VIRT_PLIC].size);
     qemu_fdt_setprop_cell(ms->fdt, plic_name, "riscv,ndev",
                           VIRT_IRQCHIP_NUM_SOURCES - 1);
     riscv_socket_fdt_write_id(ms, plic_name, socket);
@@ -500,8 +504,8 @@ static void create_fdt_socket_plic(RISCVVirtState *s,
 
     if (!socket) {
         platform_bus_add_all_fdt_nodes(ms->fdt, plic_name,
-                                       memmap[VIRT_PLATFORM_BUS].base,
-                                       memmap[VIRT_PLATFORM_BUS].size,
+                                       s->memmap[VIRT_PLATFORM_BUS].base,
+                                       s->memmap[VIRT_PLATFORM_BUS].size,
                                        VIRT_PLATFORM_BUS_IRQ);
     }
 }
@@ -588,7 +592,7 @@ static void create_fdt_one_imsic(RISCVVirtState *s, hwaddr base_addr,
     qemu_fdt_setprop_cell(ms->fdt, imsic_name, "phandle", msi_phandle);
 }
 
-static void create_fdt_imsic(RISCVVirtState *s, const MemMapEntry *memmap,
+static void create_fdt_imsic(RISCVVirtState *s,
                              uint32_t *phandle, uint32_t *intc_phandles,
                              uint32_t *msi_m_phandle, uint32_t *msi_s_phandle)
 {
@@ -597,12 +601,12 @@ static void create_fdt_imsic(RISCVVirtState *s, const MemMapEntry *memmap,
 
     if (!kvm_enabled()) {
         /* M-level IMSIC node */
-        create_fdt_one_imsic(s, memmap[VIRT_IMSIC_M].base, intc_phandles,
+        create_fdt_one_imsic(s, s->memmap[VIRT_IMSIC_M].base, intc_phandles,
                              *msi_m_phandle, true, 0);
     }
 
     /* S-level IMSIC node */
-    create_fdt_one_imsic(s, memmap[VIRT_IMSIC_S].base, intc_phandles,
+    create_fdt_one_imsic(s, s->memmap[VIRT_IMSIC_S].base, intc_phandles,
                          *msi_s_phandle, false,
                          imsic_num_bits(s->aia_guests + 1));
 
@@ -679,7 +683,7 @@ static void create_fdt_one_aplic(RISCVVirtState *s, int socket,
 }
 
 static void create_fdt_socket_aplic(RISCVVirtState *s,
-                                    const MemMapEntry *memmap, int socket,
+                                    int socket,
                                     uint32_t msi_m_phandle,
                                     uint32_t msi_s_phandle,
                                     uint32_t *phandle,
@@ -696,18 +700,19 @@ static void create_fdt_socket_aplic(RISCVVirtState *s,
 
     if (!kvm_enabled()) {
         /* M-level APLIC node */
-        aplic_addr = memmap[VIRT_APLIC_M].base +
-                     (memmap[VIRT_APLIC_M].size * socket);
-        create_fdt_one_aplic(s, socket, aplic_addr, memmap[VIRT_APLIC_M].size,
+        aplic_addr = s->memmap[VIRT_APLIC_M].base +
+                     (s->memmap[VIRT_APLIC_M].size * socket);
+        create_fdt_one_aplic(s, socket, aplic_addr,
+                             s->memmap[VIRT_APLIC_M].size,
                              msi_m_phandle, intc_phandles,
                              aplic_m_phandle, aplic_s_phandle,
                              true, num_harts);
     }
 
     /* S-level APLIC node */
-    aplic_addr = memmap[VIRT_APLIC_S].base +
-                 (memmap[VIRT_APLIC_S].size * socket);
-    create_fdt_one_aplic(s, socket, aplic_addr, memmap[VIRT_APLIC_S].size,
+    aplic_addr = s->memmap[VIRT_APLIC_S].base +
+                 (s->memmap[VIRT_APLIC_S].size * socket);
+    create_fdt_one_aplic(s, socket, aplic_addr, s->memmap[VIRT_APLIC_S].size,
                          msi_s_phandle, intc_phandles,
                          aplic_s_phandle, 0,
                          false, num_harts);
@@ -715,8 +720,8 @@ static void create_fdt_socket_aplic(RISCVVirtState *s,
     if (!socket) {
         g_autofree char *aplic_name = fdt_get_aplic_nodename(aplic_addr);
         platform_bus_add_all_fdt_nodes(ms->fdt, aplic_name,
-                                       memmap[VIRT_PLATFORM_BUS].base,
-                                       memmap[VIRT_PLATFORM_BUS].size,
+                                       s->memmap[VIRT_PLATFORM_BUS].base,
+                                       s->memmap[VIRT_PLATFORM_BUS].size,
                                        VIRT_PLATFORM_BUS_IRQ);
     }
 
@@ -734,7 +739,7 @@ static void create_fdt_pmu(RISCVVirtState *s)
     riscv_pmu_generate_fdt_node(ms->fdt, hart.pmu_avail_ctrs, pmu_name);
 }
 
-static void create_fdt_sockets(RISCVVirtState *s, const MemMapEntry *memmap,
+static void create_fdt_sockets(RISCVVirtState *s,
                                uint32_t *phandle,
                                uint32_t *irq_mmio_phandle,
                                uint32_t *irq_pcie_phandle,
@@ -770,20 +775,20 @@ static void create_fdt_sockets(RISCVVirtState *s, const MemMapEntry *memmap,
         create_fdt_socket_cpus(s, socket, clust_name, phandle,
                                &intc_phandles[phandle_pos]);
 
-        create_fdt_socket_memory(s, memmap, socket);
+        create_fdt_socket_memory(s, socket);
 
         if (virt_aclint_allowed() && s->have_aclint) {
-            create_fdt_socket_aclint(s, memmap, socket,
+            create_fdt_socket_aclint(s, socket,
                                      &intc_phandles[phandle_pos]);
         } else if (tcg_enabled()) {
-            create_fdt_socket_clint(s, memmap, socket,
+            create_fdt_socket_clint(s, socket,
                                     &intc_phandles[phandle_pos]);
         }
     }
 
     if (s->aia_type == VIRT_AIA_TYPE_APLIC_IMSIC) {
-        create_fdt_imsic(s, memmap, phandle, intc_phandles,
-            &msi_m_phandle, &msi_s_phandle);
+        create_fdt_imsic(s, phandle, intc_phandles,
+                         &msi_m_phandle, &msi_s_phandle);
         *msi_pcie_phandle = msi_s_phandle;
     }
 
@@ -792,7 +797,7 @@ static void create_fdt_sockets(RISCVVirtState *s, const MemMapEntry *memmap,
      * mode, we'll use only one APLIC instance.
      */
     if (!virt_use_emulated_aplic(s->aia_type)) {
-        create_fdt_socket_aplic(s, memmap, 0,
+        create_fdt_socket_aplic(s, 0,
                                 msi_m_phandle, msi_s_phandle, phandle,
                                 &intc_phandles[0], xplic_phandles,
                                 ms->smp.cpus);
@@ -806,11 +811,11 @@ static void create_fdt_sockets(RISCVVirtState *s, const MemMapEntry *memmap,
             phandle_pos -= s->soc[socket].num_harts;
 
             if (s->aia_type == VIRT_AIA_TYPE_NONE) {
-                create_fdt_socket_plic(s, memmap, socket, phandle,
+                create_fdt_socket_plic(s, socket, phandle,
                                        &intc_phandles[phandle_pos],
                                        xplic_phandles);
             } else {
-                create_fdt_socket_aplic(s, memmap, socket,
+                create_fdt_socket_aplic(s, socket,
                                         msi_m_phandle, msi_s_phandle, phandle,
                                         &intc_phandles[phandle_pos],
                                         xplic_phandles,
@@ -1126,7 +1131,7 @@ static void finalize_fdt(RISCVVirtState *s)
     uint32_t irq_pcie_phandle = 1, irq_virtio_phandle = 1;
     uint32_t iommu_sys_phandle = 1;
 
-    create_fdt_sockets(s, s->memmap, &phandle, &irq_mmio_phandle,
+    create_fdt_sockets(s, &phandle, &irq_mmio_phandle,
                        &irq_pcie_phandle, &irq_virtio_phandle,
                        &msi_pcie_phandle);
 
-- 
2.49.0


