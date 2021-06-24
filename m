Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lwNBe-0001OD-B1
	for mharc-qemu-riscv@gnu.org; Thu, 24 Jun 2021 07:06:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lwNBc-0001Ha-FX; Thu, 24 Jun 2021 07:06:20 -0400
Received: from out28-170.mail.aliyun.com ([115.124.28.170]:49099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lwNBU-0002qL-Gi; Thu, 24 Jun 2021 07:06:20 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07441223|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.733612-0.00738679-0.259001;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047188; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.KXKc4z6_1624532766; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.KXKc4z6_1624532766)
 by smtp.aliyun-inc.com(10.147.40.44); Thu, 24 Jun 2021 19:06:06 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v3 19/37] target/riscv: Partial-SIMD Miscellaneous Instructions
Date: Thu, 24 Jun 2021 18:55:03 +0800
Message-Id: <20210624105521.3964-20-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210624105521.3964-1-zhiwei_liu@c-sky.com>
References: <20210624105521.3964-1-zhiwei_liu@c-sky.com>
Received-SPF: none client-ip=115.124.28.170; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-170.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 24 Jun 2021 11:06:21 -0000

32-bit signed or unsigned clip value. 32-bit leading
redundant sign, leading zero, leading one count. Parallel
byte sum of absolute difference or parallel byte sum of
absolute difference accumulation.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/helper.h                   |  8 +++
 target/riscv/insn32.decode              |  8 +++
 target/riscv/insn_trans/trans_rvp.c.inc |  9 +++
 target/riscv/packed_helper.c            | 75 +++++++++++++++++++++++++
 4 files changed, 100 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index a37b023c53..35c8c61b00 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1318,3 +1318,11 @@ DEF_HELPER_4(kmsda, tl, env, tl, tl, tl)
 DEF_HELPER_4(kmsxda, tl, env, tl, tl, tl)
 
 DEF_HELPER_3(smal, i64, env, i64, tl)
+
+DEF_HELPER_3(sclip32, tl, env, tl, tl)
+DEF_HELPER_3(uclip32, tl, env, tl, tl)
+DEF_HELPER_2(clrs32, tl, env, tl)
+DEF_HELPER_2(clz32, tl, env, tl)
+DEF_HELPER_2(clo32, tl, env, tl)
+DEF_HELPER_3(pbsad, tl, env, tl, tl)
+DEF_HELPER_4(pbsada, tl, env, tl, tl, tl)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 233df941b4..ce8bdee34b 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -921,3 +921,11 @@ kmsda      0100110  ..... ..... 001 ..... 1110111 @r
 kmsxda     0100111  ..... ..... 001 ..... 1110111 @r
 
 smal       0101111  ..... ..... 001 ..... 1110111 @r
+
+sclip32    1110010  ..... ..... 000 ..... 1110111 @sh5
+uclip32    1111010  ..... ..... 000 ..... 1110111 @sh5
+clrs32     1010111  11000 ..... 000 ..... 1110111 @r2
+clz32      1010111  11001 ..... 000 ..... 1110111 @r2
+clo32      1010111  11011 ..... 000 ..... 1110111 @r2
+pbsad      1111110  ..... ..... 000 ..... 1110111 @r
+pbsada     1111111  ..... ..... 000 ..... 1110111 @r
diff --git a/target/riscv/insn_trans/trans_rvp.c.inc b/target/riscv/insn_trans/trans_rvp.c.inc
index 8b0728fc5a..43e7e5a75d 100644
--- a/target/riscv/insn_trans/trans_rvp.c.inc
+++ b/target/riscv/insn_trans/trans_rvp.c.inc
@@ -502,3 +502,12 @@ static bool trans_##NAME(DisasContext *s, arg_r *a)    \
 }
 
 GEN_RVP_R_D64_S64_OOL(smal);
+
+/* Partial-SIMD Miscellaneous Instructions */
+GEN_RVP_SHIFTI(sclip32, NULL, gen_helper_sclip32);
+GEN_RVP_SHIFTI(uclip32, NULL, gen_helper_uclip32);
+GEN_RVP_R2_OOL(clrs32);
+GEN_RVP_R2_OOL(clz32);
+GEN_RVP_R2_OOL(clo32);
+GEN_RVP_R_OOL(pbsad);
+GEN_RVP_R_ACC_OOL(pbsada);
diff --git a/target/riscv/packed_helper.c b/target/riscv/packed_helper.c
index 1f9a5d620f..1f2b90c394 100644
--- a/target/riscv/packed_helper.c
+++ b/target/riscv/packed_helper.c
@@ -1969,3 +1969,78 @@ uint64_t helper_smal(CPURISCVState *env, uint64_t a, target_ulong b)
     }
     return result;
 }
+
+/* Partial-SIMD Miscellaneous Instructions */
+static inline void do_sclip32(CPURISCVState *env, void *vd, void *va,
+                              void *vb, uint8_t i)
+{
+    int32_t *d = vd, *a = va;
+    uint8_t shift = *(uint8_t *)vb & 0x1f;
+
+    d[i] = sat64(env, a[i], shift);
+}
+
+RVPR(sclip32, 1, 4);
+
+static inline void do_uclip32(CPURISCVState *env, void *vd, void *va,
+                              void *vb, uint8_t i)
+{
+    int32_t *d = vd, *a = va;
+    uint8_t shift = *(uint8_t *)vb & 0x1f;
+
+    if (a[i] < 0) {
+        d[i] = 0;
+        env->vxsat = 0x1;
+    } else {
+        d[i] = satu64(env, a[i], shift);
+    }
+}
+
+RVPR(uclip32, 1, 4);
+
+static inline void do_clrs32(CPURISCVState *env, void *vd, void *va, uint8_t i)
+{
+    int32_t *d = vd, *a = va;
+    d[i] = clrsb32(a[i]);
+}
+
+RVPR2(clrs32, 1, 4);
+
+static inline void do_clz32(CPURISCVState *env, void *vd, void *va, uint8_t i)
+{
+    int32_t *d = vd, *a = va;
+    d[i] = clz32(a[i]);
+}
+
+RVPR2(clz32, 1, 4);
+
+static inline void do_clo32(CPURISCVState *env, void *vd, void *va, uint8_t i)
+{
+    int32_t *d = vd, *a = va;
+    d[i] = clo32(a[i]);
+}
+
+RVPR2(clo32, 1, 4);
+
+static inline void do_pbsad(CPURISCVState *env, void *vd, void *va,
+                            void *vb, uint8_t i)
+{
+    target_ulong *d = vd;
+    uint8_t *a = va, *b = vb;
+    *d += abs(a[i] - b[i]);
+}
+
+RVPR(pbsad, 1, 1);
+
+static inline void do_pbsada(CPURISCVState *env, void *vd, void *va,
+                             void *vb, void *vc, uint8_t i)
+{
+    target_ulong *d = vd, *c = vc;
+    uint8_t *a = va, *b = vb;
+    if (i == 0) {
+        *d += *c;
+    }
+    *d += abs(a[i] - b[i]);
+}
+
+RVPR_ACC(pbsada, 1, 1);
-- 
2.17.1


