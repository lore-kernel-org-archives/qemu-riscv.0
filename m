Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A3EDEEE270
	for <qemu-riscv@archiver.kernel.org>; Thu, 12 Sep 2024 23:53:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sotcw-0004HD-GN; Thu, 12 Sep 2024 19:53:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1sotcv-0004GH-Hs
 for qemu-riscv@nongnu.org; Thu, 12 Sep 2024 19:53:29 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1sotct-00087C-G6
 for qemu-riscv@nongnu.org; Thu, 12 Sep 2024 19:53:29 -0400
Received: by mail-pg1-x535.google.com with SMTP id
 41be03b00d2f7-7db238d07b3so1144610a12.2
 for <qemu-riscv@nongnu.org>; Thu, 12 Sep 2024 16:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1726185206; x=1726790006;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TMePisP4WQCzboJNarE0AWmbKJNyXZU7VtdMcudOguQ=;
 b=ZjAOEDzlcsXVfwF3HZx57uFQt2QUyH6HEbKSawT9SPg/Y0M6+PGm4/f6ubhOFizI22
 VNA2za4r3AT2j8CZsX+62BFAXm2xMiWo2MFjvGl24zeuBNK0LyIysx6ulz9S0p2TgzmA
 FF1+VYWOmzyJeFcBMpb88Tphdn1wLJdN2TWWbFVExbFaNgnaovn2uYqUKijxbm6OPonx
 RWJrUEzO+fw5K31X+DWLKdcU67+fQDORLA7tJRG699b/LkKA4tY14s9BNRe7zAjL2a/G
 rtlxZVAIAdeTow8gLMIvuBatvHOXOzal7CPlvhOZ9RTr97M3ueNwnG1liiatUjXTRvOh
 6NYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726185206; x=1726790006;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TMePisP4WQCzboJNarE0AWmbKJNyXZU7VtdMcudOguQ=;
 b=CjuZCXWxpQSVdi9mV7cUzKrzG6q2EtniSpiFhjnNpH+trCv/fHcH2hcOtUieKpalqq
 NljuINRIyiRlvmZ/ruF+4bYCcpKmZNB7xnymFegxAVQKx6IDzUtouV0g9JpnHey5/qBh
 wFzTBotxFzS2aw6UUcoCbUnSsq2Js9BJum+AuGapoqOKtzbmB6LRf+8TfV43jX7bV2Be
 EHIBn72JoEKYXdNxi4i680Zl/iK9AXLflmjYFKXI5rDnx6GxPA8nDakcO4PFIbJvTTfg
 ygGg3wQYXFMksAZnJsdfEjPnXvCBudlrDRhUIRnyd7Ijj/FS1WTNnnlQ6A59FWL/ilFU
 WSJQ==
X-Gm-Message-State: AOJu0YxGOSERjXi4ogRlzWsiB3Cmy7InvS+tR1r02oAUwFBLOH2P4u/q
 hmaZZLC1eflkRsU+WsZbSLleiGlHyBrOwqguhMhenHRTmrYl2dRK0CB3tU30wUxf67csrAw8wps
 4
X-Google-Smtp-Source: AGHT+IGcROfhgI7acfcQOPNZzTECr48kuMlHpAdGSECyx2jP0g8PE+lABTw0kcrrKAuNauC+5tkjQQ==
X-Received: by 2002:a05:6a20:c793:b0:1cf:e5e5:24ad with SMTP id
 adf61e73a8af0-1cfe5e524e3mr4435082637.30.1726185205661; 
 Thu, 12 Sep 2024 16:53:25 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71908fe22e6sm5102229b3a.66.2024.09.12.16.53.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Sep 2024 16:53:25 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, Alistair.Francis@wdc.com, bmeng.cn@gmail.com,
 liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, jim.shu@sifive.com, andy.chiu@sifive.com,
 kito.cheng@sifive.com, Deepak Gupta <debug@rivosinc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v14 01/20] target/riscv: expose *envcfg csr and priv to
 qemu-user as well
Date: Thu, 12 Sep 2024 16:53:01 -0700
Message-ID: <20240912235320.3768582-2-debug@rivosinc.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240912235320.3768582-1-debug@rivosinc.com>
References: <20240912235320.3768582-1-debug@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=debug@rivosinc.com; helo=mail-pg1-x535.google.com
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

Execution environment config CSR controlling user env and current
privilege state shouldn't be limited to qemu-system only. *envcfg
CSRs control enabling of features in next lesser mode. In some cases
bits *envcfg CSR can be lit up by kernel as part of kernel policy or
software (user app) can choose to opt-in by issuing a system call
(e.g. prctl). In case of qemu-user, it should be no different because
qemu is providing underlying execution environment facility and thus
either should provide some default value in *envcfg CSRs or react to
system calls (prctls) initiated from application. priv is set to PRV_U
and menvcfg/senvcfg set to 0 for qemu-user on reest.

`henvcfg` has been left for qemu-system only because it is not expected
that someone will use qemu-user where application is expected to have
hypervisor underneath which is controlling its execution environment. If
such a need arises then `henvcfg` could be exposed as well.

Relevant discussion:
https://lore.kernel.org/all/CAKmqyKOTVWPFep2msTQVdUmJErkH+bqCcKEQ4hAnyDFPdWKe0Q@mail.gmail.com/

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 5 +++++
 target/riscv/cpu.h | 9 +++++----
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index cb675f0278..3538c2ae2e 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1024,7 +1024,12 @@ static void riscv_cpu_reset_hold(Object *obj, ResetType type)
     }
 
     pmp_unlock_entries(env);
+#else
+    env->priv = PRV_U;
+    env->senvcfg = 0;
+    env->menvcfg = 0;
 #endif
+
     env->xl = riscv_cpu_mxl(env);
     riscv_cpu_update_mask(env);
     cs->exception_index = RISCV_EXCP_NONE;
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 1619c3acb6..2623f6cf75 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -234,8 +234,12 @@ struct CPUArchState {
     uint32_t elf_flags;
 #endif
 
-#ifndef CONFIG_USER_ONLY
     target_ulong priv;
+    /* CSRs for execution environment configuration */
+    uint64_t menvcfg;
+    target_ulong senvcfg;
+
+#ifndef CONFIG_USER_ONLY
     /* This contains QEMU specific information about the virt state. */
     bool virt_enabled;
     target_ulong geilen;
@@ -445,12 +449,9 @@ struct CPUArchState {
     target_ulong upmmask;
     target_ulong upmbase;
 
-    /* CSRs for execution environment configuration */
-    uint64_t menvcfg;
     uint64_t mstateen[SMSTATEEN_MAX_COUNT];
     uint64_t hstateen[SMSTATEEN_MAX_COUNT];
     uint64_t sstateen[SMSTATEEN_MAX_COUNT];
-    target_ulong senvcfg;
     uint64_t henvcfg;
 #endif
     target_ulong cur_pmmask;
-- 
2.45.0


