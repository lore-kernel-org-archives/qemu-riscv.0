Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mrWyJ-00014H-GJ
	for mharc-qemu-riscv@gnu.org; Sun, 28 Nov 2021 22:04:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrWyG-0000zB-0g
 for qemu-riscv@nongnu.org; Sun, 28 Nov 2021 22:04:49 -0500
Received: from [2607:f8b0:4864:20::102e] (port=44841
 helo=mail-pj1-x102e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrWyB-0008SL-Ka
 for qemu-riscv@nongnu.org; Sun, 28 Nov 2021 22:04:47 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 o6-20020a17090a0a0600b001a64b9a11aeso12815147pjo.3
 for <qemu-riscv@nongnu.org>; Sun, 28 Nov 2021 19:04:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Glh1hx+LWboWPHouTnw48cNmiBED0LiwcN3sXLSn35o=;
 b=ZNZv/F/KHXkAcMIpT1Goj3kSHn0URQyT1UFCZ/Ef8GRyyABsMOqNpWZ/lZY0aq9nlH
 OCzCqu9WZpIojkazKFmTTrdtUiBFqFcWwvBWDQ7tpiOm+j5OxfeHEqeo8itZKz7fPiZD
 IUYXwnPJwWKnbnlHwZB2Ab/s6HrB7ZgMSOfQWFMl0N6kXZzo26PiyjtFj8g4sH+Id49n
 FcvQ3q8CVbQ224qAbI980Ef7x+m6lhKd01MClysR+eiZzFizfyWwTcVEm9zqFcAAm5CF
 E7ZV9dP3zqsUFYQYASFgA6i5zIJd9RTyunL9M8bmeMQ6ccfwBFi0edDDdc5d2bqeGSSy
 GKbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Glh1hx+LWboWPHouTnw48cNmiBED0LiwcN3sXLSn35o=;
 b=JtaUKZwrZ4kcIriiE+lSJm/GmIcQMt0oKARBnerstSx28q0SuH1qarwVB+uyGWj7b0
 mBkKArV74i3iGzniq+PgDWcteV8jMmGKBtI8nMqZmvw4fhmBk/tm4DJRtXfCLUUgPFfR
 H6Q9thAnvgE1GO2Cc8OcapPp+xnvzsEASMJ1h+UduZzezKTpoyGDa1YFfOYPBm8mFvSo
 XvZwz5hhhVE64+QraVLHRs0c8PPyZOyEShs6Go/PR8sOZjVj+GgAuCbNgZaN/2fumTzQ
 WuP+oVFmPec8LPMQ5M4chxny6PftgWLxwhg9eLU+nAg4OurQ5rDNl7v1AezZ0OukeN7z
 djVA==
X-Gm-Message-State: AOAM533+A+5jrUdks9eqeTHV6O6gy/6kHVZsXdvPqrAkp+3EYaeb5w85
 oCgaZEvr1zYgbJxaLGMTkUFuAw==
X-Google-Smtp-Source: ABdhPJyalrmIsaOevzCpxN97RCpBzjm1vFSctSkBOCreu1u0eILo7+Gk0cEJdvJNbWlRkNhmPNbqkQ==
X-Received: by 2002:a17:90a:df8d:: with SMTP id
 p13mr34931048pjv.197.1638155077834; 
 Sun, 28 Nov 2021 19:04:37 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id oj11sm17904040pjb.46.2021.11.28.19.04.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 19:04:37 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v10 12/77] target/riscv: rvv-1.0: remove MLEN calculations
Date: Mon, 29 Nov 2021 11:02:32 +0800
Message-Id: <20211129030340.429689-13-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129030340.429689-1-frank.chang@sifive.com>
References: <20211129030340.429689-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 29 Nov 2021 03:04:50 -0000

From: Frank Chang <frank.chang@sifive.com>

As in RVV 1.0 design, MLEN is hardcoded with value 1 (Section 4.5).
Thus, remove all MLEN related calculations.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc |  35 +---
 target/riscv/internals.h                |   9 +-
 target/riscv/translate.c                |   2 -
 target/riscv/vector_helper.c            | 252 ++++++++++--------------
 4 files changed, 111 insertions(+), 187 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index bc1d4a5f235..ecd4b89c6b1 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -237,7 +237,6 @@ static bool ld_us_op(DisasContext *s, arg_r2nfvm *a, uint8_t seq)
         return false;
     }
 
-    data = FIELD_DP32(data, VDATA, MLEN, s->mlen);
     data = FIELD_DP32(data, VDATA, VM, a->vm);
     data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
     data = FIELD_DP32(data, VDATA, NF, a->nf);
@@ -290,7 +289,6 @@ static bool st_us_op(DisasContext *s, arg_r2nfvm *a, uint8_t seq)
         return false;
     }
 
-    data = FIELD_DP32(data, VDATA, MLEN, s->mlen);
     data = FIELD_DP32(data, VDATA, VM, a->vm);
     data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
     data = FIELD_DP32(data, VDATA, NF, a->nf);
@@ -374,7 +372,6 @@ static bool ld_stride_op(DisasContext *s, arg_rnfvm *a, uint8_t seq)
         return false;
     }
 
-    data = FIELD_DP32(data, VDATA, MLEN, s->mlen);
     data = FIELD_DP32(data, VDATA, VM, a->vm);
     data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
     data = FIELD_DP32(data, VDATA, NF, a->nf);
@@ -413,7 +410,6 @@ static bool st_stride_op(DisasContext *s, arg_rnfvm *a, uint8_t seq)
           gen_helper_vsse_v_w,  gen_helper_vsse_v_d }
     };
 
-    data = FIELD_DP32(data, VDATA, MLEN, s->mlen);
     data = FIELD_DP32(data, VDATA, VM, a->vm);
     data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
     data = FIELD_DP32(data, VDATA, NF, a->nf);
@@ -504,7 +500,6 @@ static bool ld_index_op(DisasContext *s, arg_rnfvm *a, uint8_t seq)
         return false;
     }
 
-    data = FIELD_DP32(data, VDATA, MLEN, s->mlen);
     data = FIELD_DP32(data, VDATA, VM, a->vm);
     data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
     data = FIELD_DP32(data, VDATA, NF, a->nf);
@@ -556,7 +551,6 @@ static bool st_index_op(DisasContext *s, arg_rnfvm *a, uint8_t seq)
         return false;
     }
 
-    data = FIELD_DP32(data, VDATA, MLEN, s->mlen);
     data = FIELD_DP32(data, VDATA, VM, a->vm);
     data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
     data = FIELD_DP32(data, VDATA, NF, a->nf);
@@ -632,7 +626,6 @@ static bool ldff_op(DisasContext *s, arg_r2nfvm *a, uint8_t seq)
         return false;
     }
 
-    data = FIELD_DP32(data, VDATA, MLEN, s->mlen);
     data = FIELD_DP32(data, VDATA, VM, a->vm);
     data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
     data = FIELD_DP32(data, VDATA, NF, a->nf);
@@ -740,7 +733,6 @@ static bool amo_op(DisasContext *s, arg_rwdvm *a, uint8_t seq)
         g_assert_not_reached();
     }
 
-    data = FIELD_DP32(data, VDATA, MLEN, s->mlen);
     data = FIELD_DP32(data, VDATA, VM, a->vm);
     data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
     data = FIELD_DP32(data, VDATA, WD, a->wd);
