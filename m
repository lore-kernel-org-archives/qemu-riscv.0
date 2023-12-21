Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14EACC46CCD
	for <qemu-riscv@archiver.kernel.org>; Thu, 21 Dec 2023 17:53:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rGNDe-0002qv-OD; Thu, 21 Dec 2023 12:52:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rGNDa-0002kT-Uv
 for qemu-riscv@nongnu.org; Thu, 21 Dec 2023 12:52:23 -0500
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rGNDW-00080X-Q3
 for qemu-riscv@nongnu.org; Thu, 21 Dec 2023 12:52:21 -0500
Received: by mail-il1-x133.google.com with SMTP id
 e9e14a558f8ab-35f7589ea1fso4080875ab.1
 for <qemu-riscv@nongnu.org>; Thu, 21 Dec 2023 09:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1703181137; x=1703785937; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4olk1Up+J1VxObz2v3pFn9j6hG/SkOyJiBwWz2BpzGo=;
 b=j8/obxYMpHdmmRTlMT1RljpDMB+67a9MwmN7i3xRKO04863biKsvorFjZmMEiEngiv
 x4D9sAbS8tBXPfL+YZi8uZmOC4iXv3TiKciu49f36BRK4BEK/7vs/tidxOD4ryRM+dkr
 pW2Ls+2IslO3VLqe7jlBOUFy+4+rEw8y1QS7E/Zv5pHVIhLRabhQ036FP7OXrv1Qvqur
 Yu+O5VjUaSKCcvw7oCh+x5z1/Xg5dynDUHa3A5TPSIeEZDj/erjPIbTz1BMOxID3Zur7
 TMLxs3n0q3cRzBLpC/V+uchojbC7GynCwMd7SrO5vyqKuPELV70ecCctpLt6WgYpNVtp
 jsHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703181137; x=1703785937;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4olk1Up+J1VxObz2v3pFn9j6hG/SkOyJiBwWz2BpzGo=;
 b=WjDVQtoUGtZ/LfWcEupfNZOTms6dwJ9Smehrwg3xZ0qwCDGaxVBCE14670HQj0nuL6
 5Z/buMyMHquFA1BaPV7Yae91YlNBv8H+2VXOuXurSf98L1o3Vukg3VGXB4kofXoFf24m
 j4/TTlUfvGi1S9EfhytUKHMP9GeRt7/hcod/HuuJSEEZKezWUUTN0jlnNl+vCoBeBoKn
 0pEctYuW1gcxl4ojj3u24hgySpKt1Dv5hD51e6pUSvgiG+VULiwOSdyMSFpJuhQXNhB1
 AReKF/UyT82W/yDBTk09zdZk1b3AYr59q4KQ5/4OxzCqDXpAU+UGfdGtTZ+evtDn1C3X
 Mnfg==
X-Gm-Message-State: AOJu0Yycp344ck2Ov2h+lDtcQjNt1gEEmXbI589zZ/MOm2wevhzpNGTF
 Cbkq+YejKDL0ZXqBDPCdemSH6E6Uhwyw2g==
X-Google-Smtp-Source: AGHT+IFdDPOGVOQ07hoGvns3AINBcd8kQiZuGcVkoeNqSz1dHphAepjAgikUR6XCj8LIPiRNZ5hPjg==
X-Received: by 2002:a92:cd89:0:b0:35f:b75f:5392 with SMTP id
 r9-20020a92cd89000000b0035fb75f5392mr2965ilb.5.1703181137517; 
 Thu, 21 Dec 2023 09:52:17 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([179.93.21.205])
 by smtp.gmail.com with ESMTPSA id
 w10-20020a63f50a000000b005b18c53d73csm1806261pgh.16.2023.12.21.09.52.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Dec 2023 09:52:17 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 11/16] target/riscv: move 'cbom_blocksize' to
 riscv_cpu_properties[]
