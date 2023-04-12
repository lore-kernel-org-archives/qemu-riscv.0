Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pmYtX-0005Gk-6M
	for mharc-qemu-riscv@gnu.org; Wed, 12 Apr 2023 07:44:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pmYt8-0004kk-8L
 for qemu-riscv@nongnu.org; Wed, 12 Apr 2023 07:43:47 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pmYt3-0002O9-BF
 for qemu-riscv@nongnu.org; Wed, 12 Apr 2023 07:43:44 -0400
Received: by mail-wr1-x42d.google.com with SMTP id i3so1256864wrc.4
 for <qemu-riscv@nongnu.org>; Wed, 12 Apr 2023 04:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681299819; x=1683891819;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MWsW7ULWn4A1fSKqhQgD2QQ0V+0wVuw8Sc2XWLbfpiw=;
 b=EaGiVx4GjyyxgSsuNjJfa17MmsOKGI61kKrBoCOg/r7MFkgDWealhajr5GU/1r361p
 lsBlJ5LSdh3Gu5YaDhGX7so8r8b9mlAxU2z/lzBqBtR1NHidKH6xFCGckErGpkdUcVrA
 dvbyvUFKT8U1UZvWjpg6QR2ZM+hbwCSUHDutG6KZXJrNmTYYxdbA0kQZrP14dZa5xRa/
 1qWkSHXfWU1w0kk7UUgZbd+BMuX6VLaz59aMnOZYoOdsqItr3NP7jhgCWsl6ES7tVoUW
 gqvmBUfMDIovJUDfbEFsWvh9IBS6s6PnnAKWlz5FMSdxhawBC1UdQOBtJdnd34iW1jQT
 EpCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681299819; x=1683891819;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MWsW7ULWn4A1fSKqhQgD2QQ0V+0wVuw8Sc2XWLbfpiw=;
 b=d+1ERACATN/8rl3KPkhU73eei+X+TdoYC+jiUAyx2Di3zXa/kUEGh8FjcL1SuDte2z
 SkGBHqvZnpMzXn996r+3YLB+nOxN7RHuQQW1wjjlyThDrKMQ7HbB/UPzY/5DQesS5zcC
 dhNAi7fUrhWGeTdFQysjTwgx+bWU5YZljszWXa38P6//lvQ60nHY37LXa3FC1eB7tlf7
 uVgoZyRm7VA8V90ZPwCin2jQCl6dqC3wXdETwn9KVNvrEUqnlnyXaXsY0otoc9pvScpI
 JOcEMe9N87P8uUjoCbhqYJ18k+ez6NDFyvW6/lkIp4t9NBRjcxmgkdMkRJDMdikE4jkW
 8hew==
X-Gm-Message-State: AAQBX9e4biQvRy49v0mpcRXshHDbhvoVQahFNn+oeedjZzSG8g7HuqYk
 uDeoCVFniuy7FbtOKRzTD3G5+A==
X-Google-Smtp-Source: AKy350bLbx8sijfM45JuFC1RyuNL0nuur4YKtVteIDEvu53o+No+y1jx0z5AB2ht9hoq8Gu2cWEVTw==
X-Received: by 2002:adf:f1ca:0:b0:2f4:eb13:4091 with SMTP id
 z10-20020adff1ca000000b002f4eb134091mr758520wro.45.1681299819677; 
 Wed, 12 Apr 2023 04:43:39 -0700 (PDT)
Received: from stoup.hotel.gast (ip-037-024-010-236.um08.pools.vodafone-ip.de.
 [37.24.10.236]) by smtp.gmail.com with ESMTPSA id
 k9-20020a5d4289000000b002d21379bcabsm16980826wrq.110.2023.04.12.04.43.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 04:43:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, qemu-riscv@nongnu.org,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v7 05/25] target/riscv: Add a tb flags field for vstart
Date: Wed, 12 Apr 2023 13:43:13 +0200
Message-Id: <20230412114333.118895-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230412114333.118895-1-richard.henderson@linaro.org>
References: <20230412114333.118895-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42d.google.com
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
X-List-Received-Date: Wed, 12 Apr 2023 11:43:48 -0000

