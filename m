Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWW6u-0008Vq-Dh
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:31:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW68-0003la-33
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:30:52 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW63-0000TY-6k
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:30:50 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 m3-20020a17090ade0300b00229eec90a7fso10974680pjv.0
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4XDSHp976q3ldZEMYXzcr3v5jLdzfHZFYRB55lHaBF0=;
 b=HOJG1IOzgvSNdIeIngi+hWV1GcbuJfZ3FBz6ZaYWXs33ByBOo/60NaXjvpQyXQP7EF
 upVGDhM1Si46u5En4fejvbHkGKdBogK2H6Vz3yxglE99I0pBrwWbQ1Wg7PLmjnws6UDg
 LN9Ci8tp4opGT82+0csFVxI67vL1bF3a5njZMYMVvlPX96Z5jfrTdz8X0muxVlFAQQC8
 n1ktpU5Nu3VpJi/T+0w8s5hifISEHDvRHxvYAVJq4HNn9lo+6ImljIH0/g9hpHD0mGyG
 n70vQ4UkXi8BpkZStE9kOd8FT6Dy67fq12wbxKm3D8DASjpGPdqAsT7B9GUC0Sk5rMbo
 cfJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4XDSHp976q3ldZEMYXzcr3v5jLdzfHZFYRB55lHaBF0=;
 b=1ht7Dn8TkUQxiLVhEKzk3EwhP8OwNvtdIWDu71BWF9aofOHPP/LVR67HcTk5TNXGGo
 kLymNajDqASd3tuYp152nkQOd/n7lEQqpb+tOOA5TA/ulbbfmryE9VXXOATWGOCHXva5
 x4G22LUuJ97BwHRS3B+Kh9zVG5VYRcvSbox1RFWUI+nVDOQB8J8AnEQmPPK2UDiyLT7L
 GHTuen4fJFqW7lxoK83HXRiDk/79TnoW1suurN45r2oW2KbnlS67iY86SRVUT8jrNvD8
 9M3WkKF9rsN7UbHpSdsaixuxh56gF71fjWmFWJLROSw4rgnYOy8KwmmjwYtKnY+y2fYA
 tlkg==
X-Gm-Message-State: AO0yUKXeAmnGaml6LU7MVOTLITPEHSNHpcPaeK8/3OwNm/ir1+dOom5a
 /4jDoqqRW1avI7dN7QvmuOgGqg==
X-Google-Smtp-Source: AK7set/oaU5PPt6F6CXtvU9AFE8oi6g+DSnuBqYJuYkvTNokrfzGA9tfH0XIRbmkvaYn+zuDei8TsA==
X-Received: by 2002:a17:90b:1a84:b0:230:bca9:2f7c with SMTP id
 ng4-20020a17090b1a8400b00230bca92f7cmr8452951pjb.2.1677475845047; 
 Sun, 26 Feb 2023 21:30:45 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 v4-20020a17090a520400b002369e16b276sm5172926pjh.32.2023.02.26.21.30.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:30:44 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com, Ilya Leoshkevich <iii@linux.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v2 55/76] target/s390x: Use tcg_constant_* in local contexts
Date: Sun, 26 Feb 2023 19:24:44 -1000
Message-Id: <20230227052505.352889-56-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227052505.352889-1-richard.henderson@linaro.org>
References: <20230227052505.352889-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
X-List-Received-Date: Mon, 27 Feb 2023 05:30:55 -0000

Replace tcg_const_* with tcg_constant_* in contexts
where the free to remove is nearby.

Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate.c | 410 +++++++++++++----------------------
 1 file changed, 147 insertions(+), 263 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 339c1672e9..3e3f685451 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -171,8 +171,6 @@ static uint64_t inline_branch_miss[CC_OP_MAX];
 
 static void pc_to_link_info(TCGv_i64 out, DisasContext *s, uint64_t pc)
 {
-    TCGv_i64 tmp;
-
     if (s->base.tb->flags & FLAG_MASK_32) {
         if (s->base.tb->flags & FLAG_MASK_64) {
             tcg_gen_movi_i64(out, pc);
@@ -181,9 +179,7 @@ static void pc_to_link_info(TCGv_i64 out, DisasContext *s, uint64_t pc)
         pc |= 0x80000000;
     }
     assert(!(s->base.tb->flags & FLAG_MASK_64));
-    tmp = tcg_const_i64(pc);
-    tcg_gen_deposit_i64(out, out, tmp, 0, 32);
-    tcg_temp_free_i64(tmp);
+    tcg_gen_deposit_i64(out, out, tcg_constant_i64(pc), 0, 32);
 }
 
 static TCGv_i64 psw_addr;
@@ -360,11 +356,8 @@ static void per_branch(DisasContext *s, bool to_next)
     tcg_gen_movi_i64(gbea, s->base.pc_next);
 
     if (s->base.tb->flags & FLAG_MASK_PER) {
-        TCGv_i64 next_pc = to_next ? tcg_const_i64(s->pc_tmp) : psw_addr;
+        TCGv_i64 next_pc = to_next ? tcg_constant_i64(s->pc_tmp) : psw_addr;
         gen_helper_per_branch(cpu_env, gbea, next_pc);
-        if (to_next) {
-            tcg_temp_free_i64(next_pc);
-        }
     }
 #endif
 }
@@ -382,9 +375,8 @@ static void per_branch_cond(DisasContext *s, TCGCond cond,
 
         gen_set_label(lab);
     } else {
-        TCGv_i64 pc = tcg_const_i64(s->base.pc_next);
+        TCGv_i64 pc = tcg_constant_i64(s->base.pc_next);
         tcg_gen_movcond_i64(cond, gbea, arg1, arg2, gbea, pc);
-        tcg_temp_free_i64(pc);
     }
 #endif
 }
