Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37317C47DAF
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 12:34:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rRtV5-0002pd-S1; Mon, 22 Jan 2024 07:34:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rRtV3-0002p6-Vy
 for qemu-riscv@nongnu.org; Mon, 22 Jan 2024 07:34:02 -0500
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rRtV2-0003Wh-By
 for qemu-riscv@nongnu.org; Mon, 22 Jan 2024 07:34:01 -0500
Received: by mail-oo1-xc2f.google.com with SMTP id
 006d021491bc7-59979aa3180so1147791eaf.1
 for <qemu-riscv@nongnu.org>; Mon, 22 Jan 2024 04:34:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1705926839; x=1706531639; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q0hQMCB/S+PWSRzizFQ2oD/ShlkoVt1OiHiwqqOUoOI=;
 b=VEVOuz00lV7Cu2uCZl6HkWi/eHZhTiROHaIraNCsvmRd0fWOUZCFLQSMKiMuY/Ec9U
 E0tnPRnunL+T52G9Cn7caEXwTwOouUVxJFzLJGP0sXSRVRE4yzG0ml1eKF7IK+aX8pZ8
 yQb7CYyyDvOp+nPO6RCQSk6lbXbS7XVqDGHptwjQWo6xGOE5jEpozC4nisFQfEKloS2g
 Rqwm7UfHPVPkzxhaBlfGPK25M115NgQnE/+2U35/QHUvdy5gcWRSoZYVzDqW1YWC3uTk
 8xmmR7lA8/C6IUci7wWO1Yd+BLIZ2sZvoWsRoXddgQiCoFBIFHghw77SE/bes7PFZJhE
 FRwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705926839; x=1706531639;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q0hQMCB/S+PWSRzizFQ2oD/ShlkoVt1OiHiwqqOUoOI=;
 b=K0GU07UTYYVPME2kG5ioU43AXEINjTyJNrpE/GykmkL5UrXh0wBbtvvwCcaA/AH1hS
 BzbsW4KsvAQ8x+s8Cc5Yfi4cPInUceVKeN/tdiUP/qqcj+vi6VZzxyhQrEJQ/qdBSk8v
 EdOqPLmPwT0qr8Q/mFw1A2Q+q7wNC7l3bz+xOGQS3uhYKY8Bhio/Jnsr8z1tyXr15+Hr
 6IiiBwtG1N04SYfdMyvWc4/NQc7Zs/Zs5DEbrP6mRTvgaHd0U/xUtLzK+V7i2P5R1CFT
 Xr62ReSoDOebX5vL/I2p5tCFlN9qk4X2QNrNDZz9ACTNqhrji1wuBYCKx+Epfh7LPvJC
 oC0A==
X-Gm-Message-State: AOJu0YxhMPX3NzGQQDBIwQ7cWCoAgFFIziEMgtgvrdbu2saPLET5fAw3
 HQIKoQAmt2C0Ly2vTsAXtvutI5FvckW4Xz1TpZh3DlFvN+OslIt80Cnpu1Culdg=
X-Google-Smtp-Source: AGHT+IHQ7YdxpyhytqcPW6tCz9RUEKz2FfgFNtigi3C2YhkBZVQLdzKYB3LcIIOimQvBCHHSkzXeYA==
X-Received: by 2002:a05:6358:7e55:b0:176:3f63:b7b6 with SMTP id
 p21-20020a0563587e5500b001763f63b7b6mr4148136rwm.60.1705926838728; 
 Mon, 22 Jan 2024 04:33:58 -0800 (PST)
Received: from grind.. ([2804:7f0:bdcd:fb00:6501:2693:db52:c621])
 by smtp.gmail.com with ESMTPSA id
 l10-20020a056a00140a00b006d9b2694b0csm9414305pfu.200.2024.01.22.04.33.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jan 2024 04:33:58 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 1/2] target/riscv/cpu.c: add riscv_bare_cpu_init()
Date: Mon, 22 Jan 2024 09:33:47 -0300
Message-ID: <20240122123348.973288-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122123348.973288-1-dbarboza@ventanamicro.com>
References: <20240122123348.973288-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc2f.google.com
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

Next patch will add more bare CPUs. Their cpu_init() functions would be
glorified copy/pastes of rv64i_bare_cpu_init(), differing only by a
riscv_cpu_set_misa() call.

Add a new .instance_init for the TYPE_RISCV_BARE_CPU typ to avoid this
code repetition. While we're at it, add a better explanation on why
we're disabling the timing extensions for bare CPUs.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 45 +++++++++++++++++++++++++++++----------------
 1 file changed, 29 insertions(+), 16 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index ad1df2318b..9b6e03a655 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -609,22 +609,6 @@ static void rv64i_bare_cpu_init(Object *obj)
 {
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     riscv_cpu_set_misa(env, MXL_RV64, RVI);
-
-    /* Remove the defaults from the parent class */
-    RISCV_CPU(obj)->cfg.ext_zicntr = false;
-    RISCV_CPU(obj)->cfg.ext_zihpm = false;
-
-    /* Set to QEMU's first supported priv version */
-    env->priv_ver = PRIV_VERSION_1_10_0;
-
-    /*
-     * Support all available satp_mode settings. The default
-     * value will be set to MBARE if the user doesn't set
-     * satp_mode manually (see set_satp_mode_default()).
-     */
-#ifndef CONFIG_USER_ONLY
-    set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV64);
-#endif
 }
 #else
 static void rv32_base_cpu_init(Object *obj)
@@ -1327,6 +1311,34 @@ static void riscv_cpu_init(Object *obj)
     cpu->env.vext_ver = VEXT_VERSION_1_00_0;
 }
 
+static void riscv_bare_cpu_init(Object *obj)
+{
+    RISCVCPU *cpu = RISCV_CPU(obj);
+
+    /*
+     * Bare CPUs do not inherit the timer and performance
+     * counters from the parent class (see riscv_cpu_init()
+     * for info on why the parent enables them).
+     *
+     * Users have to explicitly enable these counters for
+     * bare CPUs.
+     */
+    cpu->cfg.ext_zicntr = false;
+    cpu->cfg.ext_zihpm = false;
+
+    /* Set to QEMU's first supported priv version */
+    cpu->env.priv_ver = PRIV_VERSION_1_10_0;
+
+    /*
+     * Support all available satp_mode settings. The default
+     * value will be set to MBARE if the user doesn't set
+     * satp_mode manually (see set_satp_mode_default()).
+     */
+#ifndef CONFIG_USER_ONLY
+    set_satp_mode_max_supported(cpu, VM_1_10_SV64);
+#endif
+}
+
 typedef struct misa_ext_info {
     const char *name;
     const char *description;
@@ -2405,6 +2417,7 @@ static const TypeInfo riscv_cpu_type_infos[] = {
     {
         .name = TYPE_RISCV_BARE_CPU,
         .parent = TYPE_RISCV_CPU,
+        .instance_init = riscv_bare_cpu_init,
         .abstract = true,
     },
     DEFINE_DYNAMIC_CPU(TYPE_RISCV_CPU_ANY,      riscv_any_cpu_init),
-- 
2.43.0


