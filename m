Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A0FAC47073
	for <qemu-riscv@archiver.kernel.org>; Wed,  3 Jan 2024 17:46:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rL5F2-00064e-OD; Wed, 03 Jan 2024 12:41:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rL5Ep-0005FY-88
 for qemu-riscv@nongnu.org; Wed, 03 Jan 2024 12:41:07 -0500
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rL5En-0001lo-4e
 for qemu-riscv@nongnu.org; Wed, 03 Jan 2024 12:41:06 -0500
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-6daa89a6452so976553b3a.2
 for <qemu-riscv@nongnu.org>; Wed, 03 Jan 2024 09:41:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1704303663; x=1704908463; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V5RXRQLi/lm91YvCTdeSrbK4N/hfbqHvfE18ltsqAwQ=;
 b=IZk3kBLl2KInx101BfcsGctCMDURfBXY9cFmuccbKtnowu8ERyg9291Oi7D6UG08WG
 jmXZaQ3NGnQDz/YYSoNfMibqUyR1S8B1hZeuw5qBqVB1sByYrhxWaXxK8K39R1ECOTxa
 0IZL3jg3DQem8OVnrdXTWm2lFCilcdPjuVQ3a1wGUc/qXRU8+FOsHBy+e4zIZ1qZR2Mi
 LH5AT4F6kwOCYhpUeOYHiIbUHVRpBbAE8Fc9kNIBIk2to/WBKYgXH/9iVJXwhi0L9tRq
 nuf5HD4vA190+xDJ0yYTUZtkVhymnaKyn0QzF/8vG9WrNvSvBdI+CXdicW2KrBsx6fUe
 YnNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704303663; x=1704908463;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V5RXRQLi/lm91YvCTdeSrbK4N/hfbqHvfE18ltsqAwQ=;
 b=kSBnwE6z2kwOxWDctZVc2nwf1/rljGhc8WttmemAtJHuh9t06z367xOF+sGDhqjVpU
 Os1M36gxzXYzl3xO1fijISuuJCBdHhzc9rRZ03hgfRrSJ+Fxtz+gXOjAtpkCnDA0JUa5
 JXxurFn7HrtsJBYS12VbOPA15HSZFPxb1m0sgGfLKXgqzqdROKEmfwbvVpUr75epNA2h
 d95Se7EfXPU32UpWJsA74GSeHQFA1oTrLPsFTAWInJ6S1ce1XsXIjnCAu5lV2a7YwgLb
 nQiESvQ4jFUq1QKc7RtPxlfVnmRsI02D7iCYQ+9Bkel+w4HbIPpskU7v3xwqfDpf0d8a
 Hvhg==
X-Gm-Message-State: AOJu0YxjqUsnSCkpwOx7hdARHjCi118upArsOy5Bgt6mJiIN2TanYvwb
 oGjE2X2/li2hp0/XQUfOiYsaBsvhRdRWChjz9iFP9HfpO7cXyQ==
X-Google-Smtp-Source: AGHT+IGl+lekf2bXh2hQlZD8GHOjHYUFYWjizMWCbFXGimDq84MthYVfhUdMHGaUhO3jaPg8nk1T3g==
X-Received: by 2002:a05:6a00:4b11:b0:6d9:eb5c:8ccc with SMTP id
 kq17-20020a056a004b1100b006d9eb5c8cccmr7747390pfb.34.1704303662892; 
 Wed, 03 Jan 2024 09:41:02 -0800 (PST)
Received: from grind.. ([189.79.21.107]) by smtp.gmail.com with ESMTPSA id
 v3-20020aa78503000000b006d7f1ae421csm24042050pfn.145.2024.01.03.09.40.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jan 2024 09:41:02 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com, vladimir.isaev@syntacore.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 12/16] target/riscv: move 'cboz_blocksize' to
 riscv_cpu_properties[]
Date: Wed,  3 Jan 2024 14:40:09 -0300
Message-ID: <20240103174013.147279-13-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240103174013.147279-1-dbarboza@ventanamicro.com>
References: <20240103174013.147279-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Do the same we did with 'cbom_blocksize' in the previous patch.

Remove the now unused kvm_cpu_set_cbomz_blksize() setter.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c         | 38 +++++++++++++++++++++++++++++++++++++-
 target/riscv/kvm/kvm-cpu.c | 28 ----------------------------
 2 files changed, 37 insertions(+), 29 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index b510cb94fc..1e35b73e40 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1277,6 +1277,7 @@ static void riscv_cpu_init(Object *obj)
     cpu->cfg.vlen = 128;
     cpu->cfg.elen = 64;
     cpu->cfg.cbom_blocksize = 64;
