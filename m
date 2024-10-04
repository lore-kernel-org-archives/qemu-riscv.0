Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23C80CF8853
	for <qemu-riscv@archiver.kernel.org>; Fri,  4 Oct 2024 16:34:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1swlFr-0002Ik-Qz; Fri, 04 Oct 2024 12:34:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1swlFn-0001sa-U8
 for qemu-riscv@nongnu.org; Fri, 04 Oct 2024 12:34:08 -0400
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1swlFl-000615-21
 for qemu-riscv@nongnu.org; Fri, 04 Oct 2024 12:34:07 -0400
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-5398ec2f3c3so3068560e87.1
 for <qemu-riscv@nongnu.org>; Fri, 04 Oct 2024 09:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728059643; x=1728664443; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uKaUzar4CyW9b+VidODguwjQPRzdI1IQfcANAiFe0bI=;
 b=WupiJwVHeCXB6aPmjNqYTZQbwDvic76JnBZYSNwJcF6NcAnh5iuWAJYBTnkXvvT1/u
 1LKwvMKpx5NG+nkDD3hIT9ZhdNLM4Ynd5LkvF0VuIpzDmWGEBTmCvuCq89h+cWAGtSBu
 pl7dPt2xRYfNE3HfjbIbThhcWzicmn0U5rtFys5Tt5Sbpfuka87E3dCO/v19YoC9K0Rr
 WHX5RvUtRad2mIaM/U9VV7elCk05c5urP93tZezjGLuijrUVJX+aqF4T/n/EhmJ+LeWq
 TCYu6wA2z2ptkWwQQgntaXGr1/TFF989nVW438YvhK+nRfr0YhKKKWgOdy2I5rT5csx5
 LKng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728059643; x=1728664443;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uKaUzar4CyW9b+VidODguwjQPRzdI1IQfcANAiFe0bI=;
 b=d8o4ea04ONL38PLq1RBwtLuxA4kwJWdLi5/ukS1oQcsCKuzdkL9GjMVL/2o36cZSXQ
 HE1KRMhVyT4xAmxR2fif678Dpj8FnD6mi2jJLLCEuyWz+BYG/sLXDcPDNwP+ssxDcRAu
 hN8S1XhI1zBVQJuMRC6xb05xx2L3YIG6VY7q6fP7dCFE795rZ8YGk12mlf0UHKdzTO69
 Tm+FtAXZg7qE176V1Qe6uHefRrrTxumTngP0IcNYjFv5gP1Yi1fZ+FXnw1+yyKaFE8sN
 6Wxq72HF0yHBLRhIhPu00q27nZQ70yoRUrrFoocw5mc+Orwi3Q2+eXWY9Bdc7nYlI6p/
 C7DA==
X-Gm-Message-State: AOJu0YwHqlaSixLVTGEkVCwJSHxk45bq7r8NXV7QPJ5hgvfbDkdrmlEa
 AUWEvhfru6vabtTqaJB91FsBaZAjhTyWUOxPQJ8zeG+qKwsWLYtXhUmkOvOpu7w=
X-Google-Smtp-Source: AGHT+IFuVaVw2FeEj02CoP4GD4TKrUCRAAI2yJWWIn245ZaDyKf2L+98Bsw33FI6NNiG3GQCT3c70w==
X-Received: by 2002:a05:6512:318e:b0:536:7cfb:6998 with SMTP id
 2adb3069b0e04-539ab89e01bmr2589237e87.35.1728059642951; 
 Fri, 04 Oct 2024 09:34:02 -0700 (PDT)
Received: from localhost.localdomain ([91.223.100.150])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-539b0025812sm766e87.307.2024.10.04.09.33.56
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 04 Oct 2024 09:34:01 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 13/25] target/sh4: Use explicit little-endian LD/ST API
Date: Fri,  4 Oct 2024 13:30:29 -0300
Message-ID: <20241004163042.85922-14-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241004163042.85922-1-philmd@linaro.org>
References: <20241004163042.85922-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x131.google.com
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

