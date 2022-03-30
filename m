Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nZNpw-0000gz-Sm
	for mharc-qemu-riscv@gnu.org; Tue, 29 Mar 2022 22:13:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nZNpv-0000dj-38; Tue, 29 Mar 2022 22:13:27 -0400
Received: from smtp23.cstnet.cn ([159.226.251.23]:58494 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nZNpt-0003xF-0N; Tue, 29 Mar 2022 22:13:26 -0400
Received: from localhost.localdomain (unknown [180.156.147.178])
 by APP-03 (Coremail) with SMTP id rQCowAC3Pne+vENiGD5iAA--.41310S2;
 Wed, 30 Mar 2022 10:13:18 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [RESEND PATCH] target/riscv: fix start byte for vmv<nf>r.v when
 vstart != 0
Date: Wed, 30 Mar 2022 10:13:16 +0800
Message-Id: <20220330021316.18223-1-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: rQCowAC3Pne+vENiGD5iAA--.41310S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtw1UGr18Zr18uFy8urWUCFg_yoWkAFg_KF
 48WF95G3yxua1YyF98Kr15AF1UurykGry8Kw47trWfW3y0gw4ayw18tw1fAr1UZF4xJF9F
 y3ZxurWfuF43WjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbxxFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
 A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
 Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
 1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
 7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
 1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AK
 xVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F4
 0E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFyl
 IxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxV
 AFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6Fyj6rWUJwCI42IY6I8E87Iv67AKxVWU
 JVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUr2
 -eDUUUU
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.23; envelope-from=liweiwei@iscas.ac.cn;
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
X-List-Received-Date: Wed, 30 Mar 2022 02:13:27 -0000

The spec for vmv<nf>r.v says: 'the instructions operate as if EEW=SEW,
EMUL = NREG, effective length evl= EMUL * VLEN/SEW.'

So the start byte for vstart != 0 should take sew into account

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
---
 target/riscv/vector_helper.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 1d4982ef7f..b5fbdabbb1 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4890,13 +4890,15 @@ GEN_VEXT_VCOMPRESS_VM(vcompress_vm_d, uint64_t, H8)
 /* Vector Whole Register Move */
 void HELPER(vmvr_v)(void *vd, void *vs2, CPURISCVState *env, uint32_t desc)
 {
-    /* EEW = 8 */
+    /* EEW = SEW */
     uint32_t maxsz = simd_maxsz(desc);
-    uint32_t i = env->vstart;
+    uint32_t sewb = 1 << FIELD_EX64(env->vtype, VTYPE, VSEW);
+    uint32_t startb = env->vstart * sewb;
+    uint32_t i = startb;
 
     memcpy((uint8_t *)vd + H1(i),
            (uint8_t *)vs2 + H1(i),
-           maxsz - env->vstart);
+           maxsz - startb);
 
     env->vstart = 0;
 }
-- 
2.17.1


