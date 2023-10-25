Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA263C07545
	for <qemu-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 15:16:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qvfat-0005Z7-53; Wed, 25 Oct 2023 11:14:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1qvfar-0005YM-5k
 for qemu-riscv@nongnu.org; Wed, 25 Oct 2023 11:14:49 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1qvfap-0003fq-Mc
 for qemu-riscv@nongnu.org; Wed, 25 Oct 2023 11:14:48 -0400
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-6bb4abb8100so4866332b3a.2
 for <qemu-riscv@nongnu.org>; Wed, 25 Oct 2023 08:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1698246885; x=1698851685; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xkwlpLYypRxSWiGHgKxtQp1RAJeqYUNkInw/XRm9smE=;
 b=Tx616clsBuWXhfVfbRfSkfmgZBvVnrilfxTi9P3N0FEYzGf6TxnPxFxR2iF9nPp3hg
 kNtqvi/4d0M/OgynWaVakvtLORZsdX9hkXPWbOdJbrcazDBqmfk4+TFPlAuT/Uwh1XBb
 pQW3st99wLrimDtg2BftvpGxTEC2aCCaeeAosLKZEnK6oYnXjHJ5DAvDCOyy9rY5LZYA
 hfhYlaC6peWDBz+f0e6uVLEsFes4Us0vkYnjMNiHB5A0rf53JE/+F67/v/i9QuAfXTdD
 9bukkWjTP9BLAHUvokoseKQ86Ifauctfvs+42TZpJgLBocURlh+mI8524JOhObo2lAGh
 e9sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698246885; x=1698851685;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xkwlpLYypRxSWiGHgKxtQp1RAJeqYUNkInw/XRm9smE=;
 b=E0UZYfF9joN7bnQSYgJsB/jzkSx7hoaTS72F6ioSqedIyCrdFuCc44qjoIAHFEgnIJ
 CV+2fYE1Q50uvo743W1tdUlcB3bQtEFj3BWCQukN9W/IbunCalCM4Eh0/UUG1Ns1RTl4
 WLUZq2lVnqOqUs4Ij6ABu/qsj7uQB5qZ00aksu8tfDa/EIP96OQx3OStocIhPbaagcZw
 deUHNAcSySbNwTc01RSCxKnn5pI0TZO0e7riDAUEptjbYL6NQPvG5UZSZPm6XD/VtZMh
 VHyRndpTpk4aIUHAeyuTXu1VA4GGuGEOq/QaAP4le1Ld3prevRMgU15KrSRkUwOfB9PO
 UCAw==
X-Gm-Message-State: AOJu0YwntLyu/Ltsx6TPlttfQWCBrFttaeB3wzblMr7wdo4vafI00omh
 bN05rBCAtbgA2VU4fjsp9JVUAg==
X-Google-Smtp-Source: AGHT+IFncs2PD3ySzb9eft0mNl8wy3evf61jV1TdCrzvKnTumaRbugZ+e6WjA6LcXTpFY4Od7RBnog==
X-Received: by 2002:a05:6a20:3c8a:b0:17e:45d0:7036 with SMTP id
 b10-20020a056a203c8a00b0017e45d07036mr6616389pzj.11.1698246885399; 
 Wed, 25 Oct 2023 08:14:45 -0700 (PDT)
Received: from duncan.localdomain (125-228-20-175.hinet-ip.hinet.net.
 [125.228.20.175]) by smtp.gmail.com with ESMTPSA id
 w14-20020a63160e000000b005b8ebef9fa0sm2677807pgl.83.2023.10.25.08.14.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Oct 2023 08:14:45 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Max Chou <max.chou@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH 09/14] target/riscv: Expose Zvks[c|g] extnesion properties
Date: Wed, 25 Oct 2023 23:13:33 +0800
Message-Id: <20231025151341.725477-10-max.chou@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231025151341.725477-1-max.chou@sifive.com>
References: <20231025151341.725477-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=max.chou@sifive.com; helo=mail-pf1-x429.google.com
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

Expose the properties of ShangMi Algorithm Suite related extensions
(Zvks, Zvksc, Zvksg).

Signed-off-by: Max Chou <max.chou@sifive.com>
---
 target/riscv/cpu.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 8eae8d3e59c..1709df76a9b 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -133,7 +133,10 @@ const RISCVIsaExtData isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zvkng, PRIV_VERSION_1_12_0, ext_zvkng),
     ISA_EXT_DATA_ENTRY(zvknha, PRIV_VERSION_1_12_0, ext_zvknha),
     ISA_EXT_DATA_ENTRY(zvknhb, PRIV_VERSION_1_12_0, ext_zvknhb),
+    ISA_EXT_DATA_ENTRY(zvks, PRIV_VERSION_1_12_0, ext_zvks),
+    ISA_EXT_DATA_ENTRY(zvksc, PRIV_VERSION_1_12_0, ext_zvksc),
     ISA_EXT_DATA_ENTRY(zvksed, PRIV_VERSION_1_12_0, ext_zvksed),
+    ISA_EXT_DATA_ENTRY(zvksg, PRIV_VERSION_1_12_0, ext_zvksg),
     ISA_EXT_DATA_ENTRY(zvksh, PRIV_VERSION_1_12_0, ext_zvksh),
     ISA_EXT_DATA_ENTRY(zvkt, PRIV_VERSION_1_12_0, ext_zvkt),
     ISA_EXT_DATA_ENTRY(zhinx, PRIV_VERSION_1_12_0, ext_zhinx),
@@ -1385,6 +1388,9 @@ const RISCVCPUMultiExtConfig riscv_cpu_experimental_exts[] = {
     MULTI_EXT_CFG_BOOL("x-zvkn", ext_zvkn, false),
     MULTI_EXT_CFG_BOOL("x-zvknc", ext_zvknc, false),
     MULTI_EXT_CFG_BOOL("x-zvkng", ext_zvkng, false),
+    MULTI_EXT_CFG_BOOL("x-zvks", ext_zvks, false),
+    MULTI_EXT_CFG_BOOL("x-zvksc", ext_zvksc, false),
+    MULTI_EXT_CFG_BOOL("x-zvksg", ext_zvksg, false),
 
     DEFINE_PROP_END_OF_LIST(),
 };
-- 
2.34.1


