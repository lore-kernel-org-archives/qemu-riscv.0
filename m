Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oNfMs-0002kd-MW
	for mharc-qemu-riscv@gnu.org; Mon, 15 Aug 2022 15:03:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oNfMr-0002iI-6D
 for qemu-riscv@nongnu.org; Mon, 15 Aug 2022 15:03:17 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:41952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oNfMn-0006K7-Uu
 for qemu-riscv@nongnu.org; Mon, 15 Aug 2022 15:03:16 -0400
Received: by mail-wr1-x435.google.com with SMTP id p10so10089559wru.8
 for <qemu-riscv@nongnu.org>; Mon, 15 Aug 2022 12:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=xcJI33C1DHi3d9nfTpTX8vbIVhI8bnlvIB9PE8+Un4Y=;
 b=fGwTRY6N33mOaaV0Po25Mvb9X9vuzlD6tq9kPDfxtmqZl5tC9EP8KW79JyrmKrMcc+
 Lt+CxpdU8xluiqCMDlPlOQfGtIChUpMq7EELwW5gt6WbI71ArWbBHOXRlH5gFrH0koAX
 Nno2LhnrMBUf1cCkmVaZbye5CfRXffP5lhfyXMPDqiT85+qUhWBLZ4huqDo3paDvMu5f
 rtkf44MazwUtImHSDfd7BJIhKHa+oFHrEIN0U5u8Koj34CBUFeMg4wY0VY1+2mBcljbv
 LTyAOhnksTRwLFbpmHhIVjQyP6yXzNOZ84UE8PPoMhAEcqmcuzVRXc6BoacMRevttRhZ
 1BWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=xcJI33C1DHi3d9nfTpTX8vbIVhI8bnlvIB9PE8+Un4Y=;
 b=HgSNq9Ml74K3Vv/2TMEtwS0dWaCT+1XsJVoAuA+YRgnhSK8s7jav6iBe9JiyPX8DAH
 Oh/OTQYpinYY3bLD3XtL32f5SyMDqoQj515tqksbAHHMtEZc8nshKm7MH5LBf3/FiSS3
 xC+kQfjKrJDU/c5zkalE08mDkRsdXSjRUYjAUrRNwA519c5jz8iabyqlDU2K0D838cBG
 FRlB/TY1XtD6DECoUfJKdJtmhRMYmonT3WLhg2OoBo81v1p6qPCUJf9wbI1nPVkf9lj7
 OQ47c51GZtAG18PL6OlNhHP3WvpKjp5qJKirvKxhuCARp5aQBBUMaKP3wL7hetlaJocf
 BvnA==
X-Gm-Message-State: ACgBeo1rReMriFl5qYfu95rMJ+yRLw36r/Lg/WRGPajR8OsHtOoeedo9
 kyj3TR9WQmpO2athkYkjPC8I/Q==
X-Google-Smtp-Source: AA6agR6Wtxvj9NHAih2zKbd3lOWryV5blBU5jlq9gCSmJ0I807z74TMiqfnOAX+m6DH6tsASv0Ft5g==
X-Received: by 2002:a5d:5a1b:0:b0:220:638a:86c3 with SMTP id
 bq27-20020a5d5a1b000000b00220638a86c3mr9965862wrb.573.1660590193222; 
 Mon, 15 Aug 2022 12:03:13 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 u4-20020a5d5144000000b00220606afdf4sm8009162wrt.43.2022.08.15.12.03.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Aug 2022 12:03:12 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Stefan Pejic <stefan.pejic@syrmia.com>, Chris Wulff <crwulff@gmail.com>,
 Marek Vasut <marex@denx.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Furquan Shaikh <furquan@rivosinc.com>
Subject: [PATCH 4/7] target/mips: Honour -semihosting-config userspace=on
Date: Mon, 15 Aug 2022 20:03:00 +0100
Message-Id: <20220815190303.2061559-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220815190303.2061559-1-peter.maydell@linaro.org>
References: <20220815190303.2061559-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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
X-List-Received-Date: Mon, 15 Aug 2022 19:03:17 -0000

Honour the commandline -semihosting-config userspace=on option,
instead of always permitting userspace semihosting calls in system
emulation mode, by passing the correct value to the is_userspace
argument of semihosting_enabled().

Note that this is a behaviour change: if the user wants to
do semihosting calls from userspace they must now specifically
enable them on the command line.

MIPS semihosting is not implemented for linux-user builds.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
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


