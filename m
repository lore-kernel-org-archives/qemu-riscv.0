Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E425C001DB
	for <qemu-riscv@archiver.kernel.org>; Wed,  5 Jul 2023 21:45:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qHAEv-00050Q-15; Wed, 05 Jul 2023 17:40:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qHAEq-0004vD-Jp
 for qemu-riscv@nongnu.org; Wed, 05 Jul 2023 17:40:40 -0400
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qHAEo-0001lh-J8
 for qemu-riscv@nongnu.org; Wed, 05 Jul 2023 17:40:40 -0400
Received: by mail-oo1-xc30.google.com with SMTP id
 006d021491bc7-5657d8ecdd3so4630575eaf.1
 for <qemu-riscv@nongnu.org>; Wed, 05 Jul 2023 14:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1688593237; x=1691185237;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CvW410UcZK4dQQaC9i0QCClAX6qE4qbAIfvVzFOsM2o=;
 b=SfKtSsjjf6leuHOHPmKX7mQdUOfWLSZrrQgC9Ir6mqW/nuqfbG/ZkCJjSKnRmk0ibK
 F4ZpgX5d0B95nu6jp3YAK3ocumgHXmLbXwj7BSzm5uWspu7sMM+rMG/uMxkS8YdoH/0A
 thAbt2klSiQAw6U+4g9iNTVHfSBalYnci+7h36xNXLOBFAcTz8Vsdj07kTmU6TTXXmm3
 lX/Mppxj7UL61GM8jfktU/cmSXoKQ01raMUIOh0VuBoy8C5K/c6xxuUzXenBQfmsG3zx
 PmZxYylnVha+Q0FwjyN4ZX3jkzQNESICzlMdfgabQ/OkHtu8eSn2L1kfKh/PYsSuCdY9
 lqEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688593237; x=1691185237;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CvW410UcZK4dQQaC9i0QCClAX6qE4qbAIfvVzFOsM2o=;
 b=RyH4dAF9y5MoS7rms/MSk0OyQY92onmDm7TLKxrpvbjAUbRKEaqDXSNhA2JyhdOce/
 0tSVvFO8PbHoLjXmWOQZsqqwwTfll2kEy/ORPWlCS4ggrkHbtOsG/0JkcvMdWxhJtlUZ
 eqiO8kEEmjgWA/Jzaz9nXBym9EWaFd4Bp3KWNTB+BwPv/U17Fd6iGVlOt+0vHSVhqCpf
 PKznnpvGynt4cZqO+dWmI/wcX0ml5fQIs0+8R6feZvyLVhvfjrP6exOj95BZGycHz4nq
 HTNDT4BVxw8NkgMew0MAMlxvMGGO+3vLUSo5fZqEbgQQE22NMbBYWLE7ZbZAv1Khxb6C
 OIKg==
X-Gm-Message-State: ABy/qLZm4fnXJkwjz7vLs2mlYUGauEcpfk5UB7uB4dNX8TP9kbH1o5Gi
 IXXN1x2v96qdUurNELdbyPvfxw==
X-Google-Smtp-Source: APBJJlF2xDttZvMpEJbZAQB2gMxec8JQrd6P6C/Ps8bUZ5IvP0xrI4VAbnUfi5R1Fl/hAvVUr8zbZw==
X-Received: by 2002:a4a:4151:0:b0:55e:9ee:2a30 with SMTP id
 x78-20020a4a4151000000b0055e09ee2a30mr19541ooa.4.1688593237596; 
 Wed, 05 Jul 2023 14:40:37 -0700 (PDT)
Received: from grind.. (201-69-66-110.dial-up.telesp.net.br. [201.69.66.110])
 by smtp.gmail.com with ESMTPSA id
 m1-20020a4add01000000b0056665a16536sm70764oou.30.2023.07.05.14.40.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jul 2023 14:40:37 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v8 11/20] target/riscv/cpu: add misa_ext_info_arr[]
Date: Wed,  5 Jul 2023 18:39:46 -0300
Message-ID: <20230705213955.429895-12-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230705213955.429895-1-dbarboza@ventanamicro.com>
References: <20230705213955.429895-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c30;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc30.google.com
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

