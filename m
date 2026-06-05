Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E91ACD6E74
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jun 2026 11:07:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wVSOA-0008N9-1z; Fri, 05 Jun 2026 07:06:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qingwei.hu@bytedance.com>)
 id 1wVSNw-0008Gq-W6
 for qemu-riscv@nongnu.org; Fri, 05 Jun 2026 07:06:46 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <qingwei.hu@bytedance.com>)
 id 1wVSNt-0005uy-S0
 for qemu-riscv@nongnu.org; Fri, 05 Jun 2026 07:06:44 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-2c0bd02d97eso20642665ad.2
 for <qemu-riscv@nongnu.org>; Fri, 05 Jun 2026 04:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1780657600; x=1781262400; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4BOUEe+VamKGk6MRknmAp6o59Ee2hSdf7ohcP2aYG4I=;
 b=TvK3GRuK91TLw+5AKl1JqhSn7oJ7gd9Z/Rw9JxCd/kuF51eIKMwGqydturUgS4e4DC
 QiSdltLRYcaTij8yp4emdMjBDJZ8MTxmmJzSdPWpSEeQWUpw/gS1afN1S5/nSW7UK7pV
 3eDWdWo10wWZhKY0+jNty0eLqyBhRewZ9VPplTJY2u0nnUbwAsftlqId1UNmFvNZ/Ne4
 2NcACUgx+FxoqDf/CnzD9Kr9HUlKDtv3khTIMMoPNgdX5NfglBbhD2WBg9CdiemqouBH
 o7r02F7Nz89Zxr0goaFfGuavmn14Jfd4rTnZzYtwqDeXAwzYuCJRBa8DBiXwpYOmLaXv
 79RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780657600; x=1781262400;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4BOUEe+VamKGk6MRknmAp6o59Ee2hSdf7ohcP2aYG4I=;
 b=rtR9W4F8DjJohhuxrXZQea0nrHJlAPQsyEnXP0JMLzCTpjACS9P74+SSK+4amzMO+R
 kV0wZFMFVMELIYHWDPDQ4p9cjcdYePj+Z2F0DFBwVOBeYRl2QGo45zZ0WQk7f40jzs2+
 xfGrjUYqcKI6INPbwwAWQ0XsmKuaRdQs3L+lSpt2Qi1C4+xaKma08k9qwLp6NZQC75qE
 OSVNxynRBuxFdsenzq4jQXUPQCFqdCBNQ6pEWo1shHs1IavBnY+tmJBoRNdGhTGqo0/c
 CBoxVirAH1SDb3SfnCr8TAen0q3xFNEiVu7kJ5c0iD3/gmP7V/flv6F4MHHUIxq1OuZS
 yQEQ==
X-Gm-Message-State: AOJu0YxQF6csL7Ibqn2WAXIDeVPKuhHdyAQetht8euXI4bU6UDXX90WG
 DrRJUI0AszCGeHYV2y3i5ssqT5a5r1aX6VhBfYtmw1p0EruJ/g45mzc95t7zeM9riAA=
X-Gm-Gg: Acq92OEeWAoJFOZKpoSPlPRZDEiRpVETyUS8mXxiHmuD4DrPJ7ukYVRdcvY8m7w9qDv
 A8xDXnDIadMgsbkY98iQ1a1U6hVGAGqaqMFEWO19phOREjrL+GZkNGOPCU7CQ+vV/JEX80neJuu
 6jQ0X7PuDdrxfEL1xSbOGI9u1buHaZPYI2KxqrQd6jq2wFgB29yGKc9Gl2IaM50pWxp+USpIB8q
 gOborW50tYwIq321+XyC2vg2MrsoJBVCaLwZLB5FvzQKLTij5MT1oP5CNgr5qXkcTWLPdSns5OF
 u4mCKNEcJ64l54J8H6xZJH1SHEegYAg2oo3A44OZwh9Gp9iNxuikkL/3JRL2sFTIs5NwNUN5WE+
 QyG53mdVNevQW8JuWYfuw9w9jcUzKoOpbcx/ja36VofrrYRuMmKN2wfaJgvdJpZqDk8uXkhj60U
 wzE9Okpo9eWspp+GYIJcR1aiue8/jZwb3Lenvh0ZZt6mj59vj5icQh
