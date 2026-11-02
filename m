Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5CC9606A882
	for <qemu-riscv@archiver.kernel.org>; Mon,  2 Nov 2026 11:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lanxincomputing-com.20200927.dkim.feishu.cn header.i=@lanxincomputing-com.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=Z8V23ZOa
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xNq8l-0008Ap-GE; Mon, 02 Nov 2026 06:23:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiangwencheng@lanxincomputing.com>)
 id 1xNq8j-0008Ad-KJ
 for qemu-riscv@nongnu.org; Mon, 02 Nov 2026 06:23:49 -0500
Received: from va-2-37.ptr.blmpb.com ([209.127.231.37])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xiangwencheng@lanxincomputing.com>)
 id 1xNq8c-0003Ll-2A
 for qemu-riscv@nongnu.org; Mon, 02 Nov 2026 06:23:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=lanxincomputing-com.20200927.dkim.feishu.cn; t=1793618608;
 h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=xLy6cOh90BVNp0u6XsLslj1BlhSOtamgposwTu68dHs=;
 b=Z8V23ZOadYOM0BJrqN+ZBvE8ahNzU6/JnI66DrpD1riurU2KVpbKj6Tzr638/aUhVKQCaC
 kw90dYcFR08vtLwFy9rzuYVXiyHVVQpVEh74VtXoorSjcoKLlYffQVcFd4nw7pvbSZX1Jp
 qo02VD088BXnhvaq8vhUD03MpMoeYS+fij8dEowUQ8J4FHcR0jMt5Ydvyw2Y5khNjTht0O
 tBEQnloh5VsMyOBmpTP7bwoIJOKuAXJDTGI3xC/HdTrJ7bnyCRt4eV9yQdWjtRhAM0odtn
 nCsUYpm+rkBXQHBUpdW9UM95qbhIFpxncUJCLbS44muXDS08oqvy4VADyJz1KQ==
To: <palmer@dabbelt.com>
From: "BillXiang" <xiangwencheng@lanxincomputing.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Cc: <alistair.francis@wdc.com>, <liwei1518@gmail.com>, 
 <daniel.barboza@oss.qualcomm.com>, <zhiwei_liu@linux.alibaba.com>, 
 <chao.liu@processmission.com>, <anup@brainfault.org>, 
 <qemu-riscv@nongnu.org>, "BillXiang" <xiangwencheng@lanxincomputing.com>
X-Lms-Return-Path: <lba+26ae872ae+34a5b1+nongnu.org+xiangwencheng@lanxincomputing.com>
X-Original-From: BillXiang <xiangwencheng@lanxincomputing.com>
Date: Mon,  2 Nov 2026 19:22:56 +0800
Message-Id: <20261102112256.848400-1-xiangwencheng@lanxincomputing.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=UTF-8
Subject: [PATCH] hw/intc/aplic: Fix msicfgaddrH in split mode
X-Mailer: git-send-email 2.53.0
Received: from lanxin-ThinkBook-16-G5-IRH.lan ([123.120.5.129]) by
 smtp.feishu.cn with ESMTP; Mon, 02 Nov 2026 19:23:25 +0800
Received-SPF: pass client-ip=209.127.231.37;
 envelope-from=xiangwencheng@lanxincomputing.com; helo=va-2-37.ptr.blmpb.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, MSGID_FROM_MTA_HEADER=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add hart_bits and guest_bits to msicfgaddrH in KVM irqchip
split mode.
Also remove the redundant left shift when loading
kvm_msicfgaddrH in riscv_aplic_msi_send().

Signed-off-by: BillXiang <xiangwencheng@lanxincomputing.com>
---
 hw/intc/riscv_aplic.c         | 13 +++++++++----
 hw/riscv/aia.c                |  6 +++++-
 include/hw/intc/riscv_aplic.h |  3 ++-
 3 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/hw/intc/riscv_aplic.c b/hw/intc/riscv_aplic.c
index 03a0852b8b..2b618e73df 100644
--- a/hw/intc/riscv_aplic.c
+++ b/hw/intc/riscv_aplic.c
@@ -182,7 +182,8 @@ bool riscv_use_emulated_aplic(bool msimode)
     return kvm_kernel_irqchip_split();
 }
 
