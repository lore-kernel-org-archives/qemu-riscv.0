Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 008E9C001B3
	for <qemu-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 18:33:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qGOLf-0007h2-AI; Mon, 03 Jul 2023 14:32:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qGOLe-0007gf-LS
 for qemu-riscv@nongnu.org; Mon, 03 Jul 2023 14:32:30 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qGOLd-0000I9-2K
 for qemu-riscv@nongnu.org; Mon, 03 Jul 2023 14:32:30 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3fbc244d386so50666705e9.2
 for <qemu-riscv@nongnu.org>; Mon, 03 Jul 2023 11:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688409147; x=1691001147;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mBPwvcRHmcNt4ZOYPtGduaaDj2uEPcahpe0nALIk+GY=;
 b=CTbvpAfs7T0B1iUPQTNfMiYVAvEwYF6IQ/GamTfEZRldAteEYIJPiIuMRrwKaF+b1S
 U6ljCBOAL/uk9Ok0zZlChdgbWCp66Y3R8wWpbjXuzjREhmpxJsxcgkN7ajkqsWlNz24F
 12sl1otb2sG4yRYO/6GT1Im7X62XfLaQrFWWkmhINjB7HTguvDqxlwDHeIGv77r+2TOz
 B/eXRnSmYWdA8+TFqdjiSSC+mMNSK2xKqPDUDklV5fUwuT32kOmATielucX6/lM2RzhK
 LY7mqeznxJ4vc1oXE6mnadvuk6tjABwgiofyMUBhw4+rdSIS+0tY+InzLEYv4ksg1sKV
 W+iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688409147; x=1691001147;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mBPwvcRHmcNt4ZOYPtGduaaDj2uEPcahpe0nALIk+GY=;
 b=VSpxXfaZp8JKa2yKmthZK0Hpdi+6/JY6r54J0E8smajCKhi6uGsPbd7pkuLOzvmvQ0
 Ei9azOeghyjZmZ90OMaUyt0abI2FMshfs4VPUKRAgGG+FCyglDKZ96uWHQzWNdQIuEcp
 eAVH/EMbacznmuWuMJISLB/lGzXD+Bgoqp6Yi1pXahO8awlPdB+VHT34zdAUyR0N4/5n
 ktvjXmJmU9hwywxZcFb7GhNwApwZCwV1FidB4hUUbMAinNiuhYGqrO0QEwrOVGNiHi5x
 njLIdtwNG3VyY2anx3BK1W2YdmS8GS2jW9keMIRPruMSZF9YE3SWD4KZnZKr4ScXdFnS
 9LeQ==
X-Gm-Message-State: AC+VfDwM6HssjALqxtD7r++hPKoYu6ZgSKmTrwemXfFernto9zecBXqG
 bpalpFeyMJMjjgvxhIk947vBcQ==
X-Google-Smtp-Source: ACHHUZ7TITM5DPVN0GyzIpU50pY8ycnkaLx+WOyvPXMEFFaUgCSHgjYISfll4U7OmxKQljw1aGA1dA==
X-Received: by 2002:a1c:7219:0:b0:3fa:d160:fc6d with SMTP id
 n25-20020a1c7219000000b003fad160fc6dmr8809224wmc.30.1688409147704; 
 Mon, 03 Jul 2023 11:32:27 -0700 (PDT)
Received: from localhost.localdomain ([176.176.178.91])
 by smtp.gmail.com with ESMTPSA id
 a20-20020a05600c225400b003fbb06af219sm15928744wmm.32.2023.07.03.11.32.25
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 03 Jul 2023 11:32:27 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, kvm@vger.kernel.org,
 qemu-riscv@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Weiwei Li <liweiwei@iscas.ac.cn>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH v2 06/16] target/riscv: Restrict riscv_cpu_do_interrupt() to
 sysemu
Date: Mon,  3 Jul 2023 20:31:35 +0200
Message-Id: <20230703183145.24779-7-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230703183145.24779-1-philmd@linaro.org>
References: <20230703183145.24779-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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

riscv_cpu_do_interrupt() is not reachable on user emulation.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/riscv/cpu.h        | 5 +++--
 target/riscv/cpu_helper.c | 7 ++-----
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 00a4842d84..e6a8087022 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -411,7 +411,6 @@ extern const char * const riscv_int_regnamesh[];
 extern const char * const riscv_fpr_regnames[];
 
 const char *riscv_cpu_get_trap_name(target_ulong cause, bool async);
-void riscv_cpu_do_interrupt(CPUState *cpu);
 int riscv_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
                                int cpuid, DumpState *s);
 int riscv_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cs,
@@ -444,6 +443,7 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp);
 #define cpu_mmu_index riscv_cpu_mmu_index
 
 #ifndef CONFIG_USER_ONLY
+void riscv_cpu_do_interrupt(CPUState *cpu);
 void riscv_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
                                      vaddr addr, unsigned size,
                                      MMUAccessType access_type,
@@ -467,7 +467,8 @@ void riscv_cpu_set_aia_ireg_rmw_fn(CPURISCVState *env, uint32_t priv,
                                    void *rmw_fn_arg);
 
 RISCVException smstateen_acc_ok(CPURISCVState *env, int index, uint64_t bit);
-#endif
+#endif /* !CONFIG_USER_ONLY */
+
 void riscv_cpu_set_mode(CPURISCVState *env, target_ulong newpriv);
 
 void riscv_translate_init(void);
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 0adde26321..597c47bc56 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -1579,7 +1579,6 @@ static target_ulong riscv_transformed_insn(CPURISCVState *env,
 
     return xinsn;
 }
-#endif /* !CONFIG_USER_ONLY */
 
 /*
  * Handle Traps
@@ -1589,8 +1588,6 @@ static target_ulong riscv_transformed_insn(CPURISCVState *env,
  */
 void riscv_cpu_do_interrupt(CPUState *cs)
 {
-#if !defined(CONFIG_USER_ONLY)
-
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
     bool write_gva = false;
@@ -1783,6 +1780,6 @@ void riscv_cpu_do_interrupt(CPUState *cs)
 
     env->two_stage_lookup = false;
     env->two_stage_indirect_lookup = false;
-#endif
-    cs->exception_index = RISCV_EXCP_NONE; /* mark handled to qemu */
 }
+
+#endif /* !CONFIG_USER_ONLY */
-- 
2.38.1


