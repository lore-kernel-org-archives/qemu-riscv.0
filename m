Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pg3EC-0006pL-Bi
	for mharc-qemu-riscv@gnu.org; Sat, 25 Mar 2023 08:42:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pg3EA-0006gK-UM
 for qemu-riscv@nongnu.org; Sat, 25 Mar 2023 08:42:34 -0400
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pg3E8-0000Fd-UY
 for qemu-riscv@nongnu.org; Sat, 25 Mar 2023 08:42:34 -0400
Received: by mail-il1-x12c.google.com with SMTP id r4so2261738ilt.8
 for <qemu-riscv@nongnu.org>; Sat, 25 Mar 2023 05:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679748147;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T30krokT/jnaherKuiLpGhNCeIX03l+N+xDrGjZED9Q=;
 b=aEj0ZANZBMJo9V4Jle8RM5nINHmMHZGa5ScxzW93nY7CmjJdnRCSC3cjnHqxLb00Io
 ahhfrNgSIad7ZtJJPHZLtctN7IT0EBr5lrGjh8x9DqmVwTVQxn2bBMI/r7ayLeKW9m0h
 dbYwjKrvnDFkF6B+lCwVVpFfhn5xbf7Cr2CLNwNj2jkTi6oNO/PzoInZArp02IRNOtK8
 E/PscxEXcdZ+WtJrL/CwJVGakOTR/Zgi52uBWlNBW9aGeSriYRkANwqqRnuN3duZFIjH
 4ElC09L9NZWeJCJ9ANFiMrh/qmK7XVGFFkDifkyv+cqf9EgWzTf5RjMIUdCq/uYHKEyo
 ftyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679748147;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T30krokT/jnaherKuiLpGhNCeIX03l+N+xDrGjZED9Q=;
 b=kZwW0PPT4rO6yG23HKfPOM3iqfwW4qFkETUejWNk9PYIDO8PZqLlL/NC+aftXgB4NN
 QnEE5+G681lbcQuPGbJioLWR7pjbRw0MGsypryVAXfdW9YCAaL9tuFA0PUyb5USelL7J
 hx1Hj19P2PkTAhfI3ufFjozRLaJCENLv1UA+fqaBsV7aIfSDZMofDl0tWkxOaLdfBx+t
 4J2xuU9x9Fy8368+ws8AzheBwjbV7vXh5e99NzJqDnDYgfA1JPCymymef+DPgCTiYAZy
 ogwhKFGDg6zUb5pZPLDS0jq+0oseqfhAXUGZGKy5vQnk45CcTb8CVu2zyoNVaHGyf2Zo
 YmcA==
X-Gm-Message-State: AAQBX9feGChi4s7/nijbIQUnSW+oph7EK8bS5Ar/MCeaW09x5I3t0HsI
 ZooxcWVbwxodwkXtmXMOwSC0D9Y70vEUo+FCVjI=
X-Google-Smtp-Source: AKy350YdKeGRlvprqh7Qh0Z8etIzktUkzqGG3xDjTMF4Ll/3J6doYOolsOTIv527a7dHdBifbnTeBQ==
X-Received: by 2002:a17:90b:33ce:b0:23d:4b01:b27 with SMTP id
 lk14-20020a17090b33ce00b0023d4b010b27mr6560707pjb.10.1679741675325; 
 Sat, 25 Mar 2023 03:54:35 -0700 (PDT)
Received: from stoup.. ([2602:ae:1544:6601:790a:6e23:4a91:70a])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a17090a2d8e00b0023af4eb597csm1234684pjd.52.2023.03.25.03.54.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Mar 2023 03:54:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, palmer@dabbelt.com,
 zhiwei_liu@linux.alibaba.com, fei2.wu@intel.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v6 05/25] target/riscv: Add a tb flags field for vstart
Date: Sat, 25 Mar 2023 03:54:09 -0700
Message-Id: <20230325105429.1142530-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230325105429.1142530-1-richard.henderson@linaro.org>
References: <20230325105429.1142530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::12c;
 envelope-from=richard.henderson@linaro.org; helo=mail-il1-x12c.google.com
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
X-List-Received-Date: Sat, 25 Mar 2023 12:42:35 -0000

From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Once we mistook the vstart directly from the env->vstart. As env->vstart is not
a constant, we should record it in the tb flags if we want to use
it in translation.

Reported-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Message-Id: <20230324143031.1093-5-zhiwei_liu@linux.alibaba.com>
---
 target/riscv/cpu.h                      |  1 +
 target/riscv/cpu_helper.c               |  1 +
 target/riscv/translate.c                |  4 ++--
 target/riscv/insn_trans/trans_rvv.c.inc | 14 +++++++-------
 4 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index d9e0eaaf9b..86a82e25dc 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -657,6 +657,7 @@ FIELD(TB_FLAGS, VMA, 21, 1)
 FIELD(TB_FLAGS, ITRIGGER, 22, 1)
 /* Virtual mode enabled */
 FIELD(TB_FLAGS, VIRT_ENABLED, 23, 1)
