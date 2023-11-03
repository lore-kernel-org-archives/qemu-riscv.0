Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A3E8C4332F
	for <qemu-riscv@archiver.kernel.org>; Fri,  3 Nov 2023 03:20:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qykgt-0007xR-Uh; Thu, 02 Nov 2023 23:17:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qykgs-0007wf-FJ
 for qemu-riscv@nongnu.org; Thu, 02 Nov 2023 23:17:46 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qykgp-0003zU-Sw
 for qemu-riscv@nongnu.org; Thu, 02 Nov 2023 23:17:46 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-2809414efa9so1558661a91.1
 for <qemu-riscv@nongnu.org>; Thu, 02 Nov 2023 20:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698981462; x=1699586262; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KcgJ4FRc9yz2b5H8HRo0vnvqFidecDDHMaAJ2DLpido=;
 b=PhSgh4m3wLXExQJK7X/KmHoHefV8mYDB7w7eXk/8mufFUBYt5O9ELUnVtur7+wM5sT
 oM+GgN3jOZb2xZKkoqyFJiGMDRTbge5eFdr/HItVgRrHWeZQduUYe2qLBfwPXJJFZiZb
 XSW66CcLsfM+4sEQsAbHuN6tiUcimU2qWl2Jsnr+0BPlutQmjCjubBs6OTafX4mhk/hw
 HCRPV+rL19DzZnTngP9AoAlDeetjSR8YEzsk+aVwDgaw9clJBKYxmG29cO2cJ5e7FmN2
 4wYCv9r8o/3zismYK246yBAxPZtSBvuPjrtgCxtYR5i7r2t4tMU5DkfjouKsOVwoZYg8
 zZqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698981462; x=1699586262;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KcgJ4FRc9yz2b5H8HRo0vnvqFidecDDHMaAJ2DLpido=;
 b=cNZblY9cOJkxtwgWePcuNghB2sAuHaxXKN71ZP0CLvFZqERGFe7jPrDkyp1tZkbmue
 YdtwgCLpV97v5ci+B4YpOT4ftjj6otUxS67N1M2hfUXZ2XN21ZkDdLUquxHN3ASw6nQt
 kNaMtG2mQ8ptnrgLnawSzWnAwcnyNZ22lDGS2XyQnyo4KNftwXboz/sCjKSlORswpCjO
 dBlfw7aeU94XbSaqQkprnLCvPcdyZEzrQazMk17f6zpQFLT5V5wS9ZHqEpNDNSBfuhLv
 PrqvGvLtZJP2DIkgjnyNOo5lFJCG07McWmFNjMdDE5UK9Iw9FjA2O8BX1IcF4b7BN4IH
 txfg==
X-Gm-Message-State: AOJu0YwBCn1rmAYFJO+5uBdEL/06Ejd93nv9+1UXqUKMplINGPXmV9p1
 00BQ5oh7cFyqWYq9KR+Wgh4RMg==
X-Google-Smtp-Source: AGHT+IFqJ9SDqudq3JfSE0kcr1/ZL7WLg5HmrpLDwHJ5N/H/7TnfHafeSgIKF08dmivE1A27ykQNWw==
X-Received: by 2002:a17:90b:23c7:b0:280:1dca:f6a3 with SMTP id
 md7-20020a17090b23c700b002801dcaf6a3mr15187217pjb.43.1698981462660; 
 Thu, 02 Nov 2023 20:17:42 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.188.78])
 by smtp.gmail.com with ESMTPSA id
 y17-20020a17090aca9100b0027cf4c554dasm499971pjt.11.2023.11.02.20.17.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Nov 2023 20:17:42 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>, Haibo Xu <haibo1.xu@intel.com>,
 Sunil V L <sunilvl@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v7 07/13] hw/riscv/virt-acpi-build.c: Add APLIC in the MADT
Date: Fri,  3 Nov 2023 08:46:43 +0530
Message-Id: <20231103031649.2769834-8-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231103031649.2769834-1-sunilvl@ventanamicro.com>
References: <20231103031649.2769834-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Add APLIC structures for each socket in the MADT when system is configured
with APLIC as the external wired interrupt controller.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/riscv/virt-acpi-build.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
index 6bb21014fd..ec49c8804b 100644
--- a/hw/riscv/virt-acpi-build.c
+++ b/hw/riscv/virt-acpi-build.c
@@ -274,6 +274,8 @@ static void build_madt(GArray *table_data,
     uint8_t  guest_index_bits = imsic_num_bits(s->aia_guests + 1);
     uint16_t imsic_max_hart_per_socket = 0;
     uint8_t  hart_index_bits;
+    uint64_t aplic_addr;
+    uint32_t gsi_base;
     uint8_t  socket;
 
     for (socket = 0; socket < riscv_socket_count(ms); socket++) {
@@ -319,6 +321,38 @@ static void build_madt(GArray *table_data,
         build_append_int_noprefix(table_data, IMSIC_MMIO_GROUP_MIN_SHIFT, 1);
     }
 
+    if (s->aia_type != VIRT_AIA_TYPE_NONE) {
+        /* APLICs */
+        for (socket = 0; socket < riscv_socket_count(ms); socket++) {
+            aplic_addr = s->memmap[VIRT_APLIC_S].base +
+                             s->memmap[VIRT_APLIC_S].size * socket;
+            gsi_base = VIRT_IRQCHIP_NUM_SOURCES * socket;
+            build_append_int_noprefix(table_data, 0x1A, 1);    /* Type */
+            build_append_int_noprefix(table_data, 36, 1);      /* Length */
+            build_append_int_noprefix(table_data, 1, 1);       /* Version */
+            build_append_int_noprefix(table_data, socket, 1);  /* APLIC ID */
+            build_append_int_noprefix(table_data, 0, 4);       /* Flags */
+            build_append_int_noprefix(table_data, 0, 8);       /* Hardware ID */
+            /* Number of IDCs */
+            if (s->aia_type == VIRT_AIA_TYPE_APLIC) {
+                build_append_int_noprefix(table_data,
+                                          s->soc[socket].num_harts,
+                                          2);
+            } else {
+                build_append_int_noprefix(table_data, 0, 2);
+            }
+            /* Total External Interrupt Sources Supported */
+            build_append_int_noprefix(table_data, VIRT_IRQCHIP_NUM_SOURCES, 2);
+            /* Global System Interrupt Base */
+            build_append_int_noprefix(table_data, gsi_base, 4);
+            /* APLIC Address */
+            build_append_int_noprefix(table_data, aplic_addr, 8);
+            /* APLIC size */
+            build_append_int_noprefix(table_data,
+                                      s->memmap[VIRT_APLIC_S].size, 4);
+        }
+    }
+
     acpi_table_end(linker, &table);
 }
 
-- 
2.39.2


