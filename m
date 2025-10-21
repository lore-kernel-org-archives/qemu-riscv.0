Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BBEECCD1A7
	for <qemu-riscv@archiver.kernel.org>; Tue, 21 Oct 2025 16:16:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vBEzl-0004Kz-77; Tue, 21 Oct 2025 12:13:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1vBEzj-0004Ju-Iq
 for qemu-riscv@nongnu.org; Tue, 21 Oct 2025 12:13:55 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1vBEzh-0001cP-FH
 for qemu-riscv@nongnu.org; Tue, 21 Oct 2025 12:13:55 -0400
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-7a213c3c3f5so7463501b3a.3
 for <qemu-riscv@nongnu.org>; Tue, 21 Oct 2025 09:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1761063232; x=1761668032; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KBqwCM6wM6yghlxF77/Wnstb6LPR3AQsGDjym+XGAI8=;
 b=SnTBS1ji8aNOO09GrgeqvewVZOaK8gKKUWxXq81xfOK6zg/K3CaxAFjUtQuO7Y1xBd
 UJtnCZazcoPkjMjkcNEt9erm0rAg0SD4InIdif6UqvnP2I2hLOer2SxnaI1uhM0gM1z6
 mib0BrNQBxNYGwudTMMaGEfWIbbFGxnXg7+NTRRuL93MkTU5vl3xMgo4mw7qAeqFjiTn
 /LSLNp8fg195pr6wH3XVPbgwuCLePWq7Jj1s+1xBnWihE2d8hRvKRj+OqJwRDvcG6byS
 gQDPvcHquJsBX/TPnSnk1J21RUGMYHeDhnsS1TvTT0+LgQvUSodu9O3XEy7ElJx4URc6
 Pc2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761063232; x=1761668032;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KBqwCM6wM6yghlxF77/Wnstb6LPR3AQsGDjym+XGAI8=;
 b=ekAgf4+YcWLKAs1+q5yIdPMvYS711GSRUYvBmp1h3urJzbPtCyWB4gmNFthYxq562B
 EWMAjKgR3Gl8EH6pQgtNo+d0AM9GTvFS7uz/pBKL8F+Da0ZKim++/LP9uAtirXyIsCcj
 FmekvRuLSeB/EFf8ykEkkDDkl2t7JcpWdG350TRvbc2/2AI3AjzXjjUVIcbnLWcVjnoH
 10KwBsccmXluSBCZtKaJjG6BSCCQ+IpN7d8tu85eF7FJ1N/+f5SZGHpFM5r8A96uhdwh
 uMIbXqgbHhkfhhceyJMxct/9aPi+fVTrZzz2sGwtkEPXGwPcrqz0WZergJuPTQ7rBb+W
 vVhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXt7349Tt5WnEh7dOG2LEkLOmlGEfY0kVxOiFV9QMGCi0/VlO3AqfUxkl1+sDcmVt0DvsEANGpUbGxU@nongnu.org
X-Gm-Message-State: AOJu0Yxva7vLsSOVe9g3HQNNYhG+HrdKwq/5JWLDB+BuusO9GZ5cbhNq
 siAXjI3Fv5wdlmm57xW6OuC5abk0e90MBcw9CsyInKI5NwWtZTE2lv4B56oc2pV5/f0=
X-Gm-Gg: ASbGncsqAQqSpUg9/2GPwH44tFZftb16/WxnJssppHNtK3AiiNMU1RrCde1HJnciU6P
 f32GkZtvEyM+UncPxwMvB23v57pO+xPwfEXuVEvAN0JeP04RI6K4xZ2osvm2uQIp766lSIsjyFK
 3zEcz9y6eZPi7IoumX5hkIHJYSv4bYJao2VvFIFEB/30VVweLXY65o9dVbVaA+B6e++kwkR3OWx
 NOO14NJyZTO4AvX0OXu/1cHyfyiUx5ig5wv72k0JLlf+5HjuvtMRzMmeeCUjg52qtIFRuPVDL3l
 lnas38F0lH9hLVjOVDWjfyHw7XYtEvtnRKSWBAC2ir9XpMbnJaQ3mO/nspu9IcXFNXvnzbHyNh+
 vJ/IdK9IIBG/mDnwGafJfDDOgsEQFmcklEm7QGYA8aIpPE0YQF2y5g3X9XyIZfOeqOOxmSetj3I
 +8XCfs2E3DcPaFIRbcitteiQ==
