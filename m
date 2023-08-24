Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3214C6FA8F
	for <qemu-riscv@archiver.kernel.org>; Thu, 24 Aug 2023 14:33:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qZBNK-00022w-IC; Thu, 24 Aug 2023 10:31:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qZBN1-00012H-6L
 for qemu-riscv@nongnu.org; Thu, 24 Aug 2023 10:31:35 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qZBMx-0000t4-1L
 for qemu-riscv@nongnu.org; Thu, 24 Aug 2023 10:31:34 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-26f57f02442so2594501a91.0
 for <qemu-riscv@nongnu.org>; Thu, 24 Aug 2023 07:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1692887488; x=1693492288;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y0KZRC+bw+53iUGfc+8SQsc2BP7bSScpEVOJg2mRMtU=;
 b=Zx3/LxWZkq7ahDZdJg1dtBEknn2vwDtLN796yb8x/8LS2A7wkbm5y7VJgZC1J3+h+o
 I7KGFyizeLHvtP82NjQ+wnQqJwMKm61n0stuMqIdRJeeJwJfC7g0uGF1vyU4BRTWX4nP
 vnU1lMd3ITAEi4OwiVuz1hqkdBmRj7zL9YKQMu7pbA4EvO4bepUC92/TDUmxs9uhRkWu
 /91LlXMTZoZHqhhswJHcQEBm1QhoAtQBjPRwhfsaGZgFh/4JOQ04QCZnsgNjFNu0oO5B
 Rp/8xVLoYAATy9SHeV7mBjAN+FVvlyvxUPx0DqVP1/qQPMcjtq6ix/UKPXarxnFRj8jZ
 2COA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692887488; x=1693492288;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y0KZRC+bw+53iUGfc+8SQsc2BP7bSScpEVOJg2mRMtU=;
 b=Q2hk1lOR+3n7U7N1sNrltCXXkCjw9zSbfgw/e2PGlIxeLKFN6ZwENECP2ELMIm+MeS
 BIe/mYak/DiLZbExdvvKDM/14y7MA9avc/WIYRvCZm+j32JSyctomQP+gK76VJLQC/IV
 SMhuDULMccX0jpyvY6+57YQhCJs3+VnhepRVqUy+qCkXOEGw1giMCkpT55ladMEjwXRR
 MMTj+dcUoVLYnKH5BcRXPQNdKtQDUk9ashrComs61WIs+pOnrWEvtNKUZCnSAK1Gicnl
 KGqbbxO7Z5rYLODrXPpvDymwAaIUxAcp9BJ04N2jORSHJCdWP33/J0wW0qhdxtGQt992
 Y4RQ==
X-Gm-Message-State: AOJu0YwN5zf9HoN2YxghoZOrt8fyIhtNdLWEKr/Z91T0MWW8pn/FsIct
 Im3wVN/uaML50PL7VhnzWxcC4w==
X-Google-Smtp-Source: AGHT+IE7NJT8Rln09x0Gb0wns7eEgHNGl7K0vzKmzGbfDUaPBepRlw9Sc3D46HiUpdeuQF7/IGsOxw==
X-Received: by 2002:a17:90b:19c1:b0:26c:f9a5:4391 with SMTP id
 nm1-20020a17090b19c100b0026cf9a54391mr12436598pjb.26.1692887487884; 
 Thu, 24 Aug 2023 07:31:27 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.191.205])
 by smtp.gmail.com with ESMTPSA id
 n6-20020a17090a2bc600b00262fc3d911esm1666864pje.28.2023.08.24.07.31.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Aug 2023 07:31:25 -0700 (PDT)
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
Subject: [PATCH v2 08/12] hw/riscv/virt-acpi-build.c: Add MMU node in RHCT
Date: Thu, 24 Aug 2023 19:59:38 +0530
Message-Id: <20230824142942.3983650-9-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230824142942.3983650-1-sunilvl@ventanamicro.com>
References: <20230824142942.3983650-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pj1-x1033.google.com
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

MMU type information is available via MMU node in RHCT. Add this node in
RHCT.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 hw/riscv/virt-acpi-build.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
index 72c2a3e45f..40bd43efd0 100644
--- a/hw/riscv/virt-acpi-build.c
+++ b/hw/riscv/virt-acpi-build.c
@@ -159,6 +159,8 @@ static void build_rhct(GArray *table_data,
     size_t len, aligned_len;
     uint32_t isa_offset, num_rhct_nodes, cmo_offset = 0;
     RISCVCPU *cpu = &s->soc[0].harts[0];
+    uint32_t mmu_offset = 0;
+    uint8_t satp_mode_max;
     char *isa;
 
     AcpiTable table = { .sig = "RHCT", .rev = 1, .oem_id = s->oem_id,
@@ -178,6 +180,10 @@ static void build_rhct(GArray *table_data,
         num_rhct_nodes++;
     }
 
+    if (cpu->cfg.satp_mode.supported != 0) {
+        num_rhct_nodes++;
+    }
+
     /* Number of RHCT nodes*/
     build_append_int_noprefix(table_data, num_rhct_nodes, 4);
 
@@ -203,6 +209,26 @@ static void build_rhct(GArray *table_data,
         build_append_int_noprefix(table_data, 0x0, 1);   /* Optional Padding */
     }
 
+    /* MMU node structure */
+    if (cpu->cfg.satp_mode.supported != 0) {
+        satp_mode_max = satp_mode_max_from_map(cpu->cfg.satp_mode.map);
+        mmu_offset = table_data->len - table.table_offset;
+        build_append_int_noprefix(table_data, 1, 2);    /* Type */
+        build_append_int_noprefix(table_data, 8, 2);    /* Total Length */
+        build_append_int_noprefix(table_data, 0x1, 2);  /* Revision */
+        build_append_int_noprefix(table_data, 0, 1);    /* Reserved */
+        /* Virtual Address Scheme */
+        if (satp_mode_max == VM_1_10_SV57) {
+            build_append_int_noprefix(table_data, 2, 1);    /* Sv57 */
+        } else if (satp_mode_max == VM_1_10_SV48) {
+            build_append_int_noprefix(table_data, 1, 1);    /* Sv48 */
+        } else if (satp_mode_max == VM_1_10_SV39) {
+            build_append_int_noprefix(table_data, 0, 1);    /* Sv39 */
+        } else {
+            assert(1);
+        }
+    }
+
     /* CMO node */
     if (cpu->cfg.ext_icbom || cpu->cfg.ext_icboz) {
         cmo_offset = table_data->len - table.table_offset;
@@ -245,6 +271,11 @@ static void build_rhct(GArray *table_data,
             num_offsets++;
         }
 
+        if (mmu_offset) {
+            len += 4;
+            num_offsets++;
+        }
+
         build_append_int_noprefix(table_data, len, 2);
         build_append_int_noprefix(table_data, 0x1, 2); /* Revision */
         /* Number of offsets */
@@ -253,9 +284,14 @@ static void build_rhct(GArray *table_data,
 
         /* Offsets */
         build_append_int_noprefix(table_data, isa_offset, 4);
+
         if (cmo_offset) {
             build_append_int_noprefix(table_data, cmo_offset, 4);
         }
+
+        if (mmu_offset) {
+            build_append_int_noprefix(table_data, mmu_offset, 4);
+        }
     }
 
     acpi_table_end(linker, &table);
-- 
2.39.2


