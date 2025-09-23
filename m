Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53A03CAC5A7
	for <qemu-riscv@archiver.kernel.org>; Tue, 23 Sep 2025 02:41:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v0swY-0004HC-1b; Mon, 22 Sep 2025 22:39:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v0swO-0004EC-GH
 for qemu-riscv@nongnu.org; Mon, 22 Sep 2025 22:39:41 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v0swG-0003gw-Au
 for qemu-riscv@nongnu.org; Mon, 22 Sep 2025 22:39:38 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-26983b5411aso36155935ad.1
 for <qemu-riscv@nongnu.org>; Mon, 22 Sep 2025 19:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758595167; x=1759199967; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WtS+tUcTZk2GBqf6yxqhjiU0irGyIDNvqIFdhqaZrSY=;
 b=wwyDa6JkLfuLYwBHIc8zEiL39+DMOFgA8u6f9Y7p/++TqfwKw20od+LOsdtvKh/cOV
 gQp/eSIAGhu8Ssm3+TIwVRKs90Vm05o8Js58buuuAedvLy60LdysavT6l5+5wtTzSIXW
 HlsG4RWAh3hVBfZIYn7VgdnUB8c1xa0wOcwXx3ac0+CtYnzTtkiB2pTZUPIFPHwgrahR
 GOyRuohSFDzpvwGUJG0RQnpEza4L1VWiFIJBuU6ZfcYq9pKhZHoKycesSsBqd+oWGRGW
 OoEljtf4QotrMxOEzonSjKy1Xu4DwEyimbv0QrH2s5G+NoyIDZb+uIGkUPMgjPILc4eK
 u0ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758595167; x=1759199967;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WtS+tUcTZk2GBqf6yxqhjiU0irGyIDNvqIFdhqaZrSY=;
 b=NRJCJkjtZL0xh774yHE/Bh/W3V4Uc9QCdrVbRA5C3kmIQKh+LvxdqmRvkCL1i9Jfr6
 Oc4xjey7+cigc7LE3F8VjOzQdnDdhyeqBZUUL2qXomKxvUURArj9lVnNwCQ2hrGYwu4E
 8yHfttThib68G6Q+LGZnnQhe+ED76258ux+vLfvQaOVVikhXTOOt5Wjd3dinTaC3Og/2
 O5970HYqFeDET85A9UCGJaoBS/xR3gMlHy/edtL1LTpTeI1ofqYQRaW4w212pgEhMTN3
 GJ6APTgl6cmhLsjCwxWTv2F8Q96mXPKsex0yIn91kWFln8sUhftAQz66AXGOpnBsSjVf
 TKqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNTAjvgSb4Xhg8/dTWc/IxZzYs43vfzmjUhgR+4u2M+3Voxog29kp+tjcMbWxFwDCRptYv29DMmKJu@nongnu.org
X-Gm-Message-State: AOJu0YwvepYvy2unKC0OxpOzw1PsYd61kb1jhY5LjcBby5oIeXtnKEQS
 HWqUQyI3D9ZYTAqy4QPkwl5cSVIbE71WxtRYUFItuBGRXBY6bpArR53vLcuVF7H6AXk=
X-Gm-Gg: ASbGncsuIGR8HVcwaIy+qI49JF0YfC3kNi6WiiiP0IMD2ABTvW0MMsLU5P0Wr3kX19d
 bPUYtbhA2ZvIpB9zOZp8DE/2Nkj+r/Mty4Y+9KA8hB98wZ38Wrw0N0ISWHHbCe4RKo5HgjRuvFb
 pdSLpKKDyCjB3HlsUS5JrJOy53DejLfCy7rB1tpRzXLSqReU3+NP8OZRE34pSDnF+FJs/LOxidw
 7luHg0DY6OjP17Wt84HCxEwgA1ROHURjEzX9sAGsI351BEsQWQ6KKRf80+/lwOxYSpWS3lHods+
 YRhUK1jPgr6ObXdyE/9wJy86OPYO3QcaKtd3K0gTtR7E0/8KfrngXLp83x7IztS8zjwMsgcuB++
 4A/V76b1c1sYrQIEjopWZMHKjJfge
X-Google-Smtp-Source: AGHT+IFhdkBYZJ64ekLETcR0+kLRvIW8hmVQeZ3JUqgpSGj4LuHeM+ubYQVBCmKgaFBEgQRM79KwiQ==
X-Received: by 2002:a17:902:ef4c:b0:26e:62c9:1cc4 with SMTP id
 d9443c01a7336-27cc1197880mr10617925ad.4.1758595166932; 
 Mon, 22 Sep 2025 19:39:26 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-77f0da43089sm9899622b3a.90.2025.09.22.19.39.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 19:39:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org
Subject: [PATCH v2 04/12] target/riscv: Record misa_ext in
 TCGTBCPUState.cs_base
Date: Mon, 22 Sep 2025 19:39:08 -0700
Message-ID: <20250923023922.3102471-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250923023922.3102471-1-richard.henderson@linaro.org>
References: <20250923023922.3102471-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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

The tb_flush within write_misa was incorrect.  It assumed
that we could adjust the ISA of the current processor and
discard all TB and all would be well.  But MISA is per vcpu,
so globally flushing TB does not mean that the TB matches
the MISA of any given vcpu.

By recording misa in the tb state, we ensure that the code
generated matches the vcpu.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
Cc: Alistair Francis <alistair.francis@wdc.com>
Cc: Weiwei Li <liwei1518@gmail.com>
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Cc: qemu-riscv@nongnu.org
---
 target/riscv/csr.c         | 3 ---
 target/riscv/tcg/tcg-cpu.c | 3 ++-
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 8842e07a73..3c8989f522 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -25,7 +25,6 @@
 #include "pmu.h"
 #include "time_helper.h"
 #include "exec/cputlb.h"
-#include "exec/tb-flush.h"
 #include "exec/icount.h"
 #include "accel/tcg/getpc.h"
 #include "qemu/guest-random.h"
@@ -2173,8 +2172,6 @@ static RISCVException write_misa(CPURISCVState *env, int csrno,
         env->mstatus &= ~MSTATUS_FS;
     }
 
-    /* flush translation cache */
-    tb_flush(env_cpu(env));
     env->xl = riscv_cpu_mxl(env);
     return RISCV_EXCP_NONE;
 }
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index 78fb279184..143ab079d4 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -191,7 +191,8 @@ static TCGTBCPUState riscv_get_tb_cpu_state(CPUState *cs)
 
     return (TCGTBCPUState){
         .pc = env->xl == MXL_RV32 ? env->pc & UINT32_MAX : env->pc,
-        .flags = flags
+        .flags = flags,
+        .cs_base = env->misa_ext,
     };
 }
 
-- 
2.43.0


