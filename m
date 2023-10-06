Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5FA3E81DF4
	for <qemu-riscv@archiver.kernel.org>; Fri,  6 Oct 2023 13:23:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qokmQ-00062u-Q2; Fri, 06 Oct 2023 09:22:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qokmC-0005vR-JU
 for qemu-riscv@nongnu.org; Fri, 06 Oct 2023 09:21:57 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qokmA-00039E-R8
 for qemu-riscv@nongnu.org; Fri, 06 Oct 2023 09:21:56 -0400
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1c87a85332bso16949465ad.2
 for <qemu-riscv@nongnu.org>; Fri, 06 Oct 2023 06:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1696598512; x=1697203312; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CYrtWgCLjuFqK3RmFRFzS2KEs06tGcGYHPYhy2oGVUI=;
 b=UkPejgKzu0l0Yx0toS13WXd3wE/JEhy7D3GGqiMHeszY5x+uj6dBcRLLWTR/RrOkO7
 +cIjVO37DVlrSps2vwlCmC9epEnUKcp4YDhOEVljFE5oFaIt2kk5PBPsssho3x7tCRYr
 sPd7kvPS+2e5JbyKR9YbWXNx/BkWa+ZGQS0pY952gyn93A2rHYAwkqhl5auFnlYzXawk
 36lRqSEtcZQlmgzYfqvfmTkJnMB5TFJWXmmEdLJWW3z4k0CEIS8xApXSx9RAe64Kmp5J
 n35x/DstvMfDqDNAM0bFASfGVAvJxRO6e8hcBMVePduEIgyMdHLR7CggHcYnq/V3yB99
 sO/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696598512; x=1697203312;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CYrtWgCLjuFqK3RmFRFzS2KEs06tGcGYHPYhy2oGVUI=;
 b=LNzxXofjVh11XlzRBptGvdJj65zMTbhS4SGGSHhD571PK7GS0n+m3x8ZIvWGDUrPFZ
 +/DA1M/4zTtiFMxIu6sAFFVG5CUwYryo2UrQKpe2F14zBJ8eYglEbWSxImems6+Hi4Lz
 RHGRuYmyILirEaKC8npWudtrBQ9f01/jGeyKVsjzcP1INxYtLbUxnlZ5Mn9jCmqXDr3I
 eYWKptG/Up7K2gaVZUeS6wLAiDizjdDjiziCpd9+08DA1MSYcLUvx8OmKfR4yrd00Hk5
 zEKaG7MjjcRy2aTNy6dSvhOAKyGA/790voEutqi0F028QKYGm2zvDWmuoKBP/PYAEPW5
 9/lQ==
X-Gm-Message-State: AOJu0YxB/6yW56Vh8i8weuM5sCKTSlr8CI9Q3/CsCEoxWoHmIfgQx/6m
 mTgTgLaOuWmBfx81RqVQbgegLA==
X-Google-Smtp-Source: AGHT+IEOgbMCTfZ9XPgmSRJCClN+KXwcn9ZvK1QY0n80DqJN11EhaQFcMQnrgeVThD22BZzFR7nSew==
X-Received: by 2002:a17:902:d349:b0:1c5:e527:68b0 with SMTP id
 l9-20020a170902d34900b001c5e52768b0mr8051272plk.62.1696598512680; 
 Fri, 06 Oct 2023 06:21:52 -0700 (PDT)
Received: from grind.. ([177.94.42.196]) by smtp.gmail.com with ESMTPSA id
 c12-20020a170902c1cc00b001c60a548331sm3796669plc.304.2023.10.06.06.21.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Oct 2023 06:21:52 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 04/10] target/riscv/kvm: add 'rva22u64' flag as unavailable
Date: Fri,  6 Oct 2023 10:21:28 -0300
Message-ID: <20231006132134.1135297-5-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231006132134.1135297-1-dbarboza@ventanamicro.com>
References: <20231006132134.1135297-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x629.google.com
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

KVM does not have the means to support enabling the rva22u64 profile.
The main reasons are:

- we're missing support for some mandatory rva22u64 extensions in the
  KVM module;

- we can't make promises about enabling a profile since it all depends
  on host support in the end.

We'll revisit this decision in the future if needed. For now mark the
'rva22u64' profile as unavailable when running a KVM CPU:

$ qemu-system-riscv64 -machine virt,accel=kvm -cpu rv64,rva22u64=true
qemu-system-riscv64: can't apply global rv64-riscv-cpu.rva22u64=true:
    'rva22u64' is not available with KVM

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/kvm/kvm-cpu.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
index c6615cb807..5f563b83df 100644
--- a/target/riscv/kvm/kvm-cpu.c
+++ b/target/riscv/kvm/kvm-cpu.c
@@ -358,7 +358,7 @@ static void cpu_set_cfg_unavailable(Object *obj, Visitor *v,
     }
 
     if (value) {
-        error_setg(errp, "extension %s is not available with KVM",
+        error_setg(errp, "'%s' is not available with KVM",
                    propname);
     }
 }
@@ -438,6 +438,11 @@ static void kvm_riscv_add_cpu_user_properties(Object *cpu_obj)
     riscv_cpu_add_kvm_unavail_prop_array(cpu_obj, riscv_cpu_extensions);
     riscv_cpu_add_kvm_unavail_prop_array(cpu_obj, riscv_cpu_vendor_exts);
     riscv_cpu_add_kvm_unavail_prop_array(cpu_obj, riscv_cpu_experimental_exts);
+
+   /* We don't have the needed KVM support for profiles */
+    for (i = 0; riscv_profiles[i] != NULL; i++) {
+        riscv_cpu_add_kvm_unavail_prop(cpu_obj, riscv_profiles[i]->name);
+    }
 }
 
 static int kvm_riscv_get_regs_core(CPUState *cs)
-- 
2.41.0


