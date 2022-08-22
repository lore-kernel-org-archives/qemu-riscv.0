Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oQ97u-0005jP-GZ
	for mharc-qemu-riscv@gnu.org; Mon, 22 Aug 2022 11:14:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQ97p-0005d3-Ej
 for qemu-riscv@nongnu.org; Mon, 22 Aug 2022 11:14:02 -0400
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131]:40581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQ97l-0004ac-6l
 for qemu-riscv@nongnu.org; Mon, 22 Aug 2022 11:14:00 -0400
Received: by mail-lf1-x131.google.com with SMTP id bq23so6680874lfb.7
 for <qemu-riscv@nongnu.org>; Mon, 22 Aug 2022 08:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=Ix5ZX0LyxSe0lq8009+k3P93c+marBxWgKkCfMS6XO4=;
 b=xqhSh/J3Amp77yha/WEPgppTr2wvu7XP+/4bmW5/gwS59Egc1iMpjHs5yd2/Ld/w5m
 tiG1aEIR1QCCmfdxX6keRnTd8nSY4BVJ8pd8TqUza4XGubOjSEAwgVKF2Szw3gUYy221
 y8xUFR5KRtOjCGfucQYsJ4nWMY3turIQNHTLl/WalI7DYEPtVpe7gTn+goXXs1yH3v28
 Pu13fbbOw4u/lXQP2zzNTgWlg4dqJ7f+SjZuREGv48W7KVV+c50PLGst/MB+mPMnr4fv
 98YZEQNiz1ZfEfSYUt6omnGhnAAoZvOrO1aHGqlTN0bCJiUpLbIYOGKwoU1ujBT3Z0jD
 phMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=Ix5ZX0LyxSe0lq8009+k3P93c+marBxWgKkCfMS6XO4=;
 b=e+XNMnHH9pn0W6wgnUM8YLAAIj3FC6ADreshMLs+DUfV+bZvQIkxWx66IzJhDDAnaI
 Qd3wARKS+t4emhJIL6GvsnelrXajdlEfyZQN+13D50QPqOoVHDVBardgfdygHY0gietG
 nw1AwtVeFZv9hcDeQSsmQ6eI7au/qEUaaWn3Z6xEJYWUw0Q1KL8eT8Ae0O+nU6tFcFBW
 Gf8DdC5bmK3aTLbZGE7ZIO2qt6//hXcHG+gYK0YhaNogU/hlj0wxfbkUPIAiP1063r8f
 dPqIYBHB7exu+7allFlNxcofddbHpwy//ArZe9JH4oAlYKQUcrOy5z9sB5hf2+wD150L
 9HxA==
X-Gm-Message-State: ACgBeo2663+LrXI2o/vFrIXRigPeefcjk/b+RfpALNdR+/fZWHhXShkX
 GdTlGcmt5519ptfHdhQHiukkVXd9Jqjhuw==
X-Google-Smtp-Source: AA6agR6UK9CYRjLszL8RAgjPVk7Y0RdS71Gjr3bIgpITeVUWzLEJL8vgq6DrnVW5wy0ncYOldHuhbQ==
X-Received: by 2002:a5d:6b10:0:b0:21e:4bbd:e893 with SMTP id
 v16-20020a5d6b10000000b0021e4bbde893mr11085590wrw.613.1661177559213; 
 Mon, 22 Aug 2022 07:12:39 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bh16-20020a05600c3d1000b003a3561d4f3fsm15184908wmb.43.2022.08.22.07.12.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 07:12:38 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Furquan Shaikh <furquan@rivosinc.com>
Subject: [PATCH v2 4/7] target/mips: Honour -semihosting-config userspace=on
Date: Mon, 22 Aug 2022 15:12:27 +0100
Message-Id: <20220822141230.3658237-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220822141230.3658237-1-peter.maydell@linaro.org>
References: <20220822141230.3658237-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x131.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 22 Aug 2022 15:14:05 -0000

Honour the commandline -semihosting-config userspace=on option,
instead of always permitting userspace semihosting calls in system
emulation mode, by passing the correct value to the is_userspace
argument of semihosting_enabled().

Note that this is a behaviour change: if the user wants to
do semihosting calls from userspace they must now specifically
enable them on the command line.

MIPS semihosting is not implemented for linux-user builds.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/tcg/translate.c               | 9 +++++----
 target/mips/tcg/micromips_translate.c.inc | 6 +++---
 target/mips/tcg/mips16e_translate.c.inc   | 2 +-
 target/mips/tcg/nanomips_translate.c.inc  | 4 ++--
 4 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index de1511baaf8..53886618ddd 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -12082,12 +12082,13 @@ static void gen_cache_operation(DisasContext *ctx, uint32_t op, int base,
     tcg_temp_free_i32(t0);
 }
 
-static inline bool is_uhi(int sdbbp_code)
+static inline bool is_uhi(DisasContext *ctx, int sdbbp_code)
 {
 #ifdef CONFIG_USER_ONLY
     return false;
 #else
-    return semihosting_enabled() && sdbbp_code == 1;
+    bool is_user = (ctx->hflags & MIPS_HFLAG_KSU) == MIPS_HFLAG_UM;
+    return semihosting_enabled(is_user) && sdbbp_code == 1;
 #endif
 }
 