@@ -438,23 +430,17 @@ static int get_mem_index(DisasContext *s)
 
 static void gen_exception(int excp)
 {
-    TCGv_i32 tmp = tcg_const_i32(excp);
-    gen_helper_exception(cpu_env, tmp);
-    tcg_temp_free_i32(tmp);
+    gen_helper_exception(cpu_env, tcg_constant_i32(excp));
 }
 
 static void gen_program_exception(DisasContext *s, int code)
 {
-    TCGv_i32 tmp;
+    /* Remember what pgm exeption this was.  */
+    tcg_gen_st_i32(tcg_constant_i32(code), cpu_env,
+                   offsetof(CPUS390XState, int_pgm_code));
 
-    /* Remember what pgm exception this was.  */
-    tmp = tcg_const_i32(code);
-    tcg_gen_st_i32(tmp, cpu_env, offsetof(CPUS390XState, int_pgm_code));
-    tcg_temp_free_i32(tmp);
-
-    tmp = tcg_const_i32(s->ilen);
-    tcg_gen_st_i32(tmp, cpu_env, offsetof(CPUS390XState, int_pgm_ilen));
-    tcg_temp_free_i32(tmp);
+    tcg_gen_st_i32(tcg_constant_i32(s->ilen), cpu_env,
+                   offsetof(CPUS390XState, int_pgm_ilen));
 
     /* update the psw */
     update_psw_addr(s);
@@ -473,9 +459,7 @@ static inline void gen_illegal_opcode(DisasContext *s)
 
 static inline void gen_data_exception(uint8_t dxc)
 {
-    TCGv_i32 tmp = tcg_const_i32(dxc);
-    gen_helper_data_exception(cpu_env, tmp);
-    tcg_temp_free_i32(tmp);
+    gen_helper_data_exception(cpu_env, tcg_constant_i32(dxc));
 }
 
 static inline void gen_trap(DisasContext *s)
@@ -596,13 +580,13 @@ static void gen_op_calc_cc(DisasContext *s)
 
     switch (s->cc_op) {
     default:
-        dummy = tcg_const_i64(0);
+        dummy = tcg_constant_i64(0);
         /* FALLTHRU */
     case CC_OP_ADD_64:
     case CC_OP_SUB_64:
     case CC_OP_ADD_32:
     case CC_OP_SUB_32:
-        local_cc_op = tcg_const_i32(s->cc_op);
+        local_cc_op = tcg_constant_i32(s->cc_op);
         break;
     case CC_OP_CONST0:
     case CC_OP_CONST1:
@@ -675,13 +659,6 @@ static void gen_op_calc_cc(DisasContext *s)
         tcg_abort();
     }
 
-    if (local_cc_op) {
-        tcg_temp_free_i32(local_cc_op);
-    }
-    if (dummy) {
-        tcg_temp_free_i64(dummy);
-    }
-
     /* We now have cc in cc_op as constant */
     set_cc_static(s);
 }
@@ -1300,9 +1277,9 @@ static DisasJumpType help_branch(DisasContext *s, DisasCompare *c,
            Most commonly we're single-stepping or some other condition that
            disables all use of goto_tb.  Just update the PC and exit.  */
 
-        TCGv_i64 next = tcg_const_i64(s->pc_tmp);
+        TCGv_i64 next = tcg_constant_i64(s->pc_tmp);
         if (is_imm) {
-            cdest = tcg_const_i64(dest);
+            cdest = tcg_constant_i64(dest);
         }
 
         if (c->is_64) {
@@ -1312,21 +1289,15 @@ static DisasJumpType help_branch(DisasContext *s, DisasCompare *c,
         } else {
             TCGv_i32 t0 = tcg_temp_new_i32();
             TCGv_i64 t1 = tcg_temp_new_i64();
-            TCGv_i64 z = tcg_const_i64(0);
+            TCGv_i64 z = tcg_constant_i64(0);
             tcg_gen_setcond_i32(c->cond, t0, c->u.s32.a, c->u.s32.b);
             tcg_gen_extu_i32_i64(t1, t0);
             tcg_temp_free_i32(t0);
             tcg_gen_movcond_i64(TCG_COND_NE, psw_addr, t1, z, cdest, next);
             per_branch_cond(s, TCG_COND_NE, t1, z);
             tcg_temp_free_i64(t1);
-            tcg_temp_free_i64(z);
         }
 
-        if (is_imm) {
-            tcg_temp_free_i64(cdest);
-        }
-        tcg_temp_free_i64(next);
-
         ret = DISAS_PC_UPDATED;
     }
 
@@ -1410,10 +1381,9 @@ static DisasJumpType op_addc64(DisasContext *s, DisasOps *o)
 {
     compute_carry(s);
 
-    TCGv_i64 zero = tcg_const_i64(0);
+    TCGv_i64 zero = tcg_constant_i64(0);
     tcg_gen_add2_i64(o->out, cc_src, o->in1, zero, cc_src, zero);
     tcg_gen_add2_i64(o->out, cc_src, o->out, cc_src, o->in2, zero);
-    tcg_temp_free_i64(zero);
 
     return DISAS_NEXT;
 }
@@ -2092,9 +2062,8 @@ static DisasJumpType op_clc(DisasContext *s, DisasOps *o)
         tcg_gen_qemu_ld64(cc_dst, o->in2, get_mem_index(s));
         break;
     default:
-        vl = tcg_const_i32(l);
+        vl = tcg_constant_i32(l);
         gen_helper_clc(cc_op, cpu_env, vl, o->addr1, o->in2);
-        tcg_temp_free_i32(vl);
         set_cc_static(s);
         return DISAS_NEXT;
     }
@@ -2114,11 +2083,9 @@ static DisasJumpType op_clcl(DisasContext *s, DisasOps *o)
         return DISAS_NORETURN;
     }
 
-    t1 = tcg_const_i32(r1);
-    t2 = tcg_const_i32(r2);
+    t1 = tcg_constant_i32(r1);
+    t2 = tcg_constant_i32(r2);
     gen_helper_clcl(cc_op, cpu_env, t1, t2);
-    tcg_temp_free_i32(t1);
-    tcg_temp_free_i32(t2);
     set_cc_static(s);
     return DISAS_NEXT;
 }
@@ -2135,11 +2102,9 @@ static DisasJumpType op_clcle(DisasContext *s, DisasOps *o)
         return DISAS_NORETURN;
     }
 
-    t1 = tcg_const_i32(r1);
-    t3 = tcg_const_i32(r3);
+    t1 = tcg_constant_i32(r1);
+    t3 = tcg_constant_i32(r3);
     gen_helper_clcle(cc_op, cpu_env, t1, o->in2, t3);
-    tcg_temp_free_i32(t1);
-    tcg_temp_free_i32(t3);
     set_cc_static(s);
     return DISAS_NEXT;
 }
@@ -2156,24 +2121,22 @@ static DisasJumpType op_clclu(DisasContext *s, DisasOps *o)
         return DISAS_NORETURN;
     }
 
-    t1 = tcg_const_i32(r1);
-    t3 = tcg_const_i32(r3);
+    t1 = tcg_constant_i32(r1);
+    t3 = tcg_constant_i32(r3);
     gen_helper_clclu(cc_op, cpu_env, t1, o->in2, t3);
