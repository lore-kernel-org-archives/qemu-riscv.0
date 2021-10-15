Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mbHyY-0002Sw-MI
	for mharc-qemu-riscv@gnu.org; Fri, 15 Oct 2021 03:49:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHyW-0002Kj-Kd
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 03:49:56 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:33748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHyU-0004UF-KO
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 03:49:56 -0400
Received: by mail-pg1-x52a.google.com with SMTP id j190so1123442pgd.0
 for <qemu-riscv@nongnu.org>; Fri, 15 Oct 2021 00:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IznkDKa8SeW0Gt31NIbdKNutJrX41OoStPzUdJHkXjE=;
 b=IU6SYvcnNt7jiILMlvGkqYdX/L+oetxpXcPSLN54AW5wqBNdatcYNcQH2k85DXfwvQ
 ruXmWmgfimoBmR8R4HfX794y1dqnEy1DL+GYK5YtVfhgPejJsDHWUbF51yq1cYeEXrBF
 8K2vyLLT7iKn7fYuFP6Nr4S/SIVMtsiE+t1NsxpWsxQsEkelN4W0ZKz9YFR2K+iYGUk2
 iDp1Ns0j94N43XiPSK0wirm8CQzNvDFspOySF0ToVKFshZY8Xh0N4Ox+J7X/9u7OfMva
 +1jnK9D667Yjv7b2/5yyvaaVJTP53Erc6165IElgQoDwnHRK60XvjNLDCbjHe2wxfKJz
 mbvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IznkDKa8SeW0Gt31NIbdKNutJrX41OoStPzUdJHkXjE=;
 b=z/KueitABHXK0s7BfAZJDqXokGrF9jy5hw9z7vd+5EgruxWm16MXc8IA6uN6xy417p
 9ISl7gDr2kEZNlxWaLupDO/VLReN61pX5TM8XD9c2NEQxA6Vdt6444aqtduUOchLoQiP
 2JGylPNofNmPEtT1uq6d4o3m/oxNm5JMicpg67wjVIeL3IDwjCzEVKcUON+/CyYvnEyB
 9rWqWvQUGtBeQMT+okwV8Js70GnB9eYW5ResPeV6CZPwmXD4mUV+PEsubbOIMGdJmESi
 zKx4iKIAe06WMVNs9aZFQYjyxC9U5aJJ9TXes9kQsEIZMJOxQNr8QtcHBATMQy4SuXnn
 BfbQ==
X-Gm-Message-State: AOAM530IE6muVvwKWwY/rf0wlqK4i7hU8Y1RQU/lohRDQYeTQbibNhfA
 2SnjQx7XpGHme/RSN+Q0fexacA==
X-Google-Smtp-Source: ABdhPJzQfawNdAu+T7tb2rLMAwzyX4liWiMC/asXetGu31jCDsLNFfcV5lZsdwjdW5ForuT8j8HK7A==
X-Received: by 2002:a05:6a00:1a4c:b0:44b:1fa6:532c with SMTP id
 h12-20020a056a001a4c00b0044b1fa6532cmr10268744pfv.64.1634284193338; 
 Fri, 15 Oct 2021 00:49:53 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id z13sm4271680pfq.130.2021.10.15.00.49.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 00:49:53 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v8 51/78] target/riscv: rvv-1.0: floating-point slide
 instructions
Date: Fri, 15 Oct 2021 15:45:59 +0800
Message-Id: <20211015074627.3957162-59-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015074627.3957162-1-frank.chang@sifive.com>
References: <20211015074627.3957162-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 15 Oct 2021 07:49:57 -0000

From: Frank Chang <frank.chang@sifive.com>

Add the following instructions:

* vfslide1up.vf
* vfslide1down.vf

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/helper.h                   |   7 ++
 target/riscv/insn32.decode              |   2 +
 target/riscv/insn_trans/trans_rvv.c.inc |  16 +++
 target/riscv/vector_helper.c            | 141 ++++++++++++++++--------
 4 files changed, 121 insertions(+), 45 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 304c12494d4..012d0343771 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1071,6 +1071,13 @@ DEF_HELPER_6(vslide1down_vx_h, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vslide1down_vx_w, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vslide1down_vx_d, void, ptr, ptr, tl, ptr, env, i32)
 
