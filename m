Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nV21u-0004bS-En
	for mharc-qemu-riscv@gnu.org; Thu, 17 Mar 2022 22:07:50 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nV21s-0004Y2-3R; Thu, 17 Mar 2022 22:07:48 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21]:60224 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nV21l-0008Sj-9W; Thu, 17 Mar 2022 22:07:44 -0400
Received: from localhost.localdomain (unknown [180.156.147.178])
 by APP-01 (Coremail) with SMTP id qwCowAD3__Nd6TNivVYLBA--.22980S2;
 Fri, 18 Mar 2022 10:07:26 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: richard.henderson@linaro.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v3] target/riscv: write back unmodified value for csrrc/csrrs
 with rs1 is not x0 but holding zero
Date: Fri, 18 Mar 2022 10:07:24 +0800
Message-Id: <20220318020724.22424-1-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: qwCowAD3__Nd6TNivVYLBA--.22980S2
X-Coremail-Antispam: 1UD129KBjvAXoW3CF4DWFWkGr18CFyrWF1rWFg_yoW8Jr17Wo
 Z5XFZYvrWFk34SkFZF9Fnrtr1UWrn5Jrs5uF1vkr93Jw1Dur1fWr17twna93W7trZIgFy8
 J3Z2qa45Ca4kJFy7n29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
 AaLaJ3UjIYCTnIWjp_UUU5i7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E6xAIw20EY4v20xva
 j40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2
 x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8
 JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
 4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
 Yx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbV
 WUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1l42xK82IYc2Ij
 64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x
 8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE
 2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42
 xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIE
 c7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VU1a9aPUUUUU==
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.21; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Fri, 18 Mar 2022 02:07:48 -0000

For csrrs and csrrc, if rs1 specifies a register other than x0, holding
a zero value, the instruction will still attempt to write the unmodified
value back to the csr and will cause side effects

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>

v3:
* delete change to riscv_csr_predicate_fn, leaving seed CSR as a special
  case handled in helper_csrr
* rebase to riscv-to-apply.next

v2:
* change to explictly pass "bool write_op" argument in riscv_csrrw*, do
  write permission check and write operation depend on it
* extend riscv_csr_predicate_fn to pass "write_op" argument which will
  be checked by seed csr or other future "write-only" csr
---
 target/riscv/cpu.c       |  3 ++-
 target/riscv/cpu.h       | 13 ++++++++-----
 target/riscv/csr.c       | 40 +++++++++++++++++++++++-----------------
 target/riscv/gdbstub.c   | 12 ++++++------
 target/riscv/op_helper.c | 12 ++++++------
 5 files changed, 45 insertions(+), 35 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index cfdfe787de..dfcaa26251 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -314,7 +314,8 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
         for (int i = 0; i < ARRAY_SIZE(dump_csrs); ++i) {
             int csrno = dump_csrs[i];
             target_ulong val = 0;
-            RISCVException res = riscv_csrrw_debug(env, csrno, &val, 0, 0);
+            RISCVException res = riscv_csrrw_debug(env, csrno, &val, 0, 0,
+                                                   false);
 
             /*
              * Rely on the smode, hmode, etc, predicates within csr.c
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index fe5f212987..6d8fd72a59 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -624,22 +624,24 @@ void riscv_cpu_update_mask(CPURISCVState *env);
 
 RISCVException riscv_csrrw(CPURISCVState *env, int csrno,
                            target_ulong *ret_value,
-                           target_ulong new_value, target_ulong write_mask);
+                           target_ulong new_value, target_ulong write_mask,
+                           bool write_op);
 RISCVException riscv_csrrw_debug(CPURISCVState *env, int csrno,
                                  target_ulong *ret_value,
                                  target_ulong new_value,
-                                 target_ulong write_mask);
+                                 target_ulong write_mask, bool write_op);
 
 static inline void riscv_csr_write(CPURISCVState *env, int csrno,
                                    target_ulong val)
 {
-    riscv_csrrw(env, csrno, NULL, val, MAKE_64BIT_MASK(0, TARGET_LONG_BITS));
+    riscv_csrrw(env, csrno, NULL, val, MAKE_64BIT_MASK(0, TARGET_LONG_BITS),
+                true);
 }
 
 static inline target_ulong riscv_csr_read(CPURISCVState *env, int csrno)
 {
     target_ulong val = 0;
-    riscv_csrrw(env, csrno, &val, 0, 0);
+    riscv_csrrw(env, csrno, &val, 0, 0, false);
     return val;
 }
 
@@ -656,7 +658,8 @@ typedef RISCVException (*riscv_csr_op_fn)(CPURISCVState *env, int csrno,
 
 RISCVException riscv_csrrw_i128(CPURISCVState *env, int csrno,
                                 Int128 *ret_value,
-                                Int128 new_value, Int128 write_mask);
+                                Int128 new_value, Int128 write_mask,
+                                bool write_op);
 
 typedef RISCVException (*riscv_csr_read128_fn)(CPURISCVState *env, int csrno,
                                                Int128 *ret_value);
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 3709c82c9f..3c61dd69af 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -2973,7 +2973,8 @@ static RISCVException write_upmbase(CPURISCVState *env, int csrno,
 static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
                                                int csrno,
                                                bool write_mask,
-                                               RISCVCPU *cpu)
+                                               RISCVCPU *cpu,
+                                               bool write_op)
 {
     /* check privileges and return RISCV_EXCP_ILLEGAL_INST if check fails */
     int read_only = get_field(csrno, 0xC00) == 3;
@@ -2996,7 +2997,7 @@ static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
         return RISCV_EXCP_ILLEGAL_INST;
     }
 #endif
