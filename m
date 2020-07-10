Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jtscr-0006it-1f
	for mharc-qemu-riscv@gnu.org; Fri, 10 Jul 2020 08:59:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jtqfm-0006DS-Ts
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 06:54:30 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:38889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jtqfk-00071w-V5
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 06:54:30 -0400
Received: by mail-pg1-x52c.google.com with SMTP id e8so2372761pgc.5
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2020 03:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=5EDlYxmadc0cyPj3YXsmMssGXZrxp7jPHCe+kGSQzDI=;
 b=SfK7mkaoxHd7zBpede43oAJGTgoEUK7kJSyW5cm+DtgbOMh63n1uCz62PhxJQjFO/M
 Wj+1FydRJKQpAscTSR0HsjyX9N5wnkfwVYhTd4VMEVrY3Hv4Kk2JMO8El7pTglMvFIPC
 aSpcvNc4RFNeFNyRMLGi1qBdCeBbI9ZtD2aVadTuDOe91+F7s17reCZ3gRwizyFSk0Vs
 2+kZ/NXt+TP8R2TuIS4I7z7RyyQDVaM+P5ODaKv1vMJvN4q5vno0zbAOZ8OYu0dZyH+j
 G0sNwYU+OtSGkRRTaGSd866vQuyFIInmRAgwFRkC8ySD8S0LUQereAqMUBBMwniUh8Le
 tl/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=5EDlYxmadc0cyPj3YXsmMssGXZrxp7jPHCe+kGSQzDI=;
 b=MtDV7u8knZ5+EXMG6ksW2h/wBGWCmVFnNQL7loL+gPHC0UWJAOGNsUXxrNUdljYJ27
 KfoFP1h1pxTw2OmnKghk5T37gqJJQcF5GuGcfzkBO4XavIMGJxsUaVSMkkuGLI8fRlQQ
 psAOvq9q31eq1D4OgSjsA9w/U/hQ/uhAGLMePpHbW+5ovVrmjdxVIkwVmxITGHVzCXPG
 XAgAyyJcA5KoZMEgyWPQr32sCrfoIAUe9p1dQG+xwy3WeLmVlcmOfL4uFwDasMCSNkpa
 bK86g/JCorKgZDNwydcIualPIkzdPe1vqjyi/yeBX3YnEVj3pTrZrpE5M5iQBxtbse+i
 RuBA==
X-Gm-Message-State: AOAM533Uz0PcBD3JX9Ta3csbipNxFcQWnV8hXvru3YbxUpVtdoJ9F+MI
 5HZTbay6D4wUD3B3yfcJscKEtQ==
X-Google-Smtp-Source: ABdhPJx8/GlHW6AgzF6wi9c7SCm82j7hmYvdV6VremNO7poWi+AuZJMobRi+1r3xqY73BhDtaQeEew==
X-Received: by 2002:a63:c152:: with SMTP id p18mr59705609pgi.64.1594378467697; 
 Fri, 10 Jul 2020 03:54:27 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id r191sm5519406pfr.181.2020.07.10.03.54.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 03:54:27 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC 58/65] target/riscv: rvv-0.9: widening floating-point/integer
 type-convert
