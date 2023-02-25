Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pVqe8-00054r-G4
	for mharc-qemu-riscv@gnu.org; Sat, 25 Feb 2023 04:15:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqe7-00053D-Iy
 for qemu-riscv@nongnu.org; Sat, 25 Feb 2023 04:15:11 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqe3-0001Uf-9t
 for qemu-riscv@nongnu.org; Sat, 25 Feb 2023 04:15:11 -0500
Received: by mail-pl1-x631.google.com with SMTP id e5so1869627plg.8
 for <qemu-riscv@nongnu.org>; Sat, 25 Feb 2023 01:15:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WiwFjCR7gVoljxenCQXrfcALDaPAGhUgclRRM6SrQmE=;
 b=dohhWfolHQ9U+aMxNDoXhvBwDRRdR7+BmFxQAVIg9tmBmsSbnWcBm3WgG+CiOFeky6
 GnEdz0pjzRqychSm3snovqwwYaC+w4uD1DVHYpoQDk3he50ALawiUueOI9/HvukImBAY
 MmMAvcJVtT66/MghPnvrs/1qgxUSxlHLCOzHgVSLehp34NX6VGFil2nqO4CdrxPj1NTM
 oTr4rIcq4YrB2HIXKSL+zBahWznSnuY035txXarqtE1P55CJtKEJQhB4dexr1YZAzCew
 KBI9njgb7h3UYENSlpUvSSb0m9jU8cttAgIF9noLJ7HJzHv/v7v6mQbqgYZPYjbpZ32M
 ZWSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WiwFjCR7gVoljxenCQXrfcALDaPAGhUgclRRM6SrQmE=;
 b=eUcxLj0ndoDvwBgQq/7m5AH8tB+1jeO0wr4lMXteiV6Mr1ad7IlUIEL5Xz7hTk0D8L
 jP8jQmUlWeOWephKOcSso+xMk5rZ172Et8A/90jrfi6Oj8wX3fNYzdwjJ7Y8dtiv0XfP
 6hsjCqnAMgxPfb5JxVzmHKLdKiHy27YyWYG1R3oTq6nH9vRdQYs7p3MP3WkyXsnOVUGL
 EzrnwPJE9QrEb7BbDYKitjvs9K8wfCaKtOKcBTFu87CuPWG6NsoBNzdEcPnfpLnJ6ClZ
 UpgIq9xjiUi2JD7/UZGA6PnnHAmpN7MoKXU4aGChiJ3OnOdihaeu3GssP5g5I8YkiRH3
 DNlQ==
X-Gm-Message-State: AO0yUKUDyvOAkGe2GcoAoLgjcRZ5yQSI8Za6Hfv/1/A8aoZntiJvulvO
 z8p69uiSsXIzIn83/PRcocoDmg==
X-Google-Smtp-Source: AK7set9XKzc4sdio5Sf57E6Dd7r0+M6Kfdk+7ARYydh3UvjTGrf55wessTN4Mep/6ftjHRw7oEQYig==
X-Received: by 2002:a17:902:fb0d:b0:19b:107b:698e with SMTP id
 le13-20020a170902fb0d00b0019b107b698emr15924538plb.14.1677316506403; 
 Sat, 25 Feb 2023 01:15:06 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 je12-20020a170903264c00b0019607aeda8bsm831101plb.73.2023.02.25.01.15.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 01:15:05 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 13/76] target/arm: Drop tcg_temp_free from translator-neon.c
Date: Fri, 24 Feb 2023 23:13:24 -1000
Message-Id: <20230225091427.1817156-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225091427.1817156-1-richard.henderson@linaro.org>
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Sat, 25 Feb 2023 09:15:11 -0000

Translators are no longer required to free tcg temporaries.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-neon.c | 131 +-----------------------------------
 1 file changed, 1 insertion(+), 130 deletions(-)

diff --git a/target/arm/translate-neon.c b/target/arm/translate-neon.c
index 4016339d46..af8685a4ac 100644
--- a/target/arm/translate-neon.c
+++ b/target/arm/translate-neon.c
@@ -182,7 +182,6 @@ static bool do_neon_ddda_fpst(DisasContext *s, int q, int vd, int vn, int vm,
                        vfp_reg_offset(1, vm),
                        vfp_reg_offset(1, vd),
                        fpst, opr_sz, opr_sz, data, fn_gvec_ptr);
