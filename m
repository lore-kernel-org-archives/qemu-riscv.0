Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pfgnJ-0005Od-Mw
	for mharc-qemu-riscv@gnu.org; Fri, 24 Mar 2023 08:45:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pfgnG-0005OG-GL; Fri, 24 Mar 2023 08:45:19 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pfgiN-0000lK-AH; Fri, 24 Mar 2023 08:45:17 -0400
Received: from localhost.localdomain (unknown [180.165.240.150])
 by APP-05 (Coremail) with SMTP id zQCowACXnVX4mR1kGwsYCQ--.52917S10;
 Fri, 24 Mar 2023 20:39:26 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH 8/8] target/riscv: Fix lines with over 80 characters
Date: Fri, 24 Mar 2023 20:38:09 +0800
Message-Id: <20230324123809.107714-9-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230324123809.107714-1-liweiwei@iscas.ac.cn>
References: <20230324123809.107714-1-liweiwei@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowACXnVX4mR1kGwsYCQ--.52917S10
X-Coremail-Antispam: 1UD129KBjvJXoWfJFW5Xry8Cr4xtr4fJFWUJwb_yoWDZrW3pr
 48JFsxXws5KFWSva9rArs8XF13G3Z5Ka45Ar1qgrsYyayfWF95CFyDGa47uF4DC3y7ur4Y
 kan3ArWUuw47XFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUP214x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
 kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
 z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
 4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE
 3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2I
 x0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8
 JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2
 ka0xkIwI1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG
 67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MI
 IYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E
 14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr
 0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbmZ
 X7UUUUU==
X-Originating-IP: [180.165.240.150]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.25; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 24 Mar 2023 12:45:19 -0000

Fix lines with over 80 characters for both code and comments in
vector_helper.c, pmp.c and pmu.c.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
---
 target/riscv/pmp.c           |  6 ++-
 target/riscv/pmu.c           |  3 +-
 target/riscv/vector_helper.c | 76 ++++++++++++++++++++++++------------
 3 files changed, 56 insertions(+), 29 deletions(-)

diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index 665a8528d5..428ebe7272 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -129,7 +129,8 @@ static void pmp_write_cfg(CPURISCVState *env, uint32_t pmp_index, uint8_t val)
     }
 }
 
