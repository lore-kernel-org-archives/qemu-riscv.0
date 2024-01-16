Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C84F1C4706C
	for <qemu-riscv@archiver.kernel.org>; Tue, 16 Jan 2024 10:48:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rPgzQ-0002HU-J9; Tue, 16 Jan 2024 05:48:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rPgzO-0002H4-Ig
 for qemu-riscv@nongnu.org; Tue, 16 Jan 2024 05:48:14 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rPgzM-00077u-Oy
 for qemu-riscv@nongnu.org; Tue, 16 Jan 2024 05:48:14 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40e760e5b49so20797995e9.1
 for <qemu-riscv@nongnu.org>; Tue, 16 Jan 2024 02:48:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705402090; x=1706006890; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l55+T+oNbWbIoD8azHRmJ3Ii82GQU+8whjp/aHn5iIs=;
 b=SyxafefdRfYOH6C2sPIt3wxbB70GUqsQl6e0i+XYwwvxDaxQdZGzqAThwwQXIGj+c2
 jVM6XBsYAOm4pxGdPx3jcUOhFB92cXmKStIecv/nyq3gxrdovMq+4ohryg4ECf/ug20u
 s3RVf/eace5XCHJiG3WV0P6/DgYH5cSmEYyX4+Xo905ahVfZDVcM5rLPNaz9QjBHsIqW
 jSr0z8mxiqK99M+jhi37q3w43EkU7UnFIYgCUMTvWqoT3nOg0lNWFynhFUBWy0g2Ep7M
 p+T1Pu4nDIi+dJhIWKQxbDCKrPT1+spXwTr2DJSlEjwwsgoiWTaqQoNsuntABzVCCqUN
 14Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705402090; x=1706006890;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l55+T+oNbWbIoD8azHRmJ3Ii82GQU+8whjp/aHn5iIs=;
 b=OMnYWxmYfk3+dAtYUG0eVcvbVX4afW74tr4C17I5pP+wINalzsd48OK3wMhf2cq4xF
 1pVs0uERJ5pLD2+CJXh/dB1C3Y3RTrfwN0NA3Nk3K3Q6DNKntp2P+OZzweJ1pCYrU/JV
 6r/DJFWQXWsSt+FM49lUImWLDlakx4g6AMfChM/BlkQM+g0eNLej9SwlaXAeHmqhBEd4
 UXE+GVx0l+kL45yjoi+PbpI8/NcJ0jxKAtZHZaUUJnThqFRHppdV92TrbDJP19XghI+p
 HQBqgao59Y9nJXXXkf4ckMG1HHTOWK0/wgYedDxU9Tmf/RQSbZa0RBzdrXO5UhfP32+6
 P6vg==
X-Gm-Message-State: AOJu0YyRtM5QjAroGKPc4FgPPEC+arZKtKnEFD/oAJ9nah8FBnxsFX7l
 hZHhoVM59tsqeJj1YZSG68WFEY+CJ7MvSw==
X-Google-Smtp-Source: AGHT+IH1HkHRbj9JY9n+STn2EipXjKa3liSsC/eMytUyMlX7y41RkzU5yKB7ddu1DgpNfWRPy7nOyg==
X-Received: by 2002:a05:600c:1c85:b0:40e:526b:d5f5 with SMTP id
 k5-20020a05600c1c8500b0040e526bd5f5mr2554358wms.247.1705402090151; 
 Tue, 16 Jan 2024 02:48:10 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 f9-20020a05600c4e8900b0040e3960f46asm18899495wmq.14.2024.01.16.02.48.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jan 2024 02:48:09 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 70C3C5F8D4;
 Tue, 16 Jan 2024 10:48:09 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Weiwei Li <liwei1518@gmail.com>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
Subject: [PULL 02/22] target/riscv: Remove misa_mxl validation
Date: Tue, 16 Jan 2024 10:47:49 +0000
Message-Id: <20240116104809.250076-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240116104809.250076-1-alex.bennee@linaro.org>
References: <20240116104809.250076-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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

From: Akihiko Odaki <akihiko.odaki@daynix.com>

It is initialized with a simple assignment and there is little room for
error. In fact, the validation is even more complex.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Acked-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20240103173349.398526-24-alex.bennee@linaro.org>
Message-Id: <20231213-riscv-v7-2-a760156a337f@daynix.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index 14133ff6656..b85b0d036a6 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -268,7 +268,7 @@ static void riscv_cpu_validate_misa_priv(CPURISCVState *env, Error **errp)
     }
 }
 
-static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu, Error **errp)
+static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu)
 {
     RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(cpu);
     CPUClass *cc = CPU_CLASS(mcc);
@@ -288,11 +288,6 @@ static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu, Error **errp)
     default:
         g_assert_not_reached();
     }
-
-    if (env->misa_mxl_max != env->misa_mxl) {
-        error_setg(errp, "misa_mxl_max must be equal to misa_mxl");
-        return;
-    }
 }
 
 static void riscv_cpu_validate_priv_spec(RISCVCPU *cpu, Error **errp)
@@ -932,7 +927,6 @@ static bool riscv_cpu_is_vendor(Object *cpu_obj)
 static bool tcg_cpu_realize(CPUState *cs, Error **errp)
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
-    Error *local_err = NULL;
 
     if (!riscv_cpu_tcg_compatible(cpu)) {
         g_autofree char *name = riscv_cpu_get_name(cpu);
@@ -941,14 +935,11 @@ static bool tcg_cpu_realize(CPUState *cs, Error **errp)
         return false;
     }
 
-    riscv_cpu_validate_misa_mxl(cpu, &local_err);
-    if (local_err != NULL) {
-        error_propagate(errp, local_err);
-        return false;
-    }
+    riscv_cpu_validate_misa_mxl(cpu);
 
 #ifndef CONFIG_USER_ONLY
     CPURISCVState *env = &cpu->env;
+    Error *local_err = NULL;
 
     CPU(cs)->tcg_cflags |= CF_PCREL;
 
-- 
2.39.2


