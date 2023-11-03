Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA8C4C4332F
	for <qemu-riscv@archiver.kernel.org>; Fri,  3 Nov 2023 13:49:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qyuVw-00025D-QX; Fri, 03 Nov 2023 09:47:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qyuVp-0001zo-UH
 for qemu-riscv@nongnu.org; Fri, 03 Nov 2023 09:47:04 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qyuVo-0000vb-Dr
 for qemu-riscv@nongnu.org; Fri, 03 Nov 2023 09:47:01 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-5afbdbf3a19so24743317b3.2
 for <qemu-riscv@nongnu.org>; Fri, 03 Nov 2023 06:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1699019219; x=1699624019; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=idOjzqB/2N8r45g3xvXzJsWeC0Y1TlRo66OPhQFDTfY=;
 b=JOLgKw3BLdF8/0dNsCPoLlhZ9iBWoJExHEc/45GTgF6nEy3Ig/Hb0X+TbR/sWWjJ4y
 3bMIYugVL8taj//pkxuQ4GTIG89IZJaDWwkuHNqsoBm7R/LuANxz32Fk28ArS0hFNd2v
 mGsm4v7+6Bp+De+exWxtU7BY5hJ5zi/Y1zAGUXFuZ5MpbDpf3qjklqzcyvP5ld+zYcdX
 JN/HAJHWJK7gGl9TtEpCiMOmNy6/+zQTI+H7MyyhOanpq8hNacqAnkoR6BGX1AgU7npW
 aqdW4ZcYzy4mjIJlrkUPKGRX8XlYnSY8CzouzHBfUvnk4Vwij1knQKKckMCSbeqWNMJE
 AQJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699019219; x=1699624019;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=idOjzqB/2N8r45g3xvXzJsWeC0Y1TlRo66OPhQFDTfY=;
 b=j2rdDZA5Q43k5dVBhWlvnGcldirF7WSm2/j+lCyt8u+Ihw0QB1VRf4KfBWyQLwCsHG
 KdZPByvIQXzI+WN6XI7P1eCTkxQCs8yLEiMbB6i7HiiHkwjfoWrwbQ9NxzUnsXKrM7Kc
 wilI8Tvz9MHq4VAvxrHAOljLpFrREyAFj8GYCD+coUz2cjS3AA2rv5rZIwoVluDwfUBA
 LGFoY+HqH6yiJt4xgnPfriLX+87XWb9PcbQ7N46jPrvM/kOMAvy6gfNAYZE1E5gRHfXR
 fkwcVkT8tYNXA+t1QsL5WajjObGfAa7Ux2bo3qvN8RN50BSfI6l1lvEsu9QsPRQw8PuJ
 rjfw==
X-Gm-Message-State: AOJu0Yzanwa2b7a81hPQO+0W1BcGj0KuchHLVmxBULBaJtK1G8t+9zZo
 AGPRVe/dfZpnuzDWUvTbXy/dwSqoqPmD5YNYNE0=
X-Google-Smtp-Source: AGHT+IH7KuKkDS69TS7oFCS6ozTKfnDEmSpG+33gDSQLxbmYuu6ESYo9DvAeMI6JF05YbXnqhlYjlA==
X-Received: by 2002:a05:690c:39b:b0:59e:7fc1:dba0 with SMTP id
 bh27-20020a05690c039b00b0059e7fc1dba0mr2849292ywb.44.1699019219107; 
 Fri, 03 Nov 2023 06:46:59 -0700 (PDT)
Received: from grind.. ([179.193.10.161]) by smtp.gmail.com with ESMTPSA id
 j68-20020a0df947000000b00582b239674esm935814ywf.129.2023.11.03.06.46.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Nov 2023 06:46:58 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v10 09/18] target/riscv/kvm: add 'rva22u64' flag as unavailable
Date: Fri,  3 Nov 2023 10:46:20 -0300
Message-ID: <20231103134629.561732-10-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231103134629.561732-1-dbarboza@ventanamicro.com>
References: <20231103134629.561732-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-yw1-x112a.google.com
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


