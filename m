Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWWO8-0006sX-4n
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:49:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWN4-0003R2-Cg
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:48:22 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWMz-000779-1z
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:48:21 -0500
Received: by mail-pl1-x633.google.com with SMTP id h8so2263952plf.10
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:48:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AisW32xJlrcJQi+M6qK/ftrU2PNr6PIj4TLkVZ68u3o=;
 b=zYeZ73qWVqHwn3qWRj8CZON5nItJjG2hW9OnHx04eY/CwM9Cp4yNdmWkHuloJ03wP+
 W3VNo/QPi91RmvTqu43vrl9mGda49BUA1+59Kubm7VrPNZVziUvZ+6amJ9nOnDeMsxpf
 1jwLM11ZGMccMEsreYL7MLBmjm7E9r/+k+z4Y1y9PIi8WWyglQGXUt4QbbJarUUbd8uK
 REt5EAqolMVzZgyuTn3E5GeFg7VLINSlHZu0ckF5i3ABibHjuyGVYHa+2WfYODxRmjCv
 rq8ypSUV8En7JNHZs0O8+9yP2XvQxGutN+jMtpGEOtRA9mdIHrvpwRgTq0I9TvpgPL4c
 1KfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AisW32xJlrcJQi+M6qK/ftrU2PNr6PIj4TLkVZ68u3o=;
 b=rFrypMLuC8IwV9BhqtFpDdJL81F3WyJAc4jjMSUTM4AACPXxVjTlAdDMKLyhhFnvtN
 4CeekqeGE421cqUSVi3LdaFENq7rqkJL5eByxF9W6iTb/ySliyMXQY7gDI8kQndlsO1R
 l4zt7Zh1PhtqNz0YbRNxF4v/8NpobtShmJsAJiMKXmZb71s0F3G5iBG/rc2eAPyLcAnA
 lMawos6vPHjpz8ttAoBePOWaAem2iRF46X/VEAbOGaNGsFu3VsRojvnpINw2gFtHmMqT
 CVxgu2NyvYfolXVk+10v3xIyrVmUE/blcNEMX7ejVMPOfpmC/Q8wcPhQYTkjpLecnhy8
 0Gzw==
X-Gm-Message-State: AO0yUKXQ8xO7TLvaRnYZQhRPuy8U16RUY20SqWjQArPOWxvyiuBBDl37
 n96euFAw8KoYRy/nkfh5e4q4dQ==
X-Google-Smtp-Source: AK7set9+MnYfHBDt/DymXOjTyQno6DCdLNcMjuZ5R8NldhxJXkVDPlVt2stfbgXgmmrboMtJikA5ng==
X-Received: by 2002:a17:903:1ce:b0:19d:20fe:c149 with SMTP id
 e14-20020a17090301ce00b0019d20fec149mr722361plh.34.1677476895749; 
 Sun, 26 Feb 2023 21:48:15 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 im16-20020a170902bb1000b0019a983f0119sm3553986plb.307.2023.02.26.21.48.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:48:15 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 57/70] target/tricore: Rename t_off10 and use tcg_constant_i32
Date: Sun, 26 Feb 2023 19:42:20 -1000
Message-Id: <20230227054233.390271-58-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
X-List-Received-Date: Mon, 27 Feb 2023 05:48:23 -0000

While temp3 could simply be initialized with tcg_constant_i32,
the renaming makes the purpose clearer.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/tricore/translate.c | 56 ++++++++++++++++++--------------------
 1 file changed, 27 insertions(+), 29 deletions(-)

diff --git a/target/tricore/translate.c b/target/tricore/translate.c
index 194bef27a6..19cf4b6cc7 100644
--- a/target/tricore/translate.c
+++ b/target/tricore/translate.c
@@ -4380,7 +4380,7 @@ static void decode_bo_addrmode_bitreverse_circular(DisasContext *ctx)
     uint32_t op2;
     uint32_t off10;
     int32_t r1, r2;
-    TCGv temp, temp2, temp3;
+    TCGv temp, temp2, t_off10;
 
     r1 = MASK_OP_BO_S1D(ctx->opcode);
     r2  = MASK_OP_BO_S2(ctx->opcode);
@@ -4389,7 +4389,7 @@ static void decode_bo_addrmode_bitreverse_circular(DisasContext *ctx)
 
     temp = tcg_temp_new();
     temp2 = tcg_temp_new();
-    temp3 = tcg_const_i32(off10);
+    t_off10 = tcg_constant_i32(off10);
     CHECK_REG_PAIR(r2);
     tcg_gen_ext16u_tl(temp, cpu_gpr_a[r2+1]);
     tcg_gen_add_tl(temp2, cpu_gpr_a[r2], temp);
