Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8184AC25B48
	for <qemu-riscv@archiver.kernel.org>; Thu, 26 Oct 2023 15:20:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qw29z-0006pk-VH; Thu, 26 Oct 2023 11:20:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1qw29y-0006oF-2s
 for qemu-riscv@nongnu.org; Thu, 26 Oct 2023 11:20:34 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1qw29w-0006L1-HW
 for qemu-riscv@nongnu.org; Thu, 26 Oct 2023 11:20:33 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-27d1aee5aa1so755738a91.0
 for <qemu-riscv@nongnu.org>; Thu, 26 Oct 2023 08:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1698333631; x=1698938431; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YI8WGG20prU7E7FZ00x7AWMKsXsfCxZVV/R6Dc9ONDI=;
 b=bdg1X+eoJnU6XeUY9ap8lsb2bLDEOFWxcUPVoZpHbRieOqzwA8jFu0nsacnyG1Use8
 OGhlDkD4/2PXPUAnMSS5oDN0lar0aeKg/8a+Nf1jio0af8wBy43mchSL06+8OZ98emZK
 Y4kFG8xWA43fM4vkEcwpKDi97k3PYfds/4Y8CrFAm5+IwIDNc3kpbZifCTvN8tajU6TR
 hymHTBfC4oxf409mnjOy4M+GIS+ZmV5hZZBTWRuADFTksC6Rk62QGKk1QU6DTWSs8VnQ
 A7vqZMWjhliUoZM1S1eiceZEdQVpt8F9YIfn3NbSXWCBoItD4KC6Q9Sw7/OgNsh8J7tI
 9dtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698333631; x=1698938431;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YI8WGG20prU7E7FZ00x7AWMKsXsfCxZVV/R6Dc9ONDI=;
 b=VAZFJirgomAmo/KP7Cf/24o3mjB27bxoyPC/RX0TuMNnmV/5SMEL1RNPcnI6Zy3hF5
 y8iEGFX37wpReel7OoHnn6c9nVRM2n1ofe59K1dE4+8kS1k0gv8gls5agJPZ0tqcaBs6
 kt1jZFH/j0n3kI0oYHFYgMhK09azI7K5uMTkaJPEYcpiRfnSQBKF2097mAhZcfQAW57X
 zQ/Frs1ktyAuLXvwIMRAQltms5auUIzYgz1tuaJ+R3B+ywh+7FlQy3+u0319HYY59cKN
 ML9/7q/kRjILnooUlTO5j7adVyfTt3HdkAGPq1M8Slfdr8TS+Zm5BC8AAkkui5gsAzvB
 QR4w==
X-Gm-Message-State: AOJu0YzhFu8aDc5FuORMuYOZTrx1or+EbiDSucZKFP42T2f/EulM5/pr
 weU3Juc0mmeOdT3Ms1kNVR3lRA==
X-Google-Smtp-Source: AGHT+IFEILsd2S4fmUa1NTFq1cG8vKEoeNUyWTMvrSVfCTarFptL9ns+jtTbiczi9qdGMav545g8Qg==
X-Received: by 2002:a17:90b:1c8b:b0:280:72b:397d with SMTP id
 oo11-20020a17090b1c8b00b00280072b397dmr334378pjb.20.1698333630980; 
 Thu, 26 Oct 2023 08:20:30 -0700 (PDT)
Received: from duncan.localdomain (125-228-20-175.hinet-ip.hinet.net.
 [125.228.20.175]) by smtp.gmail.com with ESMTPSA id
 nv18-20020a17090b1b5200b0027fee011cebsm1326061pjb.10.2023.10.26.08.20.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Oct 2023 08:20:30 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Max Chou <max.chou@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH v2 05/14] target/riscv: Expose Zvkb extension property
Date: Thu, 26 Oct 2023 23:18:12 +0800
Message-Id: <20231026151828.754279-6-max.chou@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231026151828.754279-1-max.chou@sifive.com>
References: <20231026151828.754279-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=max.chou@sifive.com; helo=mail-pj1-x1036.google.com
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

Signed-off-by: Max Chou <max.chou@sifive.com>
---
 target/riscv/cpu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 5099c786415..992f8e0f7b0 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -125,6 +125,7 @@ const RISCVIsaExtData isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zvfbfwma, PRIV_VERSION_1_12_0, ext_zvfbfwma),
     ISA_EXT_DATA_ENTRY(zvfh, PRIV_VERSION_1_12_0, ext_zvfh),
     ISA_EXT_DATA_ENTRY(zvfhmin, PRIV_VERSION_1_12_0, ext_zvfhmin),
+    ISA_EXT_DATA_ENTRY(zvkb, PRIV_VERSION_1_12_0, ext_zvkb),
     ISA_EXT_DATA_ENTRY(zvkg, PRIV_VERSION_1_12_0, ext_zvkg),
     ISA_EXT_DATA_ENTRY(zvkned, PRIV_VERSION_1_12_0, ext_zvkned),
     ISA_EXT_DATA_ENTRY(zvknha, PRIV_VERSION_1_12_0, ext_zvknha),
@@ -1370,6 +1371,7 @@ const RISCVCPUMultiExtConfig riscv_cpu_experimental_exts[] = {
     /* Vector cryptography extensions */
     MULTI_EXT_CFG_BOOL("x-zvbb", ext_zvbb, false),
     MULTI_EXT_CFG_BOOL("x-zvbc", ext_zvbc, false),
+    MULTI_EXT_CFG_BOOL("x-zvkb", ext_zvkg, false),
     MULTI_EXT_CFG_BOOL("x-zvkg", ext_zvkg, false),
     MULTI_EXT_CFG_BOOL("x-zvkned", ext_zvkned, false),
     MULTI_EXT_CFG_BOOL("x-zvknha", ext_zvknha, false),
-- 
2.34.1


