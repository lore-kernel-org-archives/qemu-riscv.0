Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04F22C4167D
	for <qemu-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 22:48:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qygRi-00079i-FE; Thu, 02 Nov 2023 18:45:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qygRZ-0006k2-TQ
 for qemu-riscv@nongnu.org; Thu, 02 Nov 2023 18:45:41 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qygRY-0003VO-C3
 for qemu-riscv@nongnu.org; Thu, 02 Nov 2023 18:45:41 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-5b31c5143a0so17992197b3.3
 for <qemu-riscv@nongnu.org>; Thu, 02 Nov 2023 15:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698965139; x=1699569939; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bgD8BAJnIDmTlfiEkg+MaoRaVU+r3sI852Nxw01w8Tg=;
 b=I6V7kBq/ATmTbN0chGjIfTp8kb6jTSLLS+X3oiIdQ0nCX4HV8eqzNuf+bDyFm+XUO8
 tRcKeo/xMjlCrEwW523RgPI38djaKl0yVaG20TRaWRkCssjSz3bwlmg6EnLnEM9Eim9y
 bJ4wwJrbf9D1vksS1JmmPbPMwOu8PhjPkGFM2ouuzjI+C/29A1QgWMfgcJ/h/0uToKsP
 cvFVhvQf3Lby2KlPYpf3wdADTTw6GIO0TP1IuqjvkHIb1Suc1PXZLyfA7xfFvM4jJs/0
 pXLP09UdKPsgddnKisibO2gR7fitUF2E+Pp+Gn1Y1Z3Zm9myn9kVVJgDmDmBQjyJuai0
 H5vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698965139; x=1699569939;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bgD8BAJnIDmTlfiEkg+MaoRaVU+r3sI852Nxw01w8Tg=;
 b=Theh4rPt1ckq3MzAw3kOn84svBq4eXMiet0bEt/CRHv2XHCcEzyhoaX0yBzaLc/8qe
 Ajc8B3zlTigZvFKOw2RVnlnJJLsDi/9KyOanLW6NLU8H1Q5qVQAfU5HWKfVlPWm8tVNq
 pCTLcxkalad6kQnfkWofi5dVfpQkbfDnnRTUy9Cf6f5BzHQOAV6d5f5w46EDPGQ+cRQS
 nbMcDPkmR8D/o+rl1Fnng7lmgoQBclx2503gwqr92385JPqxkXQEBuJlYTEx6RVAUMm3
 Xf1XdQ4J2VY9Z0MwsyofrpKb+lNwkFIzRhlE4aRD+nuWrDSBmxFltJk75iBYr1vuPru8
 wsnQ==
X-Gm-Message-State: AOJu0Yz/9onUI/5kBCwzU3/iTxz6raJ9/FfNmxbbXbM5/RdmTlMAeA5f
 6QPeM4Ht5SHuJDpLZH/UEnypAw==
X-Google-Smtp-Source: AGHT+IHqxsfKbg+LaZce/YXTpLnO/sQCOpbYmo4tWNiPwfFMBjHfAYit+H4/5PWkOjJhqTvrFeGjsw==
X-Received: by 2002:a05:690c:ec6:b0:59b:54b5:7d66 with SMTP id
 cs6-20020a05690c0ec600b0059b54b57d66mr1471067ywb.34.1698965139435; 
 Thu, 02 Nov 2023 15:45:39 -0700 (PDT)
Received: from grind.. ([179.193.10.161]) by smtp.gmail.com with ESMTPSA id
 ce10-20020a05690c098a00b0059b24bd4f2asm259523ywb.57.2023.11.02.15.45.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Nov 2023 15:45:39 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v9 19/19] target/riscv/tcg: do not support profiles for 'max'
 CPU
Date: Thu,  2 Nov 2023 19:44:45 -0300
Message-ID: <20231102224445.527355-20-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231102224445.527355-1-dbarboza@ventanamicro.com>
References: <20231102224445.527355-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-yw1-x1130.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

There's no gain in allowing the 'max' CPU to support profiles, since it
already contains everything that QEMU can support. And we'll open the
door for 'unorthodox' stuff like users disabling profiles of the 'max'
CPU.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/tcg/tcg-cpu.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index 553fb337e7..9a964a426e 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -825,6 +825,11 @@ static bool riscv_cpu_is_vendor(Object *cpu_obj)
     return object_dynamic_cast(cpu_obj, TYPE_RISCV_VENDOR_CPU) != NULL;
 }
 
+static bool riscv_cpu_has_max_extensions(Object *cpu_obj)
+{
+    return object_dynamic_cast(cpu_obj, TYPE_RISCV_CPU_MAX) != NULL;
+}
+
 /*
  * We'll get here via the following path:
  *
@@ -1003,6 +1008,12 @@ static void cpu_set_profile(Object *obj, Visitor *v, const char *name,
         return;
     }
 
+    if (riscv_cpu_has_max_extensions(obj)) {
+        error_setg(errp, "Profile %s is not available for the 'max' CPU",
+                   profile->name);
+        return;
+    }
+
     if (cpu->env.misa_mxl != MXL_RV64) {
         error_setg(errp, "Profile %s only available for 64 bit CPUs",
                    profile->name);
@@ -1251,11 +1262,6 @@ static void riscv_init_max_cpu_extensions(Object *obj)
     }
 }
 
-static bool riscv_cpu_has_max_extensions(Object *cpu_obj)
-{
-    return object_dynamic_cast(cpu_obj, TYPE_RISCV_CPU_MAX) != NULL;
-}
-
 static void tcg_cpu_instance_init(CPUState *cs)
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
-- 
2.41.0