X-Google-Smtp-Source: AGHT+IFQhd6ho7BqlWu0WB0x8T6aRoHrh9WS3PUXQqbREbT20oiydj94YL7jqKF36KXQ2ehaCmreTw==
X-Received: by 2002:a05:6a00:1894:b0:781:1dc6:4e69 with SMTP id
 d2e1a72fcca58-7a220aabb68mr22685131b3a.14.1761063231605; 
 Tue, 21 Oct 2025 09:13:51 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7a23010f7c7sm11731157b3a.54.2025.10.21.09.13.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Oct 2025 09:13:51 -0700 (PDT)
From: Jim Shu <jim.shu@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>,
 Michael Rolnik <mrolnik@gmail.com>, Helge Deller <deller@gmx.de>,
 Song Gao <gaosong@loongson.cn>, Laurent Vivier <laurent@vivier.eu>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <arikalo@gmail.com>, Stafford Horne <shorne@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>, Chinmay Rath <rathc@linux.ibm.com>,
 Yoshinori Sato <yoshinori.sato@nifty.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>,
 qemu-ppc@nongnu.org (open list:PowerPC TCG CPUs),
 qemu-s390x@nongnu.org (open list:S390 TCG CPUs),
 Jim Shu <jim.shu@sifive.com>
Subject: [PATCH v3 11/18] target/riscv: Add WID to MemTxAttrs of CPU memory
 transactions
Date: Wed, 22 Oct 2025 00:13:17 +0800
Message-ID: <20251021161325.585278-4-jim.shu@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251021155548.584543-1-jim.shu@sifive.com>
References: <20251021155548.584543-1-jim.shu@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=jim.shu@sifive.com; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

When a RISC-V HART has WG extension, their memory transactions will
contain WID. Support MemTxAttrs in RISC-V target and add WID inside if
a HART has WG extension.

Signed-off-by: Jim Shu <jim.shu@sifive.com>
---
 target/riscv/cpu.c        |  2 +-
 target/riscv/cpu.h        |  1 +
 target/riscv/cpu_helper.c | 51 ++++++++++++++++++++++++++++++++++++---
 3 files changed, 50 insertions(+), 4 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 22b4070476..32a9f8a6a4 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -2678,7 +2678,7 @@ static int64_t riscv_get_arch_id(CPUState *cs)
 
 static const struct SysemuCPUOps riscv_sysemu_ops = {
     .has_work = riscv_cpu_has_work,
-    .get_phys_page_debug = riscv_cpu_get_phys_page_debug,
+    .get_phys_page_attrs_debug = riscv_cpu_get_phys_page_attrs_debug,
     .write_elf64_note = riscv_cpu_write_elf64_note,
     .write_elf32_note = riscv_cpu_write_elf32_note,
     .legacy_vmsd = &vmstate_riscv_cpu,
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index e99aa11140..e2436fdcd8 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -625,6 +625,7 @@ int riscv_env_mmu_index(CPURISCVState *env, bool ifetch);
 bool cpu_get_fcfien(CPURISCVState *env);
 bool cpu_get_bcfien(CPURISCVState *env);
 bool riscv_env_smode_dbltrp_enabled(CPURISCVState *env, bool virt);
+hwaddr riscv_cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr, MemTxAttrs *attrs);
 G_NORETURN void  riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
                                                MMUAccessType access_type,
                                                int mmu_idx, uintptr_t retaddr);
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index d2be660d58..64e5557f0a 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -136,6 +136,34 @@ bool riscv_env_smode_dbltrp_enabled(CPURISCVState *env, bool virt)
 }
 
 #ifndef CONFIG_USER_ONLY