@@ -13898,7 +13899,7 @@ static void decode_opc_special_r6(CPUMIPSState *env, DisasContext *ctx)
         }
         break;
     case R6_OPC_SDBBP:
-        if (is_uhi(extract32(ctx->opcode, 6, 20))) {
+        if (is_uhi(ctx, extract32(ctx->opcode, 6, 20))) {
             ctx->base.is_jmp = DISAS_SEMIHOST;
         } else {
             if (ctx->hflags & MIPS_HFLAG_SBRI) {
@@ -14310,7 +14311,7 @@ static void decode_opc_special2_legacy(CPUMIPSState *env, DisasContext *ctx)
         gen_cl(ctx, op1, rd, rs);
         break;
     case OPC_SDBBP:
-        if (is_uhi(extract32(ctx->opcode, 6, 20))) {
+        if (is_uhi(ctx, extract32(ctx->opcode, 6, 20))) {
             ctx->base.is_jmp = DISAS_SEMIHOST;
         } else {
             /*
diff --git a/target/mips/tcg/micromips_translate.c.inc b/target/mips/tcg/micromips_translate.c.inc
index b2c696f8916..632895cc9ef 100644
--- a/target/mips/tcg/micromips_translate.c.inc
+++ b/target/mips/tcg/micromips_translate.c.inc
@@ -825,7 +825,7 @@ static void gen_pool16c_insn(DisasContext *ctx)
         generate_exception_break(ctx, extract32(ctx->opcode, 0, 4));
         break;
     case SDBBP16:
-        if (is_uhi(extract32(ctx->opcode, 0, 4))) {
+        if (is_uhi(ctx, extract32(ctx->opcode, 0, 4))) {
             ctx->base.is_jmp = DISAS_SEMIHOST;
         } else {
             /*
@@ -941,7 +941,7 @@ static void gen_pool16c_r6_insn(DisasContext *ctx)
             break;
         case R6_SDBBP16:
             /* SDBBP16 */
-            if (is_uhi(extract32(ctx->opcode, 6, 4))) {
+            if (is_uhi(ctx, extract32(ctx->opcode, 6, 4))) {
                 ctx->base.is_jmp = DISAS_SEMIHOST;
             } else {
                 if (ctx->hflags & MIPS_HFLAG_SBRI) {
@@ -1310,7 +1310,7 @@ static void gen_pool32axf(CPUMIPSState *env, DisasContext *ctx, int rt, int rs)
             generate_exception_end(ctx, EXCP_SYSCALL);
             break;
         case SDBBP:
-            if (is_uhi(extract32(ctx->opcode, 16, 10))) {
+            if (is_uhi(ctx, extract32(ctx->opcode, 16, 10))) {
                 ctx->base.is_jmp = DISAS_SEMIHOST;
             } else {
                 check_insn(ctx, ISA_MIPS_R1);
diff --git a/target/mips/tcg/mips16e_translate.c.inc b/target/mips/tcg/mips16e_translate.c.inc
index 7568933e234..918b15d55ce 100644
--- a/target/mips/tcg/mips16e_translate.c.inc
+++ b/target/mips/tcg/mips16e_translate.c.inc
@@ -951,7 +951,7 @@ static int decode_ase_mips16e(CPUMIPSState *env, DisasContext *ctx)
             }
             break;
         case RR_SDBBP:
-            if (is_uhi(extract32(ctx->opcode, 5, 6))) {
+            if (is_uhi(ctx, extract32(ctx->opcode, 5, 6))) {
                 ctx->base.is_jmp = DISAS_SEMIHOST;
             } else {
                 /*
diff --git a/target/mips/tcg/nanomips_translate.c.inc b/target/mips/tcg/nanomips_translate.c.inc
index b3aff22c189..812c111e3c3 100644
--- a/target/mips/tcg/nanomips_translate.c.inc
+++ b/target/mips/tcg/nanomips_translate.c.inc
@@ -3694,7 +3694,7 @@ static int decode_nanomips_32_48_opc(CPUMIPSState *env, DisasContext *ctx)
                 generate_exception_end(ctx, EXCP_BREAK);
                 break;
             case NM_SDBBP:
-                if (is_uhi(extract32(ctx->opcode, 0, 19))) {
+                if (is_uhi(ctx, extract32(ctx->opcode, 0, 19))) {
                     ctx->base.is_jmp = DISAS_SEMIHOST;
                 } else {
                     if (ctx->hflags & MIPS_HFLAG_SBRI) {
@@ -4633,7 +4633,7 @@ static int decode_isa_nanomips(CPUMIPSState *env, DisasContext *ctx)
                 generate_exception_end(ctx, EXCP_BREAK);
                 break;
             case NM_SDBBP16:
-                if (is_uhi(extract32(ctx->opcode, 0, 3))) {
+                if (is_uhi(ctx, extract32(ctx->opcode, 0, 3))) {
                     ctx->base.is_jmp = DISAS_SEMIHOST;
                 } else {
                     if (ctx->hflags & MIPS_HFLAG_SBRI) {
-- 
2.25.1


