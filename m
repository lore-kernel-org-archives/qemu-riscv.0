Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mvamz-00042t-Fu
	for mharc-qemu-riscv@gnu.org; Fri, 10 Dec 2021 02:57:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvamp-0003lk-Pi
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 02:57:49 -0500
Received: from [2607:f8b0:4864:20::42b] (port=38635
 helo=mail-pf1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvamm-0006FC-6t
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 02:57:47 -0500
Received: by mail-pf1-x42b.google.com with SMTP id g18so7761441pfk.5
 for <qemu-riscv@nongnu.org>; Thu, 09 Dec 2021 23:57:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F/lLlcAkcUD+FzHTacqbBTldM1j172DoF8Jg8+uIBTI=;
 b=GqpgBPFoKt+AAGHxXW5lfjNSvR0JALFVg4k7sg7Bgud3iafWvsjZXTsqzNIJ+/nXWj
 wNU25TnwmGWjuNNZ6gjWX7hFdcyomf9LHBfTMAIac+7rUzc0vieXwYKYtTTy8UdSo2EJ
 bcKbO6TMX6RZ8FPF1H0Y1yEwJRbBpoaApEMcF5sfjawv89UpEOCtfJq1OrC5BTJ0gxy1
 ydmi8BV5r2gP2ToaxaAramAJyemK9vzFFMi3RiE8qQwP6yCR0FHJw5nr2NatY6IIDSYP
 vPJ82idWV+ht2jU66n1loKQtkFnYjwjSDaoSs5GZ+rXF34GwQqWMTmIosL8tX1XWlvHq
 CHbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F/lLlcAkcUD+FzHTacqbBTldM1j172DoF8Jg8+uIBTI=;
 b=NzC7oqRaUxdtMrVOT2q4Et5XqiBotgcG9asn48AkszdSYUzhVdeDKzMRxvJdcz+MvP
 lLdCu9e/ZrgM7vTcDN3fUwtaC5Hwbk/DBzEuAnVkbRXqaFx2jiCmelu/0e2+EcklrCxn
 /5xxgLhqcnPQPosjL8c4xmwh58mVARvnYaFfI/9db0oasernLTtNWbXSFXdIYwrpsIT1
 fplJyAYIzuQarmNAbaV4OAl4jsHarVCOdrVUEA2shL/nuodF7r7cCydfGDcEmlM0s9CS
 wom56cjUukHK4aprGKFG9xaQJfq+mswBz3P/bPaQXQAZvZOXGOs0AvCYXOQO9dHlombP
 xg3g==
X-Gm-Message-State: AOAM53054+gPmKkbyge364Rhc47Em7U19X1KVfCMcFLMRxERKb89MBoC
 TCbnQzRJ132j2k/YwReaNF0fbw==
X-Google-Smtp-Source: ABdhPJwaV16095rZ0Cvo9T2M237YSqWYZairelizt0RZ+0gVH4hFMiBkUWGnY6yalc+g0CYeLPNJSg==
X-Received: by 2002:a63:920b:: with SMTP id o11mr39735211pgd.314.1639123062872; 
 Thu, 09 Dec 2021 23:57:42 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id f4sm2087955pfg.34.2021.12.09.23.57.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 23:57:42 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v11 07/77] target/riscv: rvv-1.0: add translation-time vector
 context status
Date: Fri, 10 Dec 2021 15:55:53 +0800
Message-Id: <20211210075704.23951-8-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211210075704.23951-1-frank.chang@sifive.com>
References: <20211210075704.23951-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 10 Dec 2021 07:57:49 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h                      |  5 +-
 target/riscv/cpu_helper.c               |  3 +
 target/riscv/insn_trans/trans_rvv.c.inc | 75 +++++++++++++++++++++----
 target/riscv/translate.c                | 40 +++++++++++++
 4 files changed, 109 insertions(+), 14 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 48b8f61210..eee2a2b19e 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -410,10 +410,11 @@ FIELD(TB_FLAGS, VILL, 9, 1)
 /* Is a Hypervisor instruction load/store allowed? */
 FIELD(TB_FLAGS, HLSX, 10, 1)
 FIELD(TB_FLAGS, MSTATUS_HS_FS, 11, 2)
