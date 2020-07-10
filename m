Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jtsch-0006HZ-Ku
	for mharc-qemu-riscv@gnu.org; Fri, 10 Jul 2020 08:59:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jtqeY-0005kM-G2
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 06:53:14 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:42482)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jtqeS-0006pL-Rj
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 06:53:14 -0400
Received: by mail-pl1-x632.google.com with SMTP id q17so2094046pls.9
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2020 03:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=8b327ix3NdI+IyOCojftJRh9SEKGizCjfc1TFHjeQ9U=;
 b=VZwN9XJhn2jvr10USyXeZHHWHgYMbHDXDeFHg5W7XsHBUMv4+znEQxkPnGEfzw00QY
 2Zcc8IHMiTHphtYNQtbqbbAKSHMIo0en7RCjSH5dd2Iz4H9taW4bk2uhGczXKuYb+LmG
 RW6G2OlvvUjMyReFSFqT33gv0gXeaUJh28sNi+Kr58V84CbwCSuO9Pl9hxmWTMhvS9Fi
 9NaEONHm40e/+nIHPDcyDWnL0hHQxM4YSkFfYQkKdiuCzf96ultn5xthmCoA556zoSnp
 Uv+5BR2WErVTILp863lH6PKow5tsQVrFC4Jt7nCrJ0BIFRYrJCJrdZzslWbLA6okR8q4
 uRWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=8b327ix3NdI+IyOCojftJRh9SEKGizCjfc1TFHjeQ9U=;
 b=i0uA5hxpIKTxz8OyoLNPhdVRYPpht5RJs5ebKs4BVoRfvTMyrSRpAwetmfcCAWfERt
 XsHr25kn79Sqhf6Mx+ySl7LunByUVP+0NMafyzzIyjvhiOQUo++U1ibDXO5Q8RX8rFN/
 m1+73SdSbcqXQUFLq0YI3wi9BgBp//4/7URBWD2YS4EMm22r0RArl8UXOpWePChLDOXH
 toGUjGHrlXe3G/9p0dkjosnrxtVZ/kQlxTdPH/0/URaQbJUfmk14AEOqTbo4XepeRKxQ
 8xwwr1fwe06/8uu5rz3mXBRkW4zEl4DtL5WCLqD7WBTkhH/+/ZXvMvTf8YFWrqui4UzB
 1RUQ==
X-Gm-Message-State: AOAM530bwpVNtZmaWuLRwRj0cGfTfx8BwCa5d621TdphhoYYQQAinnwv
 NeeEKgRgUP0SVNdLGAhqRjwgIo06BLZVxg==
X-Google-Smtp-Source: ABdhPJyPjogd93mChuVAtAMQfFOM/unHlKDYHICNgocpfMYwf/PcHy2FAkywUJ5/PxpJo4fZf/CoxQ==
X-Received: by 2002:a17:902:b287:: with SMTP id
 u7mr48681577plr.107.1594378387492; 
 Fri, 10 Jul 2020 03:53:07 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id r191sm5519406pfr.181.2020.07.10.03.53.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 03:53:07 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC 38/65] target/riscv: rvv-0.9: integer merge and move instructions
Date: Fri, 10 Jul 2020 18:48:52 +0800
Message-Id: <20200710104920.13550-39-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200710104920.13550-1-frank.chang@sifive.com>
References: <20200710104920.13550-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x632.google.com
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
X-Mailman-Approved-At: Fri, 10 Jul 2020 08:59:01 -0400
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
X-List-Received-Date: Fri, 10 Jul 2020 10:53:14 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.inc.c | 179 ++++++++++++------------
 1 file changed, 90 insertions(+), 89 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index 89718fdbc7..53c8dce159 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -2008,121 +2008,122 @@ GEN_OPIVX_QUAD_WIDEN_TRANS(vqmacc_vx)
 GEN_OPIVX_QUAD_WIDEN_TRANS(vqmaccsu_vx)
 GEN_OPIVX_QUAD_WIDEN_TRANS(vqmaccus_vx)
 
