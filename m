Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE4A9C83F26
	for <qemu-riscv@archiver.kernel.org>; Thu, 24 Jul 2025 11:06:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uetkY-0008KL-9v; Thu, 24 Jul 2025 07:04:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1uetk6-0007Vg-19
 for qemu-riscv@nongnu.org; Thu, 24 Jul 2025 07:04:06 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1uetk4-0000Z8-CW
 for qemu-riscv@nongnu.org; Thu, 24 Jul 2025 07:04:05 -0400
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-74b52bf417cso618995b3a.0
 for <qemu-riscv@nongnu.org>; Thu, 24 Jul 2025 04:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1753355042; x=1753959842; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=btFGmFwYqMh+p+kjij3lqKQ6Q1D4q7o1PxMUDNdZDnw=;
 b=V4cg4J5xO4L9WzkIktPVPIlQToO7J1xcrwHKC4oO3gNOHGcW+EbpHxf0Lai326gJ32
 9UW4xYHtivviDmhJbUZGbfQCKm0gEwRxJEMLrFRdUX6m2qGZ1tNXFsRTuOkWYExKqbcM
 mMlsVKsdXKVVeFU0LqgorurljElpwVcUs6QrHdD/Jz7a45Z/kIrQK6OB/xqeGU+Q7tmE
 XI2UZgKZzJ0Mvcdpvgm6o6D14X5unv516mudgl6dVIQ2t433jACHii6qYpOlRiadO5RM
 W/wO8QgQtkcr199P5cXthFZCVf8gxhHMs0TisrxQJIbuJPvvWFar+L3Lyw8dJOZhjdzq
 PkkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753355042; x=1753959842;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=btFGmFwYqMh+p+kjij3lqKQ6Q1D4q7o1PxMUDNdZDnw=;
 b=QnBLv8Pf7wT86fStV6Uy7DVqDUoyEMX3CkQrw8TS4mmgryn/8USnMMUZUOeeaMQM6z
 jcAqbmhRSjp3j17Ip/kDSOfuyx5i9gwShxZy1mNM+OwnTXukIGMIbopzaWTPEJmxc63L
 mbM6ZpE3DkvZFYr27urY5q+IvFvtnPvJj4gkeOWiL3dhiskC3JtkMViFcnOOZY9B/BU2
 3ELPNGxflxW6kcvmrIdKQ2pNzFEnhivY5FGZ35R/yYBKcZxQEkiyhiEnZH8xQI/WgrBy
 KAzxQyLuJ57JlhP2InqWTVI5USGXKAPdLkSv5Ab2S4zGCsYbk2ln1Jx3n1V097hGJUXI
 HGsw==
X-Gm-Message-State: AOJu0YyQVYpTIQ9AwbZf3dsIqSRMNh7Cav6vX5Dg8cbx8t9xMplL5h6Z
 Jhzjp8oRBgdRAFnBgu8d5R3u9d/67tnUhD608usyLO6S2zNA5KTiX465zJvQOsmbyjzRfHFspNd
 TqO1QtzM=
X-Gm-Gg: ASbGncu51TdGIg0pHvq+0du6aAZ6FjcncySotikqAmCr2OctmMm38OINjlxAHq/bnyY
 WoqVJcX0BZt5uauL92GBmI0ntMoBhykKcXuoXGb67UuMFpebEdGr3kZIzhPnT2LLEKWeK7tPdxi
 l0/KClVDG4ylLLIVc+xy4sUvPV0NRN/g7073CPe2AJiEuMzgIUoGXBrRjDjbqYtvgmorq/QqlZV
 Ve+hDRZ/dhZb5/aiP18DSOAP9lOVEAyAUoX8r0ZTSMwgV79OlAzWplVq3xz0dG1HF9mvxDRSKXo
 5B5JiinrPVRoRFdYBWh9qvcmkPPkZaHWxCu12OZeIitIjNfJduSFTbrzxzqBvZ3/r/00fL2JUJA
 mD0teHQPx0gSNW68r5M/hR4tPjh5cOrWMSxZRLIs+WYHrm7OC
X-Google-Smtp-Source: AGHT+IFLvEBq9Lje7ydNczcE+xnPtUf3vb4Abfgp684Md3miws5gwcqPVh+EWfxAuKxkNfOe0QGspg==
X-Received: by 2002:a05:6a00:22c9:b0:751:6771:f76 with SMTP id
 d2e1a72fcca58-76034cd52c4mr9139073b3a.12.1753355042421; 
 Thu, 24 Jul 2025 04:04:02 -0700 (PDT)
Received: from sunil-pc.tail07344b.ts.net ([106.51.198.219])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-761add64fd1sm1430578b3a.13.2025.07.24.04.03.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jul 2025 04:04:01 -0700 (PDT)
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
Subject: [PATCH v2 1/3] bios-tables-test-allowed-diff.h: Allow RISC-V FADT and
 MADT changes
Date: Thu, 24 Jul 2025 16:33:48 +0530
Message-ID: <20250724110350.452828-2-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250724110350.452828-1-sunilvl@ventanamicro.com>
References: <20250724110350.452828-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pf1-x42c.google.com
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

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..0c3f7a6cac 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,3 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/riscv64/virt/APIC",
+"tests/data/acpi/riscv64/virt/FACP",
-- 
2.43.0


