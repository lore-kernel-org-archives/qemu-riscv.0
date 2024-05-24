Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F110C25B79
	for <qemu-riscv@archiver.kernel.org>; Fri, 24 May 2024 06:15:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sAODB-0002Rl-M4; Fri, 24 May 2024 02:15:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sAOCs-0002Kg-WC
 for qemu-riscv@nongnu.org; Fri, 24 May 2024 02:15:13 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sAOCg-0001GS-1X
 for qemu-riscv@nongnu.org; Fri, 24 May 2024 02:15:10 -0400
Received: by mail-pg1-x530.google.com with SMTP id
 41be03b00d2f7-6819b3c92bbso406080a12.2
 for <qemu-riscv@nongnu.org>; Thu, 23 May 2024 23:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1716531297; x=1717136097; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=77QEVMRELZi8HUu5rAEqjjLVKC1iehF0W9sw1N8UasQ=;
 b=daAcQZxK/c3iEC/lBaBRRazsGRT0ziVAgNdibtEtUYYWy3tHDIrm7AkE1TyiVyuNUG
 /kZeqBtdZm65dio+Q0H9pGXo5BngeSYdVz4CbtSfbpLe2qw0oxZoCu2Ceygf8/lr/gYk
 oPfVobs39uL8jfd0+a5EMfWJZMN59ksKIvrDlXVR4JPQLyHXzYalrEmMIt7ctetWTZfj
 RXitfl/6wAw4FBY6a4/SU7SeqEYK7O32rlPkDZ+Jx/K+i9kP4EjUxwtLCFe6sYfYTE/p
 9vQ/hjrXLgRk+PHzdkKWLqD5qRAGXL/yitGZc5QKOG+8ewLqrHh62FdJz58i6cVtLJjR
 1zEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716531297; x=1717136097;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=77QEVMRELZi8HUu5rAEqjjLVKC1iehF0W9sw1N8UasQ=;
 b=fHO2mVS4zJuFWrPKwQ/mwTFn7TqGzgAyau+o8PTmMYULL/54oRrSo8d9yKxH+I/LQW
 TEo4WtuxnLJ0dB5v9GLudKeqZF/XDriP484X2OzddTxbRytZPUSxIrAobW2wip3MQPrb
 OoFky5QB7MH1qkKqdAriwTz+4TvL8/ajTTxJ+jQ9Egmd/vAv3PovqqMnGGuCHryicAjt
 ccgKnSW5XFbzYP0OGHbssRO9nyPr6C34pGFjDPylTAxrZO+EmB5henZPuXSxCd7q0rB4
 N7ia8uWkmlgbElKtb0Vy52+1hfo5sEr6rzHIkfeNhuovOXnLnFBqG6KNMg6+5TyvMGj2
 jlgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwQKbcsCy3Q0ijG1anYCe3lVpzX1POHBKd8erAwb0h3pQ+XDz6GIGz4CCCaMu4d9Dfm5pyCzXdgmBlu13kZYTgb5ISVvY=
X-Gm-Message-State: AOJu0YxlzeAp3Rn2652ml4REi5HkkHw6Rvxcb+5fIFQn60mLbia+o//R
 jPwpKq0xgn17CTPArihXoojNOvhr3m4vOWQKC76nOqgcnjh0Yw4YbdxeRqblnZc=
X-Google-Smtp-Source: AGHT+IHysr8kUZwcP/FKgi2tFUHzZz5O812ay4ztm0aTP+wsTRAoKYDcyo4tc7U1PoLtm6NhBG9JeQ==
X-Received: by 2002:a05:6a20:6a1d:b0:1af:f939:8553 with SMTP id
 adf61e73a8af0-1b212df0a3fmr2084071637.46.1716531296708; 
 Thu, 23 May 2024 23:14:56 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.188.31])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-6f8fcbea487sm516106b3a.107.2024.05.23.23.14.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 May 2024 23:14:56 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Alistair Francis <alistair23@gmail.com>,
 Sia Jee Heng <jeeheng.sia@starfivetech.com>,
 Haibo1 Xu <haibo1.xu@intel.com>, Anup Patel <apatel@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Sunil V L <sunilvl@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v2 05/12] tests/qtest/bios-tables-test.c: Add support for arch
 in path
Date: Fri, 24 May 2024 11:44:04 +0530
Message-Id: <20240524061411.341599-6-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240524061411.341599-1-sunilvl@ventanamicro.com>
References: <20240524061411.341599-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pg1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

