Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A30CC46CD2
	for <qemu-riscv@archiver.kernel.org>; Tue,  9 Jan 2024 10:30:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rN9Mv-00064m-68; Tue, 09 Jan 2024 05:30:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1rN9Mt-00062k-Ln; Tue, 09 Jan 2024 05:29:59 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1rN9Mq-0005yR-V0; Tue, 09 Jan 2024 05:29:58 -0500
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a28b0207c1dso217775266b.3; 
 Tue, 09 Jan 2024 02:29:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704796195; x=1705400995; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4/OpRYAMbJ2LfLgRhQk17S0oPjV2lUKy2m5rI491Lvc=;
 b=DOKxOouKCa2fxzjwksL2JJ8+IM2Gpwb7VPOPCMLqLLD64Hod/PFm5pc9LyaA7PlcFH
 Ulqk1AG8CGTbC9bBn/K10vNQrNXD/s/KiSD4aVTIc62c1lRKeIrT5Os8H2u5sN2sWsKl
 BdgzAhoUZuAnh+dHwlMaG00/atstEo6tUvwAIKk37PLlny70l40xKTMJrhlpnqG748Nn
 HiWvbE4NpunPmBh11YnlmOoI4XZYmJ+48SBgwgPmjqjLrKSPa46PNQx9gfVUdSao2xEO
 bP0rEQEBg3BlXTHu1qpuXPDHuCoBnBLptul0IYrz0kK2i2lJ1fpu83LAWMgDmH0Ig5Dn
 b8rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704796195; x=1705400995;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4/OpRYAMbJ2LfLgRhQk17S0oPjV2lUKy2m5rI491Lvc=;
 b=XHHKzi1yM5pVC/Qu7jbYRWn/G2Rh8UTzKboswCTtvyo6fi+3kLQhk9/wWdAWkgdzBX
 DYUBNEtPPwpfaOqtFfDyW4wVaAnNsv9qvYjJYZS2ZUOaaxIs4f/UsXtK5rYcoyi5z73G
 AIMq7gU5Cz46bz21FXG9RW6RDmhXTqnZqn/RP3T4hTNcehbEaJ4hUeFJVdboTVgDniqR
 A6KUTSrtGVA/qVA5GlHcpFEscMtHsxtydY2/A34TuD8XQ/Dy+/5i64b7eagJ17xAwWr+
 DikvGat9DxrE78elccVrMSYH/Tzoi/bDq03Ri3l+rOOlg+wiH4a1JpHmzuXbgPYC3YxB
 B9aQ==
X-Gm-Message-State: AOJu0YyctzQSWQ8/y5UPPShHKBmTS5RKhahwzt1Dt+q0ALIMP6E6mZsy
 QzMHC6759EgC1XiBFDDzKqo=
X-Google-Smtp-Source: AGHT+IGAm+lVIbKU5VvQdEXK+0dERfremIzRKDiSIU2EYOZxUFkwdCU2ekRi4vN8dB5xzA2efpYuEw==
X-Received: by 2002:a17:906:5805:b0:a27:cf4a:607b with SMTP id
 m5-20020a170906580500b00a27cf4a607bmr534015ejq.52.1704796195223; 
 Tue, 09 Jan 2024 02:29:55 -0800 (PST)
Received: from freya.midgard (broadband-188-255-126-251.ip.moscow.rt.ru.
 [188.255.126.251]) by smtp.gmail.com with ESMTPSA id
 d24-20020a170906175800b00a26ac037ff3sm869643eje.132.2024.01.09.02.29.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 02:29:54 -0800 (PST)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <me@deliversmonkey.space>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org,
 zhiwei_liu@linux.alibaba.com, palmer@dabbelt.com, Alistair.Francis@wdc.com,
 sagark@eecs.berkeley.edu, kbastian@mail.uni-paderborn.de,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Subject: [PATCH v4 4/6] target/riscv: Add pointer masking tb flags
Date: Tue,  9 Jan 2024 10:29:28 +0000
Message-Id: <20240109102930.405323-5-me@deliversmonkey.space>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240109102930.405323-1-me@deliversmonkey.space>
References: <20240109102930.405323-1-me@deliversmonkey.space>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=baturo.alexey@gmail.com; helo=mail-ej1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

From: Alexey Baturo <baturo.alexey@gmail.com>

Signed-off-by: Alexey Baturo <baturo.alexey@gmail.com>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu.h        | 3 +++
 target/riscv/cpu_helper.c | 3 +++
 target/riscv/translate.c  | 5 +++++
 3 files changed, 11 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 1c8979c1c8..0284ea418f 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -545,6 +545,9 @@ FIELD(TB_FLAGS, ITRIGGER, 20, 1)
 FIELD(TB_FLAGS, VIRT_ENABLED, 21, 1)
 FIELD(TB_FLAGS, PRIV, 22, 2)
 FIELD(TB_FLAGS, AXL, 24, 2)
+/* If pointer masking should be applied and address sign extended */
+FIELD(TB_FLAGS, PM_PMM, 26, 2)
+FIELD(TB_FLAGS, PM_SIGNEXTEND, 28, 1)
 
 #ifdef TARGET_RISCV32
 #define riscv_cpu_mxl(env)  ((void)(env), MXL_RV32)
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 9640e4c2c5..67bc51e510 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -68,6 +68,7 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, vaddr *pc,
     RISCVCPU *cpu = env_archcpu(env);
     RISCVExtStatus fs, vs;
     uint32_t flags = 0;
+    bool pm_signext = riscv_cpu_virt_mem_enabled(env);
 
     *pc = env->xl == MXL_RV32 ? env->pc & UINT32_MAX : env->pc;
     *cs_base = 0;
@@ -135,6 +136,8 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, vaddr *pc,
     flags = FIELD_DP32(flags, TB_FLAGS, VS, vs);
     flags = FIELD_DP32(flags, TB_FLAGS, XL, env->xl);
     flags = FIELD_DP32(flags, TB_FLAGS, AXL, cpu_address_xl(env));
+    flags = FIELD_DP32(flags, TB_FLAGS, PM_PMM, riscv_pm_get_pmm(env));
+    flags = FIELD_DP32(flags, TB_FLAGS, PM_SIGNEXTEND, pm_signext);
 
     *pflags = flags;
 }
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 6b4b9a671c..2c89d749c0 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -103,6 +103,9 @@ typedef struct DisasContext {
     bool vl_eq_vlmax;
     CPUState *cs;
     TCGv zero;
+    /* actual address width */
+    uint8_t addr_width;
+    bool addr_signed;
     /* Use icount trigger for native debug */
     bool itrigger;
     /* FRM is known to contain a valid value. */
@@ -1176,6 +1179,8 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->xl = FIELD_EX32(tb_flags, TB_FLAGS, XL);
     ctx->address_xl = FIELD_EX32(tb_flags, TB_FLAGS, AXL);
     ctx->cs = cs;
+    ctx->addr_width = 0;
+    ctx->addr_signed = false;
     ctx->itrigger = FIELD_EX32(tb_flags, TB_FLAGS, ITRIGGER);
     ctx->zero = tcg_constant_tl(0);
     ctx->virt_inst_excp = false;
-- 
2.34.1