@@ -4403,7 +4403,7 @@ static void decode_bo_addrmode_bitreverse_circular(DisasContext *ctx)
     case OPC2_32_BO_CACHEA_WI_CIRC:
     case OPC2_32_BO_CACHEA_W_CIRC:
     case OPC2_32_BO_CACHEA_I_CIRC:
-        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], temp3);
+        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], t_off10);
         break;
     case OPC2_32_BO_ST_A_BR:
         tcg_gen_qemu_st_tl(cpu_gpr_a[r1], temp2, ctx->mem_idx, MO_LEUL);
@@ -4411,7 +4411,7 @@ static void decode_bo_addrmode_bitreverse_circular(DisasContext *ctx)
         break;
     case OPC2_32_BO_ST_A_CIRC:
         tcg_gen_qemu_st_tl(cpu_gpr_a[r1], temp2, ctx->mem_idx, MO_LEUL);
-        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], temp3);
+        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], t_off10);
         break;
     case OPC2_32_BO_ST_B_BR:
         tcg_gen_qemu_st_tl(cpu_gpr_d[r1], temp2, ctx->mem_idx, MO_UB);
@@ -4419,7 +4419,7 @@ static void decode_bo_addrmode_bitreverse_circular(DisasContext *ctx)
         break;
     case OPC2_32_BO_ST_B_CIRC:
         tcg_gen_qemu_st_tl(cpu_gpr_d[r1], temp2, ctx->mem_idx, MO_UB);
-        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], temp3);
+        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], t_off10);
         break;
     case OPC2_32_BO_ST_D_BR:
         CHECK_REG_PAIR(r1);
@@ -4434,7 +4434,7 @@ static void decode_bo_addrmode_bitreverse_circular(DisasContext *ctx)
         tcg_gen_rem_tl(temp, temp, temp2);
         tcg_gen_add_tl(temp2, cpu_gpr_a[r2], temp);
         tcg_gen_qemu_st_tl(cpu_gpr_d[r1+1], temp2, ctx->mem_idx, MO_LEUL);
-        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], temp3);
+        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], t_off10);
         break;
     case OPC2_32_BO_ST_DA_BR:
         CHECK_REG_PAIR(r1);
@@ -4449,7 +4449,7 @@ static void decode_bo_addrmode_bitreverse_circular(DisasContext *ctx)
         tcg_gen_rem_tl(temp, temp, temp2);
         tcg_gen_add_tl(temp2, cpu_gpr_a[r2], temp);
         tcg_gen_qemu_st_tl(cpu_gpr_a[r1+1], temp2, ctx->mem_idx, MO_LEUL);
-        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], temp3);
+        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], t_off10);
         break;
     case OPC2_32_BO_ST_H_BR:
         tcg_gen_qemu_st_tl(cpu_gpr_d[r1], temp2, ctx->mem_idx, MO_LEUW);
@@ -4457,7 +4457,7 @@ static void decode_bo_addrmode_bitreverse_circular(DisasContext *ctx)
         break;
     case OPC2_32_BO_ST_H_CIRC:
         tcg_gen_qemu_st_tl(cpu_gpr_d[r1], temp2, ctx->mem_idx, MO_LEUW);
-        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], temp3);
+        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], t_off10);
         break;
     case OPC2_32_BO_ST_Q_BR:
         tcg_gen_shri_tl(temp, cpu_gpr_d[r1], 16);
@@ -4467,7 +4467,7 @@ static void decode_bo_addrmode_bitreverse_circular(DisasContext *ctx)
     case OPC2_32_BO_ST_Q_CIRC:
         tcg_gen_shri_tl(temp, cpu_gpr_d[r1], 16);
         tcg_gen_qemu_st_tl(temp, temp2, ctx->mem_idx, MO_LEUW);
-        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], temp3);
+        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], t_off10);
         break;
     case OPC2_32_BO_ST_W_BR:
         tcg_gen_qemu_st_tl(cpu_gpr_d[r1], temp2, ctx->mem_idx, MO_LEUL);
@@ -4475,7 +4475,7 @@ static void decode_bo_addrmode_bitreverse_circular(DisasContext *ctx)
         break;
     case OPC2_32_BO_ST_W_CIRC:
         tcg_gen_qemu_st_tl(cpu_gpr_d[r1], temp2, ctx->mem_idx, MO_LEUL);
-        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], temp3);
+        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], t_off10);
         break;
     default:
         generate_trap(ctx, TRAPC_INSN_ERR, TIN2_IOPC);
