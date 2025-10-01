Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E24A3CAC5BB
	for <qemu-riscv@archiver.kernel.org>; Wed,  1 Oct 2025 15:11:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v3ySC-00042X-RB; Wed, 01 Oct 2025 11:09:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3ySA-0003yO-TU
 for qemu-riscv@nongnu.org; Wed, 01 Oct 2025 11:09:15 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3yQB-0000p4-RW
 for qemu-riscv@nongnu.org; Wed, 01 Oct 2025 11:09:12 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3ee12a63af1so4857469f8f.1
 for <qemu-riscv@nongnu.org>; Wed, 01 Oct 2025 08:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759331224; x=1759936024; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vgQ08Zha+dXWvHaKOFenolXy22Pp5EZeas9Q+KB02QI=;
 b=ekzFgUUrd7+S3S5edsupqlcrD2zz6ZIr4Lf2Qfmxb2J566SY6IxX8Uy/B2vCyCAt+P
 jSPTEN53sY+Z3D+v1YDIoG2F9MyCvG6ThVcVYxXLbJvtljFR4oGyBg6SJg0n8Hluks8u
 IwLEH2Tk6AvSi6nPww5vJb1UQdSfWeZoCnSQJ6TuSs6L0EGwOHeP14mDUVn649xxFFo5
 8Dlj6nWsNZ6gphdHwWK3d4Mj78I5Equm4UelAMB7zaOSNHO2YfEx1BLmi/c8o2A0vu4r
 6j78EP1JYAZkW0Z6SygXnPZxbJUDUd5ffaTLa1vUlmnCthod7YmBvgRy7gokucOQZFPc
 Xe/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759331224; x=1759936024;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vgQ08Zha+dXWvHaKOFenolXy22Pp5EZeas9Q+KB02QI=;
 b=Vg3sdn0BPdriXFf2l+KlODSewtOaJ46VpmTeF2n4sG40ejAhAHo9pSTSPk+XD3uTiQ
 wD033RspLTxRkBwN1ca5ny2lZtkayMtbJB9Y9RViz4UO0gZzCIGUGr1o8VlerEafZ8+9
 G2BOGU3BYWjiF5tQQBylVQo9KGSAYyc6aKYu5T5pPt8ryfY8U0KyjSLnCakK8MrKrn46
 67WtlNWRYXCxYWLXFiB7SUQmqNaFIJNQBQjuBBAz45EaZV8R/pc5DS5WIXUdMeiZNs8r
 tFLYxsAeGxWQL8yCnGKEuEZIsq92t7ccdaoPC21BC7JP6k3CwQyOYOpj8n5Jaiy87LHk
 prAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtUtzFaDZJA0AMtdDAscMy0AC4ScYArAQT/9zA2u3cVhiWyOLtXMWt3kX6LLzAbwhxYnjiB6/Ybr5e@nongnu.org
X-Gm-Message-State: AOJu0YxzP9Zdwef23yW1Vi69FUgiYa0ssw8mAYtpqg8nme5X95axwH02
 UxSSz1JuRZ3fhOf5pVfDrJtk3Bw6u6H4pSZPp1DstnUAEJkslf2i0nAL6wTYXa45dDo=
X-Gm-Gg: ASbGncuylmxRpovCYhjOhTmG8Nwp9jN8O7XyrsIGlbvMoZDjz91LjNUzXz+9EypsRLk
 J3ROTyplWbxisXATep09amBEKFcEYBCINSXv1RMIh0xVrc+nPwgqxPC6WxMXjfayqXsH7A9zt13
 QvOuBUavFWbLUeBXoa7E5ZyROPtTIZcodWPuiLBjLBMWFcCQyVkSajWGbbQuijhcoBm5w/Ylkox
 lIasCrc3pfe7aNlYnEEvbQ2FOFxKg2TtzXkOmd0eUb7sXbnZ58VdXSrSkLAPfTBxfTcA6xxAJA0
 G8haJvd37uR0LuOB1SJSKPpLnCXlpwMtiNOcGsNxBpTp4AUIhzU9/5mEqtBywxys18wojRegJz5
 H/uplQDRMdB9Mj2z6HZ3Ak/wSbsYO+jw6pqGcO3rXXn0Po9/yPsg/g4A6spYnPvXpHcpF+eJz54
 DPju/MJYGbd18iCujA+x9A
X-Google-Smtp-Source: AGHT+IEjdpZ2834rluXf5iwDh+H9vUyraYk5BuB0JLOoL1WZYeHIRGIrzHWJ1PTFW3scGqxOi3KLVQ==
X-Received: by 2002:a05:6000:2306:b0:3ec:42ad:597 with SMTP id
 ffacd0b85a97d-42557816db8mr2563412f8f.37.1759331223476; 
 Wed, 01 Oct 2025 08:07:03 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fb72facf9sm28220004f8f.13.2025.10.01.08.07.02
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 01 Oct 2025 08:07:02 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH 18/22] target/s390x: Get cpu first addr space with
 cpu_get_address_space()
Date: Wed,  1 Oct 2025 17:05:23 +0200
Message-ID: <20251001150529.14122-19-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001150529.14122-1-philmd@linaro.org>
References: <20251001150529.14122-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

In order to remove the convenient CPUState::as field, access
the vcpu first address space using the cpu_get_address_space()
helper.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/s390x/cpu-system.c      |  4 +++-
 target/s390x/mmu_helper.c      |  9 +++++----
 target/s390x/tcg/excp_helper.c | 10 ++++++----
 target/s390x/tcg/mem_helper.c  |  6 ++++--
 4 files changed, 18 insertions(+), 11 deletions(-)