-    if (write_mask && read_only) {
+    if (write_op && read_only) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
@@ -3020,7 +3021,7 @@ static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
 static RISCVException riscv_csrrw_do64(CPURISCVState *env, int csrno,
                                        target_ulong *ret_value,
                                        target_ulong new_value,
-                                       target_ulong write_mask)
+                                       target_ulong write_mask, bool write_op)
 {
     RISCVException ret;
     target_ulong old_value;
@@ -3040,8 +3041,8 @@ static RISCVException riscv_csrrw_do64(CPURISCVState *env, int csrno,
         return ret;
     }
 
-    /* write value if writable and write mask set, otherwise drop writes */
-    if (write_mask) {
+    /* write value if writable and write_op set, otherwise drop writes */
+    if (write_op) {
         new_value = (old_value & ~write_mask) | (new_value & write_mask);
         if (csr_ops[csrno].write) {
             ret = csr_ops[csrno].write(env, csrno, new_value);
@@ -3061,22 +3062,25 @@ static RISCVException riscv_csrrw_do64(CPURISCVState *env, int csrno,
 
 RISCVException riscv_csrrw(CPURISCVState *env, int csrno,
                            target_ulong *ret_value,
-                           target_ulong new_value, target_ulong write_mask)
+                           target_ulong new_value, target_ulong write_mask,
+                           bool write_op)
 {
     RISCVCPU *cpu = env_archcpu(env);
 
-    RISCVException ret = riscv_csrrw_check(env, csrno, write_mask, cpu);
+    RISCVException ret = riscv_csrrw_check(env, csrno, write_mask, cpu,
+                                           write_op);
     if (ret != RISCV_EXCP_NONE) {
         return ret;
     }
 
-    return riscv_csrrw_do64(env, csrno, ret_value, new_value, write_mask);
+    return riscv_csrrw_do64(env, csrno, ret_value, new_value, write_mask,
+                            write_op);
 }
 
 static RISCVException riscv_csrrw_do128(CPURISCVState *env, int csrno,
                                         Int128 *ret_value,
                                         Int128 new_value,
-                                        Int128 write_mask)
+                                        Int128 write_mask, bool write_op)
 {
     RISCVException ret;
     Int128 old_value;
@@ -3087,8 +3091,8 @@ static RISCVException riscv_csrrw_do128(CPURISCVState *env, int csrno,
         return ret;
     }
 
-    /* write value if writable and write mask set, otherwise drop writes */
-    if (int128_nz(write_mask)) {
+    /* write value if writable and write_op set, otherwise drop writes */
+    if (write_op) {
         new_value = int128_or(int128_and(old_value, int128_not(write_mask)),
                               int128_and(new_value, write_mask));
         if (csr_ops[csrno].write128) {
@@ -3115,18 +3119,20 @@ static RISCVException riscv_csrrw_do128(CPURISCVState *env, int csrno,
 
 RISCVException riscv_csrrw_i128(CPURISCVState *env, int csrno,
                                 Int128 *ret_value,
-                                Int128 new_value, Int128 write_mask)
+                                Int128 new_value, Int128 write_mask,
+                                bool write_op)
 {
     RISCVException ret;
     RISCVCPU *cpu = env_archcpu(env);
 
-    ret = riscv_csrrw_check(env, csrno, int128_nz(write_mask), cpu);
+    ret = riscv_csrrw_check(env, csrno, int128_nz(write_mask), cpu, write_op);
     if (ret != RISCV_EXCP_NONE) {
         return ret;
     }
 
     if (csr_ops[csrno].read128) {
-        return riscv_csrrw_do128(env, csrno, ret_value, new_value, write_mask);
+        return riscv_csrrw_do128(env, csrno, ret_value, new_value, write_mask,
+                                 write_op);
     }
 
     /*
@@ -3138,7 +3144,7 @@ RISCVException riscv_csrrw_i128(CPURISCVState *env, int csrno,
     target_ulong old_value;
     ret = riscv_csrrw_do64(env, csrno, &old_value,
                            int128_getlo(new_value),
-                           int128_getlo(write_mask));
+                           int128_getlo(write_mask), write_op);
     if (ret == RISCV_EXCP_NONE && ret_value) {
         *ret_value = int128_make64(old_value);
     }
@@ -3152,13 +3158,13 @@ RISCVException riscv_csrrw_i128(CPURISCVState *env, int csrno,
 RISCVException riscv_csrrw_debug(CPURISCVState *env, int csrno,
                                  target_ulong *ret_value,
                                  target_ulong new_value,
-                                 target_ulong write_mask)
+                                 target_ulong write_mask, bool write_op)
 {
     RISCVException ret;
 #if !defined(CONFIG_USER_ONLY)
     env->debugger = true;
 #endif
-    ret = riscv_csrrw(env, csrno, ret_value, new_value, write_mask);
+    ret = riscv_csrrw(env, csrno, ret_value, new_value, write_mask, write_op);
 #if !defined(CONFIG_USER_ONLY)
     env->debugger = false;
 #endif
diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
index 9ed049c29e..cdca919ffc 100644
--- a/target/riscv/gdbstub.c
+++ b/target/riscv/gdbstub.c
@@ -124,7 +124,7 @@ static int riscv_gdb_get_fpu(CPURISCVState *env, GByteArray *buf, int n)
          * This also works for CSR_FRM and CSR_FCSR.
          */
         result = riscv_csrrw_debug(env, n - 32, &val,
-                                   0, 0);
+                                   0, 0, false);
         if (result == RISCV_EXCP_NONE) {
             return gdb_get_regl(buf, val);
         }
@@ -147,7 +147,7 @@ static int riscv_gdb_set_fpu(CPURISCVState *env, uint8_t *mem_buf, int n)
          * This also works for CSR_FRM and CSR_FCSR.
          */
         result = riscv_csrrw_debug(env, n - 32, NULL,
-                                   val, -1);
+                                   val, -1, true);
         if (result == RISCV_EXCP_NONE) {
             return sizeof(target_ulong);
         }
@@ -209,7 +209,7 @@ static int riscv_gdb_get_vector(CPURISCVState *env, GByteArray *buf, int n)
     }
 
     target_ulong val = 0;
-    int result = riscv_csrrw_debug(env, csrno, &val, 0, 0);
+    int result = riscv_csrrw_debug(env, csrno, &val, 0, 0, false);
 
     if (result == 0) {
         return gdb_get_regl(buf, val);
@@ -236,7 +236,7 @@ static int riscv_gdb_set_vector(CPURISCVState *env, uint8_t *mem_buf, int n)
     }
 
     target_ulong val = ldtul_p(mem_buf);
-    int result = riscv_csrrw_debug(env, csrno, NULL, val, -1);
+    int result = riscv_csrrw_debug(env, csrno, NULL, val, -1, true);
 
     if (result == 0) {
         return sizeof(target_ulong);
@@ -251,7 +251,7 @@ static int riscv_gdb_get_csr(CPURISCVState *env, GByteArray *buf, int n)
         target_ulong val = 0;
         int result;
 
-        result = riscv_csrrw_debug(env, n, &val, 0, 0);
+        result = riscv_csrrw_debug(env, n, &val, 0, 0, false);
         if (result == RISCV_EXCP_NONE) {
             return gdb_get_regl(buf, val);
         }
@@ -265,7 +265,7 @@ static int riscv_gdb_set_csr(CPURISCVState *env, uint8_t *mem_buf, int n)
         target_ulong val = ldtul_p(mem_buf);
         int result;
 
-        result = riscv_csrrw_debug(env, n, NULL, val, -1);
+        result = riscv_csrrw_debug(env, n, NULL, val, -1, true);
         if (result == RISCV_EXCP_NONE) {
             return sizeof(target_ulong);
         }
diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index 1a75ba11e6..e0d708091e 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -40,7 +40,7 @@ void helper_raise_exception(CPURISCVState *env, uint32_t exception)
 target_ulong helper_csrr(CPURISCVState *env, int csr)
 {
     target_ulong val = 0;
-    RISCVException ret = riscv_csrrw(env, csr, &val, 0, 0);
+    RISCVException ret = riscv_csrrw(env, csr, &val, 0, 0, false);
 
     if (ret != RISCV_EXCP_NONE) {
         riscv_raise_exception(env, ret, GETPC());
@@ -51,7 +51,7 @@ target_ulong helper_csrr(CPURISCVState *env, int csr)
 void helper_csrw(CPURISCVState *env, int csr, target_ulong src)
 {
     target_ulong mask = env->xl == MXL_RV32 ? UINT32_MAX : (target_ulong)-1;
-    RISCVException ret = riscv_csrrw(env, csr, NULL, src, mask);
+    RISCVException ret = riscv_csrrw(env, csr, NULL, src, mask, true);
 
     if (ret != RISCV_EXCP_NONE) {
         riscv_raise_exception(env, ret, GETPC());
@@ -62,7 +62,7 @@ target_ulong helper_csrrw(CPURISCVState *env, int csr,
                           target_ulong src, target_ulong write_mask)
 {
     target_ulong val = 0;
-    RISCVException ret = riscv_csrrw(env, csr, &val, src, write_mask);
+    RISCVException ret = riscv_csrrw(env, csr, &val, src, write_mask, true);
 
     if (ret != RISCV_EXCP_NONE) {
         riscv_raise_exception(env, ret, GETPC());
@@ -75,7 +75,7 @@ target_ulong helper_csrr_i128(CPURISCVState *env, int csr)
     Int128 rv = int128_zero();
     RISCVException ret = riscv_csrrw_i128(env, csr, &rv,
                                           int128_zero(),
-                                          int128_zero());
+                                          int128_zero(), false);
 
     if (ret != RISCV_EXCP_NONE) {
         riscv_raise_exception(env, ret, GETPC());
@@ -90,7 +90,7 @@ void helper_csrw_i128(CPURISCVState *env, int csr,
 {
     RISCVException ret = riscv_csrrw_i128(env, csr, NULL,
                                           int128_make128(srcl, srch),
-                                          UINT128_MAX);
+                                          UINT128_MAX, true);
 
     if (ret != RISCV_EXCP_NONE) {
         riscv_raise_exception(env, ret, GETPC());
@@ -104,7 +104,7 @@ target_ulong helper_csrrw_i128(CPURISCVState *env, int csr,
     Int128 rv = int128_zero();
     RISCVException ret = riscv_csrrw_i128(env, csr, &rv,
                                           int128_make128(srcl, srch),
-                                          int128_make128(maskl, maskh));
+                                          int128_make128(maskl, maskh), true);
 
     if (ret != RISCV_EXCP_NONE) {
         riscv_raise_exception(env, ret, GETPC());
-- 
2.17.1