-    tcg_temp_free_i32(t1);
-    tcg_temp_free_i32(t3);
     set_cc_static(s);
     return DISAS_NEXT;
 }
 
 static DisasJumpType op_clm(DisasContext *s, DisasOps *o)
 {
-    TCGv_i32 m3 = tcg_const_i32(get_field(s, m3));
+    TCGv_i32 m3 = tcg_constant_i32(get_field(s, m3));
     TCGv_i32 t1 = tcg_temp_new_i32();
+
     tcg_gen_extrl_i64_i32(t1, o->in1);
     gen_helper_clm(cc_op, cpu_env, t1, m3, o->in2);
     set_cc_static(s);
     tcg_temp_free_i32(t1);
-    tcg_temp_free_i32(m3);
     return DISAS_NEXT;
 }
 
@@ -2251,14 +2214,13 @@ static DisasJumpType op_cdsg(DisasContext *s, DisasOps *o)
 static DisasJumpType op_csst(DisasContext *s, DisasOps *o)
 {
     int r3 = get_field(s, r3);
-    TCGv_i32 t_r3 = tcg_const_i32(r3);
+    TCGv_i32 t_r3 = tcg_constant_i32(r3);
 
     if (tb_cflags(s->base.tb) & CF_PARALLEL) {
         gen_helper_csst_parallel(cc_op, cpu_env, t_r3, o->addr1, o->in2);
     } else {
         gen_helper_csst(cc_op, cpu_env, t_r3, o->addr1, o->in2);
     }
-    tcg_temp_free_i32(t_r3);
 
     set_cc_static(s);
     return DISAS_NEXT;
@@ -2356,9 +2318,9 @@ static DisasJumpType op_cuXX(DisasContext *s, DisasOps *o)
         m3 = 0;
     }
 
-    tr1 = tcg_const_i32(r1);
-    tr2 = tcg_const_i32(r2);
-    chk = tcg_const_i32(m3);
+    tr1 = tcg_constant_i32(r1);
+    tr2 = tcg_constant_i32(r2);
+    chk = tcg_constant_i32(m3);
 
     switch (s->insn->data) {
     case 12:
@@ -2383,9 +2345,6 @@ static DisasJumpType op_cuXX(DisasContext *s, DisasOps *o)
         g_assert_not_reached();
     }
 
-    tcg_temp_free_i32(tr1);
-    tcg_temp_free_i32(tr2);
-    tcg_temp_free_i32(chk);
     set_cc_static(s);
     return DISAS_NEXT;
 }
@@ -2393,15 +2352,11 @@ static DisasJumpType op_cuXX(DisasContext *s, DisasOps *o)
 #ifndef CONFIG_USER_ONLY
 static DisasJumpType op_diag(DisasContext *s, DisasOps *o)
 {
-    TCGv_i32 r1 = tcg_const_i32(get_field(s, r1));
-    TCGv_i32 r3 = tcg_const_i32(get_field(s, r3));
-    TCGv_i32 func_code = tcg_const_i32(get_field(s, i2));
+    TCGv_i32 r1 = tcg_constant_i32(get_field(s, r1));
+    TCGv_i32 r3 = tcg_constant_i32(get_field(s, r3));
+    TCGv_i32 func_code = tcg_constant_i32(get_field(s, i2));
 
     gen_helper_diag(cpu_env, r1, r3, func_code);
-
-    tcg_temp_free_i32(func_code);
-    tcg_temp_free_i32(r3);
-    tcg_temp_free_i32(r1);
     return DISAS_NEXT;
 }
 #endif
@@ -2512,18 +2467,13 @@ static DisasJumpType op_ex(DisasContext *s, DisasOps *o)
     update_cc_op(s);
 
     if (r1 == 0) {
-        v1 = tcg_const_i64(0);
+        v1 = tcg_constant_i64(0);
     } else {
         v1 = regs[r1];
     }
 
-    ilen = tcg_const_i32(s->ilen);
+    ilen = tcg_constant_i32(s->ilen);
     gen_helper_ex(cpu_env, ilen, v1, o->in2);
-    tcg_temp_free_i32(ilen);
-
-    if (r1 == 0) {
-        tcg_temp_free_i64(v1);
-    }
 
     return DISAS_PC_CC_UPDATED;
 }
@@ -2674,12 +2624,11 @@ static DisasJumpType op_idte(DisasContext *s, DisasOps *o)
     TCGv_i32 m4;
 
     if (s390_has_feat(S390_FEAT_LOCAL_TLB_CLEARING)) {
-        m4 = tcg_const_i32(get_field(s, m4));
+        m4 = tcg_constant_i32(get_field(s, m4));
     } else {
-        m4 = tcg_const_i32(0);
+        m4 = tcg_constant_i32(0);
     }
     gen_helper_idte(cpu_env, o->in1, o->in2, m4);
-    tcg_temp_free_i32(m4);
     return DISAS_NEXT;
 }
 
@@ -2688,12 +2637,11 @@ static DisasJumpType op_ipte(DisasContext *s, DisasOps *o)
     TCGv_i32 m4;
 
     if (s390_has_feat(S390_FEAT_LOCAL_TLB_CLEARING)) {
-        m4 = tcg_const_i32(get_field(s, m4));
+        m4 = tcg_constant_i32(get_field(s, m4));
     } else {
-        m4 = tcg_const_i32(0);
+        m4 = tcg_constant_i32(0);
     }
     gen_helper_ipte(cpu_env, o->in1, o->in2, m4);
-    tcg_temp_free_i32(m4);
     return DISAS_NEXT;
 }
 
@@ -2749,16 +2697,12 @@ static DisasJumpType op_msa(DisasContext *s, DisasOps *o)
         g_assert_not_reached();
     };
 
-    t_r1 = tcg_const_i32(r1);
-    t_r2 = tcg_const_i32(r2);
-    t_r3 = tcg_const_i32(r3);
-    type = tcg_const_i32(s->insn->data);
+    t_r1 = tcg_constant_i32(r1);
+    t_r2 = tcg_constant_i32(r2);
+    t_r3 = tcg_constant_i32(r3);
+    type = tcg_constant_i32(s->insn->data);
     gen_helper_msa(cc_op, cpu_env, t_r1, t_r2, t_r3, type);
     set_cc_static(s);
-    tcg_temp_free_i32(t_r1);
-    tcg_temp_free_i32(t_r2);
-    tcg_temp_free_i32(t_r3);
-    tcg_temp_free_i32(type);
     return DISAS_NEXT;
 }
 
