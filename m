Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECC81C54E41
	for <qemu-riscv@archiver.kernel.org>; Wed,  6 Mar 2024 09:58:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rho1v-0002QW-Lq; Wed, 06 Mar 2024 04:57:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1rho1t-0002Px-T5
 for qemu-riscv@nongnu.org; Wed, 06 Mar 2024 04:57:42 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1rho1s-00020k-FE
 for qemu-riscv@nongnu.org; Wed, 06 Mar 2024 04:57:41 -0500
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1dd10ae77d8so26240345ad.0
 for <qemu-riscv@nongnu.org>; Wed, 06 Mar 2024 01:57:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1709719059; x=1710323859; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oQVkdDovKcLtziPgshMW+5hKXs4Qg3PZIFZWdDLHReI=;
 b=g8rPrBRFzNnz7Oi2doJQDvIXAG2Axl02B2IAS4WmhgyrB4i9HHSZGDqVRKhDyvkWHq
 Zyzhwx7ETG7TpWYOLFBOFbUUI7cwdbxEsMz8C3UgEJeJjmxcZLjguquoy0xlV0BAwUjp
 IodVMYEbgd3yzCsdWCHV2w9zC2dPdWfosb+QjDT/GZP7FtD7wXl5BGrCdiQKjK24+Kwu
 he57f0N7XgWLJsJBBgXCtYsfZYSrjipMDJnS+ZvE8saVN6PuAgGp2kgqru1ENWkULQYt
 EksRezmsvt9lSeBHGkjvsNb/hHHOI5qzBy7eYsWnEORa2S0Ieo2w6awFS+qJWW3NOfd9
 Jbew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709719059; x=1710323859;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oQVkdDovKcLtziPgshMW+5hKXs4Qg3PZIFZWdDLHReI=;
 b=IvD/ydYIfj7I5GatseWknmJ9Yseepz/sMWvL5zbM5+dAwhMu4hqX2itOLAkF+JDp2z
 7J7VYw5bpUW6gor5Dxqgs+SUCidELdySniyRPPBoa+S0IRU/jJDbD2RfZQmFm3AHINa3
 8VgZkBG6y8lfH4kbTZ7NsB/CzOeeW/QK3FgPifsb6HuxNa/TYlBRFauBGnUItqF1oYbr
 8uJJmmmoycqczrxS5HHDhJjtvPDwaOFvChL6jM1vcLWsOoZqFaaZV8ymep4l8RgNC2xe
 CnKQt/GGdNTPeSB7PoxmeNqV/lTywdBKrIqL+xxUTB98P8WYCn/pyBvFPDVh1ROKGJSj
 x8Bg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGbsiSyFoOruQpkcOW/aAPJ387uxcnEme4GzYIuRI5NXZiVHdzv/1Ni18q4Ije6uLaA0INjKja5jwPgH/XIY1T6V2etsM=
X-Gm-Message-State: AOJu0Yyz2m6GLpS/61LjQI9sR8e7iefcdrr4JzWZ94itlP7t0z328Zw2
 9+pSnC9ddIY4rEd7W/YQCYVRAECu5ifMayY1ljq06yT12DC/EQZQa5lMW8LLmLY=
X-Google-Smtp-Source: AGHT+IG6IhyLIX7kKk1tYwEMZMUnoe507MVHY9lM0pZ5ANquO5iHd4b/uIHQklmph4kmyZi1R40GnA==
X-Received: by 2002:a17:902:7c0f:b0:1d9:7e40:6c2b with SMTP id
 x15-20020a1709027c0f00b001d97e406c2bmr3762806pll.32.1709719059160; 
 Wed, 06 Mar 2024 01:57:39 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([171.76.80.45])
 by smtp.gmail.com with ESMTPSA id
 z15-20020a170903018f00b001d9a41daf85sm12126170plg.256.2024.03.06.01.57.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Mar 2024 01:57:38 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 2/2] hw/intc/riscv_aplic: Fix in_clrip[x] read emulation
Date: Wed,  6 Mar 2024 15:27:22 +0530
Message-Id: <20240306095722.463296-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240306095722.463296-1-apatel@ventanamicro.com>
References: <20240306095722.463296-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=apatel@ventanamicro.com; helo=mail-pl1-x632.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

The reads to in_clrip[x] registers return rectified input values of the
interrupt sources.

A rectified input value of an interrupt source is defined by the section
"4.5.2 Source configurations (sourcecfg[1]–sourcecfg[1023])" of the RISC-V
AIA specification as:
"rectified input value = (incoming wire value) XOR (source is inverted)"

Update the riscv_aplic_read_input_word() implementation to match the above.

Fixes: e8f79343cfc8 ("hw/intc: Add RISC-V AIA APLIC device emulation")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 hw/intc/riscv_aplic.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/hw/intc/riscv_aplic.c b/hw/intc/riscv_aplic.c
index 775bb96164..6a7fbfa861 100644
--- a/hw/intc/riscv_aplic.c
+++ b/hw/intc/riscv_aplic.c
@@ -162,7 +162,7 @@ static bool is_kvm_aia(bool msimode)
 static uint32_t riscv_aplic_read_input_word(RISCVAPLICState *aplic,
                                             uint32_t word)
 {
-    uint32_t i, irq, ret = 0;
+    uint32_t i, irq, sourcecfg, sm, raw_input, irq_inverted, ret = 0;
 
     for (i = 0; i < 32; i++) {
         irq = word * 32 + i;
@@ -170,7 +170,20 @@ static uint32_t riscv_aplic_read_input_word(RISCVAPLICState *aplic,
             continue;
         }
 
-        ret |= ((aplic->state[irq] & APLIC_ISTATE_INPUT) ? 1 : 0) << i;
+        sourcecfg = aplic->sourcecfg[irq];
+        if (sourcecfg & APLIC_SOURCECFG_D) {
+            continue;
+        }
+
+        sm = sourcecfg & APLIC_SOURCECFG_SM_MASK;
+        if (sm == APLIC_SOURCECFG_SM_INACTIVE) {
+            continue;
+        }
+
+        raw_input = (aplic->state[irq] & APLIC_ISTATE_INPUT) ? 1 : 0;
+        irq_inverted = (sm == APLIC_SOURCECFG_SM_LEVEL_LOW ||
+                        sm == APLIC_SOURCECFG_SM_EDGE_FALL) ? 1 : 0;
+        ret |= (raw_input ^ irq_inverted) << i;
     }
 
     return ret;
-- 
2.34.1