-    tcg_temp_free_ptr(fpst);
     return true;
 }
 
@@ -236,7 +235,6 @@ static bool trans_VCADD(DisasContext *s, arg_VCADD *a)
                        vfp_reg_offset(1, a->vm),
                        fpst, opr_sz, opr_sz, a->rot,
                        fn_gvec_ptr);
-    tcg_temp_free_ptr(fpst);
     return true;
 }
 
@@ -433,7 +431,6 @@ static void gen_neon_ldst_base_update(DisasContext *s, int rm, int rn,
             TCGv_i32 index;
             index = load_reg(s, rm);
             tcg_gen_add_i32(base, base, index);
-            tcg_temp_free_i32(index);
         }
         store_reg(s, rn, base);
     }
@@ -536,8 +533,6 @@ static bool trans_VLDST_multiple(DisasContext *s, arg_VLDST_multiple *a)
             }
         }
     }
-    tcg_temp_free_i32(addr);
-    tcg_temp_free_i64(tmp64);
 
     gen_neon_ldst_base_update(s, a->rm, a->rn, nregs * interleave * 8);
     return true;
@@ -630,8 +625,6 @@ static bool trans_VLD_all_lanes(DisasContext *s, arg_VLD_all_lanes *a)
         /* Subsequent memory operations inherit alignment */
         mop &= ~MO_AMASK;
     }
-    tcg_temp_free_i32(tmp);
-    tcg_temp_free_i32(addr);
 
     gen_neon_ldst_base_update(s, a->rm, a->rn, (1 << size) * nregs);
 
@@ -751,8 +744,6 @@ static bool trans_VLDST_single(DisasContext *s, arg_VLDST_single *a)
         /* Subsequent memory operations inherit alignment */
         mop &= ~MO_AMASK;
     }
-    tcg_temp_free_i32(addr);
-    tcg_temp_free_i32(tmp);
 
     gen_neon_ldst_base_update(s, a->rm, a->rn, (1 << a->size) * nregs);
 
@@ -1061,9 +1052,6 @@ static bool do_3same_pair(DisasContext *s, arg_3same *a, NeonGenTwoOpFn *fn)
     write_neon_element32(tmp, a->vd, 0, MO_32);
     write_neon_element32(tmp3, a->vd, 1, MO_32);
 
-    tcg_temp_free_i32(tmp);
-    tcg_temp_free_i32(tmp2);
-    tcg_temp_free_i32(tmp3);
     return true;
 }
 
@@ -1126,7 +1114,6 @@ DO_3SAME_VQDMULH(VQRDMULH, qrdmulh)
         TCGv_ptr fpst = fpstatus_ptr(FPST);                             \
         tcg_gen_gvec_3_ptr(rd_ofs, rn_ofs, rm_ofs, fpst,                \
                            oprsz, maxsz, 0, FUNC);                      \
-        tcg_temp_free_ptr(fpst);                                        \
     }
 
 #define DO_3S_FP_GVEC(INSN,SFUNC,HFUNC)                                 \
@@ -1225,7 +1212,6 @@ static bool do_3same_fp_pair(DisasContext *s, arg_3same *a,
                        vfp_reg_offset(1, a->vn),
                        vfp_reg_offset(1, a->vm),
                        fpstatus, 8, 8, 0, fn);
-    tcg_temp_free_ptr(fpstatus);
 
     return true;
 }
@@ -1358,7 +1344,6 @@ static bool do_2shift_env_64(DisasContext *s, arg_2reg_shift *a,
         read_neon_element64(tmp, a->vm, pass, MO_64);
         fn(tmp, cpu_env, tmp, constimm);
         write_neon_element64(tmp, a->vd, pass, MO_64);
-        tcg_temp_free_i64(tmp);
     }
     return true;
 }
@@ -1403,7 +1388,6 @@ static bool do_2shift_env_32(DisasContext *s, arg_2reg_shift *a,
         fn(tmp, cpu_env, tmp, constimm);
         write_neon_element32(tmp, a->vd, pass, MO_32);
     }
-    tcg_temp_free_i32(tmp);
     return true;
 }
 
