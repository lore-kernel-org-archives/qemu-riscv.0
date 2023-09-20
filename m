Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2438DCE79CD
	for <qemu-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 11:22:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qivGv-0006mx-4T; Wed, 20 Sep 2023 07:21:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qivGr-0006lt-5z
 for qemu-riscv@nongnu.org; Wed, 20 Sep 2023 07:21:29 -0400
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qivGp-0002JA-Bw
 for qemu-riscv@nongnu.org; Wed, 20 Sep 2023 07:21:28 -0400
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-1c0fcbf7ae4so4398626fac.0
 for <qemu-riscv@nongnu.org>; Wed, 20 Sep 2023 04:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1695208886; x=1695813686; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u8O5rBYIXDm6c3f9dmM8e697v+RoKN0fqk80mWnEKzg=;
 b=QyKECqKFJ/OJa8gUT5/9xpJmd00eGbqj5AhYFmJ9zMYibyk6w8vcUrMe9W4c+N5LPH
 l0hkBzrOml+CTopLHHf9hobrgNtcVw6EV5OafJ+7hJNO8K5jD0NEjhbC4EApkAvFADcp
 wZO+aC5lIxsI7B3qGeqtaJoP4xSbcplRi5Ky+wpsWA5u2iBzDCGmOUoaQA+8wfLrEIT0
 JfW4tJm/QechFxgwA32BdbklDByq13WP4hheOCF+Zv+6SljG62z1lYfngsmivp/+k/wZ
 kFlqchXfNBU0USsbff1Jg5NGK4AhWcKicsvlyQHGeLCNJEdWCcv9lXmTUFxYIw8E20bB
 3Uyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695208886; x=1695813686;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u8O5rBYIXDm6c3f9dmM8e697v+RoKN0fqk80mWnEKzg=;
 b=fkktQQksruLh5WusCXojwix+zKTy9P5yv1x5uWCjealgqekoodvRD0pKHuej/bWJzR
 hBK+ttAdeY1KGpNVIPWyFHnSkm3tRV/hrCY7TAQ4dOK6ddHoDk8Wqa59u19vstHuFvym
 N2uy19fdRWC8jDcxItD5FdSuiW2zvbAY3+C8GUUZFJtFJLSNRli6HiA7vxJQr4l5ys0L
 S0g17RYuxTeKGFJz7cap+w352xVTbRqHzKiLFME+eDycBbHJJ0TeKV72cVyeA8tLg4NN
 6UGYGIdCnR6qZXG0mAJOdYZk8v7hJfSxPAP2I8vzVzk6E1sg7+EijcNqW/IySUPdwFLb
 MUzQ==
X-Gm-Message-State: AOJu0YzFdkNvVSmz3vci9KFeIoaEu/Fq7eHsXKnpyWXLmre5tpPuklUH
 DYiHK4m53BzJaFAHA/YNu5V0RQ==
X-Google-Smtp-Source: AGHT+IFwmIJh/IO2N5qpccqe4CqfdOqMhvvcM3jt17u9tz5s0YezqOuyIeOMdbv9i330d/6XzULGsQ==
X-Received: by 2002:a05:6870:1cc:b0:1d7:1533:6869 with SMTP id
 n12-20020a05687001cc00b001d715336869mr2086920oad.31.1695208886141; 
 Wed, 20 Sep 2023 04:21:26 -0700 (PDT)
Received: from grind.. ([2804:7f0:bcc0:bdf2:b7ba:a476:c0e3:fb59])
 by smtp.gmail.com with ESMTPSA id
 q4-20020a9d7c84000000b006b45be2fdc2sm5863955otn.65.2023.09.20.04.21.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Sep 2023 04:21:25 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 philmd@linaro.org, ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 18/19] target/riscv/cpu.c: export isa_edata_arr[]
Date: Wed, 20 Sep 2023 08:20:19 -0300
Message-ID: <20230920112020.651006-19-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230920112020.651006-1-dbarboza@ventanamicro.com>
References: <20230920112020.651006-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::33;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x33.google.com
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


