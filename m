Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2287ECDB47E
	for <qemu-riscv@archiver.kernel.org>; Fri, 13 Oct 2023 11:03:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qrFvY-0000Kd-Kx; Fri, 13 Oct 2023 07:01:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1qrFvK-0000Hs-TT
 for qemu-riscv@nongnu.org; Fri, 13 Oct 2023 07:01:43 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1qrFvG-0002Hj-Sd
 for qemu-riscv@nongnu.org; Fri, 13 Oct 2023 07:01:42 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4064876e8b8so22750505e9.0
 for <qemu-riscv@nongnu.org>; Fri, 13 Oct 2023 04:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697194897; x=1697799697;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iINLba3Z9IRPyClB9itO+7onNYKObdnht5URrf2joic=;
 b=xkEl22lYMJW86pqpLEiYF8xRSkNDuuzi5u13mON/MPU5R1AHdu9Y2sYfP2u+b5LsPr
 YNnC89fH4rPbesRw9YBJ45UQaOoLMI4jz2GZu0A5CSJA/MBiR3JqYeWHYAPi3PZdUXVV
 drAgMQJy2y04eT8dtrPZQ9VEuZ0KsrisJpBIZ5ZUuGx9VA+16WjX2Rnwaik3YnvFiyWB
 MdKlO7cTKbBfcgzA5lR2xhM+EgKLV63Es9G8JeuPi50SFAIWqSbaNwAO4h0aUmMH69zL
 tojMvUEwcCgD6jrfxz/26Rh3CNMuXdA8DWRVsIltWyvIzH9r5IeHmIIxhPQ4EtYZ+9kE
 c++g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697194897; x=1697799697;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iINLba3Z9IRPyClB9itO+7onNYKObdnht5URrf2joic=;
 b=kNUSMqAVMmA8kC6hhnrIHtx5YDi928EXdcl4hL+hZ/wzNZPfIsBIyGWEWgy2CpIWp6
 RHJ/mJo0MZP/ylGtYDaCtcVTh5DapxQcxI6W1ZGEMT5NESWP1G5lkYa9x4kpa4kXHVCz
 3vYxTmmZMqZWLzMUBQJccl+hVMU2s8yZYTVhIJ4X6/8CanT0tQq2JIWAD/8l/2S/NA0v
 ekwtXyFhJNSIciJflnuUjUU7vtqRH2v7IOskCnDjSvY7k6BKrfpHnSA9wJx/v0PLA+d1
 zzRe5c0aNCYRUASYujqyO2pliAZodNT0XLahRJvWuZqeqE7THAFd3/jl93TmOo8vJpaD
 F8Ig==
X-Gm-Message-State: AOJu0YxZq3ptGMERVqBeAB9OATj+a72jGiQGfGoiE3fh4yaSSopWXhoz
 Z5auJal0VI+lTUAeR+/sENLkKA==
X-Google-Smtp-Source: AGHT+IFcI+6OY+haosN8G/SBb++UYo3pMErPptRA0Ak8u46NlvDD3LePkXqeiHLxn72w3kvlzgfobg==
X-Received: by 2002:a05:6000:cb:b0:321:7050:6fb6 with SMTP id
 q11-20020a05600000cb00b0032170506fb6mr21299814wrx.67.1697194897383; 
 Fri, 13 Oct 2023 04:01:37 -0700 (PDT)
Received: from rockhopper.. (214.11.169.217.in-addr.arpa. [217.169.11.214])
 by smtp.gmail.com with ESMTPSA id
 p8-20020adfce08000000b003271be8440csm20455185wrn.101.2023.10.13.04.01.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 04:01:37 -0700 (PDT)
From: Rob Bradford <rbradford@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, atishp@rivosinc.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 Rob Bradford <rbradford@rivosinc.com>
Subject: [PATCH v3 6/6] target/riscv: Use MAKE_64BIT_MASK instead of custom
 macro
Date: Fri, 13 Oct 2023 11:54:48 +0100
Message-ID: <20231013110111.34619-7-rbradford@rivosinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231013110111.34619-1-rbradford@rivosinc.com>
References: <20231013110111.34619-1-rbradford@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=rbradford@rivosinc.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

A 32-bit mask can be trivially created using the 64-bit macro so make
use of that instead.

Signed-off-by: Rob Bradford <rbradford@rivosinc.com>
---
 target/riscv/pmu.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/target/riscv/pmu.c b/target/riscv/pmu.c
index 9253e5f17a..052d5b1164 100644
--- a/target/riscv/pmu.c
+++ b/target/riscv/pmu.c
@@ -25,8 +25,6 @@
 #include "sysemu/device_tree.h"
 
 #define RISCV_TIMEBASE_FREQ 1000000000 /* 1Ghz */
-#define MAKE_32BIT_MASK(shift, length) \
-        (((uint32_t)(~0UL) >> (32 - (length))) << (shift))
 
 /*
  * To keep it simple, any event can be mapped to any programmable counters in
@@ -455,7 +453,7 @@ void riscv_pmu_init(RISCVCPU *cpu, Error **errp)
     /* Check if user set it by comparing against default */
     if (pmu_num != 16) {
         warn_report("\"pmu-num\" property is deprecated; use \"pmu-mask\"");
-        cpu->cfg.pmu_mask = MAKE_32BIT_MASK(3, pmu_num);
+        cpu->cfg.pmu_mask = MAKE_64BIT_MASK(3, pmu_num);
     }
 
     cpu->pmu_avail_ctrs = cpu->cfg.pmu_mask;
-- 
2.41.0