@@ -1474,10 +1458,6 @@ static bool do_2shift_narrow_64(DisasContext *s, arg_2reg_shift *a,
     narrowfn(rd, cpu_env, rm2);
     write_neon_element32(rd, a->vd, 1, MO_32);
 
-    tcg_temp_free_i32(rd);
-    tcg_temp_free_i64(rm1);
-    tcg_temp_free_i64(rm2);
-
     return true;
 }
 
@@ -1537,22 +1517,17 @@ static bool do_2shift_narrow_32(DisasContext *s, arg_2reg_shift *a,
     shiftfn(rm2, rm2, constimm);
 
     tcg_gen_concat_i32_i64(rtmp, rm1, rm2);
-    tcg_temp_free_i32(rm2);
 
     narrowfn(rm1, cpu_env, rtmp);
     write_neon_element32(rm1, a->vd, 0, MO_32);
-    tcg_temp_free_i32(rm1);
 
     shiftfn(rm3, rm3, constimm);
     shiftfn(rm4, rm4, constimm);
 
     tcg_gen_concat_i32_i64(rtmp, rm3, rm4);
-    tcg_temp_free_i32(rm4);
 
     narrowfn(rm3, cpu_env, rtmp);
-    tcg_temp_free_i64(rtmp);
     write_neon_element32(rm3, a->vd, 1, MO_32);
-    tcg_temp_free_i32(rm3);
     return true;
 }
 
