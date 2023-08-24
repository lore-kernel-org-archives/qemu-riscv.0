Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C531C6FA8F
	for <qemu-riscv@archiver.kernel.org>; Thu, 24 Aug 2023 22:17:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qZIby-0007ya-W9; Thu, 24 Aug 2023 18:15:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qZIbl-0007ol-HN
 for qemu-riscv@nongnu.org; Thu, 24 Aug 2023 18:15:20 -0400
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qZIbi-0006EA-V7
 for qemu-riscv@nongnu.org; Thu, 24 Aug 2023 18:15:17 -0400
Received: by mail-oo1-xc31.google.com with SMTP id
 006d021491bc7-5711f6dff8cso227972eaf.3
 for <qemu-riscv@nongnu.org>; Thu, 24 Aug 2023 15:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1692915313; x=1693520113;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y7kdU3KsFY3nNLyrL+dXU0HtOi61h4KIsFrQB7vflss=;
 b=WdchW6dfJZFF4ujyghCUQJlIXRrVBX9zsqi8nPtNL9w/mCgT9NpFIsI6D14SH2RTfb
 ikQPyVxXVHgPaady1qGEgvpP4gOH0xs3MHh6SV7tLObYGNvi32iA0ZX2Z41hn1gEcxAq
 6NlrJwlQWzUjg2v/h38XLF92R424rjU7PIdqmoYX3RfHaTFdPw5mjbfZKtP3LqOlPLp6
 /CqFuorbLICF6EWMgseEjODAi3r4QXKiFQQPFhvBmhTMvnTcXUTONOwdcjO1qAIlBN8t
 X7PkrYmp8fxw7ps5OKEISo+20lEG+KlTDPxi5tMtPTiDIbvzglvxoliW1XuO227GFVNZ
 /SVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692915313; x=1693520113;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y7kdU3KsFY3nNLyrL+dXU0HtOi61h4KIsFrQB7vflss=;
 b=YxMCxsONyy5Vq0EQin0xCAJPwbgbmO2T1OtdP3yGSLFK9dTJSpjDd9+k+/S02WEO/0
 dVmAWA/07ANacz6IneMCGMwK0BHF+LoCwgWjInZOGCr9mKX4yP8GBBkMwZy0hquh0pl2
 q+Hqu6zkxg14iVA/LgCvsmfKhC5XiGKDeTRj959QsyoBJej03UFCVNG2qQcAQMKI8dQW
 9pGMiTXEbTEwTV9XQWkA2g1DOCy9ukpDFkvXTnEyHYfX1IsbYLCtg1NpyK3TCf3SR2sw
 nUSPtEV6QtdJ85rqTBP1/PA7uqjMAAAWnwYkCxhVKkZFYTVwBmzRXf9HTwzBG22ijKku
 yhsw==
X-Gm-Message-State: AOJu0YyV0KqkfhaFwOIvjXEUw8NlLNXpHPpI9HPKqFZy3nYTepga7/NT
 C4RqTKTOrIat9OCuCBTRg6AHcw==
X-Google-Smtp-Source: AGHT+IEex8L0IJ5LiHPI/cJsBN7qT118qGPlvUF+06++Q6y4/WAF24xHIQTMzA7naOpXQwa76AQvTQ==
X-Received: by 2002:a4a:3918:0:b0:56e:4bb5:3095 with SMTP id
 m24-20020a4a3918000000b0056e4bb53095mr3167077ooa.5.1692915312894; 
 Thu, 24 Aug 2023 15:15:12 -0700 (PDT)
Received: from grind.. ([179.93.21.19]) by smtp.gmail.com with ESMTPSA id
 o129-20020a4a4487000000b00565fcfabab8sm256338ooa.21.2023.08.24.15.15.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Aug 2023 15:15:12 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH RESEND v8 10/20] target/riscv: add 'max' CPU type
Date: Thu, 24 Aug 2023 19:14:30 -0300
Message-ID: <20230824221440.484675-11-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230824221440.484675-1-dbarboza@ventanamicro.com>
References: <20230824221440.484675-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c31;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc31.google.com
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

The 'max' CPU type is used by tooling to determine what's the most
capable CPU a current QEMU version implements. Other archs such as ARM
implements this type. Let's add it to RISC-V.

What we consider "most capable CPU" in this context are related to
ratified, non-vendor extensions. This means that we want the 'max' CPU
to enable all (possible) ratified extensions by default. The reasoning
behind this design is (1) vendor extensions can conflict with each other
and we won't play favorities deciding which one is default or not and
(2) non-ratified extensions are always prone to changes, not being
stable enough to be enabled by default.

All this said, we're still not able to enable all ratified extensions
due to conflicts between them. Zfinx and all its dependencies aren't
enabled because of a conflict with RVF. zce, zcmp and zcmt are also
disabled due to RVD conflicts. When running with 64 bits we're also
disabling zcf.

MISA bits RVG, RVJ and RVV are also being set manually since they're
default disabled.

This is the resulting 'riscv,isa' DT for this new CPU:

rv64imafdcvh_zicbom_zicboz_zicsr_zifencei_zihintpause_zawrs_zfa_
zfh_zfhmin_zca_zcb_zcd_zba_zbb_zbc_zbkb_zbkc_zbkx_zbs_zk_zkn_zknd_
zkne_zknh_zkr_zks_zksed_zksh_zkt_zve32f_zve64f_zve64d_
smstateen_sscofpmf_sstc_svadu_svinval_svnapot_svpbmt

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu-qom.h |  1 +
 target/riscv/cpu.c     | 56 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 57 insertions(+)

diff --git a/target/riscv/cpu-qom.h b/target/riscv/cpu-qom.h
index 04af50983e..f3fbe37a2c 100644
--- a/target/riscv/cpu-qom.h
+++ b/target/riscv/cpu-qom.h
@@ -30,6 +30,7 @@
 #define CPU_RESOLVING_TYPE TYPE_RISCV_CPU
 
 #define TYPE_RISCV_CPU_ANY              RISCV_CPU_TYPE_NAME("any")
+#define TYPE_RISCV_CPU_MAX              RISCV_CPU_TYPE_NAME("max")
 #define TYPE_RISCV_CPU_BASE32           RISCV_CPU_TYPE_NAME("rv32")
 #define TYPE_RISCV_CPU_BASE64           RISCV_CPU_TYPE_NAME("rv64")
 #define TYPE_RISCV_CPU_BASE128          RISCV_CPU_TYPE_NAME("x-rv128")
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 5eb2d7f6da..8dc85f75bb 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -259,6 +259,7 @@ static const char * const riscv_intr_names[] = {
 };
 
 static void riscv_cpu_add_user_properties(Object *obj);
+static void riscv_init_max_cpu_extensions(Object *obj);
 
 const char *riscv_cpu_get_trap_name(target_ulong cause, bool async)
 {
@@ -396,6 +397,25 @@ static void riscv_any_cpu_init(Object *obj)
     cpu->cfg.pmp = true;
 }
 
+static void riscv_max_cpu_init(Object *obj)
+{
+    RISCVCPU *cpu = RISCV_CPU(obj);
+    CPURISCVState *env = &cpu->env;
+    RISCVMXL mlx = MXL_RV64;
+
+#ifdef TARGET_RISCV32
+    mlx = MXL_RV32;
+#endif
+    set_misa(env, mlx, 0);
+    riscv_cpu_add_user_properties(obj);
+    riscv_init_max_cpu_extensions(obj);
+    env->priv_ver = PRIV_VERSION_LATEST;
+#ifndef CONFIG_USER_ONLY
+    set_satp_mode_max_supported(RISCV_CPU(obj), mlx == MXL_RV32 ?
+                                VM_1_10_SV32 : VM_1_10_SV57);
+#endif
+}
+
 #if defined(TARGET_RISCV64)
 static void rv64_base_cpu_init(Object *obj)
 {
@@ -2027,6 +2047,41 @@ static void riscv_cpu_add_user_properties(Object *obj)
     riscv_cpu_add_qdev_prop_array(dev, riscv_cpu_experimental_exts);
 }
 
+/*
+ * The 'max' type CPU will have all possible ratified
+ * non-vendor extensions enabled.
+ */
+static void riscv_init_max_cpu_extensions(Object *obj)
+{
+    RISCVCPU *cpu = RISCV_CPU(obj);
+    CPURISCVState *env = &cpu->env;
+    Property *prop;
+
+    /* Enable RVG, RVJ and RVV that are disabled by default */
+    set_misa(env, env->misa_mxl, env->misa_ext | RVG | RVJ | RVV);
+
+    for (prop = riscv_cpu_extensions; prop && prop->name; prop++) {
+        object_property_set_bool(obj, prop->name, true, NULL);
+    }
+
+    /* set vector version */
+    env->vext_ver = VEXT_VERSION_1_00_0;
+
+    /* Zfinx is not compatible with F. Disable it */
+    object_property_set_bool(obj, "zfinx", false, NULL);
+    object_property_set_bool(obj, "zdinx", false, NULL);
+    object_property_set_bool(obj, "zhinx", false, NULL);
+    object_property_set_bool(obj, "zhinxmin", false, NULL);
+
+    object_property_set_bool(obj, "zce", false, NULL);
+    object_property_set_bool(obj, "zcmp", false, NULL);
+    object_property_set_bool(obj, "zcmt", false, NULL);
+
+    if (env->misa_mxl != MXL_RV32) {
+        object_property_set_bool(obj, "zcf", false, NULL);
+    }
+}
+
 static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("debug", RISCVCPU, cfg.debug, true),
 
@@ -2365,6 +2420,7 @@ static const TypeInfo riscv_cpu_type_infos[] = {
         .abstract = true,
     },
     DEFINE_DYNAMIC_CPU(TYPE_RISCV_CPU_ANY,      riscv_any_cpu_init),
+    DEFINE_DYNAMIC_CPU(TYPE_RISCV_CPU_MAX,      riscv_max_cpu_init),
 #if defined(CONFIG_KVM)
     DEFINE_CPU(TYPE_RISCV_CPU_HOST,             riscv_host_cpu_init),
 #endif
-- 
2.41.0


