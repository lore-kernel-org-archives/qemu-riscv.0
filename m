Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1llnYx-0007pp-9w
	for mharc-qemu-riscv@gnu.org; Wed, 26 May 2021 03:02:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1llnYt-0007pW-3a; Wed, 26 May 2021 03:02:39 -0400
Received: from out28-219.mail.aliyun.com ([115.124.28.219]:47232)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1llnYl-0001aJ-Di; Wed, 26 May 2021 03:02:38 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07436282|-1; CH=green;
 DM=|CONTINUE|false|; DS=CONTINUE|ham_alarm|0.0420234-0.000145827-0.957831;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047187; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=7; RT=7; SR=0; TI=SMTPD_---.KIwZigk_1622012540; 
Received: from 172.27.117.59(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.KIwZigk_1622012540)
 by smtp.aliyun-inc.com(10.147.41.121);
 Wed, 26 May 2021 15:02:20 +0800
Subject: Re: [PATCH v3] target/riscv: fix VS interrupts forwarding to HS
To: Jose Martins <josemartins90@gmail.com>, qemu-devel@nongnu.org
Cc: "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
References: <20210522154429.361235-1-josemartins90@gmail.com>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <94455d68-c088-5875-d115-acd95829406e@c-sky.com>
Date: Wed, 26 May 2021 15:02:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210522154429.361235-1-josemartins90@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: none client-ip=115.124.28.219; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-219.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 26 May 2021 07:02:39 -0000

Hi Jose,

For one patch, the commit message is too long and complex. I recommend 
to split
this patch to a  patch set with 4 patches. The tremohread topic is
'target/riscv: Remove  force hs exception'

