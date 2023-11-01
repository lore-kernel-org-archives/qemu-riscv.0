Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91F40C4332F
	for <qemu-riscv@archiver.kernel.org>; Wed,  1 Nov 2023 20:44:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qyI33-0002l1-Gr; Wed, 01 Nov 2023 16:42:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qyI31-0002kE-S4
 for qemu-riscv@nongnu.org; Wed, 01 Nov 2023 16:42:43 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qyI2z-0000kZ-8i
 for qemu-riscv@nongnu.org; Wed, 01 Nov 2023 16:42:43 -0400
Received: by mail-yb1-xb35.google.com with SMTP id
 3f1490d57ef6-d9abc069c8bso181057276.3
 for <qemu-riscv@nongnu.org>; Wed, 01 Nov 2023 13:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698871360; x=1699476160; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NzlbiQ+OWiuQaLiREzwSbJ6YhgK4c0yS/a9TyPGRRgU=;
 b=K/JofTD3x13u2FOHCjjlWyS9Lzgkj12ZuIctznqkQAv2bO1px4iAFk4SSYwY1YeD10
 o8fNXn8qEHhWBOGjxW1v/YhPRlUy88etr/FiNWAue+NVOBzX69Sv1B2nJQmllto4CqU3
 fWAtFnMZXNtC8SMTZ+ESTewBojiDtm9fRDL5aPt11h14ZNWdhuq8nJtO4PaRZ2zkrxYs
 OM4D+7jWEzQT/xA1SiNdCm5ljQEKtGhDGLZJKlUj52tpiXxUm9s3LZ7z9fRGbs5Snw47
 rcheNdoZ7MWb1PXBtwVeKM+ovW3m2rEC5hanYhQGssPQqbhwF9rewXMlL+PsxH75riQr
 7saw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698871360; x=1699476160;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NzlbiQ+OWiuQaLiREzwSbJ6YhgK4c0yS/a9TyPGRRgU=;
 b=EOzl4I5lJHHnHrvV2vB9xAzPFuVueo6TB0U1jkayMT1nYPzYByVwOibCopJg7KYZIz
 gqSTlknGY3OM+2NsBQ+YLJC+TFP7d2mewugbPRKNiMgqHFQwsksNSZDaj39cAacZW2N4
 zPYs3fRCHBnJmKE55qNOJm4LZCEtA1laOq6odX9uXVaSf73q93JX2dcyHNxUH5EKKQ2v
 izG1IqkUv118LohADc15ZYhUCYgcd9NFoQd6Ltl9Q7VVEKZlqjGNSQhsAtVp//DYrbhm
 JTqkffY8FC5IylNl7kxa3T5mHkKo3QZmUr3shyTsykJMq/vHbEermlDiwOy+f2St0iqI
 GK7g==
X-Gm-Message-State: AOJu0YxY9wsC/X3gzbd/tq6YJZyCG5/PPaU4C7+sIvd5VirCq/WZLDcT
 JRrz4NEt5X8/G7MmrTw02MOpDA==
X-Google-Smtp-Source: AGHT+IHVcgcZSR3doe7k8NWo7ga9mtZrLooAmtr8tqO3LDReahoE7SYemV/cDeWvDFlACrnNtwOt9Q==
X-Received: by 2002:a25:cfd1:0:b0:d9a:b70c:d32b with SMTP id
 f200-20020a25cfd1000000b00d9ab70cd32bmr14273649ybg.41.1698871360326; 
 Wed, 01 Nov 2023 13:42:40 -0700 (PDT)
Received: from grind.. ([179.193.10.161]) by smtp.gmail.com with ESMTPSA id
 z187-20020a2533c4000000b00d9cc49edae9sm329724ybz.63.2023.11.01.13.42.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Nov 2023 13:42:40 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v8 11/19] target/riscv/kvm: add 'rva22u64' flag as unavailable
Date: Wed,  1 Nov 2023 17:41:56 -0300
Message-ID: <20231101204204.345470-12-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231101204204.345470-1-dbarboza@ventanamicro.com>
References: <20231101204204.345470-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-yb1-xb35.google.com
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
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 target/riscv/kvm/kvm-cpu.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
index a11c0e4a99..c5167d474a 100644
--- a/target/riscv/kvm/kvm-cpu.c
+++ b/target/riscv/kvm/kvm-cpu.c
@@ -393,7 +393,7 @@ static void cpu_set_cfg_unavailable(Object *obj, Visitor *v,
     }
 
     if (value) {
-        error_setg(errp, "extension %s is not available with KVM",
+        error_setg(errp, "'%s' is not available with KVM",
                    propname);
     }
 }
@@ -474,6 +474,11 @@ static void kvm_riscv_add_cpu_user_properties(Object *cpu_obj)
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


