Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 336E1C001B0
	for <qemu-riscv@archiver.kernel.org>; Tue, 15 Aug 2023 22:39:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qW2gN-0005GE-Jc; Tue, 15 Aug 2023 18:38:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qW2gD-00057L-F6
 for qemu-riscv@nongnu.org; Tue, 15 Aug 2023 18:38:28 -0400
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qW2g7-0006Hj-RX
 for qemu-riscv@nongnu.org; Tue, 15 Aug 2023 18:38:22 -0400
Received: by mail-oi1-x229.google.com with SMTP id
 5614622812f47-3a76d882080so5003954b6e.2
 for <qemu-riscv@nongnu.org>; Tue, 15 Aug 2023 15:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1692139098; x=1692743898;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F0m0U3CwyMqA7c8h8MiNjHPBNyyKu0YsOLLOxEO+RzE=;
 b=ov6fOhzW9LYdB1n1xoGIi0t2wmTxrIeOklo1PhyXfw2Ez6cn0Y9Ips7wXkCmHcZ+LE
 ofIhKg4Dd9claZ5qabdX0KcnDKYsG32Mrklc3He1mHiGhA0p7AFyohZ57JisdIfvCFjs
 6BW/5aU0AJJ/oaBFLhu4KLPOAU00/0u04Fb1vu2v6jOTXwGuvrk00vk5t7unSwFRa7V9
 5VAQV7S7OFeySZT/hAbaNT36OPlCXOkZ4I35gsFpLeSMYQDPtVj0wJPJZEGI93o7Ow2O
 CyNB6m11NmbKuW61YQpYLroIWm80oiDWlUT+nKO8Dw9C8OVmVD31EnTvfvgmCAdTQBsl
 3trA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692139098; x=1692743898;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F0m0U3CwyMqA7c8h8MiNjHPBNyyKu0YsOLLOxEO+RzE=;
 b=hkcb6vSuLuMxT2/+RxFZR06WHcdK7o+I5DNYsTU4/+hgnUv6SPfsOiH39OIWbH2PfL
 7QPlte3TkUCGwAFTS26rFzl4NDE59vgwNEOx/c/8BlrVeRkg1iu4H35l5EdcfeoTPC4I
 rTczLQe9lz5qFjUI8TcVxEySBXb23CsYX+cHQgiwOKpjrfkg0nesng4xAFvmu5CThDw/
 /BIVtzUIN1zw57KUP7Fy4CDxL2tRlCaq2D+YHvbWPQJ3Fn2jxHFXc038QhvbOtQqGmLg
 YLF5gpItny74/YG3k/ofpddwUNwGa7v9qemQRfaH7N1GwviXXmpAkbWayoNnbykGkGnm
 BUHw==
X-Gm-Message-State: AOJu0YyrFZoSZd29c3fr/2vrqmwEukIZru/lnbb3MwUUR/e/jvZp1wqp
 iWl/1CwF3bH24oZgwASBXDAARA==
X-Google-Smtp-Source: AGHT+IExFs1aLvD6bdwaC6hyo8QtP8IiUvyXK7viOEpofp0MewtzOlcIZGYnPwl0ONUiBhDgXRhzHA==
X-Received: by 2002:a05:6808:f10:b0:3a7:4a89:7531 with SMTP id
 m16-20020a0568080f1000b003a74a897531mr77810oiw.10.1692139098454; 
 Tue, 15 Aug 2023 15:38:18 -0700 (PDT)
Received: from grind.. (189-69-160-189.dial-up.telesp.net.br. [189.69.160.189])
 by smtp.gmail.com with ESMTPSA id
 be15-20020a056808218f00b003a40b3fce01sm5903418oib.10.2023.08.15.15.38.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Aug 2023 15:38:18 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v8 10/12] target/riscv: add 'max' CPU type
Date: Tue, 15 Aug 2023 19:37:39 -0300
Message-ID: <20230815223741.433763-11-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230815223741.433763-1-dbarboza@ventanamicro.com>
References: <20230815223741.433763-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x229.google.com
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
index eb5fe93030..326b016723 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -248,6 +248,7 @@ static const char * const riscv_intr_names[] = {
 };
 
 static void riscv_cpu_add_user_properties(Object *obj);
+static void riscv_init_max_cpu_extensions(Object *obj);
 
 const char *riscv_cpu_get_trap_name(target_ulong cause, bool async)
 {
@@ -374,6 +375,25 @@ static void riscv_any_cpu_init(Object *obj)
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
@@ -1964,6 +1984,41 @@ static void riscv_cpu_add_user_properties(Object *obj)
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
 
@@ -2302,6 +2357,7 @@ static const TypeInfo riscv_cpu_type_infos[] = {
         .abstract = true,
     },
     DEFINE_DYNAMIC_CPU(TYPE_RISCV_CPU_ANY,      riscv_any_cpu_init),
+    DEFINE_DYNAMIC_CPU(TYPE_RISCV_CPU_MAX,      riscv_max_cpu_init),
 #if defined(CONFIG_KVM)
     DEFINE_CPU(TYPE_RISCV_CPU_HOST,             riscv_host_cpu_init),
 #endif
-- 
2.41.0


