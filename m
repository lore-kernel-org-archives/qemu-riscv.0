Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BBE4C001DF
	for <qemu-riscv@archiver.kernel.org>; Fri, 28 Jul 2023 14:07:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qPNK5-0006aq-HD; Fri, 28 Jul 2023 09:16:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qPNJw-0006Qt-Er
 for qemu-riscv@nongnu.org; Fri, 28 Jul 2023 09:15:53 -0400
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qPNJs-0003R2-Tt
 for qemu-riscv@nongnu.org; Fri, 28 Jul 2023 09:15:52 -0400
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-1a28de15c8aso1665796fac.2
 for <qemu-riscv@nongnu.org>; Fri, 28 Jul 2023 06:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1690550142; x=1691154942;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i6sZacMewneSeQj5bmv5KaBVBjn8NIxNMS30kFI2Yv0=;
 b=lwyrLf50hxXJ4lvgmF0KvcNvAAwO/3i/lCO7l5hiyjdwr3AIYvezKxmp2bJ3SiSGe2
 VgRRalJHbARMw0G3HtKuhFPYtk1eJiY47VoeXnwVikX+YhcaD2Bfon0nt/YudvhRlgVU
 pGZ50anvoOc6PbXsYQKIqeC1HDaPRNwAMzw9/Ml0fqIxfv/ST+ZZAtq5DSq8CvFGzevf
 FAujvkqr6e8UZDkIOfYb9SeGAdgOc5+2EUvqes12xR31GwI1rR92zP537eB5bMH7OAMn
 IHcz+zY5GM1iE5s7C7c7GVN6UpsjpigVE5sYRs1c3oTc19uIMmQ31pJwXOdkpO+IOxSF
 6Hhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690550142; x=1691154942;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i6sZacMewneSeQj5bmv5KaBVBjn8NIxNMS30kFI2Yv0=;
 b=MQIHvtfjx9/7BJT9sS2XKdwqoKA9VBe4/Z/TzE6u+ZV1NuGfggy9RdL2m+sRVKQGCz
 M74DP/kujW3nD3MqRQ/CY0jKt/Wf74cWm89GQ3jF6EWMAo85rWmINbuTo+wSitDeqV69
 cAXBP1/E1RFvP5FFAGRvU/vhoZgwgmdfvWdy8SdfP4E7rejxCShFHZyBKca6HbxC86VS
 NsJ/FHybQXJ6mcg+PsVtqRYR+F7A72jvfXcvkvnW1STefrvjwgmSZFMerm2mrDbOS9vc
 OwGu55ktMc5LA3IDN1ofBmJyb+mcUEUZtKl+hn2g8SpBNtEyle7fq64P/kli36bPV0rW
 CzjA==
X-Gm-Message-State: ABy/qLYPm3Fy8LGNmeKG1YxkA0UdL4/d9/iwU84ocwlMS44RzznPsvW4
 hvdB8suE6VvgO6hy+8VmQQrXXQ==
X-Google-Smtp-Source: APBJJlGOF15QRQWtVMJmRwH7cwPGlSv5xIW3nUqj/0VtMrl6V/99OdOWzAAI2ZmIvSv1AjWdJXm4+w==
X-Received: by 2002:a05:6870:73cf:b0:1bb:7d67:a807 with SMTP id
 a15-20020a05687073cf00b001bb7d67a807mr3199896oan.51.1690550142094; 
 Fri, 28 Jul 2023 06:15:42 -0700 (PDT)
Received: from grind.. (201-69-66-36.dial-up.telesp.net.br. [201.69.66.36])
 by smtp.gmail.com with ESMTPSA id
 hv6-20020a056871cc0600b001b3d93884fdsm1699371oac.57.2023.07.28.06.15.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jul 2023 06:15:41 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 6/8] target/riscv: use isa_ext_update_enabled() in
 init_max_cpu_extensions()
Date: Fri, 28 Jul 2023 10:15:18 -0300
Message-ID: <20230728131520.110394-7-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230728131520.110394-1-dbarboza@ventanamicro.com>
References: <20230728131520.110394-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::32;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x32.google.com
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

Before adding support to detect if an extension was user set we need to
handle how we're enabling extensions in riscv_init_max_cpu_extensions().
object_property_set_bool() calls the set() callback for the property,
and we're going to use this callback to set the 'multi_ext_user_opts'
hash.

This means that, as is today, all extensions we're setting for the 'max'
CPU will be seen as user set in the future. Let's change set_bool() to
isa_ext_update_enabled() that will just enable/disable the flag on a
certain offset.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index b588f6969f..a40dc865a0 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -2096,25 +2096,24 @@ static void riscv_init_max_cpu_extensions(Object *obj)
     set_misa(env, env->misa_mxl, env->misa_ext | RVG | RVJ | RVV);
 
     for (int i = 0; i < ARRAY_SIZE(riscv_cpu_extensions); i++) {
-        object_property_set_bool(obj, riscv_cpu_extensions[i].name,
-                                 true, NULL);
+        isa_ext_update_enabled(cpu, riscv_cpu_extensions[i].offset, true);
     }
 
     /* set vector version */
     env->vext_ver = VEXT_VERSION_1_00_0;
 
     /* Zfinx is not compatible with F. Disable it */
-    object_property_set_bool(obj, "zfinx", false, NULL);
-    object_property_set_bool(obj, "zdinx", false, NULL);
-    object_property_set_bool(obj, "zhinx", false, NULL);
-    object_property_set_bool(obj, "zhinxmin", false, NULL);
+    isa_ext_update_enabled(cpu, CPU_CFG_OFFSET(ext_zfinx), false);
+    isa_ext_update_enabled(cpu, CPU_CFG_OFFSET(ext_zdinx), false);
+    isa_ext_update_enabled(cpu, CPU_CFG_OFFSET(ext_zhinx), false);
+    isa_ext_update_enabled(cpu, CPU_CFG_OFFSET(ext_zhinxmin), false);
 
-    object_property_set_bool(obj, "zce", false, NULL);
-    object_property_set_bool(obj, "zcmp", false, NULL);
-    object_property_set_bool(obj, "zcmt", false, NULL);
+    isa_ext_update_enabled(cpu, CPU_CFG_OFFSET(ext_zce), false);
+    isa_ext_update_enabled(cpu, CPU_CFG_OFFSET(ext_zcmp), false);
+    isa_ext_update_enabled(cpu, CPU_CFG_OFFSET(ext_zcmt), false);
 
     if (env->misa_mxl != MXL_RV32) {
-        object_property_set_bool(obj, "zcf", false, NULL);
+        isa_ext_update_enabled(cpu, CPU_CFG_OFFSET(ext_zcf), false);
     }
 }
 
-- 
2.41.0


