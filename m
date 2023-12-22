Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 304F2C41535
	for <qemu-riscv@archiver.kernel.org>; Fri, 22 Dec 2023 12:25:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rGeYh-0001me-7H; Fri, 22 Dec 2023 07:23:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rGeYe-0001iD-PZ
 for qemu-riscv@nongnu.org; Fri, 22 Dec 2023 07:23:16 -0500
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rGeYa-0006CA-LT
 for qemu-riscv@nongnu.org; Fri, 22 Dec 2023 07:23:16 -0500
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-5bdb0be3591so1368352a12.2
 for <qemu-riscv@nongnu.org>; Fri, 22 Dec 2023 04:23:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1703247791; x=1703852591; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YBdFO1/O1xsYMUcgtmKgi1/AljKQg+BgIlpJLJG998U=;
 b=G4YnKrdI6qR/YIz8PQfgC6zhBr1kDuKKYCaY2qQSrQbmMwDj/aMAKb+tuPthtyEcM1
 OjZ5ghn2y6jxf9IxR9+Al3tvJNGx/+MGlCSzderpG3ZfvJspi+9qiwlL0zL7tS/mp89y
 pc7TPnJeb96/1Q22autalWM2BebEWFhGlqctK4tupws4gvw1nbyph27HrX0FeYEr0fWS
 jqibTxzsfrc5M2eWGwGmL7fXPEP8GVeGI82en7oi7KCF9Oeb4SqJlUAkxG7qnRcP8JYF
 guHoF5whP7uWUdHDXnsYpwKV9yp6Mn6pw2S2mmuBH+4M5OxZbBvyLYRmfqD8ASBrLqtX
 1nGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703247791; x=1703852591;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YBdFO1/O1xsYMUcgtmKgi1/AljKQg+BgIlpJLJG998U=;
 b=PgvomT63byhEBKBgfm2mCcE3Mw1qHyitzsqeGj/1KiwHSeLcJf5eWN7SNcVvmFHb2j
 sJhTJO28HSyan9oD6eQqX2YWngIfI596IMwbPY3T+sPhk4Bd021u690SHhEfSbXIpdT4
 wM2UlelPHsSktW634Xs+eTPnXeHny0XN1wjLITKegy0GnS/GEIwQoss9BTOKGh4s81gO
 J5xfcKzhzPqZrm0AGgGFab2CveqkSYcjysaD1MCVGGgDOXApRpw5MecggLjSBvMgmbLO
 DPnWZX5f1qLi0erEwu1aYb+bCVv03pHctiZOv/5qF9YNPmzb5v+hPvvhrOD5/xZ2xxj6
 YkpA==
X-Gm-Message-State: AOJu0YzNwqoPV2D1BIlEM8Vv+aW1yyFt6RbEX/jiQ5LFGzyl3b8kcNfS
 MEvBeTkI7c3AQMbyV7HEG1gdvfj5ISuOvQ==
X-Google-Smtp-Source: AGHT+IFfh54e4U+6AzhBnWFB4AlLrA1/nhXCG+B4zu8MtwRla4vWW9c+q4hZj0wbk9NnfF9t3nYffA==
X-Received: by 2002:a05:6a20:7da4:b0:194:dd52:bdc7 with SMTP id
 v36-20020a056a207da400b00194dd52bdc7mr1482747pzj.56.1703247790897; 
 Fri, 22 Dec 2023 04:23:10 -0800 (PST)
Received: from grind.dc1.ventanamicro.com (201-69-66-51.dial-up.telesp.net.br.
 [201.69.66.51]) by smtp.gmail.com with ESMTPSA id
 g14-20020aa7874e000000b006ce7ad8c14esm3274901pfo.164.2023.12.22.04.23.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Dec 2023 04:23:10 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 10/16] target/riscv: create finalize_features() for KVM
Date: Fri, 22 Dec 2023 09:22:29 -0300
Message-ID: <20231222122235.545235-11-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231222122235.545235-1-dbarboza@ventanamicro.com>
References: <20231222122235.545235-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pg1-x534.google.com
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
---
 target/riscv/cpu.c           | 16 +++++++---
 target/riscv/cpu.h           |  1 +
 target/riscv/kvm/kvm-cpu.c   | 59 ++++++++++++++++++++++++++++++++++++
 target/riscv/kvm/kvm_riscv.h |  1 +
 4 files changed, 72 insertions(+), 5 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 8be619b6f1..f49d31d753 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -63,6 +63,11 @@ static void cpu_option_add_user_setting(const char *optname, uint32_t value)
                         GUINT_TO_POINTER(value));
 }
 
+bool riscv_cpu_option_set(const char *optname)
+{
+    return g_hash_table_contains(general_user_opts, optname);
+}
+
 #define ISA_EXT_DATA_ENTRY(_name, _min_ver, _prop) \
     {#_name, _min_ver, CPU_CFG_OFFSET(_prop)}
 
@@ -1056,17 +1061,18 @@ void riscv_cpu_finalize_features(RISCVCPU *cpu, Error **errp)
 {
     Error *local_err = NULL;
 
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
 
 #ifndef CONFIG_USER_ONLY
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 53101b82c5..988471c7ba 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -495,6 +495,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                         bool probe, uintptr_t retaddr);
 char *riscv_isa_string(RISCVCPU *cpu);
 void riscv_cpu_list(void);
+bool riscv_cpu_option_set(const char *optname);
 
 #define cpu_list riscv_cpu_list
 #define cpu_mmu_index riscv_cpu_mmu_index
diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
index 62a1e51f0a..70fb075846 100644
--- a/target/riscv/kvm/kvm-cpu.c
+++ b/target/riscv/kvm/kvm-cpu.c
@@ -1490,6 +1490,65 @@ static void kvm_cpu_instance_init(CPUState *cs)
     }
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
+            error_setg(errp, "Unable to read cbom_blocksize, error %d", errno);
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