@@ -1660,7 +1635,6 @@ static bool do_vshll_2sh(DisasContext *s, arg_2reg_shift *a,
     tmp = tcg_temp_new_i64();
 
     widenfn(tmp, rm0);
-    tcg_temp_free_i32(rm0);
     if (a->shift != 0) {
         tcg_gen_shli_i64(tmp, tmp, a->shift);
         tcg_gen_andi_i64(tmp, tmp, ~widen_mask);
@@ -1668,13 +1642,11 @@ static bool do_vshll_2sh(DisasContext *s, arg_2reg_shift *a,
     write_neon_element64(tmp, a->vd, 0, MO_64);
 
     widenfn(tmp, rm1);
-    tcg_temp_free_i32(rm1);
     if (a->shift != 0) {
         tcg_gen_shli_i64(tmp, tmp, a->shift);
         tcg_gen_andi_i64(tmp, tmp, ~widen_mask);
     }
     write_neon_element64(tmp, a->vd, 1, MO_64);
-    tcg_temp_free_i64(tmp);
     return true;
 }
 
@@ -1733,7 +1705,6 @@ static bool do_fp_2sh(DisasContext *s, arg_2reg_shift *a,
 
     fpst = fpstatus_ptr(a->size == MO_16 ? FPST_STD_F16 : FPST_STD);
     tcg_gen_gvec_2_ptr(rd_ofs, rm_ofs, fpst, vec_size, vec_size, a->shift, fn);
-    tcg_temp_free_ptr(fpst);
     return true;
 }
 
@@ -1849,7 +1820,6 @@ static bool do_prewiden_3d(DisasContext *s, arg_3diff *a,
         TCGv_i32 tmp = tcg_temp_new_i32();
         read_neon_element32(tmp, a->vn, 0, MO_32);
         widenfn(rn0_64, tmp);
-        tcg_temp_free_i32(tmp);
     }
     if (src2_mop >= 0) {
         read_neon_element64(rm_64, a->vm, 0, src2_mop);
@@ -1857,7 +1827,6 @@ static bool do_prewiden_3d(DisasContext *s, arg_3diff *a,
         TCGv_i32 tmp = tcg_temp_new_i32();
         read_neon_element32(tmp, a->vm, 0, MO_32);
         widenfn(rm_64, tmp);
-        tcg_temp_free_i32(tmp);
     }
 
     opfn(rn0_64, rn0_64, rm_64);
@@ -1872,7 +1841,6 @@ static bool do_prewiden_3d(DisasContext *s, arg_3diff *a,
         TCGv_i32 tmp = tcg_temp_new_i32();
         read_neon_element32(tmp, a->vn, 1, MO_32);
         widenfn(rn1_64, tmp);
-        tcg_temp_free_i32(tmp);
     }
     if (src2_mop >= 0) {
         read_neon_element64(rm_64, a->vm, 1, src2_mop);
@@ -1880,7 +1848,6 @@ static bool do_prewiden_3d(DisasContext *s, arg_3diff *a,
         TCGv_i32 tmp = tcg_temp_new_i32();
         read_neon_element32(tmp, a->vm, 1, MO_32);
         widenfn(rm_64, tmp);
-        tcg_temp_free_i32(tmp);
     }
 
     write_neon_element64(rn0_64, a->vd, 0, MO_64);
@@ -1888,10 +1855,6 @@ static bool do_prewiden_3d(DisasContext *s, arg_3diff *a,
     opfn(rn1_64, rn1_64, rm_64);
     write_neon_element64(rn1_64, a->vd, 1, MO_64);
 
-    tcg_temp_free_i64(rn0_64);
-    tcg_temp_free_i64(rn1_64);
-    tcg_temp_free_i64(rm_64);
-
     return true;
 }
 
@@ -1976,11 +1939,6 @@ static bool do_narrow_3d(DisasContext *s, arg_3diff *a,
     write_neon_element32(rd0, a->vd, 0, MO_32);
     write_neon_element32(rd1, a->vd, 1, MO_32);
 
-    tcg_temp_free_i32(rd0);
-    tcg_temp_free_i32(rd1);
-    tcg_temp_free_i64(rn_64);
-    tcg_temp_free_i64(rm_64);
-
     return true;
 }
 
@@ -2061,8 +2019,6 @@ static bool do_long_3d(DisasContext *s, arg_3diff *a,
     read_neon_element32(rn, a->vn, 1, MO_32);
     read_neon_element32(rm, a->vm, 1, MO_32);
     opfn(rd1, rn, rm);
-    tcg_temp_free_i32(rn);
-    tcg_temp_free_i32(rm);
 
     /* Don't store results until after all loads: they might overlap */
     if (accfn) {
@@ -2071,13 +2027,10 @@ static bool do_long_3d(DisasContext *s, arg_3diff *a,
         accfn(rd0, tmp, rd0);
         read_neon_element64(tmp, a->vd, 1, MO_64);
         accfn(rd1, tmp, rd1);
-        tcg_temp_free_i64(tmp);
     }
 
     write_neon_element64(rd0, a->vd, 0, MO_64);
     write_neon_element64(rd1, a->vd, 1, MO_64);
-    tcg_temp_free_i64(rd0);
-    tcg_temp_free_i64(rd1);
 
     return true;
 }
@@ -2149,9 +2102,6 @@ static void gen_mull_s32(TCGv_i64 rd, TCGv_i32 rn, TCGv_i32 rm)
 
     tcg_gen_muls2_i32(lo, hi, rn, rm);
     tcg_gen_concat_i32_i64(rd, lo, hi);
-
-    tcg_temp_free_i32(lo);
-    tcg_temp_free_i32(hi);
 }
 
 static void gen_mull_u32(TCGv_i64 rd, TCGv_i32 rn, TCGv_i32 rm)
@@ -2161,9 +2111,6 @@ static void gen_mull_u32(TCGv_i64 rd, TCGv_i32 rn, TCGv_i32 rm)
 
     tcg_gen_mulu2_i32(lo, hi, rn, rm);
     tcg_gen_concat_i32_i64(rd, lo, hi);
-
-    tcg_temp_free_i32(lo);
-    tcg_temp_free_i32(hi);
 }
 
 static bool trans_VMULL_S_3d(DisasContext *s, arg_3diff *a)
@@ -2344,7 +2291,6 @@ static void gen_neon_dup_low16(TCGv_i32 var)
     tcg_gen_ext16u_i32(var, var);
     tcg_gen_shli_i32(tmp, var, 16);
     tcg_gen_or_i32(var, var, tmp);
-    tcg_temp_free_i32(tmp);
 }
 
 static void gen_neon_dup_high16(TCGv_i32 var)
@@ -2353,7 +2299,6 @@ static void gen_neon_dup_high16(TCGv_i32 var)
     tcg_gen_andi_i32(var, var, 0xffff0000);
     tcg_gen_shri_i32(tmp, var, 16);
     tcg_gen_or_i32(var, var, tmp);
-    tcg_temp_free_i32(tmp);
 }
 
 static inline TCGv_i32 neon_get_scalar(int size, int reg)
@@ -2417,12 +2362,9 @@ static bool do_2scalar(DisasContext *s, arg_2scalar *a,
             TCGv_i32 rd = tcg_temp_new_i32();
             read_neon_element32(rd, a->vd, pass, MO_32);
             accfn(tmp, rd, tmp);
-            tcg_temp_free_i32(rd);
         }
         write_neon_element32(tmp, a->vd, pass, MO_32);
     }
