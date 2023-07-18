Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34E3BC001DC
	for <qemu-riscv@archiver.kernel.org>; Tue, 18 Jul 2023 22:49:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qLtUr-0003Oa-AU; Tue, 18 Jul 2023 18:48:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kaiwenx@rivosinc.com>)
 id 1qLtUp-0003O3-Hn
 for qemu-riscv@nongnu.org; Tue, 18 Jul 2023 18:48:43 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kaiwenx@rivosinc.com>)
 id 1qLtUn-0004y7-Uh
 for qemu-riscv@nongnu.org; Tue, 18 Jul 2023 18:48:43 -0400
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-668709767b1so4628541b3a.2
 for <qemu-riscv@nongnu.org>; Tue, 18 Jul 2023 15:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1689720520; x=1692312520; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jmBntf7xa3Sa8583LrioSnWbCw8LdNAWYw7xgKjdTZs=;
 b=wRvIdWWNBeCuLcgKC0B7v1oVzj0yL/qM9XltxuQXW1QnsZmXaB3rpjSbCS3GlTiF4a
 0OsRyWhQtxmJjp0JCrCjl7W8l7X8eBKJ6Hw2XhHyggUc50NWe3uJ/w39i+FXxCGTPdIF
 EddADv4S1n3kdeq5LeOKLr+//KCIaLqfs5noRAk4c7k+dHWbubVQYXt3/9sxZJyBQL9x
 C161uZGAfd2j8J4r+wUbTOGLMhcXMxYGf0KY8kC7S7N+ecqBe61gy+w64cJ9B3+jdq1q
 YredKVjCnR+SSdQI8EQYVwh+b4zGcgpjf9IObiuFyjtR0D8apKcHf+362t/efMA8psgl
 JvUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689720520; x=1692312520;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jmBntf7xa3Sa8583LrioSnWbCw8LdNAWYw7xgKjdTZs=;
 b=C8q2u9d8/oBnh7A6XLzviUebur0xjMqmZOx7I5wNlSbBu4Yh6XSjnN3trBQpCpvZFx
 ckKzhgwALS0FFRR1KwQjcFlXwNd/1p5Gox+79dOL1BjoDtHdPaJtl7AdwTOmrzdjJPnI
 qp1eD66KxJiJzviUC1iUBp4qO0m6vwQg6mYh0keLELLF+UNwQWB7kVBachjcF8A3kYM5
 7uWwPIavQOnZrWlYM6+ufJKJmxoNHK+zImrYVj/co1JyEqf0SrqYH/Io029IPtaQu2hk
 yUi9d4lFIATWnxNR4hH/fcWkc0Cnell43bSZ6cgqoxjYTQwJLavxvDGFkgWYsI/nVBnb
 gC3A==
X-Gm-Message-State: ABy/qLYq+agTaCfSaiVKHmjXIvuJoNY2iGtk4oCJSJUwGOg6RqNo39yE
 Hqjg/LKMojEuhvN9zLRyFe/TKQibuFGj4uJqXUrmFg==
X-Google-Smtp-Source: APBJJlGqIlG87iJYTN0vokmOLJLA7MLB/3inkZ6UqPX3S7dtCCdbKzpXLjTIjG5Nil1f1mg+BtqU1w==
X-Received: by 2002:a05:6a00:134e:b0:67f:48a2:5d9f with SMTP id
 k14-20020a056a00134e00b0067f48a25d9fmr4180811pfu.11.1689720520397; 
 Tue, 18 Jul 2023 15:48:40 -0700 (PDT)
Received: from kaiwenx.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 i14-20020aa787ce000000b00682669dc19bsm1983312pfo.201.2023.07.18.15.48.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jul 2023 15:48:40 -0700 (PDT)
From: Kaiwen Xue <kaiwenx@rivosinc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Kaiwen Xue <kaiwenx@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Atish Kumar Patra <atishp@atishpatra.org>,
 Kaiwen Xue <kaiwenx@andrew.cmu.edu>
Subject: [PATCH 1/3] target/riscv: Add cycle & instret privilege mode
 filtering properties
Date: Tue, 18 Jul 2023 15:47:43 -0700
Message-ID: <d0e7d84180afec116b9fc54ef72fba1d7d8ff345.1689631639.git.kaiwenx@rivosinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1689631639.git.kaiwenx@rivosinc.com>
References: <cover.1689631639.git.kaiwenx@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=kaiwenx@rivosinc.com; helo=mail-pf1-x429.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

This adds the properties for ISA extension smcntrpmf. Patches
implementing it will follow.

Signed-off-by: Kaiwen Xue <kaiwenx@andrew.cmu.edu>
Signed-off-by: Kaiwen Xue <kaiwenx@rivosinc.com>
---
 target/riscv/cpu.c     | 2 ++
 target/riscv/cpu_cfg.h | 1 +
 2 files changed, 3 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 9339c0241d..31a1862561 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -132,6 +132,7 @@ static const struct isa_ext_data isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(smstateen, PRIV_VERSION_1_12_0, ext_smstateen),
     ISA_EXT_DATA_ENTRY(ssaia, PRIV_VERSION_1_12_0, ext_ssaia),
     ISA_EXT_DATA_ENTRY(sscofpmf, PRIV_VERSION_1_12_0, ext_sscofpmf),
+    ISA_EXT_DATA_ENTRY(smcntrpmf, PRIV_VERSION_1_12_0, ext_smcntrpmf),
     ISA_EXT_DATA_ENTRY(sstc, PRIV_VERSION_1_12_0, ext_sstc),
     ISA_EXT_DATA_ENTRY(svadu, PRIV_VERSION_1_12_0, ext_svadu),
     ISA_EXT_DATA_ENTRY(svinval, PRIV_VERSION_1_12_0, ext_svinval),
@@ -1753,6 +1754,7 @@ static Property riscv_cpu_extensions[] = {
     /* Defaults for standard extensions */
     DEFINE_PROP_UINT8("pmu-num", RISCVCPU, cfg.pmu_num, 16),
     DEFINE_PROP_BOOL("sscofpmf", RISCVCPU, cfg.ext_sscofpmf, false),
+    DEFINE_PROP_BOOL("smcntrpmf", RISCVCPU, cfg.ext_smcntrpmf, false),
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
     DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
     DEFINE_PROP_BOOL("Zihintpause", RISCVCPU, cfg.ext_zihintpause, true),
diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
index 2bd9510ba3..424246cbec 100644
--- a/target/riscv/cpu_cfg.h
+++ b/target/riscv/cpu_cfg.h
@@ -69,6 +69,7 @@ struct RISCVCPUConfig {
     bool ext_zihintpause;
     bool ext_smstateen;
     bool ext_sstc;
+    bool ext_smcntrpmf;
     bool ext_svadu;
     bool ext_svinval;
     bool ext_svnapot;
-- 
2.34.1


