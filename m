Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C09F1CA0FF6
	for <qemu-riscv@archiver.kernel.org>; Fri,  1 Sep 2023 19:50:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qcA6c-0007re-Ij; Fri, 01 Sep 2023 15:46:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qcA6b-0007r2-Eu
 for qemu-riscv@nongnu.org; Fri, 01 Sep 2023 15:46:57 -0400
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qcA6Z-00031T-Ap
 for qemu-riscv@nongnu.org; Fri, 01 Sep 2023 15:46:57 -0400
Received: by mail-oo1-xc2d.google.com with SMTP id
 006d021491bc7-5711f6dff8cso1328747eaf.3
 for <qemu-riscv@nongnu.org>; Fri, 01 Sep 2023 12:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1693597613; x=1694202413; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MoAd5LD1BxMnupNH6/trItdA1XMHMQzc01b70ikSrOQ=;
 b=e1XfyHZRN407giJeC4Eu5PuYLpioDSMqeSwHsM1X7OdNsWDNiUwJLI/pAXIm2KdPGj
 j71l5m+u94y8ymeqjxyMofoE4R9/82nlIonckidXEx5kJaVXWjWcJeZ4FCuMszlNlam3
 o3w6qKFYYaNSbJUJxXLPWCKRD7dFv+RcGsv7BkAOKJoyXPmaxByIlmycluJn0yzXJDk2
 kBCMv/X7ZP9DJkTTRLEvudTo6NO2/z+yv15k8AHqxlqkyGP8w5dIh32ljLIpZ6kYa+A8
 ktctNvGuR5CTRw/8HBIvpc8iKx8tj08UzvHSbIBdihKpiR7ijhpZyQDL+TvqbP3njsnL
 YZFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693597613; x=1694202413;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MoAd5LD1BxMnupNH6/trItdA1XMHMQzc01b70ikSrOQ=;
 b=ZGhFMV3vv5IN3s68XOyyy6xC9C2Dh5uh16HtFOQ88JRJ3nlPWeGnZiPM1p1EY3N5W2
 DJNrB4V4cHhqbNJ+ZuEx2nuET9KR87LfVnMD7bNOOWIGj+JXQg3LNVRZP83yiOqhFlJC
 +idQW9wAsTyjBqE6smaRulggQ2ELgc5hVMaDUP88q60LYx4TkHiGiT754ZDLNa6fWDTI
 SylbDX5FqX+wdySZyL4a7JZXcfORjmBz89SpvV/HjW39gTX2/UVYShmP41MGiuubX6lm
 ymrqeDBxVOyagMx8JF0nHPoBqr218ujmj7D4vZApooGP8GxR1U7L2+ZwaUUiE8vbNkcH
 QeGA==
X-Gm-Message-State: AOJu0Yw1CKoAFNjVyCTh476hy5zYgI9D4q7pef8ARXqGltsoUsQSF4wt
 vHwXzS8Z3CJm6qwPEXF6mk0IQw==
X-Google-Smtp-Source: AGHT+IHOkNC9jRYjojBhKOytSV5l3b2FpU9OUydHcOPZWDsMX5IEstttMc2NABjLKtIhXyCMbui7dA==
X-Received: by 2002:a4a:3416:0:b0:573:bf68:8dbc with SMTP id
 b22-20020a4a3416000000b00573bf688dbcmr3669027ooa.7.1693597612688; 
 Fri, 01 Sep 2023 12:46:52 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.94.15.194])
 by smtp.gmail.com with ESMTPSA id
 h187-20020a4a5ec4000000b00565d41ba4d0sm2303002oob.35.2023.09.01.12.46.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Sep 2023 12:46:52 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v9 06/20] target/riscv/cpu.c: split vendor exts from
 riscv_cpu_extensions[]
Date: Fri,  1 Sep 2023 16:46:12 -0300
Message-ID: <20230901194627.1214811-7-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230901194627.1214811-1-dbarboza@ventanamicro.com>
References: <20230901194627.1214811-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc2d.google.com
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

Our goal is to make riscv_cpu_extensions[] hold only ratified,
non-vendor extensions.

Create a new riscv_cpu_vendor_exts[] array for them, changing
riscv_cpu_add_user_properties() and riscv_cpu_add_kvm_properties()
accordingly.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 target/riscv/cpu.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 2349f813e4..86d536f242 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1867,7 +1867,10 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_BOOL("zcmt", RISCVCPU, cfg.ext_zcmt, false),
     DEFINE_PROP_BOOL("zicond", RISCVCPU, cfg.ext_zicond, false),
 
-    /* Vendor-specific custom extensions */
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static Property riscv_cpu_vendor_exts[] = {
     DEFINE_PROP_BOOL("xtheadba", RISCVCPU, cfg.ext_xtheadba, false),
     DEFINE_PROP_BOOL("xtheadbb", RISCVCPU, cfg.ext_xtheadbb, false),
     DEFINE_PROP_BOOL("xtheadbs", RISCVCPU, cfg.ext_xtheadbs, false),
@@ -1978,6 +1981,10 @@ static void riscv_cpu_add_kvm_properties(Object *obj)
         riscv_cpu_add_kvm_unavail_prop(obj, prop->name);
     }
 
+    for (prop = riscv_cpu_vendor_exts; prop && prop->name; prop++) {
+        riscv_cpu_add_kvm_unavail_prop(obj, prop->name);
+    }
+
     for (prop = riscv_cpu_experimental_exts; prop && prop->name; prop++) {
         riscv_cpu_add_kvm_unavail_prop(obj, prop->name);
     }
@@ -2022,6 +2029,10 @@ static void riscv_cpu_add_user_properties(Object *obj)
         qdev_property_add_static(dev, prop);
     }
 
+    for (prop = riscv_cpu_vendor_exts; prop && prop->name; prop++) {
+        qdev_property_add_static(dev, prop);
+    }
+
     for (prop = riscv_cpu_experimental_exts; prop && prop->name; prop++) {
         qdev_property_add_static(dev, prop);
     }
-- 
2.41.0


