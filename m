Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jtscS-0005qg-QO
	for mharc-qemu-riscv@gnu.org; Fri, 10 Jul 2020 08:59:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jtqeQ-0005ib-Kj
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 06:53:06 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:43935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jtqeO-0006og-Fn
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 06:53:06 -0400
Received: by mail-pf1-x443.google.com with SMTP id u18so2376716pfk.10
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2020 03:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=7C1r4OVFVMYGC91Xet/7rXpO/0WQ8sJ/vzsKzoXBcPY=;
 b=HFyCsCFr9wF3cMhJv6J+vVdEEu8uwFKhsiKOL5h8cUUJZhmzr4rEVTv08u/linJ19A
 /l2LLIwSMIvXa6Nk5YeBGcR1wm7SVAadQHUWjIEhdOVhUXdPSlrA7Nk5/CdsJq1LwX1o
 JDf1TFeqSlLZpiA/dHLCid+eEkKkaofPE9PE2LcZNIciuVbyad4C6VKvKkklllwphroZ
 JTtv4g0znQeDLdwt0OsqoxYYOfSk90oKQ0MNKQYcYbIOWFTiQ97haWJqmj16Nt6c0rky
 bdwxpD5f6Yig/74Rd9WdWWRmWdF8qqYvnS04cXoS5etN1+dJKxEwiWZFqQSggOqo4NQ3
 gJOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=7C1r4OVFVMYGC91Xet/7rXpO/0WQ8sJ/vzsKzoXBcPY=;
 b=OimoZ1O47BDhHm5tL7NVmG6jZ+EgV318ZWW8iD3aFq1HrXd2vOaSEPKyVlrUZOjAR/
 YFsqegKIofQ3Lk81xZwS2PSU4gfBikyFbaQ7lR+r8+kzDfHhL60uLpsJPwSlNoGWjg+t
 wdAFlug71ze789+Lkrh7R4qQkoSPqc4diJ8Sh+OaZSLha8kbLMzcMCLoiSwUFzlpurqA
 LsVOJjFI9OEf5BjQrfypT6jVjYY/QABYcCrq9uqiUdti8UvRRw4TVk1px4jqYo6HF42K
 BLSxxThBydKxVsz0BdmD93y0tIYqWy2760SiR3Ai3Ak9xym7URHBX4zK8FZP9s49xUS4
 CVGA==
X-Gm-Message-State: AOAM533ATlrR/hCq/iUV+kMcZWHB9W0YlloxHY/jGJlZpGm028NX7BEN
 7rrLD8KdUh3v9KD9f7mGiRQa7g==
X-Google-Smtp-Source: ABdhPJxFRuxIqJyDQccXsQeIO9lf9VnO6I1y/qos9JSW/se2x8fTy3wrbzen9IKtS/R+dk1vVouQMw==
X-Received: by 2002:a63:eb52:: with SMTP id b18mr56235417pgk.434.1594378383218; 
 Fri, 10 Jul 2020 03:53:03 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id r191sm5519406pfr.181.2020.07.10.03.53.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 03:53:02 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC 37/65] target/riscv: rvv-0.9: quad-widening integer multiply-add
 instructions
Date: Fri, 10 Jul 2020 18:48:51 +0800
Message-Id: <20200710104920.13550-38-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200710104920.13550-1-frank.chang@sifive.com>
References: <20200710104920.13550-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 10 Jul 2020 08:58:59 -0400
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
X-List-Received-Date: Fri, 10 Jul 2020 10:53:06 -0000

From: Frank Chang <frank.chang@sifive.com>

Add the following instructions:

