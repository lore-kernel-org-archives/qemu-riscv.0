Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F337E75457
	for <qemu-riscv@archiver.kernel.org>; Tue,  3 Oct 2023 12:52:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qnesS-0007rW-St; Tue, 03 Oct 2023 08:51:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1qnesS-0007qo-5Q
 for qemu-riscv@nongnu.org; Tue, 03 Oct 2023 08:51:52 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1qnesE-00049i-SB
 for qemu-riscv@nongnu.org; Tue, 03 Oct 2023 08:51:51 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4053c6f0db8so8402205e9.3
 for <qemu-riscv@nongnu.org>; Tue, 03 Oct 2023 05:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1696337497; x=1696942297;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sxGT1Wl6J3xowqZP+oPYuTY8pg3VyoUcjhFPxfi6Z1A=;
 b=U22Eg+HK4m9Z2VsLfPNSNKLmKRp815/qG/que8XxdgAbrHkquZf9jSkgNaJLAPgvhu
 5bHG7zmvpQWog6bqfgqHasIKEDOeCLHdnqO4R8SG0vWYjvmMVOhb4RFVZqHzXbLx59NP
 Lfxr5QAfcFlOv9JRAS1vOjXilyBhZEu/Djsn2vC3KufGn/34KFqLRO4OE1mLixglaWDF
 MD0ba8hpetZMqdeyyx7JKku+HtDCBI+TdA6fzePqFImuddExLu9gn2XsH0ZYsbdtQZYJ
 o2w6ZZ+oZ/NvMqmxmv9elyffKDaLtGK2J7SQfS8GZKaaKibZIkXkvjjkRsXBxHTGEhjl
 XImA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696337497; x=1696942297;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sxGT1Wl6J3xowqZP+oPYuTY8pg3VyoUcjhFPxfi6Z1A=;
 b=Qfg4OTi5PYD5ld4YDtJjyQkzkGDIGyUnglULvJzcqfyWHq5DszC2ZmmUqi+2F3Re6h
 Co6/fYot6+EgVwDlP+6eFvMY9Fsh+0jSNNJoCkeCeCQVxVwIlxCQFVFAkEv0Fdw0kmYb
 wzMh2LT49K9wiNkpyenTQyb0DOEcTtZxHIvlkuQOv9KoYgJ6MLqPjIGKKVkpYOsyZaRK
 Dac1YgWvnK+u9dQHdZduUTGV/ntv23MlqcE0oRNG5us1Q25X/nOtj1IhyAPhK4UtsExA
 RBbuKiklkX9P4qUN/u4p0IQN9F8+oL+QUBJZj6jV2OkBLT9ywXXCBleHrUJLXpSVD82g
 1S0w==
X-Gm-Message-State: AOJu0YxV8Qq/56W7b/NSt0WmFphnRpnl5+7PNJJTy7iqZzzMNpsJpoD0
 pGS5T/ACiF8tQFB38Oo2wb85vg==
X-Google-Smtp-Source: AGHT+IFIQzKQOxT7BKOJyykQ09+ozYYXUA4EYFSwLz3/m2DmpqcQrF14+nBe+omb9QdgExVQH1DfAQ==
X-Received: by 2002:a7b:cbc9:0:b0:406:3f62:e591 with SMTP id
 n9-20020a7bcbc9000000b004063f62e591mr12315479wmi.41.1696337497593; 
 Tue, 03 Oct 2023 05:51:37 -0700 (PDT)
Received: from rockhopper.ba.rivosinc.com (214.11.169.217.in-addr.arpa.
 [217.169.11.214]) by smtp.gmail.com with ESMTPSA id
 l21-20020a7bc455000000b0040531f5c51asm1240335wmi.5.2023.10.03.05.51.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Oct 2023 05:51:37 -0700 (PDT)
From: Rob Bradford <rbradford@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, atishp@rivosinc.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 Rob Bradford <rbradford@rivosinc.com>
Subject: [PATCH 3/3] target/riscv: Don't assume PMU counters are continuous
Date: Tue,  3 Oct 2023 13:49:37 +0100
Message-ID: <20231003125107.34859-4-rbradford@rivosinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231003125107.34859-1-rbradford@rivosinc.com>
References: <20231003125107.34859-1-rbradford@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=rbradford@rivosinc.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Check the PMU available bitmask when checking if a counter is valid
rather than comparing the index against the number of PMUs.

Signed-off-by: Rob Bradford <rbradford@rivosinc.com>
---
 target/riscv/csr.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 85a31dc420..3e126219ba 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -182,7 +182,8 @@ static RISCVException zcmt(CPURISCVState *env, int csrno)
 #if !defined(CONFIG_USER_ONLY)
 static RISCVException mctr(CPURISCVState *env, int csrno)
 {
-    int pmu_num = riscv_cpu_cfg(env)->pmu_num;
+    RISCVCPU *cpu = RISCV_CPU(env_cpu(env));
+    uint32_t pmu_avail_ctrs = cpu->pmu_avail_ctrs;
     int ctr_index;
     int base_csrno = CSR_MHPMCOUNTER3;
 
@@ -191,7 +192,7 @@ static RISCVException mctr(CPURISCVState *env, int csrno)
         base_csrno += 0x80;
     }
     ctr_index = csrno - base_csrno;
-    if (!pmu_num || ctr_index >= pmu_num) {
+    if ((BIT(ctr_index) & pmu_avail_ctrs >> 3) == 0) {
         /* The PMU is not enabled or counter is out of range */
         return RISCV_EXCP_ILLEGAL_INST;
     }
-- 
2.41.0