-    tcg_temp_free_i32(tmp);
-    tcg_temp_free_i32(scalar);
     return true;
 }
 
@@ -2516,7 +2458,6 @@ static bool do_2scalar_fp_vec(DisasContext *s, arg_2scalar *a,
     fpstatus = fpstatus_ptr(a->size == 1 ? FPST_STD_F16 : FPST_STD);
     tcg_gen_gvec_3_ptr(rd_ofs, rn_ofs, rm_ofs, fpstatus,
                        vec_size, vec_size, idx, fn);
-    tcg_temp_free_ptr(fpstatus);
     return true;
 }
 
@@ -2616,10 +2557,6 @@ static bool do_vqrdmlah_2sc(DisasContext *s, arg_2scalar *a,
         opfn(rd, cpu_env, rn, scalar, rd);
         write_neon_element32(rd, a->vd, pass, MO_32);
     }
-    tcg_temp_free_i32(rn);
-    tcg_temp_free_i32(rd);
-    tcg_temp_free_i32(scalar);
-
     return true;
 }
 
@@ -2692,8 +2629,6 @@ static bool do_2scalar_long(DisasContext *s, arg_2scalar *a,
     read_neon_element32(rn, a->vn, 1, MO_32);
     rn1_64 = tcg_temp_new_i64();
     opfn(rn1_64, rn, scalar);
-    tcg_temp_free_i32(rn);
-    tcg_temp_free_i32(scalar);
 
     if (accfn) {
         TCGv_i64 t64 = tcg_temp_new_i64();
@@ -2701,13 +2636,10 @@ static bool do_2scalar_long(DisasContext *s, arg_2scalar *a,
         accfn(rn0_64, t64, rn0_64);
         read_neon_element64(t64, a->vd, 1, MO_64);
         accfn(rn1_64, t64, rn1_64);
-        tcg_temp_free_i64(t64);
     }
 
     write_neon_element64(rn0_64, a->vd, 0, MO_64);
     write_neon_element64(rn1_64, a->vd, 1, MO_64);
-    tcg_temp_free_i64(rn0_64);
-    tcg_temp_free_i64(rn1_64);
     return true;
 }
 
@@ -2842,10 +2774,6 @@ static bool trans_VEXT(DisasContext *s, arg_VEXT *a)
         read_neon_element64(left, a->vm, 0, MO_64);
         tcg_gen_extract2_i64(dest, right, left, a->imm * 8);
         write_neon_element64(dest, a->vd, 0, MO_64);
-
-        tcg_temp_free_i64(left);
-        tcg_temp_free_i64(right);
-        tcg_temp_free_i64(dest);
     } else {
         /* Extract 128 bits from <Vm+1:Vm:Vn+1:Vn> */
         TCGv_i64 left, middle, right, destleft, destright;
@@ -2872,12 +2800,6 @@ static bool trans_VEXT(DisasContext *s, arg_VEXT *a)
 
         write_neon_element64(destright, a->vd, 0, MO_64);
         write_neon_element64(destleft, a->vd, 1, MO_64);
-
-        tcg_temp_free_i64(destright);
-        tcg_temp_free_i64(destleft);
-        tcg_temp_free_i64(right);
-        tcg_temp_free_i64(middle);
-        tcg_temp_free_i64(left);
     }
     return true;
 }
@@ -2921,9 +2843,6 @@ static bool trans_VTBL(DisasContext *s, arg_VTBL *a)
 
     gen_helper_neon_tbl(val, cpu_env, desc, val, def);
     write_neon_element64(val, a->vd, 0, MO_64);
-
-    tcg_temp_free_i64(def);
-    tcg_temp_free_i64(val);
     return true;
 }
 
@@ -3002,9 +2921,6 @@ static bool trans_VREV64(DisasContext *s, arg_VREV64 *a)
         write_neon_element32(tmp[1], a->vd, pass * 2, MO_32);
         write_neon_element32(tmp[0], a->vd, pass * 2 + 1, MO_32);
     }