+FIELD(TB_FLAGS, VSTART_EQ_ZERO, 24, 1)
 
 #ifdef TARGET_RISCV32
 #define riscv_cpu_mxl(env)  ((void)(env), MXL_RV32)
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 4fdd6fe021..4f0999d50b 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -74,6 +74,7 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
                     FIELD_EX64(env->vtype, VTYPE, VTA));
         flags = FIELD_DP32(flags, TB_FLAGS, VMA,
                     FIELD_EX64(env->vtype, VTYPE, VMA));
+        flags = FIELD_DP32(flags, TB_FLAGS, VSTART_EQ_ZERO, env->vstart == 0);
     } else {
         flags = FIELD_DP32(flags, TB_FLAGS, VILL, 1);
     }
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 74d0b9889d..f8c077525c 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -97,7 +97,7 @@ typedef struct DisasContext {
     uint8_t vta;
     uint8_t vma;
     bool cfg_vta_all_1s;
-    target_ulong vstart;
+    bool vstart_eq_zero;
     bool vl_eq_vlmax;
     CPUState *cs;
     TCGv zero;
@@ -1155,7 +1155,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->vta = FIELD_EX32(tb_flags, TB_FLAGS, VTA) && cpu->cfg.rvv_ta_all_1s;
     ctx->vma = FIELD_EX32(tb_flags, TB_FLAGS, VMA) && cpu->cfg.rvv_ma_all_1s;
     ctx->cfg_vta_all_1s = cpu->cfg.rvv_ta_all_1s;
-    ctx->vstart = env->vstart;
+    ctx->vstart_eq_zero = FIELD_EX32(tb_flags, TB_FLAGS, VSTART_EQ_ZERO);
     ctx->vl_eq_vlmax = FIELD_EX32(tb_flags, TB_FLAGS, VL_EQ_VLMAX);
     ctx->misa_mxl_max = env->misa_mxl_max;
     ctx->xl = FIELD_EX32(tb_flags, TB_FLAGS, XL);
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 6297c3b50d..32b3b9a8e5 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -547,7 +547,7 @@ static bool vext_check_sds(DisasContext *s, int vd, int vs1, int vs2, int vm)
  */
 static bool vext_check_reduction(DisasContext *s, int vs2)
 {
-    return require_align(vs2, s->lmul) && (s->vstart == 0);
+    return require_align(vs2, s->lmul) && s->vstart_eq_zero;
 }
 
 /*
@@ -3083,7 +3083,7 @@ static bool trans_vcpop_m(DisasContext *s, arg_rmr *a)
 {
     if (require_rvv(s) &&
         vext_check_isa_ill(s) &&
-        s->vstart == 0) {
+        s->vstart_eq_zero) {
         TCGv_ptr src2, mask;
         TCGv dst;
         TCGv_i32 desc;
@@ -3112,7 +3112,7 @@ static bool trans_vfirst_m(DisasContext *s, arg_rmr *a)
 {
     if (require_rvv(s) &&
         vext_check_isa_ill(s) &&
-        s->vstart == 0) {
+        s->vstart_eq_zero) {
         TCGv_ptr src2, mask;
         TCGv dst;
         TCGv_i32 desc;
@@ -3146,7 +3146,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
         vext_check_isa_ill(s) &&                                   \
         require_vm(a->vm, a->rd) &&                                \
         (a->rd != a->rs2) &&                                       \
-        (s->vstart == 0)) {                                        \
+        s->vstart_eq_zero) {                                       \
         uint32_t data = 0;                                         \
         gen_helper_gvec_3_ptr *fn = gen_helper_##NAME;             \
         TCGLabel *over = gen_new_label();                          \
@@ -3187,7 +3187,7 @@ static bool trans_viota_m(DisasContext *s, arg_viota_m *a)
         !is_overlapped(a->rd, 1 << MAX(s->lmul, 0), a->rs2, 1) &&
         require_vm(a->vm, a->rd) &&
         require_align(a->rd, s->lmul) &&
-        (s->vstart == 0)) {
+        s->vstart_eq_zero) {
         uint32_t data = 0;
         TCGLabel *over = gen_new_label();
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
@@ -3636,7 +3636,7 @@ static bool vcompress_vm_check(DisasContext *s, arg_r *a)
            require_align(a->rs2, s->lmul) &&
            (a->rd != a->rs2) &&
            !is_overlapped(a->rd, 1 << MAX(s->lmul, 0), a->rs1, 1) &&
-           (s->vstart == 0);
+           s->vstart_eq_zero;
 }
 
 static bool trans_vcompress_vm(DisasContext *s, arg_r *a)
@@ -3675,7 +3675,7 @@ static bool trans_##NAME(DisasContext *s, arg_##NAME * a)               \
         QEMU_IS_ALIGNED(a->rd, LEN) &&                                  \
         QEMU_IS_ALIGNED(a->rs2, LEN)) {                                 \
         uint32_t maxsz = (s->cfg_ptr->vlen >> 3) * LEN;                 \
-        if (s->vstart == 0) {                                           \
+        if (s->vstart_eq_zero) {                                        \
             /* EEW = 8 */                                               \
             tcg_gen_gvec_mov(MO_8, vreg_ofs(s, a->rd),                  \
                              vreg_ofs(s, a->rs2), maxsz, maxsz);        \
-- 
2.34.1


