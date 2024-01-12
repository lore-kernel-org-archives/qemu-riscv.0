Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D1A3C47258
	for <qemu-riscv@archiver.kernel.org>; Fri, 12 Jan 2024 14:05:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rOI78-00040D-8t; Fri, 12 Jan 2024 09:02:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rOI74-0003xB-Ac
 for qemu-riscv@nongnu.org; Fri, 12 Jan 2024 09:02:22 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rOI6z-0005m8-Tc
 for qemu-riscv@nongnu.org; Fri, 12 Jan 2024 09:02:22 -0500
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1d4ca2fd2fbso37187865ad.2
 for <qemu-riscv@nongnu.org>; Fri, 12 Jan 2024 06:02:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1705068133; x=1705672933; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+8u7GJJLpSf1x3Yb63ga4XoLRSCLoYJR0FG/IzoZ8Vs=;
 b=SlA7op4vBENpFw1eolwxQqmpCPtbtTmBYQG4b7KwhrGIWxDug7iRA6DeN9p7oFM4mD
 Ya1Eh8LSv3N+fh9zADOHcySvEYA47xx1jq2+KnYoEqEqXahXFYiyti7WIbqqTtGkNb4e
 IXl0kTYJrDI6m+YlG8+zOidhheRL/W9NQ25amS92F+21pgnguDyBdR86QAcMDRv2SdQb
 Ebt+0mM+I9O3t8t8b4h8SkKaSAVk2D8kC3hF/uRM5flLi3yW5m4+gXzAcEwwQN47q6n9
 8AIVuMooMR8XJI0kSdjaaXlXYBfv4TTBl3tNvhAPkpbKYOgRWcCOWGyy5ZQjPciJVny5
 UhkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705068133; x=1705672933;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+8u7GJJLpSf1x3Yb63ga4XoLRSCLoYJR0FG/IzoZ8Vs=;
 b=QThbD/H6tvrt6KUgmwZbF5tCDWCXnSqfVppQcZEN1Z0NQ5JSZpxCO71O6awSabaKW+
 JB2g/4Pd/iPRDWlYybzX3e31TUQ60hj0Exzkk/oMMcDJN3+VsCArj7Y38+h2nlKnyTCf
 ya8sUKaAXDo+hM5/ZmK+RX5pcrvWaWnLrH3olNYmQTTw6hobUwEE+VkkviCSKW7jGEJh
 y4c5LW3AS3hzMhTq2PRZ7M+p4rlPgV93JVoi8ME2e+gysCCug2Q0pvmtf3Dkusz59/2g
 kyQ18aKquJkOYWJyL/aYU9lZAcbr7XoI0LdW0ZDmV8KELgRbIC7luUwRkIM7CeeBLKZ3
 hFXg==
X-Gm-Message-State: AOJu0YwM8354CmLKYscJWymcfpHbKIsZaZQa4Hti2P/7c6bV0/VaBEsU
 6XLqCdNwsJEnXIY0x8ZJZtR470NrQyickGkfFuOCzA/F7VkE0Q==
X-Google-Smtp-Source: AGHT+IEYkgcOkSlPscDpHVXBDyZRhjE9fHG/iMig5UfbX3/GbO1AthKpXavl0ctIv+g2NWWV2+cRPg==
X-Received: by 2002:a17:903:120d:b0:1d4:96d2:1079 with SMTP id
 l13-20020a170903120d00b001d496d21079mr962001plh.15.1705068133502; 
 Fri, 12 Jan 2024 06:02:13 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([152.234.123.64])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a1709028c8500b001cf6453b237sm3116927plo.236.2024.01.12.06.02.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jan 2024 06:02:13 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v5 1/8] target/riscv: create finalize_features() for KVM
Date: Fri, 12 Jan 2024 11:01:54 -0300
Message-ID: <20240112140201.127083-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240112140201.127083-1-dbarboza@ventanamicro.com>
References: <20240112140201.127083-1-dbarboza@ventanamicro.com>
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

To turn cbom_blocksize and cboz_blocksize into class properties we need
KVM specific changes.

KVM is creating its own version of these options with a customized
setter() that prevents users from picking an invalid value during init()
time. This comes at the cost of duplicating each option that KVM
supports. This will keep happening for each new shared option KVM
implements in the future.

We can avoid that by using the same property TCG uses and adding
specific KVM handling during finalize() time, like TCG already does with
riscv_tcg_cpu_finalize_features(). To do that, the common CPU property
offers a way of knowing if an option was user set or not, sparing us
from doing unneeded syscalls.

riscv_kvm_cpu_finalize_features() is then created using the same
KVMScratch CPU we already use during init() time, since finalize() time
is still too early to use the official KVM CPU for it. cbom_blocksize
and cboz_blocksize are then handled during finalize() in the same way
they're handled by their KVM specific setter.

With this change we can proceed with the blocksize changes in the common
code without breaking the KVM driver.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c           | 16 +++++++---
 target/riscv/cpu.h           |  1 +
 target/riscv/kvm/kvm-cpu.c   | 59 ++++++++++++++++++++++++++++++++++++
 target/riscv/kvm/kvm_riscv.h |  1 +
 4 files changed, 72 insertions(+), 5 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 8d3ec74a1c..d64fce5a73 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -68,6 +68,11 @@ static void cpu_option_add_user_setting(const char *optname, uint32_t value)
                         GUINT_TO_POINTER(value));
 }
 
