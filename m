Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D700C021A0
	for <qemu-riscv@archiver.kernel.org>; Mon, 17 Feb 2025 08:20:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tjwMB-0006fH-KQ; Mon, 17 Feb 2025 03:19:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1tjwM7-0006I7-1s
 for qemu-riscv@nongnu.org; Mon, 17 Feb 2025 03:19:55 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1tjwM3-00018I-Vp
 for qemu-riscv@nongnu.org; Mon, 17 Feb 2025 03:19:54 -0500
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-220e83d65e5so59190075ad.1
 for <qemu-riscv@nongnu.org>; Mon, 17 Feb 2025 00:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1739780390; x=1740385190; darn=nongnu.org;
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=bFiHejFbGdbLneg1PMfRNsRHZmY62voLe0kDtLpm8UU=;
 b=N3rfN8yeAP2A0Usip6T4nz8/VyQ7dZGFxYjDvMoabQd6hT/mUhVitpYAeWpOkkFIcF
 INP7XJIr3/sHjnVwwM6pqkYDCycLpaxJ1OqpHPV0ylBePXO55SlYTqjmGP3G9CoGDxBP
 gP4c1wlvXGxcdUAmsTbnO37fDd2STBo+53LAbTFJnIWnuaR9DaHNQl4omzqX6Qp5pAVm
 KO+QcuulvHhaPkMXaxlVOHkzaYq6GpngZV6FFBIyJAxSAcrv1hxPzVOmZhXSFcHaw/Lk
 MTHSgYXZnIGh4tjiOT3OF516CzrOZ2GH8hl546rOwuWtoqWN8Z8YRCS1CsOq2RAqmXPh
 MAaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739780390; x=1740385190;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bFiHejFbGdbLneg1PMfRNsRHZmY62voLe0kDtLpm8UU=;
 b=MWQ5cL59HDte1vDT1RnhoSAQDSv+xEbtAW0PJnS56TXU7PL0FXlPRzRvJgy6jhgMHR
 siU35YqwK+U1VBMsW6zp4kpYG3zvMgFF5m/3PYauaEKr5R65nDUrlTJ7nEevKq6JTInT
 Y0Vy2jshK+y8tfiPsIChXs/S/uhLpj8XuAZzDzkFtpYZDz8i3SqIMTlWYrdiGR2pJ5Et
 8dGNmn+ygi7ErcnnbaqBf/s2lpHyM5D4Sf94JHG6pFCIFZh3t69qAW+ZRFxn+7dEPZjc
 5oQHjvWoEMrt3EbM3VdDsmoH8ZXsvXErBCWto0CiartBAnOeS7xYSGuVJ8V639uVVVwD
 tFqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJqtdQDcRcGhmyMnT3Ot1KP2HijnnwchUDHV0Koie/JMf/711n3EGphfBI7pgUs4MX3mcFHUX7Wk+1@nongnu.org
X-Gm-Message-State: AOJu0YxN+gOwk/NPsUTNsPgu33Bb5ufhKvAbsOb8hR/FCwYQzAtdwzw0
 7NDrNgIZ9rfOjQUU2j8NhZTxCMgro3nLOUmF18ofPMPMEEjRpLRf4kmhw8IA2tw0Ciujq2MH6zs
 N
X-Gm-Gg: ASbGncvRv+OJi8oEoWzJ2MDgEi0UTzONkHV1U7AcExqsws8bRUFnKqIswF5v1Ags5iR
 wz+161ORmGFWPeMKkZWWAE6yHJN5S/UbJI6Y4euRBV6MVpsUuoa4TLEOpxtTurCpCV5+ATNA2FY
 Y/Pfw2R33CeIWOn4xKuiOr24QhBibv1OJBwpPgLAD1vCxhVEOqo0dbbueBwp77VuWa1Y8fqpkkX
 4Rkk3uv4R0sYl1RqlxPh1ZMLlU4Zzmu3R7P+2tt1XY48hbfTfWd/B8hDK8PxE2NXaYfLR78td21
 fuxS5E485jCuoKGSmjRxc3SjfVN5ZROhiae4Goe8jZW0aQ==
X-Google-Smtp-Source: AGHT+IE6JHetWL+ynPNPiAxhUakBDRX49vjz1apSxu5dJQ/ROQP8dlXTgFI22aawDM31pz32FIv8tA==
X-Received: by 2002:a17:902:e80b:b0:21f:1549:a563 with SMTP id
 d9443c01a7336-22103f0501dmr144016395ad.2.1739780389457; 
 Mon, 17 Feb 2025 00:19:49 -0800 (PST)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-220d556d5e6sm66023445ad.173.2025.02.17.00.19.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 00:19:49 -0800 (PST)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: greentime.hu@sifive.com, vincent.chen@sifive.com, frank.chang@sifive.com,
 jim.shu@sifive.com, Yong-Xuan Wang <yongxuan.wang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH 3/4] hw/intc/aplic: refine the APLIC realize
