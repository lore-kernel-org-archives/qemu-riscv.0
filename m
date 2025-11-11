Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78298CCF9E3
	for <qemu-riscv@archiver.kernel.org>; Tue, 11 Nov 2025 11:50:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vImrQ-00072S-4M; Tue, 11 Nov 2025 06:48:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1vImqh-000503-8W
 for qemu-riscv@nongnu.org; Tue, 11 Nov 2025 06:47:47 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1vImqd-0004Q5-Um
 for qemu-riscv@nongnu.org; Tue, 11 Nov 2025 06:47:46 -0500
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-29844c68068so3468755ad.2
 for <qemu-riscv@nongnu.org>; Tue, 11 Nov 2025 03:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1762861660; x=1763466460; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FVYI3uDYuiUnuBphImalv/xBwCe/21ga86oRo136tDE=;
 b=ohkrdcSuj+flJaShRGoY9z471IdMV++XszvH9PL6/9UeQ2Nw87zejgSekGA2MNZ1B0
 yEnHtoDTF2FplZDQQIsdIdU03SHI3aHKu+HowIoX83sFQlDvDz1VYoIGFkDWq8w8sBGU
 4vxUCClADGB3sSOPL0i0X4+LHmf7O5WU+vDqmcpgI30WqmO5/SA1wahXG3L1MDoZou5z
 bGhGriXMDl9xhUW9cMgf4IiMTJDdiOdVg7D9W2S3H5fTwuHASfhQanNQRDCa5W0QU708
 gOMrdJbxDkZrBNeYR2yjepqlWNCUq78hehZh05rNpqNUKel94F4iAwb3rP+pofbNZaqW
 6TFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762861660; x=1763466460;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=FVYI3uDYuiUnuBphImalv/xBwCe/21ga86oRo136tDE=;
 b=uwohh30pLkn/qhdct1yPOlDBJU+xI6LMpuWH+MJL2vv3Nt9yu/ZAvIGRxcDIfoeDef
 qF1amozQ1h0pMV6Ckzoe0DOIGW0GPvwuFSRPxhBWtXSWLYtQOb5bbkhjtZsUCwrUqPPL
 us9UINrQSHX3nSxyvFGJu9nl8qdfS5caCror/Jv0Rb9i4WNauifJSa3QneooAfCjcmoK
 S2Rm2/zj0T2uk/+KgW9wvIQ6Y+G/IW3wHDBgD47f8h12ZSyVOo1C1QURUI5hKa0D0M6e
 TpPlNq3axXdwNC1UhxkzEWxJaeXQTalWmgnI8aW6UmTJipUvguuXp7mFjqQ70FZM61Kw
 e9OQ==
X-Gm-Message-State: AOJu0Yx535WCl7A0+y12f53sdNncdDF1/sgem2hg9HbwPmqCYDBZbOQ/
 PVrHtiY+wbLHOVXvrrTUnAIdi0i+GHcKu6kK3NQ+ElwbBHh9gm+JT48yfPaFrFIAj+0=
X-Gm-Gg: ASbGncsNj3MQZK/9WyfmHyy4FKJTj1Jsay6IWHLIQq7ShwW/LURXIfFjT8sc7LNIVTx
 9radWnO5PZtgfscouhLfHrCjnm9J4vbaWwuScX740NMmZsiie8avsOgJ3wTNcuFWJTurAh1hzn0
 RoSLOeeyRntGc51tTC6Spx4Hkmiaq7XTAv1enscVVTls5R/Uw46ZR4qS7NFSIRpkDZnHI1JeYuv
 OldybhTcsdJLDGhoMcR6Xt/JZG7BlOIZ5Wi5yPve1AtdVAu8cEDvauSKVFThDEt/wSuUUY9e6W2
 VIP6twJO1DEoLazCO8PITTCAWiFT5BN9BAlg05Z8Zj4rqXhklbYPWLWwBKeoSiGQ0j7JpOrUHaU
 apvyAytp8TBFA+yi8N6p1sQEjoF9h4BZau3cD6F+og3ESOy1dmNTZPaqG4y3i0WIsUmF3QbY9PL
 cxrQFbMrrUETONLLxpmsXLbVm9OSE=
X-Google-Smtp-Source: AGHT+IG/JmIzL6MQOcq4afromovbKQ+ojOkf+fQTkALXHkrzQWcq5fyv9wHkfQQIeXKgw8ke2ICTWA==
X-Received: by 2002:a17:903:3848:b0:294:def6:5961 with SMTP id
 d9443c01a7336-297e56d0868mr156485935ad.45.1762861660161; 
 Tue, 11 Nov 2025 03:47:40 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([179.93.21.233])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29651c747d1sm177533125ad.63.2025.11.11.03.47.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Nov 2025 03:47:39 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, palmer@dabbelt.com,
 Mayuresh Chitale <mchitale@ventanamicro.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 05/17] hw/riscv/virt.c add trace encoder and ramsink fdt
 nodes
