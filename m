Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nPO7j-0000wd-9Q
	for mharc-qemu-riscv@gnu.org; Wed, 02 Mar 2022 07:30:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nPO7V-0000ok-Lu; Wed, 02 Mar 2022 07:30:21 -0500
Received: from smtp84.cstnet.cn ([159.226.251.84]:42148 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nPO7N-0001Jr-LJ; Wed, 02 Mar 2022 07:30:15 -0500
Received: from localhost.localdomain (unknown [180.156.147.178])
 by APP-05 (Coremail) with SMTP id zQCowAD3_0NIYx9iZCvwAQ--.51923S2;
 Wed, 02 Mar 2022 20:30:02 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: richard.henderson@linaro.org, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH] target/riscv: write back unmodified value for csrrc/csrrs
 with rs1 is not x0 but holding zero
Date: Wed,  2 Mar 2022 20:29:46 +0800
Message-Id: <20220302122946.29635-1-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: zQCowAD3_0NIYx9iZCvwAQ--.51923S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Ar1UtF43Cr4ruF4rKF1rJFb_yoW7WFy5pr
 Wak39xW3yvqFZ7X3Zay3WDJw1rJw48G3yfCwn2qw45Jr1fJFWYyF4qqFsayFyDua4Syr4F
 vFs09FyI9w4UAFUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUyG14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCF04k20xvY0x0EwIxG
 rwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4
 vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IY
 x2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26c
 xKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x02
 67AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbXdbUUUUUU==
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.84; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 02 Mar 2022 12:30:26 -0000

     For csrrs and csrrc, if rs1 specifies a register other than x0, holding
     a zero value, the instruction will still attempt to write the unmodified
     value back to the csr and will cause side effects

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
---
 target/riscv/csr.c       | 46 ++++++++++++++++++++++++++++------------
 target/riscv/op_helper.c |  7 +++++-
 2 files changed, 39 insertions(+), 14 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index aea82dff4a..f4774ca07b 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -2872,7 +2872,7 @@ static RISCVException write_upmbase(CPURISCVState *env, int csrno,
 
 static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
                                                int csrno,
-                                               bool write_mask,
+                                               bool write_csr,
                                                RISCVCPU *cpu)
 {
     /* check privileges and return RISCV_EXCP_ILLEGAL_INST if check fails */
@@ -2895,7 +2895,7 @@ static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
         return RISCV_EXCP_ILLEGAL_INST;
     }
 #endif
-    if (write_mask && read_only) {
+    if (write_csr && read_only) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
@@ -2915,7 +2915,8 @@ static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
 static RISCVException riscv_csrrw_do64(CPURISCVState *env, int csrno,
                                        target_ulong *ret_value,
                                        target_ulong new_value,
-                                       target_ulong write_mask)
+                                       target_ulong write_mask,
+                                       bool write_csr)
 {
     RISCVException ret;
     target_ulong old_value;
@@ -2935,8 +2936,8 @@ static RISCVException riscv_csrrw_do64(CPURISCVState *env, int csrno,
         return ret;
     }
 
-    /* write value if writable and write mask set, otherwise drop writes */
-    if (write_mask) {
+    /* write value if needed, otherwise drop writes */
+    if (write_csr) {
         new_value = (old_value & ~write_mask) | (new_value & write_mask);
         if (csr_ops[csrno].write) {
             ret = csr_ops[csrno].write(env, csrno, new_value);
@@ -2960,18 +2961,27 @@ RISCVException riscv_csrrw(CPURISCVState *env, int csrno,
 {
     RISCVCPU *cpu = env_archcpu(env);
 
-    RISCVException ret = riscv_csrrw_check(env, csrno, write_mask, cpu);
+    /*
+     * write value when write_mask is set or rs1 is not x0 but holding zero
+     * value for csrrc(new_value is zero) and csrrs(new_value is all-ones)
+     */
+    bool write_csr = write_mask || ((write_mask == 0) &&
+                                    ((new_value == 0) ||
+                                     (new_value == (target_ulong)-1)));
+
+    RISCVException ret = riscv_csrrw_check(env, csrno, write_csr, cpu);
     if (ret != RISCV_EXCP_NONE) {
         return ret;
     }
 
-    return riscv_csrrw_do64(env, csrno, ret_value, new_value, write_mask);
+    return riscv_csrrw_do64(env, csrno, ret_value, new_value, write_mask,
+                            write_csr);
 }
 
 static RISCVException riscv_csrrw_do128(CPURISCVState *env, int csrno,
                                         Int128 *ret_value,
                                         Int128 new_value,
-                                        Int128 write_mask)
+                                        Int128 write_mask, bool write_csr)
 {
     RISCVException ret;
     Int128 old_value;
@@ -2982,8 +2992,8 @@ static RISCVException riscv_csrrw_do128(CPURISCVState *env, int csrno,
         return ret;
     }
 
-    /* write value if writable and write mask set, otherwise drop writes */
-    if (int128_nz(write_mask)) {
+    /* write value if needed, otherwise drop writes */
+    if (write_csr) {
         new_value = int128_or(int128_and(old_value, int128_not(write_mask)),
                               int128_and(new_value, write_mask));
         if (csr_ops[csrno].write128) {
@@ -3015,13 +3025,22 @@ RISCVException riscv_csrrw_i128(CPURISCVState *env, int csrno,
     RISCVException ret;
     RISCVCPU *cpu = env_archcpu(env);
 
-    ret = riscv_csrrw_check(env, csrno, int128_nz(write_mask), cpu);
+    /*
+     * write value when write_mask is set or rs1 is not x0 but holding zero
+     * value for csrrc(new_value is zero) and csrrs(new_value is all-ones)
+     */
+    bool write_csr = write_mask || ((write_mask == 0) &&
+                                    ((new_value == 0) ||
+                                     (new_value == UINT128_MAX)));
+
+    ret = riscv_csrrw_check(env, csrno, write_csr, cpu);
     if (ret != RISCV_EXCP_NONE) {
         return ret;
     }
 
     if (csr_ops[csrno].read128) {
-        return riscv_csrrw_do128(env, csrno, ret_value, new_value, write_mask);
+        return riscv_csrrw_do128(env, csrno, ret_value, new_value, write_mask,
+                                 write_csr);
     }
 
     /*
@@ -3033,7 +3052,8 @@ RISCVException riscv_csrrw_i128(CPURISCVState *env, int csrno,
     target_ulong old_value;
     ret = riscv_csrrw_do64(env, csrno, &old_value,
                            int128_getlo(new_value),
-                           int128_getlo(write_mask));
+                           int128_getlo(write_mask),
+                           write_csr);
     if (ret == RISCV_EXCP_NONE && ret_value) {
         *ret_value = int128_make64(old_value);
     }
diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index 1a75ba11e6..b2ad465533 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -40,7 +40,12 @@ void helper_raise_exception(CPURISCVState *env, uint32_t exception)
 target_ulong helper_csrr(CPURISCVState *env, int csr)
 {
     target_ulong val = 0;
-    RISCVException ret = riscv_csrrw(env, csr, &val, 0, 0);
+
+    /*
+     * new_value here should be none-zero or none-all-ones here to
+     * distinguish with csrrc/csrrs with rs1 is not x0 but holding zero value
+     */
+    RISCVException ret = riscv_csrrw(env, csr, &val, 1, 0);
 
     if (ret != RISCV_EXCP_NONE) {
         riscv_raise_exception(env, ret, GETPC());
-- 
2.17.1


