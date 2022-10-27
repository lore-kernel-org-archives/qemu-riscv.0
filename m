Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1onvjd-0004D4-V8
	for mharc-qemu-riscv@gnu.org; Thu, 27 Oct 2022 01:47:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1onvjb-00045m-PB
 for qemu-riscv@nongnu.org; Thu, 27 Oct 2022 01:47:19 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1onvjY-0003ky-Mm
 for qemu-riscv@nongnu.org; Thu, 27 Oct 2022 01:47:19 -0400
Received: by mail-pf1-x42f.google.com with SMTP id i3so458194pfc.11
 for <qemu-riscv@nongnu.org>; Wed, 26 Oct 2022 22:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=atP0aG6QBRcXiDE1MuILR7UzOwm3XRtvOUBcUNOKg9M=;
 b=SSpxjAvJliB0h3AcH6VT3X2zT/2lL5FOUeKY3WbV2jxNHIDIrJf0OF9SgTPHJBqUwJ
 B7SNxpM+mLIfoG/URVouqQW1HpQn22VU6aY0dZlReUoF4Nx9KjvftSmhfFbvwdbhw0zT
 PIvNEpoNjJ22Y5BUyIPODqL9ns8COl1S45jpvOAN04jzru1UFnUMJL/O62vinUycQJAD
 zyTBgnyAs7theh5gTXmIQWtEJb6yNgma007rQZIO5KVWHXf+pNGndSvJ3cdtBYSTO5YU
 sUHeq3iDU86ilUDuFJi/+kqIascdDaekMQEZm0VBtPTDMSv5FGQAZBxaEn5B3DGUpXIs
 7dhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=atP0aG6QBRcXiDE1MuILR7UzOwm3XRtvOUBcUNOKg9M=;
 b=DMm2A6CAq5Xj2ROMhs+FGeFpuEOGSZq41rVUgJ0G2XtidawM+i973VUkpNjSSfkjWn
 rWWtwaZh9m3AD9LTezLtyyCXGZqLFeYGGHgBsOv9liGtmLajx1h6NDAR3fW9DkR0EI0X
 7MfPN8jBRZ4a9A960Fvhnr3TloDeN+ksB/WIoHxh7LJb06myJlapQ8Snx+vvaEDqSMxu
 xd633EOMxKnVLwaNw2RLmPuG5MZ1zN0xuEA4DQWxei93dUf/CKMeNgXEz1xYyT6Qd3JY
 utm5DL0UECiLrIgAWv8UQQlQJHXyV6E/lwFLgXfOQZGi1DSwALpL4HymaIoM0iiWXEQl
 iF7w==
X-Gm-Message-State: ACrzQf0EjFvLbhM5NVw68OEutCHe8UEMt6kNGhmoeG/CdIwNlfrcvCp6
 N44P5+mn1RLC6nEFmXz1TxGxWYEx8KULkg==
X-Google-Smtp-Source: AMsMyM4RJiWrLEdt0rIDQbAfzS6Ax5XP9ThRIBc6CXS8uAWXzUlxdHh0ZMcB71jruGme833pjd6mQA==
X-Received: by 2002:a63:e54:0:b0:46a:ff3d:5ee1 with SMTP id
 20-20020a630e54000000b0046aff3d5ee1mr41294465pgo.194.1666849635051; 
 Wed, 26 Oct 2022 22:47:15 -0700 (PDT)
Received: from ThinkPad-T490.dc1.ventanamicro.com
 ([2401:4900:519a:c85:c94:7c26:ac49:6811])
 by smtp.googlemail.com with ESMTPSA id
 188-20020a6204c5000000b00562784609fbsm328217pfe.209.2022.10.26.22.47.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 22:47:14 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
	alistair.francis@wdc.com
Subject: [PATCH v1 3/3] target/riscv: kvm: Support selecting VCPU extensions
Date: Thu, 27 Oct 2022 11:16:49 +0530
Message-Id: <20221027054649.69228-4-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221027054649.69228-1-mchitale@ventanamicro.com>
References: <20221027054649.69228-1-mchitale@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=mchitale@ventanamicro.com; helo=mail-pf1-x42f.google.com
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
X-List-Received-Date: Thu, 27 Oct 2022 05:47:20 -0000

