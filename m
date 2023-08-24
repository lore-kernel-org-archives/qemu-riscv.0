Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29037EE49A0
	for <qemu-riscv@archiver.kernel.org>; Thu, 24 Aug 2023 22:18:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qZIc5-00087r-2i; Thu, 24 Aug 2023 18:15:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qZIbt-0007tM-Lp
 for qemu-riscv@nongnu.org; Thu, 24 Aug 2023 18:15:29 -0400
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qZIbp-0006H5-OZ
 for qemu-riscv@nongnu.org; Thu, 24 Aug 2023 18:15:23 -0400
Received: by mail-oo1-xc30.google.com with SMTP id
 006d021491bc7-570e88ee36aso236189eaf.1
 for <qemu-riscv@nongnu.org>; Thu, 24 Aug 2023 15:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1692915320; x=1693520120;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OGzhTKGa5goCm27jbRZw9T66af3Md2lAtbnq8MRoyNY=;
 b=H1ZfWMInHIB2KMWB6eMWsqbcdCy5S2znFwJcO4Rfk5ztHk7F+YxHEKDCp8Yc+dUhnn
 T1qwJgtKzQY7JNQfXJCFRJGaj/LBQXTJl5rdSBK6jlZUMJW6hSDSDa24aYVGUOIYHzPW
 fuNKi1SmG8OAMt3CtuTXcsE3qw/q2pVMDzLqOD/FVPFXFt5EZx1eSklyqvoiV6vf5iT+
 8pYksr1EioGb7WIL8E/6OH3zonDmqrKmYmRfEiDoyOO/0VkwQvwko+SnawkrcF0KxaMP
 OC00qfmMDylNPzU0xUkRRr0lh6HeAJ8rJRiELJNW0whBHB/t27PIdewRKkHgltidPen1
 4Bww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692915320; x=1693520120;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OGzhTKGa5goCm27jbRZw9T66af3Md2lAtbnq8MRoyNY=;
 b=f/QdAtrrth9FkYX+7aCuKb2TeoO90EJrdwugjwOTMdzbC9OW7HRaoI6CVXDrs3ew/F
 2dN0ufsRupN4RmKdle8UEnc9WNC0vteyMlhCyy2kGb1rXFerFVwKN2ejYyjgM6esSNTL
 VqpkoLDIIUmBwAIinBSB4K6nFpZKjaDO44ziEp3emIfnjbItY0QUIAGc1ty583RvC5a3
 TbAKBmrkblBScDlhPN+Zz3deqM484kq58biNEBtnUxMs8g8cTjWCK5f7/34mz1fKnxzx
 WhjC7IfSJG2dvt3GJ6lfDuAfYlS08WYy9COzsfHfL1UEo6aqgUgE1KAbkHJS2fo4VAFl
 Xy5Q==
X-Gm-Message-State: AOJu0YysMX2SaiNRgwsmozimyJ7b70oKULyQGPvroibJQ9bMmHrSipAk
 zTvu8UO/Z0mCcevkgYAQo8J/fg==
X-Google-Smtp-Source: AGHT+IHHyWrsOSelzvX9FQcWUL2Z5rjr2qldDQWpwSyY2wl4xPPYoJKo0k/oX8RzGY17UtR5bKTZoA==
X-Received: by 2002:a4a:394d:0:b0:571:1fad:ebe0 with SMTP id
 x13-20020a4a394d000000b005711fadebe0mr3681671oog.3.1692915320656; 
 Thu, 24 Aug 2023 15:15:20 -0700 (PDT)
Received: from grind.. ([179.93.21.19]) by smtp.gmail.com with ESMTPSA id
 o129-20020a4a4487000000b00565fcfabab8sm256338ooa.21.2023.08.24.15.15.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Aug 2023 15:15:20 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH RESEND v8 13/20] target/riscv/cpu.c: use offset in
 isa_ext_is_enabled/update_enabled
Date: Thu, 24 Aug 2023 19:14:33 -0300
Message-ID: <20230824221440.484675-14-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230824221440.484675-1-dbarboza@ventanamicro.com>
References: <20230824221440.484675-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c30;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc30.google.com
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

We'll have future usage for a function where, given an offset of the
struct RISCVCPUConfig, the flag is updated to a certain val.

Change all existing callers to use edata->ext_enable_offset instead of
'edata'.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 913b64264f..cbf8ceec54 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -162,18 +162,17 @@ static const struct isa_ext_data isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(xventanacondops, PRIV_VERSION_1_12_0, ext_XVentanaCondOps),
 };
 
-static bool isa_ext_is_enabled(RISCVCPU *cpu,
-                               const struct isa_ext_data *edata)
+static bool isa_ext_is_enabled(RISCVCPU *cpu, uint32_t ext_offset)
 {
-    bool *ext_enabled = (void *)&cpu->cfg + edata->ext_enable_offset;
+    bool *ext_enabled = (void *)&cpu->cfg + ext_offset;
 
     return *ext_enabled;
 }
 
-static void isa_ext_update_enabled(RISCVCPU *cpu,
-                                   const struct isa_ext_data *edata, bool en)
+static void isa_ext_update_enabled(RISCVCPU *cpu, uint32_t ext_offset,
+                                   bool en)
 {
-    bool *ext_enabled = (void *)&cpu->cfg + edata->ext_enable_offset;
+    bool *ext_enabled = (void *)&cpu->cfg + ext_offset;
 
     *ext_enabled = en;
 }
@@ -1045,9 +1044,10 @@ static void riscv_cpu_disable_priv_spec_isa_exts(RISCVCPU *cpu)
 
     /* Force disable extensions if priv spec version does not match */
     for (i = 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
-        if (isa_ext_is_enabled(cpu, &isa_edata_arr[i]) &&
+        if (isa_ext_is_enabled(cpu, isa_edata_arr[i].ext_enable_offset) &&
             (env->priv_ver < isa_edata_arr[i].min_version)) {
-            isa_ext_update_enabled(cpu, &isa_edata_arr[i], false);
+            isa_ext_update_enabled(cpu, isa_edata_arr[i].ext_enable_offset,
+                                   false);
 #ifndef CONFIG_USER_ONLY
             warn_report("disabling %s extension for hart 0x" TARGET_FMT_lx
                         " because privilege spec version does not match",
@@ -2337,7 +2337,7 @@ static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str,
     int i;
 
     for (i = 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
-        if (isa_ext_is_enabled(cpu, &isa_edata_arr[i])) {
+        if (isa_ext_is_enabled(cpu, isa_edata_arr[i].ext_enable_offset)) {
             new = g_strconcat(old, "_", isa_edata_arr[i].name, NULL);
             g_free(old);
             old = new;
-- 
2.41.0


