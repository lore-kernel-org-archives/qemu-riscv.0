Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92E9AC47DAF
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 16:15:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rRwtX-0006TN-Qo; Mon, 22 Jan 2024 11:11:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rRwtU-0006SS-Js
 for qemu-riscv@nongnu.org; Mon, 22 Jan 2024 11:11:28 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rRwtT-0005Im-4t
 for qemu-riscv@nongnu.org; Mon, 22 Jan 2024 11:11:28 -0500
Received: by mail-pg1-x532.google.com with SMTP id
 41be03b00d2f7-5cf2d73a183so2982108a12.1
 for <qemu-riscv@nongnu.org>; Mon, 22 Jan 2024 08:11:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1705939886; x=1706544686; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7DYo8VrPXlh1AJNySLC/rLx/xCLIPadhg3sHTr+fkec=;
 b=Zx81/P8RwK+4CIt4+/IOVuih8cM0aezfMjrjXBzOt6dRjhkWdhgOZIPpg4nKKQKKec
 L7aK1TjY8dPHuS5RJBGE9jfHmClYe3QQ1ynTYXdM1Yc+pmXZ+Pu4YgSiiAsRiz6KNwxy
 hrhgKYLAUvMtf22sRpwteXSA9tWmnqCQIPZQjXFZHbzoe/Xpk/3o154NNikMSqArXVYn
 SNreXCavZu9P14rsUZkh8Unx2DhWnbDzUB2kv4hO4sbEXc61FKrYA1iGaTjjk2bvKbWi
 mOHVZ5Huu5QyY6JiiaoilFUYcPajv0JjsyGXESatyMvuvTjXqXjUg15J9aEcw3HDk7qd
 xYEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705939886; x=1706544686;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7DYo8VrPXlh1AJNySLC/rLx/xCLIPadhg3sHTr+fkec=;
 b=cVmqMWz8j/qQAhSjjmCzGO3em2WhDNf0mqFIEfcXJhDs1B3D2qxHhMeG3AkzlLYP8O
 tP3J+7MYN4UU5i+J5bH8IO+rRWpZxDaWbBVm7pZB5Zjx2yMx2gFkjPgfKM7byekL/jJo
 eu17drNZ4NjYo1b+o5PPH2OApQ1/Gteyyc1GQJ+ml1a6WJACKn+N4sUh+ic+S9VUeC8H
 6tkw5o2MLMuqgJm6T7Dlfl926RUBCuBSZ0RG6ORHUYWPnmmw/OAVi7hBI2fq59vupaxI
 NWSbe/m9MGx+aKXoBNmQbfoEmCiPJon7MSly6g7UXfFbMqCrI8wtP6VzWW35yU6IxkUc
 UT6g==
X-Gm-Message-State: AOJu0YzQS+s6Chu36EK0kYUcKoBYa1raOKIMWKqOapUyxHS22Ht5+4as
 VSKxSbSFUalqCaraWI82DjExuI/QmB5mI8ZJT9TIBwFnJ4Nt3/C0CPSprrSogCQ=
X-Google-Smtp-Source: AGHT+IEkks5yyX9C7nhNlgXuOzJQfw1/GOWBN/PMFnmdEulC0nWq4kLp8xRfwv4r77CiqZ+Yz8IUkw==
X-Received: by 2002:a17:90a:43a3:b0:28d:1581:29e6 with SMTP id
 r32-20020a17090a43a300b0028d158129e6mr5320566pjg.13.1705939885966; 
 Mon, 22 Jan 2024 08:11:25 -0800 (PST)
Received: from grind.. ([152.234.127.94]) by smtp.gmail.com with ESMTPSA id
 db3-20020a17090ad64300b0028e245501e7sm9866446pjb.4.2024.01.22.08.11.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jan 2024 08:11:25 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 richard.henderson@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v4 03/13] target/riscv/gdbstub.c: use 'vlenb' instead of
 shifting 'vlen'
Date: Mon, 22 Jan 2024 13:10:57 -0300
Message-ID: <20240122161107.26737-4-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122161107.26737-1-dbarboza@ventanamicro.com>
References: <20240122161107.26737-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pg1-x532.google.com
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
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