1) Define the right hsie to select pending_hs_irqs.

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 21c54ef561..babe3d844b 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -38,36 +38,24 @@ int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
  #ifndef CONFIG_USER_ONLY
  static int riscv_cpu_local_irq_pending(CPURISCVState *env)
  {
      target_ulong irqs;
+    target_ulong virt_enabled = riscv_cpu_virt_enabled(env);
  
      target_ulong mstatus_mie = get_field(env->mstatus, MSTATUS_MIE);
      target_ulong mstatus_sie = get_field(env->mstatus, MSTATUS_SIE);
-    target_ulong hs_mstatus_sie = get_field(env->mstatus_hs, MSTATUS_SIE);
  
      target_ulong pending = env->mip & env->mie &
                                 ~(MIP_VSSIP | MIP_VSTIP | MIP_VSEIP);
      target_ulong vspending = (env->mip & env->mie &
                               (MIP_VSSIP | MIP_VSTIP | MIP_VSEIP));
  
      target_ulong mie    = env->priv < PRV_M ||
                            (env->priv == PRV_M && mstatus_mie);
      target_ulong sie    = env->priv < PRV_S ||
                            (env->priv == PRV_S && mstatus_sie);

+    target_ulong hsie   = virt_enabled || sie;
  
     if (riscv_cpu_virt_enabled(env)) {
         target_ulong pending_hs_irq = pending & -hs_sie;

         if (pending_hs_irq) {
             riscv_cpu_set_force_hs_excep(env, FORCE_HS_EXCEP);
             return ctz64(pending_hs_irq);
         }

         pending = vspending;
     }

     irqs = (pending & ~env->mideleg & -mie) | (pending &  env->mideleg & -sie);

2) Merge the vspending to pending, and calculate the right irq.

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 21c54ef561..babe3d844b 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -38,36 +38,24 @@ int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
  #ifndef CONFIG_USER_ONLY
  static int riscv_cpu_local_irq_pending(CPURISCVState *env)
  {
     target_ulong irqs;
     target_ulong virt_enabled = riscv_cpu_virt_enabled(env);
  
      target_ulong mstatus_mie = get_field(env->mstatus, MSTATUS_MIE);
      target_ulong mstatus_sie = get_field(env->mstatus, MSTATUS_SIE);
  
-    target_ulong pending = env->mip & env->mie &
-                               ~(MIP_VSSIP | MIP_VSTIP | MIP_VSEIP);
-    target_ulong vspending = (env->mip & env->mie &
-                              (MIP_VSSIP | MIP_VSTIP | MIP_VSEIP));
+    target_ulong pending = env->mip & env->mie;
  
      target_ulong mie    = env->priv < PRV_M ||
                            (env->priv == PRV_M && mstatus_mie);
      target_ulong sie    = env->priv < PRV_S ||
                            (env->priv == PRV_S && mstatus_sie);

      target_ulong hsie   = virt_enabled || sie;
+    target_ulong vsie   = virt_enabled && sie;
  
-    if (riscv_cpu_virt_enabled(env)) {
-        target_ulong pending_hs_irq = pending & -hs_sie;
-
-        if (pending_hs_irq) {
-            riscv_cpu_set_force_hs_excep(env, FORCE_HS_EXCEP);
-            return ctz64(pending_hs_irq);
-        }
-
-        pending = vspending;
-    }
-
-    irqs = (pending & ~env->mideleg & -mie) | (pending &  env->mideleg & -sie);
+    irqs = (pending & ~env->mideleg & -mie) |
+           (pending &  env->mideleg & ~env->hideleg & -hsie) |
+           (pending &  env->mideleg &  env->hideleg & -vsie);
  
      if (irqs) {
          return ctz64(irqs); /* since non-zero */

3) Clear the use  force_hs_excp of the synchronous guest exceptions.

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 21c54ef561..babe3d844b 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
  bool riscv_cpu_two_stage_lookup(int mmu_idx)
  {
      return mmu_idx & TB_FLAGS_PRIV_HYP_ACCESS_MASK;
@@ -896,7 +866,6 @@ void riscv_cpu_do_interrupt(CPUState *cs)
  
      RISCVCPU *cpu = RISCV_CPU(cs);
      CPURISCVState *env = &cpu->env;
-    bool force_hs_execp = riscv_cpu_force_hs_excep_enabled(env);
      uint64_t s;
  
      /* cs->exception is 32-bits wide unlike mcause which is XLEN-bits wide
@@ -925,8 +894,6 @@ void riscv_cpu_do_interrupt(CPUState *cs)
          case RISCV_EXCP_INST_GUEST_PAGE_FAULT:
          case RISCV_EXCP_LOAD_GUEST_ACCESS_FAULT:
          case RISCV_EXCP_STORE_GUEST_AMO_ACCESS_FAULT:
-            force_hs_execp = true;
-            /* fallthrough */
          case RISCV_EXCP_INST_ADDR_MIS:
          case RISCV_EXCP_INST_ACCESS_FAULT:
          case RISCV_EXCP_LOAD_ADDR_MIS:
@@ -985,8 +952,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
                  env->hstatus = set_field(env->hstatus, HSTATUS_GVA, 0);
              }
  
-            if (riscv_cpu_virt_enabled(env) && ((hdeleg >> cause) & 1) &&
-                !force_hs_execp) {
+            if (riscv_cpu_virt_enabled(env) && ((hdeleg >> cause) & 1)) {
                  /* Trap to VS mode */
                  /*
                   * See if we need to adjust cause. Yes if its VS mode interrupt
@@ -1008,7 +974,6 @@ void riscv_cpu_do_interrupt(CPUState *cs)
                  htval = env->guest_phys_fault_addr;
  
                  riscv_cpu_set_virt_enabled(env, 0);
                  riscv_cpu_set_force_hs_excep(env, 0);
              } else {
                  /* Trap into HS mode */
                  env->hstatus = set_field(env->hstatus, HSTATUS_SPV, false);
@@ -1044,7 +1009,6 @@ void riscv_cpu_do_interrupt(CPUState *cs)
  
              /* Trapping to M mode, virt is disabled */
              riscv_cpu_set_virt_enabled(env, 0);
              riscv_cpu_set_force_hs_excep(env, 0);
          }
  
          s = env->mstatus;

4) Remove  the definition and references of riscv_cpu_set_force_hs_excep and
     riscv_cpu_force_hs_excep_enabled.

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 0a33d387ba..a30a64241a 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -337,8 +337,6 @@ bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_request);
  bool riscv_cpu_fp_enabled(CPURISCVState *env);
  bool riscv_cpu_virt_enabled(CPURISCVState *env);
  void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable);
