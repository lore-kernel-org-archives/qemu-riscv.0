Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF9A3C369D3
	for <qemu-riscv@archiver.kernel.org>; Wed, 23 Apr 2025 11:09:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u7Xwi-0004Xe-GR; Wed, 23 Apr 2025 07:07:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1u7Xwb-0004VW-Gb
 for qemu-riscv@nongnu.org; Wed, 23 Apr 2025 07:07:10 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1u7XwZ-0000P1-Fk
 for qemu-riscv@nongnu.org; Wed, 23 Apr 2025 07:07:09 -0400
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-2264aefc45dso99651485ad.0
 for <qemu-riscv@nongnu.org>; Wed, 23 Apr 2025 04:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1745406425; x=1746011225; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u5Psp4Ree/vPw4pMJqdqWJWCdkKqLYqIDsIUdQtlPpw=;
 b=Ul12k7rn/+kReCn0kqf7mLwJuaLrAiaC8Rridzb0u0aGR71bYbJHWy6nXUCnNUD9sz
 QMtRvZB0mjnyt4V/HQHRyvfjPotIKs3Y3ysZjasL610mIhHzj5YPHYzHtZuVYQlnduPC
 mAWPzJ3G1d1vNvRkM3evvrXxXQ7M56kj5RybOuJkCq1c6LfL7AhlL5/qmBSNNyVPKwYg
 3BnNG8x7MatSPiH16ZWwZdyhBT7+X77+AbmMV415fYBhIEfeOSUAO6xiyvYRR8XQ1tgj
 6C4XEtmJkEY0wdSuVHEKkmjp+AFWFGrg8Hj5hyHxQF7RRDpdBOBWeMXdHD5V4PpFH9dp
 Krfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745406425; x=1746011225;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u5Psp4Ree/vPw4pMJqdqWJWCdkKqLYqIDsIUdQtlPpw=;
 b=dJHQMYZYHbdrP0PNVH6ULxoXpueSs/BMF819nsG14MHBE15dQuBfe2XVupK2p8cOvA
 Y4TztMdGQgfpLYvLwlLHGZlDiVHEC6XOKsEI5qt2tuvFbsDVlz58HOp6W6DA9oXj5WED
 B08YT+5+KvvDVoA7aKA7Dma+ZvPuFiXv8Q4Q+/JsCZXwMOJVc64i+52R4o6OKCA+QdUB
 15FEzWf0BO/Zc9PrvWgHBJKUNWD2FZv+tIiehn9RHZM07q5HVjzrnHKbX7vufSn2rsoN
 fEgX0ZRv71AU/sbcpopCZ7GL0K7PNHw3zRWKGkkYRjJMRO8CguAt8NmX9cuzIBD0NOe2
 Vj6w==
X-Gm-Message-State: AOJu0YwNCUaTkja0rOe93CT7FEFSykMYv961RRIHnylgD6k6uejhpNZ/
 +ulKYlMAtErnIubaWRivMBTtLXgDKkX7J4flWc6bnVT0iXBAXDXvxAWiFfznhhA=
X-Gm-Gg: ASbGncvkFraZsQx9IJZgJFiefJ4gM9SgRoLogxHgQBgwuU+muy+aWhXJVr9eIdSuBQz
 d8FMKVdnip2tiMAlQ0cBxc4mbtZO42ExCzrBQXPKL8mz8Qq7oglR1z46iQooHlJQU8h03LM6BNX
 55uyXUgNfjel5AKMy0kwZZxsdiyTCl5vaXi4XPt7sbcIxIDMJVomKsquOvGShgKuGbIMapdzZXk
 M1t3i6XVtWtw6iEH6TfcsgoZu4XK3jOXinriJ+ZuD48/Umhi6/l3bRRbFwTNL/KmJkTRVj9ir5Q
 UNNMY4apR1mbkjNhoHdRRKcBjQehB9COgsPBWugqt7T6xYXZ8JT9upJZ97WfAx0=
X-Google-Smtp-Source: AGHT+IF6Inc6mDQrdrkHImmY/8/y3AkKsxDDsyuDlmS5Lwx3sp0zcl1hhPiAWjd7yjpRz/hrOzHBvA==
X-Received: by 2002:a17:903:410a:b0:223:536d:f67b with SMTP id
 d9443c01a7336-22c53607c21mr251042415ad.38.1745406425563; 
 Wed, 23 Apr 2025 04:07:05 -0700 (PDT)
Received: from localhost.localdomain ([2804:7f0:bcc0:89f4:3b90:a265:963d:8357])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22c50fdf3b1sm101509895ad.248.2025.04.23.04.07.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Apr 2025 04:07:05 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 9/9] hw/riscv/virt.c: remove 'long' casts in fmt strings
Date: Wed, 23 Apr 2025 08:06:30 -0300
Message-ID: <20250423110630.2249904-10-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250423110630.2249904-1-dbarboza@ventanamicro.com>
References: <20250423110630.2249904-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x629.google.com
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

We can avoid the 'long' casts by using PRIx64 and HWADDR_PRIx on the fmt
strings for uint64_t and hwaddr types.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 hw/riscv/virt.c | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 036a0a9bfb..075c035f25 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -309,7 +309,7 @@ static void create_fdt_socket_memory(RISCVVirtState *s, int socket)
 
     addr = s->memmap[VIRT_DRAM].base + riscv_socket_mem_offset(ms, socket);
     size = riscv_socket_mem_size(ms, socket);
