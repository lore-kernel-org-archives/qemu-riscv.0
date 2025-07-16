Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AD2DC83F1B
	for <qemu-riscv@archiver.kernel.org>; Wed, 16 Jul 2025 15:01:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uc3cC-0001Ap-7T; Wed, 16 Jul 2025 11:00:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1uc3Kl-0000Ym-Hp
 for qemu-riscv@nongnu.org; Wed, 16 Jul 2025 10:42:12 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1uc3Kf-0004Dk-K3
 for qemu-riscv@nongnu.org; Wed, 16 Jul 2025 10:42:10 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-3122368d7cfso5443838a91.1
 for <qemu-riscv@nongnu.org>; Wed, 16 Jul 2025 07:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1752676922; x=1753281722; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Vz3saWPCz9YpVOLE1qri2VksOOuVVz8IXUSKPWtWCnE=;
 b=L47A52k5ICkn5PesKHrSryfoe0FdX2Zrk3IM47kjuixSuHOuy719MLtRz4/NKBNUJd
 YJHnjHhY8hesiONWfh5sN11ZVisU5fCVj9wa9OqMrtNmUr/qeZK7YdpY6StjaNE2dg35
 yPYtKBtSJDSIJ/iKXaDAl2kZfnkRcpE7xnH/+bkmyK/1B7O7nTAFzjMxp8ALUMDG+Sh9
 2rec07vogM9I8D9eqvaG53FVaaG89S63y00qPbucTXEVemtQERmrSdaWOSMFftKr1oaK
 GnfGn/bWa0m8miu7WddgCWu2TlLm4zXMHIsQTpWocc3zq0JUreNHfwKrxv1eqeukG4Vk
 ErUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752676922; x=1753281722;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Vz3saWPCz9YpVOLE1qri2VksOOuVVz8IXUSKPWtWCnE=;
 b=nbR1H0t5fa/5oOBmak+03CNbSmha9dr+GMR1rwI7Ze4uGO202vRV8EdiIa2j3k71Ss
 vjoP/8UQb+sMbdXQoiUEbmiQbSl412IZy5LxHAMmBgMZ7xLD7iwgZKINlyPZ+1n77wyP
 8lzamWS074HbkxVh0raOYFzkeZc+mqmEoVjBULlSzX8Dz5V3RvcUEiik7fasghaNsqsW
 xTk/xwKDs50wXlsGBoI0LItdbG40NNgpC0FA/a/xTjEN1ltXm+lITYWj7zUeBIgxisAA
 kh5ALMhXJ5Zyll6JlRlJNA0EWN27RZUb+fk4m5R7uPj6u9kfFS7UzzqBtpmzkdQ09txr
 mvtQ==
X-Gm-Message-State: AOJu0YwDfUoqFzEkH1NsM3MJZg+DvzLZM4wbXmxCSL4ypfL//nav82Pi
 FcJb3D3ERqnwmnU6qQUFq1UYDji1kxnpQtF3Lipqf4ZtyRi632XAHrGA1fqrQexIYLMxzV1/WzH
 VXWxiIgE=
X-Gm-Gg: ASbGncu2ihBEPwn0qnpygZYE7bjDjgEBxdRE8SgLEhcAaTI5NihlsEmXUdd07/ANLKB
 aB6fd7p9mGAEcYb5biw6W/THegCkSQhoVlNay7y7c5jldWEr4xsJO5vcIWylB7aEcOMYlq5y1tf
 NRYu1QJ5pNPT7gU8/vpYeAQP5buChg4v1APwe6eZV1Nq0ZAzEAb4L7wDZ7Vix35r9OPdRPf3MFy
 hm7r+z+nvmf7+3rEXZNg/p9fJJsfphX3J+KoTSB8R6L68RBF53uOFXyVNUpZwFZfROPCDUJN9r5
 JVfjCaiFPBBWwnfT0DNuTTN7AOa6AE/uBCICXfgZxNxtkN8A+4iehyuZ9Iu99xUqvGF1tCJzMVC
 /el6MFPOZIrx4CVUYaDpAYxsbWm8LKDK4
X-Google-Smtp-Source: AGHT+IHBVEmWmZN12RbtGvnNAql4xHYnTz8kDSoTlH35bkFz3l/0gjZi9HtYMRsS59eBio7+mM9mrQ==
X-Received: by 2002:a17:90b:2d85:b0:313:287e:f1e8 with SMTP id
 98e67ed59e1d1-31c9e6eedb3mr5595695a91.8.1752676922108; 
 Wed, 16 Jul 2025 07:42:02 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.195.230])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31c9f2879fcsm1622950a91.28.2025.07.16.07.41.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jul 2025 07:42:01 -0700 (PDT)
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
Subject: [PATCH 3/3] tests/data/acpi/riscv64: Update expected FADT and MADT
Date: Wed, 16 Jul 2025 20:11:40 +0530
Message-ID: <20250716144140.3954431-4-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250716144140.3954431-1-sunilvl@ventanamicro.com>
References: <20250716144140.3954431-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pj1-x1031.google.com
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


