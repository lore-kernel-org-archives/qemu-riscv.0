Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07236C3DA6E
	for <qemu-riscv@archiver.kernel.org>; Wed,  3 Jan 2024 17:46:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rL5EX-00030h-W0; Wed, 03 Jan 2024 12:40:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rL5EM-0002Sw-P1
 for qemu-riscv@nongnu.org; Wed, 03 Jan 2024 12:40:40 -0500
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rL5EJ-0001YX-DL
 for qemu-riscv@nongnu.org; Wed, 03 Jan 2024 12:40:38 -0500
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-6d9b13fe9e9so6401637b3a.2
 for <qemu-riscv@nongnu.org>; Wed, 03 Jan 2024 09:40:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1704303633; x=1704908433; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cz+jeKfAbDjCYD0ym8saUo72Sdfqs84e9WmM8BUjwrU=;
 b=cF2M+Jbwj39s6BqeSCZAUUhURpVNCT1yMDBa1NK/I05AzIrhXxhGu+FvH4EwTBGS+P
 UjXI6tPdLZ2mlLRqMMwRhy5eaEuegwsA8CTULry9gwWsT/IsfgrQ7IcLHOZPH5vB3mG4
 dLKe71vIDHfehqI9kNgcBKe6IRHEzha1fMr7WCOX8RGeqF81D9K/l4lLbTiVVL3gYAmM
 AgiJ3AZyEjT5rkYmCsH1Cb+Fdmxr/xc4w+NAmdZwrCeyI3MUlcucE6U70VdlPV4yH04z
 mQsxaqahIOeeuGoNgwZetn3jhJ/Tv27MiW3FiapD2Onay/xkn7ZB5gVZHhBXwB8IHt6Y
 7IcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704303633; x=1704908433;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cz+jeKfAbDjCYD0ym8saUo72Sdfqs84e9WmM8BUjwrU=;
 b=I4US8Yp+sikFigUzzOzQ3SeArh9wYfPA980Z3nebM0nTyFnMOvVnjxKCjB+QI7Gf5s
 L0ihArC2CYcpYEyrh6LzmGyUHSbrWUWLtzgjcb9wqf1M+2gF/n1RmEh0hPjN/IS+cfAQ
 WRnwPg50VNIOhmMB5Usj7z52u10PCJ6KBulxkgs9/0TdVI6QITa6iGLU+YAW1TdK2Hz3
 EwHELqZsLyfE/Ja1Rk3EfCA9g2de9IS1Hy72xiLqkbBaVMzq2Bn4UWHLqgVAwzd+QoWf
 2XODm4JpTnKLoGcMSNiNTPFWuq7Hd9aUx56Xra9pz+bubC2RAyCc02ZL1qRzOvcc0ClO
 d5pg==
X-Gm-Message-State: AOJu0YzQkri/ilg7BHpz20psanwegtDmyxRp00MFHfZFz17loVe0IyJ5
 UItmzaMR9q1w54yh13p7OTChpSAVwlhn14YTFDQ2s2NViygyRA==
X-Google-Smtp-Source: AGHT+IH8RBd0Oy6dDeXQTx9unafqxpxaEpNLMBbFRBJNSMM+I88VcaEcTcdjFxNqHXHNFc3UfuUPpw==
X-Received: by 2002:a62:e805:0:b0:6d9:a014:ca4a with SMTP id
 c5-20020a62e805000000b006d9a014ca4amr15593638pfi.51.1704303633405; 
 Wed, 03 Jan 2024 09:40:33 -0800 (PST)
Received: from grind.. ([189.79.21.107]) by smtp.gmail.com with ESMTPSA id
 v3-20020aa78503000000b006d7f1ae421csm24042050pfn.145.2024.01.03.09.40.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jan 2024 09:40:33 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com, vladimir.isaev@syntacore.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 03/16] target/riscv: move 'pmu-mask' and 'pmu-num' to
 riscv_cpu_properties[]
Date: Wed,  3 Jan 2024 14:40:00 -0300
Message-ID: <20240103174013.147279-4-dbarboza@ventanamicro.com>
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

