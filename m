Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nSbr0-0002uj-AX
	for mharc-qemu-riscv@gnu.org; Fri, 11 Mar 2022 04:46:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nSbqx-0002tb-3p; Fri, 11 Mar 2022 04:46:31 -0500
Received: from smtp23.cstnet.cn ([159.226.251.23]:44176 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nSbqs-0003A2-Pb; Fri, 11 Mar 2022 04:46:30 -0500
Received: from localhost.localdomain (unknown [180.156.147.178])
 by APP-03 (Coremail) with SMTP id rQCowAA3P8NpGitiZadtAg--.1143S2;
 Fri, 11 Mar 2022 17:46:18 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: richard.henderson@linaro.org, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v2] target/riscv: write back unmodified value for csrrc/csrrs
 with rs1 is not x0 but holding zero
Date: Fri, 11 Mar 2022 17:46:01 +0800
Message-Id: <20220311094601.30440-1-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: rQCowAA3P8NpGitiZadtAg--.1143S2
X-Coremail-Antispam: 1UD129KBjvAXoW3CFW5urWUtFWDZFW5KFy5CFg_yoW8CF4kXo
 Z5XFWSvr4YkwsxKF929F1xtr17Wrn8uws5Zr1vyrZ3Gw17Wr43Xr17tr9av3W3trZxKFW8
 J3Z2qa47Ca4kJa43n29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
 AaLaJ3UjIYCTnIWjp_UUU5E7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E6xAIw20EY4v20xva
 j40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2
 x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWx
 JVW8Jr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26r
 xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
 6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
 0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxAIw28IcxkI7VAK
 I48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
 xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xII
 jxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw2
 0EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF
 7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUoOJ5UUUUU
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
X-List-Received-Date: Fri, 11 Mar 2022 09:46:31 -0000

For csrrs and csrrc, if rs1 specifies a register other than x0, holding
a zero value, the instruction will still attempt to write the unmodified
value back to the csr and will cause side effects

v2:
* change to explictly pass "bool write_op" argument in riscv_csrrw*, do
  write permission check and write operation depend on it
* extend riscv_csr_predicate_fn to pass "write_op" argument which will
  be checked by seed csr or other future "write-only" csr

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
---
 target/riscv/cpu.c       |   3 +-
 target/riscv/cpu.h       |  15 +++---
 target/riscv/csr.c       | 101 +++++++++++++++++++++------------------
 target/riscv/gdbstub.c   |  15 +++---
 target/riscv/op_helper.c |  12 ++---
 5 files changed, 79 insertions(+), 67 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index ddda4906ff..76ad9bffac 100644
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
index 9ba05042ed..971d193d61 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -610,27 +610,29 @@ void riscv_cpu_update_mask(CPURISCVState *env);
 
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
 
 typedef RISCVException (*riscv_csr_predicate_fn)(CPURISCVState *env,
-                                                 int csrno);
+                                                 int csrno, bool write_op);
 typedef RISCVException (*riscv_csr_read_fn)(CPURISCVState *env, int csrno,
                                             target_ulong *ret_value);
 typedef RISCVException (*riscv_csr_write_fn)(CPURISCVState *env, int csrno,
@@ -642,7 +644,8 @@ typedef RISCVException (*riscv_csr_op_fn)(CPURISCVState *env, int csrno,
 
 RISCVException riscv_csrrw_i128(CPURISCVState *env, int csrno,
                                 Int128 *ret_value,
-                                Int128 new_value, Int128 write_mask);
+                                Int128 new_value, Int128 write_mask,
+                                bool write_op);
 
 typedef RISCVException (*riscv_csr_read128_fn)(CPURISCVState *env, int csrno,
                                                Int128 *ret_value);
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index aea82dff4a..1907481fb1 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -36,7 +36,7 @@ void riscv_set_csr_ops(int csrno, riscv_csr_operations *ops)
 }
 
 /* Predicates */
