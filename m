Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2E0FEB64D0
	for <qemu-riscv@archiver.kernel.org>; Tue, 13 Jun 2023 13:36:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q94Bi-0000Yu-23; Tue, 13 Jun 2023 09:35:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q94Bf-0000KP-Bm
 for qemu-riscv@nongnu.org; Tue, 13 Jun 2023 09:35:55 -0400
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q94Bd-0002Zb-2l
 for qemu-riscv@nongnu.org; Tue, 13 Jun 2023 09:35:54 -0400
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-4f6195d2b3fso6919919e87.1
 for <qemu-riscv@nongnu.org>; Tue, 13 Jun 2023 06:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686663351; x=1689255351;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SeGtfKxhdpWheO+egBSiFEslCB4vsG49Vh7zClsFGyo=;
 b=IlHROwFRuCxhmdEiYIUhY8LY6j4xtaej4vcyiXE7ahwefDqRNhfRaEanCHmpeGaxeK
 re0iZ8CUIvTY4nK1EMiFWj0+UKTkrHb+RZ5XSbi2Gq6EwbbahtAekcP8ovUZtM2WIU1R
 dE7hFFBaKdj57Ve0DoH1WOPsZKIMRPDWIAyDJlIPoIuPEzvcn9IuWK7ICRZPwEu+jOsG
 0byd6QM3E3wKD4nCx9yKuhwcumAfwnInnHfHWs/XZDQ45oRJGxZjdVF/4kKNxyJ1tPe6
 L8LG3+3tG9beryox/aeEpjSreNhIVaQFBcSyLWW8qhceSbMzgZ/AgdpGG/2g3gONhLRj
 Afjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686663351; x=1689255351;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SeGtfKxhdpWheO+egBSiFEslCB4vsG49Vh7zClsFGyo=;
 b=BxUq8nn9alaIBTLBmsMgaE7+gPSbeLq4MM12Md3zXuPhz/LslDr+KDzTyAGJE5AmFX
 mMl+OH3LV7ISRLaJrGSDCSXkwrgJaiwtbWdBSjDcSa1zqnXfjqPAxcpsCzLToW7/rMI8
 C3qd3U49WNgJ33v4VOj5DGTRn7lNxoixsyU5PSjkH4HY6cotg7QvobJS4eHB8dfaxkF5
 6tTKyZo+6ITp3jr21t1HwSCjn8Rgb36BiQYznQIa2O0I9ts7t0KDtnWcFqEZzl5WqGVc
 NYL6S2D7B69jVoA6OWvL5iFGfl2z1JWD1XA1cLA7fkefZuOi9O7adwqxH+5I5RfIVu8n
 DELw==
X-Gm-Message-State: AC+VfDzDN3yyWM7ICQOotqKcHZeB2wiUqh5VQj+CUTJMyRCfqqh6jpyz
 mBYFqrirNRIIAnUCX5zo87QlIA==
X-Google-Smtp-Source: ACHHUZ6GCQ1my9IUWuHBTIepI/jd6MQKuiVV5MFEvRXMbgAyoJYiao6peEaAMNN5AthY2vH7GgEfJw==
X-Received: by 2002:ac2:5307:0:b0:4f4:b864:1da0 with SMTP id
 c7-20020ac25307000000b004f4b8641da0mr6216154lfh.15.1686663351130; 
 Tue, 13 Jun 2023 06:35:51 -0700 (PDT)
Received: from localhost.localdomain ([213.235.133.109])
 by smtp.gmail.com with ESMTPSA id
 zo18-20020a170906ff5200b0096ae4451c65sm6755441ejb.157.2023.06.13.06.35.49
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 13 Jun 2023 06:35:50 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Thomas Huth <thuth@redhat.com>,
 qemu-s390x@nongnu.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 4/9] target/ppc: Check for USER_ONLY definition instead of
 SOFTMMU one
Date: Tue, 13 Jun 2023 15:33:42 +0200
Message-Id: <20230613133347.82210-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230613133347.82210-1-philmd@linaro.org>
References: <20230613133347.82210-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12c;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x12c.google.com
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

Since we *might* have user emulation with softmmu,
replace the system emulation check by !user emulation one.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/cpu_init.c    | 20 ++++++++++----------
 target/ppc/helper_regs.c |  6 ++----
 2 files changed, 12 insertions(+), 14 deletions(-)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 9f97222655..7bce421a7c 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -5841,7 +5841,7 @@ POWERPC_FAMILY(970)(ObjectClass *oc, void *data)
                     (1ull << MSR_PMM) |
                     (1ull << MSR_RI);
     pcc->mmu_model = POWERPC_MMU_64B;
-#if defined(CONFIG_SOFTMMU)
+#if !defined(CONFIG_USER_ONLY)
     pcc->hash64_opts = &ppc_hash64_opts_basic;
 #endif
     pcc->excp_model = POWERPC_EXCP_970;
@@ -5920,7 +5920,7 @@ POWERPC_FAMILY(POWER5P)(ObjectClass *oc, void *data)
     pcc->lpcr_mask = LPCR_RMLS | LPCR_ILE | LPCR_LPES0 | LPCR_LPES1 |
         LPCR_RMI | LPCR_HDICE;
     pcc->mmu_model = POWERPC_MMU_2_03;
-#if defined(CONFIG_SOFTMMU)
+#if !defined(CONFIG_USER_ONLY)
     pcc->hash64_opts = &ppc_hash64_opts_basic;
     pcc->lrg_decr_bits = 32;
 #endif
