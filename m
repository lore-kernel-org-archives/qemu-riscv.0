Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D035CC47077
	for <qemu-riscv@archiver.kernel.org>; Tue, 16 Jan 2024 21:03:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rPqW5-0004b1-AK; Tue, 16 Jan 2024 15:58:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rPqW4-0004aa-IF
 for qemu-riscv@nongnu.org; Tue, 16 Jan 2024 15:58:36 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rPqW3-0007aP-29
 for qemu-riscv@nongnu.org; Tue, 16 Jan 2024 15:58:36 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-28e7933c317so812756a91.1
 for <qemu-riscv@nongnu.org>; Tue, 16 Jan 2024 12:58:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1705438713; x=1706043513; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TMz09xcYNz3keGI4UWTDb3bB/98jmD7E1p5KuCSCWqs=;
 b=dceBJQkbEffYybJrELBa3oYy/1sZJbkXL9taFcSVI1pozLPv32MCn4HDO8w0BqDejA
 8nw5gUTJPsrqrILjAszxvbGOhdPu54zuNhSYNJt/xRzT7KrFDmKDChSvxYjq/McPfb/Y
 T7QOQS9CkLb7XukaabNvXutXWWBtM4sJSKb7JOgu534/TwfocFFzSvMDyfWLQJ+LZxGp
 3a/KBFQaT+Zmctb9QRdRPeoCu1wJAfnzF1qQNvoc1C004R4DttJhyYeoMCU3h4X/tsJW
 jv825xKB4Npb2gvletnaWRsu9uLYJj1oqaj4akbk8Aq9GDwdoAgHlby66npMlJWdQLUE
 DJKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705438713; x=1706043513;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TMz09xcYNz3keGI4UWTDb3bB/98jmD7E1p5KuCSCWqs=;
 b=nJeSuAh2b1TV3+uvJ+NvIP07ukJmNPsklU0XEJApR5M1PZn62Ai4/ynqgq6YqsPq3x
 ndZhcGImCzcu86OT2nBVLjxl+9/n/Jf0O/p//keOstO933SXG1P7yk1DSj3fV6BCECdR
 UTfO0P8DsBfMym+fRGLm0Kkx+dtKgvSxeWdaTZ/FWvms8JjHNmwDIUjrIy4L1kX0HplY
 /KzwcWTbiCevF3Xnx85qhWseLzt12CBNuuf2aFRWamGNlYLs8/FsqJL9qAnQIC2lifuo
 yNz0Oc3UUBkWQF3rULsopPHU00ND6cOxejD+SY7hphuT01Wxq4iYAotwNWNzyMm4qKiI
 Pmug==
X-Gm-Message-State: AOJu0YzKvOmYlXXRCqJf74Qab+Pn8n6p9h2s6P46NH02m+xPx4EqXVpL
 kGrdB4RRFpPxRzkriIFHWiLf073VgY9AZQ==
X-Google-Smtp-Source: AGHT+IGi/0Gwglkh7KSOvzb1QqD9dmOpWYO/5OE56ZYiu8APMgVHF4pwpUdUwaPtwEYddThP6tO6nQ==
X-Received: by 2002:a17:90b:ec7:b0:28e:aaaa:34e9 with SMTP id
 gz7-20020a17090b0ec700b0028eaaaa34e9mr662276pjb.51.1705438713683; 
 Tue, 16 Jan 2024 12:58:33 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([152.234.123.64])
 by smtp.gmail.com with ESMTPSA id
 sh2-20020a17090b524200b0028df5c748e4sm11326949pjb.44.2024.01.16.12.58.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jan 2024 12:58:33 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 richard.henderson@linaro.org, max.chou@sifive.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 03/13] target/riscv/gdbstub.c: use 'vlenb' instead of
 shifting 'vlen'
Date: Tue, 16 Jan 2024 17:58:07 -0300
Message-ID: <20240116205817.344178-4-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240116205817.344178-1-dbarboza@ventanamicro.com>
References: <20240116205817.344178-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pj1-x102c.google.com
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


