Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1D18C4332F
	for <qemu-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 22:48:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qygRa-0006k7-0r; Thu, 02 Nov 2023 18:45:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qygRA-0006Su-H8
 for qemu-riscv@nongnu.org; Thu, 02 Nov 2023 18:45:16 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qygR8-0003Jt-O2
 for qemu-riscv@nongnu.org; Thu, 02 Nov 2023 18:45:16 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-5a7eef0b931so18203647b3.0
 for <qemu-riscv@nongnu.org>; Thu, 02 Nov 2023 15:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698965113; x=1699569913; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=idOjzqB/2N8r45g3xvXzJsWeC0Y1TlRo66OPhQFDTfY=;
 b=W2euucFv4tgcmDIjZA/mbis1fAAER0+fQgEmxMfMctFsfO4nsZOP4LZcoyDEv5VtBm
 dfjx8SMxLdDkjRf4ZsfZx+qcqs1QYGdOsNFF5qkjhwqR0omMufCodc4sYKGrjCO4WKZO
 3A+1FNUYxdt/DFtQVkC5Il2we/CKRo83HWwrv3U3irNqKRg7Hp5QmmJR9QNSdor0lGE2
 z8EcCsutkAd2nkXlmqRPqcNFTkobnFed3kI00dI4Olu2noQfJNr4xNopLT77FH6Zv1EZ
 qBoqTaBjjIFl5T2phPVI/2fd4SL57lthXGpNUfiX9fvP3zv2TMJE+nb7PDu8h/v7LxKD
 8RUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698965113; x=1699569913;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=idOjzqB/2N8r45g3xvXzJsWeC0Y1TlRo66OPhQFDTfY=;
 b=CyGf36VD7CfdxOavqSSksV57wVBa+US3DUTYS5W7C+nF/tTHH/OnD1gZ5c2xW6Idjk
 EbLQPvJlA/0ED1+OLgegVnWQ9MmHDOVPQBtfzMebjuGF3v78l8NKCd+TxeM3flgWpj7y
 m0gsf2B02FyC+4CHigWZ/3APdslGWJAw8r37agkEYHC7GcYKY7xDH6rSE1S7Fo3GcifK
 h8xwzdql1aeG7cUR4xjE3WQEVPC81cWQHcwHDhzuQGzLUbILza+39PD4YbZs7VzJmH5V
 Ou4EoWPpdzLtWZQvXSuVjEY9Xzj7R2th+HClp8oH1qr0Nhry2G61eIzeu3Ky8IiLbqvk
 t0XQ==
X-Gm-Message-State: AOJu0YzDWf5W6SYwCSgb75ZL2efJA9yD3r4kdz8x58hmPu6+FsIelzcP
 Sj2FcEuFelgtKcd76ek4ImonM6lqEU+ldQ4Q92w=
X-Google-Smtp-Source: AGHT+IEj/mGLhLj0LoIgDtYneRwsfF87Uw3jpyAPpo8Lfs2pRKApaYZE5THNxOuY2xXIi2Tq9gUjCw==
X-Received: by 2002:a0d:ea95:0:b0:5a7:b96e:9693 with SMTP id
 t143-20020a0dea95000000b005a7b96e9693mr1147993ywe.31.1698965113675; 
 Thu, 02 Nov 2023 15:45:13 -0700 (PDT)
Received: from grind.. ([179.193.10.161]) by smtp.gmail.com with ESMTPSA id
 ce10-20020a05690c098a00b0059b24bd4f2asm259523ywb.57.2023.11.02.15.45.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Nov 2023 15:45:13 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v9 09/19] target/riscv/kvm: add 'rva22u64' flag as unavailable
Date: Thu,  2 Nov 2023 19:44:35 -0300
Message-ID: <20231102224445.527355-10-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231102224445.527355-1-dbarboza@ventanamicro.com>
References: <20231102224445.527355-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-yw1-x112c.google.com
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