Date: Thu, 21 Dec 2023 14:51:32 -0300
Message-ID: <20231221175137.497379-12-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231221175137.497379-1-dbarboza@ventanamicro.com>
References: <20231221175137.497379-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::133;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-il1-x133.google.com
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

After adding a KVM finalize() implementation, turn cbom_blocksize into a
class property. Follow the same design we used with 'vlen' and 'elen'.

The duplicated 'cbom_blocksize' KVM property can be removed from
kvm_riscv_add_cpu_user_properties().

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c         | 46 +++++++++++++++++++++++++++++++++++++-
 target/riscv/kvm/kvm-cpu.c |  4 ----
 2 files changed, 45 insertions(+), 5 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index d7e74b3428..6c17ab35c5 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1776,8 +1776,49 @@ const PropertyInfo prop_elen = {
     .set_default_value = qdev_propinfo_set_default_value_uint,
 };
 
+static void prop_cbom_blksize_set(Object *obj, Visitor *v, const char *name,
+                                  void *opaque, Error **errp)
+{
+    RISCVCPU *cpu = RISCV_CPU(obj);
+    uint16_t value;
+
+    if (!visit_type_uint16(v, name, &value, errp)) {
+        return;
+    }
+
+    /* Always allow setting a default value */
+    if (cpu->cfg.cbom_blocksize == 0) {
+        cpu->cfg.cbom_blocksize = value;
+        return;
+    }
+
+    if (value != cpu->cfg.cbom_blocksize && riscv_cpu_is_vendor(obj)) {
+        cpu_set_prop_err(cpu, name, errp);
+        error_append_hint(errp, "Current '%s' val: %u\n",
+                          name, cpu->cfg.cbom_blocksize);
+        return;
+    }
+
+    cpu_option_add_user_setting(name, value);
+    cpu->cfg.cbom_blocksize = value;
+}
+
+static void prop_cbom_blksize_get(Object *obj, Visitor *v, const char *name,
+                         void *opaque, Error **errp)
+{
+    uint16_t value = RISCV_CPU(obj)->cfg.cbom_blocksize;
+
+    visit_type_uint16(v, name, &value, errp);
+}
+
+const PropertyInfo prop_cbom_blksize = {
+    .name = "cbom_blocksize",
+    .get = prop_cbom_blksize_get,
+    .set = prop_cbom_blksize_set,
+    .set_default_value = qdev_propinfo_set_default_value_uint,
+};
+
 Property riscv_cpu_options[] = {
-    DEFINE_PROP_UINT16("cbom_blocksize", RISCVCPU, cfg.cbom_blocksize, 64),
     DEFINE_PROP_UINT16("cboz_blocksize", RISCVCPU, cfg.cboz_blocksize, 64),
 
     DEFINE_PROP_END_OF_LIST(),
@@ -1802,6 +1843,9 @@ static Property riscv_cpu_properties[] = {
     {.name = "elen", .info = &prop_elen,
      .set_default = true, .defval.u = 64},
 
+    {.name = "cbom_blocksize", .info = &prop_cbom_blksize,
+     .set_default = true, .defval.u = 64},
+
 #ifndef CONFIG_USER_ONLY
     DEFINE_PROP_UINT64("resetvec", RISCVCPU, env.resetvec, DEFAULT_RSTVEC),
 #endif
diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
index 70fb075846..1866b56913 100644
--- a/target/riscv/kvm/kvm-cpu.c
+++ b/target/riscv/kvm/kvm-cpu.c
@@ -484,10 +484,6 @@ static void kvm_riscv_add_cpu_user_properties(Object *cpu_obj)
                             NULL, multi_cfg);
     }
 
-    object_property_add(cpu_obj, "cbom_blocksize", "uint16",
-                        NULL, kvm_cpu_set_cbomz_blksize,
-                        NULL, &kvm_cbom_blocksize);
-
     object_property_add(cpu_obj, "cboz_blocksize", "uint16",
                         NULL, kvm_cpu_set_cbomz_blksize,
                         NULL, &kvm_cboz_blocksize);
-- 
2.43.0


