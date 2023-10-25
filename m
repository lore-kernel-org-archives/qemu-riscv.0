Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3AB9C25B47
	for <qemu-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 15:15:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qvfaL-00054j-T2; Wed, 25 Oct 2023 11:14:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1qvfaJ-00052A-1G
 for qemu-riscv@nongnu.org; Wed, 25 Oct 2023 11:14:15 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1qvfaH-0003YQ-IJ
 for qemu-riscv@nongnu.org; Wed, 25 Oct 2023 11:14:14 -0400
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-6bb4abb8100so4865583b3a.2
 for <qemu-riscv@nongnu.org>; Wed, 25 Oct 2023 08:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1698246852; x=1698851652; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/NG6r7b9rhLCBcUYVSJoZtIoBWMqyY2dfwA7ypnvCr4=;
 b=eIlWgFBCl5qrn1s/owyq4wub5wXREv4lwVIp5/3ivoTr6BOWZnGehY3fB5wpM96AtN
 KVwImjogmyroMGvodoQ0/QGe7Ftx+IvZgDsGW9jJBSsacVb1NkJm9d3wxctiBwXWEZzQ
 A40eU/PDDXc1w4ulee0rfp4Nsc6p+195186/spVhvjw4qjQzei11gy76gP5HWfqwvvSN
 k4w2y5hFR/1pRHie8+wwTi8tpkXKWTIbTDaPMOn8VxV5SL+xm0NzMNYIB0zh9b/eK7m3
 cbTulog1JZotnt0ZgwzB3Oz8Vnfc4TnbLCTll8H4iFT96VovshIPApRnA8BvhVQFuWBB
 ZYDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698246852; x=1698851652;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/NG6r7b9rhLCBcUYVSJoZtIoBWMqyY2dfwA7ypnvCr4=;
 b=ONNYbKQqXJoNWKc/2btYwKI9U3H3BWcM+axmsUYg4x0jg3AdD+vx/haH+jKjN5s034
 oD4VwoeOA7sKb+wtuIs8D0rnJhyFTICSTFkf8deXCiYJpe0/qTyAf9GgS6ijEmRqT7iU
 dS5iulrogMyQrWfJm2DJi/hLnaWBvHdnBQfsfoa2dQP4YChw4oCTHUFr09F7D814VHpA
 0TnBKrtTnTuXykdHZNpksFuBvEZot17BdvzSdWSuwXVK+b1EqbWyBiOzoyv2scmC4+YJ
 J1vKTMWwTMWMXKnOi9UNg37VwCQMNu4XEWNovr8SFFDq1D3/eg0EQhLxVsXXto8+s+QB
 agpg==
X-Gm-Message-State: AOJu0YzbeW8SFz8Y/fW4uJMn3SlENYgsV/y+/uP5Q4p0kihE7zQKg4Sg
 9rrVVaXwvYBeSpYXXrKabTpwGQ==
X-Google-Smtp-Source: AGHT+IGTQDW16J1PJioj+iO35PAXQoidZlrataPdtQ4jn4VrA3N/PHnwYKnAwf23JyiolPKDs/DqgA==
X-Received: by 2002:a05:6a00:14c4:b0:68a:4d66:caf with SMTP id
 w4-20020a056a0014c400b0068a4d660cafmr13713388pfu.34.1698246852029; 
 Wed, 25 Oct 2023 08:14:12 -0700 (PDT)
Received: from duncan.localdomain (125-228-20-175.hinet-ip.hinet.net.
 [125.228.20.175]) by smtp.gmail.com with ESMTPSA id
 w14-20020a63160e000000b005b8ebef9fa0sm2677807pgl.83.2023.10.25.08.14.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Oct 2023 08:14:11 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Max Chou <max.chou@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH 02/14] target/riscv: Expose Zvkt extension property
Date: Wed, 25 Oct 2023 23:13:26 +0800
Message-Id: <20231025151341.725477-3-max.chou@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231025151341.725477-1-max.chou@sifive.com>
References: <20231025151341.725477-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=max.chou@sifive.com; helo=mail-pf1-x435.google.com
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
index a2881bfa383..5099c786415 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -131,6 +131,7 @@ const RISCVIsaExtData isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zvknhb, PRIV_VERSION_1_12_0, ext_zvknhb),
     ISA_EXT_DATA_ENTRY(zvksed, PRIV_VERSION_1_12_0, ext_zvksed),
     ISA_EXT_DATA_ENTRY(zvksh, PRIV_VERSION_1_12_0, ext_zvksh),
+    ISA_EXT_DATA_ENTRY(zvkt, PRIV_VERSION_1_12_0, ext_zvkt),
     ISA_EXT_DATA_ENTRY(zhinx, PRIV_VERSION_1_12_0, ext_zhinx),
     ISA_EXT_DATA_ENTRY(zhinxmin, PRIV_VERSION_1_12_0, ext_zhinxmin),
     ISA_EXT_DATA_ENTRY(smaia, PRIV_VERSION_1_12_0, ext_smaia),
@@ -1375,6 +1376,7 @@ const RISCVCPUMultiExtConfig riscv_cpu_experimental_exts[] = {
     MULTI_EXT_CFG_BOOL("x-zvknhb", ext_zvknhb, false),
     MULTI_EXT_CFG_BOOL("x-zvksed", ext_zvksed, false),
     MULTI_EXT_CFG_BOOL("x-zvksh", ext_zvksh, false),
+    MULTI_EXT_CFG_BOOL("x-zvkt", ext_zvkt, false),
 
     DEFINE_PROP_END_OF_LIST(),
 };
-- 
2.34.1


