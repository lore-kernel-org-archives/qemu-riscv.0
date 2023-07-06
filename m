Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D690CEB64D9
	for <qemu-riscv@archiver.kernel.org>; Thu,  6 Jul 2023 10:19:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qHM4K-0005lh-Nx; Thu, 06 Jul 2023 06:18:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qHM4J-0005kd-Ck
 for qemu-riscv@nongnu.org; Thu, 06 Jul 2023 06:18:35 -0400
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qHM4H-00079Y-K9
 for qemu-riscv@nongnu.org; Thu, 06 Jul 2023 06:18:35 -0400
Received: by mail-ot1-x330.google.com with SMTP id
 46e09a7af769-6b73a2d622dso316293a34.0
 for <qemu-riscv@nongnu.org>; Thu, 06 Jul 2023 03:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1688638712; x=1691230712;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OhXIezKHC4e6/MqXQGm3uBYYU+BaI7Mv3AAPBIGQeko=;
 b=de5QCV2QeB+x8w/UlwDxJZBHNqU6nqjgZS5A5n1d+dTRjJxk9HKrU5RUkefAyoc5kA
 hTplKYLulSUBLTl1rQVr2bR/Nst/+RhhLQFmOJY0g/XQncVeun6tu4j05rKAJ0DApJ8f
 T9i5z1z3DkbstkzgaIKKQOHd5dRkP4ItMIGNUbMVksnTW+tc5g7Vn74bwFCmnz9dy7WL
 brvG6ps1coY/Mn24i2+5t1TCgsv6BOIvcMqyoydsIYFmoEMewScSQw2Iid7L08AEcdHK
 F2TTnnNd/F+fjQiCOm+z1Qn/PJhEvodYbfenQ8Xf6WFnFmMziPoLRVGUmYVcIzDDrqyd
 jIfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688638712; x=1691230712;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OhXIezKHC4e6/MqXQGm3uBYYU+BaI7Mv3AAPBIGQeko=;
 b=PEfdDYAaNLyk/ct/Z4RtXSQuDPje0ahHaTZqlE47jFNhrNV1a6KV7Xioxnwwv8BqeO
 fg1usAGDPMJeJXjmezWAz4JA411U2ABvP3lWdZU3Mb+vW1850yIYr6myt22rW3Zsw5kl
 kMyyJUshhLitNMhVu1LmZIFXoF9dDbDjclH/wBSIAEu6XCGmfVxA2wT227fzuDcjQxgB
 Z2P4Wfbfbo7jsRZ8oXlIPW9+Ha8f0is9yoSGrax066Vi3H1gfpEM2/K+iRYHht9i2NG8
 RMvqSKv8HPt2eZNFrQfwcjdNDVteJUtBBd38tLe2HtmJKuOYoJh5qBtNVwaBaZbkrTsB
 DxtQ==
X-Gm-Message-State: ABy/qLY40hQpMBLZQUqUL0CFlkt1o6317g4l9fwJUYuMrH9wCYOaR4UW
 CFr4N++FEfu4eYW4KQWpUg4o2g==
X-Google-Smtp-Source: APBJJlGZoQ4+hi5r9kKSoAvVSTPsHiKvTsUIGIlJVu4cFC3yONt0tNtwvYyvzPxMl0ZCecRQUk0F5Q==
X-Received: by 2002:a9d:5c84:0:b0:6b7:4ece:41aa with SMTP id
 a4-20020a9d5c84000000b006b74ece41aamr2750740oti.0.1688638704784; 
 Thu, 06 Jul 2023 03:18:24 -0700 (PDT)
Received: from grind.. (201-69-66-110.dial-up.telesp.net.br. [201.69.66.110])
 by smtp.gmail.com with ESMTPSA id
 h25-20020a9d6a59000000b006b8850ad193sm511382otn.56.2023.07.06.03.18.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jul 2023 03:18:24 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v9 12/20] target/riscv: add KVM specific MISA properties
Date: Thu,  6 Jul 2023 07:17:30 -0300
Message-ID: <20230706101738.460804-13-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230706101738.460804-1-dbarboza@ventanamicro.com>
References: <20230706101738.460804-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::330;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Using all TCG user properties in KVM is tricky. First because KVM
supports only a small subset of what TCG provides, so most of the
cpu->cfg flags do nothing for KVM.

Second, and more important, we don't have a way of telling if any given
value is an user input or not. For TCG this has a small impact since we
just validating everything and error out if needed. But for KVM it would
be good to know if a given value was set by the user or if it's a value
already provided by KVM. Otherwise we don't know how to handle failed
kvm_set_one_regs() when writing the configurations back.

These characteristics make it overly complicated to use the same user
facing flags for both KVM and TCG. A simpler approach is to create KVM
specific properties that have specialized logic, forking KVM and TCG use
cases for those cases only. Fully separating KVM/TCG properties is
unneeded at this point - in fact we want the user experience to be as
equal as possible, regardless of the acceleration chosen.

We'll start this fork with the MISA properties, adding the MISA bits
that the KVM driver currently supports. A new KVMCPUConfig type is
introduced. It'll hold general information about an extension. For MISA
extensions we're going to use the newly created getters of
misa_ext_infos[] to populate their name and description. 'offset' holds
the MISA bit (RVA, RVC, ...). We're calling it 'offset' instead of
'misa_bit' because this same KVMCPUConfig struct will be used to
multi-letter extensions later on.