-
-    tcg_temp_free_i32(tmp[0]);
-    tcg_temp_free_i32(tmp[1]);
     return true;
 }
 
@@ -3055,20 +2971,15 @@ static bool do_2misc_pairwise(DisasContext *s, arg_2misc *a,
         widenfn(rm0_64, tmp);
         read_neon_element32(tmp, a->vm, pass * 2 + 1, MO_32);
         widenfn(rm1_64, tmp);
-        tcg_temp_free_i32(tmp);
 
         opfn(rd_64, rm0_64, rm1_64);
-        tcg_temp_free_i64(rm0_64);
-        tcg_temp_free_i64(rm1_64);
 
         if (accfn) {
             TCGv_i64 tmp64 = tcg_temp_new_i64();
             read_neon_element64(tmp64, a->vd, pass, MO_64);
             accfn(rd_64, tmp64, rd_64);
-            tcg_temp_free_i64(tmp64);
         }
         write_neon_element64(rd_64, a->vd, pass, MO_64);
-        tcg_temp_free_i64(rd_64);
     }
     return true;
 }
@@ -3192,8 +3103,6 @@ static bool do_zip_uzp(DisasContext *s, arg_2misc *a,
     pd = vfp_reg_ptr(true, a->vd);
     pm = vfp_reg_ptr(true, a->vm);
     fn(pd, pm);
-    tcg_temp_free_ptr(pd);
-    tcg_temp_free_ptr(pm);
     return true;
 }
 
@@ -3271,9 +3180,6 @@ static bool do_vmovn(DisasContext *s, arg_2misc *a,
     narrowfn(rd1, cpu_env, rm);
     write_neon_element32(rd0, a->vd, 0, MO_32);
     write_neon_element32(rd1, a->vd, 1, MO_32);
-    tcg_temp_free_i32(rd0);
-    tcg_temp_free_i32(rd1);
-    tcg_temp_free_i64(rm);
     return true;
 }
 
@@ -3341,10 +3247,6 @@ static bool trans_VSHLL(DisasContext *s, arg_2misc *a)
     widenfn(rd, rm1);
     tcg_gen_shli_i64(rd, rd, 8 << a->size);
     write_neon_element64(rd, a->vd, 1, MO_64);
-
-    tcg_temp_free_i64(rd);
-    tcg_temp_free_i32(rm0);
-    tcg_temp_free_i32(rm1);
     return true;
 }
 
@@ -3385,11 +3287,6 @@ static bool trans_VCVT_B16_F32(DisasContext *s, arg_2misc *a)
 
     write_neon_element32(dst0, a->vd, 0, MO_32);
     write_neon_element32(dst1, a->vd, 1, MO_32);
-
-    tcg_temp_free_i64(tmp);
-    tcg_temp_free_i32(dst0);
-    tcg_temp_free_i32(dst1);
-    tcg_temp_free_ptr(fpst);
     return true;
 }
 
@@ -3432,16 +3329,10 @@ static bool trans_VCVT_F16_F32(DisasContext *s, arg_2misc *a)
     tmp3 = tcg_temp_new_i32();
     read_neon_element32(tmp3, a->vm, 3, MO_32);
     write_neon_element32(tmp2, a->vd, 0, MO_32);
-    tcg_temp_free_i32(tmp2);
     gen_helper_vfp_fcvt_f32_to_f16(tmp3, tmp3, fpst, ahp);
     tcg_gen_shli_i32(tmp3, tmp3, 16);
     tcg_gen_or_i32(tmp3, tmp3, tmp);
     write_neon_element32(tmp3, a->vd, 1, MO_32);
-    tcg_temp_free_i32(tmp3);
-    tcg_temp_free_i32(tmp);
-    tcg_temp_free_i32(ahp);
-    tcg_temp_free_ptr(fpst);
-
     return true;
 }
 
@@ -3482,18 +3373,12 @@ static bool trans_VCVT_F32_F16(DisasContext *s, arg_2misc *a)
     tcg_gen_shri_i32(tmp, tmp, 16);
     gen_helper_vfp_fcvt_f16_to_f32(tmp, tmp, fpst, ahp);
     write_neon_element32(tmp, a->vd, 1, MO_32);
