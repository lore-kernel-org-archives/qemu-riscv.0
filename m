Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B12EAC41513
	for <qemu-riscv@archiver.kernel.org>; Tue, 15 Aug 2023 20:17:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qW0Sr-0001Yc-DN; Tue, 15 Aug 2023 16:16:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qW0Sp-0001Y2-P9
 for qemu-riscv@nongnu.org; Tue, 15 Aug 2023 16:16:27 -0400
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qW0Sn-00050z-EX
 for qemu-riscv@nongnu.org; Tue, 15 Aug 2023 16:16:27 -0400
Received: by mail-ot1-x334.google.com with SMTP id
 46e09a7af769-6b9cf1997c4so4856076a34.3
 for <qemu-riscv@nongnu.org>; Tue, 15 Aug 2023 13:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1692130584; x=1692735384;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+V2uJDGM7UK+i6uFrn6LQi2aVYMe08c1CeeSTBFBbVk=;
 b=GBryA3G21Bcv5bLg914ivFjldQboVaK2XTbqdqkePInTeWUD41ZOYetgUsUNkfzxO/
 H9U8pILN3eyZ/jx5xmxIND6C3xkwaqrwfKeCSz71d2Qfm/LnLyg39lUzFmhucs65J6Is
 Z92XiyQlACzmarjvzwZfyAFVSlcBP7GFIK7qYgJABLq63UGveAcPx+Y338yDdH+bqhBu
 sIy57PyYEfBLjMOGtE/DwQw0Jieko1az6/5o3Amg7bRb4JJwlz2NsEmV117kLbpenOEl
 Ioz5HHEC0VUBDxOGhQOHJ10XDTa/OjPYO0mtWErmG9VIKrEuslok9iienM5Xq5BnAY5u
 o43Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692130584; x=1692735384;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+V2uJDGM7UK+i6uFrn6LQi2aVYMe08c1CeeSTBFBbVk=;
 b=aJybfIOC8M/kcRDfxl6744mvioul69LADoWI3krYGRVe/OTHQ3sSBY0qUgmf3wmxz0
 bV4Npt/x/ZJ/sKDA1a3OZ97V5en+NFYxsRB31ZtHQ1EF1U/UtRuOIDxGIwHCheubFQqT
 dxIAO+H7gTrabWEC/HGvS0TSqlHsaDL80kaBpMwajKklVqJv8hZzP7AbzLvJsurrQTX8
 n2WG+iHwdHHFLpDKg30b75+9T8zt7g9lHKUI+D0mOh/sSBg+eoeozWLAW3bzwi2hxhWO
 euUvMJacccoTvkj1bCnZ3RKnhXsReOXRgr4JY7+3xIuWMv2B90ThY3ITmPibAVzsjXgh
 VyKQ==
X-Gm-Message-State: AOJu0YzM2hkCkq+2JqJ6k7SX/DXeVUMg6WY9+yL3wMFkkimJmNo8aphV
 UNJuX+BISWs/FBdPDgnCpi2QhA==
X-Google-Smtp-Source: AGHT+IGwaeWOmPZPk8Qy0EZ7JhJ3UKI4rJhHJ8NqiLrKts+qhGhK54Ny0vOOEGtncikV3M+HfwV9Sw==
X-Received: by 2002:a05:6870:2498:b0:1a5:4e57:e5d1 with SMTP id
 s24-20020a056870249800b001a54e57e5d1mr13355981oaq.49.1692130584194; 
 Tue, 15 Aug 2023 13:16:24 -0700 (PDT)
Received: from grind.. (189-69-160-189.dial-up.telesp.net.br. [189.69.160.189])
 by smtp.gmail.com with ESMTPSA id
 o14-20020a056870e80e00b001bb5b2a958csm6658203oan.23.2023.08.15.13.16.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Aug 2023 13:16:23 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v7 06/12] target/riscv/cpu.c: split non-ratified exts from
 riscv_cpu_extensions[]
Date: Tue, 15 Aug 2023 17:15:53 -0300
Message-ID: <20230815201559.398643-7-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230815201559.398643-1-dbarboza@ventanamicro.com>
References: <20230815201559.398643-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x334.google.com
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

Create a new riscv_cpu_experimental_exts[] to store the non-ratified
extensions properties. Once they are ratified we'll move them back to
riscv_cpu_extensions[].