+FIELD(TB_FLAGS, MSTATUS_HS_VS, 13, 2)
 /* The combination of MXL/SXL/UXL that applies to the current cpu mode. */
-FIELD(TB_FLAGS, XL, 13, 2)
+FIELD(TB_FLAGS, XL, 15, 2)
 /* If PointerMasking should be applied */
-FIELD(TB_FLAGS, PM_ENABLED, 15, 1)
+FIELD(TB_FLAGS, PM_ENABLED, 17, 1)
 
 #ifdef TARGET_RISCV32
 #define riscv_cpu_mxl(env)  ((void)(env), MXL_RV32)
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 8803fe0b14..1b31d0ad47 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -111,6 +111,9 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
 
         flags = FIELD_DP32(flags, TB_FLAGS, MSTATUS_HS_FS,
                            get_field(env->mstatus_hs, MSTATUS_FS));
+
+        flags = FIELD_DP32(flags, TB_FLAGS, MSTATUS_HS_VS,
+                           get_field(env->mstatus_hs, MSTATUS_VS));
     }
     if (riscv_has_ext(env, RVJ)) {
         int priv = flags & TB_FLAGS_PRIV_MMU_MASK;
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 17ee3babef..bc1d4a5f23 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -39,6 +39,7 @@ static bool trans_vsetvl(DisasContext *ctx, arg_vsetvl *a)
     }
     gen_helper_vsetvl(dst, cpu_env, s1, s2);
     gen_set_gpr(ctx, a->rd, dst);
+    mark_vs_dirty(ctx);
 
     tcg_gen_movi_tl(cpu_pc, ctx->pc_succ_insn);
     tcg_gen_lookup_and_goto_ptr();
@@ -66,6 +67,7 @@ static bool trans_vsetvli(DisasContext *ctx, arg_vsetvli *a)
     }
     gen_helper_vsetvl(dst, cpu_env, s1, s2);
     gen_set_gpr(ctx, a->rd, dst);
+    mark_vs_dirty(ctx);
 
     gen_goto_tb(ctx, 0, ctx->pc_succ_insn);
     ctx->base.is_jmp = DISAS_NORETURN;
@@ -154,7 +156,8 @@ typedef void gen_helper_ldst_us(TCGv_ptr, TCGv_ptr, TCGv,
                                 TCGv_env, TCGv_i32);
 
 static bool ldst_us_trans(uint32_t vd, uint32_t rs1, uint32_t data,
-                          gen_helper_ldst_us *fn, DisasContext *s)
+                          gen_helper_ldst_us *fn, DisasContext *s,
+                          bool is_store)
 {
     TCGv_ptr dest, mask;
     TCGv base;
@@ -183,6 +186,11 @@ static bool ldst_us_trans(uint32_t vd, uint32_t rs1, uint32_t data,
 
     tcg_temp_free_ptr(dest);
     tcg_temp_free_ptr(mask);
+
+    if (!is_store) {
+        mark_vs_dirty(s);
+    }
+
     gen_set_label(over);
     return true;
 }
@@ -233,7 +241,7 @@ static bool ld_us_op(DisasContext *s, arg_r2nfvm *a, uint8_t seq)
     data = FIELD_DP32(data, VDATA, VM, a->vm);
     data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
     data = FIELD_DP32(data, VDATA, NF, a->nf);
-    return ldst_us_trans(a->rd, a->rs1, data, fn, s);
+    return ldst_us_trans(a->rd, a->rs1, data, fn, s, false);
 }
 
 static bool ld_us_check(DisasContext *s, arg_r2nfvm* a)
@@ -286,7 +294,7 @@ static bool st_us_op(DisasContext *s, arg_r2nfvm *a, uint8_t seq)
     data = FIELD_DP32(data, VDATA, VM, a->vm);
     data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
     data = FIELD_DP32(data, VDATA, NF, a->nf);
