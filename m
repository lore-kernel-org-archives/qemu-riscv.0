Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BF62C83F26
	for <qemu-riscv@archiver.kernel.org>; Thu, 24 Jul 2025 11:05:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uetkY-0008Lw-9l; Thu, 24 Jul 2025 07:04:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1uetkG-00084T-W9
 for qemu-riscv@nongnu.org; Thu, 24 Jul 2025 07:04:19 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1uetkD-0000bG-Rd
 for qemu-riscv@nongnu.org; Thu, 24 Jul 2025 07:04:15 -0400
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-747c2cc3419so727527b3a.2
 for <qemu-riscv@nongnu.org>; Thu, 24 Jul 2025 04:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1753355051; x=1753959851; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rPwSvjo9BOLZviQoIIhyK9231AY2iUmEkjpcQiKAGx8=;
 b=SXy7CKxYNDEBnwmUrj9v5so9NwXLOL6TYZlARieUfpp0k4uGS6lj9odrHgK6bzEBPt
 Ne9bzcvaFmSFJwNWS5P5FdCStq0WWMP72haDknHsG199+784PNQusCU7QT6XQu/H833P
 DMp9T6H9gkbPQcMp8uMOeQXEmCpmxQ/jf6VIyPMGx3HfVkrWrScqW9BQcLWnZ2ksmo4c
 cfuu6YCN6nFY/UTkYFgjBKeBk3Ku2wcf4PfrDBsvHKRd8XVuv5UayQFOImnW5R4TuOdn
 gJtDP7nigtKRrpAzE5sxq3Ymc+c8sKI4XaCFjp+6RESqzx0IcyuA8TtIHNrLfrJVjIg1
 hVhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753355051; x=1753959851;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rPwSvjo9BOLZviQoIIhyK9231AY2iUmEkjpcQiKAGx8=;
 b=GdGYZAPEpMR3p8Pq2x2OVAfUoNVpgPwfy1hFIVaHdWDWFWG7AL1TuP5HyvXrkRJc42
 6+zdWYmouzAZaJmOOGI5hZZowYkr47Cx4j4MB0xtWCiO4oAuI7nMwnF9BUDogyScBiT9
 MI2vuRcgMBVRvT1RDkYx4aTj5U/Rr/MIj6lTHhpyU/pZOPBzDnHUaqJvBpSlPN76C5Ss
 qyOCRWlZKZ23rTAPWflDmqc0gYIn6nCH13OFlV1jQii+hr5m1iC909DQVytdoe4o5zJj
 NEFHmJOSxxl6huox2+HZ9psAzlPkA+wAM6F1tjilSbd4CD8IUp5KsCGryG1XWj15GvME
 p3OQ==
X-Gm-Message-State: AOJu0Yzks79na9deRNZdiV0FmfQgL+Ca/6qbu7mCbp7htPnVQ90+TbIg
 m55UUx6kAXQl+QEpdQ75UIgUN9YZlV2OtnfaoX2akx2Ws4/Gh3BqjEcr/yeAi0a5qz809ykjXUL
 102nN/jc=
X-Gm-Gg: ASbGncuE/zQgkq+qINHixlIAQsQZBySl78ffkSLxjc39NkuX9QtJejXXk7s1gsAsIJT
 VZZzzsu7ry8D+/8jkmDBN+eRq+uRJ779QpB83UANUGpaBmm8Y9Ttciz+XocPEzI9cmOgd4fJ6x8
 Cgv+CzrPoqcG2rC2FfA3i586JnTA44vpRR/Agj3WQeHIKTAyRdGdSPPrDFQUfl2Qo3dm6BNWh88
 Ue88Pgi4xTd/NCNGe/WhCOhwX8naGFOTubMdkslUWQQ0Uj+nUznWRImLzbJCc4XAupoTv03UwMq
 KcF4Lnt2PAuKncjj/QDeWB/KdHpRFQ2WQZYazr/u36labFXGtkwUVp288MiEkeS1PL5j3jo4Lu5
 CnpO2HJAd8/RtHPS14r7Hrcf0w5QGhnUh6L0CarWlqZzBKgXp
X-Google-Smtp-Source: AGHT+IHRPbuYsge72ZBShmVxWzRoDvJl3Sj4Di6Hw0P/4dEqhQV95Hz0YisThCMYhOtAhfnqFC1q9A==
X-Received: by 2002:a05:6a00:180a:b0:74c:e253:6c83 with SMTP id
 d2e1a72fcca58-76034c50902mr8609537b3a.6.1753355051301; 
 Thu, 24 Jul 2025 04:04:11 -0700 (PDT)
Received: from sunil-pc.tail07344b.ts.net ([106.51.198.219])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-761add64fd1sm1430578b3a.13.2025.07.24.04.04.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jul 2025 04:04:10 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Andrew Jones <ajones@ventanamicro.com>, Anup Patel <anup@brainfault.org>,
 Atish Kumar Patra <atishp@rivosinc.com>,
 Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH v2 3/3] tests/data/acpi/riscv64: Update expected FADT and MADT