X-Received: by 2002:a17:903:2c0e:b0:2b2:4d36:7aa with SMTP id
 d9443c01a7336-2c1e85cdd1amr36937335ad.35.1780657599768; 
 Fri, 05 Jun 2026 04:06:39 -0700 (PDT)
Received: from n37-012-226.byted.org ([115.190.40.10])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c16629cf89sm88179605ad.56.2026.06.05.04.06.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2026 04:06:35 -0700 (PDT)
From: Qingwei Hu <qingwei.hu@bytedance.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 liwei1518@gmail.com, daniel.barboza@oss.qualcomm.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 jim.shu@sifive.com, Qingwei Hu <qingwei.hu@bytedance.com>
Subject: [PATCH] hw/intc: riscv_aia: Skip reset for KVM irqchip
Date: Fri,  5 Jun 2026 19:06:21 +0800
Message-Id: <20260605110621.644997-1-qingwei.hu@bytedance.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=qingwei.hu@bytedance.com; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

The emulated APLIC and IMSIC state arrays are only allocated when QEMU
handles the interrupt controller state itself. With KVM AIA/APLIC-IMSIC,
the interrupt controller state is owned by the KVM in-kernel irqchip, so
these emulated state arrays are not allocated.

The reset handlers added for APLIC and IMSIC still clear those arrays
unconditionally. This makes qemu_system_reset(), which runs during machine
creation, dereference NULL pointers with -machine virt,aia=aplic-imsic and
KVM.

Skip the emulated APLIC and IMSIC reset paths when the interrupt controller
is handled by KVM. The emulated paths are unchanged for TCG and for
configurations that use QEMU emulation.

Fixes: 99bfcd329a ("hw/intc: riscv_aplic: Add reset API to APLIC")
Fixes: 766391483b ("hw/intc: riscv_imsic: Add reset API to IMSIC")
Signed-off-by: Qingwei Hu <qingwei.hu@bytedance.com>
---
 hw/intc/riscv_aplic.c | 4 ++++
 hw/intc/riscv_imsic.c | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/hw/intc/riscv_aplic.c b/hw/intc/riscv_aplic.c
index c2c67c29e6..84606e9f3d 100644
--- a/hw/intc/riscv_aplic.c
+++ b/hw/intc/riscv_aplic.c
@@ -910,6 +910,10 @@ static void riscv_aplic_reset_enter(Object *obj, ResetType type)
     RISCVAPLICState *aplic = RISCV_APLIC(obj);
     int i;
 
+    if (!riscv_use_emulated_aplic(aplic->msimode)) {
+        return;
+    }
+
     aplic->domaincfg = 0;
     memset(aplic->sourcecfg, 0, sizeof(uint32_t) * aplic->num_irqs);
     memset(aplic->target, 0, sizeof(uint32_t) * aplic->num_irqs);
diff --git a/hw/intc/riscv_imsic.c b/hw/intc/riscv_imsic.c
index ac59496c22..f1f23c3a3e 100644
--- a/hw/intc/riscv_imsic.c
+++ b/hw/intc/riscv_imsic.c
@@ -347,6 +347,10 @@ static void riscv_imsic_reset_enter(Object *obj, ResetType type)
     RISCVIMSICState *imsic = RISCV_IMSIC(obj);
     int i;
 
+    if (kvm_irqchip_in_kernel()) {
+        return;
+    }
+
     memset(imsic->eidelivery, 0, sizeof(uint32_t) * imsic->num_pages);
     memset(imsic->eithreshold, 0, sizeof(uint32_t) * imsic->num_pages);
 
-- 
2.47.3