-static void pmp_decode_napot(target_ulong a, target_ulong *sa, target_ulong *ea)
+static void pmp_decode_napot(target_ulong a, target_ulong *sa,
+                             target_ulong *ea)
 {
     /*
        aaaa...aaa0   8-byte NAPOT range
@@ -217,7 +218,8 @@ static void pmp_update_rule(CPURISCVState *env, uint32_t pmp_index)
     pmp_update_rule_nums(env);
 }
 
-static int pmp_is_in_range(CPURISCVState *env, int pmp_index, target_ulong addr)
+static int pmp_is_in_range(CPURISCVState *env, int pmp_index,
+                           target_ulong addr)
 {
     int result = 0;
 
diff --git a/target/riscv/pmu.c b/target/riscv/pmu.c
index 22e2283c76..347f7f30d1 100644
--- a/target/riscv/pmu.c
+++ b/target/riscv/pmu.c
@@ -419,7 +419,8 @@ int riscv_pmu_setup_timer(CPURISCVState *env, uint64_t value, uint32_t ctr_idx)
     } else {
         return -1;
     }
-    overflow_at = (uint64_t)qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + overflow_ns;
+    overflow_at = (uint64_t)qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
+                  overflow_ns;
 
     if (overflow_at > INT64_MAX) {
         overflow_left += overflow_at - INT64_MAX;
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 81b99a0e3c..b5ab8edcb3 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -385,8 +385,8 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
 }
 
 /*
- * masked unit-stride load and store operation will be a special case of stride,
- * stride = NF * sizeof (MTYPE)
+ * masked unit-stride load and store operation will be a special case of
+ * stride, stride = NF * sizeof (MTYPE)
  */
 
 #define GEN_VEXT_LD_US(NAME, ETYPE, LOAD_FN)                            \
@@ -681,7 +681,8 @@ vext_ldst_whole(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
         /* load/store rest of elements of current segment pointed by vstart */
         for (pos = off; pos < max_elems; pos++, env->vstart++) {
             target_ulong addr = base + ((pos + k * max_elems) << log2_esz);
-            ldst_elem(env, adjust_addr(env, addr), pos + k * max_elems, vd, ra);
+            ldst_elem(env, adjust_addr(env, addr), pos + k * max_elems, vd,
+                      ra);
         }
         k++;
     }
@@ -1309,7 +1310,9 @@ GEN_VEXT_SHIFT_VV(vsra_vv_h, uint16_t, int16_t, H2, H2, DO_SRL, 0xf)
 GEN_VEXT_SHIFT_VV(vsra_vv_w, uint32_t, int32_t, H4, H4, DO_SRL, 0x1f)
 GEN_VEXT_SHIFT_VV(vsra_vv_d, uint64_t, int64_t, H8, H8, DO_SRL, 0x3f)
 
-/* generate the helpers for shift instructions with one vector and one scalar */
+/*
+ * generate the helpers for shift instructions with one vector and one scalar
+ */
 #define GEN_VEXT_SHIFT_VX(NAME, TD, TS2, HD, HS2, OP, MASK) \
 void HELPER(NAME)(void *vd, void *v0, target_ulong s1,      \
                   void *vs2, CPURISCVState *env,            \
@@ -2168,7 +2171,8 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,     \
                  do_##NAME, ESZ);                               \
 }
 
-static inline uint8_t saddu8(CPURISCVState *env, int vxrm, uint8_t a, uint8_t b)
+static inline uint8_t saddu8(CPURISCVState *env, int vxrm, uint8_t a,
+                             uint8_t b)
 {
     uint8_t res = a + b;
     if (res < a) {
@@ -2312,7 +2316,8 @@ static inline int8_t sadd8(CPURISCVState *env, int vxrm, int8_t a, int8_t b)
     return res;
 }
 
-static inline int16_t sadd16(CPURISCVState *env, int vxrm, int16_t a, int16_t b)
+static inline int16_t sadd16(CPURISCVState *env, int vxrm, int16_t a,
+                             int16_t b)
 {
     int16_t res = a + b;
     if ((res ^ a) & (res ^ b) & INT16_MIN) {
@@ -2322,7 +2327,8 @@ static inline int16_t sadd16(CPURISCVState *env, int vxrm, int16_t a, int16_t b)
     return res;
 }
 
-static inline int32_t sadd32(CPURISCVState *env, int vxrm, int32_t a, int32_t b)
+static inline int32_t sadd32(CPURISCVState *env, int vxrm, int32_t a,
+                             int32_t b)
 {
     int32_t res = a + b;
     if ((res ^ a) & (res ^ b) & INT32_MIN) {
@@ -2332,7 +2338,8 @@ static inline int32_t sadd32(CPURISCVState *env, int vxrm, int32_t a, int32_t b)
     return res;
 }
 
-static inline int64_t sadd64(CPURISCVState *env, int vxrm, int64_t a, int64_t b)
+static inline int64_t sadd64(CPURISCVState *env, int vxrm, int64_t a,
+                             int64_t b)
 {
     int64_t res = a + b;
     if ((res ^ a) & (res ^ b) & INT64_MIN) {
@@ -2360,7 +2367,8 @@ GEN_VEXT_VX_RM(vsadd_vx_h, 2)
 GEN_VEXT_VX_RM(vsadd_vx_w, 4)
 GEN_VEXT_VX_RM(vsadd_vx_d, 8)
 
-static inline uint8_t ssubu8(CPURISCVState *env, int vxrm, uint8_t a, uint8_t b)
+static inline uint8_t ssubu8(CPURISCVState *env, int vxrm, uint8_t a,
+                             uint8_t b)
 {
     uint8_t res = a - b;
     if (res > a) {
@@ -2431,7 +2439,8 @@ static inline int8_t ssub8(CPURISCVState *env, int vxrm, int8_t a, int8_t b)
     return res;
 }
 
-static inline int16_t ssub16(CPURISCVState *env, int vxrm, int16_t a, int16_t b)
+static inline int16_t ssub16(CPURISCVState *env, int vxrm, int16_t a,
+                             int16_t b)
 {
     int16_t res = a - b;
     if ((res ^ a) & (a ^ b) & INT16_MIN) {
@@ -2441,7 +2450,8 @@ static inline int16_t ssub16(CPURISCVState *env, int vxrm, int16_t a, int16_t b)
     return res;
 }
 
-static inline int32_t ssub32(CPURISCVState *env, int vxrm, int32_t a, int32_t b)
+static inline int32_t ssub32(CPURISCVState *env, int vxrm, int32_t a,
+                             int32_t b)
 {
     int32_t res = a - b;
     if ((res ^ a) & (a ^ b) & INT32_MIN) {
@@ -2451,7 +2461,8 @@ static inline int32_t ssub32(CPURISCVState *env, int vxrm, int32_t a, int32_t b)
     return res;
 }
 
-static inline int64_t ssub64(CPURISCVState *env, int vxrm, int64_t a, int64_t b)
+static inline int64_t ssub64(CPURISCVState *env, int vxrm, int64_t a,
+                             int64_t b)
 {
     int64_t res = a - b;
     if ((res ^ a) & (a ^ b) & INT64_MIN) {
@@ -2507,7 +2518,8 @@ static inline uint8_t get_round(int vxrm, uint64_t v, uint8_t shift)
     return 0; /* round-down (truncate) */
 }
 
-static inline int32_t aadd32(CPURISCVState *env, int vxrm, int32_t a, int32_t b)
+static inline int32_t aadd32(CPURISCVState *env, int vxrm, int32_t a,
+                             int32_t b)
 {
     int64_t res = (int64_t)a + b;
     uint8_t round = get_round(vxrm, res, 1);
@@ -2515,7 +2527,8 @@ static inline int32_t aadd32(CPURISCVState *env, int vxrm, int32_t a, int32_t b)
     return (res >> 1) + round;
 }
 
-static inline int64_t aadd64(CPURISCVState *env, int vxrm, int64_t a, int64_t b)
+static inline int64_t aadd64(CPURISCVState *env, int vxrm, int64_t a,
+                             int64_t b)
 {
     int64_t res = a + b;
     uint8_t round = get_round(vxrm, res, 1);
@@ -2580,7 +2593,8 @@ GEN_VEXT_VX_RM(vaaddu_vx_h, 2)
 GEN_VEXT_VX_RM(vaaddu_vx_w, 4)
 GEN_VEXT_VX_RM(vaaddu_vx_d, 8)
 
-static inline int32_t asub32(CPURISCVState *env, int vxrm, int32_t a, int32_t b)
+static inline int32_t asub32(CPURISCVState *env, int vxrm, int32_t a,
+                             int32_t b)
 {
     int64_t res = (int64_t)a - b;
     uint8_t round = get_round(vxrm, res, 1);
@@ -2588,7 +2602,8 @@ static inline int32_t asub32(CPURISCVState *env, int vxrm, int32_t a, int32_t b)
     return (res >> 1) + round;
 }
 
-static inline int64_t asub64(CPURISCVState *env, int vxrm, int64_t a, int64_t b)
+static inline int64_t asub64(CPURISCVState *env, int vxrm, int64_t a,
+                             int64_t b)
 {
     int64_t res = (int64_t)a - b;
     uint8_t round = get_round(vxrm, res, 1);
@@ -4501,7 +4516,9 @@ RVVCALL(OPFVV1, vfwcvt_x_f_v_w, WOP_UU_W, H8, H4, float32_to_int64)
 GEN_VEXT_V_ENV(vfwcvt_x_f_v_h, 4)
 GEN_VEXT_V_ENV(vfwcvt_x_f_v_w, 8)
 
-/* vfwcvt.f.xu.v vd, vs2, vm # Convert unsigned integer to double-width float */
+/*
+ * vfwcvt.f.xu.v vd, vs2, vm # Convert unsigned integer to double-width float.
+ */
 RVVCALL(OPFVV1, vfwcvt_f_xu_v_b, WOP_UU_B, H2, H1, uint8_to_float16)
 RVVCALL(OPFVV1, vfwcvt_f_xu_v_h, WOP_UU_H, H4, H2, uint16_to_float32)
 RVVCALL(OPFVV1, vfwcvt_f_xu_v_w, WOP_UU_W, H8, H4, uint32_to_float64)
@@ -4518,8 +4535,7 @@ GEN_VEXT_V_ENV(vfwcvt_f_x_v_h, 4)
 GEN_VEXT_V_ENV(vfwcvt_f_x_v_w, 8)
 
 /*
- * vfwcvt.f.f.v vd, vs2, vm
- * Convert single-width float to double-width float.
+ * vfwcvt.f.f.v vd, vs2, vm # Convert single-width float to double-width float.
  */
 static uint32_t vfwcvtffv16(uint16_t a, float_status *s)
 {
@@ -4552,7 +4568,9 @@ GEN_VEXT_V_ENV(vfncvt_x_f_w_b, 1)
 GEN_VEXT_V_ENV(vfncvt_x_f_w_h, 2)
 GEN_VEXT_V_ENV(vfncvt_x_f_w_w, 4)
 
-/* vfncvt.f.xu.v vd, vs2, vm # Convert double-width unsigned integer to float */
+/*
+ * vfncvt.f.xu.v vd, vs2, vm # Convert double-width unsigned integer to float.
+ */
 RVVCALL(OPFVV1, vfncvt_f_xu_w_h, NOP_UU_H, H2, H4, uint32_to_float16)
 RVVCALL(OPFVV1, vfncvt_f_xu_w_w, NOP_UU_W, H4, H8, uint64_to_float32)
 GEN_VEXT_V_ENV(vfncvt_f_xu_w_h, 2)
@@ -4702,14 +4720,20 @@ GEN_VEXT_FRED(vfredosum_vs_w, uint32_t, uint32_t, H4, H4, float32_add)
 GEN_VEXT_FRED(vfredosum_vs_d, uint64_t, uint64_t, H8, H8, float64_add)
 
 /* Maximum value */
-GEN_VEXT_FRED(vfredmax_vs_h, uint16_t, uint16_t, H2, H2, float16_maximum_number)
-GEN_VEXT_FRED(vfredmax_vs_w, uint32_t, uint32_t, H4, H4, float32_maximum_number)
-GEN_VEXT_FRED(vfredmax_vs_d, uint64_t, uint64_t, H8, H8, float64_maximum_number)
+GEN_VEXT_FRED(vfredmax_vs_h, uint16_t, uint16_t, H2, H2,
+              float16_maximum_number)
+GEN_VEXT_FRED(vfredmax_vs_w, uint32_t, uint32_t, H4, H4,
+              float32_maximum_number)
+GEN_VEXT_FRED(vfredmax_vs_d, uint64_t, uint64_t, H8, H8,
+              float64_maximum_number)
 
 /* Minimum value */
-GEN_VEXT_FRED(vfredmin_vs_h, uint16_t, uint16_t, H2, H2, float16_minimum_number)
-GEN_VEXT_FRED(vfredmin_vs_w, uint32_t, uint32_t, H4, H4, float32_minimum_number)
-GEN_VEXT_FRED(vfredmin_vs_d, uint64_t, uint64_t, H8, H8, float64_minimum_number)
+GEN_VEXT_FRED(vfredmin_vs_h, uint16_t, uint16_t, H2, H2,
+              float16_minimum_number)
+GEN_VEXT_FRED(vfredmin_vs_w, uint32_t, uint32_t, H4, H4,
+              float32_minimum_number)
+GEN_VEXT_FRED(vfredmin_vs_d, uint64_t, uint64_t, H8, H8,
+              float64_minimum_number)
 
 /* Vector Widening Floating-Point Add Instructions */
 static uint32_t fwadd16(uint32_t a, uint16_t b, float_status *s)
-- 
2.25.1