@@ -823,7 +815,6 @@ do_opivv_gvec(DisasContext *s, arg_rmrr *a, GVecGen3Fn *gvec_fn,
     } else {
         uint32_t data = 0;
 
-        data = FIELD_DP32(data, VDATA, MLEN, s->mlen);
         data = FIELD_DP32(data, VDATA, VM, a->vm);
         data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
@@ -868,7 +859,6 @@ static bool opivx_trans(uint32_t vd, uint32_t rs1, uint32_t vs2, uint32_t vm,
     src2 = tcg_temp_new_ptr();
     src1 = get_gpr(s, rs1, EXT_NONE);
 
-    data = FIELD_DP32(data, VDATA, MLEN, s->mlen);
     data = FIELD_DP32(data, VDATA, VM, vm);
     data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
     desc = tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
@@ -1012,7 +1002,6 @@ static bool opivi_trans(uint32_t vd, uint32_t imm, uint32_t vs2, uint32_t vm,
     } else {
         src1 = tcg_constant_tl(sextract64(imm, 0, 5));
     }
-    data = FIELD_DP32(data, VDATA, MLEN, s->mlen);
     data = FIELD_DP32(data, VDATA, VM, vm);
     data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
     desc = tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
@@ -1105,7 +1094,6 @@ static bool do_opivv_widen(DisasContext *s, arg_rmrr *a,
         TCGLabel *over = gen_new_label();
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
 
-        data = FIELD_DP32(data, VDATA, MLEN, s->mlen);
         data = FIELD_DP32(data, VDATA, VM, a->vm);
         data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
@@ -1194,7 +1182,6 @@ static bool do_opiwv_widen(DisasContext *s, arg_rmrr *a,
         TCGLabel *over = gen_new_label();
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
 
-        data = FIELD_DP32(data, VDATA, MLEN, s->mlen);
         data = FIELD_DP32(data, VDATA, VM, a->vm);
         data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
@@ -1273,7 +1260,6 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
         TCGLabel *over = gen_new_label();                          \
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
                                                                    \
-        data = FIELD_DP32(data, VDATA, MLEN, s->mlen);             \
         data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
         data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
@@ -1462,7 +1448,6 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
         TCGLabel *over = gen_new_label();                          \
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
                                                                    \
-        data = FIELD_DP32(data, VDATA, MLEN, s->mlen);             \
         data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
         data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
@@ -1829,7 +1814,6 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
         gen_set_rm(s, 7);                                          \
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
                                                                    \
-        data = FIELD_DP32(data, VDATA, MLEN, s->mlen);             \
         data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
         data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
@@ -1902,7 +1886,6 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)            \
             gen_helper_##NAME##_d,                                \
         };                                                        \
         gen_set_rm(s, 7);                                         \
-        data = FIELD_DP32(data, VDATA, MLEN, s->mlen);            \
         data = FIELD_DP32(data, VDATA, VM, a->vm);                \
         data = FIELD_DP32(data, VDATA, LMUL, s->lmul);            \
         return opfvf_trans(a->rd, a->rs1, a->rs2, data,           \
@@ -1943,7 +1926,6 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)           \
         gen_set_rm(s, 7);                                        \
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);        \
                                                                  \
-        data = FIELD_DP32(data, VDATA, MLEN, s->mlen);           \
         data = FIELD_DP32(data, VDATA, VM, a->vm);               \
         data = FIELD_DP32(data, VDATA, LMUL, s->lmul);           \
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),   \
@@ -1982,7 +1964,6 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)           \
             gen_helper_##NAME##_h, gen_helper_##NAME##_w,        \
         };                                                       \
         gen_set_rm(s, 7);                                        \
-        data = FIELD_DP32(data, VDATA, MLEN, s->mlen);           \
         data = FIELD_DP32(data, VDATA, VM, a->vm);               \
         data = FIELD_DP32(data, VDATA, LMUL, s->lmul);           \
         return opfvf_trans(a->rd, a->rs1, a->rs2, data,          \
@@ -2019,7 +2000,6 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
         gen_set_rm(s, 7);                                          \
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
                                                                    \
-        data = FIELD_DP32(data, VDATA, MLEN, s->mlen);             \
         data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
         data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
@@ -2056,7 +2036,6 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)           \
             gen_helper_##NAME##_h, gen_helper_##NAME##_w,        \
         };                                                       \
         gen_set_rm(s, 7);                                        \
-        data = FIELD_DP32(data, VDATA, MLEN, s->mlen);           \
         data = FIELD_DP32(data, VDATA, VM, a->vm);               \
         data = FIELD_DP32(data, VDATA, LMUL, s->lmul);           \
         return opfvf_trans(a->rd, a->rs1, a->rs2, data,          \
@@ -2136,7 +2115,6 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
         gen_set_rm(s, 7);                                          \
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
                                                                    \
-        data = FIELD_DP32(data, VDATA, MLEN, s->mlen);             \
         data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
         data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
         tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
@@ -2279,7 +2257,6 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
         gen_set_rm(s, 7);                                          \
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
                                                                    \
-        data = FIELD_DP32(data, VDATA, MLEN, s->mlen);             \
         data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
         data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
         tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
@@ -2329,7 +2306,6 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
         gen_set_rm(s, 7);                                          \
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
                                                                    \
-        data = FIELD_DP32(data, VDATA, MLEN, s->mlen);             \
         data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
         data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
         tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
@@ -2393,7 +2369,6 @@ static bool trans_##NAME(DisasContext *s, arg_r *a)                \
         TCGLabel *over = gen_new_label();                          \
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
                                                                    \
-        data = FIELD_DP32(data, VDATA, MLEN, s->mlen);             \
         data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
                            vreg_ofs(s, a->rs1),                    \
@@ -2423,7 +2398,6 @@ static bool trans_vmpopc_m(DisasContext *s, arg_rmr *a)
         TCGv dst;
         TCGv_i32 desc;
         uint32_t data = 0;
-        data = FIELD_DP32(data, VDATA, MLEN, s->mlen);
         data = FIELD_DP32(data, VDATA, VM, a->vm);
         data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
 
@@ -2453,7 +2427,6 @@ static bool trans_vmfirst_m(DisasContext *s, arg_rmr *a)
         TCGv dst;
         TCGv_i32 desc;
         uint32_t data = 0;
-        data = FIELD_DP32(data, VDATA, MLEN, s->mlen);
         data = FIELD_DP32(data, VDATA, VM, a->vm);
         data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
 
@@ -2487,7 +2460,6 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
         TCGLabel *over = gen_new_label();                          \
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
                                                                    \
-        data = FIELD_DP32(data, VDATA, MLEN, s->mlen);             \
         data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
         data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
         tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd),                     \
@@ -2516,7 +2488,6 @@ static bool trans_viota_m(DisasContext *s, arg_viota_m *a)
         TCGLabel *over = gen_new_label();
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
 
