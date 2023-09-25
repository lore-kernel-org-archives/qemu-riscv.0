Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4C45CE7AB5
	for <qemu-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 17:59:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qkpqd-00021v-7m; Mon, 25 Sep 2023 13:58:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qkpqY-00020P-1l
 for qemu-riscv@nongnu.org; Mon, 25 Sep 2023 13:58:14 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qkpqW-0002IM-4Y
 for qemu-riscv@nongnu.org; Mon, 25 Sep 2023 13:58:13 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-27736c2a731so2818789a91.3
 for <qemu-riscv@nongnu.org>; Mon, 25 Sep 2023 10:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1695664691; x=1696269491; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/8Lb13b8Q/wdMsJx/GAamGQYB3Fb73dJbrCOvlq3S4k=;
 b=ox8KKazUdBSUHHJ6J5yePxA1dX8BfTpGwg9thK/QzLZjfB3aPrWp8fIXgIKOtMN13F
 gLdHGe30pTLPrgJOE21WJmFDvlu+wuZU9yyQWJ656eDHggaZ50qYX53AJT3OJKg8tmTM
 CmuAAgt1cwtym6maBzz+trKtHDrRCdtImUc6N7exrWYu5MQk5T8uR2EF4Ogbk7Tkk4hF
 +Nw4hdFr6EbdhDs3iLX5bRH4O2aj/YRjJ7BNYqsKlrpnECLi3StbPMaIk98hHABYd+o0
 mL7HMqEBNgn33KQXkvohou1/B7tpaIpNf57ZnUTp/TA0P/5reMV1EM/eBbmvgN+6eebf
 JRXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695664691; x=1696269491;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/8Lb13b8Q/wdMsJx/GAamGQYB3Fb73dJbrCOvlq3S4k=;
 b=mNl7TYgPhkklQE2kvQjrTi7xiP3A5kf6TPsbwwjy0fEeoapVOs2AMBgwbeg1XIzjME
 L6VCFZx6NlMVN0o5Chs6Z+syRljV+0TYlI9n0nSipmUwWKGClQpvlMZIa8sIJYgKMNSn
 Kr+cwunpwFkDDvypRl8mvZrm6ZNWBaGi3Kv6MUA3a5ACon+I6xPFU6G4DKeH3wRRCFdK
 nYwhLQOBmXQGAAL1aLX/Xd31gDfD82UY/A1u1J+xS0umx3HsQaYCFvsLr9NugQZVfauk
 Pf3mZpxMa9/VyLcFJ0aU9Bv0aQQH+X+I+umqv7mUgGWYMaFlIlyN8LLiypejICmpg8La
 AmRQ==
X-Gm-Message-State: AOJu0Yx6jMhwNhXhbFtKMBdpCJhfu4Eg99MhX3brl5z7e/98nmnW0sUW
 lBdSAcTSwgk4zCMEgL9VX4o9tQ==
X-Google-Smtp-Source: AGHT+IHLzAEvZqG8sOZQVLEYfZcXsgxitWtrSVfZhjNYeBDY1/ZOP6MasktAsYiBBuSODbjWDhA5ag==
X-Received: by 2002:a17:90a:a795:b0:26f:2c5a:bbb3 with SMTP id
 f21-20020a17090aa79500b0026f2c5abbb3mr6489443pjq.40.1695664690732; 
 Mon, 25 Sep 2023 10:58:10 -0700 (PDT)
Received: from grind.. ([177.94.42.59]) by smtp.gmail.com with ESMTPSA id
 i3-20020a17090a65c300b00262ca945cecsm3312722pjs.54.2023.09.25.10.58.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Sep 2023 10:58:10 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v4 18/19] target/riscv/cpu.c: export isa_edata_arr[]
Date: Mon, 25 Sep 2023 14:57:08 -0300
Message-ID: <20230925175709.35696-19-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230925175709.35696-1-dbarboza@ventanamicro.com>
References: <20230925175709.35696-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pj1-x1030.google.com
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

This array will be read by the TCG accel class, allowing it to handle
priv spec verifications on its own. The array will remain here in cpu.c
because it's also used by the riscv,isa string function.

To export it we'll finish it with an empty element since ARRAY_SIZE()
won't work outside of cpu.c. Get rid of its ARRAY_SIZE() usage now to
alleviate the changes for the next patch.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 47 +++++++++++++++++++++-------------------------
 target/riscv/cpu.h |  7 +++++++
 2 files changed, 28 insertions(+), 26 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 46263e55d5..e97ba3df93 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -41,15 +41,6 @@ static const char riscv_single_letter_exts[] = "IEMAFDQCPVH";
 const uint32_t misa_bits[] = {RVI, RVE, RVM, RVA, RVF, RVD, RVV,
                               RVC, RVS, RVU, RVH, RVJ, RVG, 0};
 
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
 
     g_assert_not_reached();
@@ -932,22 +928,21 @@ static void riscv_cpu_disas_set_info(CPUState *s, disassemble_info *info)
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
@@ -1619,13 +1614,13 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
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
index aba8192c74..3dfcd0732f 100644
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