+DEF_HELPER_6(vfslide1up_vf_h, void, ptr, ptr, i64, ptr, env, i32)
+DEF_HELPER_6(vfslide1up_vf_w, void, ptr, ptr, i64, ptr, env, i32)
+DEF_HELPER_6(vfslide1up_vf_d, void, ptr, ptr, i64, ptr, env, i32)
+DEF_HELPER_6(vfslide1down_vf_h, void, ptr, ptr, i64, ptr, env, i32)
+DEF_HELPER_6(vfslide1down_vf_w, void, ptr, ptr, i64, ptr, env, i32)
+DEF_HELPER_6(vfslide1down_vf_d, void, ptr, ptr, i64, ptr, env, i32)
+
 DEF_HELPER_6(vrgather_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vrgather_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vrgather_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 7548b71efdb..c5cc14c45c4 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -577,6 +577,8 @@ vfsgnjn_vv      001001 . ..... ..... 001 ..... 1010111 @r_vm
 vfsgnjn_vf      001001 . ..... ..... 101 ..... 1010111 @r_vm
 vfsgnjx_vv      001010 . ..... ..... 001 ..... 1010111 @r_vm
 vfsgnjx_vf      001010 . ..... ..... 101 ..... 1010111 @r_vm
+vfslide1up_vf   001110 . ..... ..... 101 ..... 1010111 @r_vm
+vfslide1down_vf 001111 . ..... ..... 101 ..... 1010111 @r_vm
 vmfeq_vv        011000 . ..... ..... 001 ..... 1010111 @r_vm
 vmfeq_vf        011000 . ..... ..... 101 ..... 1010111 @r_vm
 vmfne_vv        011100 . ..... ..... 001 ..... 1010111 @r_vm
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index e59fc5a01d8..7ee1e122e8e 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -3120,6 +3120,22 @@ GEN_OPIVX_TRANS(vslidedown_vx, slidedown_check)
 GEN_OPIVX_TRANS(vslide1down_vx, slidedown_check)
 GEN_OPIVI_TRANS(vslidedown_vi, IMM_ZX, vslidedown_vx, slidedown_check)
 
+/* Vector Floating-Point Slide Instructions */
+static bool fslideup_check(DisasContext *s, arg_rmrr *a)
+{
+    return slideup_check(s, a) &&
+           require_rvf(s);
+}
+
+static bool fslidedown_check(DisasContext *s, arg_rmrr *a)
+{
+    return slidedown_check(s, a) &&
+           require_rvf(s);
+}
+
+GEN_OPFVF_TRANS(vfslide1up_vf, fslideup_check)
+GEN_OPFVF_TRANS(vfslide1down_vf, fslidedown_check)
+
 /* Vector Register Gather Instruction */
 static bool vrgather_vv_check(DisasContext *s, arg_rmrr *a)
 {
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index d79f59e443e..7fa5189af4e 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4455,57 +4455,108 @@ GEN_VEXT_VSLIDEDOWN_VX(vslidedown_vx_h, uint16_t, H2)
 GEN_VEXT_VSLIDEDOWN_VX(vslidedown_vx_w, uint32_t, H4)
 GEN_VEXT_VSLIDEDOWN_VX(vslidedown_vx_d, uint64_t, H8)
 
-#define GEN_VEXT_VSLIDE1UP_VX(NAME, ETYPE, H)                             \
-void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,         \
-                  CPURISCVState *env, uint32_t desc)                      \
-{                                                                         \
-    uint32_t vm = vext_vm(desc);                                          \
-    uint32_t vl = env->vl;                                                \
-    uint32_t i;                                                           \
-                                                                          \
-    for (i = 0; i < vl; i++) {                                            \
-        if (!vm && !vext_elem_mask(v0, i)) {                              \
-            continue;                                                     \
-        }                                                                 \
-        if (i == 0) {                                                     \
-            *((ETYPE *)vd + H(i)) = s1;                                   \
-        } else {                                                          \
-            *((ETYPE *)vd + H(i)) = *((ETYPE *)vs2 + H(i - 1));           \
-        }                                                                 \
-    }                                                                     \
+#define GEN_VEXT_VSLIE1UP(ESZ, H)                                           \
+static void vslide1up_##ESZ(void *vd, void *v0, target_ulong s1, void *vs2, \
+                     CPURISCVState *env, uint32_t desc)                     \
+{                                                                           \
+    typedef uint##ESZ##_t ETYPE;                                            \
+    uint32_t vm = vext_vm(desc);                                            \
+    uint32_t vl = env->vl;                                                  \
+    uint32_t i;                                                             \
+                                                                            \
+    for (i = 0; i < vl; i++) {                                              \
+        if (!vm && !vext_elem_mask(v0, i)) {                                \
+            continue;                                                       \
+        }                                                                   \
+        if (i == 0) {                                                       \
+            *((ETYPE *)vd + H(i)) = s1;                                     \
+        } else {                                                            \
+            *((ETYPE *)vd + H(i)) = *((ETYPE *)vs2 + H(i - 1));             \
+        }                                                                   \
+    }                                                                       \
+}
+
+GEN_VEXT_VSLIE1UP(8,  H1)
+GEN_VEXT_VSLIE1UP(16, H2)
+GEN_VEXT_VSLIE1UP(32, H4)
+GEN_VEXT_VSLIE1UP(64, H8)
+
+#define GEN_VEXT_VSLIDE1UP_VX(NAME, ESZ)                          \
+void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2, \
+                  CPURISCVState *env, uint32_t desc)              \
+{                                                                 \
+    vslide1up_##ESZ(vd, v0, s1, vs2, env, desc);                  \
 }
 
 /* vslide1up.vx vd, vs2, rs1, vm # vd[0]=x[rs1], vd[i+1] = vs2[i] */
