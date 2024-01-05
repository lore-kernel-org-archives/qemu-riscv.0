Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4721AC3DA6E
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 23:08:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLtGX-0002HT-Vp; Fri, 05 Jan 2024 18:06:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rLtGX-0002Gy-0X
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 18:06:13 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rLtGT-0002Hj-Rr
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 18:06:12 -0500
Received: by mail-pg1-x52f.google.com with SMTP id
 41be03b00d2f7-5ce942efda5so47412a12.2
 for <qemu-riscv@nongnu.org>; Fri, 05 Jan 2024 15:06:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1704495968; x=1705100768; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CR3P1CyFIwU/prZir9G66Ueg2vl6mRW09ZOo4BcguKI=;
 b=Lu2IHyOwc4IYKLJOD4JubK40cT7nm110Zdys2q9v/NC2IylB6HgEGqCtRtFTWUsmGb
 RkrbX75l5uC9bQYtSBfqM7R5n/YATYTGIF7KdfujTRV/8rk5cugVQmde52fnI+arj2NH
 +JuRX1MJ5xAlNMhUfLfHvQ6e+gTx3qPyrszhyYDY5xyhTAOYP0zb3kJhW451XXh3ibSP
 5Xew5eNb92qA8Q8HPXy5URul+ll6crGmTBb34FdpP3KFG/lJRc8dSk8s5/kfppTKyj/7
 9Ltas3CVCDHtIL88ISIHsn99Nakj7KZ0nfZTuVrfW1BYzr406b+D4+25D2hd3XMvXZRi
 aM9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704495968; x=1705100768;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CR3P1CyFIwU/prZir9G66Ueg2vl6mRW09ZOo4BcguKI=;
 b=bsTjzSrxMDz7BlLA6WF9GJSjpKCSiwaMUdSdPie67EF54fzv4wgikxCB48Ssb7n6pp
 6B0zhKWTPQYWq/y2jhAW/yNtMHCfh9xRwd9C8eHmGmbNH57B2k0gN3OKJX9RkD5JC47P
 iHQ/X2ajomBrxL9/pvMwm62aI/cS9rykGNg8cDiny8HkAqVaQDiac/ekYLIzOLzZy1Fg
 plTYh6shpNwp8nHQLEHIoPGbRXL2bCnsD+/H6o6VmmM+mga8UWB5WComa3/f3MB09mYv
 pPCkafE1S9sOounbPjqG6otdNsK0dyho6VCDcipqfLWvxm0V+b5vANI4GGbDhsLu3cGF
 9XvQ==
X-Gm-Message-State: AOJu0YzNF+aKBDUDj8UEXx6DBnfyLz50FLVxb4Ktmca/8GT4H/pGhsU8
 sqQIO6OfT2K8EbN7vuC2v1RRCGzNBGuKng==
X-Google-Smtp-Source: AGHT+IE/qn47DjXOieLenBM/UmGGxvXJEssvTQnx/wMDF72YJ1mbMDaSfGCThTg/SathIyZzCmJCBA==
X-Received: by 2002:a05:6a20:1b15:b0:199:b2:92c4 with SMTP id
 ch21-20020a056a201b1500b0019900b292c4mr87853pzb.51.1704495968422; 
 Fri, 05 Jan 2024 15:06:08 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([152.234.127.254])
 by smtp.gmail.com with ESMTPSA id
 r19-20020aa78b93000000b006dacfab07b6sm1849249pfd.121.2024.01.05.15.06.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jan 2024 15:06:08 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v4 05/17] target/riscv: move 'pmp' to riscv_cpu_properties[]
Date: Fri,  5 Jan 2024 20:05:34 -0300
Message-ID: <20240105230546.265053-6-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240105230546.265053-1-dbarboza@ventanamicro.com>
References: <20240105230546.265053-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pg1-x52f.google.com
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

Move 'pmp' to riscv_cpu_properties[], creating a new setter() for it
that forbids 'pmp' to be changed in vendor CPUs, like we did with the
'mmu' option.

We'll also have to manually set 'pmp = true' to generic CPUs that were
still relying on the previous default to set it.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 38 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 36 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 891a3b630b..df8e0b43f7 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -438,6 +438,7 @@ static void riscv_max_cpu_init(Object *obj)
     RISCVMXL mlx = MXL_RV64;
 
     cpu->cfg.mmu = true;
+    cpu->cfg.pmp = true;
 
 #ifdef TARGET_RISCV32
     mlx = MXL_RV32;
@@ -457,6 +458,7 @@ static void rv64_base_cpu_init(Object *obj)
     CPURISCVState *env = &cpu->env;
 
     cpu->cfg.mmu = true;
+    cpu->cfg.pmp = true;
 
     /* We set this in the realise function */
     riscv_cpu_set_misa(env, MXL_RV64, 0);
@@ -586,6 +588,7 @@ static void rv128_base_cpu_init(Object *obj)
     }
 
     cpu->cfg.mmu = true;
+    cpu->cfg.pmp = true;
 
     /* We set this in the realise function */
     riscv_cpu_set_misa(env, MXL_RV128, 0);
@@ -624,6 +627,7 @@ static void rv32_base_cpu_init(Object *obj)
     CPURISCVState *env = &cpu->env;
 
     cpu->cfg.mmu = true;
+    cpu->cfg.pmp = true;
 
     /* We set this in the realise function */
     riscv_cpu_set_misa(env, MXL_RV32, 0);
@@ -1640,9 +1644,38 @@ static const PropertyInfo prop_mmu = {
     .set = prop_mmu_set,
 };
 
-Property riscv_cpu_options[] = {
-    DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
+static void prop_pmp_set(Object *obj, Visitor *v, const char *name,
+                         void *opaque, Error **errp)
+{
+    RISCVCPU *cpu = RISCV_CPU(obj);
+    bool value;
+
+    visit_type_bool(v, name, &value, errp);
 
+    if (cpu->cfg.pmp != value && riscv_cpu_is_vendor(obj)) {
+        cpu_set_prop_err(cpu, name, errp);
+        return;
+    }
+
+    cpu_option_add_user_setting(name, value);
+    cpu->cfg.pmp = value;
+}
+
+static void prop_pmp_get(Object *obj, Visitor *v, const char *name,
+                         void *opaque, Error **errp)
+{
+    bool value = RISCV_CPU(obj)->cfg.pmp;
+
+    visit_type_bool(v, name, &value, errp);
+}
+
+static const PropertyInfo prop_pmp = {
+    .name = "pmp",
+    .get = prop_pmp_get,
+    .set = prop_pmp_set,
+};
+
+Property riscv_cpu_options[] = {
     DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
     DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),
 
@@ -1730,6 +1763,7 @@ static Property riscv_cpu_properties[] = {
     {.name = "pmu-num", .info = &prop_pmu_num}, /* Deprecated */
 
     {.name = "mmu", .info = &prop_mmu},
+    {.name = "pmp", .info = &prop_pmp},
 
 #ifndef CONFIG_USER_ONLY
     DEFINE_PROP_UINT64("resetvec", RISCVCPU, env.resetvec, DEFAULT_RSTVEC),
-- 
2.43.0


