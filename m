Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 463C0CA0EC3
	for <qemu-riscv@archiver.kernel.org>; Tue, 12 Sep 2023 13:29:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qg3On-0003KS-3G; Tue, 12 Sep 2023 09:25:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qg3OQ-00031L-S4
 for qemu-riscv@nongnu.org; Tue, 12 Sep 2023 09:25:28 -0400
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qg3OO-0003s7-H2
 for qemu-riscv@nongnu.org; Tue, 12 Sep 2023 09:25:26 -0400
Received: by mail-ot1-x32a.google.com with SMTP id
 46e09a7af769-6c0a42a469dso3711934a34.2
 for <qemu-riscv@nongnu.org>; Tue, 12 Sep 2023 06:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1694525123; x=1695129923; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U3vwhfzwzLZ+q36r+028e/WoJVWXeUlkHdzNaIijKAo=;
 b=bV3rxAgMBn02tBPWpl+xOZnsPkBTNgvwtWE7+3jO1nKhGBrVD5sfLivmzeZAOLQFZf
 pzZ82vgDsEUzkoeN2i8Zi/8uue6Yv2WjbJ8PeQLvEwSZ0/0pieMnv0cZtRDYuVJ2TiHd
 uFzZFsL09BiKVSWTMR7/n3RZ4jMDdSna0mWnd1XUkYsBclJSnTEv67hfauZdvEtcePEP
 zX+6wRAIFS0bgJfgvPiq4VNQGruqPqxwtufN/5H09z2jzcp96eKLQWgo4CrEB2KKDSGp
 WBa3C1mw/Y2mnbt5YrH/6zkKGiNtmuANAPdZgQbOoAMnnCYFcfsQA0tduQ0sXlIbz5WC
 qnRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694525123; x=1695129923;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U3vwhfzwzLZ+q36r+028e/WoJVWXeUlkHdzNaIijKAo=;
 b=NSqKX9T4uQBxqd0nzOjp2IQelDn7ATGhPjO9dseLnsYxBH4pmjbPuN+iv//Tf0grOF
 /N2JGAs0OVpux/RW9W0nr/pgLW9S1bwdJPIkKgd2SwM+0PBbVayZI1/LG+o63UPnJXWA
 ruBNAtz798VMjnmU4IB3p998bOIJ3cZBSn0yriTU7gV4GjjBfFMmcSxY3XHa13JIqi0C
 eKLbwYK3+CCH7Da//+5ssncW8FlBpeqCI9BOU4zRAnolkwaiEbktitcw0uDNX0NWtZPT
 +rnvo59H5z3braCK7AEIIKq+BE99vH4awvaAY0AQ4iJk2TTFTsftqMxZX92qcDGveuKm
 UidA==
X-Gm-Message-State: AOJu0YwGdC5Lk7GretyGgN/c8KDMI0RkiqJGFHJmqjYeVt/J08IfV7zr
 qcI/hLW/AQsNMrl8+jmOKRbpOw==
X-Google-Smtp-Source: AGHT+IHEIiQk02nyy05I4a7m4/hd+waMtni6Y5bvvT54BjzmneeNAwtT8sagXkYMzYJWqissswm+4A==
X-Received: by 2002:a05:6830:48:b0:6bd:b879:c313 with SMTP id
 d8-20020a056830004800b006bdb879c313mr14117417otp.10.1694525123512; 
 Tue, 12 Sep 2023 06:25:23 -0700 (PDT)
Received: from grind.. ([177.9.182.82]) by smtp.gmail.com with ESMTPSA id
 p15-20020a0568301d4f00b006af9d8af435sm3991255oth.50.2023.09.12.06.25.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Sep 2023 06:25:23 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com, philmd@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v10 15/20] target/riscv/cpu.c: introduce
 cpu_cfg_ext_auto_update()
Date: Tue, 12 Sep 2023 10:24:18 -0300
Message-ID: <20230912132423.268494-16-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230912132423.268494-1-dbarboza@ventanamicro.com>
References: <20230912132423.268494-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32a;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x32a.google.com
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

During realize() time we're activating a lot of extensions based on some
criteria, e.g.:

    if (cpu->cfg.ext_zk) {
        cpu->cfg.ext_zkn = true;
        cpu->cfg.ext_zkr = true;
        cpu->cfg.ext_zkt = true;
    }

This practice resulted in at least one case where we ended up enabling
something we shouldn't: RVC enabling zca/zcd/zcf when using a CPU that
has priv_spec older than 1.12.0.

We're also not considering user choice. There's no way of doing it now
but this is about to change in the next few patches.

cpu_cfg_ext_auto_update() will check for priv version mismatches before
enabling extensions. If we have a mismatch between the current priv
version and the extension we want to enable, do not enable it. In the
near future, this same function will also consider user choice when
deciding if we're going to enable/disable an extension or not.

For now let's use it to handle zca/zcd/zcf enablement if RVC is enabled.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 target/riscv/cpu.c | 43 ++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 40 insertions(+), 3 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 85630ac2c1..4d490df285 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -177,6 +177,43 @@ static void isa_ext_update_enabled(RISCVCPU *cpu, uint32_t ext_offset,
     *ext_enabled = en;
 }
 
+static int cpu_cfg_ext_get_min_version(uint32_t ext_offset)
+{
+    int i;
+
+    for (i = 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
+        if (isa_edata_arr[i].ext_enable_offset != ext_offset) {
+            continue;
+        }
+
+        return isa_edata_arr[i].min_version;
+    }
+
+    g_assert_not_reached();
+}
+
+static void cpu_cfg_ext_auto_update(RISCVCPU *cpu, uint32_t ext_offset,
+                                    bool value)
+{
+    CPURISCVState *env = &cpu->env;
+    bool prev_val = isa_ext_is_enabled(cpu, ext_offset);
+    int min_version;
+
+    if (prev_val == value) {
+        return;
+    }
+
+    if (value && env->priv_ver != PRIV_VERSION_LATEST) {
+        /* Do not enable it if priv_ver is older than min_version */
+        min_version = cpu_cfg_ext_get_min_version(ext_offset);
+        if (env->priv_ver < min_version) {
+            return;
+        }
+    }
+
+    isa_ext_update_enabled(cpu, ext_offset, value);
+}
+
 const char * const riscv_int_regnames[] = {
     "x0/zero", "x1/ra",  "x2/sp",  "x3/gp",  "x4/tp",  "x5/t0",   "x6/t1",
     "x7/t2",   "x8/s0",  "x9/s1",  "x10/a0", "x11/a1", "x12/a2",  "x13/a3",
@@ -1268,12 +1305,12 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
 
     /* zca, zcd and zcf has a PRIV 1.12.0 restriction */
     if (riscv_has_ext(env, RVC) && env->priv_ver >= PRIV_VERSION_1_12_0) {
-        cpu->cfg.ext_zca = true;
+        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zca), true);
         if (riscv_has_ext(env, RVF) && env->misa_mxl_max == MXL_RV32) {
-            cpu->cfg.ext_zcf = true;
+            cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zcf), true);
         }
         if (riscv_has_ext(env, RVD)) {
-            cpu->cfg.ext_zcd = true;
+            cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zcd), true);
         }
     }
 
-- 
2.41.0