Next patch will add KVM specific user properties for both MISA and
multi-letter extensions. For MISA extensions we want to make use of what
is already available in misa_ext_cfgs[] to avoid code repetition.

misa_ext_info_arr[] array will hold name and description for each MISA
extension that misa_ext_cfgs[] is declaring. We'll then use this new
array in KVM code to avoid duplicating strings. Two getters were added
to allow KVM to retrieve the 'name' and 'description' for each MISA
property.

There's nothing holding us back from doing the same with multi-letter
extensions. For now doing just with MISA extensions is enough.

It is worth documenting that even using the __bultin_ctz() directive to
populate the misa_ext_info_arr[] we are forced to assign 'name' and
'description' during runtime in riscv_cpu_add_misa_properties(). The
reason is that some Gitlab runners ('clang-user' and 'tsan-build') will
throw errors like this if we fetch 'name' and 'description' from the
array in the MISA_CFG() macro:

../target/riscv/cpu.c:1624:5: error: initializer element is not a
                              compile-time constant
    MISA_CFG(RVA, true),
    ^~~~~~~~~~~~~~~~~~~
../target/riscv/cpu.c:1619:53: note: expanded from macro 'MISA_CFG'
    {.name = misa_ext_info_arr[MISA_INFO_IDX(_bit)].name, \
             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~

gcc and others compilers/builders were fine with that change. We can't
ignore failures in the Gitlab pipeline though, so code was changed to
make every runner happy.

As a side effect, misa_ext_cfg[] is no longer a 'const' array because
it must be set during runtime.

Suggested-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 target/riscv/cpu.c | 110 +++++++++++++++++++++++++++++++++------------
 target/riscv/cpu.h |   7 ++-
 2 files changed, 88 insertions(+), 29 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 0e1265bb17..35ba220c8f 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1636,33 +1636,83 @@ static void cpu_get_misa_ext_cfg(Object *obj, Visitor *v, const char *name,
     visit_type_bool(v, name, &value, errp);
 }
 
-static const RISCVCPUMisaExtConfig misa_ext_cfgs[] = {
-    {.name = "a", .description = "Atomic instructions",
-     .misa_bit = RVA, .enabled = true},
-    {.name = "c", .description = "Compressed instructions",
-     .misa_bit = RVC, .enabled = true},
-    {.name = "d", .description = "Double-precision float point",
-     .misa_bit = RVD, .enabled = true},
-    {.name = "f", .description = "Single-precision float point",
-     .misa_bit = RVF, .enabled = true},
-    {.name = "i", .description = "Base integer instruction set",
-     .misa_bit = RVI, .enabled = true},
-    {.name = "e", .description = "Base integer instruction set (embedded)",
-     .misa_bit = RVE, .enabled = false},
-    {.name = "m", .description = "Integer multiplication and division",
-     .misa_bit = RVM, .enabled = true},
-    {.name = "s", .description = "Supervisor-level instructions",
-     .misa_bit = RVS, .enabled = true},
-    {.name = "u", .description = "User-level instructions",
-     .misa_bit = RVU, .enabled = true},
-    {.name = "h", .description = "Hypervisor",
-     .misa_bit = RVH, .enabled = true},
-    {.name = "x-j", .description = "Dynamic translated languages",
-     .misa_bit = RVJ, .enabled = false},
-    {.name = "v", .description = "Vector operations",
-     .misa_bit = RVV, .enabled = false},
-    {.name = "g", .description = "General purpose (IMAFD_Zicsr_Zifencei)",
-     .misa_bit = RVG, .enabled = false},
+typedef struct misa_ext_info {
+    const char *name;
+    const char *description;
+} MISAExtInfo;
+
+#define MISA_INFO_IDX(_bit) \
+    __builtin_ctz(_bit)
+
+#define MISA_EXT_INFO(_bit, _propname, _descr) \
+    [MISA_INFO_IDX(_bit)] = {.name = _propname, .description = _descr}
+
+static const MISAExtInfo misa_ext_info_arr[] = {
+    MISA_EXT_INFO(RVA, "a", "Atomic instructions"),
+    MISA_EXT_INFO(RVC, "c", "Compressed instructions"),
+    MISA_EXT_INFO(RVD, "d", "Double-precision float point"),
+    MISA_EXT_INFO(RVF, "f", "Single-precision float point"),
+    MISA_EXT_INFO(RVI, "i", "Base integer instruction set"),
+    MISA_EXT_INFO(RVE, "e", "Base integer instruction set (embedded)"),
+    MISA_EXT_INFO(RVM, "m", "Integer multiplication and division"),
+    MISA_EXT_INFO(RVS, "s", "Supervisor-level instructions"),
+    MISA_EXT_INFO(RVU, "u", "User-level instructions"),
+    MISA_EXT_INFO(RVH, "h", "Hypervisor"),
+    MISA_EXT_INFO(RVJ, "x-j", "Dynamic translated languages"),
+    MISA_EXT_INFO(RVV, "v", "Vector operations"),
+    MISA_EXT_INFO(RVG, "g", "General purpose (IMAFD_Zicsr_Zifencei)"),
+};
+
+static int riscv_validate_misa_info_idx(uint32_t bit)
+{
+    int idx;
+
+    /*
+     * Our lowest valid input (RVA) is 1 and
+     * __builtin_ctz() is UB with zero.
+     */
+    g_assert(bit != 0);
+    idx = MISA_INFO_IDX(bit);
+
+    g_assert(idx < ARRAY_SIZE(misa_ext_info_arr));
+    return idx;
+}
+
+const char *riscv_get_misa_ext_name(uint32_t bit)
+{
+    int idx = riscv_validate_misa_info_idx(bit);
+    const char *val = misa_ext_info_arr[idx].name;
+
+    g_assert(val != NULL);
+    return val;
+}
+
+const char *riscv_get_misa_ext_description(uint32_t bit)
+{
+    int idx = riscv_validate_misa_info_idx(bit);
+    const char *val = misa_ext_info_arr[idx].description;
+
+    g_assert(val != NULL);
+    return val;
+}
+
+#define MISA_CFG(_bit, _enabled) \
+    {.misa_bit = _bit, .enabled = _enabled}
+
+static RISCVCPUMisaExtConfig misa_ext_cfgs[] = {
+    MISA_CFG(RVA, true),
+    MISA_CFG(RVC, true),
+    MISA_CFG(RVD, true),
+    MISA_CFG(RVF, true),
+    MISA_CFG(RVI, true),
+    MISA_CFG(RVE, false),
+    MISA_CFG(RVM, true),
+    MISA_CFG(RVS, true),
+    MISA_CFG(RVU, true),
+    MISA_CFG(RVH, true),
+    MISA_CFG(RVJ, false),
+    MISA_CFG(RVV, false),
+    MISA_CFG(RVG, false),
 };
 
 static void riscv_cpu_add_misa_properties(Object *cpu_obj)
@@ -1670,7 +1720,11 @@ static void riscv_cpu_add_misa_properties(Object *cpu_obj)
     int i;
 
     for (i = 0; i < ARRAY_SIZE(misa_ext_cfgs); i++) {
-        const RISCVCPUMisaExtConfig *misa_cfg = &misa_ext_cfgs[i];
+        RISCVCPUMisaExtConfig *misa_cfg = &misa_ext_cfgs[i];
+        int bit = misa_cfg->misa_bit;
+
+        misa_cfg->name = riscv_get_misa_ext_name(bit);
+        misa_cfg->description = riscv_get_misa_ext_description(bit);
 
         object_property_add(cpu_obj, misa_cfg->name, "bool",
                             cpu_get_misa_ext_cfg,
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 3081603464..6ea22e0eea 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -41,7 +41,10 @@
 
 #define RV(x) ((target_ulong)1 << (x - 'A'))
 
-/* Consider updating misa_ext_cfgs[] when adding new MISA bits here */
+/*
+ * Consider updating misa_ext_info_arr[] and misa_ext_cfgs[]
+ * when adding new MISA bits here.
+ */
 #define RVI RV('I')
 #define RVE RV('E') /* E and I are mutually exclusive */
 #define RVM RV('M')
@@ -56,6 +59,8 @@
 #define RVJ RV('J')
 #define RVG RV('G')
 
+const char *riscv_get_misa_ext_name(uint32_t bit);
+const char *riscv_get_misa_ext_description(uint32_t bit);
 
 /* Privileged specification version */
 enum {
-- 
2.41.0


