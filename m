Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23412C07545
	for <qemu-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 20:09:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qvkAk-0007bz-VC; Wed, 25 Oct 2023 16:08:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qvkAi-0007WY-Vr
 for qemu-riscv@nongnu.org; Wed, 25 Oct 2023 16:08:09 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qvkAh-0003VG-2A
 for qemu-riscv@nongnu.org; Wed, 25 Oct 2023 16:08:08 -0400
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-6b36e1fcee9so112665b3a.3
 for <qemu-riscv@nongnu.org>; Wed, 25 Oct 2023 13:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698264486; x=1698869286; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O6IAf6+/HERuXVB+FMyQAmQG1ZucRS16VlyBmkfaEHk=;
 b=aUu+hBjsV/4hsfGflkWtorz+zx4gNFTU8NC30f9l+u0ToI8vhrtIRDNpMdmPw1apdv
 yqA6XWvVjAZLwS1zCzpktd9PjUdGmYr+13g2V+7xUeO7m035gY5prpj8EtvVZTLLJ2sR
 hdGlh8Cig5IH41iapdxMi0rXsnOfdhWR/Xv66qjuVBZmNBzQnGCinhkxnKbgP+gIjRA+
 5d6jH4kmAhwjXHOKOp6UG84aBwiepZiXr07AZDT1w03mgrVfPNh9CJSafKk/KtuM0Ztq
 BPGMDfzNddQiyy8o//q085HoL0gY7hxGBtVTUhToV4kce1ZSz41SgIsAVnPKDaa89qYm
 eYrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698264486; x=1698869286;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O6IAf6+/HERuXVB+FMyQAmQG1ZucRS16VlyBmkfaEHk=;
 b=A7pik7CjuZFf/5PZfrhNiRBo0cnbzPFzIq1OrfIRQr3AcI93yYgHIPuyko0qy0gpc2
 csYYMH2duD5W+4UjhDRQjiqfotv6xnQGfQnPF451/gc9QmwSIQUKDuTloBg7SHMFwQfQ
 wUcxhZKe9jh3187igj4RYiSfccgQhEuqGAF4hxZhAptBXeHhLNTe8Kx1XMgv0H+0zFpy
 lHwp435wYWcGC6pANjgBAtU07j9siJgt5NASYwyM3MYTm0DOa6/Q3RdLWh3HrOsRSEF6
 FDV2/525t/J4b13qAYgNpCfQTOUgAfXvwb7BqZ6MBj2x8ky/kNJWvSTPXeodeDqZlOPT
 z+Cg==
X-Gm-Message-State: AOJu0Yy+G1EY4oe1j/HzfG5qiH/HcjCb0mKDsSmadhB5pf4zhETidLCU
 PtoH7VC86frJh0cZplZEPeDAMA==
X-Google-Smtp-Source: AGHT+IFDGk19g29Kx9uqKLjf6KTJXcCwnIWoX8lCbmWscA3Nz0HPuY414ALzRaqii1Kfmx9xHaoTKA==
X-Received: by 2002:a05:6a20:a108:b0:13d:df16:cf29 with SMTP id
 q8-20020a056a20a10800b0013ddf16cf29mr7055792pzk.15.1698264485882; 
 Wed, 25 Oct 2023 13:08:05 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.188.78])
 by smtp.gmail.com with ESMTPSA id
 f1-20020aa79681000000b0068fe7c4148fsm9696768pfk.57.2023.10.25.13.07.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Oct 2023 13:08:05 -0700 (PDT)
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
Subject: [PATCH v4 07/13] hw/riscv/virt-acpi-build.c: Add APLIC in the MADT
Date: Thu, 26 Oct 2023 01:37:07 +0530
Message-Id: <20231025200713.580814-8-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231025200713.580814-1-sunilvl@ventanamicro.com>
References: <20231025200713.580814-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pf1-x435.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
---
 hw/riscv/virt-acpi-build.c | 36 ++++++++++++++++++++++++++++++++++--
 1 file changed, 34 insertions(+), 2 deletions(-)

diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
index 7f1a370e54..8fa358d034 100644
--- a/hw/riscv/virt-acpi-build.c
+++ b/hw/riscv/virt-acpi-build.c
@@ -277,9 +277,9 @@ static void build_madt(GArray *table_data,
     MachineClass *mc = MACHINE_GET_CLASS(s);
     MachineState *ms = MACHINE(s);
     const CPUArchIdList *arch_ids = mc->possible_cpu_arch_ids(ms);
-    uint64_t imsic_socket_addr, imsic_addr;
+    uint64_t imsic_socket_addr, imsic_addr, aplic_addr;
+    uint32_t imsic_size, gsi_base;
     uint8_t  guest_index_bits;
-    uint32_t imsic_size;
     uint32_t local_cpu_id, socket_id;
     uint8_t  hart_index_bits, group_index_bits, group_index_shift;
     uint16_t imsic_max_hart_per_socket = 0;
@@ -341,6 +341,38 @@ static void build_madt(GArray *table_data,
         build_append_int_noprefix(table_data, group_index_shift, 1);
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