+/* Vector Integer Move Instructions */
 static bool trans_vmv_v_v(DisasContext *s, arg_vmv_v_v *a)
 {
-    if (vext_check_isa_ill(s) &&
-        vext_check_reg(s, a->rd, false) &&
-        vext_check_reg(s, a->rs1, false)) {
+    REQUIRE_RVV;
+    VEXT_CHECK_ISA_ILL(s);
+    /* vmv.v.v has rs2 = 0 and vm = 1 */
+    VEXT_CHECK_SSS(s, a->rd, a->rs1, 0, 1, true);
 
-        if (s->vl_eq_vlmax) {
-            tcg_gen_gvec_mov(s->sew, vreg_ofs(s, a->rd),
-                             vreg_ofs(s, a->rs1),
-                             MAXSZ(s), MAXSZ(s));
-        } else {
-            uint32_t data = 0;
-            data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
-            data = FIELD_DP32(data, VDATA, VTA, s->vta);
-            static gen_helper_gvec_2_ptr * const fns[4] = {
-                gen_helper_vmv_v_v_b, gen_helper_vmv_v_v_h,
-                gen_helper_vmv_v_v_w, gen_helper_vmv_v_v_d,
-            };
-            TCGLabel *over = gen_new_label();
-            tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
+    if (s->vl_eq_vlmax) {
+        tcg_gen_gvec_mov(s->sew, vreg_ofs(s, a->rd),
+                         vreg_ofs(s, a->rs1),
+                         MAXSZ(s), MAXSZ(s));
+    } else {
+        uint32_t data = 0;
+        data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
+        data = FIELD_DP32(data, VDATA, VTA, s->vta);
+        static gen_helper_gvec_2_ptr * const fns[4] = {
+            gen_helper_vmv_v_v_b, gen_helper_vmv_v_v_h,
+            gen_helper_vmv_v_v_w, gen_helper_vmv_v_v_d,
+        };
+        TCGLabel *over = gen_new_label();
+        tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
 
-            tcg_gen_gvec_2_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, a->rs1),
-                               cpu_env, 0, s->vlen / 8, data, fns[s->sew]);
-            gen_set_label(over);
-        }
-        return true;
+        tcg_gen_gvec_2_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, a->rs1),
+                           cpu_env, 0, s->vlen / 8, data, fns[s->sew]);
+        gen_set_label(over);
     }
-    return false;
+    return true;
 }
 
 typedef void gen_helper_vmv_vx(TCGv_ptr, TCGv_i64, TCGv_env, TCGv_i32);
 static bool trans_vmv_v_x(DisasContext *s, arg_vmv_v_x *a)
 {
-    if (vext_check_isa_ill(s) &&
-        vext_check_reg(s, a->rd, false)) {
-
-        TCGv s1;
-        TCGLabel *over = gen_new_label();
-        tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
+    REQUIRE_RVV;
+    VEXT_CHECK_ISA_ILL(s);
+    /* vmv.v.x has rs2 = 0 and vm = 1 */
+    VEXT_CHECK_SSS(s, a->rd, a->rs1, 0, 1, false);
 
-        s1 = tcg_temp_new();
-        gen_get_gpr(s1, a->rs1);
+    TCGv s1;
+    TCGLabel *over = gen_new_label();
+    tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
 
-        if (s->vl_eq_vlmax) {
-            tcg_gen_gvec_dup_tl(s->sew, vreg_ofs(s, a->rd),
-                                MAXSZ(s), MAXSZ(s), s1);
-        } else {
-            TCGv_i32 desc ;
-            TCGv_i64 s1_i64 = tcg_temp_new_i64();
-            TCGv_ptr dest = tcg_temp_new_ptr();
-            uint32_t data = 0;
-            data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
-            data = FIELD_DP32(data, VDATA, VTA, s->vta);
-            static gen_helper_vmv_vx * const fns[4] = {
-                gen_helper_vmv_v_x_b, gen_helper_vmv_v_x_h,
-                gen_helper_vmv_v_x_w, gen_helper_vmv_v_x_d,
-            };
+    s1 = tcg_temp_new();
+    gen_get_gpr(s1, a->rs1);
 
-            tcg_gen_ext_tl_i64(s1_i64, s1);
-            desc = tcg_const_i32(simd_desc(0, s->vlen / 8, data));
-            tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, a->rd));
-            fns[s->sew](dest, s1_i64, cpu_env, desc);
+    if (s->vl_eq_vlmax) {
+        tcg_gen_gvec_dup_tl(s->sew, vreg_ofs(s, a->rd),
+                            MAXSZ(s), MAXSZ(s), s1);
+    } else {
+        TCGv_i32 desc ;
+        TCGv_i64 s1_i64 = tcg_temp_new_i64();
+        TCGv_ptr dest = tcg_temp_new_ptr();
+        uint32_t data = 0;
+        data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
+        data = FIELD_DP32(data, VDATA, VTA, s->vta);
+        static gen_helper_vmv_vx * const fns[4] = {
+            gen_helper_vmv_v_x_b, gen_helper_vmv_v_x_h,
+            gen_helper_vmv_v_x_w, gen_helper_vmv_v_x_d,
+        };
 
-            tcg_temp_free_ptr(dest);
-            tcg_temp_free_i32(desc);
-            tcg_temp_free_i64(s1_i64);
-        }
+        tcg_gen_ext_tl_i64(s1_i64, s1);
+        desc = tcg_const_i32(simd_desc(0, s->vlen / 8, data));
+        tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, a->rd));
+        fns[s->sew](dest, s1_i64, cpu_env, desc);
 