-void riscv_aplic_set_kvm_msicfgaddr(RISCVAPLICState *aplic, hwaddr addr)
+void riscv_aplic_set_kvm_msicfgaddr(RISCVAPLICState *aplic, hwaddr addr,
+                                    uint32_t hart_bits, uint32_t guest_bits)
 {
     if (!kvm_enabled()) {
         return;
@@ -191,8 +192,12 @@ void riscv_aplic_set_kvm_msicfgaddr(RISCVAPLICState *aplic, hwaddr addr)
     if (riscv_use_emulated_aplic(aplic->msimode)) {
         addr >>= APLIC_xMSICFGADDR_PPN_SHIFT;
         aplic->kvm_msicfgaddr = extract64(addr, 0, 32);
-        aplic->kvm_msicfgaddrH = extract64(addr, 32, 32) &
-                                 APLIC_MMSICFGADDRH_VALID_MASK;
+        aplic->kvm_msicfgaddrH =
+            ((hart_bits & APLIC_xMSICFGADDRH_LHXW_MASK) <<
+             APLIC_xMSICFGADDRH_LHXW_SHIFT) |
+            ((guest_bits & APLIC_xMSICFGADDRH_LHXS_MASK) <<
+             APLIC_xMSICFGADDRH_LHXS_SHIFT) |
+            (extract64(addr, 32, 32) & APLIC_xMSICFGADDRH_BAPPN_MASK);
     }
 }
 
@@ -404,7 +409,7 @@ static void riscv_aplic_msi_send(RISCVAPLICState *aplic,
 
     if (aplic->kvm_splitmode) {
         msicfgaddr = aplic->kvm_msicfgaddr;
-        msicfgaddrH = ((uint64_t)aplic->kvm_msicfgaddrH << 32);
+        msicfgaddrH = aplic->kvm_msicfgaddrH;
     } else {
         msicfgaddr = aplic_m->mmsicfgaddr;
         msicfgaddrH = aplic_m->mmsicfgaddrH;
diff --git a/hw/riscv/aia.c b/hw/riscv/aia.c
index 56fc064533..bd608bd7a6 100644
--- a/hw/riscv/aia.c
+++ b/hw/riscv/aia.c
@@ -38,6 +38,7 @@ DeviceState *riscv_create_aia(MemoryRegion *container,
 {
     int i;
     hwaddr addr = 0;
+    uint32_t hart_bits, guest_bits;
     DeviceState *aplic_s_dev = NULL;
     DeviceState *aplic_m_dev = NULL;
 
@@ -93,7 +94,10 @@ DeviceState *riscv_create_aia(MemoryRegion *container,
                                  msimode, false, aplic_m_dev);
 
     if (kvm_enabled() && msimode) {
-        riscv_aplic_set_kvm_msicfgaddr(RISCV_APLIC(aplic_s_dev), addr);
+        hart_bits = imsic_num_bits(hart_count);
+        guest_bits = imsic_num_bits(aia_guests + 1);
+        riscv_aplic_set_kvm_msicfgaddr(RISCV_APLIC(aplic_s_dev), addr,
+                                    hart_bits, guest_bits);
     }
 
     return kvm_enabled() ? aplic_s_dev : aplic_m_dev;
diff --git a/include/hw/intc/riscv_aplic.h b/include/hw/intc/riscv_aplic.h
index 62d2b33ade..d3ee2e537a 100644
--- a/include/hw/intc/riscv_aplic.h
+++ b/include/hw/intc/riscv_aplic.h
@@ -78,7 +78,8 @@ struct RISCVAPLICState {
 void riscv_aplic_add_child(DeviceState *parent, DeviceState *child);
 bool riscv_is_kvm_aia_aplic_imsic(bool msimode);
 bool riscv_use_emulated_aplic(bool msimode);
-void riscv_aplic_set_kvm_msicfgaddr(RISCVAPLICState *aplic, hwaddr addr);
+void riscv_aplic_set_kvm_msicfgaddr(RISCVAPLICState *aplic, hwaddr addr,
+                                    uint32_t hart_bits, uint32_t guest_bits);
 
 DeviceState *riscv_aplic_create(MemoryRegion *container,
     hwaddr addr, hwaddr size, uint32_t hartid_base, uint32_t num_harts,
-- 
2.53.0