-    tcg_temp_free_i32(tmp);
     tcg_gen_ext16u_i32(tmp3, tmp2);
     gen_helper_vfp_fcvt_f16_to_f32(tmp3, tmp3, fpst, ahp);
     write_neon_element32(tmp3, a->vd, 2, MO_32);
-    tcg_temp_free_i32(tmp3);
     tcg_gen_shri_i32(tmp2, tmp2, 16);
     gen_helper_vfp_fcvt_f16_to_f32(tmp2, tmp2, fpst, ahp);
     write_neon_element32(tmp2, a->vd, 3, MO_32);
-    tcg_temp_free_i32(tmp2);
-    tcg_temp_free_i32(ahp);
-    tcg_temp_free_ptr(fpst);
-
     return true;
 }
 
@@ -3628,8 +3513,6 @@ static bool do_2misc(DisasContext *s, arg_2misc *a, NeonGenOneOpFn *fn)
         fn(tmp, tmp);
         write_neon_element32(tmp, a->vd, pass, MO_32);
     }
-    tcg_temp_free_i32(tmp);
-
     return true;
 }
 
@@ -3790,7 +3673,6 @@ static bool trans_VQNEG(DisasContext *s, arg_2misc *a)
         fpst = fpstatus_ptr(vece == MO_16 ? FPST_STD_F16 : FPST_STD);   \
         tcg_gen_gvec_2_ptr(rd_ofs, rm_ofs, fpst, oprsz, maxsz, 0,       \
                            fns[vece]);                                  \
-        tcg_temp_free_ptr(fpst);                                        \
     }                                                                   \
     static bool trans_##INSN(DisasContext *s, arg_2misc *a)             \
     {                                                                   \
@@ -3841,7 +3723,6 @@ static bool trans_VRINTX(DisasContext *s, arg_2misc *a)
         fpst = fpstatus_ptr(vece == 1 ? FPST_STD_F16 : FPST_STD);       \
         tcg_gen_gvec_2_ptr(rd_ofs, rm_ofs, fpst, oprsz, maxsz,          \
                            arm_rmode_to_sf(RMODE), fns[vece]);          \
-        tcg_temp_free_ptr(fpst);                                        \
     }                                                                   \
     static bool trans_##INSN(DisasContext *s, arg_2misc *a)             \
     {                                                                   \
@@ -3908,11 +3789,9 @@ static bool trans_VSWP(DisasContext *s, arg_2misc *a)
         write_neon_element64(rm, a->vd, pass, MO_64);
         write_neon_element64(rd, a->vm, pass, MO_64);
     }
-    tcg_temp_free_i64(rm);
-    tcg_temp_free_i64(rd);
-
     return true;
 }
+
 static void gen_neon_trn_u8(TCGv_i32 t0, TCGv_i32 t1)
 {
     TCGv_i32 rd, tmp;
@@ -3930,9 +3809,6 @@ static void gen_neon_trn_u8(TCGv_i32 t0, TCGv_i32 t1)
     tcg_gen_andi_i32(tmp, t0, 0xff00ff00);
     tcg_gen_or_i32(t1, t1, tmp);
     tcg_gen_mov_i32(t0, rd);
-
-    tcg_temp_free_i32(tmp);
-    tcg_temp_free_i32(rd);
 }
 
 static void gen_neon_trn_u16(TCGv_i32 t0, TCGv_i32 t1)
@@ -3949,9 +3825,6 @@ static void gen_neon_trn_u16(TCGv_i32 t0, TCGv_i32 t1)
     tcg_gen_andi_i32(tmp, t0, 0xffff0000);
     tcg_gen_or_i32(t1, t1, tmp);
     tcg_gen_mov_i32(t0, rd);
-
-    tcg_temp_free_i32(tmp);
-    tcg_temp_free_i32(rd);
 }
 
 static bool trans_VTRN(DisasContext *s, arg_2misc *a)
@@ -4003,8 +3876,6 @@ static bool trans_VTRN(DisasContext *s, arg_2misc *a)
             write_neon_element32(tmp, a->vd, pass, MO_32);
         }
     }
-    tcg_temp_free_i32(tmp);
-    tcg_temp_free_i32(tmp2);
     return true;
 }
 
-- 
2.34.1