-        tcg_temp_free(s1);
-        gen_set_label(over);
-        return true;
+        tcg_temp_free_ptr(dest);
+        tcg_temp_free_i32(desc);
+        tcg_temp_free_i64(s1_i64);
     }
-    return false;
+
+    tcg_temp_free(s1);
+    gen_set_label(over);
+    return true;
 }
 
 static bool trans_vmv_v_i(DisasContext *s, arg_vmv_v_i *a)
 {
-    if (vext_check_isa_ill(s) &&
-        vext_check_reg(s, a->rd, false)) {
+    REQUIRE_RVV;
+    VEXT_CHECK_ISA_ILL(s);
+    /* vmv.v.i has rs2 = 0 and vm = 1 */
+    VEXT_CHECK_SSS(s, a->rd, a->rs1, 0, 1, false);
 
-        int64_t simm = sextract64(a->rs1, 0, 5);
-        if (s->vl_eq_vlmax) {
-            tcg_gen_gvec_dup_imm(s->sew, vreg_ofs(s, a->rd),
-                                 MAXSZ(s), MAXSZ(s), simm);
-        } else {
-            TCGv_i32 desc;
-            TCGv_i64 s1;
-            TCGv_ptr dest;
-            uint32_t data = 0;
-            data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
-            data = FIELD_DP32(data, VDATA, VTA, s->vta);
-            data = FIELD_DP32(data, VDATA, VMA, s->vma);
-            static gen_helper_vmv_vx * const fns[4] = {
-                gen_helper_vmv_v_x_b, gen_helper_vmv_v_x_h,
-                gen_helper_vmv_v_x_w, gen_helper_vmv_v_x_d,
-            };
-            TCGLabel *over = gen_new_label();
-            tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
+    int64_t simm = sextract64(a->rs1, 0, 5);
+    if (s->vl_eq_vlmax) {
+        tcg_gen_gvec_dup_imm(s->sew, vreg_ofs(s, a->rd),
+                             MAXSZ(s), MAXSZ(s), simm);
+    } else {
+        TCGv_i32 desc;
+        TCGv_i64 s1;
+        TCGv_ptr dest;
+        uint32_t data = 0;
+        data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
+        data = FIELD_DP32(data, VDATA, VTA, s->vta);
+        data = FIELD_DP32(data, VDATA, VMA, s->vma);
+        static gen_helper_vmv_vx * const fns[4] = {
+            gen_helper_vmv_v_x_b, gen_helper_vmv_v_x_h,
+            gen_helper_vmv_v_x_w, gen_helper_vmv_v_x_d,
+        };
+        TCGLabel *over = gen_new_label();
+        tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
 
-            s1 = tcg_const_i64(simm);
-            dest = tcg_temp_new_ptr();
-            desc = tcg_const_i32(simd_desc(0, s->vlen / 8, data));
-            tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, a->rd));
-            fns[s->sew](dest, s1, cpu_env, desc);
+        s1 = tcg_const_i64(simm);
+        dest = tcg_temp_new_ptr();
+        desc = tcg_const_i32(simd_desc(0, s->vlen / 8, data));
+        tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, a->rd));
+        fns[s->sew](dest, s1, cpu_env, desc);
 
-            tcg_temp_free_ptr(dest);
-            tcg_temp_free_i32(desc);
-            tcg_temp_free_i64(s1);
-            gen_set_label(over);
-        }
-        return true;
+        tcg_temp_free_ptr(dest);
+        tcg_temp_free_i32(desc);
+        tcg_temp_free_i64(s1);
+        gen_set_label(over);
     }
-    return false;
+    return true;
 }
 
+/* Vector Integer Merge Instructions */
 GEN_OPIVV_TRANS(vmerge_vvm, opivv_vadc_check)
 GEN_OPIVX_TRANS(vmerge_vxm, opivx_vadc_check)
 GEN_OPIVI_TRANS(vmerge_vim, 0, vmerge_vxm, opivx_vadc_check)
-- 
2.17.1


