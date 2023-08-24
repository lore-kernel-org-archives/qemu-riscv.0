Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3538BC6FA8F
	for <qemu-riscv@archiver.kernel.org>; Thu, 24 Aug 2023 22:17:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qZIbg-0007mo-Aj; Thu, 24 Aug 2023 18:15:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qZIbe-0007mR-VM
 for qemu-riscv@nongnu.org; Thu, 24 Aug 2023 18:15:10 -0400
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qZIbc-0006Cg-OC
 for qemu-riscv@nongnu.org; Thu, 24 Aug 2023 18:15:10 -0400
Received: by mail-oo1-xc31.google.com with SMTP id
 006d021491bc7-5712b68dbc0so252200eaf.1
 for <qemu-riscv@nongnu.org>; Thu, 24 Aug 2023 15:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1692915307; x=1693520107;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VZi9a+Cl8DYwh6M3HikCfyuZhzMs7wQPIEe41UD30UY=;
 b=dtiI/7rW2uo+wLmRu1EfECZPbtlDs51ZvWGJpbOrBV1Zvc3u9mEm5psu8C7FdiF6x0
 XqjdRspvla20TZwiAflQ2dhMuH8GwvZovh9snzRRnfkEF2LvCR+XqDr1S93p9JZYPknK
 XnMrGCqXNFMVwxy4696QRxp2usZys4ioTT8JByENLaurqLaLTWHAHhHbyNc8rBlW0NZS
 4E5ktGxUpf156C27EyFYo3TlhG1rmyoeVOnLPHRsi6/wwtlUFmqS+7t6SeoW047pzsG7
 Ik0gZ2l+tJu0QdlUSAfFnR2qs3iJNxp72lR9eOz/TpFZrEaS56O0/Cfhlgpmk+DC8Eai
 gKXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692915307; x=1693520107;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VZi9a+Cl8DYwh6M3HikCfyuZhzMs7wQPIEe41UD30UY=;
 b=eB1TaItx3ihxJT8t3LAULcsJnYeZiTMXyPlYWtIkqoIqVVtRzRSaXzONKKbG9KY+vl
 EnP+Agil4JiX33mafEnFK/A5LKAOE7412hsuMls47k/NTr/wYxKe4MbmVG8tMLpPguAk
 xHOVaGE6JJDXXhYkDkYxQYVg/OBjafIEQr6cT0wWnhf9HvWs0ZofbWq9aNprt+Ax1PAd
 0lJzorir8nRVJmmsqnUK+RdeFmpM3GG6y7qRr0Kxd5hakwtWjUnCIPi9YbgQc0hMppR7
 JNofOVBpkBYKB9xzwezkZch5aKEmKwOrk0rGQ/y2LzsOJwNWFbiP1OxWw62u/PbMoJUY
 IylQ==
X-Gm-Message-State: AOJu0YxnEy4GLXlzz7CAR+sxrtETXY5hZvqHateXDPOABEX46Z5SWWmX
 tT/mbPgeQWqP2wPtXqvvkBDm5NoEQ4FcGQBeelE=
X-Google-Smtp-Source: AGHT+IE6dm8eutBbC93VffCxYqUi3j92yRjIl8FtfdPvTi+OyeT+hGLmpAl1U6cyA11FFozpZaUm1Q==
X-Received: by 2002:a4a:919c:0:b0:571:2b86:2050 with SMTP id
 d28-20020a4a919c000000b005712b862050mr3701692ooh.7.1692915307643; 
 Thu, 24 Aug 2023 15:15:07 -0700 (PDT)
Received: from grind.. ([179.93.21.19]) by smtp.gmail.com with ESMTPSA id
 o129-20020a4a4487000000b00565fcfabab8sm256338ooa.21.2023.08.24.15.15.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Aug 2023 15:15:07 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH RESEND v8 08/20] target/riscv/cpu.c: add
 riscv_cpu_add_kvm_unavail_prop_array()
Date: Thu, 24 Aug 2023 19:14:28 -0300
Message-ID: <20230824221440.484675-9-dbarboza@ventanamicro.com>
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

Use a helper in riscv_cpu_add_kvm_properties() to eliminate some of its
code repetition.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 4608fa2378..d78c2c058f 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1971,6 +1971,14 @@ static void riscv_cpu_add_kvm_unavail_prop(Object *obj, const char *prop_name)
                         NULL, (void *)prop_name);
 }
 
+static void riscv_cpu_add_kvm_unavail_prop_array(Object *obj,
+                                                 Property *array)
+{
+    for (Property *prop = array; prop && prop->name; prop++) {
+        riscv_cpu_add_kvm_unavail_prop(obj, prop->name);
+    }
+}
+
 static void riscv_cpu_add_kvm_properties(Object *obj)
 {
     Property *prop;
@@ -1979,17 +1987,9 @@ static void riscv_cpu_add_kvm_properties(Object *obj)
     kvm_riscv_init_user_properties(obj);
     riscv_cpu_add_misa_properties(obj);
 
-    for (prop = riscv_cpu_extensions; prop && prop->name; prop++) {
-        riscv_cpu_add_kvm_unavail_prop(obj, prop->name);
-    }
-
-    for (prop = riscv_cpu_vendor_exts; prop && prop->name; prop++) {
-        riscv_cpu_add_kvm_unavail_prop(obj, prop->name);
-    }
-
-    for (prop = riscv_cpu_experimental_exts; prop && prop->name; prop++) {
-        riscv_cpu_add_kvm_unavail_prop(obj, prop->name);
-    }
+    riscv_cpu_add_kvm_unavail_prop_array(obj, riscv_cpu_extensions);
+    riscv_cpu_add_kvm_unavail_prop_array(obj, riscv_cpu_vendor_exts);
+    riscv_cpu_add_kvm_unavail_prop_array(obj, riscv_cpu_experimental_exts);
 
     for (prop = riscv_cpu_options; prop && prop->name; prop++) {
         /* Check if KVM created the property already */
-- 
2.41.0