@@ -6037,7 +6037,7 @@ POWERPC_FAMILY(POWER7)(ObjectClass *oc, void *data)
         LPCR_LPES0 | LPCR_LPES1 | LPCR_HDICE;
     pcc->lpcr_pm = LPCR_P7_PECE0 | LPCR_P7_PECE1 | LPCR_P7_PECE2;
     pcc->mmu_model = POWERPC_MMU_2_06;
-#if defined(CONFIG_SOFTMMU)
+#if !defined(CONFIG_USER_ONLY)
     pcc->hash64_opts = &ppc_hash64_opts_POWER7;
     pcc->lrg_decr_bits = 32;
 #endif
@@ -6181,7 +6181,7 @@ POWERPC_FAMILY(POWER8)(ObjectClass *oc, void *data)
     pcc->lpcr_pm = LPCR_P8_PECE0 | LPCR_P8_PECE1 | LPCR_P8_PECE2 |
                    LPCR_P8_PECE3 | LPCR_P8_PECE4;
     pcc->mmu_model = POWERPC_MMU_2_07;
-#if defined(CONFIG_SOFTMMU)
+#if !defined(CONFIG_USER_ONLY)
     pcc->hash64_opts = &ppc_hash64_opts_POWER7;
     pcc->lrg_decr_bits = 32;
     pcc->n_host_threads = 8;
@@ -6197,7 +6197,7 @@ POWERPC_FAMILY(POWER8)(ObjectClass *oc, void *data)
     pcc->l1_icache_size = 0x8000;
 }
 
-#ifdef CONFIG_SOFTMMU
+#ifndef CONFIG_USER_ONLY
 /*
  * Radix pg sizes and AP encodings for dt node ibm,processor-radix-AP-encodings
  * Encoded as array of int_32s in the form:
@@ -6214,7 +6214,7 @@ static struct ppc_radix_page_info POWER9_radix_page_info = {
         0x4000001e  /*  1G - enc: 0x2 */
     }
 };
-#endif /* CONFIG_SOFTMMU */
+#endif /* CONFIG_USER_ONLY */
 
 static void init_proc_POWER9(CPUPPCState *env)
 {
@@ -6371,7 +6371,7 @@ POWERPC_FAMILY(POWER9)(ObjectClass *oc, void *data)
         LPCR_HEIC | LPCR_LPES0 | LPCR_HVICE | LPCR_HDICE;
     pcc->lpcr_pm = LPCR_PDEE | LPCR_HDEE | LPCR_EEE | LPCR_DEE | LPCR_OEE;
     pcc->mmu_model = POWERPC_MMU_3_00;
-#if defined(CONFIG_SOFTMMU)
+#if !defined(CONFIG_USER_ONLY)
     /* segment page size remain the same */
     pcc->hash64_opts = &ppc_hash64_opts_POWER7;
     pcc->radix_page_info = &POWER9_radix_page_info;
@@ -6389,7 +6389,7 @@ POWERPC_FAMILY(POWER9)(ObjectClass *oc, void *data)
     pcc->l1_icache_size = 0x8000;
 }
 
-#ifdef CONFIG_SOFTMMU
+#ifndef CONFIG_USER_ONLY
 /*
  * Radix pg sizes and AP encodings for dt node ibm,processor-radix-AP-encodings
  * Encoded as array of int_32s in the form:
@@ -6406,7 +6406,7 @@ static struct ppc_radix_page_info POWER10_radix_page_info = {
         0x4000001e  /*  1G - enc: 0x2 */
     }
 };
-#endif /* CONFIG_SOFTMMU */
+#endif /* !CONFIG_USER_ONLY */
 
 static void init_proc_POWER10(CPUPPCState *env)
 {
@@ -6547,7 +6547,7 @@ POWERPC_FAMILY(POWER10)(ObjectClass *oc, void *data)
 
     pcc->lpcr_pm = LPCR_PDEE | LPCR_HDEE | LPCR_EEE | LPCR_DEE | LPCR_OEE;
     pcc->mmu_model = POWERPC_MMU_3_00;
-#if defined(CONFIG_SOFTMMU)
+#if !defined(CONFIG_USER_ONLY)
     /* segment page size remain the same */
     pcc->hash64_opts = &ppc_hash64_opts_POWER7;
     pcc->radix_page_info = &POWER10_radix_page_info;
diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
index bc7e9d7eda..e27f4a75a4 100644
--- a/target/ppc/helper_regs.c
+++ b/target/ppc/helper_regs.c
@@ -310,7 +310,7 @@ int hreg_store_msr(CPUPPCState *env, target_ulong value, int alter_hv)
     return excp;
 }
 
-#ifdef CONFIG_SOFTMMU
+#ifndef CONFIG_USER_ONLY
 void store_40x_sler(CPUPPCState *env, uint32_t val)
 {
     /* XXX: TO BE FIXED */
@@ -320,9 +320,7 @@ void store_40x_sler(CPUPPCState *env, uint32_t val)
     }
     env->spr[SPR_405_SLER] = val;
 }
-#endif /* CONFIG_SOFTMMU */
 
-#ifndef CONFIG_USER_ONLY
 void check_tlb_flush(CPUPPCState *env, bool global)
 {
     CPUState *cs = env_cpu(env);
@@ -341,7 +339,7 @@ void check_tlb_flush(CPUPPCState *env, bool global)
         tlb_flush(cs);
     }
 }
-#endif
+#endif /* !CONFIG_USER_ONLY */
 
 /**
  * _spr_register
-- 
2.38.1