-GEN_VEXT_VSLIDE1UP_VX(vslide1up_vx_b, uint8_t,  H1)
-GEN_VEXT_VSLIDE1UP_VX(vslide1up_vx_h, uint16_t, H2)
-GEN_VEXT_VSLIDE1UP_VX(vslide1up_vx_w, uint32_t, H4)
-GEN_VEXT_VSLIDE1UP_VX(vslide1up_vx_d, uint64_t, H8)
-
-#define GEN_VEXT_VSLIDE1DOWN_VX(NAME, ETYPE, H)                           \
-void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,         \
-                  CPURISCVState *env, uint32_t desc)                      \
-{                                                                         \
-    uint32_t vm = vext_vm(desc);                                          \
-    uint32_t vl = env->vl;                                                \
-    uint32_t i;                                                           \
-                                                                          \
-    for (i = 0; i < vl; i++) {                                            \
-        if (!vm && !vext_elem_mask(v0, i)) {                              \
-            continue;                                                     \
-        }                                                                 \
-        if (i == vl - 1) {                                                \
-            *((ETYPE *)vd + H(i)) = s1;                                   \
-        } else {                                                          \
-            *((ETYPE *)vd + H(i)) = *((ETYPE *)vs2 + H(i + 1));           \
-        }                                                                 \
-    }                                                                     \
+GEN_VEXT_VSLIDE1UP_VX(vslide1up_vx_b, 8)
+GEN_VEXT_VSLIDE1UP_VX(vslide1up_vx_h, 16)
+GEN_VEXT_VSLIDE1UP_VX(vslide1up_vx_w, 32)
+GEN_VEXT_VSLIDE1UP_VX(vslide1up_vx_d, 64)
+
+#define GEN_VEXT_VSLIDE1DOWN(ESZ, H)                                          \
+static void vslide1down_##ESZ(void *vd, void *v0, target_ulong s1, void *vs2, \
+                       CPURISCVState *env, uint32_t desc)                     \
+{                                                                             \
+    typedef uint##ESZ##_t ETYPE;                                              \
+    uint32_t vm = vext_vm(desc);                                              \
+    uint32_t vl = env->vl;                                                    \
+    uint32_t i;                                                               \
+                                                                              \
+    for (i = 0; i < vl; i++) {                                                \
+        if (!vm && !vext_elem_mask(v0, i)) {                                  \
+            continue;                                                         \
+        }                                                                     \
+        if (i == vl - 1) {                                                    \
+            *((ETYPE *)vd + H(i)) = s1;                                       \
+        } else {                                                              \
+            *((ETYPE *)vd + H(i)) = *((ETYPE *)vs2 + H(i + 1));               \
+        }                                                                     \
+    }                                                                         \
+}
+
+GEN_VEXT_VSLIDE1DOWN(8,  H1)
+GEN_VEXT_VSLIDE1DOWN(16, H2)
+GEN_VEXT_VSLIDE1DOWN(32, H4)
+GEN_VEXT_VSLIDE1DOWN(64, H8)
+
+#define GEN_VEXT_VSLIDE1DOWN_VX(NAME, ESZ)                        \
+void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2, \
+                  CPURISCVState *env, uint32_t desc)              \
+{                                                                 \
+    vslide1down_##ESZ(vd, v0, s1, vs2, env, desc);                \
 }
 
 /* vslide1down.vx vd, vs2, rs1, vm # vd[i] = vs2[i+1], vd[vl-1]=x[rs1] */
