Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1123C02183
	for <qemu-riscv@archiver.kernel.org>; Tue, 14 Jan 2025 09:38:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tXdMY-0000Uv-At; Tue, 14 Jan 2025 04:37:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1tXdMI-0000TS-KT
 for qemu-riscv@nongnu.org; Tue, 14 Jan 2025 04:37:15 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1tXdMD-000506-3K
 for qemu-riscv@nongnu.org; Tue, 14 Jan 2025 04:37:14 -0500
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-2162c0f6a39so111545525ad.0
 for <qemu-riscv@nongnu.org>; Tue, 14 Jan 2025 01:37:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1736847427; x=1737452227; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=w/J421GUH7Mao74hk7jOCSi+yLl4BP1uUp1Mb4ir/rU=;
 b=Uol8f4mQYZ25V2K4DaE0M9oBhMeRhsffkvy61/KQBLBI44dIAyMHFwHJwGpyj0Cn6/
 BEh8EUe6HNp8f0p0bjh4rU+fS2WUo00wwEgH0YNGXGUdk2SaLvIzd7eLLUZKmh9Dj+CU
 WA89DM/YnGZv5MyaDV0whW5R6VwmxQpFas4sV1rlqtURXqxJwgZiQp5W2yxFRa+EMyWe
 r/TqCwfPooSiRx172fp6q/gL9S+PbQBLdFZU4vbrL5C2zv9aU+oLYeniI+XQx1r2HO9v
 OaiFmo+PvR3vosxXy1rFZ2eg9ebur6AT2SSUV/tOg6FLrhp8BVfABCtQWXiHWLT0QZJR
 d/Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736847427; x=1737452227;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=w/J421GUH7Mao74hk7jOCSi+yLl4BP1uUp1Mb4ir/rU=;
 b=XCjRVY40iKtv7ArJST0k+kETpKlTMrRJtv312otEuuvwy45bEMIE2yrMjVtL5lG7CS
 VKa857a5wVcjGlc86k+SuG2J4nYwXDh+EPdEqDJEH/FlHK1SmvFfLBd1uzM9ewpiJstP
 DyA8QBswSaS4tHddlBoJqpE/t5C/ys2witasY2BLam6AR6AMTLay+OOq8V91FvHaJAd3
 j+4OOemyWG89kS2VuJKIhN1sgEDi/Jne5E7st+zOJ60eIbebf6cwoSuT5pYHyHsOLMGV
 8TdxrDimV7dT/o+Hs+vjL5VEOsVVqpfDhxROKsgiZV5PyFoScSYDNXYhLP+HuB5JECTk
 HtTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwRSzsXnDnm/4YwIu19HJCmTiATP2gyOYKjJWX0H/Kt5u7U7W8NhxETPTywDRDQYrv8R3YC49BftSt@nongnu.org
X-Gm-Message-State: AOJu0YxLhKQvfTrOYyky8YrtlKawxSiXdALzNuerVS/WJiEEO+McxKDu
 BB/LWOnGpbbMAEmQYbsIA7ITq+RmlLRkXeh9yhkT67vKpAEXdXSJvxIFjMs2UWI=
X-Gm-Gg: ASbGncsrzk8U9N8GFw/kXLFk1Mbp/Az7ltxYjmFG3UZB5IokyXOpaxV3aXuUOjMZez0
 iarfoNaXwtQPrbQV5ys55rxRz7oRKvsgb1miAy8ZBUd57Il0SU1tYcLl/b+ubRAp9Hdx1B7sB0x
 otq5oOHawoq6Aa3X5fAk/RuVeq35OoyQDdpdS2i6mb7vvocvnYjnILGJo4GCUw9nmggEUNNrtgr
 zLUH4ykK3DRwShREVIq+UrM5TmwdFc2/7yoN9g8h4dZQP2rAcUM+DiVHoAv7IY10j1b5TtnYX5a
 CyE04ogE
X-Google-Smtp-Source: AGHT+IEfFytGMS3sZIXK8rwGevqErUOvVDSCaSQoav987u4WTQMho52KEY473oivczemVOQpz5iZhw==
X-Received: by 2002:a05:6a20:c896:b0:1e1:ad7:3282 with SMTP id
 adf61e73a8af0-1e8b13d1ed6mr27046085637.7.1736847427183; 
 Tue, 14 Jan 2025 01:37:07 -0800 (PST)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72d40658dccsm7300718b3a.92.2025.01.14.01.37.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2025 01:37:06 -0800 (PST)
From: Jason Chien <jason.chien@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Jason Chien <jason.chien@sifive.com>
Subject: [PATCH 1/2] hw/riscv/riscv-iommu: Remove redundant variables
Date: Tue, 14 Jan 2025 17:36:45 +0800
Message-ID: <20250114093647.4952-1-jason.chien@sifive.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=jason.chien@sifive.com; helo=mail-pl1-x629.google.com
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

Signed-off-by: Jason Chien <jason.chien@sifive.com>
---
 hw/riscv/riscv-iommu.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/hw/riscv/riscv-iommu.h b/hw/riscv/riscv-iommu.h
index 9424989df4..fa8a50fa24 100644
--- a/hw/riscv/riscv-iommu.h
+++ b/hw/riscv/riscv-iommu.h
@@ -58,11 +58,6 @@ struct RISCVIOMMUState {
     /* interrupt notifier */
     void (*notify)(RISCVIOMMUState *iommu, unsigned vector);
 
-    /* IOMMU State Machine */
-    QemuThread core_proc; /* Background processing thread */
-    QemuCond core_cond;   /* Background processing wake up signal */
-    unsigned core_exec;   /* Processing thread execution actions */
-
     /* IOMMU target address space */
     AddressSpace *target_as;
     MemoryRegion *target_mr;
-- 
2.43.2