Since commit 73ceb12960e ("Remove the unused sh4eb target")
we only build the SH4 architecture for little endianness.
Directly use the little-endian LD/ST API.

Mechanical change using:

  $ end=le; \
    for acc in uw w l q tul; do \
      sed -i -e "s/ld${acc}_p(/ld${acc}_${end}_p(/" \
             -e "s/st${acc}_p(/st${acc}_${end}_p(/" \
        $(git grep -wlE '(ld|st)t?u?[wlq]_p' target/sh4/); \
    done

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/sh4/gdbstub.c | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/target/sh4/gdbstub.c b/target/sh4/gdbstub.c
index 75926d4e049..194be1d5db3 100644
--- a/target/sh4/gdbstub.c
+++ b/target/sh4/gdbstub.c
@@ -80,59 +80,59 @@ int superh_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
     switch (n) {
     case 0 ... 7:
         if ((env->sr & (1u << SR_MD)) && (env->sr & (1u << SR_RB))) {
-            env->gregs[n + 16] = ldl_p(mem_buf);
+            env->gregs[n + 16] = ldl_le_p(mem_buf);
         } else {
-            env->gregs[n] = ldl_p(mem_buf);
+            env->gregs[n] = ldl_le_p(mem_buf);
         }
         break;
     case 8 ... 15:
-        env->gregs[n] = ldl_p(mem_buf);
+        env->gregs[n] = ldl_le_p(mem_buf);
         break;
     case 16:
-        env->pc = ldl_p(mem_buf);
+        env->pc = ldl_le_p(mem_buf);
         break;
     case 17:
-        env->pr = ldl_p(mem_buf);
+        env->pr = ldl_le_p(mem_buf);
         break;
     case 18:
-        env->gbr = ldl_p(mem_buf);
+        env->gbr = ldl_le_p(mem_buf);
         break;
     case 19:
-        env->vbr = ldl_p(mem_buf);
+        env->vbr = ldl_le_p(mem_buf);
         break;
     case 20:
-        env->mach = ldl_p(mem_buf);
+        env->mach = ldl_le_p(mem_buf);
         break;
     case 21:
-        env->macl = ldl_p(mem_buf);
+        env->macl = ldl_le_p(mem_buf);
         break;
     case 22:
-        cpu_write_sr(env, ldl_p(mem_buf));
+        cpu_write_sr(env, ldl_le_p(mem_buf));
         break;
     case 23:
-        env->fpul = ldl_p(mem_buf);
+        env->fpul = ldl_le_p(mem_buf);
         break;
     case 24:
-        env->fpscr = ldl_p(mem_buf);
+        env->fpscr = ldl_le_p(mem_buf);
         break;
     case 25 ... 40:
         if (env->fpscr & FPSCR_FR) {
-            env->fregs[n - 9] = ldl_p(mem_buf);
+            env->fregs[n - 9] = ldl_le_p(mem_buf);
         } else {
-            env->fregs[n - 25] = ldl_p(mem_buf);
+            env->fregs[n - 25] = ldl_le_p(mem_buf);
         }
         break;
     case 41:
-        env->ssr = ldl_p(mem_buf);
+        env->ssr = ldl_le_p(mem_buf);
         break;
     case 42:
-        env->spc = ldl_p(mem_buf);
+        env->spc = ldl_le_p(mem_buf);
         break;
     case 43 ... 50:
-        env->gregs[n - 43] = ldl_p(mem_buf);
+        env->gregs[n - 43] = ldl_le_p(mem_buf);
         break;
     case 51 ... 58:
-        env->gregs[n - (51 - 16)] = ldl_p(mem_buf);
+        env->gregs[n - (51 - 16)] = ldl_le_p(mem_buf);
         break;
     default:
         return 0;
-- 
2.45.2


