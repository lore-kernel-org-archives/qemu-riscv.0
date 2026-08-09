Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BD62C5AD2C
	for <qemu-riscv@archiver.kernel.org>; Sun,  9 Aug 2026 01:35:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wssQG-0000Mj-4M; Sat, 08 Aug 2026 21:33:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wssQE-0000Ld-U1
 for qemu-riscv@nongnu.org; Sat, 08 Aug 2026 21:33:54 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wssQD-0002Lf-7X
 for qemu-riscv@nongnu.org; Sat, 08 Aug 2026 21:33:54 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-38e88b60121so644530a91.3
 for <qemu-riscv@nongnu.org>; Sat, 08 Aug 2026 18:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786239232; x=1786844032; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=4jhjL0sYTcEwoMlXIeDPnxkRkvt5ThgU+Lk3I6u8abI=;
 b=PuL86wKbOZC8u14jEO2eNJ0m4SAW3TyFyF5L1LjyJIz7X7TrGUB+T5zzCi1D8b7Gcu
 H1abtRjcpzTsqiYYlmkxJH/Nep9JubWx1ZdwIxKdHpuVSOZrQJBh2/st+c/IurWOjMBB
 MUxlggBeJAJSIFhZ4Jm1fNp4QNR7rwTvyf75eIRYw3bXccobw93YFrt2ixhohlsrs4VJ
 q+oH0nRU40hf6K9eUOf/N9eyJK8x6+bm2mKChRuP1HZ2n4AN9AAXsI8ZauHH65vbtiYp
 K+W7yAbGay/yvIAXlJpzWeXri/F1Nz8eXqqU1ICLDrypNwgOQ24ugQkBXSXPRseefVNX
 aaEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786239232; x=1786844032;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=4jhjL0sYTcEwoMlXIeDPnxkRkvt5ThgU+Lk3I6u8abI=;
 b=k2ixzG4KuHIKz7JV3dTUJ3r9OPa3UTqXmV3GVghvEEurE/goLSomNdVuxC0FIxaeKe
 bHWb6uy5v3BhpnRGjrUuDYLxT+bWuZB/OjrzM1pKnCNZFHRP1NmCvt07HkLQLCBbypFE
 jYxPB23ka4V1MddHRzUkF8eeVdXl6eKwbMquBYSYJDYuRhDwSkP/oPSbG8oFRQ/gMpo2
 XYefmRm42RCDKfzPC5Gw/5ZI+KJ5hb8SYkta01fwf1MQo/dKD4KNgwm1QhKHxwwh2/CL
 /0okS3HD4p2qV5JF0Fck6+0UxkHMb+OxioFjVBGBWQvsNo/LMAPw6LEJBs/8eb7JI2gD
 wzCA==
X-Forwarded-Encrypted: i=1;
 AHgh+RqmzZnvvxy9ZOMMPHX6oe+94h26mQQZhPkI9kR4X+qEo/RrMlr38ffyo/syo9VCOKbrtZTCnTrtppuy@nongnu.org
X-Gm-Message-State: AOJu0YxTkCAJ1zPQwbhwPYGLDq/jlkqumAXCdpK3OratYmqJE+oMkl46
 w1jljEF0niFJmRqPtsh4Nv4a7MaYNXu6fwD/2GHoBvBdstK0SGYzvKS9eWUI5d6qxwE=
X-Gm-Gg: AR+sD10cvPrcZDCW3FyMrqXRsXUKwc0TLctZUTFTpSXQyKpADZEMhvKLne2pf/pq79+
 0AN7qvxuADr0Mc2CiITNdPRuKXnZ0lPD9ejMVN5+NpRYFh1SVOOimKX0Z2NF0C0WHzNYiN5salH
 TcWAA4hiXc53zXcYTuA19sS4w/F5ITDp5m7iF4laXH1s3OK1nPZHKyknTAgOCAzthMHDBMAr0KD
 JXjWKVjOMSF65DxvVEyqwb2K6hE0/zaLeuREQUktpVH4wod+MGwE6UM0prhraSwGcmOkaeHJo9+
 8opDu8K8m98cGwLs8wNekyjOKoXKIfrT8zRnpf6QWOHGBB55ISY7p3w0iHOVA/FC5n3aMvvcuM2
 VxSrJzItejBXeaH3xLeRSZhn+9bxqEAXiiym/S6z34TFY/8aVbh0odF6RWMgcXWVtpaOIx20zrt
 z8H9RLHKdFLFWBNxX1EzxcRrOmy9nl+6+pdSZz+q8K13lGhqv6XeufmuzN8wufwVWw9i62ORUX3
 UGohPlXgYE4O9aalEs2
X-Received: by 2002:a17:90b:4c84:b0:381:c500:b0d1 with SMTP id
 98e67ed59e1d1-39282554a40mr9570798a91.20.1786239231660; 
 Sat, 08 Aug 2026 18:33:51 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-39085de8ddcsm10067927a91.6.2026.08.08.18.33.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Aug 2026 18:33:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: 17746591750@163.com, laurent@vivier.eu, philmd@mailo.com,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH 6/9] target/loongarch: Enable disassembly via capstone
Date: Sat,  8 Aug 2026 18:33:40 -0700
Message-ID: <20260809013343.664966-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260809013343.664966-1-richard.henderson@linaro.org>
References: <20260809013343.664966-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/disas/capstone.h | 6 ++++++
 target/loongarch/cpu.c   | 8 ++++++++
 2 files changed, 14 insertions(+)

diff --git a/include/disas/capstone.h b/include/disas/capstone.h
index db1abe7f70..a922f7627f 100644
--- a/include/disas/capstone.h
+++ b/include/disas/capstone.h
@@ -40,6 +40,12 @@
 
 #endif /* CONFIG_CAPSTONE */
 
+#if CS_API_MAJOR < 6
+#define CS_ARCH_LOONGARCH       -1
+#define CS_MODE_LOONGARCH32      0
+#define CS_MODE_LOONGARCH64      0
+#endif
+
 #if CS_API_MAJOR < 5
 #define CS_ARCH_RISCV           -1
 #define CS_MODE_RISCV32          0
diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index fb03424ffa..7007622630 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -29,6 +29,7 @@
 #include <linux/kvm.h>
 #endif
 #include "tcg/tcg_loongarch.h"
+#include "disas/capstone.h"
 
 const char * const regnames[32] = {
     "r0", "r1", "r2", "r3", "r4", "r5", "r6", "r7",
@@ -694,8 +695,15 @@ static void loongarch_cpu_reset_hold(Object *obj, ResetType type)
 static void loongarch_cpu_disas_set_info(const CPUState *cs,
                                          disassemble_info *info)
 {
+    CPULoongArchState *env = cpu_env((CPUState *)cs);
+
     info->endian = BFD_ENDIAN_LITTLE;
     info->print_insn = print_insn_loongarch;
+
+    info->cap_arch = CS_ARCH_LOONGARCH;
+    info->cap_insn_unit = 4;
+    info->cap_insn_split = 4;
+    info->cap_mode = is_la64(env) ? CS_MODE_LOONGARCH64 : CS_MODE_LOONGARCH32;
 }
 
 static void loongarch_cpu_realizefn(DeviceState *dev, Error **errp)
-- 
2.43.0


