Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1689AC3DA59
	for <qemu-riscv@archiver.kernel.org>; Tue, 16 Jul 2024 14:45:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sTjPU-0006qz-Ky; Tue, 16 Jul 2024 10:44:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sTjPL-0006I1-5X
 for qemu-riscv@nongnu.org; Tue, 16 Jul 2024 10:44:01 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sTjPC-00033x-39
 for qemu-riscv@nongnu.org; Tue, 16 Jul 2024 10:43:58 -0400
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1fbcf71d543so37473575ad.1
 for <qemu-riscv@nongnu.org>; Tue, 16 Jul 2024 07:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1721141027; x=1721745827; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XZLIH3mFjpLuh9fKHfryw3QA5aXbXOhCFMCJ9YY9hgg=;
 b=idp78EcUKQWp+cbRIAhMAr2RW4MCkob5zWAJIOziqCSNgsqIpKtWZlwYUd2FQ5ZfnT
 5cjjHT0etB2taARyCHxDcZytbC63VYNfH/CPCIup6YvFbQTbJq8gt40siIwDduqErOoZ
 lM5hlOwdifHIqwFmP892f4TFwlfKtPqJIcIkH6RaEa2skWNG1OXRIzyqmXQqGywCNC98
 NSahX/3XR33RigBvEWNSyB5IGJB0KVA5G/LioyK8NQFkr/PZbVMYrAbuGHQgZ8SG1L69
 2Li1D7LkTWrrtIFZNnUsm6AdhlAjRFrH49H0/jFcAdSvjbf7YXQTTmhcUa2K3gTdSjyH
 yD7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721141027; x=1721745827;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XZLIH3mFjpLuh9fKHfryw3QA5aXbXOhCFMCJ9YY9hgg=;
 b=nd8SokcER3k9GcTCkzOt+zqi+x8QXiDtnTosb5b6Kfy6GTiYnrbnXI09kZ7pQ7QOwH
 TYw0TnD7SaQm56hwnzUrnMU2QXoNX1SU05UO9ZwtxB5G+rInqezNl/em4OUjlZ4Dl7EG
 hRL/f5BQCHD94LefbCAd6iTXVP9mrKnCSLZ5uU0bj94rHgiyc9bNMlYm/BDab7tSK8tU
 VTu7B0kTkZpJMowY/pOCXt8nDwA8pifFrTUt5eyFRsbTkhggGWY2oMVU4s8F/Ln8z2ri
 mF5QWhDYwDTQWGiQX3Zs72leMpTLiKiBSzxXEPmVJ0YsrdsJda+HIuxwARrhwdLF5Id/
 sxrQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDQ3RF/ysfMJZeY0K4qjcpHN3NGaNyl2YZ6hoTebqck6R69U+Vh9ieDmW43pYKtcnorGGcP+hFPIOIVSUPV/26ajeO220=
X-Gm-Message-State: AOJu0Yzf/IosPgyR9q9ck8pGERCkWVYGofY+xl6E8h0CJgfTf+/ipq9/
 iKr+iD/fJ6xgoR2cOJaMBs+4OkReLzPcbuH6Y6gwnFFX+hNYXgMJf7TQL3qmzJM=
X-Google-Smtp-Source: AGHT+IGHh3/j4T3/GOko12qfYsBadbAuRu8ubjVG6/dHkmyUqtA7bDvCY46kWlSUNvsttmN7nf7TRA==
X-Received: by 2002:a17:90b:690:b0:2c9:b72:7a1f with SMTP id
 98e67ed59e1d1-2cb36e266bdmr1646646a91.28.1721141026671; 
 Tue, 16 Jul 2024 07:43:46 -0700 (PDT)
Received: from sunil-pc.tail07344b.ts.net ([106.51.187.237])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2caf480d61bsm6084782a91.18.2024.07.16.07.43.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 07:43:46 -0700 (PDT)
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
Subject: [PATCH v4 7/9] tests/acpi: Add empty ACPI data files for RISC-V
Date: Tue, 16 Jul 2024 20:13:04 +0530
Message-ID: <20240716144306.2432257-8-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240716144306.2432257-1-sunilvl@ventanamicro.com>
References: <20240716144306.2432257-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pl1-x635.google.com
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

As per process documented (steps 1-3) in bios-tables-test.c, add empty
AML data files for RISC-V ACPI tables and add the entries in
bios-tables-test-allowed-diff.h.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 tests/data/acpi/riscv64/virt/APIC           | 0
 tests/data/acpi/riscv64/virt/DSDT           | 0
 tests/data/acpi/riscv64/virt/FACP           | 0
 tests/data/acpi/riscv64/virt/MCFG           | 0
 tests/data/acpi/riscv64/virt/RHCT           | 0
 tests/data/acpi/riscv64/virt/SPCR           | 0
 tests/qtest/bios-tables-test-allowed-diff.h | 6 ++++++
 7 files changed, 6 insertions(+)
 create mode 100644 tests/data/acpi/riscv64/virt/APIC
 create mode 100644 tests/data/acpi/riscv64/virt/DSDT
 create mode 100644 tests/data/acpi/riscv64/virt/FACP
 create mode 100644 tests/data/acpi/riscv64/virt/MCFG
 create mode 100644 tests/data/acpi/riscv64/virt/RHCT
 create mode 100644 tests/data/acpi/riscv64/virt/SPCR

diff --git a/tests/data/acpi/riscv64/virt/APIC b/tests/data/acpi/riscv64/virt/APIC
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/riscv64/virt/DSDT b/tests/data/acpi/riscv64/virt/DSDT
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/riscv64/virt/FACP b/tests/data/acpi/riscv64/virt/FACP
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/riscv64/virt/MCFG b/tests/data/acpi/riscv64/virt/MCFG
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/riscv64/virt/RHCT b/tests/data/acpi/riscv64/virt/RHCT
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/riscv64/virt/SPCR b/tests/data/acpi/riscv64/virt/SPCR
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..70474a097f 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,7 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/riscv64/virt/APIC",
+"tests/data/acpi/riscv64/virt/DSDT",
+"tests/data/acpi/riscv64/virt/FACP",
+"tests/data/acpi/riscv64/virt/MCFG",
+"tests/data/acpi/riscv64/virt/RHCT",
+"tests/data/acpi/riscv64/virt/SPCR",
-- 
2.43.0


