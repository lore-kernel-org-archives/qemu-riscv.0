Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C42EC3ABAC
	for <qemu-riscv@archiver.kernel.org>; Tue, 29 Apr 2025 13:01:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u9kXr-0002Uq-On; Tue, 29 Apr 2025 08:58:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1u9kXk-0002Sn-9a
 for qemu-riscv@nongnu.org; Tue, 29 Apr 2025 08:58:36 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1u9kXi-0000AJ-Hl
 for qemu-riscv@nongnu.org; Tue, 29 Apr 2025 08:58:36 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-22438c356c8so64699485ad.1
 for <qemu-riscv@nongnu.org>; Tue, 29 Apr 2025 05:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1745931513; x=1746536313; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BrXJgTd/+PWDNXelt13M1UFWn8uze3FGZwtv/Kgf7wI=;
 b=NIkm96u1ESCJfhhGBytYBbc6ommA/PYFHffHV7dn71PeECy4VUI1uer4U4/Ue4CPG9
 Hcd+l8iTwZlJGw8L8P1OfDdRT0/TcbOIKAkDJgyqSR1jkUBJGYfrDGlhO3q8zoxWCVqE
 ba2MGfgGsxdchrDyGIC59SQRD4ORsMBfEA5w28ngVxP5HmpcpyToguhZIKGjno7Kpaux
 3OsQ5wEjbp9SiNYNmN4P2LabCCcdMunNJnScx2ZpwdagEMqk4sQzZ8r4xvWt5DdkaUXr
 tQ22HaACXp8nXJSLqBYrHf6U+io29cNKIP1CbFqzqI5Q05JgAwGtfZI8H1zzxZt3DBkS
 VUYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745931513; x=1746536313;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BrXJgTd/+PWDNXelt13M1UFWn8uze3FGZwtv/Kgf7wI=;
 b=OZ56RoafyTMKzW+dcGyWUAZNPNWApdWhKwPj/6Pb26ky1PrvqlUg+9sBt4XUHVAwE2
 dKVTyJfYHZbjXOQVY0eUjqbjQEe7T52QE0fz6tlDOsvjwoaYxo5H8IhgcPqkvZDc583W
 WsmNCBZAG8NUPR2e0jM6YOs/RgOenhhLYuBnR8pgpdX1Gg1o1zLXNiPox4SaotLflm65
 9zai7sp3L8c93yMWuAYxc43cPxaBX3wyl6J3kS5W1FSW9dyq2EwoV3iK0snmw5C7ax+K
 VAHW/e0GMh8hzibafYnxzX/VALxMhRMGavHBKP3B2DMBhMcQg3ZVUOpVjTIcwXQixe9X
 IWEg==
X-Gm-Message-State: AOJu0YzgBlm31UEBnNor5AQh/d/8FZY9/sz+K+EE1Zx6HOyxqSpjafwc
 R2v3Ei+kpVWrijpLLyYAAc3efgWLrmMRdAeDzJctNVjoEZX8tmUsIKp4sjd1X+U=
X-Gm-Gg: ASbGncsJNGFTYDbDUiIRRKN4kjDJY/PHidjvbn6o47nhvcQNk+xefMDRo3trEXVaY09
 YUYhZNKv8zLgqnDm7F9iBYsmfwtrrRlP54Wgguz1t/20cjF4s1QuY7ikBD65DQTwdXWbXifhRVq
 J67GRrw6Gg0E4g8vD9HxcdW29KnRje3vw4Swn7tf7pa6GdVZhpvXAs021WnZYTZDY//j636DNzn
 xSuJIfL5VqBXgJAF+hKFssoHXLJqwK4S93fWp20TzBiLyWGxZz82ZCBbiHo2zd8Qy+UP0XDUBSk
 h+QxV0ffa8PCTO2b5QYJtru0imD2BSdlNqkSkYxkh/Q=
