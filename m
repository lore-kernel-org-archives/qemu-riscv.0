Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mfNpn-000084-H9
	for mharc-qemu-riscv@gnu.org; Tue, 26 Oct 2021 10:53:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <josemartins90@gmail.com>)
 id 1mfNpl-0008Uz-Fp; Tue, 26 Oct 2021 10:53:49 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:43701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <josemartins90@gmail.com>)
 id 1mfNpj-0000sb-BY; Tue, 26 Oct 2021 10:53:49 -0400
Received: by mail-ed1-x52f.google.com with SMTP id u13so15515276edy.10;
 Tue, 26 Oct 2021 07:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q6rRe5G++7fuW7fMR8vdNhXh4r3k4FwIMrqZFd9P21Y=;
 b=MephXJ7JZuu9VjEEAMjAUR75J45gJQLAQJ2IIHatQEze8l16B4bQwkr0IsRHiHqo/F
 MjN1KWhkB/Wd4ZgS7GHy4l4y1H16gp4C4d2inEBu3uGb6sXpY99ISG1MTjGaxy64wnDk
 K1SjGtpYDiycVJbtn2zCXOE4ObQjGbgQtW0LmAjb9pYwL6/e6BRsBdhOW4LN9eN070cI
 mwhezpIY+rR1xE4m1lzwWjgYaFwgi28guin9cWAapxTcH1GhitJupq5NP4LbTR4YJSZd
 Qy/vk5dXFXL/Blfl1nbLsOj/tFVFU+lu24If6MnyYseZ/hN/Tf3IF5Dnks64XKajUemR
 HB5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q6rRe5G++7fuW7fMR8vdNhXh4r3k4FwIMrqZFd9P21Y=;
 b=Ms08J+emXyfJJN5k7KqMMYDWrg2WTXxfy+8NLH8BAAtEGrj6Bh+BXpVz2lAEQFS2iM
 v89mZQ0wJx/94iZq1a4sC0Zpu/+M7fMem6VNrIUxJGBylMty94WNwnlCK1RT4/XXX5AV
 O+tSq1InLJRJCSsNo1Pura4PZLhzze2VMVz+VTW2/RBli035nSjmW2YiiceT9nD04JiG
 nBQSXLomTgSPJFmYtTPE8hWu9pHZWlMmedFOgqqG8PRwr4FzhTxEDu3mFU5Tk9JyBxXu
 6XHtWYV6BlCHGvP12MHs31lVLKbbZzUaeyTVkK/esAHlDtd7vu5azPvObUQLchfZj31e
 4mcg==
X-Gm-Message-State: AOAM5328IB3n+eWkgaKrUJNU6MzC8Nu4r/mc9oaDYzdjBtui2DuzJfBD
 7hs8zMLfHAIMjzrXiTlByzOhsOE7kA+qaORg
X-Google-Smtp-Source: ABdhPJynbMWdWKOZjUdHMSuQ8wt7pKVc0FEwpX70lKwj4zbDyhqcYEaGNohMyOd+DVy08autt+2S+Q==
X-Received: by 2002:a17:906:1601:: with SMTP id
 m1mr31069882ejd.117.1635259904216; 
 Tue, 26 Oct 2021 07:51:44 -0700 (PDT)
Received: from msi.. (bba177573.alshamil.net.ae. [217.165.4.27])
 by smtp.gmail.com with ESMTPSA id b19sm9182333ejc.107.2021.10.26.07.51.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 07:51:43 -0700 (PDT)
From: Jose Martins <josemartins90@gmail.com>
To: qemu-devel@nongnu.org
Cc: Jose Martins <josemartins90@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
Subject: [PATCH v2 2/2] target/riscv: remove force HS exception
Date: Tue, 26 Oct 2021 15:51:26 +0100
Message-Id: <20211026145126.11025-3-josemartins90@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211026145126.11025-1-josemartins90@gmail.com>
References: <20211026145126.11025-1-josemartins90@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=josemartins90@gmail.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Oct 2021 14:53:49 -0000

There is no need to "force an hs exception" as the current privilege
level, the state of the global ie and of the delegation registers should
be enough to route the interrupt to the appropriate privilege level in
riscv_cpu_do_interrupt. The is true for both asynchronous and
synchronous exceptions, specifically, guest page faults which must be
hardwired to zero hedeleg. As such the hs_force_except mechanism can be
removed.

