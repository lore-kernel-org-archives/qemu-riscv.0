Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D197C71133
	for <qemu-riscv@archiver.kernel.org>; Fri, 25 Aug 2023 13:13:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qZWZZ-00021J-Ur; Fri, 25 Aug 2023 09:09:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qZWZY-0001zS-8l
 for qemu-riscv@nongnu.org; Fri, 25 Aug 2023 09:09:56 -0400
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qZWZV-00074Y-St
 for qemu-riscv@nongnu.org; Fri, 25 Aug 2023 09:09:56 -0400
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-1c26bb27feeso573655fac.0
 for <qemu-riscv@nongnu.org>; Fri, 25 Aug 2023 06:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1692968992; x=1693573792;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8EUqyS7RYENP2IdlbI+WkDVjvKc8af/6GpyutbjGRVo=;
 b=I2XopzDl/U9shAnrniunBSBm7O5VBxoOBhab4ved4CIPdVk9XXSrsYxG0zImgitMBh
 ln8CeYXMyGQgXh/yJb4CGGIMM+O/f3jkcFiEc0+ApJWRHen5XAvsTrkJx0tZVR1IbkYa
 YhectW9mOMB0x685RL/vyTsdi5WOw84fkfvVZQalNdcPh+GizYNwNBDvgOQA/+TbcCbp
 glBqz6JsyW85WZcbU8Y6j862NPXLja91o22F5CB33pZTv0nUfSkV3rFmPL2d9i5ZR2AI
 7WPiTDhFmGX2kmAqsQvkWirRiReYW04dBCF60HuBQv+YIR/hMT4Qw2YRIcQx+0Z80RCK
 PhEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692968992; x=1693573792;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8EUqyS7RYENP2IdlbI+WkDVjvKc8af/6GpyutbjGRVo=;
 b=TWqsBqeeXVsnt9rL0we8Y/FtZKcOYXAT+ll/OMSj567gWPiMD5WoiUyZY++E+h+SDW
 G5vVPoJ/6yrIg1Y3P3Ezd7wY3E0XXWtSho7VusJ5wFcs+WgxfW9OYrE32geYr+pyP3e0
 9b4Aq4E3HlHIVDZHUBKtaw2aRlosZdgPq87gPlBj1fDv1Zfb73HvR+LosRh/imx5RvPl
 zLbewdZTHjuKf3YqsXskXeOxRMOFXM4pCypuG0DLgp6TFJMlk+PRGuni6tXUurKO5bQQ
 DXrNXwt/PcRyRbgZenQb34MoeSIQ5kPg0CcR5PmT1ZH1yE0EcysWJ4lra8hJvL6VGSK3
 LEgQ==
X-Gm-Message-State: AOJu0Yzar3ciKQBz/URDIN08lC3ZIvITfaAZre/8A500umt1uz2Bd4kA
 +yx5Zb1VRTeRdXR8yAOuCtuEpfLy53Ft/a1q5ao=
X-Google-Smtp-Source: AGHT+IFWGw+lw7riJWvOTwkcvfPGu49dk0crxmHmzia9w32DFZnYNy1nBStJTYn8IanBfuzYqV4FwA==
X-Received: by 2002:a05:6870:5493:b0:1bf:e2a6:b287 with SMTP id
 f19-20020a056870549300b001bfe2a6b287mr3263731oan.0.1692968992510; 
 Fri, 25 Aug 2023 06:09:52 -0700 (PDT)
Received: from grind.. ([179.93.21.19]) by smtp.gmail.com with ESMTPSA id
 ds23-20020a0568705b1700b001c50fb56845sm966189oab.16.2023.08.25.06.09.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Aug 2023 06:09:52 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 17/20] target/riscv/cpu.c: export isa_edata_arr[]
Date: Fri, 25 Aug 2023 10:08:50 -0300
Message-ID: <20230825130853.511782-18-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230825130853.511782-1-dbarboza@ventanamicro.com>
References: <20230825130853.511782-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::30;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

This array will be read by the TCG accel class, allowing it to handle
priv spec verifications on its own. The array will remain here in cpu.c
because it's also used by the riscv,isa string function.

To export it we'll make it constant and finish it with an empty element
since ARRAY_SIZE() won't work outside of cpu.c. Get rid of its
ARRAY_SIZE() usage now to alleviate the changes for the next patch.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 47 +++++++++++++++++++++-------------------------
 target/riscv/cpu.h |  7 +++++++
 2 files changed, 28 insertions(+), 26 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 3c9db46837..ac5ad4727c 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -41,15 +41,6 @@ static const char riscv_single_letter_exts[] = "IEMAFDQCPVH";
 const uint32_t misa_bits[] = {RVI, RVE, RVM, RVA, RVF, RVD, RVV,
                               RVC, RVS, RVU, RVH, RVJ, RVG};
 
