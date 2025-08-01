Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3384DC87FCA
	for <qemu-riscv@archiver.kernel.org>; Fri,  1 Aug 2025 23:30:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uhzAD-0000Oe-CF; Fri, 01 Aug 2025 19:27:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhz8r-0007Nd-NR
 for qemu-riscv@nongnu.org; Fri, 01 Aug 2025 19:26:26 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhz8n-0005v1-ID
 for qemu-riscv@nongnu.org; Fri, 01 Aug 2025 19:26:25 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-31c4a546cc2so1351900a91.2
 for <qemu-riscv@nongnu.org>; Fri, 01 Aug 2025 16:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754090780; x=1754695580; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nj4T7YfXSM1eGuF29lVqk00YXGpZfXW67ju5+IQBYG4=;
 b=Bk1v9lCTYWwfeela8tG3eZGijr1DOf4okk2YR24xMK2Kmq5vCEWMF73POyWsLw40W3
 ezjtv4ePQmlZ6xV0lW/m8BrNitgssMSzAZqC6/tafub2H6WPP+mPNaWw4XcRkCfe07qb
 pnNYurDipBZUmT4V8JWgjBrPeP/+X4+POaEnBFvucQIeFgBrJ8+7mt1MkGB5aqJMc/y8
 D2dmqSZV1R6ifMpzrY/c5r3ZAYJ5fC71kw1GVDTZm4ep5PJ+RsFiQ0qhsD12vd+58/+Y
 D+uouZI+W3Unlo4VwsQeHmKjE6p/q0Lz1VWIkr5dVIeFWCbu8ru5Mn2LstDQDljHdM6p
 Dnig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754090780; x=1754695580;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nj4T7YfXSM1eGuF29lVqk00YXGpZfXW67ju5+IQBYG4=;
 b=as/PV1gebpXOv5RsvrUDSi8LWOoaFki1zViRj69i6LBK50MadpV1/N9afHs2oq1kcx
 yn2DJvHJADoDds+uXjeTFpymTkxrvSJoKCbyK0TWbxyyySDWW83IzoupN5Cq1UzjmfkW
 5jEw5pGsm7X+qv1zbUUmpyGKaSTS7o4/tgtPB+vnYOhTiTPmvmK1XXfc1j1p2qGv6eXR
 eDJi2LLG3oWqxxoGoQkrzXHOnaC/+HhGXZ1V+Oy9Xsmy0lnO2vI38e04Wq6gxFa2an3I
 TQdiRunW6+6+EGtbTBk2LDGjNeRt/DlEUCjEUJgwWUoe8qXKyhOYoZKLFB8PqqFxyYuK
 cyHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkMCq6yEsMeEl17zyamFcd2cZDv8OU+INSMrhmkXIzSEPwpfld6jtE/F/1iUq0glP+GvfyzphbNIPY@nongnu.org
X-Gm-Message-State: AOJu0YwMGDBgWga+BTGIb6LuAxb5QsvcoN1eRE26qu6TjFT5E5bGVQhT
 cap2mpijb3GI5yZ2j8VNCm9pEMjqcNCmJuqKmQYMew/DWf6u8rYrXQkJIkZDUKv1HGc=
X-Gm-Gg: ASbGncvbO3TKMJYHBIT35bBLHqp7Xn9Kj3wcg0Cw1iLh14ujlmkLRIQT9mPX8TRzIXG
 nTjhZGGkBGbSpbIWI32baNVIhM1Rjr2+CM4l7JB8iYNIREPHdhiQx0w8hu4WNhd0u1ZyzdZ2Izk
 cmrkUCK6rjXeYZThb8LFNHwMRpnTd+b5/YZZgi2R3HMuJ5RcLMJFKJeitfbovHOKEvQftAoBJhY
 lSeDeLr3F7N+TyGefOFZDpIrgmajrPRzdZ0aC4kO9/kcPx9AUWNLTC6wxXMyX7cjzcUHe4rY6oX
 R9aBS3kFY7kIychzih497+slXzCaZhKFlgDLl/JZ5CE6XaGEoLOOrDUv7VavD9xXa1M3/Ed6gfN
 mskHu0RYqe7CelwaQbI0HrQ==
X-Google-Smtp-Source: AGHT+IHaQZbO6KO3PpIYw3m/6S5emsSdIZmV+3tze39ZMgyywCkrwKVKQtng0wufQkqFmiu2pz1F4g==
X-Received: by 2002:a17:90b:3906:b0:312:1c83:58e7 with SMTP id
 98e67ed59e1d1-321161e9845mr1953519a91.1.1754090780054; 
 Fri, 01 Aug 2025 16:26:20 -0700 (PDT)
Received: from pc.. ([38.41.223.211]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3207eca6d3asm5628217a91.23.2025.08.01.16.26.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Aug 2025 16:26:19 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, richard.henderson@linaro.org,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Weiwei Li <liwei1518@gmail.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, philmd@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 04/11] semihosting/arm-compat-semi: remove
 common_semi_sys_exit_extended
Date: Fri,  1 Aug 2025 16:26:02 -0700
Message-ID: <20250801232609.2744557-5-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250801232609.2744557-1-pierrick.bouvier@linaro.org>
References: <20250801232609.2744557-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x102d.google.com
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

This allows to get rid of sizeof(target_ulong) for riscv, without
changing the semantic.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/common-semi-target.h   | 5 -----
 target/riscv/common-semi-target.h | 5 -----
 semihosting/arm-compat-semi.c     | 4 +++-
 3 files changed, 3 insertions(+), 11 deletions(-)

diff --git a/target/arm/common-semi-target.h b/target/arm/common-semi-target.h
index da51f2d7f54..7ebd2136d93 100644
--- a/target/arm/common-semi-target.h
+++ b/target/arm/common-semi-target.h
@@ -34,11 +34,6 @@ static inline void common_semi_set_ret(CPUState *cs, target_ulong ret)
     }
 }
 
-static inline bool common_semi_sys_exit_extended(CPUState *cs, int nr)
-{
-    return nr == TARGET_SYS_EXIT_EXTENDED || is_a64(cpu_env(cs));
-}
-
 static inline bool is_64bit_semihosting(CPUArchState *env)
 {
     return is_a64(env);
diff --git a/target/riscv/common-semi-target.h b/target/riscv/common-semi-target.h
index 7c8a59e0cc3..63bbcd2d5fa 100644
--- a/target/riscv/common-semi-target.h
+++ b/target/riscv/common-semi-target.h
@@ -25,11 +25,6 @@ static inline void common_semi_set_ret(CPUState *cs, target_ulong ret)
     env->gpr[xA0] = ret;
 }
 
-static inline bool common_semi_sys_exit_extended(CPUState *cs, int nr)
-{
-    return (nr == TARGET_SYS_EXIT_EXTENDED || sizeof(target_ulong) == 8);
-}
-
 static inline bool is_64bit_semihosting(CPUArchState *env)
 {
     return riscv_cpu_mxl(env) != MXL_RV32;
diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 3f653c6e7a9..ef57d7205c8 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -755,7 +755,9 @@ void do_common_semihosting(CPUState *cs)
     {
         uint32_t ret;
 
-        if (common_semi_sys_exit_extended(cs, nr)) {
+        bool extended = (nr == TARGET_SYS_EXIT_EXTENDED ||
+                         is_64bit_semihosting(cpu_env(cs)));
+        if (extended) {
             /*
              * The A64 version of SYS_EXIT takes a parameter block,
              * so the application-exit type can return a subcode which
-- 
2.47.2