* vqmaccu.vv
* vqmaccu.vx
* vqmacc.vv
* vqmacc.vx
* vqmaccsu.vv
* vqmaccsu.vx
* vqmaccus.vx

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/helper.h                   | 15 +++++
 target/riscv/insn32.decode              |  7 ++
 target/riscv/insn_trans/trans_rvv.inc.c | 85 ++++++++++++++++++++++++-
 target/riscv/vector_helper.c            | 40 ++++++++++++
 4 files changed, 146 insertions(+), 1 deletion(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 151ed5ac64..2a4e1ea773 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -622,6 +622,21 @@ DEF_HELPER_6(vwmaccus_vx_b, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vwmaccus_vx_h, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vwmaccus_vx_w, void, ptr, ptr, tl, ptr, env, i32)
 
+DEF_HELPER_6(vqmaccu_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vqmaccu_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vqmacc_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vqmacc_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vqmaccsu_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vqmaccsu_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vqmaccu_vx_b, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vqmaccu_vx_h, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vqmacc_vx_b, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vqmacc_vx_h, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vqmaccsu_vx_b, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vqmaccsu_vx_h, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vqmaccus_vx_b, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vqmaccus_vx_h, void, ptr, ptr, tl, ptr, env, i32)
+
 DEF_HELPER_6(vmerge_vvm_b, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vmerge_vvm_h, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vmerge_vvm_w, void, ptr, ptr, ptr, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index c6a7145aa5..acd65cb3a7 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -423,6 +423,13 @@ vwmacc_vx       111101 . ..... ..... 110 ..... 1010111 @r_vm
 vwmaccsu_vv     111111 . ..... ..... 010 ..... 1010111 @r_vm
 vwmaccsu_vx     111111 . ..... ..... 110 ..... 1010111 @r_vm
 vwmaccus_vx     111110 . ..... ..... 110 ..... 1010111 @r_vm
+vqmaccu_vv      111100 . ..... ..... 000 ..... 1010111 @r_vm
+vqmaccu_vx      111100 . ..... ..... 100 ..... 1010111 @r_vm
+vqmacc_vv       111101 . ..... ..... 000 ..... 1010111 @r_vm
+vqmacc_vx       111101 . ..... ..... 100 ..... 1010111 @r_vm
+vqmaccsu_vv     111111 . ..... ..... 000 ..... 1010111 @r_vm
+vqmaccsu_vx     111111 . ..... ..... 100 ..... 1010111 @r_vm
+vqmaccus_vx     111110 . ..... ..... 100 ..... 1010111 @r_vm
 vmv_v_v         010111 1 00000 ..... 000 ..... 1010111 @r2
 vmv_v_x         010111 1 00000 ..... 100 ..... 1010111 @r2
 vmv_v_i         010111 1 00000 ..... 011 ..... 1010111 @r2
diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index 48b376c133..89718fdbc7 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -303,6 +303,33 @@ static uint32_t vreg_ofs(DisasContext *s, int reg)
     }                                                              \
 } while (0)
 