X-Google-Smtp-Source: AGHT+IG2o9oZQi4faXCTJ7bj7cvNjPnx0+6x+PgMtrYfbmTSNPpuPKdkkwhwkKGItKzLYti/4xZ2Iw==
X-Received: by 2002:a17:902:cf10:b0:22d:e57a:27b9 with SMTP id
 d9443c01a7336-22de5fd252bmr58404925ad.22.1745931512766; 
 Tue, 29 Apr 2025 05:58:32 -0700 (PDT)
Received: from grind.. ([152.234.125.33]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b15f7fb7e54sm8889440a12.30.2025.04.29.05.58.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Apr 2025 05:58:32 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com, joel@jms.id.au,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 5/9] hw/riscv/virt.c: use s->memmap in create_fdt() path
Date: Tue, 29 Apr 2025 09:58:07 -0300
Message-ID: <20250429125811.224803-6-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250429125811.224803-1-dbarboza@ventanamicro.com>
References: <20250429125811.224803-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x62f.google.com
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

create_fdt(), create_fdt_flash() and create_fdt_fw_cfg() can access the
memmap via their RISCVVirtState pointers.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 hw/riscv/virt.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 37f8abdd1c..5f31c95955 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -995,7 +995,7 @@ static void create_fdt_rtc(RISCVVirtState *s, const MemMapEntry *memmap,
     }
 }
 
-static void create_fdt_flash(RISCVVirtState *s, const MemMapEntry *memmap)
+static void create_fdt_flash(RISCVVirtState *s)
 {
     MachineState *ms = MACHINE(s);
     hwaddr flashsize = s->memmap[VIRT_FLASH].size / 2;
@@ -1010,11 +1010,11 @@ static void create_fdt_flash(RISCVVirtState *s, const MemMapEntry *memmap)
     qemu_fdt_setprop_cell(ms->fdt, name, "bank-width", 4);
 }
 
-static void create_fdt_fw_cfg(RISCVVirtState *s, const MemMapEntry *memmap)
+static void create_fdt_fw_cfg(RISCVVirtState *s)
 {
     MachineState *ms = MACHINE(s);
-    hwaddr base = memmap[VIRT_FW_CFG].base;
-    hwaddr size = memmap[VIRT_FW_CFG].size;
+    hwaddr base = s->memmap[VIRT_FW_CFG].base;
+    hwaddr size = s->memmap[VIRT_FW_CFG].size;
     g_autofree char *nodename = g_strdup_printf("/fw-cfg@%" PRIx64, base);
 
     qemu_fdt_add_subnode(ms->fdt, nodename);
@@ -1145,7 +1145,7 @@ static void finalize_fdt(RISCVVirtState *s)
     create_fdt_rtc(s, s->memmap, irq_mmio_phandle);
 }
 
-static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap)
+static void create_fdt(RISCVVirtState *s)
 {
     MachineState *ms = MACHINE(s);
     uint8_t rng_seed[32];
@@ -1172,7 +1172,8 @@ static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap)
      * The "/soc/pci@..." node is needed for PCIE hotplugs
      * that might happen before finalize_fdt().
      */
-    name = g_strdup_printf("/soc/pci@%lx", (long) memmap[VIRT_PCIE_ECAM].base);
+    name = g_strdup_printf("/soc/pci@%lx",
+                           (long) s->memmap[VIRT_PCIE_ECAM].base);
     qemu_fdt_add_subnode(ms->fdt, name);
 
     qemu_fdt_add_subnode(ms->fdt, "/chosen");
@@ -1184,8 +1185,8 @@ static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap)
 
     qemu_fdt_add_subnode(ms->fdt, "/aliases");
 
-    create_fdt_flash(s, memmap);
-    create_fdt_fw_cfg(s, memmap);
+    create_fdt_flash(s);
+    create_fdt_fw_cfg(s);
     create_fdt_pmu(s);
 }
 
@@ -1719,7 +1720,7 @@ static void virt_machine_init(MachineState *machine)
             exit(1);
         }
     } else {
-        create_fdt(s, s->memmap);
+        create_fdt(s);
     }
 
     if (virt_is_iommu_sys_enabled(s)) {
-- 
2.49.0


