Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E653FC5DF97
	for <qemu-riscv@archiver.kernel.org>; Wed, 26 Aug 2026 22:07:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wzLks-00056P-7v; Wed, 26 Aug 2026 18:05:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wzLkp-00055P-UR
 for qemu-riscv@nongnu.org; Wed, 26 Aug 2026 18:05:55 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wzLkn-0004h8-Tm
 for qemu-riscv@nongnu.org; Wed, 26 Aug 2026 18:05:55 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-383b4a3755fso1900860a91.3
 for <qemu-riscv@nongnu.org>; Wed, 26 Aug 2026 15:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787781952; x=1788386752; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ciIuJKjZ6j1nR/uMT+7qHvjI8S/CyEwP7dM8aiHQmjM=;
 b=IDQN7MjjnF6HL760fUyjlW5AWDGFTRxLq2DAjnuBzt9p3y1cfg/EscZFIhzYbERzzn
 YEx5/1VRqgXjQjEtb8LH0GOFlyWAr7C2YeOQQFgzOjLLAbNFTCDr2oMlLGfoyJC4NKa/
 v0l9/j2eYEymCGpYcTKr2/Q25EY51IjLegWZtgRpVDThc3BRSgdMSW/bcmtaMpjhSmTS
 oodf/diG404x/vGItGc6BlBJpYHUtQfH2iFwwiKlnAmxNhw8o/z7Lzh9teByw+X/fVxu
 VygDws09xauArO2JSujctbzj+WkbPRzqBbc/sUTu9/pq5UU5qV3VNs181NsyQO3PXVSc
 dMiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787781952; x=1788386752;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=ciIuJKjZ6j1nR/uMT+7qHvjI8S/CyEwP7dM8aiHQmjM=;
 b=L3ayZ6YI/Bnjd4uW0GBKVVn6Q5oSGpLpnEZ4XQfjRbT/Vn/pplakq0PRiijjWjNiXE
 wVBtcnKNDu+tSmZjq4Bqhz4StSUcL0kFPtdNQI87vWwa0hk6Pcq9i2vjbx/NarUvmSSX
 cKHvmFtI/Uq1jEZ8R4rlmIqPJbcvgtnFKFNlcjS8wZqf7nNv4vISwqb2+Wxmso0OKEU5
 a6m5rIWdGCNwPwJ45y0uYj0ub5pCfb/GnGf2LgrRahtMFSHgwL9wfsUQxpRjhJPDBy0t
 IufQhmLrILvYB2NvH+xgOiIwPc9mkgmNJsEjcp+e9cqdhefGrkGRiHh7dSDwI3MGv3eK
 Eq1Q==
X-Forwarded-Encrypted: i=1;
 AHgh+RrirUhrKC/XcVv5LCkFnmch44HxheRoWy8z4ICFJpF74iKnSw2Xrp0ast/EB3eFk7S7E0HKblijbQQE@nongnu.org
X-Gm-Message-State: AFuF++lgdNwlIGmZYGdXlZUU+k7D4gJYpwUNo3h4+m2JOC3vzJNoCrd4
 0sPwpbH7QBbcC0y6WLfqQWh/Br3/gC3qkgfGwSuldbpYVjZQaVVOHrYB
X-Gm-Gg: AR+sD12XOZYmUj52XgFP36grlT4npLqCZDQD7POh+lGK/BI9Nho8K6V1rE0fVcZDPLR
 XcdoOyLHJp7vsR77Dlu7uWffTO92bbgh7yQ7LXupfLIpTGaLi4KyKuxCsAvyzuw12b8fWhUxtoP
 GYjylgF1zHf0v5s0M2AtDDRYialKu/XG/vRS2+NyiZFHsxSzesmjEXez2mQRI4JO5ct/4t+kFY1
 N5HrLBv1oQpnbpOalteYd1Q9QwBgbxnyahNnQl0GvJHCy3JgNhdQPOK8ofLZ3nPYn77ByxJFohO
 xkjEyUS6gIf7e4F229hRAwVRSjcdPjv9QJpJgZx47fWtiEMxTvINcwyj+oC7gjENOBXnPnUwbFq
 2SmnQtNWYWegHsDee6EA1GOrvhKpEp4Y3iVeq99uGGwG4GKnW8tp+8Susj8L3mVCUoWg7P4rUiW
 wmFu4lKHGRy0kOVpZZV1kO25FW6JsEhUkNSPs9pQ4HUFAgXofY7Z3I5ZlKCGhJmPUj3QJxbk2N1
 lXDLDwfmMjq3kfMRvT6NKsp9vuqqK0+teQGqUNCy5X1JvUMAbSGibMiQR59gf2pddKgXozW34fR
 91OxlH67AH7teG5ECY/P+GlOZY3t5VI=