Every property in riscv_cpu_options[] will be migrated to
riscv_cpu_properties[]. This will make their default values init
earlier, allowing cpu_init() functions to overwrite them. We'll also
implement common getters and setters that both accelerators will use,
allowing them to share validations that TCG is doing.

At the same time, some options (namely 'vlen', 'elen' and the cache
blocksizes) need a way of tracking if the user set a value for them.
This is benign for TCG since the cost of always validating these values
are small, but for KVM we need syscalls to read the host values to make
the validations, thus knowing whether the user didn't touch the values
makes a difference.

We'll track user setting for these properties using a hash, like we do
in the TCG driver. All riscv cpu options will update this hash in case
the user sets it. The KVM driver will use this hash to minimize the
amount of syscalls done.

For now, both 'pmu-mask' and 'pmu-num' shouldn't be changed for vendor
CPUs. The existing setter for 'pmu-num' is changed to add this
restriction. New getters and setters are required for 'pmu-mask'

While we're at it, add a 'static' modifier to 'prop_pmu_num' since we're
not exporting it.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 96 ++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 89 insertions(+), 7 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 65cfa6c740..e90b70c0a7 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -53,6 +53,15 @@ const uint32_t misa_bits[] = {RVI, RVE, RVM, RVA, RVF, RVD, RVV,
 #define BYTE(x)   (x)
 #endif
 
+/* Hash that stores general user set numeric options */
+static GHashTable *general_user_opts;
+
+static void cpu_option_add_user_setting(const char *optname, uint32_t value)
+{
+    g_hash_table_insert(general_user_opts, (gpointer)optname,
+                        GUINT_TO_POINTER(value));
+}
+
 #define ISA_EXT_DATA_ENTRY(_name, _min_ver, _prop) \
     {#_name, _min_ver, CPU_CFG_OFFSET(_prop)}
 
@@ -1218,11 +1227,15 @@ static void riscv_cpu_post_init(Object *obj)
 
 static void riscv_cpu_init(Object *obj)
 {
+    RISCVCPU *cpu = RISCV_CPU(obj);
+
 #ifndef CONFIG_USER_ONLY
     qdev_init_gpio_in(DEVICE(obj), riscv_cpu_set_irq,
                       IRQ_LOCAL_MAX + IRQ_LOCAL_GUEST_MAX);
 #endif /* CONFIG_USER_ONLY */
 
+    general_user_opts = g_hash_table_new(g_str_hash, g_str_equal);
+
     /*
      * The timer and performance counters extensions were supported
      * in QEMU before they were added as discrete extensions in the
@@ -1232,6 +1245,9 @@ static void riscv_cpu_init(Object *obj)
      */
     RISCV_CPU(obj)->cfg.ext_zicntr = true;
     RISCV_CPU(obj)->cfg.ext_zihpm = true;
+
+    /* Default values for non-bool cpu properties */
+    cpu->cfg.pmu_mask = MAKE_64BIT_MASK(3, 16);
 }
 
 typedef struct misa_ext_info {
@@ -1431,26 +1447,51 @@ const RISCVCPUMultiExtConfig riscv_cpu_deprecated_exts[] = {
     DEFINE_PROP_END_OF_LIST(),
 };
 
+static bool riscv_cpu_is_vendor(Object *obj)
+{
+    return !riscv_cpu_is_generic(obj);
+}
+
+static void cpu_set_prop_err(RISCVCPU *cpu, const char *propname,
+                             Error **errp)
+{
+    g_autofree char *cpuname = riscv_cpu_get_name(cpu);
+    error_setg(errp, "CPU '%s' does not allow changing the value of '%s'",
+               cpuname, propname);
+}
+
 static void prop_pmu_num_set(Object *obj, Visitor *v, const char *name,
                              void *opaque, Error **errp)
 {
     RISCVCPU *cpu = RISCV_CPU(obj);
-    uint8_t pmu_num;
+    uint8_t pmu_num, curr_pmu_num;
+    uint32_t pmu_mask;
 
     visit_type_uint8(v, name, &pmu_num, errp);
 
+    curr_pmu_num = ctpop32(cpu->cfg.pmu_mask);
+
+    if (pmu_num != curr_pmu_num && riscv_cpu_is_vendor(obj)) {
+        cpu_set_prop_err(cpu, name, errp);
+        error_append_hint(errp, "Current '%s' val: %u\n",
+                          name, curr_pmu_num);
+        return;
+    }
+
     if (pmu_num > (RV_MAX_MHPMCOUNTERS - 3)) {
         error_setg(errp, "Number of counters exceeds maximum available");
         return;
     }
 
     if (pmu_num == 0) {
-        cpu->cfg.pmu_mask = 0;
+        pmu_mask = 0;
     } else {
-        cpu->cfg.pmu_mask = MAKE_64BIT_MASK(3, pmu_num);
+        pmu_mask = MAKE_64BIT_MASK(3, pmu_num);
     }
 
     warn_report("\"pmu-num\" property is deprecated; use \"pmu-mask\"");
+    cpu->cfg.pmu_mask = pmu_mask;
+    cpu_option_add_user_setting("pmu-mask", pmu_mask);
 }
 
 static void prop_pmu_num_get(Object *obj, Visitor *v, const char *name,
@@ -1462,16 +1503,54 @@ static void prop_pmu_num_get(Object *obj, Visitor *v, const char *name,
     visit_type_uint8(v, name, &pmu_num, errp);
 }
 
-const PropertyInfo prop_pmu_num = {
+static const PropertyInfo prop_pmu_num = {
     .name = "pmu-num",
     .get = prop_pmu_num_get,
     .set = prop_pmu_num_set,
 };
 
-Property riscv_cpu_options[] = {
-    DEFINE_PROP_UINT32("pmu-mask", RISCVCPU, cfg.pmu_mask, MAKE_64BIT_MASK(3, 16)),
-    {.name = "pmu-num", .info = &prop_pmu_num}, /* Deprecated */
+static void prop_pmu_mask_set(Object *obj, Visitor *v, const char *name,
+                             void *opaque, Error **errp)
+{
+    RISCVCPU *cpu = RISCV_CPU(obj);
+    uint32_t value;
+    uint8_t pmu_num;
+
+    visit_type_uint32(v, name, &value, errp);
+
+    if (value != cpu->cfg.pmu_mask && riscv_cpu_is_vendor(obj)) {
+        cpu_set_prop_err(cpu, name, errp);
+        error_append_hint(errp, "Current '%s' val: %x\n",
+                          name, cpu->cfg.pmu_mask);
+        return;
+    }
+
+    pmu_num = ctpop32(value);
+
+    if (pmu_num > (RV_MAX_MHPMCOUNTERS - 3)) {
+        error_setg(errp, "Number of counters exceeds maximum available");
+        return;
+    }
 
+    cpu_option_add_user_setting(name, value);
+    cpu->cfg.pmu_mask = value;
+}
+
+static void prop_pmu_mask_get(Object *obj, Visitor *v, const char *name,
+                             void *opaque, Error **errp)
+{
+    uint8_t pmu_mask = RISCV_CPU(obj)->cfg.pmu_mask;
+
+    visit_type_uint8(v, name, &pmu_mask, errp);
+}
+
+static const PropertyInfo prop_pmu_mask = {
+    .name = "pmu-mask",
+    .get = prop_pmu_mask_get,
+    .set = prop_pmu_mask_set,
+};
+
+Property riscv_cpu_options[] = {
     DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
     DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
 
@@ -1490,6 +1569,9 @@ Property riscv_cpu_options[] = {
 static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("debug", RISCVCPU, cfg.debug, true),
 
+    {.name = "pmu-mask", .info = &prop_pmu_mask},
+    {.name = "pmu-num", .info = &prop_pmu_num}, /* Deprecated */
+
 #ifndef CONFIG_USER_ONLY
     DEFINE_PROP_UINT64("resetvec", RISCVCPU, env.resetvec, DEFAULT_RSTVEC),
 #endif
-- 
2.43.0