+    cpu->cfg.cboz_blocksize = 64;
     cpu->env.vext_ver = VEXT_VERSION_1_00_0;
 }
 
@@ -1858,8 +1859,42 @@ static const PropertyInfo prop_cbom_blksize = {
     .set = prop_cbom_blksize_set,
 };
 
+static void prop_cboz_blksize_set(Object *obj, Visitor *v, const char *name,
+                                  void *opaque, Error **errp)
+{
+    RISCVCPU *cpu = RISCV_CPU(obj);
+    uint16_t value;
+
+    if (!visit_type_uint16(v, name, &value, errp)) {
+        return;
+    }
+
+    if (value != cpu->cfg.cboz_blocksize && riscv_cpu_is_vendor(obj)) {
+        cpu_set_prop_err(cpu, name, errp);
+        error_append_hint(errp, "Current '%s' val: %u\n",
+                          name, cpu->cfg.cboz_blocksize);
+        return;
+    }
+
+    cpu_option_add_user_setting(name, value);
+    cpu->cfg.cboz_blocksize = value;
+}
+
+static void prop_cboz_blksize_get(Object *obj, Visitor *v, const char *name,
+                         void *opaque, Error **errp)
+{
+    uint16_t value = RISCV_CPU(obj)->cfg.cboz_blocksize;
+
+    visit_type_uint16(v, name, &value, errp);
+}
+
+static const PropertyInfo prop_cboz_blksize = {
+    .name = "cboz_blocksize",
+    .get = prop_cboz_blksize_get,
+    .set = prop_cboz_blksize_set,
+};
+
 Property riscv_cpu_options[] = {
-    DEFINE_PROP_UINT16("cboz_blocksize", RISCVCPU, cfg.cboz_blocksize, 64),
 
     DEFINE_PROP_END_OF_LIST(),
 };
@@ -1880,6 +1915,7 @@ static Property riscv_cpu_properties[] = {
     {.name = "elen", .info = &prop_elen},
 
     {.name = "cbom_blocksize", .info = &prop_cbom_blksize},
+    {.name = "cboz_blocksize", .info = &prop_cboz_blksize},
 
 #ifndef CONFIG_USER_ONLY
     DEFINE_PROP_UINT64("resetvec", RISCVCPU, env.resetvec, DEFAULT_RSTVEC),
diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
index 1866b56913..137a8ab2bb 100644
--- a/target/riscv/kvm/kvm-cpu.c
+++ b/target/riscv/kvm/kvm-cpu.c
@@ -343,30 +343,6 @@ static KVMCPUConfig kvm_cboz_blocksize = {
     .kvm_reg_id = KVM_REG_RISCV_CONFIG_REG(zicboz_block_size)
 };
 
-static void kvm_cpu_set_cbomz_blksize(Object *obj, Visitor *v,
-                                      const char *name,
-                                      void *opaque, Error **errp)
-{
-    KVMCPUConfig *cbomz_cfg = opaque;
-    RISCVCPU *cpu = RISCV_CPU(obj);
-    uint16_t value, *host_val;
-
-    if (!visit_type_uint16(v, name, &value, errp)) {
-        return;
-    }
-
-    host_val = kvmconfig_get_cfg_addr(cpu, cbomz_cfg);
-
-    if (value != *host_val) {
-        error_report("Unable to set %s to a different value than "
-                     "the host (%u)",
-                     cbomz_cfg->name, *host_val);
-        exit(EXIT_FAILURE);
-    }
-
-    cbomz_cfg->user_set = true;
-}
-
 static void kvm_riscv_update_cpu_cfg_isa_ext(RISCVCPU *cpu, CPUState *cs)
 {
     CPURISCVState *env = &cpu->env;
@@ -484,10 +460,6 @@ static void kvm_riscv_add_cpu_user_properties(Object *cpu_obj)
                             NULL, multi_cfg);
     }
 
-    object_property_add(cpu_obj, "cboz_blocksize", "uint16",
-                        NULL, kvm_cpu_set_cbomz_blksize,
-                        NULL, &kvm_cboz_blocksize);
-
     riscv_cpu_add_kvm_unavail_prop_array(cpu_obj, riscv_cpu_extensions);
     riscv_cpu_add_kvm_unavail_prop_array(cpu_obj, riscv_cpu_vendor_exts);
     riscv_cpu_add_kvm_unavail_prop_array(cpu_obj, riscv_cpu_experimental_exts);
-- 
2.43.0


