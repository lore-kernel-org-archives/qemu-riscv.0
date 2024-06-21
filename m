Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E082BC2BA1A
	for <qemu-riscv@archiver.kernel.org>; Fri, 21 Jun 2024 12:03:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sKcx3-00078l-42; Fri, 21 Jun 2024 08:01:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sKcwZ-0005ql-HV
 for qemu-riscv@nongnu.org; Fri, 21 Jun 2024 08:00:43 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sKcwX-0003il-V8
 for qemu-riscv@nongnu.org; Fri, 21 Jun 2024 08:00:39 -0400
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1f9885d5c04so17223725ad.0
 for <qemu-riscv@nongnu.org>; Fri, 21 Jun 2024 05:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1718971237; x=1719576037; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dVxhK0fB9Ra8wY3dlUrFv+CNs7d3zccuzBsOAkhusgw=;
 b=gHwdUQVq4wAZFxx+76kvdVUno0w8d4QnL21m0l0jOS56hHwfTG44qCzmbyz16no/fa
 7iZHsCYwsh1bQQPTNPLVbgi8EgCh0nWICE0phMA/8g1s2I6MZX3CQ6zGntCi7lbuTGgT
 WCNx0XgXiEkWhNOVfvMpGCkPYwxzYewcei0VfmdcLftlbO3T1NnZy337lXjDEEhS9jiA
 NJsnbZwDp3QerAqSg6NqT283OJwwPd/JM1egZ7tws6kwdzJCRTFoG8gwEH59m10U4K5W
 4dtgZzinWsWKVJdBySa+AMCIPSg5FYo2xVG4xc7i2w7j0UH/to7Dlx9c4pNW+LSdcGx7
 Y5Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718971237; x=1719576037;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dVxhK0fB9Ra8wY3dlUrFv+CNs7d3zccuzBsOAkhusgw=;
 b=Ga/gDIZdlNS2b5vHPyUT7GzE7vP8xEoYxfNYGN59Mrku7x4z05LesofyanfCx9ipUt
 lMuYU7u8NVA9w2ApQKWi1CRgtU8VBiNxRGLp/WlQbheGdkQqt4GLc0WN9GP+cnQIWRZg
 zbSPvkMHwh7T01u4wURbmL8W5AILudiRoYHppkwFLNwozfA6qmhlp7ljHUdbQ7xwvwnY
 EEM9o4porkhQvpBWhdbKy7skdKpbThf8Mq135qQyCarBEQaMHsZbEBM51sdTCU3m2a9X
 MnqzFy0/Y6hH9pKrNQPdEJ8ZXc0mBXkhxnu9x5ulvmvsyPw9+ty9sfJ163TSilh9ufH8
 XOSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWU1m7LUTtUCViK8rIuCZR/EiXwEEP5bZxEHMm7ay+vOf7Bo8SodFlMgalMx96WrRlRbD+HF0fmBGbM8N0o8VirADZRJNQ=
X-Gm-Message-State: AOJu0YwVHgDgpL/H1FpMmRcqEIs4g+V3Isao+sbpK1zEcRRVgg5vdjSe
 EdXnML0BH3pTqhqyNQA7ySCxkJM6zW52k0pW0x8GkD3hfejxSf9QH9BifyA9MLg=
X-Google-Smtp-Source: AGHT+IHrcirRo1lqpSSsJ0Ov1nRvCAJ7rOObz8C0IMd/p+uslscJ4T/7ww4aZzbSQo3qArLUiW4kvA==
X-Received: by 2002:a17:902:d4c3:b0:1f7:174e:354d with SMTP id
 d9443c01a7336-1f9aa4632b3mr100256995ad.48.1718971235080; 
 Fri, 21 Jun 2024 05:00:35 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.187.237])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f9ebbb606dsm12422995ad.270.2024.06.21.05.00.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jun 2024 05:00:34 -0700 (PDT)
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
Subject: [PATCH v3 14/15] tests/qtest/bios-tables-test.c: Enable basic testing
 for RISC-V
Date: Fri, 21 Jun 2024 17:29:05 +0530
Message-Id: <20240621115906.1049832-15-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240621115906.1049832-1-sunilvl@ventanamicro.com>
References: <20240621115906.1049832-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pl1-x629.google.com
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

Add basic ACPI table test case for RISC-V.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 tests/qtest/bios-tables-test.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index f4c4704bab..0f9c654e96 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1977,6 +1977,28 @@ static void test_acpi_microvm_acpi_erst(void)
 }
 #endif /* CONFIG_POSIX */
 
+static void test_acpi_riscv64_virt_tcg(void)
+{
+    test_data data = {
+        .machine = "virt",
+        .arch = "riscv64",
+        .tcg_only = true,
+        .uefi_fl1 = "pc-bios/edk2-riscv-code.fd",
+        .uefi_fl2 = "pc-bios/edk2-riscv-vars.fd",
+        .cd = "tests/data/uefi-boot-images/bios-tables-test.riscv64.iso.qcow2",
+        .ram_start = 0x80000000ULL,
+        .scan_len = 128ULL * 1024 * 1024,
+    };
+
+    /*
+     * RHCT will have ISA string encoded. To reduce the effort
+     * of updating expected AML file for any new default ISA extension,
+     * use the profile rva22s64.
+     */
+    test_acpi_one("-cpu rva22s64 ", &data);
+    free_test_data(&data);
+}
+
 static void test_acpi_aarch64_virt_tcg(void)
 {
     test_data data = {
@@ -2455,6 +2477,10 @@ int main(int argc, char *argv[])
                 qtest_add_func("acpi/virt/viot", test_acpi_aarch64_virt_viot);
             }
         }
+    } else if (strcmp(arch, "riscv64") == 0) {
+        if (has_tcg && qtest_has_device("virtio-blk-pci")) {
+            qtest_add_func("acpi/virt", test_acpi_riscv64_virt_tcg);
+        }
     }
     ret = g_test_run();
     boot_sector_cleanup(disk);
-- 
2.40.1


