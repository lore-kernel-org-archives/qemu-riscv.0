Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2471C71133
	for <qemu-riscv@archiver.kernel.org>; Fri, 25 Aug 2023 13:11:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qZWZN-0001rO-Q4; Fri, 25 Aug 2023 09:09:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qZWZM-0001r1-LU
 for qemu-riscv@nongnu.org; Fri, 25 Aug 2023 09:09:44 -0400
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qZWZK-00072W-EF
 for qemu-riscv@nongnu.org; Fri, 25 Aug 2023 09:09:44 -0400
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-1bbb4bde76dso517963fac.2
 for <qemu-riscv@nongnu.org>; Fri, 25 Aug 2023 06:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1692968981; x=1693573781;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PcrFGy5SXwGgsIRIDU1KFLUdlymxn4q//JVCNfMWLaw=;
 b=Z4P/YkHWTER8Qez3kIoNO4xccFKtKtuhVom0oimBkwT72csYEHvnx2lmNcOId8ec40
 m2/QJGKbksdo5CHGJCtTTanD8dpSHP/WcU6KgcLoeZ7vg+Ao/LVXu9RnYn79sxDt5p17
 WxDAZF3qgdPwmRj0PAZfNLoDtHXSmu6DtE5rdTe0qZeFhwyieYWtoan0KySJiBgCFPto
 rFktuslN4NY6f/+oeNYVF8i3ojafjDOL8jpEViXeS5jMURh6Bk/GtOrGaNahXZ/25hve
 l+/HVBAKnviNyQGqY7Aj8JJsUVwcuphzZSQ0oBUKH8tI1kKyg/Qu6cNHfxZYdidFXzBT
 s09g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692968981; x=1693573781;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PcrFGy5SXwGgsIRIDU1KFLUdlymxn4q//JVCNfMWLaw=;
 b=UlwUR/8dsPMqCHC0RKZ6gGf8WKDOYnjVZB8IMiIK7JkA9rjvhFbGHtKUHc8WAhE4E4
 3feHV22eyqUR67kyoNu6QH8W+3kF2Ng0CC31OUp0wA0SMZybNB/rRwlgYVKbYcLC26CC
 FLxOX+Sz47StXOEG/z40yPoj9nwST04CJjMMmYK2gByCnJVJiZ9PHe+unmnLs79jLm51
 rYaa3odtAE7G0eLD7KFKyOfjOpPnnNDZv7GEcykFbuug0LgsnLHFmXSNzNa89H8q1PIM
 739XXV/4XXOH6H4qEVVU3e9CuZMRWIHjiW9YVLGDjXQ4X6qAuMLzxYVjEhwm/oz+hA/y
 5QLw==
X-Gm-Message-State: AOJu0Yw8KxZYGjbXRmeogf1BrO7ccnkcS4CqZRsIoXd/IVXOOGD0+Ido
 eJGvfUV9nu57xTzq1R1vnweIaQ==
X-Google-Smtp-Source: AGHT+IHgY6kP9l1A7Sd1Gtj5qj+jc1ARXETQvlkkoaotL0Or1cU5nvLWrRgbpZpP/c0yWOqSwZG87A==
X-Received: by 2002:a05:6870:b61c:b0:1bb:89b1:77b7 with SMTP id
 cm28-20020a056870b61c00b001bb89b177b7mr3105128oab.16.1692968981228; 
 Fri, 25 Aug 2023 06:09:41 -0700 (PDT)
Received: from grind.. ([179.93.21.19]) by smtp.gmail.com with ESMTPSA id
 ds23-20020a0568705b1700b001c50fb56845sm966189oab.16.2023.08.25.06.09.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Aug 2023 06:09:40 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 13/20] target/riscv/kvm: refactor
 kvm_riscv_init_user_properties()
Date: Fri, 25 Aug 2023 10:08:46 -0300
Message-ID: <20230825130853.511782-14-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230825130853.511782-1-dbarboza@ventanamicro.com>
References: <20230825130853.511782-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2f.google.com
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

The function is doing way more than just init user properties. We would
also like to use the 'user_extension_properties' class property, as the
TCG driver is already using, to decide whether KVM should expose user
properties or not.

Rename kvm_riscv_init_user_properties() to riscv_init_kvm_registers()
and leave only the essential, non-optional KVM init functions there. All
functions that deals with property handling is now gated via
rcc->user_extension_properties.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/kvm/kvm-cpu.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
index 3c4fa43cee..85e8b0a927 100644
--- a/target/riscv/kvm/kvm-cpu.c
+++ b/target/riscv/kvm/kvm-cpu.c
@@ -792,7 +792,7 @@ static void kvm_riscv_init_multiext_cfg(RISCVCPU *cpu, KVMScratchCPU *kvmcpu)
     }
 }
 
-static void riscv_init_user_properties(Object *cpu_obj)
+static void riscv_init_kvm_registers(Object *cpu_obj)
 {
     RISCVCPU *cpu = RISCV_CPU(cpu_obj);
     KVMScratchCPU kvmcpu;
@@ -801,7 +801,6 @@ static void riscv_init_user_properties(Object *cpu_obj)
         return;
     }
 
-    kvm_riscv_add_cpu_user_properties(cpu_obj);
     kvm_riscv_init_machine_ids(cpu, &kvmcpu);
     kvm_riscv_init_misa_ext_mask(cpu, &kvmcpu);
     kvm_riscv_init_multiext_cfg(cpu, &kvmcpu);
@@ -1295,16 +1294,20 @@ DEFINE_TYPES(riscv_kvm_cpu_type_infos)
 static void kvm_cpu_instance_init(CPUState *cs)
 {
     Object *obj = OBJECT(RISCV_CPU(cs));
+    RISCVCPUClass *rcc = RISCV_CPU_GET_CLASS(obj);
     DeviceState *dev = DEVICE(obj);
 
-    riscv_init_user_properties(obj);
+    riscv_init_kvm_registers(obj);
 
-    riscv_add_satp_mode_properties(obj);
-    riscv_cpu_add_misa_properties(obj);
+    if (rcc->user_extension_properties) {
+        kvm_riscv_add_cpu_user_properties(obj);
+        riscv_add_satp_mode_properties(obj);
+        riscv_cpu_add_misa_properties(obj);
 
-    riscv_cpu_add_kvm_unavail_prop_array(obj, riscv_cpu_extensions);
-    riscv_cpu_add_kvm_unavail_prop_array(obj, riscv_cpu_vendor_exts);
-    riscv_cpu_add_kvm_unavail_prop_array(obj, riscv_cpu_experimental_exts);
+        riscv_cpu_add_kvm_unavail_prop_array(obj, riscv_cpu_extensions);
+        riscv_cpu_add_kvm_unavail_prop_array(obj, riscv_cpu_vendor_exts);
+        riscv_cpu_add_kvm_unavail_prop_array(obj, riscv_cpu_experimental_exts);
+    }
 
     for (Property *prop = riscv_cpu_options; prop && prop->name; prop++) {
         /* Check if we have a specific KVM handler for the option */
-- 
2.41.0


