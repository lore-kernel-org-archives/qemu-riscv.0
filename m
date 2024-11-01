Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FA7DE674BA
	for <qemu-riscv@archiver.kernel.org>; Fri,  1 Nov 2024 08:36:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1t6n8k-00071Y-15; Fri, 01 Nov 2024 04:36:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1t6n8h-00070w-G7
 for qemu-riscv@nongnu.org; Fri, 01 Nov 2024 04:36:15 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1t6n8f-0003lT-Os
 for qemu-riscv@nongnu.org; Fri, 01 Nov 2024 04:36:15 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-20c8b557f91so17969605ad.2
 for <qemu-riscv@nongnu.org>; Fri, 01 Nov 2024 01:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1730450172; x=1731054972; darn=nongnu.org;
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=przCaPYxJ9fQC4VZIfRe5OYFhMQ8p8d0s9yPNLObsDs=;
 b=FFWaIdTUIFkzy3QMKQsgog0ljQq5CWf52a/150IV2TZez8j/inR0XZCK6ngFUmmi73
 iz/KYtz2ng1Nt2xcflG9IXYwBZ97R7wYTw+YuokPbsxSwSwgCkIol0I0ZZBMrKR4QdHr
 vguZhOyjuWjdtY8YVB4bIvrAvqT/PJC93ELEQe59XP95xi2kJzNMod5Mt4YxUPkjF5/C
 kRVOpT6HKvoAPP6iJQaNPFQ5TeMF+8jcKgOpe8JIE0FWV2pXhIeQD0UTnAKFEaJE/1Ta
 zQ9A1jLFvyucjifiD4OXEtf8yrrvPeYw8TS5Q75bnp/XTOTsVh7UUi1FbKINaBCgffoF
 vPXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730450172; x=1731054972;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=przCaPYxJ9fQC4VZIfRe5OYFhMQ8p8d0s9yPNLObsDs=;
 b=ekUMeoIa7otuou77fcsxWXLi6fLc3Kpdu5AQN0yfIgmRALOYinPt+y6nudOl/sQzIN
 JvbZbSSo4kXFyoboIdbkV36iUw2wUlXTEXbr8HWHz4COkzkmLbomet4jfkCwj/zBxRfk
 ekkYNkx/KHz9Rig8/5ZTP2C5Y+lXghJJWR82rnpK5KH3/E6ps7hcGfWOdfAG4nvM/lkj
 sbTIZD68MSQY3c6z6fSUum/ox3Kk21mNSPDfaXgstZWOKFCXOBufZFTMTpk2oYNcQiJS
 jznyJKRHWOfMVu295I502SzorGveod0u9lKTvEeE2Ig6BYysyta62f19jagYJGNtCt/+
 vyfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYONqPhVOBlProfHrRCrC2fNF5oBZ5K14qEqkklnP7tliLU+JVNLhZNdS97RgCP/KzU0mPEorP1zI6@nongnu.org
X-Gm-Message-State: AOJu0Ywy6F9bmPHrXvfzXEs6WzW/+Uf/KDavl76Ry2H/vP6hYLJbpxM1
 d3Vl/ZW6rhegw/+dW+29rNoycLPeus8kVjbdKXUJy2p3S20Y3sRvEoxjbnF/97hIMF1AEaI1Zop
 YgeI=
X-Google-Smtp-Source: AGHT+IGen5LEFIdk1+nLYaucNa/tBFck8QOee6s8JLjVWjEI9Lw4v07eb0qZrDlws3zYr1HTbI+4XQ==
X-Received: by 2002:a17:90b:20b:b0:2e2:b46f:d92c with SMTP id
 98e67ed59e1d1-2e8f105e9a3mr22750368a91.14.1730450171908; 
 Fri, 01 Nov 2024 01:36:11 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e92fbfb04asm4558451a91.50.2024.11.01.01.36.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2024 01:36:11 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: greentime.hu@sifive.com, vincent.chen@sifive.com, frank.chang@sifive.com,
 jim.shu@sifive.com, Yong-Xuan Wang <yongxuan.wang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH 1/1] hw/riscv: virt: prevent to use AIA MSI when host doesn't
 support it
Date: Fri,  1 Nov 2024 16:36:05 +0800
Message-Id: <20241101083606.5122-1-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=yongxuan.wang@sifive.com; helo=mail-pl1-x633.google.com
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

Currently QEMU will continue to emulate the AIA MSI devices and enable the
AIA extension for guest OS when the host kernel doesn't support the
in-kernel AIA irqchip. This will cause an illegal instruction exception
when the guest OS uses the IMSIC devices. Add additional checks to ensure
the guest OS only uses the AIA MSI device when the host kernel supports
the in-kernel AIA chip.

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Reviewed-by: Jim Shu <jim.shu@sifive.com>
---
 hw/riscv/virt.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 45a8c4f8190d..0d8e047844a6 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1567,12 +1567,19 @@ static void virt_machine_init(MachineState *machine)
         }
     }
 
-    if (kvm_enabled() && virt_use_kvm_aia(s)) {
-        kvm_riscv_aia_create(machine, IMSIC_MMIO_GROUP_MIN_SHIFT,
-                             VIRT_IRQCHIP_NUM_SOURCES, VIRT_IRQCHIP_NUM_MSIS,
-                             memmap[VIRT_APLIC_S].base,
-                             memmap[VIRT_IMSIC_S].base,
-                             s->aia_guests);
+    if (kvm_enabled() && s->aia_type == VIRT_AIA_TYPE_APLIC_IMSIC) {
+        if (virt_use_kvm_aia(s)) {
+            kvm_riscv_aia_create(machine, IMSIC_MMIO_GROUP_MIN_SHIFT,
+                                 VIRT_IRQCHIP_NUM_SOURCES,
+                                 VIRT_IRQCHIP_NUM_MSIS,
+                                 memmap[VIRT_APLIC_S].base,
+                                 memmap[VIRT_IMSIC_S].base,
+                                 s->aia_guests);
+        } else {
+            error_report("Host machine doesn't support in-kernel APLIC MSI, "
+                         "please use aia=none or aia=aplic");
+            exit(1);
+        }
     }
 
     if (riscv_is_32bit(&s->soc[0])) {
-- 
2.17.1