Since virt machine is common for multiple architectures, add "arch" in
the path to search expected AML files. Since the AML files are still
under old path, support both by searching with and without arch in the
path.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 tests/qtest/bios-tables-test.c | 31 ++++++++++++++++++++++++++++---
 1 file changed, 28 insertions(+), 3 deletions(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index c4a4d1c7bf..c73174ad00 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -78,6 +78,7 @@
 typedef struct {
     bool tcg_only;
     const char *machine;
+    const char *arch;
     const char *machine_param;
     const char *variant;
     const char *uefi_fl1;
@@ -262,8 +263,19 @@ static void dump_aml_files(test_data *data, bool rebuild)
         g_assert(exp_sdt->aml);
 
         if (rebuild) {
-            aml_file = g_strdup_printf("%s/%s/%.4s%s", data_dir, data->machine,
+            aml_file = g_strdup_printf("%s/%s/%s/%.4s%s", data_dir,
+                                       data->machine, data->arch,
                                        sdt->aml, ext);
+
+            /*
+             * To keep test cases not failing when the DATA files are moved to
+             * ARCH under virt folder, add this check as well.
+             */
+            if (!g_file_test(aml_file, G_FILE_TEST_EXISTS)) {
+                aml_file = g_strdup_printf("%s/%s/%.4s%s", data_dir,
+                                           data->machine, sdt->aml, ext);
+            }
+
             if (!g_file_test(aml_file, G_FILE_TEST_EXISTS) &&
                 sdt->aml_len == exp_sdt->aml_len &&
                 !memcmp(sdt->aml, exp_sdt->aml, sdt->aml_len)) {
@@ -398,8 +410,13 @@ static GArray *load_expected_aml(test_data *data)
         memset(&exp_sdt, 0, sizeof(exp_sdt));
 
 try_again:
-        aml_file = g_strdup_printf("%s/%s/%.4s%s", data_dir, data->machine,
-                                   sdt->aml, ext);
+        aml_file = g_strdup_printf("%s/%s/%s/%.4s%s", data_dir, data->machine,
+                                   data->arch, sdt->aml, ext);
+        if (!g_file_test(aml_file, G_FILE_TEST_EXISTS)) {
+            aml_file = g_strdup_printf("%s/%s/%.4s%s", data_dir, data->machine,
+                                       sdt->aml, ext);
+        }
+
         if (verbosity_level >= 2) {
             fprintf(stderr, "Looking for expected file '%s'\n", aml_file);
         }
@@ -1574,6 +1591,7 @@ static void test_acpi_aarch64_virt_tcg_memhp(void)
 {
     test_data data = {
         .machine = "virt",
+        .arch = "aarch64",
         .tcg_only = true,
         .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
         .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
@@ -1667,6 +1685,7 @@ static void test_acpi_aarch64_virt_tcg_numamem(void)
 {
     test_data data = {
         .machine = "virt",
+        .arch = "aarch64",
         .tcg_only = true,
         .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
         .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
@@ -1689,6 +1708,7 @@ static void test_acpi_aarch64_virt_tcg_pxb(void)
 {
     test_data data = {
         .machine = "virt",
+        .arch = "aarch64",
         .tcg_only = true,
         .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
         .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
@@ -1762,6 +1782,7 @@ static void test_acpi_aarch64_virt_tcg_acpi_hmat(void)
 {
     test_data data = {
         .machine = "virt",
+        .arch = "aarch64",
         .tcg_only = true,
         .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
         .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
@@ -1918,6 +1939,7 @@ static void test_acpi_aarch64_virt_tcg(void)
 {
     test_data data = {
         .machine = "virt",
+        .arch = "aarch64",
         .tcg_only = true,
         .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
         .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
@@ -1937,6 +1959,7 @@ static void test_acpi_aarch64_virt_tcg_topology(void)
 {
     test_data data = {
         .machine = "virt",
+        .arch = "aarch64",
         .variant = ".topology",
         .tcg_only = true,
         .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
@@ -2020,6 +2043,7 @@ static void test_acpi_aarch64_virt_viot(void)
 {
     test_data data = {
         .machine = "virt",
+        .arch = "aarch64",
         .tcg_only = true,
         .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
         .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
@@ -2196,6 +2220,7 @@ static void test_acpi_aarch64_virt_oem_fields(void)
 {
     test_data data = {
         .machine = "virt",
+        .arch = "aarch64",
         .tcg_only = true,
         .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
         .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
-- 
2.40.1