Date: Mon, 17 Feb 2025 16:19:25 +0800
Message-Id: <20250217081927.10613-4-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250217081927.10613-1-yongxuan.wang@sifive.com>
References: <20250217081927.10613-1-yongxuan.wang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=yongxuan.wang@sifive.com; helo=mail-pl1-x631.google.com
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

When the APLIC is emulated in the kernel, the GPIO output lines to CPUs
can be remove. In this case the APLIC trigger CPU interrupts by KVM APIs.

This patch also move the code that claim the CPU interrupts to the
beginning of APLIC realization. This can avoid the unnecessary resource
allocation before checking failed.

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
---
 hw/intc/riscv_aplic.c | 49 +++++++++++++++++++++++--------------------
 1 file changed, 26 insertions(+), 23 deletions(-)

diff --git a/hw/intc/riscv_aplic.c b/hw/intc/riscv_aplic.c
index 0974c6a5db39..e5714267c096 100644
--- a/hw/intc/riscv_aplic.c
+++ b/hw/intc/riscv_aplic.c
@@ -893,6 +893,26 @@ static void riscv_aplic_realize(DeviceState *dev, Error **errp)
     RISCVAPLICState *aplic = RISCV_APLIC(dev);
 
     if (riscv_use_emulated_aplic(aplic->msimode)) {
+        /* Create output IRQ lines for non-MSI mode */
+        if (!aplic->msimode) {
+            /* Claim the CPU interrupt to be triggered by this APLIC */
+            for (i = 0; i < aplic->num_harts; i++) {
+                RISCVCPU *cpu;
+
+                cpu = RISCV_CPU(cpu_by_arch_id(aplic->hartid_base + i));
+                if (riscv_cpu_claim_interrupts(cpu,
+                    (aplic->mmode) ? MIP_MEIP : MIP_SEIP) < 0) {
+                    error_report("%s already claimed",
+                                 (aplic->mmode) ? "MEIP" : "SEIP");
+                    exit(1);
+                }
+            }
+
+            aplic->external_irqs = g_malloc(sizeof(qemu_irq) *
+                                            aplic->num_harts);
+            qdev_init_gpio_out(dev, aplic->external_irqs, aplic->num_harts);
+        }
+
         aplic->bitfield_words = (aplic->num_irqs + 31) >> 5;
         aplic->sourcecfg = g_new0(uint32_t, aplic->num_irqs);
         aplic->state = g_new0(uint32_t, aplic->num_irqs);
@@ -927,23 +947,6 @@ static void riscv_aplic_realize(DeviceState *dev, Error **errp)
         }
     }
 
-    /* Create output IRQ lines for non-MSI mode */
-    if (!aplic->msimode) {
-        aplic->external_irqs = g_malloc(sizeof(qemu_irq) * aplic->num_harts);
-        qdev_init_gpio_out(dev, aplic->external_irqs, aplic->num_harts);
-
-        /* Claim the CPU interrupt to be triggered by this APLIC */
-        for (i = 0; i < aplic->num_harts; i++) {
-            RISCVCPU *cpu = RISCV_CPU(cpu_by_arch_id(aplic->hartid_base + i));
-            if (riscv_cpu_claim_interrupts(cpu,
-                (aplic->mmode) ? MIP_MEIP : MIP_SEIP) < 0) {
-                error_report("%s already claimed",
-                             (aplic->mmode) ? "MEIP" : "SEIP");
-                exit(1);
-            }
-        }
-    }
-
     msi_nonbroken = true;
 }
 
@@ -1067,15 +1070,15 @@ DeviceState *riscv_aplic_create(hwaddr addr, hwaddr size,
 
     if (riscv_use_emulated_aplic(msimode)) {
         sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, addr);
-    }
 
-    if (!msimode) {
-        for (i = 0; i < num_harts; i++) {
-            CPUState *cpu = cpu_by_arch_id(hartid_base + i);
+        if (!msimode) {
+            for (i = 0; i < num_harts; i++) {
+                CPUState *cpu = cpu_by_arch_id(hartid_base + i);
 
-            qdev_connect_gpio_out_named(dev, NULL, i,
-                                        qdev_get_gpio_in(DEVICE(cpu),
+                qdev_connect_gpio_out_named(dev, NULL, i,
+                                            qdev_get_gpio_in(DEVICE(cpu),
                                             (mmode) ? IRQ_M_EXT : IRQ_S_EXT));
+            }
         }
     }
 
-- 
2.17.1


