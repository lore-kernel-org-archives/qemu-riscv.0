Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E03F4C001DF
	for <qemu-riscv@archiver.kernel.org>; Fri, 20 Oct 2023 22:40:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qtyA9-0003wH-5X; Fri, 20 Oct 2023 18:40:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qtyA7-0003vh-6f
 for qemu-riscv@nongnu.org; Fri, 20 Oct 2023 18:40:11 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qtyA2-0007g5-7J
 for qemu-riscv@nongnu.org; Fri, 20 Oct 2023 18:40:10 -0400
Received: by mail-pg1-x52f.google.com with SMTP id
 41be03b00d2f7-564af0ac494so941641a12.0
 for <qemu-riscv@nongnu.org>; Fri, 20 Oct 2023 15:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1697841605; x=1698446405; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZQI5ijPPAWnzvl5s7eyVjdDxDQDVn8uFjnkA4RU/+zg=;
 b=MtVBNdhMZ4Orlx7wETqC7c9+jNoc/aNpImUa0JSQTv4MOxMh2aw/XXrGrYAYLWrICk
 Ln9zuzQjzI8ga/YjU2KjRRdSaXv57EIZrlbeyzz/ZRuOYMfSdrus9Fd2sOoJQ7wuoYAh
 uRfachKTICugAISWcD16ZFkAo9SUsTPbiucIcwSpiIZn+KERRfO2W+ZMfvWXUlTMUEPt
 xEM1UTUhxsxO0ajifVke1CIToSiRRlYOg2JqYCUDVHKWNV5Lc+fxRrJlSmUQaP74DxFn
 STGnRbfDas1J8/qvyFnDpexKSF4gMK+7tHriQ+rZfxT9NVPHJ75/3tzBifwWsG9X2vxG
 dx8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697841605; x=1698446405;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZQI5ijPPAWnzvl5s7eyVjdDxDQDVn8uFjnkA4RU/+zg=;
 b=ts4uSmLS+ZQfeQVieBBS4uyvLNf5hH9ybec7/z12aKHFxIIx63JGgkhym9IlSiiXl4
 4BDvycz2u9jDciqC6V1WouvbFTtLKFwBka0S/YZ3/dVtB3AbZmGvWkbwJGqnPqYDHeTY
 G8H8b9PcRwofCQzmoGBO/1JnyiM9udKyxwa+SqvKQ7344fTmMOXpU5nidLpMTTMNfMXL
 nXWU4ac8JuWgiuWNvGkgHdImHb6a8LxsTnhgG4Y6v55HksJOzpct/9sdf2uTZyNF+Y3Y
 DCwQp/I1mykl4eWdVQg6ahVPxBo0GZxJcQPK1PQsYEVz9x5JunoEbwTmS2XzQMbr1aXa
 yXMQ==
X-Gm-Message-State: AOJu0YzTpLeh2z3pq9kxMAbW6J/V8WBxg8qf0CHDzjVFr9VZ4Y9GpU+6
 Fn4opWU55bNYX5Wqt4ZiXScXtpzYTeUvuXlcFLQ=
X-Google-Smtp-Source: AGHT+IGLith4pUNyVcih6lFn5qB8eVUOe7IbNl85fMlYkOy2BfB5eTZfLIr3CVGWygtxgfElbW2x4g==
X-Received: by 2002:a17:902:c94d:b0:1c8:91d8:d5ca with SMTP id
 i13-20020a170902c94d00b001c891d8d5camr2809782pla.42.1697841604778; 
 Fri, 20 Oct 2023 15:40:04 -0700 (PDT)
Received: from grind.. ([177.45.186.249]) by smtp.gmail.com with ESMTPSA id
 h1-20020a170902704100b001c61921d4d2sm1992373plt.302.2023.10.20.15.40.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Oct 2023 15:40:04 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 2/6] target/riscv/kvm: add 'rva22u64' flag as unavailable
Date: Fri, 20 Oct 2023 19:39:47 -0300
Message-ID: <20231020223951.357513-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231020223951.357513-1-dbarboza@ventanamicro.com>
References: <20231020223951.357513-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pg1-x52f.google.com
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
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/kvm/kvm-cpu.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
index 5246fc2bdc..dc14c54ce4 100644
--- a/target/riscv/kvm/kvm-cpu.c
+++ b/target/riscv/kvm/kvm-cpu.c
@@ -360,7 +360,7 @@ static void cpu_set_cfg_unavailable(Object *obj, Visitor *v,
     }
 
     if (value) {
-        error_setg(errp, "extension %s is not available with KVM",
+        error_setg(errp, "'%s' is not available with KVM",
                    propname);
     }
 }
@@ -440,6 +440,11 @@ static void kvm_riscv_add_cpu_user_properties(Object *cpu_obj)
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


