Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28B65C021B6
	for <qemu-riscv@archiver.kernel.org>; Fri, 21 Feb 2025 12:30:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tlS8q-0008SB-2r; Fri, 21 Feb 2025 07:28:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tlS79-0006If-Lq
 for qemu-riscv@nongnu.org; Fri, 21 Feb 2025 07:26:45 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tlS77-0007Zl-Ry
 for qemu-riscv@nongnu.org; Fri, 21 Feb 2025 07:26:43 -0500
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-220f4dd756eso39399955ad.3
 for <qemu-riscv@nongnu.org>; Fri, 21 Feb 2025 04:26:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1740140800; x=1740745600; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/5vHs7s8IDk62c++QK817lUpigrwYrALES9gEU4BPmI=;
 b=W4nVNOIkHyagGY4vO3jFEv7HgwA8bP3epfEEW3M2A2pTGa+q3jOIkerAQcL8MJLZwz
 4cTGoQfTXgzHCCaF5ChrDWHwsy37xxQUg7s02Ub7B44bZ5gK9oW1iZQwONnZCr9zmyQT
 mIC/Sh3OkFgfqUqUTapzPDTzT8laJD0vhwK1CmKKFb+oT/Ha//nj2PnWxqvmuAvbfYoa
 VG1ZNS9pUzXhf7jReD792n3j2ymC65yBy7U8f5eBvZBtiVVoEDOyXceYoa5/KB3WeUSA
 IvLw0+FY8X+FbQwfUaEPhY4M0iKa3K7Gjpxf9ved5TvfVR8g28QnmBmyJbKqZMtmG0RT
 HQQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740140800; x=1740745600;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/5vHs7s8IDk62c++QK817lUpigrwYrALES9gEU4BPmI=;
 b=UIuVQbTglDLreTnYwKiUN5xiqCk/zWVsapzixZdwErunnR0urgdVrTZV8ArJPKvV32
 u3eQ5INB4IrMLjxO/Twnew2BkyY1HzIvQuZUI1CXmPf+dQctPeIABf77cUpq8JpdLb3V
 nFdco8Z2YwoeOKsm2YK5MMIML4k2gcCEXqQ1+sddbLG6mQtGrOTUBz7NvBO2zvuOPqGd
 +ugqtNPJQKLiGfos1BbBAIwkFVz2VhQ8PFDCsCockVHAzRLD4XX56a7mkEze7oR6KWvA
 rUpj6aIxm6sCMbvItLa06Iw0Sf5CwDWH9kVw/lxcgXOIxveVGuZ2ApJgJSm+9LC+OrEx
 Y8ow==
X-Gm-Message-State: AOJu0YytWA20aGri4WXOzfBKimyB2NgmdZd2GejhKJRQawJ3LwWH2x3x
 kPkLMdo5rIiYDqH9y2M3RBUP9viSHjAw7tUgpO1CeUUYFh2xroV+IZoI+F3Y64I=
X-Gm-Gg: ASbGnctdtBBEP9nWJFvsMTfLWFg9ilGc2gXedMzUVfi773sc1tJnqoTGLLUaFIUT1Hj
 yOD6A7UFzFZhQL/M+cNi79w1bSSm1Tpzwf/nUbX5hMR9AaF3nm0mSFHfouqQBkcvluaEEgHpHCo
 Xx+NOpvW0OYi4/aNfMPQqqi3fdS/BGCzgqWuM7Xc/6iQbPZrYpR6jbah7f2Mx2sa/IZ8H0daCm/
 XGvhrvbF6k3RVX5RgW46tfGig8hbH16aZk3/mA542GnYDd0qfjEc3R7ZWuz8ljl0lVzaBe2PAu9
 nz2uZzIhf2ORc1twC51eE9A5pzbRV+7b/xonLpEY8/NlGVIvYOVLOw==
X-Google-Smtp-Source: AGHT+IGxdhq7J04pllruTn2puOm3WoDedsVx72P6r2m/M4y8uZL7gZH9hOUBc0fjulX1ysaHo2OXmA==
X-Received: by 2002:a17:902:db05:b0:21f:768:cced with SMTP id
 d9443c01a7336-2219ff30cfemr34573715ad.8.1740140800154; 
 Fri, 21 Feb 2025 04:26:40 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([187.11.154.120])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-220d545e39bsm137349855ad.124.2025.02.21.04.26.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2025 04:26:39 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 3/3] target/riscv/kvm: add missing KVM CSRs
Date: Fri, 21 Feb 2025 09:26:23 -0300
Message-ID: <20250221122623.495188-4-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250221122623.495188-1-dbarboza@ventanamicro.com>
References: <20250221122623.495188-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x62d.google.com
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

We're missing scounteren and senvcfg CSRs, both already present in the
KVM UAPI.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/kvm/kvm-cpu.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
index f14fcc58bb..017ca82226 100644
--- a/target/riscv/kvm/kvm-cpu.c
+++ b/target/riscv/kvm/kvm-cpu.c
@@ -616,6 +616,8 @@ static void kvm_riscv_reset_regs_csr(CPURISCVState *env)
     env->stval = 0;
     env->mip = 0;
     env->satp = 0;
+    env->scounteren = 0;
+    env->senvcfg = 0;
 }
 
 static int kvm_riscv_get_regs_csr(CPUState *cs)
@@ -631,6 +633,8 @@ static int kvm_riscv_get_regs_csr(CPUState *cs)
     KVM_RISCV_GET_CSR(cs, env, stval, env->stval);
     KVM_RISCV_GET_CSR(cs, env, sip, env->mip);
     KVM_RISCV_GET_CSR(cs, env, satp, env->satp);
+    KVM_RISCV_GET_CSR(cs, env, scounteren, env->scounteren);
+    KVM_RISCV_GET_CSR(cs, env, senvcfg, env->senvcfg);
 
     return 0;
 }
@@ -648,6 +652,8 @@ static int kvm_riscv_put_regs_csr(CPUState *cs)
     KVM_RISCV_SET_CSR(cs, env, stval, env->stval);
     KVM_RISCV_SET_CSR(cs, env, sip, env->mip);
     KVM_RISCV_SET_CSR(cs, env, satp, env->satp);
+    KVM_RISCV_SET_CSR(cs, env, scounteren, env->scounteren);
+    KVM_RISCV_SET_CSR(cs, env, senvcfg, env->senvcfg);
 
     return 0;
 }
-- 
2.48.1


