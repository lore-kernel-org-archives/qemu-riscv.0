Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42283C4332F
	for <qemu-riscv@archiver.kernel.org>; Tue, 31 Oct 2023 20:41:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qxvWS-0005EX-N1; Tue, 31 Oct 2023 16:39:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qxvWR-0005Dd-63
 for qemu-riscv@nongnu.org; Tue, 31 Oct 2023 16:39:35 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qxvWP-0007QS-Ey
 for qemu-riscv@nongnu.org; Tue, 31 Oct 2023 16:39:34 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-5a87ac9d245so61369757b3.3
 for <qemu-riscv@nongnu.org>; Tue, 31 Oct 2023 13:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698784772; x=1699389572; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pj6Sf0oCIgrOIURXTUZG16UFFzoeAczNIZwvPhTmCis=;
 b=bBni1CgwxzLBZKcSZvsBckM4NBSPhBDmeWflcpyjEP4vGgdrN3RvIavdldOkiBZJFu
 lt3y/HV/6C746+kz+539ChwGueK2ReJwzeYH7NQMa+pAmJbTsG8gNCr1bYBEimg8+6Vd
 Ikoh9xLO6wYkpVEvaw3L4t4r//vHYyruZFMm7doJNzFOr8R3oiSYMVe8dkSozmGW29Xz
 KweM5CPrIo0mf3iQ6eq2qIiMqCQZEgzoUbkyy9j76JmqqhCrNAwgoxd9luWoGg+PezNT
 WNv67os+h4DeUX0heKcSls0zBhS9KD3T2SyC4srU/FG/BPZ3kjOGrCtFcfVYz70pdvLw
 LdsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698784772; x=1699389572;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pj6Sf0oCIgrOIURXTUZG16UFFzoeAczNIZwvPhTmCis=;
 b=hXL/i/41BIZFb9yqXCtpXiPtq9MBvGlGSleW+h27fnO438ABElseZeHcA9ToHV0bKl
 uOic177ZQgZeCBwthvWX4zi4eMFwyBqOfTIQdp6l21hNxGWc9dA5YV3cJub52nyP/n0K
 2aqc9+7SKsSmVjUKU5dMrndIoLfeoblU83/GMUS8yF6319SxTCPcCFnZNiSFwxZ3N/pB
 TXAdSD/SfOYpSRQO3gcDDhTf+p+H2MQjjX+7Qnw8467kSTwJ9do7i4pf6ssp4JhpRyKh
 wGq7GpYrzawHS6vEGiKyoCveC/VlNMqctIlmUuD21VXkRF8AwqGJvUZoXAp1bkwIl3Ib
 jJyA==
X-Gm-Message-State: AOJu0YyRC9k+qNl3/u0V9FlLbbwlHsSWUL2fquEKMZV+astVmKH4gq6O
 ePp9ILru2LiBQXqdNveDLkzBug==
X-Google-Smtp-Source: AGHT+IEMHYgjdK/f5uVKQ8yKb5iXNIb+vQ0cG3T8FG+I3U40Jyyk+7o9OSrUfL/83WqinDCfbBHMPQ==
X-Received: by 2002:a0d:ec0d:0:b0:59f:b0d9:5df2 with SMTP id
 q13-20020a0dec0d000000b0059fb0d95df2mr12310760ywn.0.1698784772502; 
 Tue, 31 Oct 2023 13:39:32 -0700 (PDT)
Received: from grind.. ([179.193.10.161]) by smtp.gmail.com with ESMTPSA id
 k1-20020a81ff01000000b005add997ae53sm1272802ywn.81.2023.10.31.13.39.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Oct 2023 13:39:32 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v7 04/16] target/riscv: add zicbop extension flag
Date: Tue, 31 Oct 2023 17:39:04 -0300
Message-ID: <20231031203916.197332-5-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231031203916.197332-1-dbarboza@ventanamicro.com>
References: <20231031203916.197332-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-yw1-x112b.google.com
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

