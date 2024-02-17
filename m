Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDF88C48BC3
	for <qemu-riscv@archiver.kernel.org>; Sat, 17 Feb 2024 19:27:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rbQKS-0001lO-8j; Sat, 17 Feb 2024 14:26:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rbQKR-0001l2-9O
 for qemu-riscv@nongnu.org; Sat, 17 Feb 2024 14:26:27 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rbQKP-0004Nk-RG
 for qemu-riscv@nongnu.org; Sat, 17 Feb 2024 14:26:27 -0500
Received: by mail-pg1-x536.google.com with SMTP id
 41be03b00d2f7-5cdf76cde78so2580739a12.1
 for <qemu-riscv@nongnu.org>; Sat, 17 Feb 2024 11:26:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1708197984; x=1708802784; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O+D1+0YQa8IFtBkx/EjqXOpu3pS63aF1bu256H6yh6U=;
 b=kUjYl57JamiobgCVzgZLaSOFCdydS69iIj0zHZpCrYAvG1q3pRLTK2LMznA2u7kzXS
 tamrFVZvMmHjBmBKdj//uXItVWJj8MUEznmfU2MSnKfXgfzahL0WSZ5qDosdvbQ31RI1
 xePtE/M60CL4QsuFY1LyG4gN6ZdgIztlpgCtRW1bIxFdkYno7CMzv47H2hLnweEqneMg
 kIdn39XumaFDkF9E9jTmQg/BnUiS/XNuudW2VT0QP2wSVbLbDS9SAN2Ya2JRbtUYgrdo
 QMpcdZmVhLEZBUpDiRopXlAB3sx2qF6QFK4siUu1PI06vbjzDZJt0jOf/0wg6gB3d/Pw
 eHHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708197984; x=1708802784;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O+D1+0YQa8IFtBkx/EjqXOpu3pS63aF1bu256H6yh6U=;
 b=w+nERn1XDTTzWssrsTXvLblovE+Tf5WPkD8kIfnTGqCSm7VHDgXaeWzHmAuiVKGFNw
 Ae6sjj7Cf0F/aJNzUk2UP6jz3msHFchYQjrfYrHN9adwL0HmHAHvhLWqw46ALkbl1LrY
 HGyYiNsHbUrtdCPuO71HRuIgEOuDsJ3J8BLAdykjT3bvM1qX+AMWj5WAXxFJDLSlqHh7
 D/80HYqii4LfSwGGT9FEWtX4287Adk688paIhu8AxYfUTj1V3aQtC2JFsk+QT1hgXBzE
 PazlUsfb3fdgHANlNU+oArY6EuYetBEzFQHse9WrYfi2x7KOwZn9/+w+wrp4EtJhM6IL
 mx3Q==
X-Gm-Message-State: AOJu0Yxzb8FeTWSq8EXA/VJC58aVn3Hq3jWE42CIljFzRjvSRkMSTnSc
 XJH1tMpAHiGBdmd+rHaVUCfb6FRP4rHHKEBSUxl3lyFTvnEXTyTkEPvVItmzFyk=
X-Google-Smtp-Source: AGHT+IEkzhMqMSd5Js0N5VOzJAprD52NUKG+H3naaK3yOseG2PDfeG5YEoFITSF3Ay2KU6GPiPgB4Q==
X-Received: by 2002:a05:6a21:3a47:b0:19e:4f38:d8b8 with SMTP id
 zu7-20020a056a213a4700b0019e4f38d8b8mr9590905pzb.49.1708197984428; 
 Sat, 17 Feb 2024 11:26:24 -0800 (PST)
Received: from grind.. ([177.94.15.159]) by smtp.gmail.com with ESMTPSA id
 p3-20020a170902c70300b001db86c48221sm1770927plp.22.2024.02.17.11.26.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Feb 2024 11:26:24 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 thuth@redhat.com, lvivier@redhat.com, pbonzini@redhat.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 3/6] hw/riscv/virt.c: create '/soc/pci@...' fdt node earlier
Date: Sat, 17 Feb 2024 16:26:04 -0300
Message-ID: <20240217192607.32565-4-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240217192607.32565-1-dbarboza@ventanamicro.com>
References: <20240217192607.32565-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pg1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Hotplugged FDT nodes will attempt to write this node that, at this
moment, is being created only in create_fdt_pcie() during
finalize_fdt().

Create it earlier.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/virt.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index fd35c74781..b540f4d3da 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -826,7 +826,6 @@ static void create_fdt_pcie(RISCVVirtState *s, const MemMapEntry *memmap,
 
     name = g_strdup_printf("/soc/pci@%lx",
         (long) memmap[VIRT_PCIE_ECAM].base);
-    qemu_fdt_add_subnode(ms->fdt, name);
     qemu_fdt_setprop_cell(ms->fdt, name, "#address-cells",
         FDT_PCI_ADDR_CELLS);
     qemu_fdt_setprop_cell(ms->fdt, name, "#interrupt-cells",
@@ -996,6 +995,7 @@ static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap)
 {
     MachineState *ms = MACHINE(s);
     uint8_t rng_seed[32];
+    g_autofree char *name = NULL;
 
     ms->fdt = create_device_tree(&s->fdt_size);
     if (!ms->fdt) {
@@ -1014,6 +1014,13 @@ static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap)
     qemu_fdt_setprop_cell(ms->fdt, "/soc", "#size-cells", 0x2);
     qemu_fdt_setprop_cell(ms->fdt, "/soc", "#address-cells", 0x2);
 
+    /*
+     * The "/soc/pci@..." node is needed for PCIE hotplugs
+     * that might happen before finalize_fdt().
+     */
+    name = g_strdup_printf("/soc/pci@%lx", (long) memmap[VIRT_PCIE_ECAM].base);
+    qemu_fdt_add_subnode(ms->fdt, name);
+
     qemu_fdt_add_subnode(ms->fdt, "/chosen");
 
     /* Pass seed to RNG */
-- 
2.43.2