diff --git a/target/s390x/cpu-system.c b/target/s390x/cpu-system.c
index f3a9ffb2a27..948dd7bc133 100644
--- a/target/s390x/cpu-system.c
+++ b/target/s390x/cpu-system.c
@@ -63,7 +63,9 @@ static void s390_cpu_load_normal(CPUState *s)
     uint64_t spsw;
 
     if (!s390_is_pv()) {
-        spsw = ldq_phys(s->as, 0);
+        AddressSpace *as = cpu_get_address_space(s, 0);
+
+        spsw = ldq_phys(as, 0);
         cpu->env.psw.mask = spsw & PSW_MASK_SHORT_CTRL;
         /*
          * Invert short psw indication, so SIE will report a specification
diff --git a/target/s390x/mmu_helper.c b/target/s390x/mmu_helper.c
index 4e2f31dc763..358d5463a0a 100644
--- a/target/s390x/mmu_helper.c
+++ b/target/s390x/mmu_helper.c
@@ -42,9 +42,10 @@ static void trigger_access_exception(CPUS390XState *env, uint32_t type,
     if (kvm_enabled()) {
         kvm_s390_access_exception(cpu, type, tec);
     } else {
-        CPUState *cs = env_cpu(env);
         if (type != PGM_ADDRESSING) {
-            stq_phys(cs->as, env->psa + offsetof(LowCore, trans_exc_code), tec);
+            AddressSpace *as = cpu_get_address_space(env_cpu(env), 0);
+
+            stq_phys(as, env->psa + offsetof(LowCore, trans_exc_code), tec);
         }
         trigger_pgm_exception(env, type);
     }
@@ -106,7 +107,7 @@ bool mmu_absolute_addr_valid(target_ulong addr, bool is_write)
 static inline bool read_table_entry(CPUS390XState *env, hwaddr gaddr,
                                     uint64_t *entry)
 {
-    CPUState *cs = env_cpu(env);
+    AddressSpace *as = cpu_get_address_space(env_cpu(env), 0);
 
     /*
      * According to the PoP, these table addresses are "unpredictably real
@@ -115,7 +116,7 @@ static inline bool read_table_entry(CPUS390XState *env, hwaddr gaddr,
      *
      * We treat them as absolute addresses and don't wrap them.
      */
-    if (unlikely(address_space_read(cs->as, gaddr, MEMTXATTRS_UNSPECIFIED,
+    if (unlikely(address_space_read(as, gaddr, MEMTXATTRS_UNSPECIFIED,
                                     entry, sizeof(*entry)) !=
                  MEMTX_OK)) {
         return false;
diff --git a/target/s390x/tcg/excp_helper.c b/target/s390x/tcg/excp_helper.c
index 4c7faeee82b..1db159be131 100644
--- a/target/s390x/tcg/excp_helper.c
+++ b/target/s390x/tcg/excp_helper.c
@@ -53,7 +53,7 @@ G_NORETURN void tcg_s390_data_exception(CPUS390XState *env, uint32_t dxc,
     g_assert(dxc <= 0xff);
 #if !defined(CONFIG_USER_ONLY)
     /* Store the DXC into the lowcore */
-    stl_phys(env_cpu(env)->as,
+    stl_phys(cpu_get_address_space(env_cpu(env), 0),
              env->psa + offsetof(LowCore, data_exc_code), dxc);
 #endif
 
@@ -70,7 +70,7 @@ G_NORETURN void tcg_s390_vector_exception(CPUS390XState *env, uint32_t vxc,
     g_assert(vxc <= 0xff);
 #if !defined(CONFIG_USER_ONLY)
     /* Always store the VXC into the lowcore, without AFP it is undefined */
-    stl_phys(env_cpu(env)->as,
+    stl_phys(cpu_get_address_space(env_cpu(env), 0),
              env->psa + offsetof(LowCore, data_exc_code), vxc);
 #endif
 
@@ -639,10 +639,12 @@ void monitor_event(CPUS390XState *env,
                    uint64_t monitor_code,
                    uint8_t monitor_class, uintptr_t ra)
 {
+    AddressSpace *as = cpu_get_address_space(env_cpu(env), 0);
+
     /* Store the Monitor Code and the Monitor Class Number into the lowcore */
-    stq_phys(env_cpu(env)->as,
+    stq_phys(as,
              env->psa + offsetof(LowCore, monitor_code), monitor_code);
-    stw_phys(env_cpu(env)->as,
+    stw_phys(as,
              env->psa + offsetof(LowCore, mon_class_num), monitor_class);
 
     tcg_s390_program_interrupt(env, PGM_MONITOR, ra);
diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
index f1acb1618f7..962f31d4cdb 100644
--- a/target/s390x/tcg/mem_helper.c
+++ b/target/s390x/tcg/mem_helper.c
@@ -957,12 +957,14 @@ uint32_t HELPER(mvpg)(CPUS390XState *env, uint64_t r0, uint32_t r1, uint32_t r2)
     return 0; /* data moved */
 inject_exc:
 #if !defined(CONFIG_USER_ONLY)
+    AddressSpace *as = cpu_get_address_space(env_cpu(env), 0);
+
     if (exc != PGM_ADDRESSING) {
-        stq_phys(env_cpu(env)->as, env->psa + offsetof(LowCore, trans_exc_code),
+        stq_phys(as, env->psa + offsetof(LowCore, trans_exc_code),
                  env->tlb_fill_tec);
     }
     if (exc == PGM_PAGE_TRANS) {
-        stb_phys(env_cpu(env)->as, env->psa + offsetof(LowCore, op_access_id),
+        stb_phys(as, env->psa + offsetof(LowCore, op_access_id),
                  r1 << 4 | r2);
     }
 #endif
-- 
2.51.0