-    return ldst_us_trans(a->rd, a->rs1, data, fn, s);
+    return ldst_us_trans(a->rd, a->rs1, data, fn, s, true);
 }
 
 static bool st_us_check(DisasContext *s, arg_r2nfvm* a)
@@ -309,7 +317,7 @@ typedef void gen_helper_ldst_stride(TCGv_ptr, TCGv_ptr, TCGv,
 
 static bool ldst_stride_trans(uint32_t vd, uint32_t rs1, uint32_t rs2,
                               uint32_t data, gen_helper_ldst_stride *fn,
-                              DisasContext *s)
+                              DisasContext *s, bool is_store)
 {
     TCGv_ptr dest, mask;
     TCGv base, stride;
@@ -331,6 +339,11 @@ static bool ldst_stride_trans(uint32_t vd, uint32_t rs1, uint32_t rs2,
 
     tcg_temp_free_ptr(dest);
     tcg_temp_free_ptr(mask);
+
+    if (!is_store) {
+        mark_vs_dirty(s);
+    }
+
     gen_set_label(over);
     return true;
 }
@@ -365,7 +378,7 @@ static bool ld_stride_op(DisasContext *s, arg_rnfvm *a, uint8_t seq)
     data = FIELD_DP32(data, VDATA, VM, a->vm);
     data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
     data = FIELD_DP32(data, VDATA, NF, a->nf);
-    return ldst_stride_trans(a->rd, a->rs1, a->rs2, data, fn, s);
+    return ldst_stride_trans(a->rd, a->rs1, a->rs2, data, fn, s, false);
 }
 
 static bool ld_stride_check(DisasContext *s, arg_rnfvm* a)
@@ -409,7 +422,7 @@ static bool st_stride_op(DisasContext *s, arg_rnfvm *a, uint8_t seq)
         return false;
     }
 
-    return ldst_stride_trans(a->rd, a->rs1, a->rs2, data, fn, s);
+    return ldst_stride_trans(a->rd, a->rs1, a->rs2, data, fn, s, true);
 }
 
 static bool st_stride_check(DisasContext *s, arg_rnfvm* a)
