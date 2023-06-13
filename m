Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C46CEB64D8
	for <qemu-riscv@archiver.kernel.org>; Tue, 13 Jun 2023 21:00:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q9B7T-0002Ay-CR; Tue, 13 Jun 2023 17:00:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1q9B7N-00029B-Eh
 for qemu-riscv@nongnu.org; Tue, 13 Jun 2023 16:59:57 -0400
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1q9B7L-0006mO-46
 for qemu-riscv@nongnu.org; Tue, 13 Jun 2023 16:59:57 -0400
Received: by mail-oi1-x22a.google.com with SMTP id
 5614622812f47-39cd084ea62so2070525b6e.0
 for <qemu-riscv@nongnu.org>; Tue, 13 Jun 2023 13:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1686689994; x=1689281994;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Nomoe5wOs8QQV5HVn+Gft6DhZTpJdTHe9i9Z3CiNkW4=;
 b=IjBYKIrhGtpyo4AImSJ+vInPTyBsCFIQ8kxGYBhn65UhuiBIoc5D1krrZYnzDSizRo
 9XFFWA6LQOyYoBMe7O8ZdFjqMlJxvTOPyxVOfAOETvS9l7hCMpCkUXeuIfXi81pToNkM
 Nwnqrw7+w4Jr1rnaC4YAEUxsVXcMSwGsN2Vtj1xPdPofn3co+erkBzxEoAaUsOo+dh7q
 rvsQ3laea6zpVzya0t772lDxi9ikXNNup5lXG3VEp7Gvz+3pmzAUlJMradeg/gynuwio
 42ZVjDzE1fcQsQZsgfzSAmFG5qJO9IJTxM9uPGW+2xEVgxvc8uebJJw0Gv+hZbbrdkSC
 ndwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686689994; x=1689281994;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Nomoe5wOs8QQV5HVn+Gft6DhZTpJdTHe9i9Z3CiNkW4=;
 b=bUZvRzuKsxRu2WWQJk37xsWGfGJ0UxAqbkX85AuiL9w3oNiqFJMwtfbSIreH2NsRxB
 qhVeBimJqZ+kIYmsWXORT7ElwaahlGSp/Q45Mss6FQ+mcXzozjvM/UF8WMs53piH4iQ1
 xjPZTI2sKqayy/T0AGaIpgrjFfOFOybCWYyd4INqw3YWHGUo4nVke01F55jiMSj0b7GR
 ijSagy2kQWZ/C7upVDBf8hNGAXrfVIbwmyCQOSLIm7zmt6YVbIGsDBoTdGf+UKNHxs/y
 QTUE7qHyXEVnM2r8RouhgRQu3GPPjc7fICuiSkWY6vqPhzSkwZeyF9A+REsNQXQ1EjBx
 rI5A==
X-Gm-Message-State: AC+VfDxXEWOPH2SrOY9i8R2Qn4vFQb4zy9wkP1ccPBTTGoqPtfIqYzz9
 V540FEadcZRmnL8edCtfspAJ+g==
X-Google-Smtp-Source: ACHHUZ6T4/Lyt8ClbL3t3PRjSAz+sXeA//56Leslm8Kup9EUDoo4MLg2vw6AhEG8O2324eAvmuvMFw==
X-Received: by 2002:a05:6808:d4e:b0:39a:abe8:afb9 with SMTP id
 w14-20020a0568080d4e00b0039aabe8afb9mr10355980oik.42.1686689994011; 
 Tue, 13 Jun 2023 13:59:54 -0700 (PDT)
Received: from grind.. ([177.170.117.210]) by smtp.gmail.com with ESMTPSA id
 q82-20020acaf255000000b003982a8a1e3fsm5619514oih.51.2023.06.13.13.59.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jun 2023 13:59:53 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 13/18] target/riscv/kvm.c: update KVM MISA bits
Date: Tue, 13 Jun 2023 17:58:52 -0300
Message-Id: <20230613205857.495165-14-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230613205857.495165-1-dbarboza@ventanamicro.com>
References: <20230613205857.495165-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22a.google.com
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

Our design philosophy with KVM properties can be resumed in two main
decisions based on KVM interface availability and what the user wants to
do:

- if the user disables an extension that the host KVM module doesn't
know about (i.e. it doesn't implement the kvm_get_one_reg() interface),
keep booting the CPU. This will avoid users having to deal with issues
with older KVM versions while disabling features they don't care;

- for any other case we're going to error out immediately. If the user
wants to enable a feature that KVM doesn't know about this a problem that
is worth aborting - the user must know that the feature wasn't enabled
in the hart. Likewise, if KVM knows about the extension, the user wants
to enable/disable it, and we fail to do it so, that's also a problem we
can't shrug it off.

For MISA bits we're going to be a little more conservative: we won't
even try enabling bits that aren't already available in the host. The
ioctl() is so likely to fail that's not worth trying. This check is
already done in the previous patch, in kvm_cpu_set_misa_ext_cfg(), thus
we don't need to worry about it now.

In kvm_riscv_update_cpu_misa_ext() we'll go through every potential user
option and do as follows:

- if the user didn't set the property or set to the same value of the
host, do nothing;

- Disable the given extension in KVM. Error out if anything goes wrong.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/kvm.c | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
index 53042a0e86..ea38f91b92 100644
--- a/target/riscv/kvm.c
+++ b/target/riscv/kvm.c
@@ -164,6 +164,41 @@ static void kvm_cpu_set_misa_ext_cfg(Object *obj, Visitor *v,
                "enabled in the host", misa_ext_cfg->name);
 }
 
+static void kvm_riscv_update_cpu_misa_ext(RISCVCPU *cpu, CPUState *cs)
+{
+    CPURISCVState *env = &cpu->env;
+    uint64_t id, reg;
+    int i, ret;
+
+    for (i = 0; i < ARRAY_SIZE(kvm_misa_ext_cfgs); i++) {
+        KVMCPUConfig *misa_cfg = &kvm_misa_ext_cfgs[i];
+        target_ulong misa_bit = misa_cfg->offset;
+
+        if (!misa_cfg->user_set) {
+            continue;
+        }
+
+        /* If we're here we're going to disable the MISA bit */
+        reg = 0;
+        id = kvm_riscv_reg_id(env, KVM_REG_RISCV_ISA_EXT,
+                              misa_cfg->kvm_reg_id);
+        ret = kvm_set_one_reg(cs, id, &reg);
+        if (ret != 0) {
+            /*
+             * We're not checking for -EINVAL because if the bit is
+             * about to be disabled means that it was already enabled
+             * by KVM, something that we determined by fetching the
+             * 'isa' register during init() time. Any error at this
+             * point is worth aborting.
+             */
+            error_report("Unable to set KVM reg %s, error %d",
+                         misa_cfg->name, ret);
+            exit(EXIT_FAILURE);
+        }
+        env->misa_ext &= ~misa_bit;
+    }
+}
+
 static void kvm_riscv_add_cpu_user_properties(Object *cpu_obj)
 {
     int i;
@@ -630,8 +665,13 @@ int kvm_arch_init_vcpu(CPUState *cs)
 
     if (!object_dynamic_cast(OBJECT(cpu), TYPE_RISCV_CPU_HOST)) {
         ret = kvm_vcpu_set_machine_ids(cpu, cs);
+        if (ret != 0) {
+            return ret;
+        }
     }
 
+    kvm_riscv_update_cpu_misa_ext(cpu, cs);
+
     return ret;
 }
 
-- 
2.40.1