@@ -3017,10 +2961,9 @@ static DisasJumpType op_loc(DisasContext *s, DisasOps *o)
         tcg_gen_extu_i32_i64(t, t32);
         tcg_temp_free_i32(t32);
 
-        z = tcg_const_i64(0);
+        z = tcg_constant_i64(0);
         tcg_gen_movcond_i64(TCG_COND_NE, o->out, t, z, o->in2, o->in1);
         tcg_temp_free_i64(t);
-        tcg_temp_free_i64(z);
     }
 
     return DISAS_NEXT;
@@ -3029,11 +2972,10 @@ static DisasJumpType op_loc(DisasContext *s, DisasOps *o)
 #ifndef CONFIG_USER_ONLY
 static DisasJumpType op_lctl(DisasContext *s, DisasOps *o)
 {
-    TCGv_i32 r1 = tcg_const_i32(get_field(s, r1));
-    TCGv_i32 r3 = tcg_const_i32(get_field(s, r3));
+    TCGv_i32 r1 = tcg_constant_i32(get_field(s, r1));
+    TCGv_i32 r3 = tcg_constant_i32(get_field(s, r3));
+
     gen_helper_lctl(cpu_env, r1, o->in2, r3);
-    tcg_temp_free_i32(r1);
-    tcg_temp_free_i32(r3);
     /* Exit to main loop to reevaluate s390_cpu_exec_interrupt.  */
     s->exit_to_mainloop = true;
     return DISAS_TOO_MANY;
@@ -3041,11 +2983,10 @@ static DisasJumpType op_lctl(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_lctlg(DisasContext *s, DisasOps *o)
 {
-    TCGv_i32 r1 = tcg_const_i32(get_field(s, r1));
-    TCGv_i32 r3 = tcg_const_i32(get_field(s, r3));
+    TCGv_i32 r1 = tcg_constant_i32(get_field(s, r1));
+    TCGv_i32 r3 = tcg_constant_i32(get_field(s, r3));
+
     gen_helper_lctlg(cpu_env, r1, o->in2, r3);
-    tcg_temp_free_i32(r1);
-    tcg_temp_free_i32(r3);
     /* Exit to main loop to reevaluate s390_cpu_exec_interrupt.  */
     s->exit_to_mainloop = true;
     return DISAS_TOO_MANY;
@@ -3105,11 +3046,10 @@ static DisasJumpType op_lpswe(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_lam(DisasContext *s, DisasOps *o)
 {
-    TCGv_i32 r1 = tcg_const_i32(get_field(s, r1));
-    TCGv_i32 r3 = tcg_const_i32(get_field(s, r3));
+    TCGv_i32 r1 = tcg_constant_i32(get_field(s, r1));
+    TCGv_i32 r3 = tcg_constant_i32(get_field(s, r3));
+
     gen_helper_lam(cpu_env, r1, o->in2, r3);
-    tcg_temp_free_i32(r1);
-    tcg_temp_free_i32(r3);
     return DISAS_NEXT;
 }
 
@@ -3319,9 +3259,6 @@ static DisasJumpType op_lcbb(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_mc(DisasContext *s, DisasOps *o)
 {
-#if !defined(CONFIG_USER_ONLY)
-    TCGv_i32 i2;
-#endif
     const uint16_t monitor_class = get_field(s, i2);
 
     if (monitor_class & 0xff00) {
@@ -3330,9 +3267,8 @@ static DisasJumpType op_mc(DisasContext *s, DisasOps *o)
     }
 
 #if !defined(CONFIG_USER_ONLY)
-    i2 = tcg_const_i32(monitor_class);
-    gen_helper_monitor_call(cpu_env, o->addr1, i2);
-    tcg_temp_free_i32(i2);
+    gen_helper_monitor_call(cpu_env, o->addr1,
+                            tcg_constant_i32(monitor_class));
 #endif
     /* Defaults to a NOP. */
     return DISAS_NEXT;
@@ -3396,9 +3332,9 @@ static DisasJumpType op_movx(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_mvc(DisasContext *s, DisasOps *o)
 {
-    TCGv_i32 l = tcg_const_i32(get_field(s, l1));
+    TCGv_i32 l = tcg_constant_i32(get_field(s, l1));
+
     gen_helper_mvc(cpu_env, l, o->addr1, o->in2);
-    tcg_temp_free_i32(l);
     return DISAS_NEXT;
 }
 
@@ -3410,9 +3346,9 @@ static DisasJumpType op_mvcrl(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_mvcin(DisasContext *s, DisasOps *o)
 {
-    TCGv_i32 l = tcg_const_i32(get_field(s, l1));
+    TCGv_i32 l = tcg_constant_i32(get_field(s, l1));
+
     gen_helper_mvcin(cpu_env, l, o->addr1, o->in2);
-    tcg_temp_free_i32(l);
     return DISAS_NEXT;
 }
 
@@ -3428,11 +3364,9 @@ static DisasJumpType op_mvcl(DisasContext *s, DisasOps *o)
         return DISAS_NORETURN;
     }
 
-    t1 = tcg_const_i32(r1);
-    t2 = tcg_const_i32(r2);
+    t1 = tcg_constant_i32(r1);
+    t2 = tcg_constant_i32(r2);
     gen_helper_mvcl(cc_op, cpu_env, t1, t2);
-    tcg_temp_free_i32(t1);
-    tcg_temp_free_i32(t2);
     set_cc_static(s);
     return DISAS_NEXT;
 }
@@ -3449,11 +3383,9 @@ static DisasJumpType op_mvcle(DisasContext *s, DisasOps *o)
         return DISAS_NORETURN;
     }
 
-    t1 = tcg_const_i32(r1);
-    t3 = tcg_const_i32(r3);
+    t1 = tcg_constant_i32(r1);
+    t3 = tcg_constant_i32(r3);
     gen_helper_mvcle(cc_op, cpu_env, t1, o->in2, t3);
-    tcg_temp_free_i32(t1);
-    tcg_temp_free_i32(t3);
     set_cc_static(s);
     return DISAS_NEXT;
 }
@@ -3470,11 +3402,9 @@ static DisasJumpType op_mvclu(DisasContext *s, DisasOps *o)
         return DISAS_NORETURN;
     }
 
-    t1 = tcg_const_i32(r1);
-    t3 = tcg_const_i32(r3);
+    t1 = tcg_constant_i32(r1);
+    t3 = tcg_constant_i32(r3);
     gen_helper_mvclu(cc_op, cpu_env, t1, o->in2, t3);
-    tcg_temp_free_i32(t1);
-    tcg_temp_free_i32(t3);
     set_cc_static(s);
     return DISAS_NEXT;
 }
@@ -3509,49 +3439,45 @@ static DisasJumpType op_mvcs(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_mvn(DisasContext *s, DisasOps *o)
 {
-    TCGv_i32 l = tcg_const_i32(get_field(s, l1));
+    TCGv_i32 l = tcg_constant_i32(get_field(s, l1));
+
     gen_helper_mvn(cpu_env, l, o->addr1, o->in2);
-    tcg_temp_free_i32(l);
     return DISAS_NEXT;
 }
 
 static DisasJumpType op_mvo(DisasContext *s, DisasOps *o)
 {
-    TCGv_i32 l = tcg_const_i32(get_field(s, l1));
+    TCGv_i32 l = tcg_constant_i32(get_field(s, l1));
+
     gen_helper_mvo(cpu_env, l, o->addr1, o->in2);
-    tcg_temp_free_i32(l);
     return DISAS_NEXT;
 }
 
 static DisasJumpType op_mvpg(DisasContext *s, DisasOps *o)
 {
-    TCGv_i32 t1 = tcg_const_i32(get_field(s, r1));
-    TCGv_i32 t2 = tcg_const_i32(get_field(s, r2));
+    TCGv_i32 t1 = tcg_constant_i32(get_field(s, r1));
+    TCGv_i32 t2 = tcg_constant_i32(get_field(s, r2));
 
     gen_helper_mvpg(cc_op, cpu_env, regs[0], t1, t2);
-    tcg_temp_free_i32(t1);
-    tcg_temp_free_i32(t2);
     set_cc_static(s);
     return DISAS_NEXT;
 }
 
 static DisasJumpType op_mvst(DisasContext *s, DisasOps *o)
 {
-    TCGv_i32 t1 = tcg_const_i32(get_field(s, r1));
-    TCGv_i32 t2 = tcg_const_i32(get_field(s, r2));
+    TCGv_i32 t1 = tcg_constant_i32(get_field(s, r1));
+    TCGv_i32 t2 = tcg_constant_i32(get_field(s, r2));
 
     gen_helper_mvst(cc_op, cpu_env, t1, t2);
-    tcg_temp_free_i32(t1);
-    tcg_temp_free_i32(t2);
     set_cc_static(s);
     return DISAS_NEXT;
 }
 
 static DisasJumpType op_mvz(DisasContext *s, DisasOps *o)
 {
-    TCGv_i32 l = tcg_const_i32(get_field(s, l1));
+    TCGv_i32 l = tcg_constant_i32(get_field(s, l1));
+
     gen_helper_mvz(cpu_env, l, o->addr1, o->in2);
-    tcg_temp_free_i32(l);
     return DISAS_NEXT;
 }
 
@@ -3637,13 +3563,12 @@ static DisasJumpType op_msdb(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_nabs(DisasContext *s, DisasOps *o)
 {
-    TCGv_i64 z, n;
-    z = tcg_const_i64(0);
-    n = tcg_temp_new_i64();
+    TCGv_i64 z = tcg_constant_i64(0);
+    TCGv_i64 n = tcg_temp_new_i64();
+
     tcg_gen_neg_i64(n, o->in2);
     tcg_gen_movcond_i64(TCG_COND_GE, o->out, o->in2, z, n, o->in2);
     tcg_temp_free_i64(n);
-    tcg_temp_free_i64(z);
     return DISAS_NEXT;
 }
 
@@ -3668,9 +3593,9 @@ static DisasJumpType op_nabsf128(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_nc(DisasContext *s, DisasOps *o)
 {
-    TCGv_i32 l = tcg_const_i32(get_field(s, l1));
+    TCGv_i32 l = tcg_constant_i32(get_field(s, l1));
+
     gen_helper_nc(cc_op, cpu_env, l, o->addr1, o->in2);
-    tcg_temp_free_i32(l);
     set_cc_static(s);
     return DISAS_NEXT;
 }
@@ -3702,9 +3627,9 @@ static DisasJumpType op_negf128(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_oc(DisasContext *s, DisasOps *o)
 {
-    TCGv_i32 l = tcg_const_i32(get_field(s, l1));
+    TCGv_i32 l = tcg_constant_i32(get_field(s, l1));
+
     gen_helper_oc(cc_op, cpu_env, l, o->addr1, o->in2);
-    tcg_temp_free_i32(l);
     set_cc_static(s);
     return DISAS_NEXT;
 }
@@ -3754,9 +3679,9 @@ static DisasJumpType op_oi(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_pack(DisasContext *s, DisasOps *o)
 {
-    TCGv_i32 l = tcg_const_i32(get_field(s, l1));
+    TCGv_i32 l = tcg_constant_i32(get_field(s, l1));
+
     gen_helper_pack(cpu_env, l, o->addr1, o->in2);
-    tcg_temp_free_i32(l);
     return DISAS_NEXT;
 }
 
@@ -3770,9 +3695,8 @@ static DisasJumpType op_pka(DisasContext *s, DisasOps *o)
         gen_program_exception(s, PGM_SPECIFICATION);
         return DISAS_NORETURN;
     }
-    l = tcg_const_i32(l2);
+    l = tcg_constant_i32(l2);
     gen_helper_pka(cpu_env, o->addr1, o->in2, l);
-    tcg_temp_free_i32(l);
     return DISAS_NEXT;
 }
 
@@ -3786,9 +3710,8 @@ static DisasJumpType op_pku(DisasContext *s, DisasOps *o)
         gen_program_exception(s, PGM_SPECIFICATION);
         return DISAS_NORETURN;
     }
-    l = tcg_const_i32(l2);
+    l = tcg_constant_i32(l2);
     gen_helper_pku(cpu_env, o->addr1, o->in2, l);
-    tcg_temp_free_i32(l);
     return DISAS_NEXT;
 }
 
@@ -4035,9 +3958,8 @@ static DisasJumpType op_sam(DisasContext *s, DisasOps *o)
     }
     s->pc_tmp &= mask;
 
-    tsam = tcg_const_i64(sam);
+    tsam = tcg_constant_i64(sam);
     tcg_gen_deposit_i64(psw_mask, psw_mask, tsam, 31, 2);
-    tcg_temp_free_i64(tsam);
 
     /* Always exit the TB, since we (may have) changed execution mode.  */
     return DISAS_TOO_MANY;
@@ -4096,12 +4018,11 @@ static DisasJumpType op_servc(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_sigp(DisasContext *s, DisasOps *o)
 {
-    TCGv_i32 r1 = tcg_const_i32(get_field(s, r1));
-    TCGv_i32 r3 = tcg_const_i32(get_field(s, r3));
+    TCGv_i32 r1 = tcg_constant_i32(get_field(s, r1));
+    TCGv_i32 r3 = tcg_constant_i32(get_field(s, r3));
+
     gen_helper_sigp(cc_op, cpu_env, o->in2, r1, r3);
     set_cc_static(s);
-    tcg_temp_free_i32(r1);
-    tcg_temp_free_i32(r3);
     return DISAS_NEXT;
 }
 #endif
@@ -4370,21 +4291,19 @@ static DisasJumpType op_stckc(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_stctg(DisasContext *s, DisasOps *o)
 {
-    TCGv_i32 r1 = tcg_const_i32(get_field(s, r1));
-    TCGv_i32 r3 = tcg_const_i32(get_field(s, r3));
+    TCGv_i32 r1 = tcg_constant_i32(get_field(s, r1));
+    TCGv_i32 r3 = tcg_constant_i32(get_field(s, r3));
+
     gen_helper_stctg(cpu_env, r1, o->in2, r3);
-    tcg_temp_free_i32(r1);
-    tcg_temp_free_i32(r3);
     return DISAS_NEXT;
 }
 
 static DisasJumpType op_stctl(DisasContext *s, DisasOps *o)
 {
-    TCGv_i32 r1 = tcg_const_i32(get_field(s, r1));
-    TCGv_i32 r3 = tcg_const_i32(get_field(s, r3));
+    TCGv_i32 r1 = tcg_constant_i32(get_field(s, r1));
+    TCGv_i32 r3 = tcg_constant_i32(get_field(s, r3));
+
     gen_helper_stctl(cpu_env, r1, o->in2, r3);
-    tcg_temp_free_i32(r1);
-    tcg_temp_free_i32(r3);
     return DISAS_NEXT;
 }
 
@@ -4611,11 +4530,10 @@ static DisasJumpType op_st64(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_stam(DisasContext *s, DisasOps *o)
 {
-    TCGv_i32 r1 = tcg_const_i32(get_field(s, r1));
-    TCGv_i32 r3 = tcg_const_i32(get_field(s, r3));
+    TCGv_i32 r1 = tcg_constant_i32(get_field(s, r1));
+    TCGv_i32 r3 = tcg_constant_i32(get_field(s, r3));
+
     gen_helper_stam(cpu_env, r1, o->in2, r3);
-    tcg_temp_free_i32(r1);
-    tcg_temp_free_i32(r3);
     return DISAS_NEXT;
 }
 
@@ -4673,7 +4591,7 @@ static DisasJumpType op_stm(DisasContext *s, DisasOps *o)
     int r1 = get_field(s, r1);
     int r3 = get_field(s, r3);
     int size = s->insn->data;
-    TCGv_i64 tsize = tcg_const_i64(size);
+    TCGv_i64 tsize = tcg_constant_i64(size);
 
     while (1) {
         if (size == 8) {
@@ -4688,7 +4606,6 @@ static DisasJumpType op_stm(DisasContext *s, DisasOps *o)
         r1 = (r1 + 1) & 15;
     }
 
-    tcg_temp_free_i64(tsize);
     return DISAS_NEXT;
 }
 
@@ -4697,8 +4614,8 @@ static DisasJumpType op_stmh(DisasContext *s, DisasOps *o)
     int r1 = get_field(s, r1);
     int r3 = get_field(s, r3);
     TCGv_i64 t = tcg_temp_new_i64();
-    TCGv_i64 t4 = tcg_const_i64(4);
-    TCGv_i64 t32 = tcg_const_i64(32);
+    TCGv_i64 t4 = tcg_constant_i64(4);
+    TCGv_i64 t32 = tcg_constant_i64(32);
 
     while (1) {
         tcg_gen_shl_i64(t, regs[r1], t32);
@@ -4711,8 +4628,6 @@ static DisasJumpType op_stmh(DisasContext *s, DisasOps *o)
     }
 
     tcg_temp_free_i64(t);
-    tcg_temp_free_i64(t4);
-    tcg_temp_free_i64(t32);
     return DISAS_NEXT;
 }
 
@@ -4731,26 +4646,20 @@ static DisasJumpType op_stpq(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_srst(DisasContext *s, DisasOps *o)
 {
-    TCGv_i32 r1 = tcg_const_i32(get_field(s, r1));
-    TCGv_i32 r2 = tcg_const_i32(get_field(s, r2));
+    TCGv_i32 r1 = tcg_constant_i32(get_field(s, r1));
+    TCGv_i32 r2 = tcg_constant_i32(get_field(s, r2));
 
     gen_helper_srst(cpu_env, r1, r2);
-
-    tcg_temp_free_i32(r1);
-    tcg_temp_free_i32(r2);
     set_cc_static(s);
     return DISAS_NEXT;
 }
 
 static DisasJumpType op_srstu(DisasContext *s, DisasOps *o)
 {
-    TCGv_i32 r1 = tcg_const_i32(get_field(s, r1));
-    TCGv_i32 r2 = tcg_const_i32(get_field(s, r2));
+    TCGv_i32 r1 = tcg_constant_i32(get_field(s, r1));
+    TCGv_i32 r2 = tcg_constant_i32(get_field(s, r2));
 
     gen_helper_srstu(cpu_env, r1, r2);
-
-    tcg_temp_free_i32(r1);
-    tcg_temp_free_i32(r2);
     set_cc_static(s);
     return DISAS_NEXT;
 }
@@ -4808,10 +4717,9 @@ static DisasJumpType op_subb64(DisasContext *s, DisasOps *o)
      * Borrow is {0, -1}, so add to subtract; replicate the
      * borrow input to produce 128-bit -1 for the addition.
      */
-    TCGv_i64 zero = tcg_const_i64(0);
+    TCGv_i64 zero = tcg_constant_i64(0);
     tcg_gen_add2_i64(o->out, cc_src, o->in1, zero, cc_src, cc_src);
     tcg_gen_sub2_i64(o->out, cc_src, o->out, cc_src, o->in2, zero);
-    tcg_temp_free_i64(zero);
 
     return DISAS_NEXT;
 }
@@ -4823,13 +4731,11 @@ static DisasJumpType op_svc(DisasContext *s, DisasOps *o)
     update_psw_addr(s);
     update_cc_op(s);
 
-    t = tcg_const_i32(get_field(s, i1) & 0xff);
+    t = tcg_constant_i32(get_field(s, i1) & 0xff);
     tcg_gen_st_i32(t, cpu_env, offsetof(CPUS390XState, int_svc_code));
-    tcg_temp_free_i32(t);
 
-    t = tcg_const_i32(s->ilen);
+    t = tcg_constant_i32(s->ilen);
     tcg_gen_st_i32(t, cpu_env, offsetof(CPUS390XState, int_svc_ilen));
-    tcg_temp_free_i32(t);
 
     gen_exception(EXCP_SVC);
     return DISAS_NORETURN;
@@ -4886,18 +4792,18 @@ static DisasJumpType op_tprot(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_tp(DisasContext *s, DisasOps *o)
 {
-    TCGv_i32 l1 = tcg_const_i32(get_field(s, l1) + 1);
+    TCGv_i32 l1 = tcg_constant_i32(get_field(s, l1) + 1);
+
     gen_helper_tp(cc_op, cpu_env, o->addr1, l1);
-    tcg_temp_free_i32(l1);
     set_cc_static(s);
     return DISAS_NEXT;
 }
 
 static DisasJumpType op_tr(DisasContext *s, DisasOps *o)
 {
-    TCGv_i32 l = tcg_const_i32(get_field(s, l1));
+    TCGv_i32 l = tcg_constant_i32(get_field(s, l1));
+
     gen_helper_tr(cpu_env, l, o->addr1, o->in2);
-    tcg_temp_free_i32(l);
     set_cc_static(s);
     return DISAS_NEXT;
 }
@@ -4915,27 +4821,27 @@ static DisasJumpType op_tre(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_trt(DisasContext *s, DisasOps *o)
 {
-    TCGv_i32 l = tcg_const_i32(get_field(s, l1));
+    TCGv_i32 l = tcg_constant_i32(get_field(s, l1));
+
     gen_helper_trt(cc_op, cpu_env, l, o->addr1, o->in2);
-    tcg_temp_free_i32(l);
     set_cc_static(s);
     return DISAS_NEXT;
 }
 
 static DisasJumpType op_trtr(DisasContext *s, DisasOps *o)
 {
-    TCGv_i32 l = tcg_const_i32(get_field(s, l1));
+    TCGv_i32 l = tcg_constant_i32(get_field(s, l1));
+
     gen_helper_trtr(cc_op, cpu_env, l, o->addr1, o->in2);
-    tcg_temp_free_i32(l);
     set_cc_static(s);
     return DISAS_NEXT;
 }
 
 static DisasJumpType op_trXX(DisasContext *s, DisasOps *o)
 {
-    TCGv_i32 r1 = tcg_const_i32(get_field(s, r1));
-    TCGv_i32 r2 = tcg_const_i32(get_field(s, r2));
-    TCGv_i32 sizes = tcg_const_i32(s->insn->opc & 3);
+    TCGv_i32 r1 = tcg_constant_i32(get_field(s, r1));
+    TCGv_i32 r2 = tcg_constant_i32(get_field(s, r2));
+    TCGv_i32 sizes = tcg_constant_i32(s->insn->opc & 3);
     TCGv_i32 tst = tcg_temp_new_i32();
     int m3 = get_field(s, m3);
 
@@ -4954,9 +4860,6 @@ static DisasJumpType op_trXX(DisasContext *s, DisasOps *o)
     }
     gen_helper_trXX(cc_op, cpu_env, r1, r2, tst, sizes);
 
-    tcg_temp_free_i32(r1);
-    tcg_temp_free_i32(r2);
-    tcg_temp_free_i32(sizes);
     tcg_temp_free_i32(tst);
     set_cc_static(s);
     return DISAS_NEXT;
@@ -4964,19 +4867,19 @@ static DisasJumpType op_trXX(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_ts(DisasContext *s, DisasOps *o)
 {
-    TCGv_i32 t1 = tcg_const_i32(0xff);
+    TCGv_i32 t1 = tcg_constant_i32(0xff);
+
     tcg_gen_atomic_xchg_i32(t1, o->in2, t1, get_mem_index(s), MO_UB);
     tcg_gen_extract_i32(cc_op, t1, 7, 1);
-    tcg_temp_free_i32(t1);
     set_cc_static(s);
     return DISAS_NEXT;
 }
 
 static DisasJumpType op_unpk(DisasContext *s, DisasOps *o)
 {
-    TCGv_i32 l = tcg_const_i32(get_field(s, l1));
+    TCGv_i32 l = tcg_constant_i32(get_field(s, l1));
+
     gen_helper_unpk(cpu_env, l, o->addr1, o->in2);
-    tcg_temp_free_i32(l);
     return DISAS_NEXT;
 }
 
@@ -4990,9 +4893,8 @@ static DisasJumpType op_unpka(DisasContext *s, DisasOps *o)
         gen_program_exception(s, PGM_SPECIFICATION);
         return DISAS_NORETURN;
     }
-    l = tcg_const_i32(l1);
+    l = tcg_constant_i32(l1);
     gen_helper_unpka(cc_op, cpu_env, o->addr1, l, o->in2);
-    tcg_temp_free_i32(l);
     set_cc_static(s);
     return DISAS_NEXT;
 }
@@ -5007,9 +4909,8 @@ static DisasJumpType op_unpku(DisasContext *s, DisasOps *o)
         gen_program_exception(s, PGM_SPECIFICATION);
         return DISAS_NORETURN;
     }
-    l = tcg_const_i32(l1);
+    l = tcg_constant_i32(l1);
     gen_helper_unpku(cc_op, cpu_env, o->addr1, l, o->in2);
-    tcg_temp_free_i32(l);
     set_cc_static(s);
     return DISAS_NEXT;
 }
@@ -5028,7 +4929,7 @@ static DisasJumpType op_xc(DisasContext *s, DisasOps *o)
 
     /* If the addresses are identical, this is a store/memset of zero.  */
     if (b1 == b2 && d1 == d2 && (l + 1) <= 32) {
-        o->in2 = tcg_const_i64(0);
+        o->in2 = tcg_constant_i64(0);
 
         l++;
         while (l >= 8) {
@@ -5061,9 +4962,8 @@ static DisasJumpType op_xc(DisasContext *s, DisasOps *o)
 
     /* But in general we'll defer to a helper.  */
     o->in2 = get_address(s, 0, b2, d2);
-    t32 = tcg_const_i32(l);
+    t32 = tcg_constant_i32(l);
     gen_helper_xc(cc_op, cpu_env, t32, o->addr1, o->in2);
-    tcg_temp_free_i32(t32);
     set_cc_static(s);
     return DISAS_NEXT;
 }
@@ -5128,46 +5028,39 @@ static DisasJumpType op_zero2(DisasContext *s, DisasOps *o)
 #ifndef CONFIG_USER_ONLY
 static DisasJumpType op_clp(DisasContext *s, DisasOps *o)
 {
-    TCGv_i32 r2 = tcg_const_i32(get_field(s, r2));
+    TCGv_i32 r2 = tcg_constant_i32(get_field(s, r2));
 
     gen_helper_clp(cpu_env, r2);
-    tcg_temp_free_i32(r2);
     set_cc_static(s);
     return DISAS_NEXT;
 }
 
 static DisasJumpType op_pcilg(DisasContext *s, DisasOps *o)
 {
-    TCGv_i32 r1 = tcg_const_i32(get_field(s, r1));
-    TCGv_i32 r2 = tcg_const_i32(get_field(s, r2));
+    TCGv_i32 r1 = tcg_constant_i32(get_field(s, r1));
+    TCGv_i32 r2 = tcg_constant_i32(get_field(s, r2));
 
     gen_helper_pcilg(cpu_env, r1, r2);
-    tcg_temp_free_i32(r1);
-    tcg_temp_free_i32(r2);
     set_cc_static(s);
     return DISAS_NEXT;
 }
 
 static DisasJumpType op_pcistg(DisasContext *s, DisasOps *o)
 {
-    TCGv_i32 r1 = tcg_const_i32(get_field(s, r1));
-    TCGv_i32 r2 = tcg_const_i32(get_field(s, r2));
+    TCGv_i32 r1 = tcg_constant_i32(get_field(s, r1));
+    TCGv_i32 r2 = tcg_constant_i32(get_field(s, r2));
 
     gen_helper_pcistg(cpu_env, r1, r2);
-    tcg_temp_free_i32(r1);
-    tcg_temp_free_i32(r2);
     set_cc_static(s);
     return DISAS_NEXT;
 }
 
 static DisasJumpType op_stpcifc(DisasContext *s, DisasOps *o)
 {
-    TCGv_i32 r1 = tcg_const_i32(get_field(s, r1));
-    TCGv_i32 ar = tcg_const_i32(get_field(s, b2));
+    TCGv_i32 r1 = tcg_constant_i32(get_field(s, r1));
+    TCGv_i32 ar = tcg_constant_i32(get_field(s, b2));
 
     gen_helper_stpcifc(cpu_env, r1, o->addr1, ar);
-    tcg_temp_free_i32(ar);
-    tcg_temp_free_i32(r1);
     set_cc_static(s);
     return DISAS_NEXT;
 }
@@ -5180,38 +5073,31 @@ static DisasJumpType op_sic(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_rpcit(DisasContext *s, DisasOps *o)
 {
-    TCGv_i32 r1 = tcg_const_i32(get_field(s, r1));
-    TCGv_i32 r2 = tcg_const_i32(get_field(s, r2));
+    TCGv_i32 r1 = tcg_constant_i32(get_field(s, r1));
+    TCGv_i32 r2 = tcg_constant_i32(get_field(s, r2));
 
     gen_helper_rpcit(cpu_env, r1, r2);
-    tcg_temp_free_i32(r1);
-    tcg_temp_free_i32(r2);
     set_cc_static(s);
     return DISAS_NEXT;
 }
 
 static DisasJumpType op_pcistb(DisasContext *s, DisasOps *o)
 {
-    TCGv_i32 r1 = tcg_const_i32(get_field(s, r1));
-    TCGv_i32 r3 = tcg_const_i32(get_field(s, r3));
-    TCGv_i32 ar = tcg_const_i32(get_field(s, b2));
+    TCGv_i32 r1 = tcg_constant_i32(get_field(s, r1));
+    TCGv_i32 r3 = tcg_constant_i32(get_field(s, r3));
+    TCGv_i32 ar = tcg_constant_i32(get_field(s, b2));
 
     gen_helper_pcistb(cpu_env, r1, r3, o->addr1, ar);
-    tcg_temp_free_i32(ar);
-    tcg_temp_free_i32(r1);
-    tcg_temp_free_i32(r3);
     set_cc_static(s);
     return DISAS_NEXT;
 }
 
 static DisasJumpType op_mpcifc(DisasContext *s, DisasOps *o)
 {
-    TCGv_i32 r1 = tcg_const_i32(get_field(s, r1));
-    TCGv_i32 ar = tcg_const_i32(get_field(s, b2));
+    TCGv_i32 r1 = tcg_constant_i32(get_field(s, r1));
+    TCGv_i32 ar = tcg_constant_i32(get_field(s, b2));
 
     gen_helper_mpcifc(cpu_env, r1, o->addr1, ar);
-    tcg_temp_free_i32(ar);
-    tcg_temp_free_i32(r1);
     set_cc_static(s);
     return DISAS_NEXT;
 }
@@ -6378,16 +6264,15 @@ static const DisasInsn *extract_insn(CPUS390XState *env, DisasContext *s)
 
     if (unlikely(s->ex_value)) {
         /* Drop the EX data now, so that it's clear on exception paths.  */
-        TCGv_i64 zero = tcg_const_i64(0);
-        int i;
-        tcg_gen_st_i64(zero, cpu_env, offsetof(CPUS390XState, ex_value));
-        tcg_temp_free_i64(zero);
+        tcg_gen_st_i64(tcg_constant_i64(0), cpu_env,
+                       offsetof(CPUS390XState, ex_value));
 
         /* Extract the values saved by EXECUTE.  */
         insn = s->ex_value & 0xffffffffffff0000ull;
         ilen = s->ex_value & 0xf;
-        /* register insn bytes with translator so plugins work */
-        for (i = 0; i < ilen; i++) {
+
+        /* Register insn bytes with translator so plugins work. */
+        for (int i = 0; i < ilen; i++) {
             uint8_t byte = extract64(insn, 56 - (i * 8), 8);
             translator_fake_ldb(byte, pc + i);
         }
@@ -6512,9 +6397,8 @@ static DisasJumpType translate_one(CPUS390XState *env, DisasContext *s)
 
 #ifndef CONFIG_USER_ONLY
     if (s->base.tb->flags & FLAG_MASK_PER) {
-        TCGv_i64 addr = tcg_const_i64(s->base.pc_next);
+        TCGv_i64 addr = tcg_constant_i64(s->base.pc_next);
         gen_helper_per_ifetch(cpu_env, addr);
-        tcg_temp_free_i64(addr);
     }
 #endif
 
-- 
2.34.1