@@ -432,7 +445,7 @@ typedef void gen_helper_ldst_index(TCGv_ptr, TCGv_ptr, TCGv,
 
 static bool ldst_index_trans(uint32_t vd, uint32_t rs1, uint32_t vs2,
                              uint32_t data, gen_helper_ldst_index *fn,
-                             DisasContext *s)
+                             DisasContext *s, bool is_store)
 {
     TCGv_ptr dest, mask, index;
     TCGv base;
@@ -456,6 +469,11 @@ static bool ldst_index_trans(uint32_t vd, uint32_t rs1, uint32_t vs2,
     tcg_temp_free_ptr(dest);
     tcg_temp_free_ptr(mask);
     tcg_temp_free_ptr(index);
+
+    if (!is_store) {
+        mark_vs_dirty(s);
+    }
+
     gen_set_label(over);
     return true;
 }
@@ -490,7 +508,7 @@ static bool ld_index_op(DisasContext *s, arg_rnfvm *a, uint8_t seq)
     data = FIELD_DP32(data, VDATA, VM, a->vm);
     data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
     data = FIELD_DP32(data, VDATA, NF, a->nf);
-    return ldst_index_trans(a->rd, a->rs1, a->rs2, data, fn, s);
+    return ldst_index_trans(a->rd, a->rs1, a->rs2, data, fn, s, false);
 }
 
 /*
@@ -542,7 +560,7 @@ static bool st_index_op(DisasContext *s, arg_rnfvm *a, uint8_t seq)
     data = FIELD_DP32(data, VDATA, VM, a->vm);
     data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
     data = FIELD_DP32(data, VDATA, NF, a->nf);
-    return ldst_index_trans(a->rd, a->rs1, a->rs2, data, fn, s);
+    return ldst_index_trans(a->rd, a->rs1, a->rs2, data, fn, s, true);
 }
 
 static bool st_index_check(DisasContext *s, arg_rnfvm* a)
@@ -583,6 +601,7 @@ static bool ldff_trans(uint32_t vd, uint32_t rs1, uint32_t data,
 
     tcg_temp_free_ptr(dest);
     tcg_temp_free_ptr(mask);
+    mark_vs_dirty(s);
     gen_set_label(over);
     return true;
 }
@@ -659,6 +678,7 @@ static bool amo_trans(uint32_t vd, uint32_t rs1, uint32_t vs2,
     tcg_temp_free_ptr(dest);
     tcg_temp_free_ptr(mask);
     tcg_temp_free_ptr(index);
+    mark_vs_dirty(s);
     gen_set_label(over);
     return true;
 }
@@ -810,6 +830,7 @@ do_opivv_gvec(DisasContext *s, arg_rmrr *a, GVecGen3Fn *gvec_fn,
                            vreg_ofs(s, a->rs1), vreg_ofs(s, a->rs2),
                            cpu_env, s->vlen / 8, s->vlen / 8, data, fn);
     }
+    mark_vs_dirty(s);
     gen_set_label(over);
     return true;
 }
@@ -861,6 +882,7 @@ static bool opivx_trans(uint32_t vd, uint32_t rs1, uint32_t vs2, uint32_t vm,
     tcg_temp_free_ptr(dest);
     tcg_temp_free_ptr(mask);
     tcg_temp_free_ptr(src2);
+    mark_vs_dirty(s);
     gen_set_label(over);
     return true;
 }
@@ -892,6 +914,7 @@ do_opivx_gvec(DisasContext *s, arg_rmrr *a, GVecGen2sFn *gvec_fn,
                 src1, MAXSZ(s), MAXSZ(s));
 
         tcg_temp_free_i64(src1);
+        mark_vs_dirty(s);
         return true;
     }
     return opivx_trans(a->rd, a->rs1, a->rs2, a->vm, fn, s);
@@ -1003,6 +1026,7 @@ static bool opivi_trans(uint32_t vd, uint32_t imm, uint32_t vs2, uint32_t vm,
     tcg_temp_free_ptr(dest);
     tcg_temp_free_ptr(mask);
     tcg_temp_free_ptr(src2);
+    mark_vs_dirty(s);
     gen_set_label(over);
     return true;
 }
@@ -1026,10 +1050,10 @@ do_opivi_gvec(DisasContext *s, arg_rmrr *a, GVecGen2iFn *gvec_fn,
             gvec_fn(s->sew, vreg_ofs(s, a->rd), vreg_ofs(s, a->rs2),
                     sextract64(a->rs1, 0, 5), MAXSZ(s), MAXSZ(s));
         }
-    } else {
-        return opivi_trans(a->rd, a->rs1, a->rs2, a->vm, fn, s, zx);
+        mark_vs_dirty(s);
+        return true;
     }
-    return true;
+    return opivi_trans(a->rd, a->rs1, a->rs2, a->vm, fn, s, zx);
 }
 
 /* OPIVI with GVEC IR */
@@ -1089,6 +1113,7 @@ static bool do_opivv_widen(DisasContext *s, arg_rmrr *a,
                            vreg_ofs(s, a->rs2),
                            cpu_env, s->vlen / 8, s->vlen / 8,
                            data, fn);
+        mark_vs_dirty(s);
         gen_set_label(over);
         return true;
     }
@@ -1176,6 +1201,7 @@ static bool do_opiwv_widen(DisasContext *s, arg_rmrr *a,
                            vreg_ofs(s, a->rs1),
                            vreg_ofs(s, a->rs2),
                            cpu_env, s->vlen / 8, s->vlen / 8, data, fn);
+        mark_vs_dirty(s);
         gen_set_label(over);
         return true;
     }
@@ -1255,6 +1281,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
                            vreg_ofs(s, a->rs2), cpu_env,           \
                            s->vlen / 8, s->vlen / 8, data,         \
                            fns[s->sew]);                           \
+        mark_vs_dirty(s);                                          \
         gen_set_label(over);                                       \
         return true;                                               \
     }                                                              \
@@ -1383,6 +1410,7 @@ do_opivx_gvec_shift(DisasContext *s, arg_rmrr *a, GVecGen2sFn32 *gvec_fn,
                 src1, MAXSZ(s), MAXSZ(s));
 
         tcg_temp_free_i32(src1);