riscv_cpu_add_user_properties() and riscv_cpu_add_kvm_properties() are
changed to keep adding non-ratified properties to users.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 42 +++++++++++++++++++++++++++---------------
 1 file changed, 27 insertions(+), 15 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 3cd025b678..520c5c9f96 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1807,21 +1807,6 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_BOOL("zcmp", RISCVCPU, cfg.ext_zcmp, false),
     DEFINE_PROP_BOOL("zcmt", RISCVCPU, cfg.ext_zcmt, false),
 
-    /* These are experimental so mark with 'x-' */
-    DEFINE_PROP_BOOL("x-zicond", RISCVCPU, cfg.ext_zicond, false),
-
-    /* ePMP 0.9.3 */
-    DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
-    DEFINE_PROP_BOOL("x-smaia", RISCVCPU, cfg.ext_smaia, false),
-    DEFINE_PROP_BOOL("x-ssaia", RISCVCPU, cfg.ext_ssaia, false),
-
-    DEFINE_PROP_BOOL("x-zvfh", RISCVCPU, cfg.ext_zvfh, false),
-    DEFINE_PROP_BOOL("x-zvfhmin", RISCVCPU, cfg.ext_zvfhmin, false),
-
-    DEFINE_PROP_BOOL("x-zfbfmin", RISCVCPU, cfg.ext_zfbfmin, false),
-    DEFINE_PROP_BOOL("x-zvfbfmin", RISCVCPU, cfg.ext_zvfbfmin, false),
-    DEFINE_PROP_BOOL("x-zvfbfwma", RISCVCPU, cfg.ext_zvfbfwma, false),
-
     DEFINE_PROP_END_OF_LIST(),
 };
 
@@ -1842,6 +1827,25 @@ static Property riscv_cpu_vendor_exts[] = {
     DEFINE_PROP_END_OF_LIST(),
 };
 
+/* These are experimental so mark with 'x-' */
+static Property riscv_cpu_experimental_exts[] = {
+    DEFINE_PROP_BOOL("x-zicond", RISCVCPU, cfg.ext_zicond, false),
+
+    /* ePMP 0.9.3 */
+    DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
+    DEFINE_PROP_BOOL("x-smaia", RISCVCPU, cfg.ext_smaia, false),
+    DEFINE_PROP_BOOL("x-ssaia", RISCVCPU, cfg.ext_ssaia, false),
+
+    DEFINE_PROP_BOOL("x-zvfh", RISCVCPU, cfg.ext_zvfh, false),
+    DEFINE_PROP_BOOL("x-zvfhmin", RISCVCPU, cfg.ext_zvfhmin, false),
+
+    DEFINE_PROP_BOOL("x-zfbfmin", RISCVCPU, cfg.ext_zfbfmin, false),
+    DEFINE_PROP_BOOL("x-zvfbfmin", RISCVCPU, cfg.ext_zvfbfmin, false),
+    DEFINE_PROP_BOOL("x-zvfbfwma", RISCVCPU, cfg.ext_zvfbfwma, false),
+
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 static Property riscv_cpu_options[] = {
     DEFINE_PROP_UINT8("pmu-num", RISCVCPU, cfg.pmu_num, 16),
 
@@ -1913,6 +1917,10 @@ static void riscv_cpu_add_kvm_properties(Object *obj)
         riscv_cpu_add_kvm_unavail_prop(obj, prop->name);
     }
 
+    for (prop = riscv_cpu_experimental_exts; prop && prop->name; prop++) {
+        riscv_cpu_add_kvm_unavail_prop(obj, prop->name);
+    }
+
     for (prop = riscv_cpu_options; prop && prop->name; prop++) {
         /* Check if KVM created the property already */
         if (object_property_find(obj, prop->name)) {
@@ -1956,6 +1964,10 @@ static void riscv_cpu_add_user_properties(Object *obj)
     for (prop = riscv_cpu_vendor_exts; prop && prop->name; prop++) {
         qdev_property_add_static(dev, prop);
     }
+
+    for (prop = riscv_cpu_experimental_exts; prop && prop->name; prop++) {
+        qdev_property_add_static(dev, prop);
+    }
 }
 
 static Property riscv_cpu_properties[] = {
-- 
2.41.0


