Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6C76C4707C
	for <qemu-riscv@archiver.kernel.org>; Fri, 12 Jan 2024 21:40:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rOPEY-0003tS-NV; Fri, 12 Jan 2024 16:38:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rOPEV-0003r6-Ii
 for qemu-riscv@nongnu.org; Fri, 12 Jan 2024 16:38:31 -0500
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rOPET-0001b9-Mb
 for qemu-riscv@nongnu.org; Fri, 12 Jan 2024 16:38:31 -0500
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-6d9cb95ddd1so3299764b3a.1
 for <qemu-riscv@nongnu.org>; Fri, 12 Jan 2024 13:38:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1705095508; x=1705700308; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U9YxTyhvBJBHZnpiGwupT/MZk+RpUH5/F7uqSrQEr/Q=;
 b=D9FYKsAS/ZFy4hXL3dfewcpogNXNm6ACSFmEjKDGbUoaHL39fP8yhR0GH3kCPVb4Za
 P99K1SqnVbCAFvBgW0IeOrfj0L658zjh9slo6dMuOp+mgjqsj8RW8nAfpI9MR3VhwR+A
 U3stFb5zHwERCZP2SYeoC0s8IHGhShoQOC0sLBnLQ1E0nkmCABruOvmsB4DqRrlzTvP+
 dKOteK4fKxvV+m0HsPhYh4x5DbJSZL1CGsHPgFPg/fQ0G7pDUg9BORTzBpYfm7fAbgU6
 D6OU8PysvuM+aWfFEQRZG9NB3n1F0cHWOPyUlFIGB8zK9jzo2nJq5kQeTHJlxDC4aXtY
 Uv8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705095508; x=1705700308;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U9YxTyhvBJBHZnpiGwupT/MZk+RpUH5/F7uqSrQEr/Q=;
 b=EnsvHIAZj+HvyXqxcREWlJK6F76dM6RIsxBVIliRuJJbyh1hmuutNSkQGCKLeftGf8
 eZZvSC6UEFAm4a9qVtXoY+06/1n8alMSno4CESGlj9QA510BUJ4e3pZCd7FwBT3Bqwm8
 7bVKzxFSvBYDz6u0arpWaaLGfBnz6N9DsYGW/uOYpM85pDCex6p10khUo3cl9OPircPW
 oXC1yOpU99DG004LaRsdPhm0JjCygQK86FM2NJ9wQG9J49DenTBaOstdz7U1zruyZtXP
 CIBnVUmjMjeeVRCUz87FcZi6FGPaFQ0D0HZiSzrqb+qcEJaqLVLl6dRDIBQwxM/zQ5F5
 0M2w==
X-Gm-Message-State: AOJu0Yx1miSwdWSSB5sj3fUh6nM04GkQj2BZ9ELGYgcxflpyz5IGMQ0o
 To00QtpRkROUOBKF8FS8Lm8b4TvgeS9c9g==
X-Google-Smtp-Source: AGHT+IExE0N3ou/wp0WsVjsM3fEJwxupNlFH9odq8LCGv6mZHgAHn8sMvBH8PILm7i8Ey5UdPuXRQg==
X-Received: by 2002:a17:902:d14a:b0:1d4:3b5b:7aab with SMTP id
 t10-20020a170902d14a00b001d43b5b7aabmr1128064plt.132.1705095508111; 
 Fri, 12 Jan 2024 13:38:28 -0800 (PST)
Received: from grind.. ([152.234.123.64]) by smtp.gmail.com with ESMTPSA id
 lf8-20020a170902fb4800b001d5b2967d00sm364727plb.290.2024.01.12.13.38.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jan 2024 13:38:27 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 richard.henderson@linaro.org, max.chou@sifive.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 03/13] target/riscv/gdbstub.c: use 'vlenb' instead of shifting
 'vlen'
Date: Fri, 12 Jan 2024 18:38:02 -0300
Message-ID: <20240112213812.173521-4-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240112213812.173521-1-dbarboza@ventanamicro.com>
References: <20240112213812.173521-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x42e.google.com
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

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/gdbstub.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
index 58b3ace0fe..5ab0abda19 100644
--- a/target/riscv/gdbstub.c
+++ b/target/riscv/gdbstub.c
@@ -130,7 +130,7 @@ static int riscv_gdb_set_fpu(CPURISCVState *env, uint8_t *mem_buf, int n)
 
 static int riscv_gdb_get_vector(CPURISCVState *env, GByteArray *buf, int n)
 {
-    uint16_t vlenb = riscv_cpu_cfg(env)->vlen >> 3;
+    uint16_t vlenb = riscv_cpu_cfg(env)->vlenb;
     if (n < 32) {
         int i;
         int cnt = 0;
@@ -146,7 +146,7 @@ static int riscv_gdb_get_vector(CPURISCVState *env, GByteArray *buf, int n)
 
 static int riscv_gdb_set_vector(CPURISCVState *env, uint8_t *mem_buf, int n)
 {
-    uint16_t vlenb = riscv_cpu_cfg(env)->vlen >> 3;
+    uint16_t vlenb = riscv_cpu_cfg(env)->vlenb;
     if (n < 32) {
         int i;
         for (i = 0; i < vlenb; i += 8) {
@@ -266,7 +266,7 @@ static int ricsv_gen_dynamic_vector_xml(CPUState *cs, int base_reg)
     RISCVCPU *cpu = RISCV_CPU(cs);
     GString *s = g_string_new(NULL);
     g_autoptr(GString) ts = g_string_new("");
-    int reg_width = cpu->cfg.vlen;
+    int reg_width = cpu->cfg.vlenb << 3;
     int num_regs = 0;
     int i;
 
-- 
2.43.0


