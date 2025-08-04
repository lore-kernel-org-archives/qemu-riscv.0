Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B23CC87FCB
	for <qemu-riscv@archiver.kernel.org>; Mon,  4 Aug 2025 19:33:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uj0vz-0003t1-5J; Mon, 04 Aug 2025 15:33:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uj06S-00019A-94
 for qemu-riscv@nongnu.org; Mon, 04 Aug 2025 14:40:10 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uj06O-0000wX-BI
 for qemu-riscv@nongnu.org; Mon, 04 Aug 2025 14:40:07 -0400
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-7425bd5a83aso2990016b3a.0
 for <qemu-riscv@nongnu.org>; Mon, 04 Aug 2025 11:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754332801; x=1754937601; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r2HhmWn+3Uhat9xr0ViadQ+YUOagyNbQxWkSxpV2E5c=;
 b=nSH1IIwIX2gR+Xz0UamSK8KEDGym03VtIcFSQnrUcUJdL7N7xpv3KjJVuK8vvpj11I
 NU+p8vn4D7n4R9SlUAmdorFPqfc76wUenFbgUyOzNW1JTObWbpXy8vlyckAq2Qua04sZ
 GYk3AKl6Vh1+HIqpyyNDFSGC3dxGpVPyWL4+N3aGWBcbRDY4H/8pwCZPWMjtaMxuDmL7
 5N5ASO12BjdkEq9V1CXVwN1CXinHTs+qB10lFvM+5ggn3iNoaBfk/Ra4odoXJZ0FW7JN
 dc84iXoBumOvFUhoGJc3NaGA+UZDWhrcxyFXhgWZ83dtm8X5P5qWpi2mRB/bCCbInouB
 qIFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754332801; x=1754937601;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r2HhmWn+3Uhat9xr0ViadQ+YUOagyNbQxWkSxpV2E5c=;
 b=dja58pc+/VrPmI91wrb2Ifwb6MHny3QwqRgF2eH6NQo6TKdqf9CfiYgpZCOTVC1pKA
 460jzJ7GE7KmABDV0dO2Fyvr89lJ98ZTXfCb+vPp4PyXuX3QgelLtAnmILuHlOldMNBz
 BF7ST4lSxxk5I5/Nn0foH93R7bnuMGGBbxb6dT8RSPHbm096HIMqYHWrWJkeqyKUFF+F
 5gPQ9XJVi7JUCwwnCRcuyH9neWcNKcFLVZQa5ruQcHW8fWVd0QD1WYV/7X2ICKN9Rxu7
 bd/AfAtDD/fVe9g0duByk9ZCldi/bfZtfcbT4yeDEPX/gdWdXk2Gtk2sVXT8cvUhvqp+
 OFLA==
X-Gm-Message-State: AOJu0Yzc4n94Zo1Xz87b7EVwEEHQ4EQX0l2SW1ssbwGcshIBQYnwDEJs
 ReQf9u1E1Ez5B1iYOStNs1ryJHZSgYahS3rgL0BEIwddflucn2FbMz2fjXsnXRSbk/0=
X-Gm-Gg: ASbGncsPeTM3+4gkH8iLChMcLXQ3no7Nzr0UX26VdEjveh0h1vT9+aGAuBXkEDvdWUk
 jNNYabip8i+eAg54y+bcZH15aK0GoheGCzGN/MMX0Ggs/xLH/d3Icmwlf2BJkuJIoVSzR6FPorw
 JkABOc2q8ZAZoN2wDHqhOnALc+9ixhZaxjx414YKgrb9BQkXnWnXi1lXXvdxmhKGJWMbFJ3Jrqc
 EgrH2LmwvhHsZF8wqEe1sjgOLro4g/0M5YWfvqkHHNFb8E4VxtKRgb5UB7fNeboa30ywDBGamXT
 tVz/JNK+xRA79lvJgVZVGzw1dgggpikqWgO5f6rvs+bZQcaGX4h7E+tA3d2ohcuT9LmoNtbGULJ
 pwCou/5aM3bthhMH2Wrn3yQ==
X-Google-Smtp-Source: AGHT+IFc3oT+XcNNEGUU9pmAKKrlbKZ2uaO8uJ6AS0ce2FHjFrSGPfAg4Wy97lxXrO3V1aJqQDDRyQ==
X-Received: by 2002:a05:6a00:3910:b0:736:5f75:4a3b with SMTP id
 d2e1a72fcca58-76bec30c7ccmr13794563b3a.7.1754332801410; 
 Mon, 04 Aug 2025 11:40:01 -0700 (PDT)
Received: from pc.. ([38.41.223.211]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bd78875cesm9940171b3a.15.2025.08.04.11.40.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Aug 2025 11:40:01 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, philmd@linaro.org, Weiwei Li <liwei1518@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, richard.henderson@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 05/12] target/riscv/common-semi-target: remove
 sizeof(target_ulong)
Date: Mon,  4 Aug 2025 11:39:43 -0700
Message-ID: <20250804183950.3147154-6-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250804183950.3147154-1-pierrick.bouvier@linaro.org>
References: <20250804183950.3147154-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x435.google.com
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

Only riscv64 extends SYS_EXIT, similar to aarch64.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/riscv/common-semi-target.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/riscv/common-semi-target.h b/target/riscv/common-semi-target.h
index ba40e794dcc..7e6ea8da02c 100644
--- a/target/riscv/common-semi-target.h
+++ b/target/riscv/common-semi-target.h
@@ -25,16 +25,16 @@ static inline void common_semi_set_ret(CPUState *cs, target_ulong ret)
     env->gpr[xA0] = ret;
 }
 
-static inline bool common_semi_sys_exit_is_extended(CPUState *cs)
-{
-    return sizeof(target_ulong) == 8;
-}
-
 static inline bool is_64bit_semihosting(CPUArchState *env)
 {
     return riscv_cpu_mxl(env) != MXL_RV32;
 }
 
+static inline bool common_semi_sys_exit_is_extended(CPUState *cs)
+{
+    return is_64bit_semihosting(cpu_env(cs));
+}
+
 static inline target_ulong common_semi_stack_bottom(CPUState *cs)
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
-- 
2.47.2