+/*
+ * Check function for vector instruction with format:
+ * quad-width result and single-width sources (4*SEW = SEW op SEW)
+ *
+ * is_vs1: indicates whether insn[19:15] is a vs1 field or not.
+ */
+#define VEXT_CHECK_QSS(s, rd, rs1, rs2, vm, is_vs1) do {           \
+    require(s->flmul <= 2);                                        \
+    require(s->sew < 2);                                           \
+    require_align(rd, s->flmul * 4);                               \
+    require_align(rs2, s->flmul);                                  \
+    require_vm(rd, vm);                                            \
+    if (s->flmul < 1) {                                            \
+        require_noover(rd, s->flmul * 4, rs2, s->flmul);           \
+    } else {                                                       \
+        require_noover_widen(rd, s->flmul * 4, rs2, s->flmul);     \
+    }                                                              \
+    if (is_vs1) {                                                  \
+        require_align(rs1, s->flmul);                              \
+        if (s->flmul < 1) {                                        \
+            require_noover(rd, s->flmul * 4, rs1, s->flmul);       \
+        } else {                                                   \
+            require_noover_widen(rd, s->flmul * 4, rs1, s->flmul); \
+        }                                                          \
+    }                                                              \
+} while (0)
+
 /*
  * Check function for vector instruction with format:
  * double-width result and double-width source1 and single-width
@@ -1924,7 +1951,63 @@ GEN_OPIVX_WIDEN_TRANS(vwmacc_vx)
 GEN_OPIVX_WIDEN_TRANS(vwmaccsu_vx)
 GEN_OPIVX_WIDEN_TRANS(vwmaccus_vx)
 
-/* Vector Integer Merge and Move Instructions */
+/* Vector Quad-Widening Integer Multiply-Add Instructions (Extension Zvqmac) */
+/* OPIVV with QUAD-WIDEN */
+static bool opivv_quad_widen_check(DisasContext *s, arg_rmrr *a)
+{
+    REQUIRE_RVV;
+    VEXT_CHECK_ISA_ILL(s);
+    VEXT_CHECK_QSS(s, a->rd, a->rs1, a->rs2, a->vm, true);
+    return true;
+}
+
+#define GEN_OPIVV_QUAD_WIDEN_TRANS(NAME, CHECK)        \
+static bool trans_##NAME(DisasContext *s, arg_rmrr *a) \
+{                                                      \
+    static gen_helper_gvec_4_ptr * const fns[2] = {    \
+        gen_helper_##NAME##_b,                         \
+        gen_helper_##NAME##_h                          \
+    };                                                 \
+    return do_opivv_widen(s, a, fns[s->sew], CHECK);   \
+}
+
+GEN_OPIVV_QUAD_WIDEN_TRANS(vqmaccu_vv, opivv_quad_widen_check)
+GEN_OPIVV_QUAD_WIDEN_TRANS(vqmacc_vv, opivv_quad_widen_check)
+GEN_OPIVV_QUAD_WIDEN_TRANS(vqmaccsu_vv, opivv_quad_widen_check)
+
+/* OPIVX with QUAD-WIDEN */
+static bool opivx_quad_widen_check(DisasContext *s, arg_rmrr *a)
+{
+    REQUIRE_RVV;
+    VEXT_CHECK_ISA_ILL(s);
+    VEXT_CHECK_QSS(s, a->rd, a->rs1, a->rs2, a->vm, false);
+    return true;
+}
+
+static bool do_opivx_quad_widen(DisasContext *s, arg_rmrr *a,
+                                gen_helper_opivx *fn)
+{
+    if (opivx_quad_widen_check(s, a)) {
+        return opivx_trans(a->rd, a->rs1, a->rs2, a->vm, fn, s);
+    }
+    return false;
+}
+
+#define GEN_OPIVX_QUAD_WIDEN_TRANS(NAME)               \
+static bool trans_##NAME(DisasContext *s, arg_rmrr *a) \
+{                                                      \
+    static gen_helper_opivx * const fns[3] = {         \
+        gen_helper_##NAME##_b,                         \
+        gen_helper_##NAME##_h                          \
+    };                                                 \
+    return do_opivx_quad_widen(s, a, fns[s->sew]);     \
+}
+
+GEN_OPIVX_QUAD_WIDEN_TRANS(vqmaccu_vx)
+GEN_OPIVX_QUAD_WIDEN_TRANS(vqmacc_vx)
+GEN_OPIVX_QUAD_WIDEN_TRANS(vqmaccsu_vx)
+GEN_OPIVX_QUAD_WIDEN_TRANS(vqmaccus_vx)
+
 static bool trans_vmv_v_v(DisasContext *s, arg_vmv_v_v *a)
 {
     if (vext_check_isa_ill(s) &&
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 454864a90b..47ba264f1f 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -2127,6 +2127,46 @@ GEN_VEXT_VX(vwmaccus_vx_b, 1, 2, clearh)
 GEN_VEXT_VX(vwmaccus_vx_h, 2, 4, clearl)
 GEN_VEXT_VX(vwmaccus_vx_w, 4, 8, clearq)
 
+/* Vector Quad-Widening Integer Multiply-Add Instructions */
+#define QOP_UUU_B uint32_t, uint8_t, uint8_t, uint32_t, uint32_t
+#define QOP_UUU_H uint64_t, uint16_t, uint16_t, uint64_t, uint64_t
+#define QOP_SSS_B int32_t, int8_t, int8_t, int32_t, int32_t
+#define QOP_SSS_H int64_t, int16_t, int16_t, int64_t, int64_t
+#define QOP_SUS_B int32_t, uint8_t, int8_t, uint32_t, int32_t
+#define QOP_SUS_H int64_t, uint16_t, int16_t, uint64_t, int64_t
+#define QOP_SSU_B int32_t, int8_t, uint8_t, int32_t, uint32_t
+#define QOP_SSU_H int64_t, int16_t, uint16_t, int64_t, uint64_t
+
+RVVCALL(OPIVV3, vqmaccu_vv_b,  QOP_UUU_B, H4, H1, H1, DO_MACC)
+RVVCALL(OPIVV3, vqmaccu_vv_h,  QOP_UUU_H, H8, H2, H2, DO_MACC)
+RVVCALL(OPIVV3, vqmacc_vv_b,   QOP_SSS_B, H4, H1, H1, DO_MACC)
+RVVCALL(OPIVV3, vqmacc_vv_h,   QOP_SSS_H, H8, H2, H2, DO_MACC)
+RVVCALL(OPIVV3, vqmaccsu_vv_b, QOP_SSU_B, H4, H1, H1, DO_MACC)
+RVVCALL(OPIVV3, vqmaccsu_vv_h, QOP_SSU_H, H8, H2, H2, DO_MACC)
+GEN_VEXT_VV(vqmaccu_vv_b,  1, 4, clearl)
+GEN_VEXT_VV(vqmaccu_vv_h,  2, 8, clearq)
+GEN_VEXT_VV(vqmacc_vv_b,   1, 4, clearl)
+GEN_VEXT_VV(vqmacc_vv_h,   2, 8, clearq)
+GEN_VEXT_VV(vqmaccsu_vv_b, 1, 4, clearl)
+GEN_VEXT_VV(vqmaccsu_vv_h, 2, 8, clearq)
+
+RVVCALL(OPIVX3, vqmaccu_vx_b,  QOP_UUU_B, H4, H1, DO_MACC)
+RVVCALL(OPIVX3, vqmaccu_vx_h,  QOP_UUU_H, H8, H2, DO_MACC)
+RVVCALL(OPIVX3, vqmacc_vx_b,   QOP_SSS_B, H4, H1, DO_MACC)
+RVVCALL(OPIVX3, vqmacc_vx_h,   QOP_SSS_H, H8, H2, DO_MACC)
+RVVCALL(OPIVX3, vqmaccsu_vx_b, QOP_SSU_B, H4, H1, DO_MACC)
+RVVCALL(OPIVX3, vqmaccsu_vx_h, QOP_SSU_H, H8, H2, DO_MACC)
+RVVCALL(OPIVX3, vqmaccus_vx_b, QOP_SUS_B, H4, H1, DO_MACC)
+RVVCALL(OPIVX3, vqmaccus_vx_h, QOP_SUS_H, H8, H2, DO_MACC)
+GEN_VEXT_VX(vqmaccu_vx_b,  1, 4, clearl)
+GEN_VEXT_VX(vqmaccu_vx_h,  2, 8, clearq)
+GEN_VEXT_VX(vqmacc_vx_b,   1, 4, clearl)
+GEN_VEXT_VX(vqmacc_vx_h,   2, 8, clearq)
+GEN_VEXT_VX(vqmaccsu_vx_b, 1, 4, clearl)
+GEN_VEXT_VX(vqmaccsu_vx_h, 2, 8, clearq)
+GEN_VEXT_VX(vqmaccus_vx_b, 1, 4, clearl)
+GEN_VEXT_VX(vqmaccus_vx_h, 2, 8, clearq)
+
 /* Vector Integer Merge and Move Instructions */
 #define GEN_VEXT_VMV_VV(NAME, ETYPE, H, CLEAR_FN)                    \
 void HELPER(NAME)(void *vd, void *vs1, CPURISCVState *env,           \
-- 
2.17.1


