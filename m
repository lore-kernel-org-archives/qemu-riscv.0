Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0765C369C2
	for <qemu-riscv@archiver.kernel.org>; Fri, 25 Apr 2025 16:03:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u8LVV-000625-Qn; Fri, 25 Apr 2025 12:02:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1u8LVL-0005ro-7A
 for qemu-riscv@nongnu.org; Fri, 25 Apr 2025 12:02:22 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1u8LVJ-0008LP-FA
 for qemu-riscv@nongnu.org; Fri, 25 Apr 2025 12:02:18 -0400
Received: by mail-pg1-x52c.google.com with SMTP id
 41be03b00d2f7-af590aea813so3575732a12.0
 for <qemu-riscv@nongnu.org>; Fri, 25 Apr 2025 09:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1745596934; x=1746201734; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ab0hxCGBF3pfbaX98DmfHee2+O+PPD2JzKONPAU5M6Q=;
 b=c/wFqwj3yRu1ojEQxGEcuqvY4BJujlPaXZ+mHMotK9PQn7hzCJKD8U1J6IMZY52sec
 CpifM41jLy4Ke86nrZVIukQL+GQt76oSJ4PvLF9Ld3YS0lFR4E4An4DJ9+m1G2upvKzt
 DvcoQ+7vcR5BlW9K3ZoTfPvipAzOpYjuPFmbLE73cw1wWReFmtOdSmYWY65pulvRI/bX
 VRcHFR/+JKtvDaz7M+ld6gvYMcx41NNGXnkN0wUcltKVftOF6B8xUOkJDJfq4NHGrUCh
 IUkSMnYWaSgBoVaVYbZ+CkQZfYEziMQvjjQeNKEWHxUK3ytHv1IpYejt7UHnU3MZCdtc
 N7YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745596934; x=1746201734;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ab0hxCGBF3pfbaX98DmfHee2+O+PPD2JzKONPAU5M6Q=;
 b=gCF8GBuZL8KdLNVv0qPQyhqWwATSVFBrxrBals4vzBic8TIupiVJkR/vsaYN5jV24Q
 O3lF7xmfggaj0WQQLPK7SV5gj5Fdq9KUTI6jYULB9OUjtoRaaG4HXQVX6QTzxc9eAvjR
 UqN6j6s0vgIloEBJ31vTh+Kk888nrOIfAlCBt4/2OsQ048n4sKyjMSzlFF7QG/0E+G4f
 w2EGeV9BPemFURNymkbP7w5WzSViszl5X4vrpFHPHB++Rnrn1qg2lDwODQUD0YOM9gGe
 E5teh6z1lO7OPBsyMGsuYpZLlkgDAn7HqDt7MDjdRSXgqZSxMVnIodV58Sl4m8mnsjBI
 /Ytg==
X-Gm-Message-State: AOJu0YzXmG8u0SBpiat91S31nZ7ixEN5E5IkRKotOK0Sn+oaftatf+iN
 IUZ2tDOuIGQbkZpw+xo/ck9Lz9u0axUdEFBM+4uQVIwFPaILhS99YwB02Fa0WeA=
X-Gm-Gg: ASbGnct54o7gDl0D7drHR77RhJ9qxEdKO/VRNdAaO5lyMQekE4eEQbHGPsWqWvAoGr8
 rHvSERKZEsVMVj1rO+v0BJwAyIUBgKY7L5fJqjo65heTX7zrUJPS7gtqyiTEN6XIQQIob3jQ8fz
 cd0lheBXuR7HWxiffkn8E0Zl61yfSEszY0az1YMYwgxfEBes9Z+V9jq1Vs94kunZnSXDNVi7lEr
 4scHjDjpUzaRHgeC5bWozghYr5opgsnupFQXhXF7tdpS4p5fIS2SA/+cVoPS/VVC8TN9T2e4bxc
 p0+RWFNL9Yv9FYITCAArJ1+KLmVB58SQTpy3Nzu+uBiXfIMolCrhhJ50Jf8prPVfqnOx
X-Google-Smtp-Source: AGHT+IEuNTH+uwZZaJHeVoNRdiW7w8HwcKcfZphEgB0v8Bh/ansYim3xn3jpCrDFb6hu6Nl1yBOydw==
X-Received: by 2002:a17:90b:37c4:b0:2fa:21d3:4332 with SMTP id
 98e67ed59e1d1-309ee3f8c4fmr9797093a91.12.1745596934364; 
 Fri, 25 Apr 2025 09:02:14 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([152.234.125.33])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-309f774e534sm1820005a91.17.2025.04.25.09.02.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Apr 2025 09:02:13 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com, ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 2/9] target/riscv/kvm: fix leak in
 kvm_riscv_init_multiext_cfg()
Date: Fri, 25 Apr 2025 13:01:56 -0300
Message-ID: <20250425160203.2774835-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250425160203.2774835-1-dbarboza@ventanamicro.com>
References: <20250425160203.2774835-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pg1-x52c.google.com
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

'reglist' is being g-malloc'ed but never freed.

Reported-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 target/riscv/kvm/kvm-cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
index accad4c28e..6ba122f360 100644
--- a/target/riscv/kvm/kvm-cpu.c
+++ b/target/riscv/kvm/kvm-cpu.c
@@ -1119,10 +1119,10 @@ static void kvm_riscv_read_vlenb(RISCVCPU *cpu, KVMScratchCPU *kvmcpu,
 
 static void kvm_riscv_init_multiext_cfg(RISCVCPU *cpu, KVMScratchCPU *kvmcpu)
 {
+    g_autofree struct kvm_reg_list *reglist = NULL;
     KVMCPUConfig *multi_ext_cfg;
     struct kvm_one_reg reg;
     struct kvm_reg_list rl_struct;
-    struct kvm_reg_list *reglist;
     uint64_t val, reg_id, *reg_search;
     int i, ret;
 
-- 
2.49.0