+bool riscv_cpu_option_set(const char *optname)
+{
+    return g_hash_table_contains(general_user_opts, optname);
+}
+
 #define ISA_EXT_DATA_ENTRY(_name, _min_ver, _prop) \
     {#_name, _min_ver, CPU_CFG_OFFSET(_prop)}
 
@@ -1109,17 +1114,18 @@ void riscv_cpu_finalize_features(RISCVCPU *cpu, Error **errp)
     }
 #endif
 
-    /*
-     * KVM accel does not have a specialized finalize()
-     * callback because its extensions are validated
-     * in the get()/set() callbacks of each property.
-     */
     if (tcg_enabled()) {
         riscv_tcg_cpu_finalize_features(cpu, &local_err);
         if (local_err != NULL) {
             error_propagate(errp, local_err);
             return;
         }
+    } else if (kvm_enabled()) {
+        riscv_kvm_cpu_finalize_features(cpu, &local_err);
+        if (local_err != NULL) {
+            error_propagate(errp, local_err);
+            return;
+        }
     }
 }
 
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 11df226a00..2dc28429e6 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -510,6 +510,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                         MMUAccessType access_type, int mmu_idx,
                         bool probe, uintptr_t retaddr);
 char *riscv_isa_string(RISCVCPU *cpu);
+bool riscv_cpu_option_set(const char *optname);
 
 #define cpu_mmu_index riscv_cpu_mmu_index
 
diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
index 680a729cd8..dc0466df69 100644
--- a/target/riscv/kvm/kvm-cpu.c
+++ b/target/riscv/kvm/kvm-cpu.c
@@ -1598,6 +1598,65 @@ static bool kvm_cpu_realize(CPUState *cs, Error **errp)
    return true;
 }
 
+void riscv_kvm_cpu_finalize_features(RISCVCPU *cpu, Error **errp)
+{
+    CPURISCVState *env = &cpu->env;
+    KVMScratchCPU kvmcpu;
+    struct kvm_one_reg reg;
+    uint64_t val;
+    int ret;
+
+    /* short-circuit without spinning the scratch CPU */
+    if (!cpu->cfg.ext_zicbom && !cpu->cfg.ext_zicboz) {
+        return;
+    }
+
+    if (!kvm_riscv_create_scratch_vcpu(&kvmcpu)) {
+        error_setg(errp, "Unable to create scratch KVM cpu");
+        return;
+    }
+
+    if (cpu->cfg.ext_zicbom &&
+        riscv_cpu_option_set(kvm_cbom_blocksize.name)) {
+
+        reg.id = kvm_riscv_reg_id_ulong(env, KVM_REG_RISCV_CONFIG,
+                                        kvm_cbom_blocksize.kvm_reg_id);
+        reg.addr = (uint64_t)&val;
+        ret = ioctl(kvmcpu.cpufd, KVM_GET_ONE_REG, &reg);
+        if (ret != 0) {
+            error_setg(errp, "Unable to read cbom_blocksize, error %d", errno);
+            return;
+        }
+
+        if (cpu->cfg.cbom_blocksize != val) {
+            error_setg(errp, "Unable to set cbom_blocksize to a different "
+                       "value than the host (%lu)", val);
+            return;
+        }
+    }
+
+    if (cpu->cfg.ext_zicboz &&
+        riscv_cpu_option_set(kvm_cboz_blocksize.name)) {
+
+        reg.id = kvm_riscv_reg_id_ulong(env, KVM_REG_RISCV_CONFIG,
+                                        kvm_cboz_blocksize.kvm_reg_id);
+        reg.addr = (uint64_t)&val;
+        ret = ioctl(kvmcpu.cpufd, KVM_GET_ONE_REG, &reg);
+        if (ret != 0) {
+            error_setg(errp, "Unable to read cboz_blocksize, error %d", errno);
+            return;
+        }
+
+        if (cpu->cfg.cboz_blocksize != val) {
+            error_setg(errp, "Unable to set cboz_blocksize to a different "
+                       "value than the host (%lu)", val);
+            return;
+        }
+    }
+
+    kvm_riscv_destroy_scratch_vcpu(&kvmcpu);
+}
+
 static void kvm_cpu_accel_class_init(ObjectClass *oc, void *data)
 {
     AccelCPUClass *acc = ACCEL_CPU_CLASS(oc);
diff --git a/target/riscv/kvm/kvm_riscv.h b/target/riscv/kvm/kvm_riscv.h
index 8329cfab82..4bd98fddc7 100644
--- a/target/riscv/kvm/kvm_riscv.h
+++ b/target/riscv/kvm/kvm_riscv.h
@@ -27,5 +27,6 @@ void kvm_riscv_aia_create(MachineState *machine, uint64_t group_shift,
                           uint64_t guest_num);
 void riscv_kvm_aplic_request(void *opaque, int irq, int level);
 int kvm_riscv_sync_mpstate_to_kvm(RISCVCPU *cpu, int state);
+void riscv_kvm_cpu_finalize_features(RISCVCPU *cpu, Error **errp);
 
 #endif
-- 
2.43.0