+static uint32_t riscv_cpu_wg_get_wid(CPURISCVState *env, int mode)
+{
+    CPUState *cs = env_cpu(env);
+    RISCVCPU *cpu = RISCV_CPU(cs);
+    bool virt = env->virt_enabled;
+
+    if (mode == PRV_M) {
+        return cpu->cfg.mwid;
+    } else if (mode == PRV_S) {
+        if (!virt || !env->mwiddeleg) {
+            /* HS-mode, S-mode w/o RVH, or VS-mode but mwiddeleg = 0 */
+            return env->mlwid;
+        } else {
+            /* VS-mode */
+            return env->slwid;
+        }
+    } else if (mode == PRV_U) {
+        if (!riscv_has_ext(env, RVS) || !env->mwiddeleg) {
+            /* M/U mode CPU or mwiddeleg = 0 */
+            return env->mlwid;
+        } else {
+            return env->slwid;
+        }
+    }
+
+    return cpu->cfg.mwid;
+}
+
 void riscv_cpu_set_wg_mwid(CPURISCVState *env, uint32_t mwid)
 {
     CPUState *cs = env_cpu(env);
@@ -1675,13 +1703,22 @@ static void raise_mmu_exception(CPURISCVState *env, target_ulong address,
     env->two_stage_indirect_lookup = two_stage_indirect;
 }
 
-hwaddr riscv_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
+hwaddr riscv_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr, MemTxAttrs *attrs)
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
     hwaddr phys_addr;
     int prot;
     int mmu_idx = riscv_env_mmu_index(&cpu->env, false);
+    int mode = mmuidx_priv(mmu_idx);
+    uint32_t wid;
+
+    if (riscv_cpu_cfg(env)->ext_smwg && env->wid_to_mem_attrs) {
+        wid = riscv_cpu_wg_get_wid(env, mode);
+        env->wid_to_mem_attrs(attrs, wid);
+    } else {
+        *attrs = MEMTXATTRS_UNSPECIFIED;
+    }
 
     if (get_physical_address(env, &phys_addr, &prot, addr, NULL, 0, mmu_idx,
                              true, env->virt_enabled, true, false)) {
@@ -1793,12 +1830,20 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     int mode = mmuidx_priv(mmu_idx);
     /* default TLB page size */
     hwaddr tlb_size = TARGET_PAGE_SIZE;
+    uint32_t wid;
+    MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
 
     env->guest_phys_fault_addr = 0;
 
     qemu_log_mask(CPU_LOG_MMU, "%s ad %" VADDR_PRIx " rw %d mmu_idx %d\n",
                   __func__, address, access_type, mmu_idx);
 
+    if (riscv_cpu_cfg(env)->ext_smwg && env->wid_to_mem_attrs) {
+        mode = mmuidx_priv(mmu_idx);
+        wid = riscv_cpu_wg_get_wid(env, mode);
+        env->wid_to_mem_attrs(&attrs, wid);
+    }
+
     pmu_tlb_fill_incr_ctr(cpu, access_type);
     if (two_stage_lookup) {
         /* Two stage lookup */
@@ -1891,8 +1936,8 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     }
 
     if (ret == TRANSLATE_SUCCESS) {
-        tlb_set_page(cs, address & ~(tlb_size - 1), pa & ~(tlb_size - 1),
-                     prot, access_type, mmu_idx, tlb_size);
+        tlb_set_page_with_attrs(cs, address & ~(tlb_size - 1), pa & ~(tlb_size - 1),
+                                attrs, prot, access_type, mmu_idx, tlb_size);
         return true;
     } else if (probe) {
         return false;
-- 
2.43.0


