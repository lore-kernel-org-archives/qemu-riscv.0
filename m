Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3521C25B6D
	for <qemu-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 15:17:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qvfau-0005Zw-Hr; Wed, 25 Oct 2023 11:14:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1qvfau-0005ZC-0W
 for qemu-riscv@nongnu.org; Wed, 25 Oct 2023 11:14:52 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1qvfas-0003i9-Cu
 for qemu-riscv@nongnu.org; Wed, 25 Oct 2023 11:14:51 -0400
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-6ba54c3ed97so5627309b3a.2
 for <qemu-riscv@nongnu.org>; Wed, 25 Oct 2023 08:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1698246889; x=1698851689; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PWrYGN8E3tylotAH/OAbUnzxmsSVvrM8xFBXqtl296k=;
 b=guQmR5VlmFytiDsbWHRptftsuNDvrW78PCrZGfR7M68KACGmh5j+B+hSl/2mR3CQuq
 lpCq0iY9sfRHjBvcNxW1Eo7Dt2VuEbJEBmNUWMdp/mxuF86nyj0zYqTdxpyht7axLxZ6
 8/twx0y8qkg6EBZ9ExW7qtl5T07ahVxRf+RdTDnYOaMeCBc59lDoDphrGo1Hn44sT2F9
 6TqO0gNzPUHKH1c02MeCXWocBHozjnRV5geF5mHWAncUB9qIlGFl8WoZsT6vuwwVv+Ee
 c8ppHw6ovamZf2eTzGXpt03rvnpql/IWuUzErptt2LB78yAC1JvPkeVre5g92sVrK2//
 1Aww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698246889; x=1698851689;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PWrYGN8E3tylotAH/OAbUnzxmsSVvrM8xFBXqtl296k=;
 b=VjtulhtRExsJWhts5QruHBpcueCxt3HZFFvFQFFIGCnEAkK9WZ5HlvRSBiSz2jhJet
 u4B8TA/nvXfexgAk+yZLJydSllpT22aeuhQCH7Y7TXFKn25jHZocfMTQxcZTc5nwS/5L
 Ei6HLh7i8ITvdxGcwXwPzzcOKheato0Qz6/u85QWCKZ/djHj7sZyzuJ7vZoqQHQISpcm
 5yFE3EHg4W7VmoRqO6J67ugfzLgFUbXDp/0x82Z4zDKQRiRrU+1HXInrSKrThtj4hRDX
 GWSBDNmTliB5yJap5ERRtdqDqXQNSybrk5MLhMQQlQV5+TkJmgsqsuo3Lu6T4t1a7BKJ
 BkxQ==
X-Gm-Message-State: AOJu0Ywtj2W/6Gvsr3T2MI8QKGGVEEwMOI0JmEXP46oNQxJsX31uPNQq
 46wmt6Q9/3gRZwQf8ZisyemIwQ==
X-Google-Smtp-Source: AGHT+IG5aaYA5QecqjCrJdpz/r46e3szGdy1VrE7EdoCmoiiEP3RCqxCJeLv78rkc3SSUJudJb5D5Q==
X-Received: by 2002:a05:6a20:840b:b0:17b:426f:829 with SMTP id
 c11-20020a056a20840b00b0017b426f0829mr7469494pzd.37.1698246889183; 
 Wed, 25 Oct 2023 08:14:49 -0700 (PDT)
Received: from duncan.localdomain (125-228-20-175.hinet-ip.hinet.net.
 [125.228.20.175]) by smtp.gmail.com with ESMTPSA id
 w14-20020a63160e000000b005b8ebef9fa0sm2677807pgl.83.2023.10.25.08.14.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Oct 2023 08:14:48 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Max Chou <max.chou@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH 10/14] target/riscv: Move vector crypto extensions to
 riscv_cpu_extensions
Date: Wed, 25 Oct 2023 23:13:34 +0800
Message-Id: <20231025151341.725477-11-max.chou@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231025151341.725477-1-max.chou@sifive.com>
References: <20231025151341.725477-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=max.chou@sifive.com; helo=mail-pf1-x42e.google.com
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

