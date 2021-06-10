Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lrFpQ-0002oX-8h
	for mharc-qemu-riscv@gnu.org; Thu, 10 Jun 2021 04:14:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lrFpN-0002dh-Pw; Thu, 10 Jun 2021 04:14:13 -0400
Received: from mail142-9.mail.alibaba.com ([198.11.142.9]:4469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lrFpJ-0005uy-Mr; Thu, 10 Jun 2021 04:14:13 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07436419|-1; CH=blue; DM=|OVERLOAD|false|;
 DS=CONTINUE|ham_system_inform|0.715433-0.0034027-0.281165;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047209; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=7; RT=7; SR=0; TI=SMTPD_---.KQN6WCB_1623312839; 
Received: from localhost.localdomain(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.KQN6WCB_1623312839)
 by smtp.aliyun-inc.com(10.147.40.200);
 Thu, 10 Jun 2021 16:13:59 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 richard.henderson@linaro.org, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v2 29/37] target/riscv: RV64 Only SIMD 32-bit Shift
 Instructions
Date: Thu, 10 Jun 2021 15:59:00 +0800
Message-Id: <20210610075908.3305506-30-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210610075908.3305506-1-zhiwei_liu@c-sky.com>
References: <20210610075908.3305506-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=198.11.142.9; envelope-from=zhiwei_liu@c-sky.com;
 helo=mail142-9.mail.alibaba.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 10 Jun 2021 08:14:14 -0000

SIMD 32-bit right shift with rounding or left shift with
saturation.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/helper.h                   |   9 ++
 target/riscv/insn32.decode              |  15 ++++
 target/riscv/insn_trans/trans_rvp.c.inc |  55 +++++++++++++
 target/riscv/packed_helper.c            | 104 ++++++++++++++++++++++++
 4 files changed, 183 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 0f02e140f5..3b2a73db9a 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1428,3 +1428,12 @@ DEF_HELPER_3(rstsa32, i64, env, i64, i64)
 DEF_HELPER_3(urstsa32, i64, env, i64, i64)
 DEF_HELPER_3(kstsa32, i64, env, i64, i64)
 DEF_HELPER_3(ukstsa32, i64, env, i64, i64)
+
+DEF_HELPER_3(sra32, i64, env, i64, i64)
+DEF_HELPER_3(sra32_u, i64, env, i64, i64)
+DEF_HELPER_3(srl32, i64, env, i64, i64)
+DEF_HELPER_3(srl32_u, i64, env, i64, i64)
+DEF_HELPER_3(sll32, i64, env, i64, i64)
+DEF_HELPER_3(ksll32, i64, env, i64, i64)
+DEF_HELPER_3(kslra32, i64, env, i64, i64)
+DEF_HELPER_3(kslra32_u, i64, env, i64, i64)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 05151c6c51..80150c693a 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -1045,3 +1045,18 @@ rstsa32    1011001  ..... ..... 010 ..... 1110111 @r
 urstsa32   1101001  ..... ..... 010 ..... 1110111 @r
 kstsa32    1100001  ..... ..... 010 ..... 1110111 @r
 ukstsa32   1110001  ..... ..... 010 ..... 1110111 @r
+
+sra32      0101000  ..... ..... 010 ..... 1110111 @r
+sra32_u    0110000  ..... ..... 010 ..... 1110111 @r
+srai32     0111000  ..... ..... 010 ..... 1110111 @sh5
+srai32_u   1000000  ..... ..... 010 ..... 1110111 @sh5
+srl32      0101001  ..... ..... 010 ..... 1110111 @r
+srl32_u    0110001  ..... ..... 010 ..... 1110111 @r
+srli32     0111001  ..... ..... 010 ..... 1110111 @sh5
+srli32_u   1000001  ..... ..... 010 ..... 1110111 @sh5
+sll32      0101010  ..... ..... 010 ..... 1110111 @r
+slli32     0111010  ..... ..... 010 ..... 1110111 @sh5
+ksll32     0110010  ..... ..... 010 ..... 1110111 @r
+kslli32    1000010  ..... ..... 010 ..... 1110111 @sh5
+kslra32    0101011  ..... ..... 010 ..... 1110111 @r
+kslra32_u  0110011  ..... ..... 010 ..... 1110111 @r
diff --git a/target/riscv/insn_trans/trans_rvp.c.inc b/target/riscv/insn_trans/trans_rvp.c.inc
index 293c2c4597..6cba14be84 100644
--- a/target/riscv/insn_trans/trans_rvp.c.inc
+++ b/target/riscv/insn_trans/trans_rvp.c.inc
@@ -1033,3 +1033,58 @@ GEN_RVP64_R_OOL(rstsa32);
 GEN_RVP64_R_OOL(urstsa32);
 GEN_RVP64_R_OOL(kstsa32);
 GEN_RVP64_R_OOL(ukstsa32);
