Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mgNnT-00005c-0p
	for mharc-qemu-riscv@gnu.org; Fri, 29 Oct 2021 05:03:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNnQ-0008T3-Tu
 for qemu-riscv@nongnu.org; Fri, 29 Oct 2021 05:03:32 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:46622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNnO-0006gW-K1
 for qemu-riscv@nongnu.org; Fri, 29 Oct 2021 05:03:32 -0400
Received: by mail-pg1-x533.google.com with SMTP id m21so9259912pgu.13
 for <qemu-riscv@nongnu.org>; Fri, 29 Oct 2021 02:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vBWkeJq0iGzRJsn8Gd5jsi1w9vh2rm8pAxN7E75hP6s=;
 b=OLhUL3vipsCRdsdYPyfLDZtKqB8lity+ETOVGw0kmYIBY3gLSardcVceKocAF1wePx
 HHpkUI/B8vmGAGQeK0GDpvHCH5qECsqEkoXmxqgi2kr6bguG3zA8R4SUTR6zx4dXKHZz
 nKLMvnFIYSzeY2Q/EM6mmYA68F3mdK2MhccqDdpTrLKJ6HFxEJtv3bZqI6+y88Qc1+ee
 2xGEUHTTKd0X3ogI1sY2jfYOgsNwkXEUGsTbUj+UMgq9dJqEMsw+xczFkwKY7SNAg1dH
 W+/UpRK7kXvahNdxWcXPXTxk7Chop98yVzP9yG9dfDNQ4tnUhfeZ+R4V/x28Ya45yrro
 S3YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vBWkeJq0iGzRJsn8Gd5jsi1w9vh2rm8pAxN7E75hP6s=;
 b=pMV58wyxexHJv49Xoeq0MrmzO05F+T56PagpqTobr8IW39hpp84SywtF1JKvs932TO
 WTaq4zPfgzHTDe/t7I14JdZI2UKx/m5OIszWPubVvFnUApeCCipmGAju8kU74392LMvO
 bdpGpl03HjX5DWZg6oiOxAVFIy4D71c+cvnguXy+IVE0gKxsgSOhKctNE4RkvpLFCPmB
 vI/ewgrY9ubbaDN5p3hn/o724vlYWIRjb+6kdWFQNXui/dIIDKp3lXF8KwJsdk8cfEW8
 G6wYFPaJcVcmR4DNGsx1gBHenJ6kT88Voktk8L78DCGXSk9Xd19Myxy/enLX/NxMpQ9v
 Tk/Q==
X-Gm-Message-State: AOAM532Tj3VA6G8sLmtbAGeP4CbG0dI1Vc9ScbuhmYM2ehN+NCJnk0FT
 LLsUlyCloj+QQLpCH9X0ZvTxjw==
X-Google-Smtp-Source: ABdhPJzYNI6RN5WQtk4AqoR2sMB2LvlA+e25PlkOXM2N3BPIKf0PK1/KffuZ0m4tV533Lrl5uhveug==
X-Received: by 2002:a62:7989:0:b0:47b:e0f6:de0f with SMTP id
 u131-20020a627989000000b0047be0f6de0fmr9846914pfc.42.1635498208309; 
 Fri, 29 Oct 2021 02:03:28 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:46b:ce55:983b:6962:38ac:e1b9])
 by smtp.gmail.com with ESMTPSA id t13sm5081477pgn.94.2021.10.29.02.03.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 02:03:28 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v9 61/76] target/riscv: rvv-1.0: floating-point/integer
 type-convert instructions
Date: Fri, 29 Oct 2021 16:59:06 +0800
Message-Id: <20211029085922.255197-62-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029085922.255197-1-frank.chang@sifive.com>
References: <20211029085922.255197-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x533.google.com
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
X-List-Received-Date: Fri, 29 Oct 2021 09:03:33 -0000

From: Frank Chang <frank.chang@sifive.com>

Add the following instructions:

* vfcvt.rtz.xu.f.v
* vfcvt.rtz.x.f.v

