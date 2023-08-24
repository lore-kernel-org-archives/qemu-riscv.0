Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27AC7C3DA6F
	for <qemu-riscv@archiver.kernel.org>; Thu, 24 Aug 2023 22:18:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qZIbd-0007lz-Vf; Thu, 24 Aug 2023 18:15:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qZIbc-0007lZ-HA
 for qemu-riscv@nongnu.org; Thu, 24 Aug 2023 18:15:08 -0400
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qZIba-0006AS-3X
 for qemu-riscv@nongnu.org; Thu, 24 Aug 2023 18:15:08 -0400
Received: by mail-oo1-xc33.google.com with SMTP id
 006d021491bc7-5732481b242so240065eaf.2
 for <qemu-riscv@nongnu.org>; Thu, 24 Aug 2023 15:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1692915305; x=1693520105;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RHTz5czzlTIcDKsj+j2/IKZGfvREvwgfkfyUpTHSbyA=;
 b=SKG6b/N+AufJjFrxHMmvSMtHKz4ccPoPi3VtziLkHgkTvpITsAXAd+xVMHeuxEVHOf
 nNLTBk/LsSmY/7RP68S/t+KPdvXmL+uiTca953aFWJWe8coLEtad9h7IboMGczvH/iXT
 FspMPDEgH372MQMsNPtxkvDe9Ypy/ZeJx0GhrPmdbq1BbIwMMKjjCz/no+8kCjt8uAdh
 zjUTa7Dz/5yymlweckedmTyMmTktYwPUP5AevmrtJswHQ3Iv1Z7a46/6T3N53ss9BpQs
 CRQMrabY9WWz93sqy5D0q5ksmjEW0ZmXQthr2Roy7u/FPNitdYaFRagfzEGXdLFhSxV2
 Exvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692915305; x=1693520105;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RHTz5czzlTIcDKsj+j2/IKZGfvREvwgfkfyUpTHSbyA=;
 b=eLZCMVH1Mf9wD1uU8llKHJG7wPy99y4WBPernNoMBjS5lbsBmepf3WQwgchFSgTGVx
 ocpIJPkgd0e4gBgtQhm4frYwCsMVGvr8vElCshZs8kmLK//WoZdJz9ZFnYcjQiO+pDad
 xHmSIYBUPXZC6MoMUWzTa9lyBXYz11js9tea8K29b+WGRa5QCacfxdXm6MS+zOKNw04J
 r5941NB7UuuywmhUOAzO/EmvWpoBGRWtPOqpqI/9LM7pRQalwdbHRSG2gB2PjifZViJF
 yPoOHC3QTzjbdgZF5ymz0070FRXCK+YkqsAjiqKdrlxAhGvlelz7XGwvAPx69+Qu3LA+
 Xclg==
X-Gm-Message-State: AOJu0YzMh5oL9EZ0HqyMSMZOraqMbz9KUvMS3MNJqvJEHadL4PwagNPG
 GvnTdb8P2W1zqbohhKFJdrpJ0w==
X-Google-Smtp-Source: AGHT+IHy++RAo8hZM3eji3CqIrCFdIMJtkrGta5isQNyEGgIJg9jZBuDD7bKj9JNk6MYdvtBDVi4Ug==
X-Received: by 2002:a4a:ea3b:0:b0:56d:e6:21bf with SMTP id
 y27-20020a4aea3b000000b0056d00e621bfmr3709783ood.0.1692915305020; 
 Thu, 24 Aug 2023 15:15:05 -0700 (PDT)
Received: from grind.. ([179.93.21.19]) by smtp.gmail.com with ESMTPSA id
 o129-20020a4a4487000000b00565fcfabab8sm256338ooa.21.2023.08.24.15.15.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Aug 2023 15:15:04 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH RESEND v8 07/20] target/riscv/cpu.c: add
 riscv_cpu_add_qdev_prop_array()
Date: Thu, 24 Aug 2023 19:14:27 -0300
Message-ID: <20230824221440.484675-8-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230824221440.484675-1-dbarboza@ventanamicro.com>
References: <20230824221440.484675-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c33;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc33.google.com
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

The code inside riscv_cpu_add_user_properties() became quite repetitive
after recent changes. Add a helper to hide the repetition away.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 27 +++++++++++----------------
 1 file changed, 11 insertions(+), 16 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 668522db01..4608fa2378 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1946,6 +1946,13 @@ static void cpu_set_cfg_unavailable(Object *obj, Visitor *v,
 }
 #endif
 
+static void riscv_cpu_add_qdev_prop_array(DeviceState *dev, Property *array)
+{
+    for (Property *prop = array; prop && prop->name; prop++) {
+        qdev_property_add_static(dev, prop);
+    }
+}
+
 #ifndef CONFIG_USER_ONLY
 static void riscv_cpu_add_kvm_unavail_prop(Object *obj, const char *prop_name)
 {
@@ -2002,7 +2009,6 @@ static void riscv_cpu_add_kvm_properties(Object *obj)
  */
 static void riscv_cpu_add_user_properties(Object *obj)
 {
-    Property *prop;
     DeviceState *dev = DEVICE(obj);
 
 #ifndef CONFIG_USER_ONLY
@@ -2016,21 +2022,10 @@ static void riscv_cpu_add_user_properties(Object *obj)
 
     riscv_cpu_add_misa_properties(obj);
 
-    for (prop = riscv_cpu_extensions; prop && prop->name; prop++) {
-        qdev_property_add_static(dev, prop);
-    }
-
-    for (prop = riscv_cpu_options; prop && prop->name; prop++) {
-        qdev_property_add_static(dev, prop);
-    }
-
-    for (prop = riscv_cpu_vendor_exts; prop && prop->name; prop++) {
-        qdev_property_add_static(dev, prop);
-    }
-
-    for (prop = riscv_cpu_experimental_exts; prop && prop->name; prop++) {
-        qdev_property_add_static(dev, prop);
-    }
+    riscv_cpu_add_qdev_prop_array(dev, riscv_cpu_extensions);
+    riscv_cpu_add_qdev_prop_array(dev, riscv_cpu_options);
+    riscv_cpu_add_qdev_prop_array(dev, riscv_cpu_vendor_exts);
+    riscv_cpu_add_qdev_prop_array(dev, riscv_cpu_experimental_exts);
 }
 
 static Property riscv_cpu_properties[] = {
-- 
2.41.0