-GEN_VEXT_VSLIDE1DOWN_VX(vslide1down_vx_b, uint8_t,  H1)
-GEN_VEXT_VSLIDE1DOWN_VX(vslide1down_vx_h, uint16_t, H2)
-GEN_VEXT_VSLIDE1DOWN_VX(vslide1down_vx_w, uint32_t, H4)
-GEN_VEXT_VSLIDE1DOWN_VX(vslide1down_vx_d, uint64_t, H8)
+GEN_VEXT_VSLIDE1DOWN_VX(vslide1down_vx_b, 8)
+GEN_VEXT_VSLIDE1DOWN_VX(vslide1down_vx_h, 16)
+GEN_VEXT_VSLIDE1DOWN_VX(vslide1down_vx_w, 32)
+GEN_VEXT_VSLIDE1DOWN_VX(vslide1down_vx_d, 64)
+
+/* Vector Floating-Point Slide Instructions */
+#define GEN_VEXT_VFSLIDE1UP_VF(NAME, ESZ)                     \
+void HELPER(NAME)(void *vd, void *v0, uint64_t s1, void *vs2, \
+                  CPURISCVState *env, uint32_t desc)          \
+{                                                             \
+    vslide1up_##ESZ(vd, v0, s1, vs2, env, desc);              \
+}
+
+/* vfslide1up.vf vd, vs2, rs1, vm # vd[0]=f[rs1], vd[i+1] = vs2[i] */
+GEN_VEXT_VFSLIDE1UP_VF(vfslide1up_vf_h, 16)
+GEN_VEXT_VFSLIDE1UP_VF(vfslide1up_vf_w, 32)
+GEN_VEXT_VFSLIDE1UP_VF(vfslide1up_vf_d, 64)
+
+#define GEN_VEXT_VFSLIDE1DOWN_VF(NAME, ESZ)                   \
+void HELPER(NAME)(void *vd, void *v0, uint64_t s1, void *vs2, \
+                  CPURISCVState *env, uint32_t desc)          \
+{                                                             \
+    vslide1down_##ESZ(vd, v0, s1, vs2, env, desc);            \
+}
+
+/* vfslide1down.vf vd, vs2, rs1, vm # vd[i] = vs2[i+1], vd[vl-1]=f[rs1] */
+GEN_VEXT_VFSLIDE1DOWN_VF(vfslide1down_vf_h, 16)
+GEN_VEXT_VFSLIDE1DOWN_VF(vfslide1down_vf_w, 32)
+GEN_VEXT_VFSLIDE1DOWN_VF(vfslide1down_vf_d, 64)
 
 /* Vector Register Gather Instruction */
 #define GEN_VEXT_VRGATHER_VV(NAME, TS1, TS2, HS1, HS2)                    \
-- 
2.25.1


