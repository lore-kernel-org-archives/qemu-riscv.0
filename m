Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1911FCA0FF2
	for <qemu-riscv@archiver.kernel.org>; Wed,  3 Sep 2025 14:04:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uto5I-00034V-BB; Wed, 03 Sep 2025 10:03:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1uto5C-00031h-6X
 for qemu-riscv@nongnu.org; Wed, 03 Sep 2025 10:03:30 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1uto5A-0005tA-Nh
 for qemu-riscv@nongnu.org; Wed, 03 Sep 2025 10:03:29 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-24c786130feso13333665ad.2
 for <qemu-riscv@nongnu.org>; Wed, 03 Sep 2025 07:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1756908207; x=1757513007; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q7yO8ADA0pol4cy8ipnt6jQ+4uDi0a2eWjgPSJWFAag=;
 b=XBA/vhhha7Tb7vCBmP6x6mUGW35xJrYYDp/UI0+KoNj6F2CwlW0773lQEnMEFoX0j3
 b+wcv+tDK+hSj31+dm/fJ1jNghc5UUk+bAoQQAT7HC/zNuYqnMEHwz6656Or1H0SgVtT
 W3zqriR8R1ThSbZvPe5kRp+vdrBQxVKgBW+9EPAk2J8Nc1hJN/Sg0SNFt+4KS7CXEDNH
 wlD1ejg2PE/hJi9avBTBNwovlwIzdQCZDaxeRubL3I7d44rzzhO4kjGU0UXC8Q5MH31w
 aKJKBck3dKFyWEqGG1MfIWvjyMg38kS5LYx9Iy2ip0Kb8PXZKnBT2TukqhjIpyfK4MAe
 ZbRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756908207; x=1757513007;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q7yO8ADA0pol4cy8ipnt6jQ+4uDi0a2eWjgPSJWFAag=;
 b=eBRq+r0QLlbnAQsnNhdxqs9oK+lWWA49yJgY1LvT7o0pFerzWfo6AV+V1jJQtFTym0
 VV85cBopzT1NDkmpTxGD4TWej4KXn58KLrM+GXKx76s6Dcyr7nZ6CjnvbLw+md+EnWn/
 EUt8JEpUareiaFkxnwKUI3g+lwQrklXXOQiLWYdY0yq2JR53YvEwlzbaxVsXW6zDVWsC
 R4BkJwMhidmmaGLdLKBKysP8JKFgM31wceuLYKYNfQkJvEp0LOKWGfzJqqSifoKxAhjw
 1CRpZbkuKmdRz8RLBgnJZgWL3TnjyXBCyUg+OFlKHGdYO90JcXE92cNIuO33WRorXzuq
 G86A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfxgaA1okDA1cqD8qZaODRtLOVFgiK6u5d9YN9u392eUjYZFNmh/suhK+rM5WGH84XA/I+Wm0fjSbN@nongnu.org
X-Gm-Message-State: AOJu0Yy4Mms40J6TuubJrTRRTHL/oXteWXiV6vanSKBwAZRlOnkROyV/
 DqZbvdfEdeHAMo3LmODPTIN5dvYk75MnTnswiEKEecRPqqGjbg6kuP8kNau8BcOGZKg=
X-Gm-Gg: ASbGnctdUqGwP1vKd8xULHCDoVsyY2ccbrNAHEYSYPG6n/dbHCyHf+WCdMkX++W1I1/
 9y+jBO7fujT0HFrwwJONRel4LSLXU4RMmWWv+Mh7YMpo2eICK4K9Tn6VOMPG2jVTUQGMKsqKukz
 s/V68IGk0qII25/HaGY90nZ30iUDPavIf19VKW49t9LENySr96+VxcnyJFg1AzWrmVCFkMYvRww
 AVeuldq/U+hT8okb8VgoaNDr9ezngcb8fc5wrGI5x9EfGEw8vvHB7XaRArVaBritS6QxiaAJS9K
 /lQgNAEkKXwl7e+btnOdHtUTJmo96jgPscn+WLMEDWLqIbQT+BpAbmsXhcsWFnegLpgbZtfSNo9
 FtwV30b2254LqunMlnIr0Ad06CYcvck6/DbDKVxRSPtlzJrRVW9zjNPzWJUZ5md/bRFSFcxCdE+
 tchg==
X-Google-Smtp-Source: AGHT+IFp1z8hnynSiwSV+34+CkKSuU/DNEso0oDkvNmZ597dU5eMU07lZKG0MnNOkgmr76Cr09eoDg==
X-Received: by 2002:a17:903:41c9:b0:249:147:95bb with SMTP id
 d9443c01a7336-249448de13fmr166549455ad.13.1756908206165; 
 Wed, 03 Sep 2025 07:03:26 -0700 (PDT)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-24b14e1b097sm50720545ad.21.2025.09.03.07.03.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Sep 2025 07:03:25 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, richard.henderson@linaro.org,
 Max Chou <max.chou@sifive.com>
Subject: [RFC PATCH v3 3/3] target/riscv: Expose Zvqdotq extension as a cpu
 property
Date: Wed,  3 Sep 2025 22:03:08 +0800
Message-ID: <20250903140308.1705751-4-max.chou@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250903140308.1705751-1-max.chou@sifive.com>
References: <20250903140308.1705751-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=max.chou@sifive.com; helo=mail-pl1-x631.google.com
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
 target/riscv/cpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 95edd02e68..ed486113ba 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1373,6 +1373,7 @@ const RISCVCPUMultiExtConfig riscv_cpu_vendor_exts[] = {
 /* These are experimental so mark with 'x-' */
 const RISCVCPUMultiExtConfig riscv_cpu_experimental_exts[] = {
     MULTI_EXT_CFG_BOOL("x-svukte", ext_svukte, false),
+    MULTI_EXT_CFG_BOOL("x-zvqdotq", ext_zvqdotq, false),
 
     { },
 };
-- 
2.39.3