Also adjust GEN_OPFV_TRANS() to accept multiple floating-point rounding
modes.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn32.decode              | 11 ++--
 target/riscv/insn_trans/trans_rvv.c.inc | 84 +++++++++++++++----------
 2 files changed, 59 insertions(+), 36 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 20b3095f56c..02064f8ec98 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -585,10 +585,13 @@ vmfge_vf        011111 . ..... ..... 101 ..... 1010111 @r_vm
 vfclass_v       010011 . ..... 10000 001 ..... 1010111 @r2_vm
 vfmerge_vfm     010111 0 ..... ..... 101 ..... 1010111 @r_vm_0
 vfmv_v_f        010111 1 00000 ..... 101 ..... 1010111 @r2
-vfcvt_xu_f_v    100010 . ..... 00000 001 ..... 1010111 @r2_vm
-vfcvt_x_f_v     100010 . ..... 00001 001 ..... 1010111 @r2_vm
-vfcvt_f_xu_v    100010 . ..... 00010 001 ..... 1010111 @r2_vm
-vfcvt_f_x_v     100010 . ..... 00011 001 ..... 1010111 @r2_vm
+
+vfcvt_xu_f_v       010010 . ..... 00000 001 ..... 1010111 @r2_vm
+vfcvt_x_f_v        010010 . ..... 00001 001 ..... 1010111 @r2_vm
+vfcvt_f_xu_v       010010 . ..... 00010 001 ..... 1010111 @r2_vm
+vfcvt_f_x_v        010010 . ..... 00011 001 ..... 1010111 @r2_vm
+vfcvt_rtz_xu_f_v   010010 . ..... 00110 001 ..... 1010111 @r2_vm
+vfcvt_rtz_x_f_v    010010 . ..... 00111 001 ..... 1010111 @r2_vm
 vfwcvt_xu_f_v   100010 . ..... 01000 001 ..... 1010111 @r2_vm
 vfwcvt_x_f_v    100010 . ..... 01001 001 ..... 1010111 @r2_vm
 vfwcvt_f_xu_v   100010 . ..... 01010 001 ..... 1010111 @r2_vm
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 047be5d5c47..4bc4dfa69fc 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -1,5 +1,4 @@
 /*
- * RISC-V translation routines for the RVV Standard Extension.
  *
  * Copyright (c) 2020 T-Head Semiconductor Co., Ltd. All rights reserved.
  *
@@ -2369,34 +2368,41 @@ static bool opfv_check(DisasContext *s, arg_rmr *a)
            vext_check_ss(s, a->rd, a->rs2, a->vm);
 }
 
-#define GEN_OPFV_TRANS(NAME, CHECK)                                \
-static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
-{                                                                  \
-    if (CHECK(s, a)) {                                             \
-        uint32_t data = 0;                                         \
-        static gen_helper_gvec_3_ptr * const fns[3] = {            \
-            gen_helper_##NAME##_h,                                 \
-            gen_helper_##NAME##_w,                                 \
-            gen_helper_##NAME##_d,                                 \
-        };                                                         \
-        TCGLabel *over = gen_new_label();                          \
-        gen_set_rm(s, RISCV_FRM_DYN);                              \
-        tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
-                                                                   \
-        data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
-        data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
-        tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
-                           vreg_ofs(s, a->rs2), cpu_env,           \
-                           s->vlen / 8, s->vlen / 8, data,         \
-                           fns[s->sew - 1]);                       \
-        mark_vs_dirty(s);                                          \
-        gen_set_label(over);                                       \
-        return true;                                               \
-    }                                                              \
-    return false;                                                  \
+static bool do_opfv(DisasContext *s, arg_rmr *a,
+                    gen_helper_gvec_3_ptr *fn,
+                    bool (*checkfn)(DisasContext *, arg_rmr *),
+                    int rm)
+{
+    if (checkfn(s, a)) {
+        uint32_t data = 0;
+        TCGLabel *over = gen_new_label();
+        gen_set_rm(s, rm);
+        tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
+
+        data = FIELD_DP32(data, VDATA, VM, a->vm);
+        data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
+        tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
+                           vreg_ofs(s, a->rs2), cpu_env,
+                           s->vlen / 8, s->vlen / 8, data, fn);
+        mark_vs_dirty(s);
+        gen_set_label(over);
+        return true;
+    }
+    return false;
+}
+
+#define GEN_OPFV_TRANS(NAME, CHECK, FRM)               \
+static bool trans_##NAME(DisasContext *s, arg_rmr *a)  \
+{                                                      \
+    static gen_helper_gvec_3_ptr * const fns[3] = {    \
+        gen_helper_##NAME##_h,                         \
+        gen_helper_##NAME##_w,                         \
+        gen_helper_##NAME##_d                          \
+    };                                                 \
+    return do_opfv(s, a, fns[s->sew - 1], CHECK, FRM); \
 }
 
-GEN_OPFV_TRANS(vfsqrt_v, opfv_check)
+GEN_OPFV_TRANS(vfsqrt_v, opfv_check, RISCV_FRM_DYN)
 
 /* Vector Floating-Point MIN/MAX Instructions */
 GEN_OPFVV_TRANS(vfmin_vv, opfvv_check)
