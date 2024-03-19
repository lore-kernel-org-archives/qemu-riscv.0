Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2EDCCD11DB
	for <qemu-riscv@archiver.kernel.org>; Tue, 19 Mar 2024 15:45:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rmbeN-00013K-1p; Tue, 19 Mar 2024 11:45:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rmbeL-0000zt-O6
 for qemu-riscv@nongnu.org; Tue, 19 Mar 2024 11:45:13 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rmbe5-0005R5-Oy
 for qemu-riscv@nongnu.org; Tue, 19 Mar 2024 11:45:13 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-41412e6b2cfso14961925e9.2
 for <qemu-riscv@nongnu.org>; Tue, 19 Mar 2024 08:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710863096; x=1711467896; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hwhHMygx0mLENqv0dOkZHirx9fre16Z9mIHYSdz8fsE=;
 b=ZVbjAZg3IT4dLTFQEn9z+KNAMhyeL1YMm274oUPff629OaFDbtEqUAdXzB/O4ggtLq
 KkLzetDMwZIoqio5Y0qCvrfKziorPTkyLP1kjfpVRIR3qmxUGP4sp7hmIEAC+QSxfNKc
 B2BD1gfhPLRszkSseY/Ww5YGMBmrX+RKl4GLEuhi+QkNfBT2dIIiXvp750kzBYDyXDzv
 gSyjOeeo6nWK5aL7c1do6/612hsEtmisVSVsEaYP55/4HlMSS3YO/fdH9ZBuA2iWFpM0
 otZgzCTPAxWlxvE82dUhqD09ZbkWdlq8Hgqe1BNwyUWK2b2yPmUyJ89mNDlBgZ2JuCfi
 kbjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710863096; x=1711467896;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hwhHMygx0mLENqv0dOkZHirx9fre16Z9mIHYSdz8fsE=;
 b=OaIFmUagE08YJ7S5/FQwDXE/E+7sLv7r+o7e3REVf/tR6ZIWEz9NoGXGrJiB3Gpt6C
 D371K3dRFHOtlqheJ18QC/J7jY8SPO8+up4wb6ZAUcBgx2oLOpfSrBw+XIt/0F1Njgz2
 hm9G3AQdALCMmIBwiJQNsV6JH82Yg3wz1gC3+X1XeuvW+1sQB1R8g6zJzUVEhuYBuLQP
 1qoKR2W6AoCNbe69eqAcTCYrdq7whncNkjOlt77DBCV/N8i6SNSqU5yBMVm0KYnFxBPC
 zn9f99jzJ1WAEpSAxGZ28uFUmzOKMJ7bSWl9D1eO5U82nIc+GmUSHBm3KvV+WT4L+rcF
 utYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDk+crVQywSg2w6yY0LcahvNhT62SpqyGXEgBucgzVUJP7uDfMkG++eYjibzcOq3QEwHLZ/jtb9ekx4boxCvpWVhta064=
X-Gm-Message-State: AOJu0YzW0E6EZCWoAinK802axx9zaSn+JFvnpgnVLXIqaXk511YnVhde
 lbPuH47Ge3EgLbCWV9rWDhO+mbhChvLkVF2Zg5nhyvb6SvXTXm1kRiNJAi2+i6iPh8ISUbpPYSm
 U
X-Google-Smtp-Source: AGHT+IHkjBKpGTnD9xGvDLnsbpHdmwJ5rXo3GW/dIYSKuVupjs6xCFKUVD0+6LiHJf4pkYi3w7g9pA==
X-Received: by 2002:adf:ed4f:0:b0:33d:c217:e8a4 with SMTP id
 u15-20020adfed4f000000b0033dc217e8a4mr11113184wro.14.1710863096299; 
 Tue, 19 Mar 2024 08:44:56 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.166.129])
 by smtp.gmail.com with ESMTPSA id
 i18-20020adffc12000000b0033e786abf84sm12655011wrr.54.2024.03.19.08.44.55
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 19 Mar 2024 08:44:55 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Subject: [PATCH-for-9.1 20/27] target/rx: Convert to TCGCPUOps::get_cpu_state()
Date: Tue, 19 Mar 2024 16:42:49 +0100
Message-ID: <20240319154258.71206-21-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240319154258.71206-1-philmd@linaro.org>
References: <20240319154258.71206-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=no autolearn_force=no
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

Convert cpu_get_tb_cpu_state() to TCGCPUOps::get_cpu_state().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/rx/cpu.h | 11 -----------
 target/rx/cpu.c | 10 ++++++++++
 2 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/target/rx/cpu.h b/target/rx/cpu.h
index 996f121bcd..dcda762212 100644
--- a/target/rx/cpu.h
+++ b/target/rx/cpu.h
@@ -149,17 +149,6 @@ void rx_cpu_unpack_psw(CPURXState *env, uint32_t psw, int rte);
 #define RX_CPU_IRQ 0
 #define RX_CPU_FIR 1
 
-#define TARGET_HAS_CPU_GET_TB_CPU_STATE
-
-static inline void cpu_get_tb_cpu_state(CPURXState *env, vaddr *pc,
-                                        uint64_t *cs_base, uint32_t *flags)
-{
-    *pc = env->pc;
-    *cs_base = 0;
-    *flags = FIELD_DP32(0, PSW, PM, env->psw_pm);
-    *flags = FIELD_DP32(*flags, PSW, U, env->psw_u);
-}
-
 static inline uint32_t rx_cpu_pack_psw(CPURXState *env)
 {
     uint32_t psw = 0;
diff --git a/target/rx/cpu.c b/target/rx/cpu.c
index da673a595d..3b55b09e64 100644
--- a/target/rx/cpu.c
+++ b/target/rx/cpu.c
@@ -58,6 +58,15 @@ static void rx_restore_state_to_opc(CPUState *cs,
     cpu->env.pc = data[0];
 }
 
+static void rx_get_cpu_state(CPURXState *env, vaddr *pc,
+                             uint64_t *cs_base, uint32_t *flags)
+{
+    *pc = env->pc;
+    *cs_base = 0;
+    *flags = FIELD_DP32(0, PSW, PM, env->psw_pm);
+    *flags = FIELD_DP32(*flags, PSW, U, env->psw_u);
+}
+
 static bool rx_cpu_has_work(CPUState *cs)
 {
     return cs->interrupt_request &
@@ -187,6 +196,7 @@ static const TCGCPUOps rx_tcg_ops = {
     .initialize = rx_translate_init,
     .synchronize_from_tb = rx_cpu_synchronize_from_tb,
     .restore_state_to_opc = rx_restore_state_to_opc,
+    .get_cpu_state = rx_get_cpu_state,
     .tlb_fill = rx_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
-- 
2.41.0


