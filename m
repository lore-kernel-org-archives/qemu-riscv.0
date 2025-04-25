Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE434C369D8
	for <qemu-riscv@archiver.kernel.org>; Fri, 25 Apr 2025 16:03:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u8LVh-0006Qa-FS; Fri, 25 Apr 2025 12:02:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1u8LVe-0006Lv-Ui
 for qemu-riscv@nongnu.org; Fri, 25 Apr 2025 12:02:39 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1u8LVd-0008Op-9w
 for qemu-riscv@nongnu.org; Fri, 25 Apr 2025 12:02:38 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-30332dfc820so2935683a91.2
 for <qemu-riscv@nongnu.org>; Fri, 25 Apr 2025 09:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1745596955; x=1746201755; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kATB84zbfEXPZ6YqIw/ahyT/QtK1o9FhvUc+qOMtYDE=;
 b=X2e+aAP3cSAsgLRBYY87vXDipljzve6VcZSdBPf7CL0nzSvRFjHs6ar2vtt2s/kLzZ
 f8NW5ljt8wTgBrHekgZcOPR4K4kZaX4OPydmD40GWGL0LNwI2IRvzSqNspC63fHtE2/L
 yuhnEvTKk4IyjO5mF/jpTM+hFjpO3InlRFlQ+RVWsjVQu/N/5bWKJkcJmHvQCzvm7NRw
 zzw72GZE2RksQHu7o4h0+C9OLmDUA7z0YAao+0qMComCNKeZfBNgHYrUyXcTaLoOOwR9
 iNtiQGq9dVDPanf6XKZAGnwWLCgG50syq3tw6dxuHj7QCo4q1I5SUvOt+J2qzi+HHnAa
 l6dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745596955; x=1746201755;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kATB84zbfEXPZ6YqIw/ahyT/QtK1o9FhvUc+qOMtYDE=;
 b=GaGiPvYGn3ap2tKjQWSCDozJfdU4gXnji4xZY/O11hSiS9cstMKivhE7NxxGqJ/y1p
 xNphWpUusCmTQNyTZQWCeGgpWXMPniCzQvcIx9xKVVcVB4/l4cRI8fOQzi/bcgDT44rw
 ShfcQUkdXPdu36GY/zlq8QYtmqVlhGTWKsKcoz1QInoe8pXUw44oER47ftLqB/eVx2+n
 51JdoIxLt29dVkg6lvKsrCcjJ5hIuAQBfyHOD48CNRdTBiL/GlU3mXGpWUmDImhUV3U9
 ysvYApT3S+aJpw/r2tB8N1C8lHx4cElBIIMVksoixUKke2YuxK/2IiJDrxaXAPpuTU/Z
 bvJg==
X-Gm-Message-State: AOJu0YxmY5Af20NzWV4DO4ywNWiIPPReKTIlOmlAN3gmORaR1EEZuxt5
 GTUM24FbbGrhPOgtEND9pWcbV2t1w1gzYJ7fYSE8vZJF9o6jAiloHeguxojhDZo=
X-Gm-Gg: ASbGncvZi/LIZGQ5OsnyrGM9Ms9VI+jOZClP458gT5DILedliYc0ZtQV6UJyEtKSEzy
 zkfRNQ7YEpjSpgPjctYRPVdKSSw7cexheF59dGOqHIkRfjLDkLS6Vu0RApUTYbZgF4pFK7WYd1M
 yc/1z6JnXgkvJ6jF0Lwo6KeDyQG7WR9sk6a0qO7BUMwffK/cmEgLlsSgSQhrpbNKEt4HvMCGWWf
 IEKB/CO2lQiK0b7Mh1bxN242a8xgGaIWWLu9/wpBK9l4BZQ+ZDBkYT2A0IXTTWtRLa22WCwsx8p
 rh6NIsrE81lnNWMutZlnmziw1cVLf+Rk1REX8HMoNgzSI/IxcBU0+k3UgSSlKzGu/Cdr
X-Google-Smtp-Source: AGHT+IFiBPB1/nKr7flUvjzktqlY1uZoC8rOxI6FN5d5DbyvlTLkm6bfBPRU+pSBtPrnB98gNrjUpg==
X-Received: by 2002:a17:90b:2741:b0:2ee:c91a:acf7 with SMTP id
 98e67ed59e1d1-309f7da6d24mr4486174a91.4.1745596955015; 
 Fri, 25 Apr 2025 09:02:35 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([152.234.125.33])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-309f774e534sm1820005a91.17.2025.04.25.09.02.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Apr 2025 09:02:34 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com, ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 9/9] target/riscv/kvm: add scounteren CSR
Date: Fri, 25 Apr 2025 13:02:03 -0300
Message-ID: <20250425160203.2774835-10-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250425160203.2774835-1-dbarboza@ventanamicro.com>
References: <20250425160203.2774835-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pj1-x1033.google.com
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

Now that CPURISCVState::scounteren is a target_ulong, add support for
the scounteren KVM CSR.

Reported-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 target/riscv/kvm/kvm-cpu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
index 5efee8adb2..65d6710e4a 100644
--- a/target/riscv/kvm/kvm-cpu.c
+++ b/target/riscv/kvm/kvm-cpu.c
@@ -249,6 +249,7 @@ static KVMCPUConfig kvm_csr_cfgs[] = {
     KVM_CSR_CFG("stval",      stval,      RISCV_CSR_REG(stval)),
     KVM_CSR_CFG("sip",        mip,        RISCV_CSR_REG(sip)),
     KVM_CSR_CFG("satp",       satp,       RISCV_CSR_REG(satp)),
+    KVM_CSR_CFG("scounteren", scounteren, RISCV_CSR_REG(scounteren)),
     KVM_CSR_CFG("senvcfg",    senvcfg,    RISCV_CSR_REG(senvcfg)),
 };
 
@@ -699,6 +700,7 @@ static void kvm_riscv_reset_regs_csr(CPURISCVState *env)
     env->stval = 0;
     env->mip = 0;
     env->satp = 0;
+    env->scounteren = 0;
     env->senvcfg = 0;
 }
 
-- 
2.49.0


