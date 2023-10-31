Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B50CBC4332F
	for <qemu-riscv@archiver.kernel.org>; Tue, 31 Oct 2023 20:42:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qxvWg-0005Ib-IH; Tue, 31 Oct 2023 16:39:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qxvWe-0005IK-Au
 for qemu-riscv@nongnu.org; Tue, 31 Oct 2023 16:39:48 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qxvWc-0007VI-Lh
 for qemu-riscv@nongnu.org; Tue, 31 Oct 2023 16:39:48 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-5afabb23900so51056997b3.2
 for <qemu-riscv@nongnu.org>; Tue, 31 Oct 2023 13:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698784786; x=1699389586; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NzlbiQ+OWiuQaLiREzwSbJ6YhgK4c0yS/a9TyPGRRgU=;
 b=IdhmqxdWYcUTr+BOMx7Cujx3knYVl1m6S6x5Sc+RIqdLdeAH3riXSL3gdRJHYq2nJV
 j+AGCpTyTKKFConq89OGhLKXbPZp2HaaPW7BAl/aIxoj1RvikNZ7OAfvOfML1eZ37MWw
 8A9FQI8TXe8WfFtgNRE/a+WH/Op3f3UvqMSxU55wGTtg8/ZGFFmJsNRCZ93bcQen74qL
 EDmLLohzJsRZWKDe3im1m+TAQmhvQn4usPoYmQeXspZrgbQEfy0XsyP5rBj+0YfTfbVZ
 ndprrcfwVRBD/XfnUANpWUE1NLQKy3BqgppfsClIhm8SvNNTnQMAJqL72zTVuDgrQo7k
 v5IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698784786; x=1699389586;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NzlbiQ+OWiuQaLiREzwSbJ6YhgK4c0yS/a9TyPGRRgU=;
 b=dT1j42cD0Zuu0cB3qyq6YBjL4pu87WdtJ9OQH6rxDuN2G8/aBeGzJjdPyIbWjRdcqs
 rx91YiM7hoe6UBExAuZWWvWRU6wcEQwm2f1hu1qdIKmIvguHE4SwjD6+2d3eKuXY7TCj
 zqiYBaUnkwIxV6WwDda7APsDgnIApur9QKQ7pgzNMbRAv5aqVlPkqHfzSPsuWjc0fYcI
 32ZsshxQjjgdWhsAIB3fqvU9VgQ1UxpowFywvl4Y9mnJcNaUszccxbLr+ejub2gTdaIK
 CULGqYhTiRDj/KE5huciel6uTg3o7TOE1XCSkUhehcn+CuZUGYWbWscHyVtWI4wrDMwT
 uLlA==
X-Gm-Message-State: AOJu0YwwCfGcvbuviJIY1KcvWAvkiHt2OV9Z960RaVXW+0Vx7R997iwF
 ctN3dzKXfbqeG56QAGFs/pvukg==
X-Google-Smtp-Source: AGHT+IFY8+uQJWqTF2dIP+mu3eDDUUOwEnnhqgHrLMqolM/tSPqIMiV9R8DSYo5Mn1RnoYrWdgH/fw==
X-Received: by 2002:a81:c806:0:b0:59b:14ca:4316 with SMTP id
 n6-20020a81c806000000b0059b14ca4316mr12962373ywi.43.1698784785793; 
 Tue, 31 Oct 2023 13:39:45 -0700 (PDT)
Received: from grind.. ([179.193.10.161]) by smtp.gmail.com with ESMTPSA id
 k1-20020a81ff01000000b005add997ae53sm1272802ywn.81.2023.10.31.13.39.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Oct 2023 13:39:45 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v7 08/16] target/riscv/kvm: add 'rva22u64' flag as unavailable
Date: Tue, 31 Oct 2023 17:39:08 -0300
Message-ID: <20231031203916.197332-9-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231031203916.197332-1-dbarboza@ventanamicro.com>
References: <20231031203916.197332-1-dbarboza@ventanamicro.com>
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


