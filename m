Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D820C25B48
	for <qemu-riscv@archiver.kernel.org>; Thu, 26 Oct 2023 15:21:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qw2AP-0007Ib-PD; Thu, 26 Oct 2023 11:21:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1qw2A6-0006rd-AR
 for qemu-riscv@nongnu.org; Thu, 26 Oct 2023 11:20:46 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1qw2A3-0006MB-Vd
 for qemu-riscv@nongnu.org; Thu, 26 Oct 2023 11:20:41 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-27db9fdec0dso860259a91.0
 for <qemu-riscv@nongnu.org>; Thu, 26 Oct 2023 08:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1698333638; x=1698938438; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=28soGqZ4hmvdB2DBr+8fDTCxvQalUe0nHRzFfVeJIWI=;
 b=JkZ0zCmEMX9lEZmGgEw4dcWLbfqqakBeliLBOKaNRibc50tmx6x7Y36NnP+ySs50eW
 yYj6DDn9zeM18lBF+6/1u3PAgW4kY5zclWAAvau8SaCQaI4O+CqKJtS900iKFtamldev
 69XSPsBaMTKx7CNlRUoXmGv/4OV8MTGmVcv2T5b2OjzMdT+LgU6uLLydpW7JJ0O559a3
 qGLMAAFSyP5jHhqKr0X3bA335kDe1L2xAEMm70PhwOp0EDyua+4kouP9W5zc6fUV2P+8
 ubiljFvZzAJ5H8sFmcNDNOcVNw0glpph/5Slvo0fQbMEJa1z1Efu6h/wGPTjyU23BtY6
 bO+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698333638; x=1698938438;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=28soGqZ4hmvdB2DBr+8fDTCxvQalUe0nHRzFfVeJIWI=;
 b=lmFVnlYSgxxMSXE7obmIbpIlCjMw6c3DAbSrXNnZDsWd66GGRFeYMwchelYTFOkx7x
 EkDez3W+IRfoZVP446a/P116NhbRLSPSikaIWfNOvwHoBiwCL8J+5GwtxWZpuxQFQxEJ
 4/29lOrvCX4DIpLCNwXePC+mApupCwl5EIkuEem6kb6HvAOeqpTbsuio9PXpyxNFwNqQ
 RXaqryOq0I+bMWiuwOGsHMIAHFerqtQd8+u8APHBCptlIBW4lEn2cz+k03jH17LSx0jT
 kIA4aguKjjA55y/NiFpmY77CsxdLy8jcd/SbwKdmPQWJYVBajJXWSPso33VzFiaYptOw
 DYVg==
X-Gm-Message-State: AOJu0YxGI9HAi7tjnJLUQMMjocqItvRvXtoqfXxGhjKZXT1e0h1ZARqx
 22mMjcwrK7iCdeZZCK/zVc/3Vg==
X-Google-Smtp-Source: AGHT+IFOCxJoQWot5jUKFDqwrhyADGiRTVh37uFGmwwQQGizt7DDRK/eF0f4K16X4HLVD7xH0CW9Vw==
X-Received: by 2002:a17:90a:7442:b0:27d:9b67:7fa6 with SMTP id
 o2-20020a17090a744200b0027d9b677fa6mr16672661pjk.3.1698333638290; 
 Thu, 26 Oct 2023 08:20:38 -0700 (PDT)
Received: from duncan.localdomain (125-228-20-175.hinet-ip.hinet.net.
 [125.228.20.175]) by smtp.gmail.com with ESMTPSA id
 nv18-20020a17090b1b5200b0027fee011cebsm1326061pjb.10.2023.10.26.08.20.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Oct 2023 08:20:38 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Max Chou <max.chou@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH v2 07/14] target/riscv: Expose Zvkn[c|g] extnesion properties
Date: Thu, 26 Oct 2023 23:18:14 +0800
Message-Id: <20231026151828.754279-8-max.chou@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231026151828.754279-1-max.chou@sifive.com>
References: <20231026151828.754279-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=max.chou@sifive.com; helo=mail-pj1-x1034.google.com
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

Expose the properties of NIST Algorithm Suite related extensions (Zvkn,
Zvknc, Zvkng).

Signed-off-by: Max Chou <max.chou@sifive.com>
---
 target/riscv/cpu.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 992f8e0f7b0..8eae8d3e59c 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -127,7 +127,10 @@ const RISCVIsaExtData isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zvfhmin, PRIV_VERSION_1_12_0, ext_zvfhmin),
     ISA_EXT_DATA_ENTRY(zvkb, PRIV_VERSION_1_12_0, ext_zvkb),
     ISA_EXT_DATA_ENTRY(zvkg, PRIV_VERSION_1_12_0, ext_zvkg),
+    ISA_EXT_DATA_ENTRY(zvkn, PRIV_VERSION_1_12_0, ext_zvkn),
+    ISA_EXT_DATA_ENTRY(zvknc, PRIV_VERSION_1_12_0, ext_zvknc),
     ISA_EXT_DATA_ENTRY(zvkned, PRIV_VERSION_1_12_0, ext_zvkned),
+    ISA_EXT_DATA_ENTRY(zvkng, PRIV_VERSION_1_12_0, ext_zvkng),
     ISA_EXT_DATA_ENTRY(zvknha, PRIV_VERSION_1_12_0, ext_zvknha),
     ISA_EXT_DATA_ENTRY(zvknhb, PRIV_VERSION_1_12_0, ext_zvknhb),
     ISA_EXT_DATA_ENTRY(zvksed, PRIV_VERSION_1_12_0, ext_zvksed),
@@ -1379,6 +1382,9 @@ const RISCVCPUMultiExtConfig riscv_cpu_experimental_exts[] = {
     MULTI_EXT_CFG_BOOL("x-zvksed", ext_zvksed, false),
     MULTI_EXT_CFG_BOOL("x-zvksh", ext_zvksh, false),
     MULTI_EXT_CFG_BOOL("x-zvkt", ext_zvkt, false),
+    MULTI_EXT_CFG_BOOL("x-zvkn", ext_zvkn, false),
+    MULTI_EXT_CFG_BOOL("x-zvknc", ext_zvknc, false),
+    MULTI_EXT_CFG_BOOL("x-zvkng", ext_zvkng, false),
 
     DEFINE_PROP_END_OF_LIST(),
 };
-- 
2.34.1