Set the state of each ISA extension on the vcpu depending on what
is set in the CPU property and what is allowed by KVM for that extension.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
---
 target/riscv/cpu.c       | 11 ++++-
 target/riscv/kvm.c       | 88 ++++++++++++++++++++++++++++++++++------
 target/riscv/kvm_riscv.h |  2 +-
 3 files changed, 87 insertions(+), 14 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 35320a8547..e52577d59d 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1191,10 +1191,19 @@ static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str)
 {
     char *old = *isa_str;
     char *new = *isa_str;
-    int i;
+    int i, offset;
 
     for (i = 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
         if (isa_ext_is_enabled(cpu, &isa_edata_arr[i])) {
+            offset = isa_edata_arr[i].ext_enable_offset;
+            if (kvm_enabled() && !kvm_riscv_ext_supported(offset)) {
+#ifndef CONFIG_USER_ONLY
+                info_report("disabling %s extension for hart 0x%lx because "
+                            "kvm does not support it", isa_edata_arr[i].name,
+                            (unsigned long)cpu->env.mhartid);
+#endif
+                    continue;
+            }
             if (isa_edata_arr[i].multi_letter) {
                 if (cpu->cfg.short_isa_string) {
                     continue;
diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
index 30f21453d6..ea0715c9e4 100644
--- a/target/riscv/kvm.c
+++ b/target/riscv/kvm.c
@@ -42,6 +42,29 @@
 #include "migration/migration.h"
 #include "sysemu/runstate.h"
 
+struct isa_ext_info {
+    const char *name;
+    target_ulong misa_bit;
+    int ext_enable_offset;
+};
+
+#define ISA_EXT_DATA_ENTRY(_name, _bit, _prop) \
+    {#_name, _bit, offsetof(struct RISCVCPUConfig, _prop)}
+
+static const struct isa_ext_info isa_info_arr[] = {
+    ISA_EXT_DATA_ENTRY(a, RVA, ext_a),
+    ISA_EXT_DATA_ENTRY(c, RVC, ext_c),
+    ISA_EXT_DATA_ENTRY(d, RVD, ext_d),
+    ISA_EXT_DATA_ENTRY(f, RVF, ext_f),
+    ISA_EXT_DATA_ENTRY(h, RVH, ext_h),
+    ISA_EXT_DATA_ENTRY(i, RVI, ext_i),
+    ISA_EXT_DATA_ENTRY(m, RVM, ext_m),
+    ISA_EXT_DATA_ENTRY(svpbmt, 0, ext_svpbmt),
+    ISA_EXT_DATA_ENTRY(sstc, 0, ext_sstc),
+    ISA_EXT_DATA_ENTRY(svinval, 0, ext_svinval),
+    ISA_EXT_DATA_ENTRY(zihintpause, 0, ext_zihintpause),
+};
+
 static uint64_t kvm_riscv_reg_id(CPURISCVState *env, uint64_t type,
                                  uint64_t idx)
 {
@@ -394,25 +417,66 @@ void kvm_arch_init_irq_routing(KVMState *s)
 {
 }
 
+bool kvm_riscv_ext_supported(int offset)
+{
+    int i;
+
+    for (i = 0; i < KVM_RISCV_ISA_EXT_MAX; ++i) {
+        if (isa_info_arr[i].ext_enable_offset == offset) {
+            return true;
+        }
+    }
+    return false;
+}
+
+static void kvm_riscv_set_isa_ext(CPUState *cs, CPURISCVState *env)
+{
+    RISCVCPU *cpu = RISCV_CPU(cs);
+    unsigned long isa_ext_out;
+    bool *ext_state;
+    uint64_t id;
+    int i, ret;
+
+    env->misa_ext = 0;
+    for (i = 0; i < ARRAY_SIZE(isa_info_arr); i++) {
+        ext_state = (void *)&cpu->cfg + isa_info_arr[i].ext_enable_offset;
+        id = kvm_riscv_reg_id(env, KVM_REG_RISCV_ISA_EXT, i);
+        ret = kvm_get_one_reg(cs, id, &isa_ext_out);
+        if (ret) {
+            warn_report("Disabling ext %s due to failure.",
+                        isa_info_arr[i].name);
+            *ext_state = false;
+            continue;
+        }
+        if (isa_ext_out != (*ext_state)) {
+            isa_ext_out = *ext_state;
+            ret = kvm_set_one_reg(cs, id, &isa_ext_out);
+            if (ret) {
+                warn_report("Could not %s ext %s.",
+                            (isa_ext_out ? "enable" : "disable"),
+                            isa_info_arr[i].name);
+                *ext_state = !isa_ext_out;
+            }
+        }
+        /*
+         * If the sigle letter extension is supported by KVM then set
+         * the corresponding misa bit for the guest vcpu.
+         */
+        if (isa_info_arr[i].misa_bit && (*ext_state)) {
+            env->misa_ext |= isa_info_arr[i].misa_bit;
+        }
+    }
+}
+
 int kvm_arch_init_vcpu(CPUState *cs)
 {
-    int ret = 0;
-    target_ulong isa;
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
-    uint64_t id;
 
     qemu_add_vm_change_state_handler(kvm_riscv_vm_state_change, cs);
 
-    id = kvm_riscv_reg_id(env, KVM_REG_RISCV_CONFIG,
-                          KVM_REG_RISCV_CONFIG_REG(isa));
-    ret = kvm_get_one_reg(cs, id, &isa);
-    if (ret) {
-        return ret;
-    }
-    env->misa_ext = isa;
-
-    return ret;
+    kvm_riscv_set_isa_ext(cs, env);
+    return 0;
 }
 
 int kvm_arch_msi_data_to_gsi(uint32_t data)
diff --git a/target/riscv/kvm_riscv.h b/target/riscv/kvm_riscv.h
index ed281bdce0..bdcccc0da4 100644
--- a/target/riscv/kvm_riscv.h
+++ b/target/riscv/kvm_riscv.h
@@ -21,5 +21,5 @@
 
 void kvm_riscv_reset_vcpu(RISCVCPU *cpu);
 void kvm_riscv_set_irq(RISCVCPU *cpu, int irq, int level);
-
+bool kvm_riscv_ext_supported(int offset);
 #endif
-- 
2.34.1