X-Received: by 2002:a17:90b:48c9:b0:36d:b424:4f17 with SMTP id
 98e67ed59e1d1-3966d3690e2mr22183984a91.1.1787781952429; 
 Wed, 26 Aug 2026 15:05:52 -0700 (PDT)
Received: from donnager-debian.. ([180.150.112.50])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-39668a573a1sm5789956a91.14.2026.08.26.15.05.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2026 15:05:51 -0700 (PDT)
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
Subject: [PATCH 01/16] hw/riscv/aia: Take a MemoryRegion for the created
 devices
Date: Thu, 27 Aug 2026 07:35:11 +0930
Message-ID: <20260826220528.54516-2-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260826220528.54516-1-joel@jms.id.au>
References: <20260826220528.54516-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=joel.stan@gmail.com; helo=mail-pj1-x102b.google.com
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

Add a MemoryRegion parameter to riscv_create_aia(), to be passed on to
the IMSIC and APLIC helpers so a SoC can have the controllers mapped
into its own memory container. Both callers pass system_memory, so there
is no change in behaviour.

As the controllers don't yet take a MemoryRegion the parameter is not
yet passed on. Changing riscv_create_aia first avoids churn in the
intermediate commits.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 hw/riscv/aia.h         | 2 +-
 hw/riscv/aia.c         | 2 +-
 hw/riscv/tt_atlantis.c | 3 ++-
 hw/riscv/virt.c        | 3 ++-
 4 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/hw/riscv/aia.h b/hw/riscv/aia.h
index 3b6d7f962506..82ab601bf188 100644
--- a/hw/riscv/aia.h
+++ b/hw/riscv/aia.h
@@ -13,7 +13,7 @@
 
 uint32_t imsic_num_bits(uint32_t count);
 
-DeviceState *riscv_create_aia(bool msimode, int aia_guests,
+DeviceState *riscv_create_aia(MemoryRegion *mr, bool msimode, int aia_guests,
                              uint32_t m_imsic_stride,
                              uint32_t s_imsic_stride,
                              uint16_t num_sources,
diff --git a/hw/riscv/aia.c b/hw/riscv/aia.c
index c1a5982856c5..651552c8f970 100644
--- a/hw/riscv/aia.c
+++ b/hw/riscv/aia.c
@@ -24,7 +24,7 @@ uint32_t imsic_num_bits(uint32_t count)
     return ret;
 }
 
-DeviceState *riscv_create_aia(bool msimode, int aia_guests,
+DeviceState *riscv_create_aia(MemoryRegion *mr, bool msimode, int aia_guests,
                              uint32_t m_imsic_stride,
                              uint32_t s_imsic_stride,
                              uint16_t num_sources,
diff --git a/hw/riscv/tt_atlantis.c b/hw/riscv/tt_atlantis.c
index babce2b680f2..d69851df0a01 100644
--- a/hw/riscv/tt_atlantis.c
+++ b/hw/riscv/tt_atlantis.c
@@ -496,7 +496,8 @@ static void tt_atlantis_machine_init(MachineState *machine)
                             &error_abort);
     sysbus_realize(SYS_BUS_DEVICE(&s->soc), &error_fatal);
 
-    s->irqchip = riscv_create_aia(true, TT_IMSIC_GUESTS,
+    s->irqchip = riscv_create_aia(system_memory,
+                                  true, TT_IMSIC_GUESTS,
                                   TT_IMSIC_STRIDE,
                                   TT_IMSIC_STRIDE,
                                   TT_IRQCHIP_NUM_SOURCES,
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 329ccdb5a7b6..22a607ed10bf 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1411,8 +1411,9 @@ static void virt_machine_init(MachineState *machine)
             s->irqchip[i] = virt_create_plic(s->memmap, i,
                                              base_hartid, hart_count);
         } else {
+            bool msimode = s->aia_type == VIRT_AIA_TYPE_APLIC_IMSIC;
             int imsic_bits = imsic_num_bits(s->aia_guests + 1);
-            s->irqchip[i] = riscv_create_aia(s->aia_type == VIRT_AIA_TYPE_APLIC_IMSIC,
+            s->irqchip[i] = riscv_create_aia(system_memory, msimode,
                                              s->aia_guests,
                                              IMSIC_HART_SIZE(0),
                                              IMSIC_HART_SIZE(imsic_bits),
-- 
2.47.3


