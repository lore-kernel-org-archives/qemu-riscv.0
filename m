Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 065E9EB8FDE
	for <qemu-riscv@archiver.kernel.org>; Fri,  8 Sep 2023 03:33:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qeSEd-0007Ny-Rw; Thu, 07 Sep 2023 23:32:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1qeSEa-0007De-V0; Thu, 07 Sep 2023 23:32:40 -0400
Received: from out30-110.freemail.mail.aliyun.com ([115.124.30.110])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1qeSEX-00064c-9p; Thu, 07 Sep 2023 23:32:40 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R561e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046056;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=4; SR=0;
 TI=SMTPD_---0VraxtTB_1694143948; 
Received: from L-PF1D6DP4-1208.hz.ali.com(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VraxtTB_1694143948) by smtp.aliyun-inc.com;
 Fri, 08 Sep 2023 11:32:29 +0800
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, LIU Zhiwei <lzw194868@alibaba-inc.com>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [RESEND] qemu/timer: Add host ticks function for RISC-V
Date: Fri,  8 Sep 2023 11:31:29 +0800
Message-Id: <20230908033129.694-1-zhiwei_liu@linux.alibaba.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.110;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-110.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UNPARSEABLE_RELAY=0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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

From: LIU Zhiwei <lzw194868@alibaba-inc.com>

Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
---
 include/qemu/timer.h | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/include/qemu/timer.h b/include/qemu/timer.h
index 9a91cb1248..105767c195 100644
--- a/include/qemu/timer.h
+++ b/include/qemu/timer.h
@@ -979,6 +979,25 @@ static inline int64_t cpu_get_host_ticks(void)
     return cur - ofs;
 }
 
+#elif defined(__riscv) && defined(__riscv_xlen) && __riscv_xlen == 32
+static inline int64_t cpu_get_host_ticks(void)
+{
+    uint32_t lo, hi;
+    asm volatile("RDCYCLE %0\n\t"
+                 "RDCYCLEH %1"
+                 : "=r"(lo), "=r"(hi));
+    return lo | (uint64_t)hi << 32;
+}
+
+#elif defined(__riscv) && defined(__riscv_xlen) && __riscv_xlen > 32
+static inline int64_t cpu_get_host_ticks(void)
+{
+    int64_t val;
+
+    asm volatile("RDCYCLE %0" : "=r"(val));
+    return val;
+}
+
 #else
 /* The host CPU doesn't have an easily accessible cycle counter.
    Just return a monotonically increasing value.  This will be
-- 
2.17.1


