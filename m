Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13FEDC3064D
	for <qemu-riscv@archiver.kernel.org>; Tue, 25 Jun 2024 15:10:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sM7nU-0001UA-CW; Tue, 25 Jun 2024 11:09:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sM7nT-0001Tk-08
 for qemu-riscv@nongnu.org; Tue, 25 Jun 2024 11:09:27 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sM7nR-0006WH-9B
 for qemu-riscv@nongnu.org; Tue, 25 Jun 2024 11:09:26 -0400
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-711b1512aeaso4398445a12.3
 for <qemu-riscv@nongnu.org>; Tue, 25 Jun 2024 08:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1719328164; x=1719932964; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y1OPYRH+1jqNvqk3IUxnhH2KTsAwqrwXkGI6cFJybeA=;
 b=EZJcknYvHj4noK6B+gj6iG9ChCmUO4FIgibvBUQFQ1jsKJ61/23Z+MNzvdffp1wil5
 32TAllwKyZxCwRsgN5LZNgJq9d4CokdkaTdgijhE6LVt92cSfwV9IknFIi1JGYvnU54b
 JtYv0zlO1Pc5hgHBzcZBD89ajtllgGuQLc4onqd3kI4n0039EHez8eQpcRekIN8aXnJ7
 sG4o95gn4RmTyG5HEVLuuXRjD3DnDxZ9XcftwV9x5hjT+0Kd/ev5immM0IQEmDU4zlAI
 e9eIGDncfCutlkh4u3nh6OBs2k2cTw5EZcz4KgJs1FZSsXqlpS5FLbeWd5zoFXzZ1bGH
 ehKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719328164; x=1719932964;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y1OPYRH+1jqNvqk3IUxnhH2KTsAwqrwXkGI6cFJybeA=;
 b=j8NtAvJaDgy6dCMYXnmNxGavWWJwp/W34nkdMCnrN1TZsqbx2Unbmn6jqcTep//rrq
 0GZD2AQlKPDu4O7NEtEl3YuRts9BGoFH0JROijbClbqnlemUCnn1NFixaXWXex3fheXn
 X/yPwED18SoLwfLZpcExizaaGCjmA8f1grZ3gTjcKlHNAZZ4hkKMY7ezE/XYygeHKL48
 hGkd59yCGs0QBXw9HOZHaqZoU3BEgYZ+O4VohjqGROaGNf5c+wj/NgLKLcN453IkEYXS
 Fqqw8wSBMnUQgt9sclnUtTuXyOghvXqz65hCs68TgvZkZRdKTBxwIq3vzp0nQtLLP/Ql
 Q5ng==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGqNkSNn5dFuVAo0eD0ObAf2YSzgrY/2uAcylTxrAQx7/zXHsrx0nGWBZzttwHxmTFTKVP97Vgh+cqgu4lihT5ydl0G4U=
X-Gm-Message-State: AOJu0YyA5ivhdpiDI2REcw0/42dJcxyNyfiB11qDOqseWclvD7qL/JRj
 WwQo7tFetDAENGTFSfvZcbzKJH3bbmj1n4Z7+jJs+sb0yBn0rjxD0R7nKht2VSA=
X-Google-Smtp-Source: AGHT+IHh+glQz5bpzqBbMafxTBiedjDg8E9FAOGTZRELqYHixsca0aztRXEKHZOqK0Ntz0dA97XWAQ==
X-Received: by 2002:a05:6a20:8914:b0:1bc:fff0:322a with SMTP id
 adf61e73a8af0-1bcfff03370mr6211022637.4.1719328163837; 
 Tue, 25 Jun 2024 08:09:23 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.187.237])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70681722219sm4142636b3a.73.2024.06.25.08.09.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 08:09:23 -0700 (PDT)
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
 Sia Jee Heng <jeeheng.sia@starfivetech.com>,
 Alistair Francis <alistair23@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Sunil V L <sunilvl@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v4 06/16] tests/qtest/bios-tables-test.c: Add support for arch
 in path
Date: Tue, 25 Jun 2024 20:38:29 +0530
Message-Id: <20240625150839.1358279-7-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240625150839.1358279-1-sunilvl@ventanamicro.com>
References: <20240625150839.1358279-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pg1-x529.google.com
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

Since machine name can be common for multiple architectures (ex: virt),
add "arch" in the path to search for expected AML files. Since the AML
files are still under old path, add support for searching with and
without arch in the path.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 tests/qtest/bios-tables-test.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index c4a4d1c7bf..29c52952f4 100644
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
+                                       data->arch, data->machine,
                                        sdt->aml, ext);
+
+            /*
+             * To keep test cases not failing before the DATA files are moved to
+             * ${arch}/${machine} folder, add this check as well.
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
+        aml_file = g_strdup_printf("%s/%s/%s/%.4s%s", data_dir, data->arch,
+                                   data->machine, sdt->aml, ext);
+        if (!g_file_test(aml_file, G_FILE_TEST_EXISTS)) {
+            aml_file = g_strdup_printf("%s/%s/%.4s%s", data_dir, data->machine,
+                                       sdt->aml, ext);
+        }
+
         if (verbosity_level >= 2) {
             fprintf(stderr, "Looking for expected file '%s'\n", aml_file);
         }
-- 
2.40.1


