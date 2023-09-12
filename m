Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4CB2CA0EC3
	for <qemu-riscv@archiver.kernel.org>; Tue, 12 Sep 2023 13:26:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qg3OA-0002nh-4x; Tue, 12 Sep 2023 09:25:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qg3Nx-0002fX-IF
 for qemu-riscv@nongnu.org; Tue, 12 Sep 2023 09:25:00 -0400
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qg3Ns-0003YK-GN
 for qemu-riscv@nongnu.org; Tue, 12 Sep 2023 09:24:54 -0400
Received: by mail-ot1-x32b.google.com with SMTP id
 46e09a7af769-6c0b40a13ebso2852722a34.0
 for <qemu-riscv@nongnu.org>; Tue, 12 Sep 2023 06:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1694525091; x=1695129891; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PEnrPGnN8UgdKRZchTMIfrKsvseI97NnNCUUb/fgNms=;
 b=kT5yyXRw3O+jCANVxE8bpkF4IIddQikPL8PGQZaStXGBp+nlVxUQxMUsjWjM2QGfxJ
 eykbNNGV8J7rFm7pSX4gGZCzNImGPSeRQ+zzLFSkLNOeuFQ2EjPhizazDQLPNadHFexD
 1hrAElwIzwyuG4zjnsXaUM7j9S5UTE3mD6/M61mahs3YChugnHQSUTLhYU8VDNevuYVg
 G6+X5OgHFwaAtqp9vYAoC3DZReaE/axwOiqBe0Jc4FRh+QvtNDJ0CsDl1/avgCfa8IAt
 duQEBkwb85CUP1pWFrMH9MLYB4Xvr0vef2dLuOVcRx2OhgoIn7++IeW+BBMkfT/lXn0e
 nQ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694525091; x=1695129891;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PEnrPGnN8UgdKRZchTMIfrKsvseI97NnNCUUb/fgNms=;
 b=qSthh18l+76uY3Xw5nb30dY1drgCrXQUdGLACFu+PSD9eRFddbYtHQPj7Q/Ak98+X7
 r9nxfauElwHMj8dTyFFhwDlioinuJhuPiImMYtsy4F/5v97dhisJSCXHfbFY3oa1LDO8
 CZO6Ri0KLLznDF5XN7wt3auE/E7kkWL4QG/zeXYYM9BqGGESxUqqE+XpUxmRVlKA7GBs
 82emJzoTTXzXtlg7RfvBdD83Igs1vfgayab/u8FbKyxZ2nsBTIqKIJ87HLQBysl8Z/Ru
 4AjvFDU9/PJ1/WQSTnIuYU18HXGHt8nf7KCWRw2YhRBrbTK4r7TzIJ1MYBXWQISpeO15
 CwBQ==
X-Gm-Message-State: AOJu0YygcWB+04XjZg501ywAFDyR2hzB7lWPOV5dFFvkdaJpJKFtX/uB
 QBHQOxHnQ3NcMegDH3Ww+e0/fw==
X-Google-Smtp-Source: AGHT+IEOuOHUijHxMTiwgaTlUIIunTqeFOUKQU6g/1rWTeJZd/V5pJ+63gUbmGZXUuwU6DCpBO1HMQ==
X-Received: by 2002:a05:6830:270b:b0:6bc:aec3:6eb1 with SMTP id
 j11-20020a056830270b00b006bcaec36eb1mr1722707otu.1.1694525091460; 
 Tue, 12 Sep 2023 06:24:51 -0700 (PDT)
Received: from grind.. ([177.9.182.82]) by smtp.gmail.com with ESMTPSA id
 p15-20020a0568301d4f00b006af9d8af435sm3991255oth.50.2023.09.12.06.24.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Sep 2023 06:24:50 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com, philmd@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v10 06/20] target/riscv/cpu.c: split vendor exts from
 riscv_cpu_extensions[]
Date: Tue, 12 Sep 2023 10:24:09 -0300
Message-ID: <20230912132423.268494-7-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230912132423.268494-1-dbarboza@ventanamicro.com>
References: <20230912132423.268494-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x32b.google.com
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
index 83b44900a5..9111a83a02 100644
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
@@ -1976,6 +1979,10 @@ void kvm_riscv_cpu_add_kvm_properties(Object *obj)
         riscv_cpu_add_kvm_unavail_prop(obj, prop->name);
     }
 
+    for (prop = riscv_cpu_vendor_exts; prop && prop->name; prop++) {
+        riscv_cpu_add_kvm_unavail_prop(obj, prop->name);
+    }
+
     for (prop = riscv_cpu_experimental_exts; prop && prop->name; prop++) {
         riscv_cpu_add_kvm_unavail_prop(obj, prop->name);
     }
@@ -2020,6 +2027,10 @@ static void riscv_cpu_add_user_properties(Object *obj)
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