This new type also holds a 'user_set' flag. This flag will be set when
the user set an option that's different than what is already configured
in the host, requiring KVM intervention to write the regs back during
kvm_arch_init_vcpu(). Similar mechanics will be implemented for
multi-letter extensions as well.

There is no need to duplicate more code than necessary, so we're going
to use the existing kvm_riscv_init_user_properties() to add the KVM
specific properties. Any code that is adding a TCG user prop is then
changed slightly to verify first if there's a KVM prop with the same
name already added.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 target/riscv/cpu.c |  5 +++
 target/riscv/kvm.c | 78 ++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 83 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 35ba220c8f..5c8832a030 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1726,6 +1726,11 @@ static void riscv_cpu_add_misa_properties(Object *cpu_obj)
         misa_cfg->name = riscv_get_misa_ext_name(bit);
         misa_cfg->description = riscv_get_misa_ext_description(bit);
 
+        /* Check if KVM already created the property */
+        if (object_property_find(cpu_obj, misa_cfg->name)) {
+            continue;
+        }
+
         object_property_add(cpu_obj, misa_cfg->name, "bool",
                             cpu_get_misa_ext_cfg,
                             cpu_set_misa_ext_cfg,
diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
index 4d0808cb9a..c55d0ec7ab 100644
--- a/target/riscv/kvm.c
+++ b/target/riscv/kvm.c
@@ -22,8 +22,10 @@
 #include <linux/kvm.h>
 
 #include "qemu/timer.h"
+#include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "qemu/main-loop.h"
+#include "qapi/visitor.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/kvm.h"
 #include "sysemu/kvm_int.h"
@@ -105,6 +107,81 @@ static uint64_t kvm_riscv_reg_id(CPURISCVState *env, uint64_t type,
         } \
     } while (0)
 
+typedef struct KVMCPUConfig {
+    const char *name;
+    const char *description;
+    target_ulong offset;
+    int kvm_reg_id;
+    bool user_set;
+} KVMCPUConfig;
+
+#define KVM_MISA_CFG(_bit, _reg_id) \
+    {.offset = _bit, .kvm_reg_id = _reg_id}
+
+/* KVM ISA extensions */
+static KVMCPUConfig kvm_misa_ext_cfgs[] = {
+    KVM_MISA_CFG(RVA, KVM_RISCV_ISA_EXT_A),
+    KVM_MISA_CFG(RVC, KVM_RISCV_ISA_EXT_C),
+    KVM_MISA_CFG(RVD, KVM_RISCV_ISA_EXT_D),
+    KVM_MISA_CFG(RVF, KVM_RISCV_ISA_EXT_F),
+    KVM_MISA_CFG(RVH, KVM_RISCV_ISA_EXT_H),
+    KVM_MISA_CFG(RVI, KVM_RISCV_ISA_EXT_I),
+    KVM_MISA_CFG(RVM, KVM_RISCV_ISA_EXT_M),
+};
+
+static void kvm_cpu_set_misa_ext_cfg(Object *obj, Visitor *v,
+                                     const char *name,
+                                     void *opaque, Error **errp)
+{
+    KVMCPUConfig *misa_ext_cfg = opaque;
+    target_ulong misa_bit = misa_ext_cfg->offset;
+    RISCVCPU *cpu = RISCV_CPU(obj);
+    CPURISCVState *env = &cpu->env;
+    bool value, host_bit;
+
+    if (!visit_type_bool(v, name, &value, errp)) {
+        return;
+    }
+
+    host_bit = env->misa_ext_mask & misa_bit;
+
+    if (value == host_bit) {
+        return;
+    }
+
+    if (!value) {
+        misa_ext_cfg->user_set = true;
+        return;
+    }
+
+    /*
+     * Forbid users to enable extensions that aren't
+     * available in the hart.
+     */
+    error_setg(errp, "Enabling MISA bit '%s' is not allowed: it's not "
+               "enabled in the host", misa_ext_cfg->name);
+}
+
+static void kvm_riscv_add_cpu_user_properties(Object *cpu_obj)
+{
+    int i;
+
+    for (i = 0; i < ARRAY_SIZE(kvm_misa_ext_cfgs); i++) {
+        KVMCPUConfig *misa_cfg = &kvm_misa_ext_cfgs[i];
+        int bit = misa_cfg->offset;
+
+        misa_cfg->name = riscv_get_misa_ext_name(bit);
+        misa_cfg->description = riscv_get_misa_ext_description(bit);
+
+        object_property_add(cpu_obj, misa_cfg->name, "bool",
+                            NULL,
+                            kvm_cpu_set_misa_ext_cfg,
+                            NULL, misa_cfg);
+        object_property_set_description(cpu_obj, misa_cfg->name,
+                                        misa_cfg->description);
+    }
+}
+
 static int kvm_riscv_get_regs_core(CPUState *cs)
 {
     int ret = 0;
@@ -427,6 +504,7 @@ void kvm_riscv_init_user_properties(Object *cpu_obj)
         return;
     }
 
+    kvm_riscv_add_cpu_user_properties(cpu_obj);
     kvm_riscv_init_machine_ids(cpu, &kvmcpu);
     kvm_riscv_init_misa_ext_mask(cpu, &kvmcpu);
 
-- 
2.41.0


