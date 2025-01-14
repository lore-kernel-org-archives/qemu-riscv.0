Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7FD3E77188
	for <qemu-riscv@archiver.kernel.org>; Tue, 14 Jan 2025 05:27:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tXZSi-00074N-MS; Tue, 14 Jan 2025 00:27:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangborong@bosc.ac.cn>)
 id 1tXX9c-0004oA-AU
 for qemu-riscv@nongnu.org; Mon, 13 Jan 2025 21:59:45 -0500
Received: from out198-22.us.a.mail.aliyun.com ([47.90.198.22])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangborong@bosc.ac.cn>)
 id 1tXX9Y-0005Vz-W3
 for qemu-riscv@nongnu.org; Mon, 13 Jan 2025 21:59:43 -0500
Received: from DESKTOP-MLVKPO8.(mailfrom:huangborong@bosc.ac.cn
 fp:SMTPD_---.b2BeNuz_1736823245 cluster:ay29) by smtp.aliyun-inc.com;
 Tue, 14 Jan 2025 10:54:13 +0800
From: Huang Borong <huangborong@bosc.ac.cn>
To: palmer@dabbelt.com, alistair.francis@wdc.com, bmeng.cn@gmail.com,
 liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org,
	Huang Borong <huangborong@bosc.ac.cn>
Subject: [PATCH v1] hw/intc/riscv_aplic: Remove redundant masking of hart_idx
 in riscv_aplic_msi_send()
Date: Tue, 14 Jan 2025 10:53:19 +0800
Message-Id: <20250114025320.52696-1-huangborong@bosc.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=47.90.198.22; envelope-from=huangborong@bosc.ac.cn;
 helo=out198-22.us.a.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 14 Jan 2025 00:27:35 -0500
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

The line "hart_idx &= APLIC_xMSICFGADDR_PPN_LHX_MASK(lhxw);" was removed
because the same operation is performed later in the address calculation.
This change improves code clarity and avoids unnecessary operations.

Signed-off-by: Huang Borong <huangborong@bosc.ac.cn>
---
 hw/intc/riscv_aplic.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/intc/riscv_aplic.c b/hw/intc/riscv_aplic.c
index 4866649115..0974c6a5db 100644
--- a/hw/intc/riscv_aplic.c
+++ b/hw/intc/riscv_aplic.c
@@ -421,7 +421,6 @@ static void riscv_aplic_msi_send(RISCVAPLICState *aplic,
             APLIC_xMSICFGADDRH_HHXW_MASK;
 
     group_idx = hart_idx >> lhxw;
-    hart_idx &= APLIC_xMSICFGADDR_PPN_LHX_MASK(lhxw);
 
     addr = msicfgaddr;
     addr |= ((uint64_t)(msicfgaddrH & APLIC_xMSICFGADDRH_BAPPN_MASK)) << 32;
-- 
2.34.1