-bool riscv_cpu_force_hs_excep_enabled(CPURISCVState *env);
-void riscv_cpu_set_force_hs_excep(CPURISCVState *env, bool enable);
  bool riscv_cpu_two_stage_lookup(int mmu_idx);
  int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch);
  hwaddr riscv_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index caf4599207..7322f54157 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -462,12 +462,6 @@
  
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
index 21c54ef561..babe3d844b 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
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
@@ -896,7 +866,6 @@ void riscv_cpu_do_interrupt(CPUState *cs)
  
      RISCVCPU *cpu = RISCV_CPU(cs);
      CPURISCVState *env = &cpu->env;
      uint64_t s;
  
      /* cs->exception is 32-bits wide unlike mcause which is XLEN-bits wide
@@ -925,8 +894,6 @@ void riscv_cpu_do_interrupt(CPUState *cs)
          case RISCV_EXCP_INST_GUEST_PAGE_FAULT:
          case RISCV_EXCP_LOAD_GUEST_ACCESS_FAULT:
          case RISCV_EXCP_STORE_GUEST_AMO_ACCESS_FAULT:
          case RISCV_EXCP_INST_ADDR_MIS:
          case RISCV_EXCP_INST_ACCESS_FAULT:
          case RISCV_EXCP_LOAD_ADDR_MIS:
@@ -985,8 +952,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
                  env->hstatus = set_field(env->hstatus, HSTATUS_GVA, 0);
              }
  
              if (riscv_cpu_virt_enabled(env) && ((hdeleg >> cause) & 1)) {
                  /* Trap to VS mode */
                  /*
                   * See if we need to adjust cause. Yes if its VS mode interrupt
@@ -1008,7 +974,6 @@ void riscv_cpu_do_interrupt(CPUState *cs)
                  htval = env->guest_phys_fault_addr;
  
                  riscv_cpu_set_virt_enabled(env, 0);
-                riscv_cpu_set_force_hs_excep(env, 0);
              } else {
                  /* Trap into HS mode */
                  env->hstatus = set_field(env->hstatus, HSTATUS_SPV, false);
@@ -1044,7 +1009,6 @@ void riscv_cpu_do_interrupt(CPUState *cs)
  
              /* Trapping to M mode, virt is disabled */
              riscv_cpu_set_virt_enabled(env, 0);
-            riscv_cpu_set_force_hs_excep(env, 0);
          }
  
          s = env->mstatus;

On 5/22/21 11:44 PM, Jose Martins wrote:
> VS interrupts (2, 6, 10) were not correctly forwarded to hs-mode when
> not delegated in hideleg (which was not being taken into account).

I think there are two errors in riscv_cpu_local_irq_pending.

1) VS interrupts can't be forwarded to hs-mode rightly . It has
nothing to do with delegate or not in hideleg. The reason is that
VS interrupts are always discarded when V=0 in
riscv_cpu_local_irq_pending.

2) Use MSTATUS_SIE in mstatus_hs to select pending_hs_irqs.
The reason is as you described below.