Because the vector crypto specification is ratified, so move theses
extensions from riscv_cpu_experimental_exts to riscv_cpu_extensions.

Signed-off-by: Max Chou <max.chou@sifive.com>
---
 target/riscv/cpu.c | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 1709df76a9b..5b5805399ee 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1342,6 +1342,24 @@ const RISCVCPUMultiExtConfig riscv_cpu_extensions[] = {
     MULTI_EXT_CFG_BOOL("zcmt", ext_zcmt, false),
     MULTI_EXT_CFG_BOOL("zicond", ext_zicond, false),
 
+    /* Vector cryptography extensions */
+    MULTI_EXT_CFG_BOOL("zvbb", ext_zvbb, false),
+    MULTI_EXT_CFG_BOOL("zvbc", ext_zvbc, false),
+    MULTI_EXT_CFG_BOOL("zvkb", ext_zvkg, false),
+    MULTI_EXT_CFG_BOOL("zvkg", ext_zvkg, false),
+    MULTI_EXT_CFG_BOOL("zvkned", ext_zvkned, false),
+    MULTI_EXT_CFG_BOOL("zvknha", ext_zvknha, false),
+    MULTI_EXT_CFG_BOOL("zvknhb", ext_zvknhb, false),
+    MULTI_EXT_CFG_BOOL("zvksed", ext_zvksed, false),
+    MULTI_EXT_CFG_BOOL("zvksh", ext_zvksh, false),
+    MULTI_EXT_CFG_BOOL("zvkt", ext_zvkt, false),
+    MULTI_EXT_CFG_BOOL("zvkn", ext_zvkn, false),
+    MULTI_EXT_CFG_BOOL("zvknc", ext_zvknc, false),
+    MULTI_EXT_CFG_BOOL("zvkng", ext_zvkng, false),
+    MULTI_EXT_CFG_BOOL("zvks", ext_zvks, false),
+    MULTI_EXT_CFG_BOOL("zvksc", ext_zvksc, false),
+    MULTI_EXT_CFG_BOOL("zvksg", ext_zvksg, false),
+
     DEFINE_PROP_END_OF_LIST(),
 };
 
@@ -1374,24 +1392,6 @@ const RISCVCPUMultiExtConfig riscv_cpu_experimental_exts[] = {
     MULTI_EXT_CFG_BOOL("x-zvfbfmin", ext_zvfbfmin, false),
     MULTI_EXT_CFG_BOOL("x-zvfbfwma", ext_zvfbfwma, false),
 
-    /* Vector cryptography extensions */
-    MULTI_EXT_CFG_BOOL("x-zvbb", ext_zvbb, false),
-    MULTI_EXT_CFG_BOOL("x-zvbc", ext_zvbc, false),
-    MULTI_EXT_CFG_BOOL("x-zvkb", ext_zvkg, false),
-    MULTI_EXT_CFG_BOOL("x-zvkg", ext_zvkg, false),
-    MULTI_EXT_CFG_BOOL("x-zvkned", ext_zvkned, false),
-    MULTI_EXT_CFG_BOOL("x-zvknha", ext_zvknha, false),
-    MULTI_EXT_CFG_BOOL("x-zvknhb", ext_zvknhb, false),
-    MULTI_EXT_CFG_BOOL("x-zvksed", ext_zvksed, false),
-    MULTI_EXT_CFG_BOOL("x-zvksh", ext_zvksh, false),
-    MULTI_EXT_CFG_BOOL("x-zvkt", ext_zvkt, false),
-    MULTI_EXT_CFG_BOOL("x-zvkn", ext_zvkn, false),
-    MULTI_EXT_CFG_BOOL("x-zvknc", ext_zvknc, false),
-    MULTI_EXT_CFG_BOOL("x-zvkng", ext_zvkng, false),
-    MULTI_EXT_CFG_BOOL("x-zvks", ext_zvks, false),
-    MULTI_EXT_CFG_BOOL("x-zvksc", ext_zvksc, false),
-    MULTI_EXT_CFG_BOOL("x-zvksg", ext_zvksg, false),
-
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.34.1