+        mark_vs_dirty(s);
         return true;
     }
     return opivx_trans(a->rd, a->rs1, a->rs2, a->vm, fn, s);
@@ -1442,6 +1470,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
                            vreg_ofs(s, a->rs2), cpu_env,           \
                            s->vlen / 8, s->vlen / 8, data,         \
                            fns[s->sew]);                           \
+        mark_vs_dirty(s);                                          \
         gen_set_label(over);                                       \
         return true;                                               \
     }                                                              \
@@ -1626,6 +1655,7 @@ static bool trans_vmv_v_v(DisasContext *s, arg_vmv_v_v *a)
                                fns[s->sew]);
             gen_set_label(over);
         }
+        mark_vs_dirty(s);
         return true;
     }
     return false;
@@ -1665,6 +1695,7 @@ static bool trans_vmv_v_x(DisasContext *s, arg_vmv_v_x *a)
             tcg_temp_free_i64(s1_i64);
         }
 
+        mark_vs_dirty(s);
         gen_set_label(over);
         return true;
     }
@@ -1680,6 +1711,7 @@ static bool trans_vmv_v_i(DisasContext *s, arg_vmv_v_i *a)
         if (s->vl_eq_vlmax) {
             tcg_gen_gvec_dup_imm(s->sew, vreg_ofs(s, a->rd),
                                  MAXSZ(s), MAXSZ(s), simm);
+            mark_vs_dirty(s);
         } else {
             TCGv_i32 desc;
             TCGv_i64 s1;
@@ -1699,6 +1731,7 @@ static bool trans_vmv_v_i(DisasContext *s, arg_vmv_v_i *a)
             fns[s->sew](dest, s1, cpu_env, desc);
 
             tcg_temp_free_ptr(dest);
+            mark_vs_dirty(s);
             gen_set_label(over);
         }
         return true;
@@ -1804,6 +1837,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
                            vreg_ofs(s, a->rs2), cpu_env,           \
                            s->vlen / 8, s->vlen / 8, data,         \
                            fns[s->sew - 1]);                       \
+        mark_vs_dirty(s);                                          \
         gen_set_label(over);                                       \
         return true;                                               \
     }                                                              \
@@ -1838,6 +1872,7 @@ static bool opfvf_trans(uint32_t vd, uint32_t rs1, uint32_t vs2,
     tcg_temp_free_ptr(dest);
     tcg_temp_free_ptr(mask);
     tcg_temp_free_ptr(src2);
+    mark_vs_dirty(s);
     gen_set_label(over);
     return true;
 }
@@ -1916,6 +1951,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)           \
                            vreg_ofs(s, a->rs2), cpu_env,         \
                            s->vlen / 8, s->vlen / 8, data,       \
                            fns[s->sew - 1]);                     \
+        mark_vs_dirty(s);                                        \
         gen_set_label(over);                                     \
         return true;                                             \
     }                                                            \
@@ -1991,6 +2027,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
                            vreg_ofs(s, a->rs2), cpu_env,           \
                            s->vlen / 8, s->vlen / 8, data,         \
                            fns[s->sew - 1]);                       \
+        mark_vs_dirty(s);                                          \
         gen_set_label(over);                                       \
         return true;                                               \
     }                                                              \
@@ -2106,6 +2143,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
                            vreg_ofs(s, a->rs2), cpu_env,           \
                            s->vlen / 8, s->vlen / 8, data,         \
                            fns[s->sew - 1]);                       \
+        mark_vs_dirty(s);                                          \
         gen_set_label(over);                                       \
         return true;                                               \
     }                                                              \
