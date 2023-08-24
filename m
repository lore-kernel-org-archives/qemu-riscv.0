Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6900C71145
	for <qemu-riscv@archiver.kernel.org>; Thu, 24 Aug 2023 22:17:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qZIbl-0007ok-Ea; Thu, 24 Aug 2023 18:15:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qZIbj-0007nc-7F
 for qemu-riscv@nongnu.org; Thu, 24 Aug 2023 18:15:15 -0400
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qZIbf-0006DV-H4
 for qemu-riscv@nongnu.org; Thu, 24 Aug 2023 18:15:14 -0400
Received: by mail-oo1-xc36.google.com with SMTP id
 006d021491bc7-570ca3e4f63so259174eaf.1
 for <qemu-riscv@nongnu.org>; Thu, 24 Aug 2023 15:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1692915310; x=1693520110;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P16/pDn7xDPkIVisuv7P58BV8fKetyat8VsPlcoAlCQ=;
 b=HzBnDBK0BnikdiyiyXqC7beIkuUvJFVBoEDltGzwUjLWrz3xS1v80eD3BRZLExhFQk
 SklkDKBr9GzBIs8NTtpY6lZ5EDJW1INdo9d1dkPG+h7YiugpyqTJHVl3ABWOGBnnHoAV
 9fiQ+397n4K00yCRmbcXY60DE2pBDJOcyPidb9//gZAHI3cD4f6x41wJCvKvPdDR6Ucr
 Cyqzn+7xpiCyuKVr6EQVMdQfuyzZ1UYlzdIDZb//tgYdThRRIbnQ2r018lTdjJL16ad1
 VACXfB9RVehlIWxXZAGrco8NYPS7O6kwCBy2uFuauvwcWiAzOXE3c7Vp3WbZgSxfMmSs
 8WSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692915310; x=1693520110;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P16/pDn7xDPkIVisuv7P58BV8fKetyat8VsPlcoAlCQ=;
 b=ZnZg2jCZn6YpY81I4CE+uc8YTZ8a+Ri7hks4QUMFK+C8zW5JizAAGrV/+0YV/Kcvub
 xu5OdBOqKD8HIa/ltgW//VJzEvefUgq9EIS9+0LHoYqvtefsAaSOJfYIGBI9WHymOwTj
 nIduPLqfBTcyPO8exgeBeLSyFzHqw5H3HJqkK7ifon74D4nO/FKoLLoOFCd5vz8APhTv
 u6DryPDysXAeeK/QYexNBxN1ZY7Wfzj3lMJVt7eBe//q9QaZcFEYXEifnXJ1cZobXW1I
 1rbpzHo3x1I93AadSoJSd5ktd9g3oiczD11qXFbjaOCvSWIrwbjE+KlfSVh8c83K8u2D
 i4uw==
X-Gm-Message-State: AOJu0YzO2Y0OVCfqC/phpcDYqmohZlD0eWmhi2lFmR+AJub7s0zAJ72a
 9Xbg720CoRbKgDIoTjyIJd1gQw==
X-Google-Smtp-Source: AGHT+IF2kmnG3CKfrBPP8zFRsDQ/BW2I/lAAb4gGMjNhckJZ/24q2hs3IZQ2woEH34xVUWvs8cqF4g==
X-Received: by 2002:a4a:d2c8:0:b0:56d:2cbf:2315 with SMTP id
 j8-20020a4ad2c8000000b0056d2cbf2315mr4104487oos.9.1692915310333; 
 Thu, 24 Aug 2023 15:15:10 -0700 (PDT)
Received: from grind.. ([179.93.21.19]) by smtp.gmail.com with ESMTPSA id
 o129-20020a4a4487000000b00565fcfabab8sm256338ooa.21.2023.08.24.15.15.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Aug 2023 15:15:10 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH RESEND v8 09/20] target/riscv/cpu.c: limit cfg->vext_spec log
 message
Date: Thu, 24 Aug 2023 19:14:29 -0300
Message-ID: <20230824221440.484675-10-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230824221440.484675-1-dbarboza@ventanamicro.com>
References: <20230824221440.484675-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c36;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Inside riscv_cpu_validate_v() we're always throwing a log message if the
user didn't set a vector version via 'vext_spec'.

We're going to include one case with the 'max' CPU where env->vext_ver
will be set in the cpu_init(). But that alone will not stop the "vector
version is not specified" message from appearing. The usefulness of this
log message is debatable for the generic CPUs, but for a 'max' CPU type,
where we are supposed to deliver a CPU model with all features possible,
it's strange to force users to set 'vext_spec' to get rid of this
message.

Change riscv_cpu_validate_v() to not throw this log message if
env->vext_ver is already set.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
---
 target/riscv/cpu.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index d78c2c058f..5eb2d7f6da 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -959,8 +959,6 @@ static void riscv_cpu_disas_set_info(CPUState *s, disassemble_info *info)
 static void riscv_cpu_validate_v(CPURISCVState *env, RISCVCPUConfig *cfg,
                                  Error **errp)
 {
-    int vext_version = VEXT_VERSION_1_00_0;
-
     if (!is_power_of_2(cfg->vlen)) {
         error_setg(errp, "Vector extension VLEN must be power of 2");
         return;
@@ -983,17 +981,18 @@ static void riscv_cpu_validate_v(CPURISCVState *env, RISCVCPUConfig *cfg,
     }
     if (cfg->vext_spec) {
         if (!g_strcmp0(cfg->vext_spec, "v1.0")) {
-            vext_version = VEXT_VERSION_1_00_0;
+            env->vext_ver = VEXT_VERSION_1_00_0;
         } else {
             error_setg(errp, "Unsupported vector spec version '%s'",
                        cfg->vext_spec);
             return;
         }
-    } else {
+    } else if (env->vext_ver == 0) {
         qemu_log("vector version is not specified, "
                  "use the default value v1.0\n");
+
+        env->vext_ver = VEXT_VERSION_1_00_0;
     }
-    env->vext_ver = vext_version;
 }
 
 static void riscv_cpu_validate_priv_spec(RISCVCPU *cpu, Error **errp)
-- 
2.41.0


