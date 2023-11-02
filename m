Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6B2CC4167B
	for <qemu-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 22:47:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qygRe-0006u8-JX; Thu, 02 Nov 2023 18:45:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qygRD-0006Tm-VT
 for qemu-riscv@nongnu.org; Thu, 02 Nov 2023 18:45:28 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qygQy-0003HM-5N
 for qemu-riscv@nongnu.org; Thu, 02 Nov 2023 18:45:18 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-5a7b91faf40so17628297b3.1
 for <qemu-riscv@nongnu.org>; Thu, 02 Nov 2023 15:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698965103; x=1699569903; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JtEbQOOtV6rkXTZ6QuhWgNfK4wkSlBcd0MeYYjPZbbw=;
 b=kbbdUyfRycg1kZp/RJVfr3iiLcTK036EHeVBqMBdYT7KDYipqGymeNMPWZXNjRjWax
 z7Tqo2PhZBRGKbNkDNIrVT1NsvxB5K0vRw4+NXq74Cvdeun6+tMiylpxsj8ZCbpU7byn
 KkXIwek2WXkrHjfbl1EKkSd44Vg3zjwSbuoz2lW+JWW5fwBEqla5iTIfmeI2LE6QkkAi
 qOpDSO8o2LV3ZFD/whdnAx5p8rHbgJ80w8m4dgCNJaNBXFB/tUW8MNgJgFGqGI0vZam4
 8oNjzXzTVNDtgVZRkMkYEXHJ9YYDKTFTV6brWojJBS93SBrx9NRuqpoxqwa2/ou2O4lc
 x2FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698965103; x=1699569903;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JtEbQOOtV6rkXTZ6QuhWgNfK4wkSlBcd0MeYYjPZbbw=;
 b=gm++FoKi+6/UTptw76iJE04v+/hQ606sRBsglrkMRWzi/2QsR7+21JPRQjlTsecRfR
 yqkjg1lFgTW2/RcuMrauVeb7uVj0qiM6KHFKL75z5thqzd2sZTXXasTFGzx1PMTYiXdo
 rHWXMTys/MFcsgZi0LuKZ+bErNmzdJQcqtqGPSOEKHExUpc8pvZxmYhqTzHLDH+wJiuV
 uKiXUdAabPRnF/j5wh56JTt+/GF3nqYGj5AzEcJY2DzbTcaXSJpsJYi+g9JINzQwmjWy
 vRaxzQ/uuddCtjSsr4ndWvwXnIl3ni+DcMCX3WYYfzpha9OJ9uou+Oy/FJ8F4w9+ReWM
 hJyg==
X-Gm-Message-State: AOJu0YxW2zcfFIQ7d+6qwRW5MNKTKilYg6ara9b0u9FdRMOAyUcHbWz0
 wc7otXWTG0vSboj+cJLcF4vAjA==
X-Google-Smtp-Source: AGHT+IHR2aKGw2aykUBuRW/NTK6Yz5RGo2tReKD+IJOMfoRJ9xUmZCuhvz6U6GVPiSjwxgAM8Ab0Vw==
X-Received: by 2002:a81:83cc:0:b0:5ac:552c:3462 with SMTP id
 t195-20020a8183cc000000b005ac552c3462mr1122336ywf.41.1698965102999; 
 Thu, 02 Nov 2023 15:45:02 -0700 (PDT)
Received: from grind.. ([179.193.10.161]) by smtp.gmail.com with ESMTPSA id
 ce10-20020a05690c098a00b0059b24bd4f2asm259523ywb.57.2023.11.02.15.45.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Nov 2023 15:45:02 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v9 05/19] target/riscv: add zicbop extension flag
Date: Thu,  2 Nov 2023 19:44:31 -0300
Message-ID: <20231102224445.527355-6-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231102224445.527355-1-dbarboza@ventanamicro.com>
References: <20231102224445.527355-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-yw1-x1134.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
index e64886a4d8..ae18aec09a 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -250,6 +250,11 @@ static void create_fdt_socket_cpus(RISCVVirtState *s, int socket,
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
index e9be0c7dae..057dd3d186 100644
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
@@ -1380,6 +1381,7 @@ const RISCVCPUMultiExtConfig riscv_cpu_extensions[] = {
     MULTI_EXT_CFG_BOOL("zhinxmin", ext_zhinxmin, false),
 
     MULTI_EXT_CFG_BOOL("zicbom", ext_zicbom, true),
+    MULTI_EXT_CFG_BOOL("zicbop", ext_zicbop, true),
     MULTI_EXT_CFG_BOOL("zicboz", ext_zicboz, true),
 
     MULTI_EXT_CFG_BOOL("zmmul", ext_zmmul, false),
@@ -1476,6 +1478,7 @@ Property riscv_cpu_options[] = {
     DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
 
     DEFINE_PROP_UINT16("cbom_blocksize", RISCVCPU, cfg.cbom_blocksize, 64),
+    DEFINE_PROP_UINT16("cbop_blocksize", RISCVCPU, cfg.cbop_blocksize, 64),
     DEFINE_PROP_UINT16("cboz_blocksize", RISCVCPU, cfg.cboz_blocksize, 64),
 
     DEFINE_PROP_END_OF_LIST(),
diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
index 634ff673b3..c21e4bcc47 100644
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
@@ -142,6 +143,7 @@ struct RISCVCPUConfig {
     uint16_t vlen;
     uint16_t elen;
     uint16_t cbom_blocksize;
+    uint16_t cbop_blocksize;
     uint16_t cboz_blocksize;
     bool mmu;
     bool pmp;
-- 
2.41.0


