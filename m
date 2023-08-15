Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 801DFC001DF
	for <qemu-riscv@archiver.kernel.org>; Tue, 15 Aug 2023 22:38:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qW2g9-000557-KO; Tue, 15 Aug 2023 18:38:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qW2g8-00054i-OM
 for qemu-riscv@nongnu.org; Tue, 15 Aug 2023 18:38:20 -0400
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qW2g5-0006GC-Pb
 for qemu-riscv@nongnu.org; Tue, 15 Aug 2023 18:38:20 -0400
Received: by mail-oi1-x22d.google.com with SMTP id
 5614622812f47-3a7d4030621so3131479b6e.3
 for <qemu-riscv@nongnu.org>; Tue, 15 Aug 2023 15:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1692139095; x=1692743895;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jdvtnTfpm5nlHaJOuQRLHTGZ2dN8WukD/+/ZCb/h8bk=;
 b=nysIkfgAJ+c+RU/yye69SKouRfhPiOBKcF3ow0KYT+8Y9oQ1vSuQccarCwLgIRQAHA
 ZCjkRMQVxSCEtsRPaYXcbCb3SOXjuqiSCQIn1oDkwNGJZGLH+I4zvXb0fAX5re/wS5ER
 D87Tad8/bZbGxUiZicuSsd6YhMcDvpF7bwacXyBc/l8cY4+ySsgcJDXzUdFhR8v5DyLU
 ezgHueFs0PHlKc3rWenFVn+/KofqiDf+aqnn++hFGuMbwsOm/5qTRYjWojAapqOgXKi9
 z2wa7JMViQqL3deg8foTJyFXRKTUbrT8Ryv7kjMZNyeBZhReswi8jXKfpAIlBeVAj+eA
 W08A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692139095; x=1692743895;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jdvtnTfpm5nlHaJOuQRLHTGZ2dN8WukD/+/ZCb/h8bk=;
 b=lW6q7tNuUZhIQN0hEyPqEbw2sv14XTNela9DtWXM277tUtFVSJqWQkd1SNYvGG9BML
 blr4JfX/fUmyRf2X6Vb+E9jcJp/cS8WGyrzu12W1f5WnvMoSjACKQHMVyuQIrM1V2woj
 sCW/Qaotmw8zWDRshUDkYl4nw0kvIwAoNZ9SfqrVR8PiVZ8jDVxdSk+3f/2eeuqQwR0P
 MN/F+adF/VrHDAFN4jdI2vOwdANDd1+KQIVIslGYdlqrZGif8LLk8jMtjF+uJf4PRKl3
 Hk7dpZOi6UBHEk1DepmHkIaSCkl0860FqZEgjqVVVAWjuh8sV5D2JhafqomIwNBTCYAO
 /5BQ==
X-Gm-Message-State: AOJu0Yxovp+xtb8UHDxzuT0TuT7D3IBHQj4SwbGIpBRkNcf3V+5lRJpv
 fup3Ojn9HW1XrZVyPmLLEjkBvA==
X-Google-Smtp-Source: AGHT+IFbnD4n36W2w4aTkcC5DO5q5KgDxflExOn6OwDXbUz/yn+yX/JmYXq0mceArGyFrYQR7hYSBQ==
X-Received: by 2002:a05:6808:2809:b0:3a7:5453:a622 with SMTP id
 et9-20020a056808280900b003a75453a622mr46222oib.17.1692139095602; 
 Tue, 15 Aug 2023 15:38:15 -0700 (PDT)
Received: from grind.. (189-69-160-189.dial-up.telesp.net.br. [189.69.160.189])
 by smtp.gmail.com with ESMTPSA id
 be15-20020a056808218f00b003a40b3fce01sm5903418oib.10.2023.08.15.15.38.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Aug 2023 15:38:15 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v8 09/12] target/riscv/cpu.c: limit cfg->vext_spec log message
Date: Tue, 15 Aug 2023 19:37:38 -0300
Message-ID: <20230815223741.433763-10-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230815223741.433763-1-dbarboza@ventanamicro.com>
References: <20230815223741.433763-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
index 3636cfaf2f..eb5fe93030 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -937,8 +937,6 @@ static void riscv_cpu_disas_set_info(CPUState *s, disassemble_info *info)
 static void riscv_cpu_validate_v(CPURISCVState *env, RISCVCPUConfig *cfg,
                                  Error **errp)
 {
-    int vext_version = VEXT_VERSION_1_00_0;
-
     if (!is_power_of_2(cfg->vlen)) {
         error_setg(errp, "Vector extension VLEN must be power of 2");
         return;
@@ -961,17 +959,18 @@ static void riscv_cpu_validate_v(CPURISCVState *env, RISCVCPUConfig *cfg,
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