Date: Thu, 24 Jul 2025 16:33:50 +0530
Message-ID: <20250724110350.452828-4-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250724110350.452828-1-sunilvl@ventanamicro.com>
References: <20250724110350.452828-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pf1-x435.google.com
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

Update the expected tables for the version change.
 /*
  *
  * ACPI Data Table [FACP]
  *
  * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue (in hex)
  */

 [000h 0000 004h]                   Signature : "FACP"    [Fixed ACPI Description Table (FADT)]
 [004h 0004 004h]                Table Length : 00000114
 [008h 0008 001h]                    Revision : 06
-[009h 0009 001h]                    Checksum : 13
+[009h 0009 001h]                    Checksum : 12
 [00Ah 0010 006h]                      Oem ID : "BOCHS "
 [010h 0016 008h]                Oem Table ID : "BXPC    "
 [018h 0024 004h]                Oem Revision : 00000001
 [01Ch 0028 004h]             Asl Compiler ID : "BXPC"
 [020h 0032 004h]       Asl Compiler Revision : 00000001

 [024h 0036 004h]                FACS Address : 00000000
 [028h 0040 004h]                DSDT Address : 00000000
 [02Ch 0044 001h]                       Model : 00
 [02Dh 0045 001h]                  PM Profile : 00 [Unspecified]
 [02Eh 0046 002h]               SCI Interrupt : 0000
 [030h 0048 004h]            SMI Command Port : 00000000
 [034h 0052 001h]           ACPI Enable Value : 00
 [035h 0053 001h]          ACPI Disable Value : 00
 [036h 0054 001h]              S4BIOS Command : 00
 [037h 0055 001h]             P-State Control : 00
@@ -86,33 +86,33 @@
      Use APIC Physical Destination Mode (V4) : 0
                        Hardware Reduced (V5) : 1
                       Low Power S0 Idle (V5) : 0

 [074h 0116 00Ch]              Reset Register : [Generic Address Structure]
 [074h 0116 001h]                    Space ID : 00 [SystemMemory]
 [075h 0117 001h]                   Bit Width : 00
 [076h 0118 001h]                  Bit Offset : 00
 [077h 0119 001h]        Encoded Access Width : 00 [Undefined/Legacy]
 [078h 0120 008h]                     Address : 0000000000000000

 [080h 0128 001h]        Value to cause reset : 00
 [081h 0129 002h]   ARM Flags (decoded below) : 0000
                               PSCI Compliant : 0
                        Must use HVC for PSCI : 0

-[083h 0131 001h]         FADT Minor Revision : 05
+[083h 0131 001h]         FADT Minor Revision : 06
 [084h 0132 008h]                FACS Address : 0000000000000000
[...]

 /*
  *
  * ACPI Data Table [APIC]
  *
  * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue (in hex)
  */

 [000h 0000 004h]                   Signature : "APIC"    [Multiple APIC Description Table (MADT)]
 [004h 0004 004h]                Table Length : 00000074
-[008h 0008 001h]                    Revision : 06
-[009h 0009 001h]                    Checksum : B4
+[008h 0008 001h]                    Revision : 07
+[009h 0009 001h]                    Checksum : B3
 [00Ah 0010 006h]                      Oem ID : "BOCHS "
 [010h 0016 008h]                Oem Table ID : "BXPC    "
[...]

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/data/acpi/riscv64/virt/APIC           | Bin 116 -> 116 bytes
 tests/data/acpi/riscv64/virt/FACP           | Bin 276 -> 276 bytes
 tests/qtest/bios-tables-test-allowed-diff.h |   2 --
 3 files changed, 2 deletions(-)

diff --git a/tests/data/acpi/riscv64/virt/APIC b/tests/data/acpi/riscv64/virt/APIC
index 66a25dfd2d6ea2b607c024722b2eab95873a01e9..3fb5b753596fc7c2618b3d5210be8b00b0c177f6 100644
GIT binary patch
delta 16
XcmXRZ;c^V{bS`0FU|`=okt+)TB&q~M

delta 16
XcmXRZ;c^V{bS`0FU|`!akt+)TB&h^L

diff --git a/tests/data/acpi/riscv64/virt/FACP b/tests/data/acpi/riscv64/virt/FACP
index a5276b65ea8ce46cc9b40d96d98f0669c9089ed4..78e1b14b1d4ff0533a6a4c041f195a69b4ef114d 100644
GIT binary patch
delta 30
mcmbQjG=+)F&CxkPgpq-PO=u!lB_rF!iPaMgcqj8PasU8k76z;U

delta 30
mcmbQjG=+)F&CxkPgpq-PO?V<#B_r#^iPaMgcqj8PasU8k8wRWZ

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index 0c3f7a6cac..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,3 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/riscv64/virt/APIC",
-"tests/data/acpi/riscv64/virt/FACP",
-- 
2.43.0