Date: Fri, 10 Jul 2020 18:49:12 +0800
Message-Id: <20200710104920.13550-59-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200710104920.13550-1-frank.chang@sifive.com>
References: <20200710104920.13550-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x52c.google.com
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
X-Mailman-Approved-At: Fri, 10 Jul 2020 08:59:04 -0400
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
X-List-Received-Date: Fri, 10 Jul 2020 10:54:31 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/helper.h                   |  6 ++++
 target/riscv/insn32.decode              | 13 +++++---
 target/riscv/insn_trans/trans_rvv.inc.c | 44 +++++++++++++++++++++++--
 target/riscv/vector_helper.c            | 29 +++++++++++++++-
 4 files changed, 84 insertions(+), 8 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index e9655453bc..0cd5979288 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -977,12 +977,18 @@ DEF_HELPER_5(vfwcvt_xu_f_v_h, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_5(vfwcvt_xu_f_v_w, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_5(vfwcvt_x_f_v_h, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_5(vfwcvt_x_f_v_w, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vfwcvt_f_xu_v_b, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_5(vfwcvt_f_xu_v_h, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_5(vfwcvt_f_xu_v_w, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vfwcvt_f_x_v_b, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_5(vfwcvt_f_x_v_h, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_5(vfwcvt_f_x_v_w, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_5(vfwcvt_f_f_v_h, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_5(vfwcvt_f_f_v_w, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vfwcvt_rtz_xu_f_v_h, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vfwcvt_rtz_xu_f_v_w, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vfwcvt_rtz_x_f_v_h, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vfwcvt_rtz_x_f_v_w, void, ptr, ptr, ptr, env, i32)
 
 DEF_HELPER_5(vfncvt_xu_f_v_h, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_5(vfncvt_xu_f_v_w, void, ptr, ptr, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index bc0e44b8ab..55d7a6f338 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -545,11 +545,14 @@ vfcvt_f_xu_v       010010 . ..... 00010 001 ..... 1010111 @r2_vm
 vfcvt_f_x_v        010010 . ..... 00011 001 ..... 1010111 @r2_vm
 vfcvt_rtz_xu_f_v   010010 . ..... 00110 001 ..... 1010111 @r2_vm
 vfcvt_rtz_x_f_v    010010 . ..... 00111 001 ..... 1010111 @r2_vm
-vfwcvt_xu_f_v   100010 . ..... 01000 001 ..... 1010111 @r2_vm
-vfwcvt_x_f_v    100010 . ..... 01001 001 ..... 1010111 @r2_vm
-vfwcvt_f_xu_v   100010 . ..... 01010 001 ..... 1010111 @r2_vm
-vfwcvt_f_x_v    100010 . ..... 01011 001 ..... 1010111 @r2_vm
-vfwcvt_f_f_v    100010 . ..... 01100 001 ..... 1010111 @r2_vm
+
+vfwcvt_xu_f_v      010010 . ..... 01000 001 ..... 1010111 @r2_vm
+vfwcvt_x_f_v       010010 . ..... 01001 001 ..... 1010111 @r2_vm
+vfwcvt_f_xu_v      010010 . ..... 01010 001 ..... 1010111 @r2_vm
+vfwcvt_f_x_v       010010 . ..... 01011 001 ..... 1010111 @r2_vm
+vfwcvt_f_f_v       010010 . ..... 01100 001 ..... 1010111 @r2_vm
+vfwcvt_rtz_xu_f_v  010010 . ..... 01110 001 ..... 1010111 @r2_vm
+vfwcvt_rtz_x_f_v   010010 . ..... 01111 001 ..... 1010111 @r2_vm
 vfncvt_xu_f_v   100010 . ..... 10000 001 ..... 1010111 @r2_vm
 vfncvt_x_f_v    100010 . ..... 10001 001 ..... 1010111 @r2_vm
 vfncvt_f_xu_v   100010 . ..... 10010 001 ..... 1010111 @r2_vm
diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index fb2c119e13..4840200f01 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -2674,9 +2674,49 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
 
 GEN_OPFV_WIDEN_TRANS(vfwcvt_xu_f_v)
 GEN_OPFV_WIDEN_TRANS(vfwcvt_x_f_v)
-GEN_OPFV_WIDEN_TRANS(vfwcvt_f_xu_v)
-GEN_OPFV_WIDEN_TRANS(vfwcvt_f_x_v)
 GEN_OPFV_WIDEN_TRANS(vfwcvt_f_f_v)
+GEN_OPFV_WIDEN_TRANS(vfwcvt_rtz_xu_f_v)
+GEN_OPFV_WIDEN_TRANS(vfwcvt_rtz_x_f_v)
+
+static bool opfxv_widen_check(DisasContext *s, arg_rmr *a)
+{
+    REQUIRE_RVV;
+    VEXT_CHECK_ISA_ILL(s);
+    /* OPFV widening instructions ignore vs1 check */
+    VEXT_CHECK_DSS(s, a->rd, 0, a->rs2, a->vm, false);
+    return true;
+}
+
+#define GEN_OPFXV_WIDEN_TRANS(NAME)                                \
+static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
+{                                                                  \
+    if (opfxv_widen_check(s, a)) {                                 \
+        uint32_t data = 0;                                         \
+        static gen_helper_gvec_3_ptr * const fns[3] = {            \
+            gen_helper_##NAME##_b,                                 \
+            gen_helper_##NAME##_h,                                 \
+            gen_helper_##NAME##_w,                                 \
+        };                                                         \
+        TCGLabel *over = gen_new_label();                          \
+        gen_set_rm(s, 7);                                          \
+        tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
+                                                                   \
+        data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
+        data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
+        data = FIELD_DP32(data, VDATA, VTA, s->vta);               \
+        data = FIELD_DP32(data, VDATA, VMA, s->vma);               \
+        tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
+                           vreg_ofs(s, a->rs2), cpu_env, 0,        \
+                           s->vlen / 8, data, fns[s->sew]);        \
+        mark_vs_dirty(s);                                          \
+        gen_set_label(over);                                       \
+        return true;                                               \
+    }                                                              \
+    return false;                                                  \
+}
+
+GEN_OPFXV_WIDEN_TRANS(vfwcvt_f_xu_v)
+GEN_OPFXV_WIDEN_TRANS(vfwcvt_f_x_v)
 
 /* Narrowing Floating-Point/Integer Type-Convert Instructions */
 
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index d617d0dfbd..0b6dd4c93f 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4295,6 +4295,7 @@ GEN_VEXT_V_ENV(vfcvt_rtz_x_f_v_d, 8, 8, clearq)
 
 /* Widening Floating-Point/Integer Type-Convert Instructions */
 /* (TD, T2, TX2) */
+#define WOP_UU_B uint16_t, uint8_t,  uint8_t
 #define WOP_UU_H uint32_t, uint16_t, uint16_t
 #define WOP_UU_W uint64_t, uint32_t, uint32_t
 /* vfwcvt.xu.f.v vd, vs2, vm # Convert float to double-width unsigned integer.*/
@@ -4310,19 +4311,45 @@ GEN_VEXT_V_ENV(vfwcvt_x_f_v_h, 2, 4, clearl)
 GEN_VEXT_V_ENV(vfwcvt_x_f_v_w, 4, 8, clearq)
 
 /* vfwcvt.f.xu.v vd, vs2, vm # Convert unsigned integer to double-width float */
+RVVCALL(OPFVV1, vfwcvt_f_xu_v_b, WOP_UU_B, H2, H1, uint8_to_float16)
 RVVCALL(OPFVV1, vfwcvt_f_xu_v_h, WOP_UU_H, H4, H2, uint16_to_float32)
 RVVCALL(OPFVV1, vfwcvt_f_xu_v_w, WOP_UU_W, H8, H4, uint32_to_float64)
+GEN_VEXT_V_ENV(vfwcvt_f_xu_v_b, 1, 2, clearh)
 GEN_VEXT_V_ENV(vfwcvt_f_xu_v_h, 2, 4, clearl)
 GEN_VEXT_V_ENV(vfwcvt_f_xu_v_w, 4, 8, clearq)
 
 /* vfwcvt.f.x.v vd, vs2, vm # Convert integer to double-width float. */
+RVVCALL(OPFVV1, vfwcvt_f_x_v_b, WOP_UU_B, H2, H1, int8_to_float16)
 RVVCALL(OPFVV1, vfwcvt_f_x_v_h, WOP_UU_H, H4, H2, int16_to_float32)
 RVVCALL(OPFVV1, vfwcvt_f_x_v_w, WOP_UU_W, H8, H4, int32_to_float64)
+GEN_VEXT_V_ENV(vfwcvt_f_x_v_b, 1, 2, clearh)
 GEN_VEXT_V_ENV(vfwcvt_f_x_v_h, 2, 4, clearl)
 GEN_VEXT_V_ENV(vfwcvt_f_x_v_w, 4, 8, clearq)
 
 /*
- * vfwcvt.f.f.v vd, vs2, vm #
+ * vfwcvt.rtz.xu.f.v vd, vs2, vm
+ * Convert float to double-width unsigned integer, truncating
+ */
+FCVT_RTZ_F_V(float16, uint32)
+FCVT_RTZ_F_V(float32, uint64)
+RVVCALL(OPFVV1, vfwcvt_rtz_xu_f_v_h, WOP_UU_H, H4, H2, float16_to_uint32_rtz)
+RVVCALL(OPFVV1, vfwcvt_rtz_xu_f_v_w, WOP_UU_W, H8, H4, float32_to_uint64_rtz)
+GEN_VEXT_V_ENV(vfwcvt_rtz_xu_f_v_h, 2, 4, clearl)
+GEN_VEXT_V_ENV(vfwcvt_rtz_xu_f_v_w, 4, 8, clearq)
+
+/*
+ * vfwcvt.rtz.x.f.v  vd, vs2, vm
+ * Convert float to double-width signed integer, truncating.
+ */
+FCVT_RTZ_F_V(float16, int32)
+FCVT_RTZ_F_V(float32, int64)
+RVVCALL(OPFVV1, vfwcvt_rtz_x_f_v_h, WOP_UU_H, H4, H2, float16_to_int32_rtz)
+RVVCALL(OPFVV1, vfwcvt_rtz_x_f_v_w, WOP_UU_W, H8, H4, float32_to_int64_rtz)
+GEN_VEXT_V_ENV(vfwcvt_rtz_x_f_v_h, 2, 4, clearl)
+GEN_VEXT_V_ENV(vfwcvt_rtz_x_f_v_w, 4, 8, clearq)
+
+/*
+ * vfwcvt.f.f.v vd, vs2, vm
  * Convert single-width float to double-width float.
  */
 static uint32_t vfwcvtffv16(uint16_t a, float_status *s)
-- 
2.17.1