@@ -2178,6 +2216,7 @@ static bool trans_vfmv_v_f(DisasContext *s, arg_vfmv_v_f *a)
         if (s->vl_eq_vlmax) {
             tcg_gen_gvec_dup_i64(s->sew, vreg_ofs(s, a->rd),
                                  MAXSZ(s), MAXSZ(s), cpu_fpr[a->rs1]);
+            mark_vs_dirty(s);
         } else {
             TCGv_ptr dest;
             TCGv_i32 desc;
@@ -2196,6 +2235,7 @@ static bool trans_vfmv_v_f(DisasContext *s, arg_vfmv_v_f *a)
             fns[s->sew - 1](dest, cpu_fpr[a->rs1], cpu_env, desc);
 
             tcg_temp_free_ptr(dest);
+            mark_vs_dirty(s);
             gen_set_label(over);
         }
         return true;
@@ -2246,6 +2286,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
                            vreg_ofs(s, a->rs2), cpu_env,           \
                            s->vlen / 8, s->vlen / 8, data,         \
                            fns[s->sew - 1]);                       \
+        mark_vs_dirty(s);                                          \
         gen_set_label(over);                                       \
         return true;                                               \
     }                                                              \
@@ -2295,6 +2336,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
                            vreg_ofs(s, a->rs2), cpu_env,           \
                            s->vlen / 8, s->vlen / 8, data,         \
                            fns[s->sew - 1]);                       \
+        mark_vs_dirty(s);                                          \
         gen_set_label(over);                                       \
         return true;                                               \
     }                                                              \
@@ -2357,6 +2399,7 @@ static bool trans_##NAME(DisasContext *s, arg_r *a)                \
                            vreg_ofs(s, a->rs1),                    \
                            vreg_ofs(s, a->rs2), cpu_env,           \
                            s->vlen / 8, s->vlen / 8, data, fn);    \
+        mark_vs_dirty(s);                                          \
         gen_set_label(over);                                       \
         return true;                                               \
     }                                                              \
@@ -2451,6 +2494,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
                            vreg_ofs(s, 0), vreg_ofs(s, a->rs2),    \
                            cpu_env, s->vlen / 8, s->vlen / 8,      \
                            data, fn);                              \
+        mark_vs_dirty(s);                                          \
         gen_set_label(over);                                       \
         return true;                                               \
     }                                                              \
@@ -2482,6 +2526,7 @@ static bool trans_viota_m(DisasContext *s, arg_viota_m *a)
         tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
                            vreg_ofs(s, a->rs2), cpu_env,
                            s->vlen / 8, s->vlen / 8, data, fns[s->sew]);
+        mark_vs_dirty(s);
         gen_set_label(over);
         return true;
     }
@@ -2508,6 +2553,7 @@ static bool trans_vid_v(DisasContext *s, arg_vid_v *a)
         tcg_gen_gvec_2_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
                            cpu_env, s->vlen / 8, s->vlen / 8,
                            data, fns[s->sew]);
+        mark_vs_dirty(s);
         gen_set_label(over);
         return true;
     }
@@ -2681,6 +2727,7 @@ static bool trans_vmv_s_x(DisasContext *s, arg_vmv_s_x *a)
         tcg_gen_extu_tl_i64(t1, cpu_gpr[a->rs1]);
         vec_element_storei(s, a->rd, 0, t1);
         tcg_temp_free_i64(t1);
+        mark_vs_dirty(s);
     done:
         gen_set_label(over);
         return true;
@@ -2731,6 +2778,7 @@ static bool trans_vfmv_s_f(DisasContext *s, arg_vfmv_s_f *a)
         }
         vec_element_storei(s, a->rd, 0, t1);
         tcg_temp_free_i64(t1);
+        mark_vs_dirty(s);
         gen_set_label(over);
         return true;
     }
@@ -2797,6 +2845,7 @@ static bool trans_vrgather_vx(DisasContext *s, arg_rmrr *a)
         tcg_gen_gvec_dup_i64(s->sew, vreg_ofs(s, a->rd),
                              MAXSZ(s), MAXSZ(s), dest);
         tcg_temp_free_i64(dest);
+        mark_vs_dirty(s);
     } else {
         static gen_helper_opivx * const fns[4] = {
             gen_helper_vrgather_vx_b, gen_helper_vrgather_vx_h,
@@ -2823,6 +2872,7 @@ static bool trans_vrgather_vi(DisasContext *s, arg_rmrr *a)
                                  endian_ofs(s, a->rs2, a->rs1),
                                  MAXSZ(s), MAXSZ(s));
         }