@@ -2442,7 +2448,7 @@ GEN_OPFVF_TRANS(vmfgt_vf, opfvf_cmp_check)
 GEN_OPFVF_TRANS(vmfge_vf, opfvf_cmp_check)
 
 /* Vector Floating-Point Classify Instruction */
-GEN_OPFV_TRANS(vfclass_v, opfv_check)
+GEN_OPFV_TRANS(vfclass_v, opfv_check, RISCV_FRM_DYN)
 
 /* Vector Floating-Point Merge Instruction */
 GEN_OPFVF_TRANS(vfmerge_vfm,  opfvf_check)
@@ -2496,10 +2502,24 @@ static bool trans_vfmv_v_f(DisasContext *s, arg_vfmv_v_f *a)
 }
 
 /* Single-Width Floating-Point/Integer Type-Convert Instructions */
-GEN_OPFV_TRANS(vfcvt_xu_f_v, opfv_check)
-GEN_OPFV_TRANS(vfcvt_x_f_v, opfv_check)
-GEN_OPFV_TRANS(vfcvt_f_xu_v, opfv_check)
-GEN_OPFV_TRANS(vfcvt_f_x_v, opfv_check)
+#define GEN_OPFV_CVT_TRANS(NAME, HELPER, FRM)               \
+static bool trans_##NAME(DisasContext *s, arg_rmr *a)       \
+{                                                           \
+    static gen_helper_gvec_3_ptr * const fns[3] = {         \
+        gen_helper_##HELPER##_h,                            \
+        gen_helper_##HELPER##_w,                            \
+        gen_helper_##HELPER##_d                             \
+    };                                                      \
+    return do_opfv(s, a, fns[s->sew - 1], opfv_check, FRM); \
+}
+
+GEN_OPFV_CVT_TRANS(vfcvt_xu_f_v, vfcvt_xu_f_v, RISCV_FRM_DYN)
+GEN_OPFV_CVT_TRANS(vfcvt_x_f_v, vfcvt_x_f_v, RISCV_FRM_DYN)
+GEN_OPFV_CVT_TRANS(vfcvt_f_xu_v, vfcvt_f_xu_v, RISCV_FRM_DYN)
+GEN_OPFV_CVT_TRANS(vfcvt_f_x_v, vfcvt_f_x_v, RISCV_FRM_DYN)
+/* Reuse the helper functions from vfcvt.xu.f.v and vfcvt.x.f.v */
+GEN_OPFV_CVT_TRANS(vfcvt_rtz_xu_f_v, vfcvt_xu_f_v, RISCV_FRM_RTZ)
+GEN_OPFV_CVT_TRANS(vfcvt_rtz_x_f_v, vfcvt_x_f_v, RISCV_FRM_RTZ)
 
 /* Widening Floating-Point/Integer Type-Convert Instructions */
 
-- 
2.25.1


