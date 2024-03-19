Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FC67CD11BF
	for <qemu-riscv@archiver.kernel.org>; Tue, 19 Mar 2024 15:46:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rmbdq-0007em-97; Tue, 19 Mar 2024 11:44:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rmbdg-0006ja-Ev
 for qemu-riscv@nongnu.org; Tue, 19 Mar 2024 11:44:32 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rmbdY-0005B7-Cs
 for qemu-riscv@nongnu.org; Tue, 19 Mar 2024 11:44:32 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-33ff53528ceso1966016f8f.0
 for <qemu-riscv@nongnu.org>; Tue, 19 Mar 2024 08:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710863062; x=1711467862; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DikP2L6ARWdRvFee2b+GuSHD2n5uD5QzEz8674gqbFw=;
 b=zXh3ae0I+/g/ICjQH+F22BreXtfQUlFlBxw9CB5c6raSZYiVC6JPuZ6MNjSwddOPaw
 mMzzCcQ4P5N9omMMZmxhlje91ihdRYgN4yNpt/kN5sPo8GotoFJWI2ZNY0isPkLMYJEO
 yRNyvdzAucfI/rfhoDtBJU4XTJLemHu1BaVauD9WgE1icpVq4p3ZE3pMT+xcQ2ZgydNy
 MrZGBsZmC3SVAqHJhAb7AO211gA9FxjwGhc0jK93+9iDKYtI2NInD/Pqt1LgIMfOXhty
 565CE0LWg/a6/C87pcyznRWWomEmPvtskIwCE1UQPb/xkfWVvsdRsssot69T8YD226u9
 dIIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710863062; x=1711467862;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DikP2L6ARWdRvFee2b+GuSHD2n5uD5QzEz8674gqbFw=;
 b=JNKWdUAsjs5ALBmDdTeIFqhtS5xLgXWy9ANJJefmpGLPc2hGevULAeMQDm4LKMI8GE
 K7frFSzq6PWdlk6yw7xZkjChBXYDKFp4AzP8tmRNlQ50ZthaeLP6131UEUyeTRtFJrCb
 sSkmHyxGiSLsoy3/Y1mOuWFsUU6pC30+LDQtTu8+ZymZnx6BvxJgT6SPaG6Ww4fg2Jui
 ocNu3NK9z/KeF12DErQxQlrcScXlfM+W6EbBIpnhbzxra3QVndgbWLf8LpUwini8rp9s
 yio05OZ3hzLN+t9fwJQeN+khMn8CnhjC6+11HoIVpfIa+iefw/TQeE1jNew8NYBFYbkw
 mOFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWALHd4uEtreg3xrfpyxhHnEAr455m8A+gEHMJcaA+KmQqxS3kNcHv8PyPrrynSrrawAc9pmkxPO8VfxCfPNaW1ECYEA1w=
X-Gm-Message-State: AOJu0YzBfuOk/jZ8MRdCaLe9bbBcFfO8BGoIMM5wDbsVJSH0Hfp/K4Ex
 y1MSoU2sotsVXLaUdf3GsXOiRORWHAM3dN+a0Uj4PGOhjmxK7ltG7DxNUgWnkhqjPAl+Y1b2/Ph
 n
X-Google-Smtp-Source: AGHT+IEJx5mjdFGa37Y+wvYZLXZQwUenWjIV2n3tAdANSv7H6lnRvgL3m/AqbzvingXDJslVgGt31g==
X-Received: by 2002:a5d:5a0e:0:b0:33e:76db:9bf8 with SMTP id
 bq14-20020a5d5a0e000000b0033e76db9bf8mr13665980wrb.68.1710863062221; 
 Tue, 19 Mar 2024 08:44:22 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.166.129])
 by smtp.gmail.com with ESMTPSA id
 w10-20020adff9ca000000b0033e72e104c5sm12592777wrr.34.2024.03.19.08.44.20
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 19 Mar 2024 08:44:21 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Subject: [PATCH-for-9.1 14/27] target/mips: Convert to
 TCGCPUOps::get_cpu_state()
Date: Tue, 19 Mar 2024 16:42:43 +0100
Message-ID: <20240319154258.71206-15-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240319154258.71206-1-philmd@linaro.org>
References: <20240319154258.71206-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Convert cpu_get_tb_cpu_state() to TCGCPUOps::get_cpu_state().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/mips/cpu.h              | 11 -----------
 target/mips/tcg/tcg-internal.h |  2 ++
 target/mips/cpu.c              |  1 +
 target/mips/tcg/translate.c    |  9 +++++++++
 4 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index caa12a2dd3..9d2f7e0194 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -1362,17 +1362,6 @@ void cpu_mips_clock_init(MIPSCPU *cpu);
 /* helper.c */
 target_ulong exception_resume_pc(CPUMIPSState *env);
 
-#define TARGET_HAS_CPU_GET_TB_CPU_STATE
-
-static inline void cpu_get_tb_cpu_state(CPUMIPSState *env, vaddr *pc,
-                                        uint64_t *cs_base, uint32_t *flags)
-{
-    *pc = env->active_tc.PC;
-    *cs_base = 0;
-    *flags = env->hflags & (MIPS_HFLAG_TMASK | MIPS_HFLAG_BMASK |
-                            MIPS_HFLAG_HWRENA_ULR);
-}
-
 /**
  * mips_cpu_create_with_clock:
  * @typename: a MIPS CPU type.
diff --git a/target/mips/tcg/tcg-internal.h b/target/mips/tcg/tcg-internal.h
index aef032c48d..c54d5c64b2 100644
--- a/target/mips/tcg/tcg-internal.h
+++ b/target/mips/tcg/tcg-internal.h
@@ -24,6 +24,8 @@ G_NORETURN void mips_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
 void mips_restore_state_to_opc(CPUState *cs,
                                const TranslationBlock *tb,
                                const uint64_t *data);
+void mips_get_cpu_state(CPUMIPSState *env, vaddr *pc,
+                        uint64_t *cs_base, uint32_t *flags);
 
 const char *mips_exception_name(int32_t exception);
 
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index 8d8f690a53..6cc64b7628 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -551,6 +551,7 @@ static const TCGCPUOps mips_tcg_ops = {
     .initialize = mips_tcg_init,
     .synchronize_from_tb = mips_cpu_synchronize_from_tb,
     .restore_state_to_opc = mips_restore_state_to_opc,
+    .get_cpu_state = mips_get_cpu_state,
 
 #if !defined(CONFIG_USER_ONLY)
     .tlb_fill = mips_cpu_tlb_fill,
diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index 06c108cc9c..4ecac13a8f 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -15581,3 +15581,12 @@ void mips_restore_state_to_opc(CPUState *cs,
         break;
     }
 }
+
+void mips_get_cpu_state(CPUMIPSState *env, vaddr *pc,
+                        uint64_t *cs_base, uint32_t *flags)
+{
+    *pc = env->active_tc.PC;
+    *cs_base = 0;
+    *flags = env->hflags & (MIPS_HFLAG_TMASK | MIPS_HFLAG_BMASK |
+                            MIPS_HFLAG_HWRENA_ULR);
+}
-- 
2.41.0


