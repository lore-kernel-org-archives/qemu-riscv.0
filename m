Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE39AC77B7E
	for <qemu-riscv@archiver.kernel.org>; Mon, 29 May 2023 12:18:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q3bok-0000zn-9j; Mon, 29 May 2023 08:17:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1q3boi-0000yH-Em; Mon, 29 May 2023 08:17:40 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1q3bof-00053a-Nl; Mon, 29 May 2023 08:17:40 -0400
Received: from localhost.localdomain (unknown [61.165.37.98])
 by APP-05 (Coremail) with SMTP id zQCowADHzorRl3Rk4iJ2Bw--.20494S5;
 Mon, 29 May 2023 20:17:25 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH 3/4] target/riscv: Support MSTATUS.MPV/GVA only when RVH is
 enabled
Date: Mon, 29 May 2023 20:17:18 +0800
Message-Id: <20230529121719.179507-4-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230529121719.179507-1-liweiwei@iscas.ac.cn>
References: <20230529121719.179507-1-liweiwei@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowADHzorRl3Rk4iJ2Bw--.20494S5
X-Coremail-Antispam: 1UD129KBjvJXoWrZryxWw17Xr47GrWxuw15Arb_yoW8Jr47pr
 Z3C3y3WrZ8JrZ2ya93JF4kWr1fGFW5G39rAa1kJa1rtF4rAayF9FyDtasFvrWDXFy7ZryY
 9F9I93s7ZF47AFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBK14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
 x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
 Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
 ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AI
 xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
 vE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xv
 r2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04
 v7MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_
 Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x
 0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8
 JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIx
 AIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbJ73DUUUUU=
 =
X-Originating-IP: [61.165.37.98]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.25; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

MPV and GVA bits are added by hypervisor extension to mstatus
and mstatush (if MXLEN=32).

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
---
 target/riscv/csr.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 58499b5afc..6ac11d1f11 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1311,11 +1311,9 @@ static RISCVException write_mstatus(CPURISCVState *env, int csrno,
     }
 
     if (xl != MXL_RV32 || env->debugger) {
-        /*
-         * RV32: MPV and GVA are not in mstatus. The current plan is to
-         * add them to mstatush. For now, we just don't support it.
-         */
-        mask |= MSTATUS_MPV | MSTATUS_GVA;
+        if (riscv_has_ext(env, RVH)) {
+            mask |= MSTATUS_MPV | MSTATUS_GVA;
+        }
         if ((val & MSTATUS64_UXL) != 0) {
             mask |= MSTATUS64_UXL;
         }
@@ -1351,7 +1349,7 @@ static RISCVException write_mstatush(CPURISCVState *env, int csrno,
                                      target_ulong val)
 {
     uint64_t valh = (uint64_t)val << 32;
-    uint64_t mask = MSTATUS_MPV | MSTATUS_GVA;
+    uint64_t mask = riscv_has_ext(env, RVH) ? MSTATUS_MPV | MSTATUS_GVA : 0;
 
     env->mstatus = (env->mstatus & ~mask) | (valh & mask);
 
-- 
2.25.1