-static RISCVException fs(CPURISCVState *env, int csrno)
+static RISCVException fs(CPURISCVState *env, int csrno, bool write_op)
 {
 #if !defined(CONFIG_USER_ONLY)
     if (!env->debugger && !riscv_cpu_fp_enabled(env) &&
@@ -47,7 +47,7 @@ static RISCVException fs(CPURISCVState *env, int csrno)
     return RISCV_EXCP_NONE;
 }
 
-static RISCVException vs(CPURISCVState *env, int csrno)
+static RISCVException vs(CPURISCVState *env, int csrno, bool write_op)
 {
     CPUState *cs = env_cpu(env);
     RISCVCPU *cpu = RISCV_CPU(cs);
@@ -64,7 +64,7 @@ static RISCVException vs(CPURISCVState *env, int csrno)
     return RISCV_EXCP_ILLEGAL_INST;
 }
 
-static RISCVException ctr(CPURISCVState *env, int csrno)
+static RISCVException ctr(CPURISCVState *env, int csrno, bool write_op)
 {
 #if !defined(CONFIG_USER_ONLY)
     CPUState *cs = env_cpu(env);
@@ -135,50 +135,50 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
     return RISCV_EXCP_NONE;
 }
 
-static RISCVException ctr32(CPURISCVState *env, int csrno)
+static RISCVException ctr32(CPURISCVState *env, int csrno, bool write_op)
 {
     if (riscv_cpu_mxl(env) != MXL_RV32) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
-    return ctr(env, csrno);
+    return ctr(env, csrno, write_op);
 }
 
 #if !defined(CONFIG_USER_ONLY)
-static RISCVException any(CPURISCVState *env, int csrno)
+static RISCVException any(CPURISCVState *env, int csrno, bool write_op)
 {
     return RISCV_EXCP_NONE;
 }
 
-static RISCVException any32(CPURISCVState *env, int csrno)
+static RISCVException any32(CPURISCVState *env, int csrno, bool write_op)
 {
     if (riscv_cpu_mxl(env) != MXL_RV32) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
-    return any(env, csrno);
+    return any(env, csrno, write_op);
 
 }
 
-static int aia_any(CPURISCVState *env, int csrno)
+static int aia_any(CPURISCVState *env, int csrno, bool write_op)
 {
     if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
-    return any(env, csrno);
+    return any(env, csrno, write_op);
 }
 
-static int aia_any32(CPURISCVState *env, int csrno)
+static int aia_any32(CPURISCVState *env, int csrno, bool write_op)
 {
     if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
-    return any32(env, csrno);
+    return any32(env, csrno, write_op);
 }
 
-static RISCVException smode(CPURISCVState *env, int csrno)
+static RISCVException smode(CPURISCVState *env, int csrno, bool write_op)
 {
     if (riscv_has_ext(env, RVS)) {
         return RISCV_EXCP_NONE;
@@ -187,34 +187,34 @@ static RISCVException smode(CPURISCVState *env, int csrno)
     return RISCV_EXCP_ILLEGAL_INST;
 }
 
-static int smode32(CPURISCVState *env, int csrno)
+static int smode32(CPURISCVState *env, int csrno, bool write_op)
 {
     if (riscv_cpu_mxl(env) != MXL_RV32) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
-    return smode(env, csrno);
+    return smode(env, csrno, write_op);
 }
 
-static int aia_smode(CPURISCVState *env, int csrno)
+static int aia_smode(CPURISCVState *env, int csrno, bool write_op)
 {
     if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
-    return smode(env, csrno);
+    return smode(env, csrno, write_op);
 }
 
-static int aia_smode32(CPURISCVState *env, int csrno)
+static int aia_smode32(CPURISCVState *env, int csrno, bool write_op)
 {
     if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
-    return smode32(env, csrno);
+    return smode32(env, csrno, write_op);
 }
 
-static RISCVException hmode(CPURISCVState *env, int csrno)
+static RISCVException hmode(CPURISCVState *env, int csrno, bool write_op)
 {
     if (riscv_has_ext(env, RVS) &&
         riscv_has_ext(env, RVH)) {
@@ -230,7 +230,7 @@ static RISCVException hmode(CPURISCVState *env, int csrno)
     return RISCV_EXCP_ILLEGAL_INST;
 }
 
-static RISCVException hmode32(CPURISCVState *env, int csrno)
+static RISCVException hmode32(CPURISCVState *env, int csrno, bool write_op)
 {
     if (riscv_cpu_mxl(env) != MXL_RV32) {
         if (!riscv_cpu_virt_enabled(env)) {
@@ -240,12 +240,13 @@ static RISCVException hmode32(CPURISCVState *env, int csrno)
         }
     }
 
-    return hmode(env, csrno);
+    return hmode(env, csrno, write_op);
 
 }
 
 /* Checks if PointerMasking registers could be accessed */
-static RISCVException pointer_masking(CPURISCVState *env, int csrno)
+static RISCVException pointer_masking(CPURISCVState *env, int csrno,
+                                      bool write_op)
 {
     /* Check if j-ext is present */
     if (riscv_has_ext(env, RVJ)) {
@@ -254,25 +255,25 @@ static RISCVException pointer_masking(CPURISCVState *env, int csrno)
     return RISCV_EXCP_ILLEGAL_INST;
 }
 
-static int aia_hmode(CPURISCVState *env, int csrno)
+static int aia_hmode(CPURISCVState *env, int csrno, bool write_op)
 {
     if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
         return RISCV_EXCP_ILLEGAL_INST;
      }
 
-     return hmode(env, csrno);
+     return hmode(env, csrno, write_op);
 }
 
-static int aia_hmode32(CPURISCVState *env, int csrno)
+static int aia_hmode32(CPURISCVState *env, int csrno, bool write_op)
 {
     if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
-    return hmode32(env, csrno);
+    return hmode32(env, csrno, write_op);
 }
 
-static RISCVException pmp(CPURISCVState *env, int csrno)
+static RISCVException pmp(CPURISCVState *env, int csrno, bool write_op)
 {
     if (riscv_feature(env, RISCV_FEATURE_PMP)) {
         return RISCV_EXCP_NONE;
@@ -281,7 +282,7 @@ static RISCVException pmp(CPURISCVState *env, int csrno)
     return RISCV_EXCP_ILLEGAL_INST;
 }
 
-static RISCVException epmp(CPURISCVState *env, int csrno)
+static RISCVException epmp(CPURISCVState *env, int csrno, bool write_op)
 {
     if (env->priv == PRV_M && riscv_feature(env, RISCV_FEATURE_EPMP)) {
         return RISCV_EXCP_NONE;
@@ -2873,7 +2874,8 @@ static RISCVException write_upmbase(CPURISCVState *env, int csrno,
 static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
                                                int csrno,
                                                bool write_mask,
-                                               RISCVCPU *cpu)
+                                               RISCVCPU *cpu,
+                                               bool write_op)
 {
     /* check privileges and return RISCV_EXCP_ILLEGAL_INST if check fails */
     int read_only = get_field(csrno, 0xC00) == 3;
@@ -2895,7 +2897,7 @@ static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
         return RISCV_EXCP_ILLEGAL_INST;
     }
 #endif
-    if (write_mask && read_only) {
+    if (write_op && read_only) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
@@ -2909,13 +2911,13 @@ static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
-    return csr_ops[csrno].predicate(env, csrno);
+    return csr_ops[csrno].predicate(env, csrno, write_op);
 }
 
 static RISCVException riscv_csrrw_do64(CPURISCVState *env, int csrno,
                                        target_ulong *ret_value,
                                        target_ulong new_value,
-                                       target_ulong write_mask)
+                                       target_ulong write_mask, bool write_op)
 {
     RISCVException ret;
     target_ulong old_value;
@@ -2935,8 +2937,8 @@ static RISCVException riscv_csrrw_do64(CPURISCVState *env, int csrno,
         return ret;
     }
 
-    /* write value if writable and write mask set, otherwise drop writes */
-    if (write_mask) {
+    /* write value if writable and write_op set, otherwise drop writes */
+    if (write_op) {
         new_value = (old_value & ~write_mask) | (new_value & write_mask);
         if (csr_ops[csrno].write) {
             ret = csr_ops[csrno].write(env, csrno, new_value);
@@ -2956,22 +2958,25 @@ static RISCVException riscv_csrrw_do64(CPURISCVState *env, int csrno,
 
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
@@ -2982,8 +2987,8 @@ static RISCVException riscv_csrrw_do128(CPURISCVState *env, int csrno,
         return ret;
     }
 
-    /* write value if writable and write mask set, otherwise drop writes */
-    if (int128_nz(write_mask)) {
+    /* write value if writable and write_op set, otherwise drop writes */
+    if (write_op) {
         new_value = int128_or(int128_and(old_value, int128_not(write_mask)),
                               int128_and(new_value, write_mask));
         if (csr_ops[csrno].write128) {
@@ -3010,18 +3015,20 @@ static RISCVException riscv_csrrw_do128(CPURISCVState *env, int csrno,
 
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
@@ -3033,7 +3040,7 @@ RISCVException riscv_csrrw_i128(CPURISCVState *env, int csrno,
     target_ulong old_value;
     ret = riscv_csrrw_do64(env, csrno, &old_value,
                            int128_getlo(new_value),
-                           int128_getlo(write_mask));
+                           int128_getlo(write_mask), write_op);
     if (ret == RISCV_EXCP_NONE && ret_value) {
         *ret_value = int128_make64(old_value);
     }
@@ -3047,13 +3054,13 @@ RISCVException riscv_csrrw_i128(CPURISCVState *env, int csrno,
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
index 9ed049c29e..5e37ea12cb 100644
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
@@ -319,7 +319,8 @@ static int riscv_gen_dynamic_csr_xml(CPUState *cs, int base_reg)
 
     for (i = 0; i < CSR_TABLE_SIZE; i++) {
         predicate = csr_ops[i].predicate;
-        if (predicate && (predicate(env, i) == RISCV_EXCP_NONE)) {
+        if (predicate && ((predicate(env, i, false) == RISCV_EXCP_NONE) ||
+                          (predicate(env, i, true) == RISCV_EXCP_NONE))) {
             if (csr_ops[i].name) {
                 g_string_append_printf(s, "<reg name=\"%s\"", csr_ops[i].name);
             } else {
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