+        mark_vs_dirty(s);
     } else {
         static gen_helper_opivx * const fns[4] = {
             gen_helper_vrgather_vx_b, gen_helper_vrgather_vx_h,
@@ -2860,6 +2910,7 @@ static bool trans_vcompress_vm(DisasContext *s, arg_r *a)
                            vreg_ofs(s, a->rs1), vreg_ofs(s, a->rs2),
                            cpu_env, s->vlen / 8, s->vlen / 8, data,
                            fns[s->sew]);
+        mark_vs_dirty(s);
         gen_set_label(over);
         return true;
     }
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index d445954dc7..8051090d2f 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -62,7 +62,9 @@ typedef struct DisasContext {
     uint32_t misa_ext;
     uint32_t opcode;
     uint32_t mstatus_fs;
+    uint32_t mstatus_vs;
     uint32_t mstatus_hs_fs;
+    uint32_t mstatus_hs_vs;
     uint32_t mem_idx;
     /* Remember the rounding mode encoded in the previous fp instruction,
        which we have already installed into env->fp_status.  Or -1 for
@@ -348,6 +350,42 @@ static void mark_fs_dirty(DisasContext *ctx)
 static inline void mark_fs_dirty(DisasContext *ctx) { }
 #endif
 
+#ifndef CONFIG_USER_ONLY
+/* The states of mstatus_vs are:
+ * 0 = disabled, 1 = initial, 2 = clean, 3 = dirty
+ * We will have already diagnosed disabled state,
+ * and need to turn initial/clean into dirty.
+ */
+static void mark_vs_dirty(DisasContext *ctx)
+{
+    TCGv tmp;
+
+    if (ctx->mstatus_vs != MSTATUS_VS) {
+        /* Remember the state change for the rest of the TB.  */
+        ctx->mstatus_vs = MSTATUS_VS;
+
+        tmp = tcg_temp_new();
+        tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
+        tcg_gen_ori_tl(tmp, tmp, MSTATUS_VS);
+        tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
+        tcg_temp_free(tmp);
+    }
+
+    if (ctx->virt_enabled && ctx->mstatus_hs_vs != MSTATUS_VS) {
+        /* Remember the stage change for the rest of the TB. */
+        ctx->mstatus_hs_vs = MSTATUS_VS;
+
+        tmp = tcg_temp_new();
+        tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus_hs));
+        tcg_gen_ori_tl(tmp, tmp, MSTATUS_VS);
+        tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus_hs));
+        tcg_temp_free(tmp);
+    }
+}
+#else
+static inline void mark_vs_dirty(DisasContext *ctx) { }
+#endif
+
 static void gen_set_rm(DisasContext *ctx, int rm)
 {
     if (ctx->frm == rm) {
@@ -631,6 +669,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->pc_succ_insn = ctx->base.pc_first;
     ctx->mem_idx = FIELD_EX32(tb_flags, TB_FLAGS, MEM_IDX);
     ctx->mstatus_fs = tb_flags & TB_FLAGS_MSTATUS_FS;
+    ctx->mstatus_vs = tb_flags & TB_FLAGS_MSTATUS_VS;
     ctx->priv_ver = env->priv_ver;
 #if !defined(CONFIG_USER_ONLY)
     if (riscv_has_ext(env, RVH)) {
@@ -648,6 +687,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->ext_zfhmin = cpu->cfg.ext_zfhmin;
     ctx->vlen = cpu->cfg.vlen;
     ctx->mstatus_hs_fs = FIELD_EX32(tb_flags, TB_FLAGS, MSTATUS_HS_FS);
+    ctx->mstatus_hs_vs = FIELD_EX32(tb_flags, TB_FLAGS, MSTATUS_HS_VS);
     ctx->hlsx = FIELD_EX32(tb_flags, TB_FLAGS, HLSX);
     ctx->vill = FIELD_EX32(tb_flags, TB_FLAGS, VILL);
     ctx->sew = FIELD_EX32(tb_flags, TB_FLAGS, SEW);
-- 
2.31.1