+
+/* (RV64 Only) SIMD 32-bit Shift Instructions */
+static inline bool
+rvp64_shifti(DisasContext *ctx, arg_shift *a,
+             void (* fn)(TCGv_i64, TCGv_ptr, TCGv_i64, TCGv_i64))
+{
+    TCGv t1;
+    TCGv_i64 src1, dst, shift;
+    if (!has_ext(ctx, RVP)) {
+        return false;
+    }
+
+    src1 = tcg_temp_new_i64();
+    dst = tcg_temp_new_i64();
+    t1 = tcg_temp_new();
+
+    gen_get_gpr(t1, a->rs1);
+    tcg_gen_ext_tl_i64(src1, t1);
+    shift = tcg_const_i64(a->shamt);
+
+    fn(dst, cpu_env, src1, shift);
+    tcg_gen_trunc_i64_tl(t1, dst);
+    gen_set_gpr(a->rd, t1);
+
+    tcg_temp_free_i64(src1);
+    tcg_temp_free_i64(dst);
+    tcg_temp_free_i64(shift);
+    tcg_temp_free(t1);
+    return true;
+}
+
+#define GEN_RVP64_SHIFTI(NAME, OP)                       \
+static bool trans_##NAME(DisasContext *s, arg_shift *a)  \
+{                                                        \
+    REQUIRE_64BIT(s);                                    \
+    return rvp64_shifti(s, a, OP);                       \
+}
+
+GEN_RVP64_SHIFTI(srai32, gen_helper_sra32);
+GEN_RVP64_SHIFTI(srli32, gen_helper_srl32);
+GEN_RVP64_SHIFTI(slli32, gen_helper_sll32);
+
+GEN_RVP64_SHIFTI(srai32_u, gen_helper_sra32_u);
+GEN_RVP64_SHIFTI(srli32_u, gen_helper_srl32_u);
+GEN_RVP64_SHIFTI(kslli32, gen_helper_ksll32);
+
+GEN_RVP64_R_OOL(sra32);
+GEN_RVP64_R_OOL(srl32);
+GEN_RVP64_R_OOL(sll32);
+GEN_RVP64_R_OOL(ksll32);
+GEN_RVP64_R_OOL(kslra32);
+
+GEN_RVP64_R_OOL(sra32_u);
+GEN_RVP64_R_OOL(srl32_u);
+GEN_RVP64_R_OOL(kslra32_u);
diff --git a/target/riscv/packed_helper.c b/target/riscv/packed_helper.c
index 305c515132..74d42e4c33 100644
--- a/target/riscv/packed_helper.c
+++ b/target/riscv/packed_helper.c
@@ -3263,3 +3263,107 @@ static inline void do_ukstsa32(CPURISCVState *env, void *vd, void *va,
 }
 
 RVPR64_64_64(ukstsa32, 2, 4);
+
+/* (RV64 Only) SIMD 32-bit Shift Instructions */
+static inline void do_sra32(CPURISCVState *env, void *vd, void *va,
+                            void *vb, uint8_t i)
+{
+    int32_t *d = vd, *a = va;
+    uint8_t shift = *(uint8_t *)vb & 0x1f;
+    d[i] = a[i] >> shift;
+}
+
+RVPR64_64_64(sra32, 1, 4);
+
+static inline void do_srl32(CPURISCVState *env, void *vd, void *va,
+                            void *vb, uint8_t i)
+{
+    uint32_t *d = vd, *a = va;
+    uint8_t shift = *(uint8_t *)vb & 0x1f;
+    d[i] = a[i] >> shift;
+}
+
+RVPR64_64_64(srl32, 1, 4);
+
+static inline void do_sll32(CPURISCVState *env, void *vd, void *va,
+                            void *vb, uint8_t i)
+{
+    uint32_t *d = vd, *a = va;
+    uint8_t shift = *(uint8_t *)vb & 0x1f;
+    d[i] = a[i] << shift;
+}
+
+RVPR64_64_64(sll32, 1, 4);
+
+static inline void do_sra32_u(CPURISCVState *env, void *vd, void *va,
+                              void *vb, uint8_t i)
+{
+    int32_t *d = vd, *a = va;
+    uint8_t shift = *(uint8_t *)vb & 0x1f;
+
+    d[i] = vssra32(env, 0, a[i], shift);
+}
+
+RVPR64_64_64(sra32_u, 1, 4);
+
+static inline void do_srl32_u(CPURISCVState *env, void *vd, void *va,
+                              void *vb, uint8_t i)
+{
+    uint32_t *d = vd, *a = va;
+    uint8_t shift = *(uint8_t *)vb & 0x1f;
+
+    d[i] = vssrl32(env, 0, a[i], shift);
+}
+
+RVPR64_64_64(srl32_u, 1, 4);
+
+static inline void do_ksll32(CPURISCVState *env, void *vd, void *va,
+                             void *vb, uint8_t i)
+{
+    int32_t *d = vd, *a = va, result;
+    uint8_t shift = *(uint64_t *)vb & 0x1f;
+
+    result = a[i] << shift;
+    if (shift > clrsb32(a[i])) {
+        env->vxsat = 0x1;
+        d[i] = (a[i] & INT32_MIN) ? INT32_MIN : INT32_MAX;
+    } else {
+        d[i] = result;
+    }
+}
+
+RVPR64_64_64(ksll32, 1, 4);
+
+static inline void do_kslra32(CPURISCVState *env, void *vd, void *va,
+                              void *vb, uint8_t i)
+{
+    int32_t *d = vd, *a = va;
+    int64_t shift = sextract64(*(uint64_t *)vb, 0, 6);
+
+    if (shift >= 0) {
+        do_ksll32(env, vd, va, vb, i);
+    } else {
+        shift = -shift;
+        shift = (shift == 32) ? 31 : shift;
+        d[i] = a[i] >> shift;
+    }
+}
+
+RVPR64_64_64(kslra32, 1, 4);
+
+static inline void do_kslra32_u(CPURISCVState *env, void *vd, void *va,
+                                void *vb, uint8_t i)
+{
+    uint32_t *d = vd, *a = va;
+    int32_t shift = sextract32((*(uint32_t *)vb), 0, 6);
+
+    if (shift >= 0) {
+        do_ksll32(env, vd, va, vb, i);
+    } else {
+        shift = -shift;
+        shift = (shift == 32) ? 31 : shift;
+        d[i] = vssra32(env, 0, a[i], shift);
+    }
+}
+
+RVPR64_64_64(kslra32_u, 1, 4);
-- 
2.25.1


