Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DCA3CDB474
	for <qemu-riscv@archiver.kernel.org>; Tue, 17 Oct 2023 11:12:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qshzy-0000wk-Lv; Tue, 17 Oct 2023 07:12:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qshzw-0000pw-M1
 for qemu-riscv@nongnu.org; Tue, 17 Oct 2023 07:12:28 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qshzt-0004dG-VC
 for qemu-riscv@nongnu.org; Tue, 17 Oct 2023 07:12:28 -0400
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-6b201a93c9cso3275969b3a.0
 for <qemu-riscv@nongnu.org>; Tue, 17 Oct 2023 04:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1697541144; x=1698145944;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8RGOKdeWRbxy057ThQm8YJtuzOYESlVJp/H5jW1kGqg=;
 b=lxDBo9fwZPJ1TF7H9JMQlotH7zp0F1urQ0riF64UNf/95HX9SsFZ9PlugJ7ry9sMbX
 eJZRMW3kDrR+DqUChuSoyNFgthvSnzgQHiHXr2Hw2r4BVROShjxTCz08it+eaTYt6Cxj
 f95bTqTgSaeZRPF1sJ/NdUjCtGAka5ogxEd5Hb5MRJUXhBKq5MW4fjR85aCQ93FxyeBB
 HsdBinEd5BiXEwzf5vJnT4gnM9O9tTeoVdOcL7wlF6Gk1Twcugw4pzLXP9oIZbELDfx3
 xzx9H29ForE7UQ6yYjzTVJNEr3OO3fjV2XVHRhchbzN1h7guRIXktC2uI2VoJKT3Zcs/
 eq3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697541144; x=1698145944;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8RGOKdeWRbxy057ThQm8YJtuzOYESlVJp/H5jW1kGqg=;
 b=A7vXALKoX+IPqyWiYeBwYQxQ8rGZgdbWvXFw7o5HPKe1cUptduovJbaVO1Gs10NBEt
 z0zfoypt7vkqcgJ1X6yQLzDdQ3/6S/SDjgcogrWX68+KI12OlYlo/ZWMBqp9UNaf4rvm
 KN6BEH41mHdHqtUkgsbUVrw+9HEhbIN9dtROClFbKdhWpNxygMErpdLfftijeMNqTm6s
 VGG8yngRLwWNOumMXyxhBZosR4V82HxHvxJsLP/DqX9HQ3LIeayExhRWoDmVfkFoUsZ7
 Kh33W5K74yrd7l2l60/8TtwX8dwAYuf+98L20J3F+DwdqN6JSqVStG9ShPueiuBa1GHf
 pXjA==
X-Gm-Message-State: AOJu0YzcPGamVIwFz6gNAJB27ouuoHzc2GW+5niCc8+37bOeF4KVXG1S
 sPb46BgAI5GxGKP1I/+oVXJSfA==
X-Google-Smtp-Source: AGHT+IHgrtmvIsqLmxEsBx9fYSV9oDN8Np1S121oqV47jBPORspJTJRkcavWoEp06/97EFJEIFxJPw==
X-Received: by 2002:a05:6a21:7741:b0:174:2d20:5414 with SMTP id
 bc1-20020a056a21774100b001742d205414mr1443974pzc.49.1697541144393; 
 Tue, 17 Oct 2023 04:12:24 -0700 (PDT)
Received: from localhost ([157.82.206.156])
 by smtp.gmail.com with UTF8SMTPSA id
 i12-20020a17090a2a0c00b0027ced921e80sm6825037pjd.38.2023.10.17.04.12.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Oct 2023 04:12:24 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Mikhail Tyutin <m.tyutin@yadro.com>,
 Aleksandr Anenkov <a.anenkov@yadro.com>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org
Subject: [PATCH v3 1/4] target/riscv: Remove misa_mxl validation
Date: Tue, 17 Oct 2023 20:12:10 +0900
Message-ID: <20231017111215.42209-2-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231017111215.42209-1-akihiko.odaki@daynix.com>
References: <20231017111215.42209-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::42b;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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

It is initialized with a simple assignment and there is little room for
error. In fact, the validation is even more complex.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 target/riscv/tcg/tcg-cpu.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index a28918ab30..7f45e42000 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -148,7 +148,7 @@ static void riscv_cpu_validate_misa_priv(CPURISCVState *env, Error **errp)
     }
 }
 
-static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu, Error **errp)
+static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu)
 {
     RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(cpu);
     CPUClass *cc = CPU_CLASS(mcc);
@@ -168,11 +168,6 @@ static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu, Error **errp)
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
@@ -573,11 +568,7 @@ static bool tcg_cpu_realize(CPUState *cs, Error **errp)
         return false;
     }
 
-    riscv_cpu_validate_misa_mxl(cpu, &local_err);
-    if (local_err != NULL) {
-        error_propagate(errp, local_err);
-        return false;
-    }
+    riscv_cpu_validate_misa_mxl(cpu);
 
     riscv_cpu_validate_priv_spec(cpu, &local_err);
     if (local_err != NULL) {
-- 
2.42.0