Date: Tue, 11 Nov 2025 08:46:44 -0300
Message-ID: <20251111114656.2285048-6-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251111114656.2285048-1-dbarboza@ventanamicro.com>
References: <20251111114656.2285048-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x631.google.com
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

From: Mayuresh Chitale <mchitale@ventanamicro.com>

The trace encoder and trace ramsink nodes should confirm to the bindings
described in "riscv,trace-component.yaml" in the Linux kernel. That way,
encoder and ramsink devices get populated on the rvtrace bus and perf
record is able to capture the trace data in the auxtrace section as
expected.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 hw/riscv/virt.c | 58 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index b1a4d63efd..30e89a6c5a 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1142,6 +1142,62 @@ static void create_fdt_iommu(RISCVVirtState *s, uint16_t bdf)
     s->pci_iommu_bdf = bdf;
 }
 
+static void create_fdt_rvtrace(RISCVVirtState *s)
+{
+    static const char * const tr_compat[2] = { "qemu,trace-component",
+                                               "riscv,trace-component" };
+    g_autofree char *cpu_name = NULL, *ram_sink_name = NULL,
+                    *trencoder_name = NULL, *ep = NULL;
+    MachineState *ms = MACHINE(s);
+    int socket_count = riscv_socket_count(ms), i;
+    uint64_t addr, size = 0x100;
+    uint32_t rs_phandle;
+    RISCVCPU *cpu_ptr;
+
+
+    for (i = 0; i < socket_count; i++) {
+        for (int cpu = 0; cpu < s->soc[i].num_harts; cpu++) {
+            cpu_ptr = &s->soc[i].harts[cpu];
+            if (!cpu_ptr->trencoder) {
+                continue;
+            }
+            cpu_name = g_strdup_printf("/cpus/cpu@%d",
+                                       s->soc[i].hartid_base + cpu);
+            ram_sink_name = g_strdup_printf("/soc/ramsink@%d",
+                                            s->soc[i].hartid_base + cpu);
+            qemu_fdt_add_subnode(ms->fdt, ram_sink_name);
+            addr = object_property_get_uint(cpu_ptr->trencoder, "dest-baseaddr",
+                                            &error_abort);
+            qemu_fdt_setprop_sized_cells(ms->fdt, ram_sink_name, "reg", 2, addr,
+                                         2, size);
+            qemu_fdt_setprop_string_array(ms->fdt, ram_sink_name, "compatible",
+                                          (char **)&tr_compat,
+                                          ARRAY_SIZE(tr_compat));
+            qemu_fdt_setprop_phandle(ms->fdt, ram_sink_name, "cpu", cpu_name);
+            ep = g_strdup_printf("%s/in-ports/port/endpoint", ram_sink_name);
+            qemu_fdt_add_path(ms->fdt, ep);
+            rs_phandle = qemu_fdt_alloc_phandle(ms->fdt);
+            qemu_fdt_setprop_cell(ms->fdt, ep, "phandle", rs_phandle);
+
+
+            trencoder_name = g_strdup_printf("/soc/encoder@%d",
+                                             s->soc[i].hartid_base + cpu);
+            qemu_fdt_add_subnode(ms->fdt, trencoder_name);
+            addr = object_property_get_uint(cpu_ptr->trencoder, "baseaddr",
+                                            &error_abort);
+            qemu_fdt_setprop_sized_cells(ms->fdt, trencoder_name, "reg", 2,
+                                         addr, 2, size);
+            qemu_fdt_setprop_string_array(ms->fdt, trencoder_name, "compatible",
+                                          (char **)&tr_compat,
+                                          ARRAY_SIZE(tr_compat));
+            qemu_fdt_setprop_phandle(ms->fdt, trencoder_name, "cpus", cpu_name);
+            ep = g_strdup_printf("%s/out-ports/port/endpoint", trencoder_name);
+            qemu_fdt_add_path(ms->fdt, ep);
+            qemu_fdt_setprop_cell(ms->fdt, ep, "remote-endpoint", rs_phandle);
+        }
+    }
+}
+
 static void finalize_fdt(RISCVVirtState *s)
 {
     uint32_t phandle = 1, irq_mmio_phandle = 1, msi_pcie_phandle = 1;
@@ -1166,6 +1222,8 @@ static void finalize_fdt(RISCVVirtState *s)
     create_fdt_uart(s, irq_mmio_phandle);
 
     create_fdt_rtc(s, irq_mmio_phandle);
+
+    create_fdt_rvtrace(s);
 }
 
 static void create_fdt(RISCVVirtState *s)
-- 
2.51.1