-        data = FIELD_DP32(data, VDATA, MLEN, s->mlen);
         data = FIELD_DP32(data, VDATA, VM, a->vm);
         data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
         static gen_helper_gvec_3_ptr * const fns[4] = {
@@ -2543,7 +2514,6 @@ static bool trans_vid_v(DisasContext *s, arg_vid_v *a)
         TCGLabel *over = gen_new_label();
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
 
-        data = FIELD_DP32(data, VDATA, MLEN, s->mlen);
         data = FIELD_DP32(data, VDATA, VM, a->vm);
         data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
         static gen_helper_gvec_2_ptr * const fns[4] = {
@@ -2833,7 +2803,7 @@ static bool trans_vrgather_vx(DisasContext *s, arg_rmrr *a)
     }
 
     if (a->vm && s->vl_eq_vlmax) {
-        int vlmax = s->vlen / s->mlen;
+        int vlmax = s->vlen;
         TCGv_i64 dest = tcg_temp_new_i64();
 
         if (a->rs1 == 0) {
@@ -2864,7 +2834,7 @@ static bool trans_vrgather_vi(DisasContext *s, arg_rmrr *a)
     }
 
     if (a->vm && s->vl_eq_vlmax) {
-        if (a->rs1 >= s->vlen / s->mlen) {
+        if (a->rs1 >= s->vlen) {
             tcg_gen_gvec_dup_imm(SEW64, vreg_ofs(s, a->rd),
                                  MAXSZ(s), MAXSZ(s), 0);
         } else {
@@ -2904,7 +2874,6 @@ static bool trans_vcompress_vm(DisasContext *s, arg_r *a)
         TCGLabel *over = gen_new_label();
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
 
-        data = FIELD_DP32(data, VDATA, MLEN, s->mlen);
         data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
                            vreg_ofs(s, a->rs1), vreg_ofs(s, a->rs2),
diff --git a/target/riscv/internals.h b/target/riscv/internals.h
index bce91da11a4..81f5dfa477a 100644
--- a/target/riscv/internals.h
+++ b/target/riscv/internals.h
@@ -22,11 +22,10 @@
 #include "hw/registerfields.h"
 
 /* share data between vector helpers and decode code */
-FIELD(VDATA, MLEN, 0, 8)
-FIELD(VDATA, VM, 8, 1)
-FIELD(VDATA, LMUL, 9, 2)
-FIELD(VDATA, NF, 11, 4)
-FIELD(VDATA, WD, 11, 1)
+FIELD(VDATA, VM, 0, 1)
+FIELD(VDATA, LMUL, 1, 3)
+FIELD(VDATA, NF, 4, 4)
+FIELD(VDATA, WD, 4, 1)
 
 /* float point classify helpers */
 target_ulong fclass_h(uint64_t frs1);
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 8051090d2f4..17101d854bf 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -83,7 +83,6 @@ typedef struct DisasContext {
     uint8_t lmul;
     uint8_t sew;
     uint16_t vlen;
-    uint16_t mlen;
     bool vl_eq_vlmax;
     uint8_t ntemp;
     CPUState *cs;
@@ -692,7 +691,6 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->vill = FIELD_EX32(tb_flags, TB_FLAGS, VILL);
     ctx->sew = FIELD_EX32(tb_flags, TB_FLAGS, SEW);
     ctx->lmul = FIELD_EX32(tb_flags, TB_FLAGS, LMUL);
-    ctx->mlen = 1 << (ctx->sew  + 3 - ctx->lmul);
     ctx->vl_eq_vlmax = FIELD_EX32(tb_flags, TB_FLAGS, VL_EQ_VLMAX);
     ctx->xl = FIELD_EX32(tb_flags, TB_FLAGS, XL);
     ctx->cs = cs;
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 70f589813ed..ac6c7298bc0 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -81,11 +81,6 @@ static inline uint32_t vext_nf(uint32_t desc)
     return FIELD_EX32(simd_data(desc), VDATA, NF);
 }
 
-static inline uint32_t vext_mlen(uint32_t desc)
-{
-    return FIELD_EX32(simd_data(desc), VDATA, MLEN);
-}
-
 static inline uint32_t vext_vm(uint32_t desc)
 {
     return FIELD_EX32(simd_data(desc), VDATA, VM);
@@ -188,19 +183,24 @@ static void clearq(void *vd, uint32_t idx, uint32_t cnt, uint32_t tot)
     vext_clear(cur, cnt, tot);
 }
 
-static inline void vext_set_elem_mask(void *v0, int mlen, int index,
-        uint8_t value)
+static inline void vext_set_elem_mask(void *v0, int index,
+                                      uint8_t value)
 {
-    int idx = (index * mlen) / 64;
-    int pos = (index * mlen) % 64;
+    int idx = index / 64;
+    int pos = index % 64;
     uint64_t old = ((uint64_t *)v0)[idx];
-    ((uint64_t *)v0)[idx] = deposit64(old, pos, mlen, value);
+    ((uint64_t *)v0)[idx] = deposit64(old, pos, 1, value);
 }
 
-static inline int vext_elem_mask(void *v0, int mlen, int index)
+/*
+ * Earlier designs (pre-0.9) had a varying number of bits
+ * per mask value (MLEN). In the 0.9 design, MLEN=1.
+ * (Section 4.5)
+ */
+static inline int vext_elem_mask(void *v0, int index)
 {
-    int idx = (index * mlen) / 64;
-    int pos = (index * mlen) % 64;
+    int idx = index / 64;
+    int pos = index  % 64;
     return (((uint64_t *)v0)[idx] >> pos) & 1;
 }
 
@@ -277,12 +277,11 @@ vext_ldst_stride(void *vd, void *v0, target_ulong base,
 {
     uint32_t i, k;
     uint32_t nf = vext_nf(desc);
-    uint32_t mlen = vext_mlen(desc);
     uint32_t vlmax = vext_maxsz(desc) / esz;
 
     /* probe every access*/
     for (i = 0; i < env->vl; i++) {
-        if (!vm && !vext_elem_mask(v0, mlen, i)) {
+        if (!vm && !vext_elem_mask(v0, i)) {
             continue;
         }
         probe_pages(env, base + stride * i, nf * msz, ra, access_type);
@@ -290,7 +289,7 @@ vext_ldst_stride(void *vd, void *v0, target_ulong base,
     /* do real access */
     for (i = 0; i < env->vl; i++) {
         k = 0;
-        if (!vm && !vext_elem_mask(v0, mlen, i)) {
+        if (!vm && !vext_elem_mask(v0, i)) {
             continue;
         }
         while (k < nf) {
@@ -506,12 +505,11 @@ vext_ldst_index(void *vd, void *v0, target_ulong base,
     uint32_t i, k;
     uint32_t nf = vext_nf(desc);
     uint32_t vm = vext_vm(desc);
-    uint32_t mlen = vext_mlen(desc);
     uint32_t vlmax = vext_maxsz(desc) / esz;
 
     /* probe every access*/
     for (i = 0; i < env->vl; i++) {
-        if (!vm && !vext_elem_mask(v0, mlen, i)) {
+        if (!vm && !vext_elem_mask(v0, i)) {
             continue;
         }
         probe_pages(env, get_index_addr(base, i, vs2), nf * msz, ra,
@@ -520,7 +518,7 @@ vext_ldst_index(void *vd, void *v0, target_ulong base,
     /* load bytes from guest memory */
     for (i = 0; i < env->vl; i++) {
         k = 0;
-        if (!vm && !vext_elem_mask(v0, mlen, i)) {
+        if (!vm && !vext_elem_mask(v0, i)) {
             continue;
         }
         while (k < nf) {
@@ -604,7 +602,6 @@ vext_ldff(void *vd, void *v0, target_ulong base,
 {
     void *host;
     uint32_t i, k, vl = 0;
-    uint32_t mlen = vext_mlen(desc);
     uint32_t nf = vext_nf(desc);
     uint32_t vm = vext_vm(desc);
     uint32_t vlmax = vext_maxsz(desc) / esz;
@@ -612,7 +609,7 @@ vext_ldff(void *vd, void *v0, target_ulong base,
 
     /* probe every access*/
     for (i = 0; i < env->vl; i++) {
-        if (!vm && !vext_elem_mask(v0, mlen, i)) {
+        if (!vm && !vext_elem_mask(v0, i)) {
             continue;
         }
         addr = base + nf * i * msz;
@@ -653,7 +650,7 @@ ProbeSuccess:
     }
     for (i = 0; i < env->vl; i++) {
         k = 0;
-        if (!vm && !vext_elem_mask(v0, mlen, i)) {
+        if (!vm && !vext_elem_mask(v0, i)) {
             continue;
         }
         while (k < nf) {
@@ -782,18 +779,17 @@ vext_amo_noatomic(void *vs3, void *v0, target_ulong base,
     target_long addr;
     uint32_t wd = vext_wd(desc);
     uint32_t vm = vext_vm(desc);
-    uint32_t mlen = vext_mlen(desc);
     uint32_t vlmax = vext_maxsz(desc) / esz;
 
     for (i = 0; i < env->vl; i++) {
-        if (!vm && !vext_elem_mask(v0, mlen, i)) {
+        if (!vm && !vext_elem_mask(v0, i)) {
             continue;
         }
         probe_pages(env, get_index_addr(base, i, vs2), msz, ra, MMU_DATA_LOAD);
         probe_pages(env, get_index_addr(base, i, vs2), msz, ra, MMU_DATA_STORE);
     }
     for (i = 0; i < env->vl; i++) {
-        if (!vm && !vext_elem_mask(v0, mlen, i)) {
+        if (!vm && !vext_elem_mask(v0, i)) {
             continue;
         }
         addr = get_index_addr(base, i, vs2);
@@ -907,13 +903,12 @@ static void do_vext_vv(void *vd, void *v0, void *vs1, void *vs2,
                        opivv2_fn *fn, clear_fn *clearfn)
 {
     uint32_t vlmax = vext_maxsz(desc) / esz;
-    uint32_t mlen = vext_mlen(desc);
     uint32_t vm = vext_vm(desc);
     uint32_t vl = env->vl;
     uint32_t i;
 
     for (i = 0; i < vl; i++) {
-        if (!vm && !vext_elem_mask(v0, mlen, i)) {
+        if (!vm && !vext_elem_mask(v0, i)) {
             continue;
         }
         fn(vd, vs1, vs2, i);
@@ -972,13 +967,12 @@ static void do_vext_vx(void *vd, void *v0, target_long s1, void *vs2,
                        opivx2_fn fn, clear_fn *clearfn)
 {
     uint32_t vlmax = vext_maxsz(desc) / esz;
-    uint32_t mlen = vext_mlen(desc);
     uint32_t vm = vext_vm(desc);
     uint32_t vl = env->vl;
     uint32_t i;
 
     for (i = 0; i < vl; i++) {
-        if (!vm && !vext_elem_mask(v0, mlen, i)) {
+        if (!vm && !vext_elem_mask(v0, i)) {
             continue;
         }
         fn(vd, s1, vs2, i);
@@ -1168,7 +1162,6 @@ GEN_VEXT_VX(vwsub_wx_w, 4, 8, clearq)
 void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
                   CPURISCVState *env, uint32_t desc)          \
 {                                                             \
-    uint32_t mlen = vext_mlen(desc);                          \
     uint32_t vl = env->vl;                                    \
     uint32_t esz = sizeof(ETYPE);                             \
     uint32_t vlmax = vext_maxsz(desc) / esz;                  \
@@ -1177,7 +1170,7 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
     for (i = 0; i < vl; i++) {                                \
         ETYPE s1 = *((ETYPE *)vs1 + H(i));                    \
         ETYPE s2 = *((ETYPE *)vs2 + H(i));                    \
-        uint8_t carry = vext_elem_mask(v0, mlen, i);          \
+        uint8_t carry = vext_elem_mask(v0, i);                \
                                                               \
         *((ETYPE *)vd + H(i)) = DO_OP(s2, s1, carry);         \
     }                                                         \
@@ -1198,7 +1191,6 @@ GEN_VEXT_VADC_VVM(vsbc_vvm_d, uint64_t, H8, DO_VSBC, clearq)
 void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,        \
                   CPURISCVState *env, uint32_t desc)                     \
 {                                                                        \
-    uint32_t mlen = vext_mlen(desc);                                     \
     uint32_t vl = env->vl;                                               \
     uint32_t esz = sizeof(ETYPE);                                        \
     uint32_t vlmax = vext_maxsz(desc) / esz;                             \
@@ -1206,7 +1198,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,        \
                                                                          \
     for (i = 0; i < vl; i++) {                                           \
         ETYPE s2 = *((ETYPE *)vs2 + H(i));                               \
-        uint8_t carry = vext_elem_mask(v0, mlen, i);                     \
+        uint8_t carry = vext_elem_mask(v0, i);                           \
                                                                          \
         *((ETYPE *)vd + H(i)) = DO_OP(s2, (ETYPE)(target_long)s1, carry);\
     }                                                                    \
@@ -1231,7 +1223,6 @@ GEN_VEXT_VADC_VXM(vsbc_vxm_d, uint64_t, H8, DO_VSBC, clearq)
 void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
                   CPURISCVState *env, uint32_t desc)          \
 {                                                             \
-    uint32_t mlen = vext_mlen(desc);                          \
     uint32_t vl = env->vl;                                    \
     uint32_t vlmax = vext_maxsz(desc) / sizeof(ETYPE);        \
     uint32_t i;                                               \
@@ -1239,12 +1230,12 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
     for (i = 0; i < vl; i++) {                                \
         ETYPE s1 = *((ETYPE *)vs1 + H(i));                    \
         ETYPE s2 = *((ETYPE *)vs2 + H(i));                    \
-        uint8_t carry = vext_elem_mask(v0, mlen, i);          \
+        uint8_t carry = vext_elem_mask(v0, i);                \
                                                               \
-        vext_set_elem_mask(vd, mlen, i, DO_OP(s2, s1, carry));\
+        vext_set_elem_mask(vd, i, DO_OP(s2, s1, carry));      \
     }                                                         \
     for (; i < vlmax; i++) {                                  \
-        vext_set_elem_mask(vd, mlen, i, 0);                   \
+        vext_set_elem_mask(vd, i, 0);                         \
     }                                                         \
 }
 
@@ -1262,20 +1253,19 @@ GEN_VEXT_VMADC_VVM(vmsbc_vvm_d, uint64_t, H8, DO_MSBC)
 void HELPER(NAME)(void *vd, void *v0, target_ulong s1,          \
                   void *vs2, CPURISCVState *env, uint32_t desc) \
 {                                                               \
-    uint32_t mlen = vext_mlen(desc);                            \
     uint32_t vl = env->vl;                                      \
     uint32_t vlmax = vext_maxsz(desc) / sizeof(ETYPE);          \
     uint32_t i;                                                 \
                                                                 \
     for (i = 0; i < vl; i++) {                                  \
         ETYPE s2 = *((ETYPE *)vs2 + H(i));                      \
-        uint8_t carry = vext_elem_mask(v0, mlen, i);            \
+        uint8_t carry = vext_elem_mask(v0, i);                  \
                                                                 \
-        vext_set_elem_mask(vd, mlen, i,                         \
+        vext_set_elem_mask(vd, i,                               \
                 DO_OP(s2, (ETYPE)(target_long)s1, carry));      \
     }                                                           \
     for (; i < vlmax; i++) {                                    \
-        vext_set_elem_mask(vd, mlen, i, 0);                     \
+        vext_set_elem_mask(vd, i, 0);                           \
     }                                                           \
 }
 
@@ -1349,7 +1339,6 @@ GEN_VEXT_VX(vxor_vx_d, 8, 8, clearq)
 void HELPER(NAME)(void *vd, void *v0, void *vs1,                          \
                   void *vs2, CPURISCVState *env, uint32_t desc)           \
 {                                                                         \
-    uint32_t mlen = vext_mlen(desc);                                      \
     uint32_t vm = vext_vm(desc);                                          \
     uint32_t vl = env->vl;                                                \
     uint32_t esz = sizeof(TS1);                                           \
@@ -1357,7 +1346,7 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,                          \
     uint32_t i;                                                           \
                                                                           \
     for (i = 0; i < vl; i++) {                                            \
-        if (!vm && !vext_elem_mask(v0, mlen, i)) {                        \
+        if (!vm && !vext_elem_mask(v0, i)) {                              \
             continue;                                                     \
         }                                                                 \
         TS1 s1 = *((TS1 *)vs1 + HS1(i));                                  \
@@ -1387,7 +1376,6 @@ GEN_VEXT_SHIFT_VV(vsra_vv_d, uint64_t, int64_t, H8, H8, DO_SRL, 0x3f, clearq)
 void HELPER(NAME)(void *vd, void *v0, target_ulong s1,                \
         void *vs2, CPURISCVState *env, uint32_t desc)                 \
 {                                                                     \
-    uint32_t mlen = vext_mlen(desc);                                  \
     uint32_t vm = vext_vm(desc);                                      \
     uint32_t vl = env->vl;                                            \
     uint32_t esz = sizeof(TD);                                        \
@@ -1395,7 +1383,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1,                \
     uint32_t i;                                                       \
                                                                       \
     for (i = 0; i < vl; i++) {                                        \
-        if (!vm && !vext_elem_mask(v0, mlen, i)) {                    \
+        if (!vm && !vext_elem_mask(v0, i)) {                          \
             continue;                                                 \
         }                                                             \
         TS2 s2 = *((TS2 *)vs2 + HS2(i));                              \
@@ -1444,7 +1432,6 @@ GEN_VEXT_SHIFT_VX(vnsra_vx_w, int32_t, int64_t, H4, H8, DO_SRL, 0x3f, clearl)
 void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
                   CPURISCVState *env, uint32_t desc)          \
 {                                                             \
-    uint32_t mlen = vext_mlen(desc);                          \
     uint32_t vm = vext_vm(desc);                              \
     uint32_t vl = env->vl;                                    \
     uint32_t vlmax = vext_maxsz(desc) / sizeof(ETYPE);        \
@@ -1453,13 +1440,13 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
     for (i = 0; i < vl; i++) {                                \
         ETYPE s1 = *((ETYPE *)vs1 + H(i));                    \
         ETYPE s2 = *((ETYPE *)vs2 + H(i));                    \
-        if (!vm && !vext_elem_mask(v0, mlen, i)) {            \
+        if (!vm && !vext_elem_mask(v0, i)) {                  \
             continue;                                         \
         }                                                     \
-        vext_set_elem_mask(vd, mlen, i, DO_OP(s2, s1));       \
+        vext_set_elem_mask(vd, i, DO_OP(s2, s1));             \
     }                                                         \
     for (; i < vlmax; i++) {                                  \
-        vext_set_elem_mask(vd, mlen, i, 0);                   \
+        vext_set_elem_mask(vd, i, 0);                         \
     }                                                         \
 }
 
@@ -1497,7 +1484,6 @@ GEN_VEXT_CMP_VV(vmsle_vv_d, int64_t, H8, DO_MSLE)
 void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,   \
                   CPURISCVState *env, uint32_t desc)                \
 {                                                                   \
-    uint32_t mlen = vext_mlen(desc);                                \
     uint32_t vm = vext_vm(desc);                                    \
     uint32_t vl = env->vl;                                          \
     uint32_t vlmax = vext_maxsz(desc) / sizeof(ETYPE);              \
@@ -1505,14 +1491,14 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,   \
                                                                     \
     for (i = 0; i < vl; i++) {                                      \
         ETYPE s2 = *((ETYPE *)vs2 + H(i));                          \
-        if (!vm && !vext_elem_mask(v0, mlen, i)) {                  \
+        if (!vm && !vext_elem_mask(v0, i)) {                        \
             continue;                                               \
         }                                                           \
-        vext_set_elem_mask(vd, mlen, i,                             \
+        vext_set_elem_mask(vd, i,                                   \
                 DO_OP(s2, (ETYPE)(target_long)s1));                 \
     }                                                               \
     for (; i < vlmax; i++) {                                        \
-        vext_set_elem_mask(vd, mlen, i, 0);                         \
+        vext_set_elem_mask(vd, i, 0);                               \
     }                                                               \
 }
 
@@ -2074,14 +2060,13 @@ GEN_VEXT_VMV_VX(vmv_v_x_d, int64_t, H8, clearq)
 void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,          \
                   CPURISCVState *env, uint32_t desc)                 \
 {                                                                    \
-    uint32_t mlen = vext_mlen(desc);                                 \
     uint32_t vl = env->vl;                                           \
     uint32_t esz = sizeof(ETYPE);                                    \
     uint32_t vlmax = vext_maxsz(desc) / esz;                         \
     uint32_t i;                                                      \
                                                                      \
     for (i = 0; i < vl; i++) {                                       \
-        ETYPE *vt = (!vext_elem_mask(v0, mlen, i) ? vs2 : vs1);      \
+        ETYPE *vt = (!vext_elem_mask(v0, i) ? vs2 : vs1);            \
         *((ETYPE *)vd + H(i)) = *(vt + H(i));                        \
     }                                                                \
     CLEAR_FN(vd, vl, vl * esz, vlmax * esz);                         \
@@ -2096,7 +2081,6 @@ GEN_VEXT_VMERGE_VV(vmerge_vvm_d, int64_t, H8, clearq)
 void HELPER(NAME)(void *vd, void *v0, target_ulong s1,               \
                   void *vs2, CPURISCVState *env, uint32_t desc)      \
 {                                                                    \
-    uint32_t mlen = vext_mlen(desc);                                 \
     uint32_t vl = env->vl;                                           \
     uint32_t esz = sizeof(ETYPE);                                    \
     uint32_t vlmax = vext_maxsz(desc) / esz;                         \
@@ -2104,7 +2088,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1,               \
                                                                      \
     for (i = 0; i < vl; i++) {                                       \
         ETYPE s2 = *((ETYPE *)vs2 + H(i));                           \
-        ETYPE d = (!vext_elem_mask(v0, mlen, i) ? s2 :               \
+        ETYPE d = (!vext_elem_mask(v0, i) ? s2 :                     \
                    (ETYPE)(target_long)s1);                          \
         *((ETYPE *)vd + H(i)) = d;                                   \
     }                                                                \
@@ -2142,11 +2126,11 @@ do_##NAME(void *vd, void *vs1, void *vs2, int i,                    \
 static inline void
 vext_vv_rm_1(void *vd, void *v0, void *vs1, void *vs2,
              CPURISCVState *env,
-             uint32_t vl, uint32_t vm, uint32_t mlen, int vxrm,
+             uint32_t vl, uint32_t vm, int vxrm,
              opivv2_rm_fn *fn)
 {
     for (uint32_t i = 0; i < vl; i++) {
-        if (!vm && !vext_elem_mask(v0, mlen, i)) {
+        if (!vm && !vext_elem_mask(v0, i)) {
             continue;
         }
         fn(vd, vs1, vs2, i, env, vxrm);
@@ -2160,26 +2144,25 @@ vext_vv_rm_2(void *vd, void *v0, void *vs1, void *vs2,
              opivv2_rm_fn *fn, clear_fn *clearfn)
 {
     uint32_t vlmax = vext_maxsz(desc) / esz;
-    uint32_t mlen = vext_mlen(desc);
     uint32_t vm = vext_vm(desc);
     uint32_t vl = env->vl;
 
     switch (env->vxrm) {
     case 0: /* rnu */
         vext_vv_rm_1(vd, v0, vs1, vs2,
-                     env, vl, vm, mlen, 0, fn);
+                     env, vl, vm, 0, fn);
         break;
     case 1: /* rne */
         vext_vv_rm_1(vd, v0, vs1, vs2,
-                     env, vl, vm, mlen, 1, fn);
+                     env, vl, vm, 1, fn);
         break;
     case 2: /* rdn */
         vext_vv_rm_1(vd, v0, vs1, vs2,
-                     env, vl, vm, mlen, 2, fn);
+                     env, vl, vm, 2, fn);
         break;
     default: /* rod */
         vext_vv_rm_1(vd, v0, vs1, vs2,
-                     env, vl, vm, mlen, 3, fn);
+                     env, vl, vm, 3, fn);
         break;
     }
 
@@ -2262,11 +2245,11 @@ do_##NAME(void *vd, target_long s1, void *vs2, int i,               \
 static inline void
 vext_vx_rm_1(void *vd, void *v0, target_long s1, void *vs2,
              CPURISCVState *env,
-             uint32_t vl, uint32_t vm, uint32_t mlen, int vxrm,
+             uint32_t vl, uint32_t vm, int vxrm,
              opivx2_rm_fn *fn)
 {
     for (uint32_t i = 0; i < vl; i++) {
-        if (!vm && !vext_elem_mask(v0, mlen, i)) {
+        if (!vm && !vext_elem_mask(v0, i)) {
             continue;
         }
         fn(vd, s1, vs2, i, env, vxrm);
@@ -2280,26 +2263,25 @@ vext_vx_rm_2(void *vd, void *v0, target_long s1, void *vs2,
              opivx2_rm_fn *fn, clear_fn *clearfn)
 {
     uint32_t vlmax = vext_maxsz(desc) / esz;
-    uint32_t mlen = vext_mlen(desc);
     uint32_t vm = vext_vm(desc);
     uint32_t vl = env->vl;
 
     switch (env->vxrm) {
     case 0: /* rnu */
         vext_vx_rm_1(vd, v0, s1, vs2,
-                     env, vl, vm, mlen, 0, fn);
+                     env, vl, vm, 0, fn);
         break;
     case 1: /* rne */
         vext_vx_rm_1(vd, v0, s1, vs2,
-                     env, vl, vm, mlen, 1, fn);
+                     env, vl, vm, 1, fn);
         break;
     case 2: /* rdn */
         vext_vx_rm_1(vd, v0, s1, vs2,
-                     env, vl, vm, mlen, 2, fn);
+                     env, vl, vm, 2, fn);
         break;
     default: /* rod */
         vext_vx_rm_1(vd, v0, s1, vs2,
-                     env, vl, vm, mlen, 3, fn);
+                     env, vl, vm, 3, fn);
         break;
     }
 
@@ -3184,13 +3166,12 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,          \
                   uint32_t desc)                          \
 {                                                         \
     uint32_t vlmax = vext_maxsz(desc) / ESZ;              \
-    uint32_t mlen = vext_mlen(desc);                      \
     uint32_t vm = vext_vm(desc);                          \
     uint32_t vl = env->vl;                                \
     uint32_t i;                                           \
                                                           \
     for (i = 0; i < vl; i++) {                            \
-        if (!vm && !vext_elem_mask(v0, mlen, i)) {        \
+        if (!vm && !vext_elem_mask(v0, i)) {              \
             continue;                                     \
         }                                                 \
         do_##NAME(vd, vs1, vs2, i, env);                  \
@@ -3219,13 +3200,12 @@ void HELPER(NAME)(void *vd, void *v0, uint64_t s1,        \
                   uint32_t desc)                          \
 {                                                         \
     uint32_t vlmax = vext_maxsz(desc) / ESZ;              \
-    uint32_t mlen = vext_mlen(desc);                      \
     uint32_t vm = vext_vm(desc);                          \
     uint32_t vl = env->vl;                                \
     uint32_t i;                                           \
                                                           \
     for (i = 0; i < vl; i++) {                            \
-        if (!vm && !vext_elem_mask(v0, mlen, i)) {        \
+        if (!vm && !vext_elem_mask(v0, i)) {              \
             continue;                                     \
         }                                                 \
         do_##NAME(vd, s1, vs2, i, env);                   \
@@ -3790,7 +3770,6 @@ void HELPER(NAME)(void *vd, void *v0, void *vs2,       \
         CPURISCVState *env, uint32_t desc)             \
 {                                                      \
     uint32_t vlmax = vext_maxsz(desc) / ESZ;           \
-    uint32_t mlen = vext_mlen(desc);                   \
     uint32_t vm = vext_vm(desc);                       \
     uint32_t vl = env->vl;                             \
     uint32_t i;                                        \
@@ -3799,7 +3778,7 @@ void HELPER(NAME)(void *vd, void *v0, void *vs2,       \
         return;                                        \
     }                                                  \
     for (i = 0; i < vl; i++) {                         \
-        if (!vm && !vext_elem_mask(v0, mlen, i)) {     \
+        if (!vm && !vext_elem_mask(v0, i)) {           \
             continue;                                  \
         }                                              \
         do_##NAME(vd, vs2, i, env);                    \
@@ -3931,7 +3910,6 @@ GEN_VEXT_VF(vfsgnjx_vf_d, 8, 8, clearq)
 void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
                   CPURISCVState *env, uint32_t desc)          \
 {                                                             \
-    uint32_t mlen = vext_mlen(desc);                          \
     uint32_t vm = vext_vm(desc);                              \
     uint32_t vl = env->vl;                                    \
     uint32_t vlmax = vext_maxsz(desc) / sizeof(ETYPE);        \
@@ -3940,14 +3918,14 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
     for (i = 0; i < vl; i++) {                                \
         ETYPE s1 = *((ETYPE *)vs1 + H(i));                    \
         ETYPE s2 = *((ETYPE *)vs2 + H(i));                    \
-        if (!vm && !vext_elem_mask(v0, mlen, i)) {            \
+        if (!vm && !vext_elem_mask(v0, i)) {                  \
             continue;                                         \
         }                                                     \
-        vext_set_elem_mask(vd, mlen, i,                       \
+        vext_set_elem_mask(vd, i,                             \
                            DO_OP(s2, s1, &env->fp_status));   \
     }                                                         \
     for (; i < vlmax; i++) {                                  \
-        vext_set_elem_mask(vd, mlen, i, 0);                   \
+        vext_set_elem_mask(vd, i, 0);                         \
     }                                                         \
 }
 
@@ -3959,7 +3937,6 @@ GEN_VEXT_CMP_VV_ENV(vmfeq_vv_d, uint64_t, H8, float64_eq_quiet)
 void HELPER(NAME)(void *vd, void *v0, uint64_t s1, void *vs2,       \
                   CPURISCVState *env, uint32_t desc)                \
 {                                                                   \
-    uint32_t mlen = vext_mlen(desc);                                \
     uint32_t vm = vext_vm(desc);                                    \
     uint32_t vl = env->vl;                                          \
     uint32_t vlmax = vext_maxsz(desc) / sizeof(ETYPE);              \
@@ -3967,14 +3944,14 @@ void HELPER(NAME)(void *vd, void *v0, uint64_t s1, void *vs2,       \
                                                                     \
     for (i = 0; i < vl; i++) {                                      \
         ETYPE s2 = *((ETYPE *)vs2 + H(i));                          \
-        if (!vm && !vext_elem_mask(v0, mlen, i)) {                  \
+        if (!vm && !vext_elem_mask(v0, i)) {                        \
             continue;                                               \
         }                                                           \
-        vext_set_elem_mask(vd, mlen, i,                             \
+        vext_set_elem_mask(vd, i,                                   \
                            DO_OP(s2, (ETYPE)s1, &env->fp_status));  \
     }                                                               \
     for (; i < vlmax; i++) {                                        \
-        vext_set_elem_mask(vd, mlen, i, 0);                         \
+        vext_set_elem_mask(vd, i, 0);                               \
     }                                                               \
 }
 
@@ -4088,13 +4065,12 @@ void HELPER(NAME)(void *vd, void *v0, void *vs2,       \
                   CPURISCVState *env, uint32_t desc)   \
 {                                                      \
     uint32_t vlmax = vext_maxsz(desc) / ESZ;           \
-    uint32_t mlen = vext_mlen(desc);                   \
     uint32_t vm = vext_vm(desc);                       \
     uint32_t vl = env->vl;                             \
     uint32_t i;                                        \
                                                        \
     for (i = 0; i < vl; i++) {                         \
-        if (!vm && !vext_elem_mask(v0, mlen, i)) {     \
+        if (!vm && !vext_elem_mask(v0, i)) {           \
             continue;                                  \
         }                                              \
         do_##NAME(vd, vs2, i);                         \
@@ -4171,7 +4147,6 @@ GEN_VEXT_V(vfclass_v_d, 8, 8, clearq)
 void HELPER(NAME)(void *vd, void *v0, uint64_t s1, void *vs2, \
                   CPURISCVState *env, uint32_t desc)          \
 {                                                             \
-    uint32_t mlen = vext_mlen(desc);                          \
     uint32_t vm = vext_vm(desc);                              \
     uint32_t vl = env->vl;                                    \
     uint32_t esz = sizeof(ETYPE);                             \
@@ -4181,7 +4156,7 @@ void HELPER(NAME)(void *vd, void *v0, uint64_t s1, void *vs2, \
     for (i = 0; i < vl; i++) {                                \
         ETYPE s2 = *((ETYPE *)vs2 + H(i));                    \
         *((ETYPE *)vd + H(i))                                 \
-          = (!vm && !vext_elem_mask(v0, mlen, i) ? s2 : s1);  \
+          = (!vm && !vext_elem_mask(v0, i) ? s2 : s1);        \
     }                                                         \
     CLEAR_FN(vd, vl, vl * esz, vlmax * esz);                  \
 }
@@ -4312,7 +4287,6 @@ GEN_VEXT_V_ENV(vfncvt_f_f_v_w, 4, 4, clearl)
 void HELPER(NAME)(void *vd, void *v0, void *vs1,          \
         void *vs2, CPURISCVState *env, uint32_t desc)     \
 {                                                         \
-    uint32_t mlen = vext_mlen(desc);                      \
     uint32_t vm = vext_vm(desc);                          \
     uint32_t vl = env->vl;                                \
     uint32_t i;                                           \
@@ -4321,7 +4295,7 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,          \
                                                           \
     for (i = 0; i < vl; i++) {                            \
         TS2 s2 = *((TS2 *)vs2 + HS2(i));                  \
-        if (!vm && !vext_elem_mask(v0, mlen, i)) {        \
+        if (!vm && !vext_elem_mask(v0, i)) {              \
             continue;                                     \
         }                                                 \
         s1 = OP(s1, (TD)s2);                              \
@@ -4395,7 +4369,6 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,           \
                   void *vs2, CPURISCVState *env,           \
                   uint32_t desc)                           \
 {                                                          \
-    uint32_t mlen = vext_mlen(desc);                       \
     uint32_t vm = vext_vm(desc);                           \
     uint32_t vl = env->vl;                                 \
     uint32_t i;                                            \
@@ -4404,7 +4377,7 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,           \
                                                            \
     for (i = 0; i < vl; i++) {                             \
         TS2 s2 = *((TS2 *)vs2 + HS2(i));                   \
-        if (!vm && !vext_elem_mask(v0, mlen, i)) {         \
+        if (!vm && !vext_elem_mask(v0, i)) {               \
             continue;                                      \
         }                                                  \
         s1 = OP(s1, (TD)s2, &env->fp_status);              \
@@ -4433,7 +4406,6 @@ GEN_VEXT_FRED(vfredmin_vs_d, uint64_t, uint64_t, H8, H8, float64_minnum, clearq)
 void HELPER(vfwredsum_vs_h)(void *vd, void *v0, void *vs1,
                             void *vs2, CPURISCVState *env, uint32_t desc)
 {
-    uint32_t mlen = vext_mlen(desc);
     uint32_t vm = vext_vm(desc);
     uint32_t vl = env->vl;
     uint32_t i;
@@ -4442,7 +4414,7 @@ void HELPER(vfwredsum_vs_h)(void *vd, void *v0, void *vs1,
 
     for (i = 0; i < vl; i++) {
         uint16_t s2 = *((uint16_t *)vs2 + H2(i));
-        if (!vm && !vext_elem_mask(v0, mlen, i)) {
+        if (!vm && !vext_elem_mask(v0, i)) {
             continue;
         }
         s1 = float32_add(s1, float16_to_float32(s2, true, &env->fp_status),
@@ -4455,7 +4427,6 @@ void HELPER(vfwredsum_vs_h)(void *vd, void *v0, void *vs1,
 void HELPER(vfwredsum_vs_w)(void *vd, void *v0, void *vs1,
                             void *vs2, CPURISCVState *env, uint32_t desc)
 {
-    uint32_t mlen = vext_mlen(desc);
     uint32_t vm = vext_vm(desc);
     uint32_t vl = env->vl;
     uint32_t i;
@@ -4464,7 +4435,7 @@ void HELPER(vfwredsum_vs_w)(void *vd, void *v0, void *vs1,
 
     for (i = 0; i < vl; i++) {
         uint32_t s2 = *((uint32_t *)vs2 + H4(i));
-        if (!vm && !vext_elem_mask(v0, mlen, i)) {
+        if (!vm && !vext_elem_mask(v0, i)) {
             continue;
         }
         s1 = float64_add(s1, float32_to_float64(s2, &env->fp_status),
@@ -4483,19 +4454,18 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,          \
                   void *vs2, CPURISCVState *env,          \
                   uint32_t desc)                          \
 {                                                         \
-    uint32_t mlen = vext_mlen(desc);                      \
-    uint32_t vlmax = env_archcpu(env)->cfg.vlen / mlen;   \
+    uint32_t vlmax = env_archcpu(env)->cfg.vlen;          \
     uint32_t vl = env->vl;                                \
     uint32_t i;                                           \
     int a, b;                                             \
                                                           \
     for (i = 0; i < vl; i++) {                            \
-        a = vext_elem_mask(vs1, mlen, i);                 \
-        b = vext_elem_mask(vs2, mlen, i);                 \
-        vext_set_elem_mask(vd, mlen, i, OP(b, a));        \
+        a = vext_elem_mask(vs1, i);                       \
+        b = vext_elem_mask(vs2, i);                       \
+        vext_set_elem_mask(vd, i, OP(b, a));              \
     }                                                     \
     for (; i < vlmax; i++) {                              \
-        vext_set_elem_mask(vd, mlen, i, 0);               \
+        vext_set_elem_mask(vd, i, 0);                     \
     }                                                     \
 }
 
@@ -4519,14 +4489,13 @@ target_ulong HELPER(vmpopc_m)(void *v0, void *vs2, CPURISCVState *env,
                               uint32_t desc)
 {
     target_ulong cnt = 0;
-    uint32_t mlen = vext_mlen(desc);
     uint32_t vm = vext_vm(desc);
     uint32_t vl = env->vl;
     int i;
 
     for (i = 0; i < vl; i++) {
-        if (vm || vext_elem_mask(v0, mlen, i)) {
-            if (vext_elem_mask(vs2, mlen, i)) {
+        if (vm || vext_elem_mask(v0, i)) {
+            if (vext_elem_mask(vs2, i)) {
                 cnt++;
             }
         }
@@ -4538,14 +4507,13 @@ target_ulong HELPER(vmpopc_m)(void *v0, void *vs2, CPURISCVState *env,
 target_ulong HELPER(vmfirst_m)(void *v0, void *vs2, CPURISCVState *env,
                                uint32_t desc)
 {
-    uint32_t mlen = vext_mlen(desc);
     uint32_t vm = vext_vm(desc);
     uint32_t vl = env->vl;
     int i;
 
     for (i = 0; i < vl; i++) {
-        if (vm || vext_elem_mask(v0, mlen, i)) {
-            if (vext_elem_mask(vs2, mlen, i)) {
+        if (vm || vext_elem_mask(v0, i)) {
+            if (vext_elem_mask(vs2, i)) {
                 return i;
             }
         }
@@ -4562,39 +4530,38 @@ enum set_mask_type {
 static void vmsetm(void *vd, void *v0, void *vs2, CPURISCVState *env,
                    uint32_t desc, enum set_mask_type type)
 {
-    uint32_t mlen = vext_mlen(desc);
-    uint32_t vlmax = env_archcpu(env)->cfg.vlen / mlen;
+    uint32_t vlmax = env_archcpu(env)->cfg.vlen;
     uint32_t vm = vext_vm(desc);
     uint32_t vl = env->vl;
     int i;
     bool first_mask_bit = false;
 
     for (i = 0; i < vl; i++) {
-        if (!vm && !vext_elem_mask(v0, mlen, i)) {
+        if (!vm && !vext_elem_mask(v0, i)) {
             continue;
         }
         /* write a zero to all following active elements */
         if (first_mask_bit) {
-            vext_set_elem_mask(vd, mlen, i, 0);
+            vext_set_elem_mask(vd, i, 0);
             continue;
         }
-        if (vext_elem_mask(vs2, mlen, i)) {
+        if (vext_elem_mask(vs2, i)) {
             first_mask_bit = true;
             if (type == BEFORE_FIRST) {
-                vext_set_elem_mask(vd, mlen, i, 0);
+                vext_set_elem_mask(vd, i, 0);
             } else {
-                vext_set_elem_mask(vd, mlen, i, 1);
+                vext_set_elem_mask(vd, i, 1);
             }
         } else {
             if (type == ONLY_FIRST) {
-                vext_set_elem_mask(vd, mlen, i, 0);
+                vext_set_elem_mask(vd, i, 0);
             } else {
-                vext_set_elem_mask(vd, mlen, i, 1);
+                vext_set_elem_mask(vd, i, 1);
             }
         }
     }
     for (; i < vlmax; i++) {
-        vext_set_elem_mask(vd, mlen, i, 0);
+        vext_set_elem_mask(vd, i, 0);
     }
 }
 
@@ -4621,19 +4588,18 @@ void HELPER(vmsof_m)(void *vd, void *v0, void *vs2, CPURISCVState *env,
 void HELPER(NAME)(void *vd, void *v0, void *vs2, CPURISCVState *env,      \
                   uint32_t desc)                                          \
 {                                                                         \
-    uint32_t mlen = vext_mlen(desc);                                      \
-    uint32_t vlmax = env_archcpu(env)->cfg.vlen / mlen;                   \
+    uint32_t vlmax = env_archcpu(env)->cfg.vlen;                          \
     uint32_t vm = vext_vm(desc);                                          \
     uint32_t vl = env->vl;                                                \
     uint32_t sum = 0;                                                     \
     int i;                                                                \
                                                                           \
     for (i = 0; i < vl; i++) {                                            \
-        if (!vm && !vext_elem_mask(v0, mlen, i)) {                        \
+        if (!vm && !vext_elem_mask(v0, i)) {                              \
             continue;                                                     \
         }                                                                 \
         *((ETYPE *)vd + H(i)) = sum;                                      \
-        if (vext_elem_mask(vs2, mlen, i)) {                               \
+        if (vext_elem_mask(vs2, i)) {                                     \
             sum++;                                                        \
         }                                                                 \
     }                                                                     \
@@ -4649,14 +4615,13 @@ GEN_VEXT_VIOTA_M(viota_m_d, uint64_t, H8, clearq)
 #define GEN_VEXT_VID_V(NAME, ETYPE, H, CLEAR_FN)                          \
 void HELPER(NAME)(void *vd, void *v0, CPURISCVState *env, uint32_t desc)  \
 {                                                                         \
-    uint32_t mlen = vext_mlen(desc);                                      \
-    uint32_t vlmax = env_archcpu(env)->cfg.vlen / mlen;                   \
+    uint32_t vlmax = env_archcpu(env)->cfg.vlen;                          \
     uint32_t vm = vext_vm(desc);                                          \
     uint32_t vl = env->vl;                                                \
     int i;                                                                \
                                                                           \
     for (i = 0; i < vl; i++) {                                            \
-        if (!vm && !vext_elem_mask(v0, mlen, i)) {                        \
+        if (!vm && !vext_elem_mask(v0, i)) {                              \
             continue;                                                     \
         }                                                                 \
         *((ETYPE *)vd + H(i)) = i;                                        \
@@ -4678,14 +4643,13 @@ GEN_VEXT_VID_V(vid_v_d, uint64_t, H8, clearq)
 void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,         \
                   CPURISCVState *env, uint32_t desc)                      \
 {                                                                         \
-    uint32_t mlen = vext_mlen(desc);                                      \
-    uint32_t vlmax = env_archcpu(env)->cfg.vlen / mlen;                   \
+    uint32_t vlmax = env_archcpu(env)->cfg.vlen;                          \
     uint32_t vm = vext_vm(desc);                                          \
     uint32_t vl = env->vl;                                                \
     target_ulong offset = s1, i;                                          \
                                                                           \
     for (i = offset; i < vl; i++) {                                       \
-        if (!vm && !vext_elem_mask(v0, mlen, i)) {                        \
+        if (!vm && !vext_elem_mask(v0, i)) {                              \
             continue;                                                     \
         }                                                                 \
         *((ETYPE *)vd + H(i)) = *((ETYPE *)vs2 + H(i - offset));          \
@@ -4703,15 +4667,14 @@ GEN_VEXT_VSLIDEUP_VX(vslideup_vx_d, uint64_t, H8, clearq)
 void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,         \
                   CPURISCVState *env, uint32_t desc)                      \
 {                                                                         \
-    uint32_t mlen = vext_mlen(desc);                                      \
-    uint32_t vlmax = env_archcpu(env)->cfg.vlen / mlen;                   \
+    uint32_t vlmax = env_archcpu(env)->cfg.vlen;                          \
     uint32_t vm = vext_vm(desc);                                          \
     uint32_t vl = env->vl;                                                \
     target_ulong offset = s1, i;                                          \
                                                                           \
     for (i = 0; i < vl; ++i) {                                            \
         target_ulong j = i + offset;                                      \
-        if (!vm && !vext_elem_mask(v0, mlen, i)) {                        \
+        if (!vm && !vext_elem_mask(v0, i)) {                              \
             continue;                                                     \
         }                                                                 \
         *((ETYPE *)vd + H(i)) = j >= vlmax ? 0 : *((ETYPE *)vs2 + H(j));  \
@@ -4729,14 +4692,13 @@ GEN_VEXT_VSLIDEDOWN_VX(vslidedown_vx_d, uint64_t, H8, clearq)
 void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,         \
                   CPURISCVState *env, uint32_t desc)                      \
 {                                                                         \
-    uint32_t mlen = vext_mlen(desc);                                      \
-    uint32_t vlmax = env_archcpu(env)->cfg.vlen / mlen;                   \
+    uint32_t vlmax = env_archcpu(env)->cfg.vlen;                          \
     uint32_t vm = vext_vm(desc);                                          \
     uint32_t vl = env->vl;                                                \
     uint32_t i;                                                           \
                                                                           \
     for (i = 0; i < vl; i++) {                                            \
-        if (!vm && !vext_elem_mask(v0, mlen, i)) {                        \
+        if (!vm && !vext_elem_mask(v0, i)) {                              \
             continue;                                                     \
         }                                                                 \
         if (i == 0) {                                                     \
@@ -4758,14 +4720,13 @@ GEN_VEXT_VSLIDE1UP_VX(vslide1up_vx_d, uint64_t, H8, clearq)
 void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,         \
                   CPURISCVState *env, uint32_t desc)                      \
 {                                                                         \
-    uint32_t mlen = vext_mlen(desc);                                      \
-    uint32_t vlmax = env_archcpu(env)->cfg.vlen / mlen;                   \
+    uint32_t vlmax = env_archcpu(env)->cfg.vlen;                          \
     uint32_t vm = vext_vm(desc);                                          \
     uint32_t vl = env->vl;                                                \
     uint32_t i;                                                           \
                                                                           \
     for (i = 0; i < vl; i++) {                                            \
-        if (!vm && !vext_elem_mask(v0, mlen, i)) {                        \
+        if (!vm && !vext_elem_mask(v0, i)) {                              \
             continue;                                                     \
         }                                                                 \
         if (i == vl - 1) {                                                \
@@ -4788,15 +4749,14 @@ GEN_VEXT_VSLIDE1DOWN_VX(vslide1down_vx_d, uint64_t, H8, clearq)
 void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,               \
                   CPURISCVState *env, uint32_t desc)                      \
 {                                                                         \
-    uint32_t mlen = vext_mlen(desc);                                      \
-    uint32_t vlmax = env_archcpu(env)->cfg.vlen / mlen;                   \
+    uint32_t vlmax = env_archcpu(env)->cfg.vlen;                          \
     uint32_t vm = vext_vm(desc);                                          \
     uint32_t vl = env->vl;                                                \
     uint64_t index;                                                       \
     uint32_t i;                                                           \
                                                                           \
     for (i = 0; i < vl; i++) {                                            \
-        if (!vm && !vext_elem_mask(v0, mlen, i)) {                        \
+        if (!vm && !vext_elem_mask(v0, i)) {                              \
             continue;                                                     \
         }                                                                 \
         index = *((ETYPE *)vs1 + H(i));                                   \
@@ -4819,15 +4779,14 @@ GEN_VEXT_VRGATHER_VV(vrgather_vv_d, uint64_t, H8, clearq)
 void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,         \
                   CPURISCVState *env, uint32_t desc)                      \
 {                                                                         \
-    uint32_t mlen = vext_mlen(desc);                                      \
-    uint32_t vlmax = env_archcpu(env)->cfg.vlen / mlen;                   \
+    uint32_t vlmax = env_archcpu(env)->cfg.vlen;                          \
     uint32_t vm = vext_vm(desc);                                          \
     uint32_t vl = env->vl;                                                \
     uint64_t index = s1;                                                  \
     uint32_t i;                                                           \
                                                                           \
     for (i = 0; i < vl; i++) {                                            \
-        if (!vm && !vext_elem_mask(v0, mlen, i)) {                        \
+        if (!vm && !vext_elem_mask(v0, i)) {                              \
             continue;                                                     \
         }                                                                 \
         if (index >= vlmax) {                                             \
@@ -4850,13 +4809,12 @@ GEN_VEXT_VRGATHER_VX(vrgather_vx_d, uint64_t, H8, clearq)
 void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,               \
                   CPURISCVState *env, uint32_t desc)                      \
 {                                                                         \
-    uint32_t mlen = vext_mlen(desc);                                      \
-    uint32_t vlmax = env_archcpu(env)->cfg.vlen / mlen;                   \
+    uint32_t vlmax = env_archcpu(env)->cfg.vlen;                          \
     uint32_t vl = env->vl;                                                \
     uint32_t num = 0, i;                                                  \
                                                                           \
     for (i = 0; i < vl; i++) {                                            \
-        if (!vext_elem_mask(vs1, mlen, i)) {                              \
+        if (!vext_elem_mask(vs1, i)) {                                    \
             continue;                                                     \
         }                                                                 \
         *((ETYPE *)vd + H(num)) = *((ETYPE *)vs2 + H(i));                 \
-- 
2.25.1


