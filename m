Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 838CFC25B74
	for <qemu-riscv@archiver.kernel.org>; Fri, 24 May 2024 06:16:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sAODf-0003aN-5A; Fri, 24 May 2024 02:15:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sAODX-000332-Cq
 for qemu-riscv@nongnu.org; Fri, 24 May 2024 02:15:52 -0400
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sAODO-0001U2-11
 for qemu-riscv@nongnu.org; Fri, 24 May 2024 02:15:50 -0400
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-24ca03ad307so280390fac.3
 for <qemu-riscv@nongnu.org>; Thu, 23 May 2024 23:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1716531339; x=1717136139; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0BD/3bkbfti/sxehilpLJYRZElpAI3Ovze0/5RgjFlY=;
 b=eYWTorw32CmdIEEmzufpMx2LllFUwoK6j6F1NL961e/EbdfDwmsnR0YoFE6tdxxeqf
 BmGfiogNCzMBNQEITCxHJZDnaAGKlrb862tExJhFk2f9ba1lYfD/rC7Br6Zh0F/REHD5
 dS4SnFYXhdtq+R1fbinD8exd/tZLoGcxl349JhFa789302xq+QhsekszJ3OVVQK5RzCd
 hMCejFEhFevWIK9XEQ0sgSIFiIKBgSuZkBa+QfszaefW4XflvFkBu/U7VCiIOpt17nKn
 xOM3FFKWx+DHrqZCpw9CWtfrArU202WCQd5YZEl5f+rm/dnmzjmgQ51WUS2+S1Ms4wSz
 /V9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716531339; x=1717136139;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0BD/3bkbfti/sxehilpLJYRZElpAI3Ovze0/5RgjFlY=;
 b=ZPir+KYAyE3v8VHp6VE4Zfok5mA5qT4Kan3KVlvwtr3bKmU5B6BgmxieAlb0mA2yA4
 C7B8jkN4fYpDOtD318AcbnFGvVIJvyzTreuwJ+hqRyGde1TpXTUJUdSmtnUbdQF4mJdJ
 kH0izgshLraB26Mwvwppbsc0nlAX9HWGEKJFhIVKE+YrXhn7ASDhBsjGbFRUGzWWr9+k
 PPL6PPhJNtWqdyWC8ifM5rovlH1Hiv+NXzmVebT04Vxk5kISd1ATwVZtn/xcRuHjmlci
 vL/nBGhD12aOO4QcSLyl5PCnDpZaychNm7CvVCiFB/jAJd57CJatqLs69AnXOfDZ36sJ
 GLcg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXP982TXEttKF1oPaOthxUd+KfWL63T5aR0tCZ5Qw0CqdhBQckTGDVGv62iGaj4Dft9ua5hGR1RtC4d+d4xp3+8JMBQQsQ=
X-Gm-Message-State: AOJu0YzeGwvTpASBSzcZKX3vK5eHjEFaZQ0pe/U6qRoEkwlw85ys5CEw
 O9FcAuYv8mlQ+mD7zYhOZAgZn7pxCyt744ZkZh00xmM0jotQqY2AmmzHR9mRhwQ=
X-Google-Smtp-Source: AGHT+IG67OY2VscXOoo4si6QvsZohVhT+dLw5NF1CMa40glisTJpmqbX9JO8mHELJgvc13Mj3fdm0A==
X-Received: by 2002:a05:6870:a70e:b0:24c:59f7:e840 with SMTP id
 586e51a60fabf-24ca12039a1mr1413445fac.17.1716531338655; 
 Thu, 23 May 2024 23:15:38 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.188.31])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-6f8fcbea487sm516106b3a.107.2024.05.23.23.15.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 May 2024 23:15:38 -0700 (PDT)
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
 Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH v2 11/12] tests/qtest/bios-tables-test.c: Enable basic testing
 for RISC-V
Date: Fri, 24 May 2024 11:44:10 +0530
Message-Id: <20240524061411.341599-12-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240524061411.341599-1-sunilvl@ventanamicro.com>
References: <20240524061411.341599-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::30;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-oa1-x30.google.com
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

Add basic ACPI table test case for RISC-V.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 tests/qtest/bios-tables-test.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index c73174ad00..880435a5fa 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1935,6 +1935,29 @@ static void test_acpi_microvm_acpi_erst(void)
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
+        .ram_start = 0x80000000ULL,
+        .scan_len = 128ULL * 1024 * 1024,
+    };
+
+    /*
+     * RHCT will have ISA string encoded. To reduce the effort
+     * of updating expected AML file for any new default ISA extension,
+     * use the profile rva22s64.
+     */
+    test_acpi_one("-cpu rva22s64 -device virtio-blk-device,drive=hd0 "
+                  "-drive file=tests/data/uefi-boot-images/bios-tables-test.riscv64.iso.qcow2,id=hd0",
+                  &data);
+    free_test_data(&data);
+}
+
 static void test_acpi_aarch64_virt_tcg(void)
 {
     test_data data = {
@@ -2404,6 +2427,10 @@ int main(int argc, char *argv[])
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