-struct isa_ext_data {
-    const char *name;
-    int min_version;
-    int ext_enable_offset;
-};
-
-#define ISA_EXT_DATA_ENTRY(_name, _min_ver, _prop) \
-    {#_name, _min_ver, CPU_CFG_OFFSET(_prop)}
-
 /*
  * From vector_helper.c
  * Note that vector data is stored in host-endian 64-bit chunks,
@@ -61,6 +52,9 @@ struct isa_ext_data {
 #define BYTE(x)   (x)
 #endif
 
+#define ISA_EXT_DATA_ENTRY(_name, _min_ver, _prop) \
+    {#_name, _min_ver, CPU_CFG_OFFSET(_prop)}
+
 /*
  * Here are the ordering rules of extension naming defined by RISC-V
  * specification :
@@ -81,7 +75,7 @@ struct isa_ext_data {
  * Single letter extensions are checked in riscv_cpu_validate_misa_priv()
  * instead.
  */
-static const struct isa_ext_data isa_edata_arr[] = {
+const RISCVIsaExtData isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zicbom, PRIV_VERSION_1_12_0, ext_icbom),
     ISA_EXT_DATA_ENTRY(zicboz, PRIV_VERSION_1_12_0, ext_icboz),
     ISA_EXT_DATA_ENTRY(zicond, PRIV_VERSION_1_12_0, ext_zicond),
@@ -160,6 +154,8 @@ static const struct isa_ext_data isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(xtheadmempair, PRIV_VERSION_1_11_0, ext_xtheadmempair),
     ISA_EXT_DATA_ENTRY(xtheadsync, PRIV_VERSION_1_11_0, ext_xtheadsync),
     ISA_EXT_DATA_ENTRY(xventanacondops, PRIV_VERSION_1_12_0, ext_XVentanaCondOps),
+
+    DEFINE_PROP_END_OF_LIST(),
 };
 
 bool isa_ext_is_enabled(RISCVCPU *cpu, uint32_t ext_offset)
@@ -178,14 +174,14 @@ void isa_ext_update_enabled(RISCVCPU *cpu, uint32_t ext_offset, bool en)
 
 int cpu_cfg_ext_get_min_version(uint32_t ext_offset)
 {
-    int i;
+    const RISCVIsaExtData *edata;
 
-    for (i = 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
-        if (isa_edata_arr[i].ext_enable_offset != ext_offset) {
+    for (edata = isa_edata_arr; edata && edata->name; edata++) {
+        if (edata->ext_enable_offset != ext_offset) {
             continue;
         }
 
-        return isa_edata_arr[i].min_version;
+        return edata->min_version;
     }
 
     /* Default to oldest priv spec if no match found */
@@ -933,22 +929,21 @@ static void riscv_cpu_disas_set_info(CPUState *s, disassemble_info *info)
 void riscv_cpu_disable_priv_spec_isa_exts(RISCVCPU *cpu)
 {
     CPURISCVState *env = &cpu->env;
-    int i;
+    const RISCVIsaExtData *edata;
 
     /* Force disable extensions if priv spec version does not match */
-    for (i = 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
-        if (isa_ext_is_enabled(cpu, isa_edata_arr[i].ext_enable_offset) &&
-            (env->priv_ver < isa_edata_arr[i].min_version)) {
-            isa_ext_update_enabled(cpu, isa_edata_arr[i].ext_enable_offset,
-                                   false);
+    for (edata = isa_edata_arr; edata && edata->name; edata++) {
+        if (isa_ext_is_enabled(cpu, edata->ext_enable_offset) &&
+            (env->priv_ver < edata->min_version)) {
+            isa_ext_update_enabled(cpu, edata->ext_enable_offset, false);
 #ifndef CONFIG_USER_ONLY
             warn_report("disabling %s extension for hart 0x" TARGET_FMT_lx
                         " because privilege spec version does not match",
-                        isa_edata_arr[i].name, env->mhartid);
+                        edata->name, env->mhartid);
 #else
             warn_report("disabling %s extension because "
                         "privilege spec version does not match",
-                        isa_edata_arr[i].name);
+                        edata->name);
 #endif
         }
     }
@@ -1614,13 +1609,13 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
 static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str,
                                  int max_str_len)
 {
+    const RISCVIsaExtData *edata;
     char *old = *isa_str;
     char *new = *isa_str;
-    int i;
 
-    for (i = 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
-        if (isa_ext_is_enabled(cpu, isa_edata_arr[i].ext_enable_offset)) {
-            new = g_strconcat(old, "_", isa_edata_arr[i].name, NULL);
+    for (edata = isa_edata_arr; edata && edata->name; edata++) {
+        if (isa_ext_is_enabled(cpu, edata->ext_enable_offset)) {
+            new = g_strconcat(old, "_", edata->name, NULL);
             g_free(old);
             old = new;
         }
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 4269523e24..d9a17df46a 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -726,6 +726,13 @@ extern const RISCVCPUMultiExtConfig riscv_cpu_vendor_exts[];
 extern const RISCVCPUMultiExtConfig riscv_cpu_experimental_exts[];
 extern Property riscv_cpu_options[];
 
+typedef struct isa_ext_data {
+    const char *name;
+    int min_version;
+    int ext_enable_offset;
+} RISCVIsaExtData;
+extern const RISCVIsaExtData isa_edata_arr[];
+
 void riscv_add_satp_mode_properties(Object *obj);
 
 /* CSR function table */
-- 
2.41.0