From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Once we mistook the vstart directly from the env->vstart. As env->vstart is not
a constant, we should record it in the tb flags if we want to use
it in translation.

Reported-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Message-Id: <20230324143031.1093-5-zhiwei_liu@linux.alibaba.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Tested-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Message-Id: <20230325105429.1142530-6-richard.henderson@linaro.org>
---
 target/riscv/cpu.h                      |  1 +
 target/riscv/cpu_helper.c               |  1 +
 target/riscv/translate.c                |  4 ++--
 target/riscv/insn_trans/trans_rvv.c.inc | 14 +++++++-------
 4 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index ab64d5f92d..786ad047ee 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -655,6 +655,7 @@ FIELD(TB_FLAGS, VMA, 21, 1)
 FIELD(TB_FLAGS, ITRIGGER, 22, 1)
 /* Virtual mode enabled */
 FIELD(TB_FLAGS, VIRT_ENABLED, 23, 1)
+FIELD(TB_FLAGS, VSTART_EQ_ZERO, 24, 1)
 
 #ifdef TARGET_RISCV32
 #define riscv_cpu_mxl(env)  ((void)(env), MXL_RV32)
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index e3e620137b..7579e83c3d 100644
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
index 3092c942ab..3ab8a9999e 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -99,7 +99,7 @@ typedef struct DisasContext {
     uint8_t vta;
     uint8_t vma;
     bool cfg_vta_all_1s;
-    target_ulong vstart;
+    bool vstart_eq_zero;
     bool vl_eq_vlmax;
     CPUState *cs;
     TCGv zero;
@@ -1168,7 +1168,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->vta = FIELD_EX32(tb_flags, TB_FLAGS, VTA) && cpu->cfg.rvv_ta_all_1s;
     ctx->vma = FIELD_EX32(tb_flags, TB_FLAGS, VMA) && cpu->cfg.rvv_ma_all_1s;
     ctx->cfg_vta_all_1s = cpu->cfg.rvv_ta_all_1s;
-    ctx->vstart = env->vstart;
+    ctx->vstart_eq_zero = FIELD_EX32(tb_flags, TB_FLAGS, VSTART_EQ_ZERO);
     ctx->vl_eq_vlmax = FIELD_EX32(tb_flags, TB_FLAGS, VL_EQ_VLMAX);
     ctx->misa_mxl_max = env->misa_mxl_max;
     ctx->xl = FIELD_EX32(tb_flags, TB_FLAGS, XL);
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index ecbdf1b3d7..6c07eebc52 100644
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
@@ -3148,7 +3148,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
         vext_check_isa_ill(s) &&                                   \
         require_vm(a->vm, a->rd) &&                                \
         (a->rd != a->rs2) &&                                       \
-        (s->vstart == 0)) {                                        \
+        s->vstart_eq_zero) {                                       \
         uint32_t data = 0;                                         \
         gen_helper_gvec_3_ptr *fn = gen_helper_##NAME;             \
         TCGLabel *over = gen_new_label();                          \
@@ -3189,7 +3189,7 @@ static bool trans_viota_m(DisasContext *s, arg_viota_m *a)
         !is_overlapped(a->rd, 1 << MAX(s->lmul, 0), a->rs2, 1) &&
         require_vm(a->vm, a->rd) &&
         require_align(a->rd, s->lmul) &&
-        (s->vstart == 0)) {
+        s->vstart_eq_zero) {
         uint32_t data = 0;
         TCGLabel *over = gen_new_label();
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
@@ -3638,7 +3638,7 @@ static bool vcompress_vm_check(DisasContext *s, arg_r *a)
            require_align(a->rs2, s->lmul) &&
            (a->rd != a->rs2) &&
            !is_overlapped(a->rd, 1 << MAX(s->lmul, 0), a->rs1, 1) &&
-           (s->vstart == 0);
+           s->vstart_eq_zero;
 }
 
 static bool trans_vcompress_vm(DisasContext *s, arg_r *a)
@@ -3677,7 +3677,7 @@ static bool trans_##NAME(DisasContext *s, arg_##NAME * a)               \
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


