Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8695C3DA4B
	for <qemu-riscv@archiver.kernel.org>; Mon, 15 Jul 2024 17:14:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sTPFI-00066z-HP; Mon, 15 Jul 2024 13:12:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sTPFF-0005rY-7r
 for qemu-riscv@nongnu.org; Mon, 15 Jul 2024 13:12:13 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sTPFB-0007Tl-Q9
 for qemu-riscv@nongnu.org; Mon, 15 Jul 2024 13:12:12 -0400
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-70b04cb28acso3593945b3a.0
 for <qemu-riscv@nongnu.org>; Mon, 15 Jul 2024 10:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1721063527; x=1721668327; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/4tYSD3kmwvsTXZv9JDOMjH919bSCwsQC+O4tYKQ71A=;
 b=H6K2KSfdY8kkbPcDoDOYuNpMPMykCIVis4+rYSKMo5idwVCiY4bMbkhkiDd5VWRdEz
 zxJ3ize1DKhw845wb7u1vBJ+/jGL1HHBys9/dBzTzy8aRn/oh15ZVHhLgD2udik3EiUN
 w61sgElhijQE/y4L6gRQOLrYFsfzX902m4O/KJ8MhBnkm8bVkood5/iEU7/UBp+chpjw
 sLgIM12L9rlA4RVzCPhViczayAoj9w1lkSuctpw1USUcWth0Fizf1kgiDM386GJb3yfn
 Ksc8F2rM01gEkzBC4m9XvcOarsKhyrrbeFz0j/qx0Aa9xc/VPcZM6DlaqCSjCv3vjqz0
 W9ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721063527; x=1721668327;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/4tYSD3kmwvsTXZv9JDOMjH919bSCwsQC+O4tYKQ71A=;
 b=PSIZirVuYidzuTWqi6BcuHHMOEsGmvYvwHJoIcSOoy6VgM8rp4CFeYG6tqWfUdk9gQ
 2ITH2JQDQtVC/VHzR8fS6xHjWLLRrY81WB95RCovDTVU3g9ZxidrCqqwG/R4eF/DWo58
 8jp93Vi8GY26MFOlYHZ7CZE7n5ApA5kmqKmxiPsbKovyLvEONik6ukuPfYSYyDx0VPB8
 uS5/8SQywkIY1vsO2rRRB0ZajO0IBH3Drd6T6op/ZPrFCiHUFGxF4RvTgD1xIdYjx6WA
 4v1RjOgBRWXlaqXW31KU0dphqqUcYfJ8nOyLNvB9bceF6S+DnLim8KB1++4X46Lsq4Rn
 DoKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+hTN4ZUAXVFc88Dn2YP01wM0M2EHgmrRMcjDjwR/LeDnCELDmA4mZgIhd7MZX+lnAIXwJ2KpEZjIV3zP/WhhNU4sQK7Y=
X-Gm-Message-State: AOJu0YwlmOWwG6dV4flxXjwMwifOuSZ5PaPUV67RmdcgnVb2/DYxqZL3
 dhAmttRLGMD2zzR1yJt0jVgq0zrC1XHDpqBER8s2R0kVgMWfL2Jzii0Lyu+Zksg=
X-Google-Smtp-Source: AGHT+IGXFGdiF8idtIVw+VFQFzaRHGhimX6PajwqwGLA9AFhXicg71ra4v4EVC3mjZkj6dPCRT5ldA==
X-Received: by 2002:a05:6a00:860d:b0:705:9669:af1f with SMTP id
 d2e1a72fcca58-70b6c929256mr14359580b3a.10.1721063527329; 
 Mon, 15 Jul 2024 10:12:07 -0700 (PDT)
Received: from sunil-pc.tail07344b.ts.net ([106.51.187.237])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70b7eca85ccsm4752618b3a.178.2024.07.15.10.12.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jul 2024 10:12:06 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH v3 8/9] tests/qtest/bios-tables-test.c: Enable basic testing
 for RISC-V
Date: Mon, 15 Jul 2024 22:41:28 +0530
Message-ID: <20240715171129.1168896-9-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240715171129.1168896-1-sunilvl@ventanamicro.com>
References: <20240715171129.1168896-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pf1-x431.google.com
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
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 tests/qtest/bios-tables-test.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 498e0e35d9..36e5c0adde 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1963,6 +1963,28 @@ static void test_acpi_microvm_acpi_erst(void)
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
@@ -2441,6 +2463,10 @@ int main(int argc, char *argv[])
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
2.43.0