-    mem_name = g_strdup_printf("/memory@%lx", (long)addr);
+    mem_name = g_strdup_printf("/memory@%"PRIx64, addr);
     qemu_fdt_add_subnode(ms->fdt, mem_name);
     qemu_fdt_setprop_cells(ms->fdt, mem_name, "reg",
         addr >> 32, addr, size >> 32, size);
@@ -880,8 +880,8 @@ static void create_fdt_pcie(RISCVVirtState *s,
     g_autofree char *name = NULL;
     MachineState *ms = MACHINE(s);
 
-    name = g_strdup_printf("/soc/pci@%lx",
-        (long) s->memmap[VIRT_PCIE_ECAM].base);
+    name = g_strdup_printf("/soc/pci@%"HWADDR_PRIx,
+                           s->memmap[VIRT_PCIE_ECAM].base);
     qemu_fdt_setprop_cell(ms->fdt, name, "#address-cells",
         FDT_PCI_ADDR_CELLS);
     qemu_fdt_setprop_cell(ms->fdt, name, "#interrupt-cells",
@@ -925,8 +925,8 @@ static void create_fdt_reset(RISCVVirtState *s, uint32_t *phandle)
     MachineState *ms = MACHINE(s);
 
     test_phandle = (*phandle)++;
-    name = g_strdup_printf("/soc/test@%lx",
-        (long)s->memmap[VIRT_TEST].base);
+    name = g_strdup_printf("/soc/test@%"HWADDR_PRIx,
+                           s->memmap[VIRT_TEST].base);
     qemu_fdt_add_subnode(ms->fdt, name);
     {
         static const char * const compat[3] = {
@@ -964,8 +964,8 @@ static void create_fdt_uart(RISCVVirtState *s,
     g_autofree char *name = NULL;
     MachineState *ms = MACHINE(s);
 
-    name = g_strdup_printf("/soc/serial@%lx",
-                           (long)s->memmap[VIRT_UART0].base);
+    name = g_strdup_printf("/soc/serial@%"HWADDR_PRIx,
+                           s->memmap[VIRT_UART0].base);
     qemu_fdt_add_subnode(ms->fdt, name);
     qemu_fdt_setprop_string(ms->fdt, name, "compatible", "ns16550a");
     qemu_fdt_setprop_cells(ms->fdt, name, "reg",
@@ -989,7 +989,8 @@ static void create_fdt_rtc(RISCVVirtState *s,
     g_autofree char *name = NULL;
     MachineState *ms = MACHINE(s);
 
-    name = g_strdup_printf("/soc/rtc@%lx", (long)s->memmap[VIRT_RTC].base);
+    name = g_strdup_printf("/soc/rtc@%"HWADDR_PRIx,
+                           s->memmap[VIRT_RTC].base);
     qemu_fdt_add_subnode(ms->fdt, name);
     qemu_fdt_setprop_string(ms->fdt, name, "compatible",
         "google,goldfish-rtc");
@@ -1042,8 +1043,8 @@ static void create_fdt_virtio_iommu(RISCVVirtState *s, uint16_t bdf)
     g_autofree char *iommu_node = NULL;
     g_autofree char *pci_node = NULL;
 
-    pci_node = g_strdup_printf("/soc/pci@%lx",
-                               (long) s->memmap[VIRT_PCIE_ECAM].base);
+    pci_node = g_strdup_printf("/soc/pci@%"HWADDR_PRIx,
+                               s->memmap[VIRT_PCIE_ECAM].base);
     iommu_node = g_strdup_printf("%s/virtio_iommu@%x,%x", pci_node,
                                  PCI_SLOT(bdf), PCI_FUNC(bdf));
     iommu_phandle = qemu_fdt_alloc_phandle(fdt);
@@ -1111,8 +1112,8 @@ static void create_fdt_iommu(RISCVVirtState *s, uint16_t bdf)
     g_autofree char *iommu_node = NULL;
     g_autofree char *pci_node = NULL;
 
-    pci_node = g_strdup_printf("/soc/pci@%lx",
-                               (long) s->memmap[VIRT_PCIE_ECAM].base);
+    pci_node = g_strdup_printf("/soc/pci@%"HWADDR_PRIx,
+                               s->memmap[VIRT_PCIE_ECAM].base);
     iommu_node = g_strdup_printf("%s/iommu@%x", pci_node, bdf);
     iommu_phandle = qemu_fdt_alloc_phandle(fdt);
     qemu_fdt_add_subnode(fdt, iommu_node);
@@ -1181,8 +1182,8 @@ static void create_fdt(RISCVVirtState *s)
      * The "/soc/pci@..." node is needed for PCIE hotplugs
      * that might happen before finalize_fdt().
      */
-    name = g_strdup_printf("/soc/pci@%lx",
-                           (long) s->memmap[VIRT_PCIE_ECAM].base);
+    name = g_strdup_printf("/soc/pci@%"HWADDR_PRIx,
+                           s->memmap[VIRT_PCIE_ECAM].base);
     qemu_fdt_add_subnode(ms->fdt, name);
 
     qemu_fdt_add_subnode(ms->fdt, "/chosen");
-- 
2.49.0


