Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4E14CD11C2
	for <qemu-riscv@archiver.kernel.org>; Tue, 19 Mar 2024 15:47:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rmbdn-0007PU-0A; Tue, 19 Mar 2024 11:44:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rmbdY-0006A3-TN
 for qemu-riscv@nongnu.org; Tue, 19 Mar 2024 11:44:26 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rmbdJ-00055a-A1
 for qemu-riscv@nongnu.org; Tue, 19 Mar 2024 11:44:22 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-41412e6b2cfso14953675e9.2
 for <qemu-riscv@nongnu.org>; Tue, 19 Mar 2024 08:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710863045; x=1711467845; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9AmlJlFpu+sjCS8Dqdfk+383y3J9XzQtcfIth5cqVHg=;
 b=wsBGyhpCm7bq6NdO5kPpoQWgxeNQSAu4E9qxGVPeq+A6TmDzlNEh8QltvW6QOYP4Ah
 zahqNvc8QiHeoQ34brlJTGbaCQktcZACK5YTEMpYqg111R85zoX1neDLw8fd+CahKdVU
 Te5TatZAonQR8MOF4xObABTLnt1F+SFF78vZfk+4kO75peM68zwdEW4Hr55pDAS8riJU
 eAm0FlXKVG0sOWSs76bWd++bsF2Sejm4coO7WdJr0hU66aor9rfQ3T/t2Kw3s0un8B5q
 kSlMyrSTghrJLJ0OHB6IIOqi6yQ9JqCPZJFfK3+2y+bZsPV6HFp6XDhO+P8h+HF6Ep81
 Y+Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710863045; x=1711467845;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9AmlJlFpu+sjCS8Dqdfk+383y3J9XzQtcfIth5cqVHg=;
 b=HCET4BBBJnUPESJ0UKYh+u7IkuVjAnRaZqo9dNtLQkOJT1n1gMVkP6ZBhuM1acBTIf
 Y7ePVfbTTg/unv91rf/jRfHbEBKDNJntJG2kwI7EbIkVw/FDi6S49hUNR92BTooaA8Na
 2blu63wmLdKKq/svz+vbvAbK/7eFOQQX9RRptGZZmbByNyGXFPYMRPgxteQNlGqPG3d7
 kIif0TTcGd4XkS7JwJAr09ix25/jj63RoqOJKiXW6QtYhs+ANN2Hh21hsCWATP+w0hUM
 9T97VCbRGV5TGPh66K7GmikGhD4lyMPdo9jCj0IiQqjdvQm8U+E8Ebb/w7YTgWAqRKFz
 NSjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3iw1jNQi1fpTVI5xgAM5k+9ku6mPFuUmAyW7jCozkWH0q5T2GPWMxsK6zv7IQ+dQuhUTfX/CJxA4xNZ62ydH8DE24LcE=
X-Gm-Message-State: AOJu0Yw/tUdJcrIinNFfliqdQgrqNpLz6WvuVKJ5eSl8oqmL+8ZLyNcZ
 LyZhvovzDgGXm7JxOYq1qXbSwFyqNE3gM9dcuiwMZKo3r2Hs1cANHcov1DDw3us=
X-Google-Smtp-Source: AGHT+IFy7zrEjqR1StZ5rmVbfkE2sjLNTN6EhwkxLBF+SXaCQYjQ36AVjzQVxBuwVqCGLP8/OsjVbQ==
X-Received: by 2002:a5d:4ac4:0:b0:33e:bf11:a007 with SMTP id
 y4-20020a5d4ac4000000b0033ebf11a007mr10698783wrs.31.1710863045475; 
 Tue, 19 Mar 2024 08:44:05 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.166.129])
 by smtp.gmail.com with ESMTPSA id
 dw11-20020a0560000dcb00b0033b66c2d61esm12575894wrb.48.2024.03.19.08.44.04
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 19 Mar 2024 08:44:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Song Gao <gaosong@loongson.cn>
Subject: [PATCH-for-9.1 11/27] target/loongarch: Convert to
 TCGCPUOps::get_cpu_state()
Date: Tue, 19 Mar 2024 16:42:40 +0100
Message-ID: <20240319154258.71206-12-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240319154258.71206-1-philmd@linaro.org>
References: <20240319154258.71206-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
 target/loongarch/cpu.h | 14 --------------
 target/loongarch/cpu.c | 15 +++++++++++++++
 2 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
index d814ba08dd..14f1d37606 100644
--- a/target/loongarch/cpu.h
+++ b/target/loongarch/cpu.h
@@ -443,20 +443,6 @@ static inline void set_pc(CPULoongArchState *env, uint64_t value)
 #define HW_FLAGS_VA32       0x20
 #define HW_FLAGS_EUEN_ASXE  0x40
 
-#define TARGET_HAS_CPU_GET_TB_CPU_STATE
-
-static inline void cpu_get_tb_cpu_state(CPULoongArchState *env, vaddr *pc,
-                                        uint64_t *cs_base, uint32_t *flags)
-{
-    *pc = env->pc;
-    *cs_base = 0;
-    *flags = env->CSR_CRMD & (R_CSR_CRMD_PLV_MASK | R_CSR_CRMD_PG_MASK);
-    *flags |= FIELD_EX64(env->CSR_EUEN, CSR_EUEN, FPE) * HW_FLAGS_EUEN_FPE;
-    *flags |= FIELD_EX64(env->CSR_EUEN, CSR_EUEN, SXE) * HW_FLAGS_EUEN_SXE;
-    *flags |= FIELD_EX64(env->CSR_EUEN, CSR_EUEN, ASXE) * HW_FLAGS_EUEN_ASXE;
-    *flags |= is_va32(env) * HW_FLAGS_VA32;
-}
-
 #include "exec/cpu-all.h"
 
 #define CPU_RESOLVING_TYPE TYPE_LOONGARCH_CPU
diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index f6ffb3aadb..a2d772ca5f 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -340,6 +340,20 @@ static void loongarch_restore_state_to_opc(CPUState *cs,
 {
     set_pc(cpu_env(cs), data[0]);
 }
+
+static void loongarch_get_cpu_state(CPULoongArchState *env, vaddr *pc,
+                                    uint64_t *cs_base, uint32_t *flags)
+{
+    *pc = env->pc;
+    *cs_base = 0;
+    *flags = env->CSR_CRMD & (R_CSR_CRMD_PLV_MASK | R_CSR_CRMD_PG_MASK);
+    *flags |= FIELD_EX64(env->CSR_EUEN, CSR_EUEN, FPE) * HW_FLAGS_EUEN_FPE;
+    *flags |= FIELD_EX64(env->CSR_EUEN, CSR_EUEN, SXE) * HW_FLAGS_EUEN_SXE;
+    *flags |= FIELD_EX64(env->CSR_EUEN, CSR_EUEN, ASXE) * HW_FLAGS_EUEN_ASXE;
+    *flags |= is_va32(env) * HW_FLAGS_VA32;
+}
+
+
 #endif /* CONFIG_TCG */
 
 static bool loongarch_cpu_has_work(CPUState *cs)
@@ -729,6 +743,7 @@ static const TCGCPUOps loongarch_tcg_ops = {
     .initialize = loongarch_translate_init,
     .synchronize_from_tb = loongarch_cpu_synchronize_from_tb,
     .restore_state_to_opc = loongarch_restore_state_to_opc,
+    .get_cpu_state = loongarch_get_cpu_state,
 
 #ifndef CONFIG_USER_ONLY
     .tlb_fill = loongarch_cpu_tlb_fill,
-- 
2.41.0


