Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3E9BC6FA8F
	for <qemu-riscv@archiver.kernel.org>; Thu, 24 Aug 2023 14:31:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qZBMS-0000T7-0V; Thu, 24 Aug 2023 10:31:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qZBMP-0000Jx-OY
 for qemu-riscv@nongnu.org; Thu, 24 Aug 2023 10:30:58 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qZBMN-0000VN-9H
 for qemu-riscv@nongnu.org; Thu, 24 Aug 2023 10:30:57 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1c06f6f98c0so34012575ad.3
 for <qemu-riscv@nongnu.org>; Thu, 24 Aug 2023 07:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1692887454; x=1693492254;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FRVemjkPjFO3hpLzSZp5GGcD4+2dgkjh3m240rrX8qw=;
 b=UA6s65ncayWpScYFcr6yQQ7Sjojx/nd/gkH9WKCXibXPhORdIH38Cv9qtDDlv9g89i
 ZIaqAIzbhFeAuSg5OT3nfIjc8BgBcvRe7dau1hg1LGZfoOMmnEv04VUaHDf0Bz5Y9LCK
 RxnAG8XMMs3SH+gutTulSi7Fc01DUMq6u1O8zarQWMcKvqvBVHHGyh6rTgcFet2br9tf
 0GKR2jDAZPPUCHonH8NP+q2xVkUPXeLEKhmzK4i0aEJjS2MoZLWQ1dR5UOolqlXxPF4v
 vRfu8KAuRurkSNGbpWduw1dI7PU+2dNgXpk+dKwpORFXoFWUwGB4EzN4nALnEJuRVI/Z
 gZgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692887454; x=1693492254;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FRVemjkPjFO3hpLzSZp5GGcD4+2dgkjh3m240rrX8qw=;
 b=H+V5/tIFJYO4dg3LxTjncScXn1Y+pCmrhJnaI4MpurB/k3hKg6ZfqnB4kIw7rqrszy
 2vdwm4hv0snSbfj6zOzSR7GqeYq7BIJBcuDEu6NlLz2eQBVbE8URUQqWqwLTbmCa9tC6
 xCKUEfWResEEr07QIQOADaNhuefkGJs8+UrIks75u+6rme8pT0e0VZjPsOSNFfYdxIAx
 MKdkosZwtNZFgk1b0EpQbUexO8Kn8lhJyaMspw/4xkG6pvMKeH52TGfrppA3BnmCjnqk
 v8bvbmsKlpRkVSSQjbHKaPX5ICAQj3Psl8oR6Tw5uLEJkiEDMQqMKGdxUffPpagyzeVJ
 fpMA==
X-Gm-Message-State: AOJu0Yw+12H5IGyWX1NCAzPhc2grrRXqC8G8huFZMJlF2UZ21CZuqRFR
 FWOGh6xWhXkuHinbR5yuckn+iA==
X-Google-Smtp-Source: AGHT+IGZr9QQNaVU35M6rKxgRxuOEJH6Ob6T3gssGIf5Hiyj2zNQR8EamP+LE63jrYTQtvNROoWJkw==
X-Received: by 2002:a17:90a:c20d:b0:26d:5049:cf48 with SMTP id
 e13-20020a17090ac20d00b0026d5049cf48mr14204063pjt.40.1692887454035; 
 Thu, 24 Aug 2023 07:30:54 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.191.205])
 by smtp.gmail.com with ESMTPSA id
 n6-20020a17090a2bc600b00262fc3d911esm1666864pje.28.2023.08.24.07.30.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Aug 2023 07:30:50 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Shannon Zhao <shannon.zhaosl@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>, Haibo Xu <haibo1.xu@intel.com>,
 Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH v2 05/12] hw/riscv/virt-acpi-build.c: Add IMSIC in the MADT
Date: Thu, 24 Aug 2023 19:59:35 +0530
Message-Id: <20230824142942.3983650-6-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230824142942.3983650-1-sunilvl@ventanamicro.com>
References: <20230824142942.3983650-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pl1-x62d.google.com
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

Add IMSIC structure in MADT when IMSIC is configured.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 hw/riscv/virt-acpi-build.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
index 073c85f327..7f1a370e54 100644
--- a/hw/riscv/virt-acpi-build.c
+++ b/hw/riscv/virt-acpi-build.c
@@ -281,8 +281,20 @@ static void build_madt(GArray *table_data,
     uint8_t  guest_index_bits;
     uint32_t imsic_size;
     uint32_t local_cpu_id, socket_id;
+    uint8_t  hart_index_bits, group_index_bits, group_index_shift;
+    uint16_t imsic_max_hart_per_socket = 0;
+    uint8_t  socket;
+
+    for (socket = 0; socket < riscv_socket_count(ms); socket++) {
+        if (imsic_max_hart_per_socket < s->soc[socket].num_harts) {
+            imsic_max_hart_per_socket = s->soc[socket].num_harts;
+        }
+    }
 
     guest_index_bits = imsic_num_bits(s->aia_guests + 1);
+    hart_index_bits = imsic_num_bits(imsic_max_hart_per_socket);
+    group_index_bits = imsic_num_bits(riscv_socket_count(ms));
+    group_index_shift = IMSIC_MMIO_GROUP_MIN_SHIFT;
 
     AcpiTable table = { .sig = "APIC", .rev = 6, .oem_id = s->oem_id,
                         .oem_table_id = s->oem_table_id };
@@ -307,6 +319,28 @@ static void build_madt(GArray *table_data,
                                   s->aia_type, imsic_addr, imsic_size);
     }
 
+    /* IMSIC */
+    if (s->aia_type == VIRT_AIA_TYPE_APLIC_IMSIC) {
+        /* IMSIC */
+        build_append_int_noprefix(table_data, 0x19, 1);     /* Type */
+        build_append_int_noprefix(table_data, 16, 1);       /* Length */
+        build_append_int_noprefix(table_data, 1, 1);        /* Version */
+        build_append_int_noprefix(table_data, 0, 1);        /* Reserved */
+        build_append_int_noprefix(table_data, 0, 4);        /* Flags */
+        /* Number of supervisor mode Interrupt Identities */
+        build_append_int_noprefix(table_data, VIRT_IRQCHIP_NUM_MSIS, 2);
+        /* Number of guest mode Interrupt Identities */
+        build_append_int_noprefix(table_data, VIRT_IRQCHIP_NUM_MSIS, 2);
+        /* Guest Index Bits */
+        build_append_int_noprefix(table_data, guest_index_bits, 1);
+        /* Hart Index Bits */
+        build_append_int_noprefix(table_data, hart_index_bits, 1);
+        /* Group Index Bits */
+        build_append_int_noprefix(table_data, group_index_bits, 1);
+        /* Group Index Shift */
+        build_append_int_noprefix(table_data, group_index_shift, 1);
+    }
+
     acpi_table_end(linker, &table);
 }
 
-- 
2.39.2


