Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80B7FC3DA66
	for <qemu-riscv@archiver.kernel.org>; Fri, 25 Aug 2023 13:13:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qZWZC-0001jQ-Mi; Fri, 25 Aug 2023 09:09:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qZWZ4-0001e0-Md
 for qemu-riscv@nongnu.org; Fri, 25 Aug 2023 09:09:28 -0400
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qZWZ0-0006x3-Jv
 for qemu-riscv@nongnu.org; Fri, 25 Aug 2023 09:09:24 -0400
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-1c4d1274f33so569239fac.3
 for <qemu-riscv@nongnu.org>; Fri, 25 Aug 2023 06:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1692968961; x=1693573761;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SlahJq7amgNJXd0IPn13gKG30zx+KvrZ1IpSGdUFOIA=;
 b=oS/HW9808/GjSsGIrPoZQaZtO4900ja+jWLb+84BBfXVlu1y8Ft080yxRKPL0O8tls
 m2kCGr/7AZKpr2jpKhbm2tvyqIRyaRrgi2MOnX5RIvWL+MOPMau2qU+tB4RUIiKUIqD6
 JeOQexU+f0io/RvTYbtnW4D5DnoafuOjOzHH4XU0SfBidJsRvMOf7RTltJAE63+dKSQP
 2hkRr8QPm7RndxdM3OEdRTH1HDzzTDe1Ifp7gjlJ+oTokSARomsp2KvLqeW4hmtoRaDR
 k2KzF52tQvxRGdbQN4tQLwf1NERLs/z3BSadRndpoA6l3wSnL54VxwlkljTSrnTcBn9L
 oUVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692968961; x=1693573761;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SlahJq7amgNJXd0IPn13gKG30zx+KvrZ1IpSGdUFOIA=;
 b=dDJsR8d6YNGTkJqekHoQ/aGAAtwT3fInyTrUJ0o7DZkLgj6I7+hvFDahRqnCvvzVwN
 32WB6AotAiRK+bFtZBKJg4UT3ZlV1tRDYysUPlprtYm5FUmB4mAPsc8za5AGryfzMiYI
 v7GcljY/XO64JZBgqsIt9VId+9b5DB9qDGf+ZMht3eG8ZearWHbW4CnrRLQ7acaVstz9
 VQwZclKgKguXoGOPXYacgxwKJPAo0s9uxvY1+A8ThnkNLbgNyFUz65hEZ49A732kNBOr
 Lt0LZZHB1QtwS4nVvp+vJySfbgufNE4Oo+VS5a/FkM9xF4JeRrYrSGerVwGfJLTs5Lnp
 L5vQ==
X-Gm-Message-State: AOJu0YwvJtix//jkUlNBeY3plFuaMGQOQbTEHJ4HvQ2jZiKq0U6pv4PE
 LS+h0W7fb1jEO29u1Tf+UGLD/Q==
X-Google-Smtp-Source: AGHT+IFjN6aen8knjY9VD1wH4tlI/vD8BGf1ZK4QsMcGaGPJOQ5uFYZ1m5rrstpHaO9IHRQhU7uuRw==
X-Received: by 2002:a05:6870:c081:b0:1b0:649f:e68a with SMTP id
 c1-20020a056870c08100b001b0649fe68amr3105336oad.25.1692968961249; 
 Fri, 25 Aug 2023 06:09:21 -0700 (PDT)
Received: from grind.. ([179.93.21.19]) by smtp.gmail.com with ESMTPSA id
 ds23-20020a0568705b1700b001c50fb56845sm966189oab.16.2023.08.25.06.09.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Aug 2023 06:09:20 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 07/20] target/riscv/cpu.c: add .instance_post_init()
Date: Fri, 25 Aug 2023 10:08:40 -0300
Message-ID: <20230825130853.511782-8-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230825130853.511782-1-dbarboza@ventanamicro.com>
References: <20230825130853.511782-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::35;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x35.google.com
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

All generic CPUs call riscv_cpu_add_user_properties(). The 'max' CPU
calls riscv_init_max_cpu_extensions(). Both can be moved to a common
instance_post_init() callback, implemented in riscv_cpu_post_init(),
called by all CPUs. The call order then becomes:

riscv_cpu_init() -> cpu_init() of each CPU -> .instance_post_init()

A CPU class that wants to add user flags will let us know via the
'user_extension_properties' property. Likewise, 'cfg.max_features' will
determine if any given CPU, regardless of being the 'max' CPU or not,
wants to enable the maximum amount of extensions.

In the near future riscv_cpu_post_init() will call the init() function
of the current accelerator, providing a hook for KVM and TCG accel
classes to change the init() process of the CPU.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index c35d58c64b..f67b782675 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -430,8 +430,6 @@ static void riscv_max_cpu_init(Object *obj)
     mlx = MXL_RV32;
 #endif
     set_misa(env, mlx, 0);
-    riscv_cpu_add_user_properties(obj);
-    riscv_init_max_cpu_extensions(obj);
     env->priv_ver = PRIV_VERSION_LATEST;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(RISCV_CPU(obj), mlx == MXL_RV32 ?
@@ -445,7 +443,6 @@ static void rv64_base_cpu_init(Object *obj)
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     /* We set this in the realise function */
     set_misa(env, MXL_RV64, 0);
-    riscv_cpu_add_user_properties(obj);
     /* Set latest version of privileged specification */
     env->priv_ver = PRIV_VERSION_LATEST;
 #ifndef CONFIG_USER_ONLY
@@ -569,7 +566,6 @@ static void rv128_base_cpu_init(Object *obj)
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     /* We set this in the realise function */
     set_misa(env, MXL_RV128, 0);
-    riscv_cpu_add_user_properties(obj);
     /* Set latest version of privileged specification */
     env->priv_ver = PRIV_VERSION_LATEST;
 #ifndef CONFIG_USER_ONLY
@@ -582,7 +578,6 @@ static void rv32_base_cpu_init(Object *obj)
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     /* We set this in the realise function */
     set_misa(env, MXL_RV32, 0);
-    riscv_cpu_add_user_properties(obj);
     /* Set latest version of privileged specification */
     env->priv_ver = PRIV_VERSION_LATEST;
 #ifndef CONFIG_USER_ONLY
@@ -1212,6 +1207,20 @@ static void riscv_cpu_set_irq(void *opaque, int irq, int level)
 }
 #endif /* CONFIG_USER_ONLY */
 
+static void riscv_cpu_post_init(Object *obj)
+{
+    RISCVCPU *cpu = RISCV_CPU(obj);
+    RISCVCPUClass *rcc = RISCV_CPU_GET_CLASS(cpu);
+
+    if (rcc->user_extension_properties) {
+        riscv_cpu_add_user_properties(obj);
+    }
+
+    if (cpu->cfg.max_features) {
+        riscv_init_max_cpu_extensions(obj);
+    }
+}
+
 static void riscv_cpu_init(Object *obj)
 {
     RISCVCPU *cpu = RISCV_CPU(obj);
@@ -2019,6 +2028,7 @@ static const TypeInfo riscv_cpu_type_infos[] = {
         .instance_size = sizeof(RISCVCPU),
         .instance_align = __alignof__(RISCVCPU),
         .instance_init = riscv_cpu_init,
+        .instance_post_init = riscv_cpu_post_init,
         .abstract = true,
         .class_size = sizeof(RISCVCPUClass),
         .class_init = riscv_cpu_class_init,
-- 
2.41.0


