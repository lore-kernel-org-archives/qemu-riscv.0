Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B04E1CD11C2
	for <qemu-riscv@archiver.kernel.org>; Tue, 19 Mar 2024 15:45:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rmbca-0005MA-83; Tue, 19 Mar 2024 11:43:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rmbcZ-0005Le-8P
 for qemu-riscv@nongnu.org; Tue, 19 Mar 2024 11:43:23 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rmbcX-0004om-KI
 for qemu-riscv@nongnu.org; Tue, 19 Mar 2024 11:43:22 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3416df43cabso1430257f8f.3
 for <qemu-riscv@nongnu.org>; Tue, 19 Mar 2024 08:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710863000; x=1711467800; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qQ0F9e1tiLbg+1mSpsh71oFSOMQcPQZFv/kc9q+gvBc=;
 b=U3+Hk1+1IjfFgD9aUYE90eQUkdWhVW7+WQckOfPjvpH2kLWDDBY266+fl9Ic9II09V
 AQPHxh4jYUboYmFXULIrNLfvr8VA0bPwMqrO3iZwe6BXskLp8lthxNNEdGhcSByFn4cD
 R+09jq68w/x3ZYk2cX+nXKwUbbwG0tll+Fcico3pdySZyuynb1rBaGEh9qdrkzRqQxjX
 xW1cVi+KhUQEAGleQzcL47orwYrsUWQqDLqOZ6rtw8fyZv2VP3tBU+jGmXXQqNNAQ9/o
 jSEiD4ieZWNXeQ1XatVYbz0OxDvEL7TCgyb6FZVHPc1qcjJ8xkBlOZK1mKt0whmV6uKN
 nn+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710863000; x=1711467800;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qQ0F9e1tiLbg+1mSpsh71oFSOMQcPQZFv/kc9q+gvBc=;
 b=WRAtD7JZYWawHO4Asq1hsrMiDWE2GhU2ZKuKAgrCCKME588sQ67aQpmfdeR4i2Wgzc
 CjjhGWISVewaU0KDD09g9283axUZkLoHP5L8uzxnF3t7z2ftTqqebaSYoFsPBk6y9riu
 jaN7kAihS/2Q0/wmX2WpitP9U2QIIaIqtU35UIKSeOUTndQmoPzoCn7U/4+Iu5vES5zV
 rSza1fi34McOOdHSi8TvORVwO4RMvxEzmhOjnpXinFhk/CbC0caqH/pKB+8zp+q0+Adp
 R/uY0D67K8MKkvd0jk3MiK2uzPY1NI7XZxZxirNWPv5BQCpcUUlH5q/6QUW6WYhGmFBr
 xhzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGiZOOU9Ja1bedDZapjRXI1W6JQkF26HkDg7r/MMcuub/eCy5G/5GYwywofmGqsjk7R9HYDLzfiJwxzC/DOOnwiz0Q054=
X-Gm-Message-State: AOJu0Yy/AkSRU+4zGWqrPOWetufar5LxEXO3lV1TZbBVk6TbSnnFCCb7
 St5aE9LQ/HXDjKzDfdWrYLoeE1e0JCY1aZDxJru8doPjj0fyA3BsAzDOu6UmHUI=
X-Google-Smtp-Source: AGHT+IHNkIwxgTmLvtVpyDQh9Jev5XDRlN3i5jmRdH9rVkzOnNPPl32YeVx/fJc8BU8Spf6Qr6HJBA==
X-Received: by 2002:a05:6000:184b:b0:33f:8e6d:ab7c with SMTP id
 c11-20020a056000184b00b0033f8e6dab7cmr8021706wri.71.1710863000174; 
 Tue, 19 Mar 2024 08:43:20 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.166.129])
 by smtp.gmail.com with ESMTPSA id
 i2-20020adff302000000b0033e9fca1e49sm12609575wro.60.2024.03.19.08.43.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 19 Mar 2024 08:43:19 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-9.1 03/27] target/alpha: Convert to
 TCGCPUOps::get_cpu_state()
Date: Tue, 19 Mar 2024 16:42:32 +0100
Message-ID: <20240319154258.71206-4-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240319154258.71206-1-philmd@linaro.org>
References: <20240319154258.71206-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
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
 target/alpha/cpu.h | 13 -------------
 target/alpha/cpu.c | 12 ++++++++++++
 2 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/target/alpha/cpu.h b/target/alpha/cpu.h
index 16b0f8a097..b7f294d08a 100644
--- a/target/alpha/cpu.h
+++ b/target/alpha/cpu.h
@@ -467,19 +467,6 @@ void alpha_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
                                      MemTxResult response, uintptr_t retaddr);
 #endif
 
-#define TARGET_HAS_CPU_GET_TB_CPU_STATE
-
-static inline void cpu_get_tb_cpu_state(CPUAlphaState *env, vaddr *pc,
-                                        uint64_t *cs_base, uint32_t *pflags)
-{
-    *pc = env->pc;
-    *cs_base = 0;
-    *pflags = env->flags & ENV_FLAG_TB_MASK;
-#ifdef CONFIG_USER_ONLY
-    *pflags |= TB_FLAG_UNALIGN * !env_cpu(env)->prctl_unalign_sigbus;
-#endif
-}
-
 #ifdef CONFIG_USER_ONLY
 /* Copied from linux ieee_swcr_to_fpcr.  */
 static inline uint64_t alpha_ieee_swcr_to_fpcr(uint64_t swcr)
diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
index 05f9ee41e9..7efeda02dc 100644
--- a/target/alpha/cpu.c
+++ b/target/alpha/cpu.c
@@ -49,6 +49,17 @@ static void alpha_restore_state_to_opc(CPUState *cs,
     cpu->env.pc = data[0];
 }
 
+static void alpha_get_cpu_state(CPUAlphaState *env, vaddr *pc,
+                                uint64_t *cs_base, uint32_t *pflags)
+{
+    *pc = env->pc;
+    *cs_base = 0;
+    *pflags = env->flags & ENV_FLAG_TB_MASK;
+#ifdef CONFIG_USER_ONLY
+    *pflags |= TB_FLAG_UNALIGN * !env_cpu(env)->prctl_unalign_sigbus;
+#endif
+}
+
 static bool alpha_cpu_has_work(CPUState *cs)
 {
     /* Here we are checking to see if the CPU should wake up from HALT.
@@ -194,6 +205,7 @@ static const struct SysemuCPUOps alpha_sysemu_ops = {
 static const TCGCPUOps alpha_tcg_ops = {
     .initialize = alpha_translate_init,
     .restore_state_to_opc = alpha_restore_state_to_opc,
+    .get_cpu_state = alpha_get_cpu_state,
 
 #ifdef CONFIG_USER_ONLY
     .record_sigsegv = alpha_cpu_record_sigsegv,
-- 
2.41.0