QEMU already implements zicbom (Cache Block Management Operations) and
zicboz (Cache Block Zero Operations). Commit 59cb29d6a5 ("target/riscv:
add Zicbop cbo.prefetch{i, r, m} placeholder") added placeholders for
what would be the instructions for zicbop (Cache Block Prefetch
Operations), which are now no-ops.

The RVA22U64 profile mandates zicbop, which means that applications that
run with this profile might expect zicbop to be present in the riscv,isa
DT and might behave badly if it's absent.

Adding zicbop as an extension will make our future RVA22U64
implementation more in line with what userspace expects and, if/when
cache block prefetch operations became relevant to QEMU, we already have
the extension flag to turn then on/off as needed.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 hw/riscv/virt.c        | 5 +++++
 target/riscv/cpu.c     | 3 +++
 target/riscv/cpu_cfg.h | 2 ++
 3 files changed, 10 insertions(+)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 1732c42915..99c087240f 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -273,6 +273,11 @@ static void create_fdt_socket_cpus(RISCVVirtState *s, int socket,
                                   cpu_ptr->cfg.cboz_blocksize);
         }
 
+        if (cpu_ptr->cfg.ext_zicbop) {
+            qemu_fdt_setprop_cell(ms->fdt, cpu_name, "riscv,cbop-block-size",
+                                  cpu_ptr->cfg.cbop_blocksize);
+        }
+
         qemu_fdt_setprop_string(ms->fdt, cpu_name, "compatible", "riscv");
         qemu_fdt_setprop_string(ms->fdt, cpu_name, "status", "okay");
         qemu_fdt_setprop_cell(ms->fdt, cpu_name, "reg",
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 98b2a4061a..7e5ad76eff 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -78,6 +78,7 @@ const uint32_t misa_bits[] = {RVI, RVE, RVM, RVA, RVF, RVD, RVV,
  */
 const RISCVIsaExtData isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zicbom, PRIV_VERSION_1_12_0, ext_zicbom),
+    ISA_EXT_DATA_ENTRY(zicbop, PRIV_VERSION_1_12_0, ext_zicbop),
     ISA_EXT_DATA_ENTRY(zicboz, PRIV_VERSION_1_12_0, ext_zicboz),
     ISA_EXT_DATA_ENTRY(zicond, PRIV_VERSION_1_12_0, ext_zicond),
     ISA_EXT_DATA_ENTRY(zicntr, PRIV_VERSION_1_12_0, ext_zicntr),
@@ -1348,6 +1349,7 @@ const RISCVCPUMultiExtConfig riscv_cpu_extensions[] = {
     MULTI_EXT_CFG_BOOL("zhinxmin", ext_zhinxmin, false),
 
     MULTI_EXT_CFG_BOOL("zicbom", ext_zicbom, true),
+    MULTI_EXT_CFG_BOOL("zicbop", ext_zicbop, true),
     MULTI_EXT_CFG_BOOL("zicboz", ext_zicboz, true),
 
     MULTI_EXT_CFG_BOOL("zmmul", ext_zmmul, false),
@@ -1436,6 +1438,7 @@ Property riscv_cpu_options[] = {
     DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
 
     DEFINE_PROP_UINT16("cbom_blocksize", RISCVCPU, cfg.cbom_blocksize, 64),
+    DEFINE_PROP_UINT16("cbop_blocksize", RISCVCPU, cfg.cbop_blocksize, 64),
     DEFINE_PROP_UINT16("cboz_blocksize", RISCVCPU, cfg.cboz_blocksize, 64),
 
     DEFINE_PROP_END_OF_LIST(),
diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
index 6eef4a51ea..2203b4c45b 100644
--- a/target/riscv/cpu_cfg.h
+++ b/target/riscv/cpu_cfg.h
@@ -65,6 +65,7 @@ struct RISCVCPUConfig {
     bool ext_zicntr;
     bool ext_zicsr;
     bool ext_zicbom;
+    bool ext_zicbop;
     bool ext_zicboz;
     bool ext_zicond;
     bool ext_zihintntl;
@@ -134,6 +135,7 @@ struct RISCVCPUConfig {
     uint16_t vlen;
     uint16_t elen;
     uint16_t cbom_blocksize;
+    uint16_t cbop_blocksize;
     uint16_t cboz_blocksize;
     bool mmu;
     bool pmp;
-- 
2.41.0


