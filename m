Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2787CDB474
	for <qemu-riscv@archiver.kernel.org>; Tue, 17 Oct 2023 22:14:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qssIv-0001bj-Fd; Tue, 17 Oct 2023 18:12:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qssIu-0001b6-1E
 for qemu-riscv@nongnu.org; Tue, 17 Oct 2023 18:12:44 -0400
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qssIm-0002Tn-E8
 for qemu-riscv@nongnu.org; Tue, 17 Oct 2023 18:12:43 -0400
Received: by mail-oo1-xc29.google.com with SMTP id
 006d021491bc7-57bca5b9b0aso3275989eaf.3
 for <qemu-riscv@nongnu.org>; Tue, 17 Oct 2023 15:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1697580755; x=1698185555; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Uj7cBvZDFBEE4zf1v5At7rUrfvkSLy1+9y5oquwMnEY=;
 b=XlZqw6G9V5ACRBVUQ5/ZuxlWfblmIoi+P1n4d1yteJk7T98dNP6aVmv20hs5GC5opD
 r8ox4//bvZHETwhZMVyZZbBpwJ8nNmhYy9T90rK9mEY+v/iSupsCvHwuuaP6NI2oPwsE
 uvJ3XCFcl9p6Uw3/YXrLQi9MRcZLxxjzsj8TvRi5/NFcPUXx26r6geqK/eV3uz+as4PW
 WPLrMJrAX6nH+b3PL47Pzs/J2vHPXl1cUP1Ane58F9iE0Iq7LgNxJ8LN5yXdrLGrzZNC
 dzwgEaJ18X7zlokYjRZo14VIHQN7dRVSoQkAPYGVjEsk0C0J8L5xMZgyVfd6HcGiLx3+
 NOGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697580755; x=1698185555;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Uj7cBvZDFBEE4zf1v5At7rUrfvkSLy1+9y5oquwMnEY=;
 b=IRvW7gy59WcEtpH6QKRGWvkJhdx1LDfHnSbzw2UlgOR03fBIDootTkMNaoUo7/Rcky
 DquRwMJkqRltOZKJ3QauxnxV/U/OESWs5JapDxQ9x8vG+M/XA+KjaKRE8XPmp+7RixXd
 m3ThPkErKkv57q10k3LToHYAghyK/oVsl1Ja+7Vd12+jQc40mmTCHdY1q1HTGZtCe0Wt
 tX/uT9ndZ2JhuNVWuYd9EHpoF75WaF2E9whYSkztCiUITYEuyIUimNCS6WLkViRf1fLf
 mjZQqVxeOKnEA4E/DVk5JaMc2IJUGQsxsKWgSFqlWhoUi815bjTxfw7tsX1M3gyqxl2V
 NcaQ==
X-Gm-Message-State: AOJu0Yxv+PbN2JJvAMAJOxUFenexi2jlQ0niVOCZygb4+WdWBA05HdP4
 O1B8LHWNnE41pIzs6hDRUtiePw==
X-Google-Smtp-Source: AGHT+IHfx8/Cn6hLaea6pU+KETmLXxLpeGhgvTCuvyP99+zu8gcFQpl5WYepc7WulUXj70Wn+7MYVg==
X-Received: by 2002:a05:6358:ce08:b0:143:82e0:8cbc with SMTP id
 gt8-20020a056358ce0800b0014382e08cbcmr3542099rwb.1.1697580754797; 
 Tue, 17 Oct 2023 15:12:34 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.45.186.249])
 by smtp.gmail.com with ESMTPSA id
 t13-20020a62d14d000000b006be077531aesm2011023pfl.220.2023.10.17.15.12.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Oct 2023 15:12:34 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 1/6] target/riscv/cpu.c: add zicntr extension flag
Date: Tue, 17 Oct 2023 19:12:21 -0300
Message-ID: <20231017221226.136764-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231017221226.136764-1-dbarboza@ventanamicro.com>
References: <20231017221226.136764-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c29;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc29.google.com
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

zicntr is the Base Counters and Timers extension described in chapter 12
of the unprivileged spec. It describes support for RDCYCLE, RDTIME and
RDINSTRET.

QEMU already implements it way before it was a discrete extension.
zicntr is part of the RVA22 profile, so let's add it to QEMU to make the
future profile implementation flag complete.

Given than it represents an already existing feature, default it to
'true' for all CPUs. Accelerators are responsible for disabling them if
the user wants to.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c     | 12 ++++++++++++
 target/riscv/cpu_cfg.h |  1 +
 2 files changed, 13 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 2f98ce56e0..f478245254 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -79,6 +79,7 @@ const RISCVIsaExtData isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zicbom, PRIV_VERSION_1_12_0, ext_zicbom),
     ISA_EXT_DATA_ENTRY(zicboz, PRIV_VERSION_1_12_0, ext_zicboz),
     ISA_EXT_DATA_ENTRY(zicond, PRIV_VERSION_1_12_0, ext_zicond),
+    ISA_EXT_DATA_ENTRY(zicntr, PRIV_VERSION_1_12_0, ext_zicntr),
     ISA_EXT_DATA_ENTRY(zicsr, PRIV_VERSION_1_10_0, ext_zicsr),
     ISA_EXT_DATA_ENTRY(zifencei, PRIV_VERSION_1_10_0, ext_zifencei),
     ISA_EXT_DATA_ENTRY(zihintntl, PRIV_VERSION_1_10_0, ext_zihintntl),
@@ -1175,6 +1176,15 @@ static void riscv_cpu_init(Object *obj)
     qdev_init_gpio_in(DEVICE(obj), riscv_cpu_set_irq,
                       IRQ_LOCAL_MAX + IRQ_LOCAL_GUEST_MAX);
 #endif /* CONFIG_USER_ONLY */
+
+    /*
+     * The timer and performance counters extensions were supported
+     * in QEMU before they were added as discrete extensions in the
+     * ISA. To keep compatibility we'll always default them to 'true'
+     * for all CPUs. Each accelerator will decide what to do when
+     * users disable them.
+     */
+    RISCV_CPU(obj)->cfg.ext_zicntr = true;
 }
 
 typedef struct misa_ext_info {
@@ -1263,6 +1273,8 @@ const RISCVCPUMultiExtConfig riscv_cpu_extensions[] = {
     MULTI_EXT_CFG_BOOL("svnapot", ext_svnapot, false),
     MULTI_EXT_CFG_BOOL("svpbmt", ext_svpbmt, false),
 
+    MULTI_EXT_CFG_BOOL("zicntr", ext_zicntr, true),
+
     MULTI_EXT_CFG_BOOL("zba", ext_zba, true),
     MULTI_EXT_CFG_BOOL("zbb", ext_zbb, true),
     MULTI_EXT_CFG_BOOL("zbc", ext_zbc, true),
diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
index 208cac1c7c..3c91b63609 100644
--- a/target/riscv/cpu_cfg.h
+++ b/target/riscv/cpu_cfg.h
@@ -62,6 +62,7 @@ struct RISCVCPUConfig {
     bool ext_zksh;
     bool ext_zkt;
     bool ext_zifencei;
+    bool ext_zicntr;
     bool ext_zicsr;
     bool ext_zicbom;
     bool ext_zicboz;
-- 
2.41.0


