Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20445CDB47E
	for <qemu-riscv@archiver.kernel.org>; Fri, 13 Oct 2023 11:02:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qrFvg-0000Ol-Dk; Fri, 13 Oct 2023 07:02:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1qrFvO-0000Ii-OK
 for qemu-riscv@nongnu.org; Fri, 13 Oct 2023 07:01:53 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1qrFv9-00028F-0Q
 for qemu-riscv@nongnu.org; Fri, 13 Oct 2023 07:01:46 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40651a72807so20312715e9.1
 for <qemu-riscv@nongnu.org>; Fri, 13 Oct 2023 04:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697194888; x=1697799688;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wiq5mYEHEn3DJSzjIjqQH0t31AsiITQ4TuY7AydRTuI=;
 b=woW+taUr7jw52HjELew9KAFAEnC3fK3Afdxdia4ruxwYFF78RUORX1h4bMEmIR1khV
 yfFc8FlwAvB6wUCUodzhsm2/ATPH6NAaTfJum4gR/OlCqpwNnImninJHpcagsxD2Dsy8
 JAUwcuUpGqcNnlyHEl+P1a/eSkFEcH4bz66osjYDwmJjG8gcG7JuMOCYFOXzasIsMGiz
 El7MnvAfQo7SagiacmN1lJuHDg8kkHAqc2ViDsrBOgCZzuzT3u3tBL6pwYCKWd1wRbfZ
 ZrnUa/Vvc2fWQVKoMdl8x3qXz389+JTTKQErOByC9y3SerOubWj/cXuwRGWAacMNEjMa
 0QTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697194888; x=1697799688;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wiq5mYEHEn3DJSzjIjqQH0t31AsiITQ4TuY7AydRTuI=;
 b=LrhZopNlb8QHC/h+24cwheqR54CH6ZmPRxsTn5Tb+FP/mz9nJDTli5+RdIcvDhZmcr
 qnmXbXpgywEDANHGE2dosO5pR8rdYlKyRFCt5JGjXkh0pZz/zKZo0YkZOGT1kDwSJsb5
 BM5WgPzhSeKEXglttYZH4FvewZmXZqOroRLT2AtVhSiw7zqCRTQoLVAdoAY0tB7pm9i1
 JWJcWDgNFWVyewAu1l/xOlc0+ewlkaBK1SipnqIhOOZvFZ4jIR97dz/68kemMQVbxtro
 1RRceKq3kx7ke8u5W2hR01egvMXamIPMZSNgDjBt6iTwHqr0rmNJ0SKw1U5Hg1pvjVVY
 3lDg==
X-Gm-Message-State: AOJu0YzmzxhmIOKqLLwTnxECv/hb/o3LJkMk8SbMlPfkjBwpjMFInMME
 iSioWan5Hyoq+URPORJL+ioKIAawZq88ty7iOnQ=
X-Google-Smtp-Source: AGHT+IFQVguXGtsTC1c6pAmwumLdkeP1nKzBm6PlV6v7YBNOO085m4T7iDXvDE6v2QvddiE4hX1CQQ==
X-Received: by 2002:a05:6000:110b:b0:31f:a259:73c with SMTP id
 z11-20020a056000110b00b0031fa259073cmr22491533wrw.27.1697194887820; 
 Fri, 13 Oct 2023 04:01:27 -0700 (PDT)
Received: from rockhopper.. (214.11.169.217.in-addr.arpa. [217.169.11.214])
 by smtp.gmail.com with ESMTPSA id
 p8-20020adfce08000000b003271be8440csm20455185wrn.101.2023.10.13.04.01.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 04:01:27 -0700 (PDT)
From: Rob Bradford <rbradford@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, atishp@rivosinc.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 Rob Bradford <rbradford@rivosinc.com>
Subject: [PATCH v3 2/6] target/riscv: Don't assume PMU counters are continuous
Date: Fri, 13 Oct 2023 11:54:44 +0100
Message-ID: <20231013110111.34619-3-rbradford@rivosinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231013110111.34619-1-rbradford@rivosinc.com>
References: <20231013110111.34619-1-rbradford@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=rbradford@rivosinc.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
---
 target/riscv/csr.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 85a31dc420..4383805fa3 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -182,7 +182,8 @@ static RISCVException zcmt(CPURISCVState *env, int csrno)
 #if !defined(CONFIG_USER_ONLY)
 static RISCVException mctr(CPURISCVState *env, int csrno)
 {
-    int pmu_num = riscv_cpu_cfg(env)->pmu_num;
+    RISCVCPU *cpu = env_archcpu(env);
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


