Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1AAFC61DF4
	for <qemu-riscv@archiver.kernel.org>; Fri, 24 Nov 2023 20:25:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r6cj3-0001yX-Vc; Fri, 24 Nov 2023 15:24:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1r6cj2-0001xu-8t
 for qemu-riscv@nongnu.org; Fri, 24 Nov 2023 15:24:32 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1r6cj0-0005IQ-MY
 for qemu-riscv@nongnu.org; Fri, 24 Nov 2023 15:24:32 -0500
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1cfa8f7c356so5190285ad.2
 for <qemu-riscv@nongnu.org>; Fri, 24 Nov 2023 12:24:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1700857469; x=1701462269; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=idOjzqB/2N8r45g3xvXzJsWeC0Y1TlRo66OPhQFDTfY=;
 b=VC9WV/Vz09t3o5JmQQhLjx2F59R7Vdgk2nquyyWHc7bFEbCqz7SQSrdqxIBGsmIOxn
 w2TjhqsabwNtLJvcbASA+Q7miCSqcLlYVuP8xe/803kYCdlpcyqqRmGf32vP/IIBclMY
 psBbuq5m76Ce80SbaGr8yAt4wGXbvZjpV/5wYO1So2a/Mh/HMgAk/xYMXwfN8jvBHIy9
 H2T3WgTcfp28VfbgkCloQiKz7m7arGIJ0WcVbeS3pv5etfeRMtDdqwwpEdlMgmLNe85B
 BaivmLev2ojIXWW2x45ytI2de/A+S+TP1GQhzeYGTSluZbNfu49SwBdY/UN4s0/9wiz4
 vgGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700857469; x=1701462269;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=idOjzqB/2N8r45g3xvXzJsWeC0Y1TlRo66OPhQFDTfY=;
 b=RhMKosm2NciLgxZzW2eHiBUgcEs5JQiaeGR3BZ2dsf8c/pVHgrVmd0uGF0mH9C0enG
 wbnk97dhOaSoB6XgzTO/YtFvSoKpJfekhGnoqPAAf48JJPuZUAVhYLPjn5FgBZDga5Tr
 4BPXhqnzsKFL4MilzLRSp+lR3KjZCwD+p8t1NQT1UIxV5pjl179dDxu9sYpMGlkx3wqQ
 saldPCG6N2nWfp1t/hOPUX/IXnGqQ2ccpC1ExyQDe5AugFRwL5QyBZqgSIJxMMoDCtGg
 NdRWJ3dcz0TLYWFIUOyvEFzQwp/Jv80ZXKNiIFuu+gMyNZb9n9vV4CkDujNIY77IlMlX
 KSnQ==
X-Gm-Message-State: AOJu0YxcaOMmueN/cMgCbhwoUwP5xdUEA8C8VJEB4yt6OPwpyIg1zdPM
 L6GqVEeA9CRFUJ3vgiIQuWwQQA==
X-Google-Smtp-Source: AGHT+IHXQ9oyKH9frxe/t2DnDGYd37bKm+MZeafkFjWtloFUa/S/i1KVVnkXl4jYmwl8GtRsKST+Cg==
X-Received: by 2002:a17:902:d2d1:b0:1cc:6fa6:ab62 with SMTP id
 n17-20020a170902d2d100b001cc6fa6ab62mr4162262plc.29.1700857469300; 
 Fri, 24 Nov 2023 12:24:29 -0800 (PST)
Received: from grind.. ([152.250.131.119]) by smtp.gmail.com with ESMTPSA id
 t24-20020a1709028c9800b001c59f23a3fesm3548267plo.251.2023.11.24.12.24.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 12:24:28 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-9.0 v12 09/18] target/riscv/kvm: add 'rva22u64' flag as
 unavailable
Date: Fri, 24 Nov 2023 17:23:44 -0300
Message-ID: <20231124202353.1187814-10-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231124202353.1187814-1-dbarboza@ventanamicro.com>
References: <20231124202353.1187814-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x632.google.com
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
index 78fa1fa162..9c6ff774b5 100644
--- a/target/riscv/kvm/kvm-cpu.c
+++ b/target/riscv/kvm/kvm-cpu.c
@@ -398,7 +398,7 @@ static void cpu_set_cfg_unavailable(Object *obj, Visitor *v,
     }
 
     if (value) {
-        error_setg(errp, "extension %s is not available with KVM",
+        error_setg(errp, "'%s' is not available with KVM",
                    propname);
     }
 }
@@ -479,6 +479,11 @@ static void kvm_riscv_add_cpu_user_properties(Object *cpu_obj)
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