@@ -4619,8 +4619,7 @@ static void decode_bo_addrmode_ld_bitreverse_circular(DisasContext *ctx)
     uint32_t op2;
     uint32_t off10;
     int r1, r2;
-
-    TCGv temp, temp2, temp3;
+    TCGv temp, temp2, t_off10;
 
     r1 = MASK_OP_BO_S1D(ctx->opcode);
     r2 = MASK_OP_BO_S2(ctx->opcode);
@@ -4629,7 +4628,7 @@ static void decode_bo_addrmode_ld_bitreverse_circular(DisasContext *ctx)
 
     temp = tcg_temp_new();
     temp2 = tcg_temp_new();
-    temp3 = tcg_const_i32(off10);
+    t_off10 = tcg_constant_i32(off10);
     CHECK_REG_PAIR(r2);
     tcg_gen_ext16u_tl(temp, cpu_gpr_a[r2+1]);
     tcg_gen_add_tl(temp2, cpu_gpr_a[r2], temp);
@@ -4642,7 +4641,7 @@ static void decode_bo_addrmode_ld_bitreverse_circular(DisasContext *ctx)
         break;
     case OPC2_32_BO_LD_A_CIRC:
         tcg_gen_qemu_ld_tl(cpu_gpr_a[r1], temp2, ctx->mem_idx, MO_LEUL);
-        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], temp3);
+        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], t_off10);
         break;
     case OPC2_32_BO_LD_B_BR:
         tcg_gen_qemu_ld_tl(cpu_gpr_d[r1], temp2, ctx->mem_idx, MO_SB);
@@ -4650,7 +4649,7 @@ static void decode_bo_addrmode_ld_bitreverse_circular(DisasContext *ctx)
         break;
     case OPC2_32_BO_LD_B_CIRC:
         tcg_gen_qemu_ld_tl(cpu_gpr_d[r1], temp2, ctx->mem_idx, MO_SB);
-        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], temp3);
+        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], t_off10);
         break;
     case OPC2_32_BO_LD_BU_BR:
         tcg_gen_qemu_ld_tl(cpu_gpr_d[r1], temp2, ctx->mem_idx, MO_UB);
@@ -4658,7 +4657,7 @@ static void decode_bo_addrmode_ld_bitreverse_circular(DisasContext *ctx)
         break;
     case OPC2_32_BO_LD_BU_CIRC:
         tcg_gen_qemu_ld_tl(cpu_gpr_d[r1], temp2, ctx->mem_idx, MO_UB);
-        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], temp3);
+        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], t_off10);
         break;
     case OPC2_32_BO_LD_D_BR:
         CHECK_REG_PAIR(r1);
@@ -4673,7 +4672,7 @@ static void decode_bo_addrmode_ld_bitreverse_circular(DisasContext *ctx)
         tcg_gen_rem_tl(temp, temp, temp2);
         tcg_gen_add_tl(temp2, cpu_gpr_a[r2], temp);
         tcg_gen_qemu_ld_tl(cpu_gpr_d[r1+1], temp2, ctx->mem_idx, MO_LEUL);
-        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], temp3);
+        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], t_off10);
         break;
     case OPC2_32_BO_LD_DA_BR:
         CHECK_REG_PAIR(r1);
@@ -4688,7 +4687,7 @@ static void decode_bo_addrmode_ld_bitreverse_circular(DisasContext *ctx)
         tcg_gen_rem_tl(temp, temp, temp2);
         tcg_gen_add_tl(temp2, cpu_gpr_a[r2], temp);
         tcg_gen_qemu_ld_tl(cpu_gpr_a[r1+1], temp2, ctx->mem_idx, MO_LEUL);
-        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], temp3);
+        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], t_off10);
         break;
     case OPC2_32_BO_LD_H_BR:
         tcg_gen_qemu_ld_tl(cpu_gpr_d[r1], temp2, ctx->mem_idx, MO_LESW);
@@ -4696,7 +4695,7 @@ static void decode_bo_addrmode_ld_bitreverse_circular(DisasContext *ctx)
         break;
     case OPC2_32_BO_LD_H_CIRC:
         tcg_gen_qemu_ld_tl(cpu_gpr_d[r1], temp2, ctx->mem_idx, MO_LESW);
-        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], temp3);
+        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], t_off10);
         break;
     case OPC2_32_BO_LD_HU_BR:
         tcg_gen_qemu_ld_tl(cpu_gpr_d[r1], temp2, ctx->mem_idx, MO_LEUW);
