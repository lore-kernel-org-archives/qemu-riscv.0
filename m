Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41647C87FCB
	for <qemu-riscv@archiver.kernel.org>; Thu, 29 Aug 2024 23:38:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sjof3-00038E-8h; Thu, 29 Aug 2024 19:34:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1sjof1-00030t-AG
 for qemu-riscv@nongnu.org; Thu, 29 Aug 2024 19:34:39 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1sjoeu-00038G-L0
 for qemu-riscv@nongnu.org; Thu, 29 Aug 2024 19:34:39 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-2d3da94f059so949734a91.2
 for <qemu-riscv@nongnu.org>; Thu, 29 Aug 2024 16:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724974471; x=1725579271;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7pauwM0+hP6l/++RwE00z55KwBTr5ElLKZY19bWfmTk=;
 b=cqovEt4FHMZS+GM7v7rkXRJBXYIa9x5ztmCUBSeCiVwoyW6xvt8p2eBR0YKnU+noNF
 0uc41VE9JGztcJQONHjXK5jDFkIopuOLijcnoxRD0CspzptWgwXX2slc5OlnsWcbeFTM
 RxjdCO1SkYop6v6JHPpj6XUnGx7QkUkaV/rkFu92iYn7bnrO7w9eHDJpK2wg1ZxGOtjd
 TzErk1Q0/DJ6WmjqE8evOLer6SYzpaoQmVyRpDLWrp0IMG3ilUG8/TALfwK3sg1JnnkQ
 nkBtyvn3x6PDqQOUSFZ6u5Fptr8DIaxDw1e83kdWXGFsdCJp/JmVXnqgCtm6bRsWI/bi
 v07g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724974471; x=1725579271;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7pauwM0+hP6l/++RwE00z55KwBTr5ElLKZY19bWfmTk=;
 b=b3PdnUPBcmjNwG+yXpKgYjmAGyVhR8E+GfMe7TmWZUOzg8c60nIG3gpXwnoRW51rDz
 nd/39oeuudq6gyqqtIKS6lYV7m8IOff90HPnijYHfxgK35mzTTKf9hQlLElcNBQPUtFv
 vst0beli93rSzxmeBJII1n28WFk/xkkJxbL8+5kh2OGs+zW7QOvMBhHNLH2Og99ISPWg
 Rzu8TKRPIZT1dJXxuvE9iRrPa9jeIH3CiFLdpaMdHT3t4+5yyfcb2VdROXSVj0K9UXnS
 aX1wJ8fhSbe+1ArbqIY+ypQa6/hj7e+iMuTCUseGSl/yGm669SxPKc6hITCZfCkD0pux
 SLgQ==
X-Gm-Message-State: AOJu0YzOgCSavVDfMO5LlzG/Xm53hxEIQ9UlZPHUOV32wYtLSwUx/H+M
 VwGPD8MP1BPiUXiVxTD9UojXGEFVlshH6A09akvPPJF0PaMqnJyu4DdIwe7BQ0fJEKvzR23ylcZ
 G
X-Google-Smtp-Source: AGHT+IELBniDkyLcmWQsB9toxZBF5yjLHx8ql6qQofX4qK9VHid+5bz4gsOBB4E4W9sTKBfYLbQhuw==
X-Received: by 2002:a17:90a:2f04:b0:2c9:6514:39ff with SMTP id
 98e67ed59e1d1-2d8563a03dbmr4814580a91.33.1724974470901; 
 Thu, 29 Aug 2024 16:34:30 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2d85b13df55sm2331074a91.27.2024.08.29.16.34.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2024 16:34:30 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, Alistair.Francis@wdc.com, bmeng.cn@gmail.com,
 liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, jim.shu@sifive.com, andy.chiu@sifive.com,
 kito.cheng@sifive.com, Deepak Gupta <debug@rivosinc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v12 01/20] target/riscv: expose *envcfg csr and priv to
 qemu-user as well
Date: Thu, 29 Aug 2024 16:34:05 -0700
Message-ID: <20240829233425.1005029-2-debug@rivosinc.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240829233425.1005029-1-debug@rivosinc.com>
References: <20240829233425.1005029-1-debug@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=debug@rivosinc.com; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 5 +++++
 target/riscv/cpu.h | 9 +++++----
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 33ef4eb795..c4ea1d4038 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1011,7 +1011,12 @@ static void riscv_cpu_reset_hold(Object *obj, ResetType type)
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
index 87742047ce..270a2a031c 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -226,8 +226,12 @@ struct CPUArchState {
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
@@ -429,12 +433,9 @@ struct CPUArchState {
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
2.44.0


