Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oOKyu-0007Vi-Rs
	for mharc-qemu-riscv@gnu.org; Wed, 17 Aug 2022 11:29:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liuyang22@iscas.ac.cn>)
 id 1oODmz-0000xh-Sq; Wed, 17 Aug 2022 03:48:35 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21]:44406 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liuyang22@iscas.ac.cn>)
 id 1oODmw-0006CR-P1; Wed, 17 Aug 2022 03:48:33 -0400
Received: from localhost.localdomain (unknown [182.37.30.21])
 by APP-01 (Coremail) with SMTP id qwCowACHaVpBnfxix+3RCQ--.34174S2;
 Wed, 17 Aug 2022 15:48:18 +0800 (CST)
From: Yang Liu <liuyang22@iscas.ac.cn>
To: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, liweiwei@iscas.ac.cn,
 Yang Liu <liuyang22@iscas.ac.cn>
Subject: [PATCH 1/2] target/riscv: rvv-1.0: Simplify vfwredsum code
Date: Wed, 17 Aug 2022 15:48:01 +0800
Message-Id: <20220817074802.20765-1-liuyang22@iscas.ac.cn>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowACHaVpBnfxix+3RCQ--.34174S2
X-Coremail-Antispam: 1UD129KBjvJXoWxAw4UCr17uF47GF4rZF1rCrg_yoW5Ar15pa
 1fKrW2gw4FqF4fGw1rJw1DJr1Uur1DK3W8Cw1UK3ZYva98urZ8uryDK34xZFy5GrW7Ar1Y
 ya1SyFWava1xXFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkC14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWUJVWUGwAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
 0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr
 1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IE
 rcIFxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
 v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkG
 c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI
 0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6Fyj6rWUJwCI42IY6I8E87Iv67AKxVWUJVW8
 JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUo-BMDU
 UUU
X-Originating-IP: [182.37.30.21]
X-CM-SenderInfo: 5olx5tdqjsjq5lvft2wodfhubq/
Received-SPF: pass client-ip=159.226.251.21;
 envelope-from=liuyang22@iscas.ac.cn; helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 17 Aug 2022 11:29:19 -0400
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
X-List-Received-Date: Wed, 17 Aug 2022 07:48:35 -0000

Remove duplicate code by wrapping vfwredsum_vs's OP function.

Signed-off-by: Yang Liu <liuyang22@iscas.ac.cn>
---
 target/riscv/vector_helper.c | 56 +++++++-----------------------------
 1 file changed, 10 insertions(+), 46 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index a96fc49c71..fd83c0b20b 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4655,58 +4655,22 @@ GEN_VEXT_FRED(vfredmin_vs_h, uint16_t, uint16_t, H2, H2, float16_minimum_number)
 GEN_VEXT_FRED(vfredmin_vs_w, uint32_t, uint32_t, H4, H4, float32_minimum_number)
 GEN_VEXT_FRED(vfredmin_vs_d, uint64_t, uint64_t, H8, H8, float64_minimum_number)
 
-/* Vector Widening Floating-Point Reduction Instructions */
-/* Unordered reduce 2*SEW = 2*SEW + sum(promote(SEW)) */
-void HELPER(vfwredsum_vs_h)(void *vd, void *v0, void *vs1,
-                            void *vs2, CPURISCVState *env, uint32_t desc)
+/* Vector Widening Floating-Point Add Instructions */
+static uint32_t fwadd16(uint32_t a, uint16_t b, float_status *s)
 {
-    uint32_t vm = vext_vm(desc);
-    uint32_t vl = env->vl;
-    uint32_t esz = sizeof(uint32_t);
-    uint32_t vlenb = simd_maxsz(desc);
-    uint32_t vta = vext_vta(desc);
-    uint32_t i;
-    uint32_t s1 =  *((uint32_t *)vs1 + H4(0));
-
-    for (i = env->vstart; i < vl; i++) {
-        uint16_t s2 = *((uint16_t *)vs2 + H2(i));
-        if (!vm && !vext_elem_mask(v0, i)) {
-            continue;
-        }
-        s1 = float32_add(s1, float16_to_float32(s2, true, &env->fp_status),
-                         &env->fp_status);
-    }
-    *((uint32_t *)vd + H4(0)) = s1;
-    env->vstart = 0;
-    /* set tail elements to 1s */
-    vext_set_elems_1s(vd, vta, esz, vlenb);
+    return float32_add(a, float16_to_float32(b, true, s), s);
 }
 
-void HELPER(vfwredsum_vs_w)(void *vd, void *v0, void *vs1,
-                            void *vs2, CPURISCVState *env, uint32_t desc)
+static uint64_t fwadd32(uint64_t a, uint32_t b, float_status *s)
 {
-    uint32_t vm = vext_vm(desc);
-    uint32_t vl = env->vl;
-    uint32_t esz = sizeof(uint64_t);
-    uint32_t vlenb = simd_maxsz(desc);
-    uint32_t vta = vext_vta(desc);
-    uint32_t i;
-    uint64_t s1 =  *((uint64_t *)vs1);
-
-    for (i = env->vstart; i < vl; i++) {
-        uint32_t s2 = *((uint32_t *)vs2 + H4(i));
-        if (!vm && !vext_elem_mask(v0, i)) {
-            continue;
-        }
-        s1 = float64_add(s1, float32_to_float64(s2, &env->fp_status),
-                         &env->fp_status);
-    }
-    *((uint64_t *)vd) = s1;
-    env->vstart = 0;
-    /* set tail elements to 1s */
-    vext_set_elems_1s(vd, vta, esz, vlenb);
+    return float64_add(a, float32_to_float64(b, s), s);
 }
 
+/* Vector Widening Floating-Point Reduction Instructions */
+/* Unordered reduce 2*SEW = 2*SEW + sum(promote(SEW)) */
+GEN_VEXT_FRED(vfwredsum_vs_h, uint32_t, uint16_t, H4, H2, fwadd16)
+GEN_VEXT_FRED(vfwredsum_vs_w, uint64_t, uint32_t, H8, H4, fwadd32)
+
 /*
  *** Vector Mask Operations
  */
-- 
2.30.1 (Apple Git-130)