@@ -4704,7 +4703,7 @@ static void decode_bo_addrmode_ld_bitreverse_circular(DisasContext *ctx)
         break;
     case OPC2_32_BO_LD_HU_CIRC:
         tcg_gen_qemu_ld_tl(cpu_gpr_d[r1], temp2, ctx->mem_idx, MO_LEUW);
-        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], temp3);
+        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], t_off10);
         break;
     case OPC2_32_BO_LD_Q_BR:
         tcg_gen_qemu_ld_tl(cpu_gpr_d[r1], temp2, ctx->mem_idx, MO_LEUW);
@@ -4714,7 +4713,7 @@ static void decode_bo_addrmode_ld_bitreverse_circular(DisasContext *ctx)
     case OPC2_32_BO_LD_Q_CIRC:
         tcg_gen_qemu_ld_tl(cpu_gpr_d[r1], temp2, ctx->mem_idx, MO_LEUW);
         tcg_gen_shli_tl(cpu_gpr_d[r1], cpu_gpr_d[r1], 16);
-        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], temp3);
+        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], t_off10);
         break;
     case OPC2_32_BO_LD_W_BR:
         tcg_gen_qemu_ld_tl(cpu_gpr_d[r1], temp2, ctx->mem_idx, MO_LEUL);
@@ -4722,7 +4721,7 @@ static void decode_bo_addrmode_ld_bitreverse_circular(DisasContext *ctx)
         break;
     case OPC2_32_BO_LD_W_CIRC:
         tcg_gen_qemu_ld_tl(cpu_gpr_d[r1], temp2, ctx->mem_idx, MO_LEUL);
-        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], temp3);
+        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], t_off10);
         break;
     default:
         generate_trap(ctx, TRAPC_INSN_ERR, TIN2_IOPC);
@@ -4823,8 +4822,7 @@ static void decode_bo_addrmode_ldmst_bitreverse_circular(DisasContext *ctx)
     uint32_t op2;
     uint32_t off10;
     int r1, r2;
-
-    TCGv temp, temp2, temp3;
+    TCGv temp, temp2, t_off10;
 
     r1 = MASK_OP_BO_S1D(ctx->opcode);
     r2 = MASK_OP_BO_S2(ctx->opcode);
@@ -4833,7 +4831,7 @@ static void decode_bo_addrmode_ldmst_bitreverse_circular(DisasContext *ctx)
 
     temp = tcg_temp_new();
     temp2 = tcg_temp_new();
-    temp3 = tcg_const_i32(off10);
+    t_off10 = tcg_constant_i32(off10);
     CHECK_REG_PAIR(r2);
     tcg_gen_ext16u_tl(temp, cpu_gpr_a[r2+1]);
     tcg_gen_add_tl(temp2, cpu_gpr_a[r2], temp);
@@ -4845,7 +4843,7 @@ static void decode_bo_addrmode_ldmst_bitreverse_circular(DisasContext *ctx)
         break;
     case OPC2_32_BO_LDMST_CIRC:
         gen_ldmst(ctx, r1, temp2);
-        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], temp3);
+        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], t_off10);
         break;
     case OPC2_32_BO_SWAP_W_BR:
         gen_swap(ctx, r1, temp2);
@@ -4853,7 +4851,7 @@ static void decode_bo_addrmode_ldmst_bitreverse_circular(DisasContext *ctx)
         break;
     case OPC2_32_BO_SWAP_W_CIRC:
         gen_swap(ctx, r1, temp2);
-        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], temp3);
+        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], t_off10);
         break;
     case OPC2_32_BO_CMPSWAP_W_BR:
         gen_cmpswap(ctx, r1, temp2);
@@ -4861,7 +4859,7 @@ static void decode_bo_addrmode_ldmst_bitreverse_circular(DisasContext *ctx)
         break;
     case OPC2_32_BO_CMPSWAP_W_CIRC:
         gen_cmpswap(ctx, r1, temp2);
-        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], temp3);
+        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], t_off10);
         break;
     case OPC2_32_BO_SWAPMSK_W_BR:
         gen_swapmsk(ctx, r1, temp2);
@@ -4869,7 +4867,7 @@ static void decode_bo_addrmode_ldmst_bitreverse_circular(DisasContext *ctx)
         break;
     case OPC2_32_BO_SWAPMSK_W_CIRC:
         gen_swapmsk(ctx, r1, temp2);
-        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], temp3);
+        gen_helper_circ_update(cpu_gpr_a[r2+1], cpu_gpr_a[r2+1], t_off10);
         break;
     default:
         generate_trap(ctx, TRAPC_INSN_ERR, TIN2_IOPC);
-- 
2.34.1