> This
> was mainly because hs level sie was not always considered enabled when
> it should. The spec states that "Interrupts for higher-privilege modes,
> y>x, are always globally enabled regardless of the setting of the global
> yIE bit for the higher-privilege mode." and also "For purposes of
> interrupt global enables, HS-mode is considered more privileged than
> VS-mode, and VS-mode is considered more privileged than VU-mode".
This can be used as commit message for patch 1/4.
>
> These interrupts should be treated the same as any other kind of
> exception. Therefore, there is no need to "force an hs exception" as the
> current privilege level, the state of the global ie and of the
> delegation registers should be enough to route the interrupt to the
> appropriate privilege level in riscv_cpu_do_interrupt.
This can be used as commit message for patch 2/4.
> Also, these
> interrupts never target m-mode, which is  guaranteed by the hardwiring
> of the corresponding bits in mideleg.
> The same is true for synchronous
> exceptions, specifically, guest page faults which must be hardwired in
> to zero hedeleg. As such the hs_force_except mechanism can be removed.

This can be used as commit message for patch 3/4.

Best Regards,

Zhiwei

>
> Signed-off-by: Jose Martins <josemartins90@gmail.com>
> ---
> This version of the patch also removes the uneeded hs_force_except
> functions, variables and macro.
>
>   target/riscv/cpu.h        |  2 --
>   target/riscv/cpu_bits.h   |  6 -----
>   target/riscv/cpu_helper.c | 54 +++++++--------------------------------
>   3 files changed, 9 insertions(+), 53 deletions(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 0a33d387ba..a30a64241a 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -337,8 +337,6 @@ bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_request);
>   bool riscv_cpu_fp_enabled(CPURISCVState *env);
>   bool riscv_cpu_virt_enabled(CPURISCVState *env);
>   void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable);
> -bool riscv_cpu_force_hs_excep_enabled(CPURISCVState *env);
> -void riscv_cpu_set_force_hs_excep(CPURISCVState *env, bool enable);
>   bool riscv_cpu_two_stage_lookup(int mmu_idx);
>   int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch);
>   hwaddr riscv_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index caf4599207..7322f54157 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -462,12 +462,6 @@
>   
>   /* Virtulisation Register Fields */
>   #define VIRT_ONOFF          1
> -/* This is used to save state for when we take an exception. If this is set
> - * that means that we want to force a HS level exception (no matter what the
> - * delegation is set to). This will occur for things such as a second level
> - * page table fault.
> - */
> -#define FORCE_HS_EXCEP      2
>   
>   /* RV32 satp CSR field masks */
>   #define SATP32_MODE         0x80000000
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 21c54ef561..babe3d844b 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -38,36 +38,24 @@ int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
>   #ifndef CONFIG_USER_ONLY
>   static int riscv_cpu_local_irq_pending(CPURISCVState *env)
>   {
> -    target_ulong irqs;
> +    target_ulong virt_enabled = riscv_cpu_virt_enabled(env);
>   
>       target_ulong mstatus_mie = get_field(env->mstatus, MSTATUS_MIE);
>       target_ulong mstatus_sie = get_field(env->mstatus, MSTATUS_SIE);
> -    target_ulong hs_mstatus_sie = get_field(env->mstatus_hs, MSTATUS_SIE);
>   
> -    target_ulong pending = env->mip & env->mie &
> -                               ~(MIP_VSSIP | MIP_VSTIP | MIP_VSEIP);
> -    target_ulong vspending = (env->mip & env->mie &
> -                              (MIP_VSSIP | MIP_VSTIP | MIP_VSEIP));
> +    target_ulong pending = env->mip & env->mie;
>   
>       target_ulong mie    = env->priv < PRV_M ||
>                             (env->priv == PRV_M && mstatus_mie);
>       target_ulong sie    = env->priv < PRV_S ||
>                             (env->priv == PRV_S && mstatus_sie);
> -    target_ulong hs_sie = env->priv < PRV_S ||
> -                          (env->priv == PRV_S && hs_mstatus_sie);
> +    target_ulong hsie   = virt_enabled || sie;
> +    target_ulong vsie   = virt_enabled && sie;
>   
> -    if (riscv_cpu_virt_enabled(env)) {
> -        target_ulong pending_hs_irq = pending & -hs_sie;
> -
> -        if (pending_hs_irq) {
> -            riscv_cpu_set_force_hs_excep(env, FORCE_HS_EXCEP);
> -            return ctz64(pending_hs_irq);
> -        }
> -
> -        pending = vspending;
> -    }
> -
> -    irqs = (pending & ~env->mideleg & -mie) | (pending &  env->mideleg & -sie);
> +    target_ulong irqs =
> +            (pending & ~env->mideleg & -mie) |
> +            (pending &  env->mideleg & ~env->hideleg & -hsie) |
> +            (pending &  env->mideleg &  env->hideleg & -vsie);
>   
>       if (irqs) {
>           return ctz64(irqs); /* since non-zero */
> @@ -190,24 +178,6 @@ void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable)
>       env->virt = set_field(env->virt, VIRT_ONOFF, enable);
>   }
>   
> -bool riscv_cpu_force_hs_excep_enabled(CPURISCVState *env)
> -{
> -    if (!riscv_has_ext(env, RVH)) {
> -        return false;
> -    }
> -
> -    return get_field(env->virt, FORCE_HS_EXCEP);
> -}
> -
> -void riscv_cpu_set_force_hs_excep(CPURISCVState *env, bool enable)
> -{
> -    if (!riscv_has_ext(env, RVH)) {
> -        return;
> -    }
> -
> -    env->virt = set_field(env->virt, FORCE_HS_EXCEP, enable);
> -}
> -
>   bool riscv_cpu_two_stage_lookup(int mmu_idx)
>   {
>       return mmu_idx & TB_FLAGS_PRIV_HYP_ACCESS_MASK;
> @@ -896,7 +866,6 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>   
>       RISCVCPU *cpu = RISCV_CPU(cs);
>       CPURISCVState *env = &cpu->env;
> -    bool force_hs_execp = riscv_cpu_force_hs_excep_enabled(env);
>       uint64_t s;
>   
>       /* cs->exception is 32-bits wide unlike mcause which is XLEN-bits wide
> @@ -925,8 +894,6 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>           case RISCV_EXCP_INST_GUEST_PAGE_FAULT:
>           case RISCV_EXCP_LOAD_GUEST_ACCESS_FAULT:
>           case RISCV_EXCP_STORE_GUEST_AMO_ACCESS_FAULT:
> -            force_hs_execp = true;
> -            /* fallthrough */
>           case RISCV_EXCP_INST_ADDR_MIS:
>           case RISCV_EXCP_INST_ACCESS_FAULT:
>           case RISCV_EXCP_LOAD_ADDR_MIS:
> @@ -985,8 +952,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>                   env->hstatus = set_field(env->hstatus, HSTATUS_GVA, 0);
>               }
>   
> -            if (riscv_cpu_virt_enabled(env) && ((hdeleg >> cause) & 1) &&
> -                !force_hs_execp) {
> +            if (riscv_cpu_virt_enabled(env) && ((hdeleg >> cause) & 1)) {
>                   /* Trap to VS mode */
>                   /*
>                    * See if we need to adjust cause. Yes if its VS mode interrupt
> @@ -1008,7 +974,6 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>                   htval = env->guest_phys_fault_addr;
>   
>                   riscv_cpu_set_virt_enabled(env, 0);
> -                riscv_cpu_set_force_hs_excep(env, 0);
>               } else {
>                   /* Trap into HS mode */
>                   env->hstatus = set_field(env->hstatus, HSTATUS_SPV, false);
> @@ -1044,7 +1009,6 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>   
>               /* Trapping to M mode, virt is disabled */
>               riscv_cpu_set_virt_enabled(env, 0);
> -            riscv_cpu_set_force_hs_excep(env, 0);
>           }
>   
>           s = env->mstatus;

