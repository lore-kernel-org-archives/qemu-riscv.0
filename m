Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B22BFC3DA63
	for <qemu-riscv@archiver.kernel.org>; Tue, 23 Jul 2024 23:32:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sWOyU-00050J-0R; Tue, 23 Jul 2024 19:31:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1sWOxz-0002Tu-UL
 for qemu-riscv@nongnu.org; Tue, 23 Jul 2024 19:30:47 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1sWOxt-0007zd-PW
 for qemu-riscv@nongnu.org; Tue, 23 Jul 2024 19:30:45 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-2cb510cd097so3591919a91.1
 for <qemu-riscv@nongnu.org>; Tue, 23 Jul 2024 16:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721777439; x=1722382239;
 darn=nongnu.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=xoi8tQlmstuJQE5BtIWLC+NlXYaPeyqDg2JVEoxweos=;
 b=gGqnxuWvMvnUep896uXT7C50W3a4UdQRkZV36bHbxKdScPrRQOU7SfszWdb3gJSQ9F
 ellMISAEhvZKfIXzKkVh0SN1LcAfNeMcdJTa+R1q3D9InSrwWmy8IABwiP9587Cwv4Ej
 ZYoEO+PfueQMT/zr2faK8+W7EvlCtLIQxHhm7ZCNiClDT4bI2uM+CyAJ/w151/snPCK+
 /7jQMu+bQv6A5AXVP5zD4Ry6n+2IcRWnXFuIPgM/aOR3an7n+w1fRlW1FqaYZdHco2Xg
 mAqjJjC4irxzm2tb6+CuVtavcrF+a9ukiOQqSnSXMvaqlA8oaOiwAJUsrsrM6VZRxbvC
 +Ddw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721777439; x=1722382239;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xoi8tQlmstuJQE5BtIWLC+NlXYaPeyqDg2JVEoxweos=;
 b=H4i8k8e3Pb3jIVQEonM53gmBXWNG3DHfs6zymvjrOrIhN4B1r7Bfs7iQx/UdanIa3V
 dFHnw9+n4whcQUpE74tPEs83eE0VBGx+3ztkgoW1ZgJn6KhJAn8E/z3DQ0r/l4hPY4vL
 Rl5OwDqwn3cJ6UQETJBSYmW/E7K2GebvrIs9UbgzPx6Qwf4N0sHhSjI6cRY5lPDTo3m8
 mu+R2zzCQ3BVoWvHFVXvLjYnXPlX1Hd39zfKy8EhYsDOqypuH7QAL4rqmj1nGjXCebKb
 ZZ/N7Tfw2XnoeqCqqlct2nggPuNlsFzCHV47FIRo++TwxqsF9K8XO4p9MFyNKwrukHqA
 FmcA==
X-Gm-Message-State: AOJu0Yx8ikojX7QIYx6d6NdGt+FbGmNELdxV2XEF0IGwNV9l3coFT7NL
 NYfHaqlazZZibq6Mvrn+6hxz302DJvUqVgudGxWWQ7cHM4DyTG6E45o5HhU35vA=
X-Google-Smtp-Source: AGHT+IF6UbMkHQ+IeO2x0d8mYCC8dzs0JCjlRdGh0Lg3sEh4YYIWpQwu3frc/rBq7VIcgYvwRWOJnQ==
X-Received: by 2002:a17:90a:f28e:b0:2cb:e429:f525 with SMTP id
 98e67ed59e1d1-2cdb51a6543mr585954a91.33.1721777439152; 
 Tue, 23 Jul 2024 16:30:39 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2cdb74e894csm179217a91.41.2024.07.23.16.30.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jul 2024 16:30:38 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Tue, 23 Jul 2024 16:30:10 -0700
Subject: [PATCH v2 13/13] target/riscv: Enable PMU related extensions to
 preferred rule
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240723-counter_delegation-v2-13-c4170a5348ca@rivosinc.com>
References: <20240723-counter_delegation-v2-0-c4170a5348ca@rivosinc.com>
In-Reply-To: <20240723-counter_delegation-v2-0-c4170a5348ca@rivosinc.com>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 bin.meng@windriver.com, dbarboza@ventanamicro.com, alistair.francis@wdc.com
X-Mailer: b4 0.15-dev-13183
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=atishp@rivosinc.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Counter delegation/configuration extension requires the following
extensions to be enabled.

1. Smcdeleg - To enable counter delegation from M to S
2. S[m|s]csrind - To enable indirect access CSRs
3. Smstateen - Indirect CSR extensions depend on it.
4. Sscofpmf - To enable counter overflow feature
5. S[m|s]aia - To enable counter overflow feature in virtualization
6. Smcntrpmf - To enable privilege mode filtering for cycle/instret

While first 3 are mandatory to enable the counter delegation,
next 3 set of extension are preferred to enable all the PMU related
features. That's why, enable all of these if Ssccfg extension is
enabled from the commandline.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/cpu.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 22ba43c7ff2a..abebfcc46dea 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -2665,8 +2665,20 @@ RISCVCPUImpliedExtsRule *riscv_multi_ext_implied_rules[] = {
     NULL
 };
 
+static RISCVCPUPreferredExtsRule SSCCFG_PREFERRED = {
+    .ext = CPU_CFG_OFFSET(ext_ssccfg),
+    .preferred_multi_exts = {
+        CPU_CFG_OFFSET(ext_smcsrind), CPU_CFG_OFFSET(ext_sscsrind),
+        CPU_CFG_OFFSET(ext_ssaia), CPU_CFG_OFFSET(ext_smaia),
+        CPU_CFG_OFFSET(ext_smstateen), CPU_CFG_OFFSET(ext_sscofpmf),
+        CPU_CFG_OFFSET(ext_smcntrpmf), CPU_CFG_OFFSET(ext_smcdeleg),
+
+        RISCV_PREFRRED_EXTS_RULE_END
+    },
+};
+
 RISCVCPUPreferredExtsRule *riscv_multi_ext_preferred_rules[] = {
-    NULL
+    &SSCCFG_PREFERRED, NULL
 };
 
 static Property riscv_cpu_properties[] = {

-- 
2.34.1