Signed-off-by: Jose Martins <josemartins90@gmail.com>
---
 target/riscv/cpu.h        |  2 --
 target/riscv/cpu_bits.h   |  6 ------
 target/riscv/cpu_helper.c | 26 +-------------------------
 3 files changed, 1 insertion(+), 33 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index bf1c899c00..b3205bfee3 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -338,8 +338,6 @@ bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_request);
 bool riscv_cpu_fp_enabled(CPURISCVState *env);
 bool riscv_cpu_virt_enabled(CPURISCVState *env);
 void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable);
-bool riscv_cpu_force_hs_excep_enabled(CPURISCVState *env);
-void riscv_cpu_set_force_hs_excep(CPURISCVState *env, bool enable);
 bool riscv_cpu_two_stage_lookup(int mmu_idx);
 int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch);
 hwaddr riscv_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 7330ff5a19..5c447e1cc5 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -410,12 +410,6 @@
 
 /* Virtulisation Register Fields */
 #define VIRT_ONOFF          1
-/* This is used to save state for when we take an exception. If this is set
- * that means that we want to force a HS level exception (no matter what the
- * delegation is set to). This will occur for things such as a second level
- * page table fault.
- */
-#define FORCE_HS_EXCEP      2
 
 /* RV32 satp CSR field masks */
 #define SATP32_MODE         0x80000000
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 55db004fea..59b72262be 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -178,24 +178,6 @@ void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable)
     env->virt = set_field(env->virt, VIRT_ONOFF, enable);
 }
 
-bool riscv_cpu_force_hs_excep_enabled(CPURISCVState *env)
-{
-    if (!riscv_has_ext(env, RVH)) {
-        return false;
-    }
-
-    return get_field(env->virt, FORCE_HS_EXCEP);
-}
-
-void riscv_cpu_set_force_hs_excep(CPURISCVState *env, bool enable)
-{
-    if (!riscv_has_ext(env, RVH)) {
-        return;
-    }
-
-    env->virt = set_field(env->virt, FORCE_HS_EXCEP, enable);
-}
-
 bool riscv_cpu_two_stage_lookup(int mmu_idx)
 {
     return mmu_idx & TB_FLAGS_PRIV_HYP_ACCESS_MASK;
@@ -912,7 +894,6 @@ void riscv_cpu_do_interrupt(CPUState *cs)
 
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
-    bool force_hs_execp = riscv_cpu_force_hs_excep_enabled(env);
     uint64_t s;
 
     /* cs->exception is 32-bits wide unlike mcause which is XLEN-bits wide
@@ -941,8 +922,6 @@ void riscv_cpu_do_interrupt(CPUState *cs)
         case RISCV_EXCP_INST_GUEST_PAGE_FAULT:
         case RISCV_EXCP_LOAD_GUEST_ACCESS_FAULT:
         case RISCV_EXCP_STORE_GUEST_AMO_ACCESS_FAULT:
-            force_hs_execp = true;
-            /* fallthrough */
         case RISCV_EXCP_INST_ADDR_MIS:
         case RISCV_EXCP_INST_ACCESS_FAULT:
         case RISCV_EXCP_LOAD_ADDR_MIS:
@@ -1001,8 +980,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
                 env->hstatus = set_field(env->hstatus, HSTATUS_GVA, 0);
             }
 
-            if (riscv_cpu_virt_enabled(env) && ((hdeleg >> cause) & 1) &&
-                !force_hs_execp) {
+            if (riscv_cpu_virt_enabled(env) && ((hdeleg >> cause) & 1)) {
                 /* Trap to VS mode */
                 /*
                  * See if we need to adjust cause. Yes if its VS mode interrupt
@@ -1024,7 +1002,6 @@ void riscv_cpu_do_interrupt(CPUState *cs)
                 htval = env->guest_phys_fault_addr;
 
                 riscv_cpu_set_virt_enabled(env, 0);
-                riscv_cpu_set_force_hs_excep(env, 0);
             } else {
                 /* Trap into HS mode */
                 env->hstatus = set_field(env->hstatus, HSTATUS_SPV, false);
@@ -1060,7 +1037,6 @@ void riscv_cpu_do_interrupt(CPUState *cs)
 
             /* Trapping to M mode, virt is disabled */
             riscv_cpu_set_virt_enabled(env, 0);
-            riscv_cpu_set_force_hs_excep(env, 0);
         }
 
         s = env->mstatus;
-- 
2.33.1


