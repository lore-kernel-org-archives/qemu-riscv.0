Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mLGl0-0008JD-6Z
	for mharc-qemu-riscv@gnu.org; Tue, 31 Aug 2021 23:17:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mLGkn-0008I3-Pf; Tue, 31 Aug 2021 23:17:35 -0400
Received: from ozlabs.org ([203.11.71.1]:35551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mLGkh-0007RL-L7; Tue, 31 Aug 2021 23:17:33 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Gzq403TB3z9sSs; Wed,  1 Sep 2021 13:17:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1630466240;
 bh=ukQRDHtUmgYHuKhCL22xvG432/lrXYsRkrDGIZkojUs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bpXoE7uViQQsmZ2xL/v3qoWsAjE7QEykkiyCZqzIS0eu+dIIXwHGQmrdmD+ncL12j
 zzifJ1okfhy+ZvoR6eMEehnLD022T9aIm+/P8VVpNfFNrAzEBQZpguSmk97eWN9ZfI
 iLfxp5QlClS9QpcQ1BaYpFIgC3A4vlzdgtIzvfx4=
Date: Wed, 1 Sep 2021 12:35:42 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 Laurent Vivier <laurent@vivier.eu>, Peter Xu <peterx@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-ppc@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-riscv@nongnu.org,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Stafford Horne <shorne@gmail.com>, Huacai Chen <chenhuacai@kernel.org>,
 Halil Pasic <pasic@linux.ibm.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Bin Meng <bin.meng@windriver.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Greg Kurz <groug@kaod.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-s390x@nongnu.org,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 David Hildenbrand <david@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH 20/29] tcg_funcs: Add cpu_restore_state to TCGModuleOps
Message-ID: <YS7m/sZLhqqhFlUm@yekko>
References: <20210831121545.2874233-1-kraxel@redhat.com>
 <20210831121545.2874233-21-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="i0oKE9nC4j493StY"
Content-Disposition: inline
In-Reply-To: <20210831121545.2874233-21-kraxel@redhat.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Wed, 01 Sep 2021 03:17:40 -0000


--i0oKE9nC4j493StY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 31, 2021 at 02:15:36PM +0200, Gerd Hoffmann wrote:
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>

ppc part

Acked-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  include/exec/exec-all.h             | 2 +-
>  include/tcg/tcg-module.h            | 1 +
>  accel/tcg/cpu-exec-common.c         | 2 +-
>  accel/tcg/tcg-module.c              | 6 ++++++
>  accel/tcg/translate-all.c           | 3 ++-
>  softmmu/physmem.c                   | 2 +-
>  target/alpha/helper.c               | 2 +-
>  target/alpha/mem_helper.c           | 2 +-
>  target/arm/op_helper.c              | 2 +-
>  target/arm/tlb_helper.c             | 8 ++++----
>  target/cris/helper.c                | 2 +-
>  target/i386/helper.c                | 2 +-
>  target/i386/tcg/sysemu/svm_helper.c | 2 +-
>  target/m68k/op_helper.c             | 6 +++---
>  target/microblaze/helper.c          | 2 +-
>  target/openrisc/sys_helper.c        | 8 ++++----
>  target/ppc/excp_helper.c            | 2 +-
>  target/s390x/tcg/excp_helper.c      | 2 +-
>  target/tricore/op_helper.c          | 2 +-
>  target/xtensa/helper.c              | 6 +++---
>  20 files changed, 36 insertions(+), 28 deletions(-)
>=20
> diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
> index c27e911b65f9..546db9416f43 100644
> --- a/include/exec/exec-all.h
> +++ b/include/exec/exec-all.h
> @@ -60,7 +60,7 @@ void restore_state_to_opc(CPUArchState *env, Translatio=
nBlock *tb,
>   * code. If the searched_pc is not in translated code no state is
>   * restored and the function returns false.
>   */
> -bool cpu_restore_state(CPUState *cpu, uintptr_t searched_pc, bool will_e=
xit);
> +// FIXME: docs
> =20
>  void QEMU_NORETURN cpu_loop_exit_noexc(CPUState *cpu);
>  void QEMU_NORETURN cpu_loop_exit(CPUState *cpu);
> diff --git a/include/tcg/tcg-module.h b/include/tcg/tcg-module.h
> index 645e8eb39e71..01205ad8fd34 100644
> --- a/include/tcg/tcg-module.h
> +++ b/include/tcg/tcg-module.h
> @@ -16,6 +16,7 @@ struct TCGModuleOps {
>      void (*tb_flush)(CPUState *cpu);
>      void (*tb_invalidate_phys_range)(tb_page_addr_t start, tb_page_addr_=
t end);
>      void (*tb_check_watchpoint)(CPUState *cpu, uintptr_t retaddr);
> +    bool (*cpu_restore_state)(CPUState *cpu, uintptr_t searched_pc, bool=
 will_exit);
>  };
>  extern struct TCGModuleOps tcg;
> =20
> diff --git a/accel/tcg/cpu-exec-common.c b/accel/tcg/cpu-exec-common.c
> index 777ad00befc8..e3c34a51ff6a 100644
> --- a/accel/tcg/cpu-exec-common.c
> +++ b/accel/tcg/cpu-exec-common.c
> @@ -71,7 +71,7 @@ void cpu_loop_exit(CPUState *cpu)
>  void cpu_loop_exit_restore(CPUState *cpu, uintptr_t pc)
>  {
>      if (pc) {
> -        cpu_restore_state(cpu, pc, true);
> +        tcg.cpu_restore_state(cpu, pc, true);
>      }
>      cpu_loop_exit(cpu);
>  }
> diff --git a/accel/tcg/tcg-module.c b/accel/tcg/tcg-module.c
> index ea0c2a160a97..61ad3a648767 100644
> --- a/accel/tcg/tcg-module.c
> +++ b/accel/tcg/tcg-module.c
> @@ -33,6 +33,11 @@ static void tb_check_watchpoint_stub(CPUState *cpu, ui=
ntptr_t retaddr)
>  {
>  }
> =20
> +static bool cpu_restore_state_stub(CPUState *cpu, uintptr_t searched_pc,=
 bool will_exit)
> +{
> +    return false;
> +}
> +
>  struct TCGModuleOps tcg =3D {
>      .tlb_flush =3D update_cpu_stub,
>      .tlb_flush_page =3D tlb_flush_page_stub,
> @@ -45,4 +50,5 @@ struct TCGModuleOps tcg =3D {
>      .tb_flush =3D update_cpu_stub,
>      .tb_invalidate_phys_range =3D tb_invalidate_phys_range_stub,
>      .tb_check_watchpoint =3D tb_check_watchpoint_stub,
> +    .cpu_restore_state =3D cpu_restore_state_stub,
>  };
> diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
> index 57129bbeb791..836ac0565e01 100644
> --- a/accel/tcg/translate-all.c
> +++ b/accel/tcg/translate-all.c
> @@ -378,7 +378,7 @@ static int cpu_restore_state_from_tb(CPUState *cpu, T=
ranslationBlock *tb,
>      return 0;
>  }
> =20
> -bool cpu_restore_state(CPUState *cpu, uintptr_t host_pc, bool will_exit)
> +static bool cpu_restore_state(CPUState *cpu, uintptr_t host_pc, bool wil=
l_exit)
>  {
>      /*
>       * The host_pc has to be in the rx region of the code buffer.
> @@ -2440,6 +2440,7 @@ static void tcg_module_ops_tb(void)
>      tcg.tb_flush =3D tb_flush;
>      tcg.tb_invalidate_phys_range =3D tb_invalidate_phys_range;
>      tcg.tb_check_watchpoint =3D tb_check_watchpoint;
> +    tcg.cpu_restore_state =3D cpu_restore_state;
>  }
> =20
>  type_init(tcg_module_ops_tb);
> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> index 634500fd3b7b..76b6e16d9466 100644
> --- a/softmmu/physmem.c
> +++ b/softmmu/physmem.c
> @@ -947,7 +947,7 @@ void cpu_check_watchpoint(CPUState *cpu, vaddr addr, =
vaddr len,
>                      cpu->cflags_next_tb =3D 1 | curr_cflags(cpu);
>                      mmap_unlock();
>                      if (ra) {
> -                        cpu_restore_state(cpu, ra, true);
> +                        tcg.cpu_restore_state(cpu, ra, true);
>                      }
>                      cpu_loop_exit_noexc(cpu);
>                  }
> diff --git a/target/alpha/helper.c b/target/alpha/helper.c
> index 4f56fe4d2317..5694c3428296 100644
> --- a/target/alpha/helper.c
> +++ b/target/alpha/helper.c
> @@ -504,7 +504,7 @@ void QEMU_NORETURN dynamic_excp(CPUAlphaState *env, u=
intptr_t retaddr,
>      cs->exception_index =3D excp;
>      env->error_code =3D error;
>      if (retaddr) {
> -        cpu_restore_state(cs, retaddr, true);
> +        tcg.cpu_restore_state(cs, retaddr, true);
>          /* Floating-point exceptions (our only users) point to the next =
PC.  */
>          env->pc +=3D 4;
>      }
> diff --git a/target/alpha/mem_helper.c b/target/alpha/mem_helper.c
> index 75e72bc3370f..b4d208cff8f9 100644
> --- a/target/alpha/mem_helper.c
> +++ b/target/alpha/mem_helper.c
> @@ -34,7 +34,7 @@ void alpha_cpu_do_unaligned_access(CPUState *cs, vaddr =
addr,
>      uint64_t pc;
>      uint32_t insn;
> =20
> -    cpu_restore_state(cs, retaddr, true);
> +    tcg.cpu_restore_state(cs, retaddr, true);
> =20
>      pc =3D env->pc;
>      insn =3D cpu_ldl_code(env, pc);
> diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
> index 70b42b55fd0c..d309f32a755e 100644
> --- a/target/arm/op_helper.c
> +++ b/target/arm/op_helper.c
> @@ -62,7 +62,7 @@ void raise_exception_ra(CPUARMState *env, uint32_t excp=
, uint32_t syndrome,
>       * we must restore CPU state here before setting the syndrome
>       * the caller passed us, and cannot use cpu_loop_exit_restore().
>       */
> -    cpu_restore_state(cs, ra, true);
> +    tcg.cpu_restore_state(cs, ra, true);
>      raise_exception(env, excp, syndrome, target_el);
>  }
> =20
> diff --git a/target/arm/tlb_helper.c b/target/arm/tlb_helper.c
> index 3107f9823eff..22c9c8c01d2f 100644
> --- a/target/arm/tlb_helper.c
> +++ b/target/arm/tlb_helper.c
> @@ -117,7 +117,7 @@ void arm_cpu_do_unaligned_access(CPUState *cs, vaddr =
vaddr,
>      ARMMMUFaultInfo fi =3D {};
> =20
>      /* now we have a real cpu fault */
> -    cpu_restore_state(cs, retaddr, true);
> +    tcg.cpu_restore_state(cs, retaddr, true);
> =20
>      fi.type =3D ARMFault_Alignment;
>      arm_deliver_fault(cpu, vaddr, access_type, mmu_idx, &fi);
> @@ -140,7 +140,7 @@ void arm_cpu_do_transaction_failed(CPUState *cs, hwad=
dr physaddr,
>      ARMMMUFaultInfo fi =3D {};
> =20
>      /* now we have a real cpu fault */
> -    cpu_restore_state(cs, retaddr, true);
> +    tcg.cpu_restore_state(cs, retaddr, true);
> =20
>      fi.ea =3D arm_extabort_type(response);
>      fi.type =3D ARMFault_SyncExternal;
> @@ -166,7 +166,7 @@ bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, in=
t size,
>      fi.level =3D 3;
> =20
>      /* now we have a real cpu fault */
> -    cpu_restore_state(cs, retaddr, true);
> +    tcg.cpu_restore_state(cs, retaddr, true);
>      arm_deliver_fault(cpu, address, access_type, mmu_idx, &fi);
>  #else
>      hwaddr phys_addr;
> @@ -207,7 +207,7 @@ bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, in=
t size,
>          return false;
>      } else {
>          /* now we have a real cpu fault */
> -        cpu_restore_state(cs, retaddr, true);
> +        tcg.cpu_restore_state(cs, retaddr, true);
>          arm_deliver_fault(cpu, address, access_type, mmu_idx, &fi);
>      }
>  #endif
> diff --git a/target/cris/helper.c b/target/cris/helper.c
> index 911867f3b482..0b8bfd0efa8f 100644
> --- a/target/cris/helper.c
> +++ b/target/cris/helper.c
> @@ -116,7 +116,7 @@ bool cris_cpu_tlb_fill(CPUState *cs, vaddr address, i=
nt size,
>      cs->exception_index =3D EXCP_BUSFAULT;
>      env->fault_vector =3D res.bf_vec;
>      if (retaddr) {
> -        if (cpu_restore_state(cs, retaddr, true)) {
> +        if (tcg.cpu_restore_state(cs, retaddr, true)) {
>              /* Evaluate flags after retranslation. */
>              helper_top_evaluate_flags(env);
>          }
> diff --git a/target/i386/helper.c b/target/i386/helper.c
> index 100add713c5d..a059044b84c9 100644
> --- a/target/i386/helper.c
> +++ b/target/i386/helper.c
> @@ -500,7 +500,7 @@ void cpu_report_tpr_access(CPUX86State *env, TPRAcces=
s access)
> =20
>          cpu_interrupt(cs, CPU_INTERRUPT_TPR);
>      } else if (tcg_enabled()) {
> -        cpu_restore_state(cs, cs->mem_io_pc, false);
> +        tcg.cpu_restore_state(cs, cs->mem_io_pc, false);
> =20
>          apic_handle_tpr_access_report(cpu->apic_state, env->eip, access);
>      }
> diff --git a/target/i386/tcg/sysemu/svm_helper.c b/target/i386/tcg/sysemu=
/svm_helper.c
> index 0d549b3d6c3b..74241443aba5 100644
> --- a/target/i386/tcg/sysemu/svm_helper.c
> +++ b/target/i386/tcg/sysemu/svm_helper.c
> @@ -630,7 +630,7 @@ void cpu_vmexit(CPUX86State *env, uint32_t exit_code,=
 uint64_t exit_info_1,
>  {
>      CPUState *cs =3D env_cpu(env);
> =20
> -    cpu_restore_state(cs, retaddr, true);
> +    tcg.cpu_restore_state(cs, retaddr, true);
> =20
>      qemu_log_mask(CPU_LOG_TB_IN_ASM, "vmexit(%08x, %016" PRIx64 ", %016"
>                    PRIx64 ", " TARGET_FMT_lx ")!\n",
> diff --git a/target/m68k/op_helper.c b/target/m68k/op_helper.c
> index d006d1cb3eaa..54932083dfcb 100644
> --- a/target/m68k/op_helper.c
> +++ b/target/m68k/op_helper.c
> @@ -468,7 +468,7 @@ void m68k_cpu_transaction_failed(CPUState *cs, hwaddr=
 physaddr, vaddr addr,
>      M68kCPU *cpu =3D M68K_CPU(cs);
>      CPUM68KState *env =3D &cpu->env;
> =20
> -    cpu_restore_state(cs, retaddr, true);
> +    tcg.cpu_restore_state(cs, retaddr, true);
> =20
>      if (m68k_feature(env, M68K_FEATURE_M68040)) {
>          env->mmu.mmusr =3D 0;
> @@ -1076,7 +1076,7 @@ void HELPER(chk)(CPUM68KState *env, int32_t val, in=
t32_t ub)
>          CPUState *cs =3D env_cpu(env);
> =20
>          /* Recover PC and CC_OP for the beginning of the insn.  */
> -        cpu_restore_state(cs, GETPC(), true);
> +        tcg.cpu_restore_state(cs, GETPC(), true);
> =20
>          /* flags have been modified by gen_flush_flags() */
>          env->cc_op =3D CC_OP_FLAGS;
> @@ -1108,7 +1108,7 @@ void HELPER(chk2)(CPUM68KState *env, int32_t val, i=
nt32_t lb, int32_t ub)
>          CPUState *cs =3D env_cpu(env);
> =20
>          /* Recover PC and CC_OP for the beginning of the insn.  */
> -        cpu_restore_state(cs, GETPC(), true);
> +        tcg.cpu_restore_state(cs, GETPC(), true);
> =20
>          /* flags have been modified by gen_flush_flags() */
>          env->cc_op =3D CC_OP_FLAGS;
> diff --git a/target/microblaze/helper.c b/target/microblaze/helper.c
> index 20dbd673136e..b0652b20c2ec 100644
> --- a/target/microblaze/helper.c
> +++ b/target/microblaze/helper.c
> @@ -297,7 +297,7 @@ void mb_cpu_do_unaligned_access(CPUState *cs, vaddr a=
ddr,
>      uint32_t esr, iflags;
> =20
>      /* Recover the pc and iflags from the corresponding insn_start.  */
> -    cpu_restore_state(cs, retaddr, true);
> +    tcg.cpu_restore_state(cs, retaddr, true);
>      iflags =3D cpu->env.iflags;
> =20
>      qemu_log_mask(CPU_LOG_INT,
> diff --git a/target/openrisc/sys_helper.c b/target/openrisc/sys_helper.c
> index 48674231e743..0208485b8567 100644
> --- a/target/openrisc/sys_helper.c
> +++ b/target/openrisc/sys_helper.c
> @@ -45,7 +45,7 @@ void HELPER(mtspr)(CPUOpenRISCState *env, target_ulong =
spr, target_ulong rb)
>          break;
> =20
>      case TO_SPR(0, 16): /* NPC */
> -        cpu_restore_state(cs, GETPC(), true);
> +        tcg.cpu_restore_state(cs, GETPC(), true);
>          /* ??? Mirror or1ksim in not trashing delayed branch state
>             when "jumping" to the current instruction.  */
>          if (env->pc !=3D rb) {
> @@ -131,7 +131,7 @@ void HELPER(mtspr)(CPUOpenRISCState *env, target_ulon=
g spr, target_ulong rb)
>      case TO_SPR(8, 0):  /* PMR */
>          env->pmr =3D rb;
>          if (env->pmr & PMR_DME || env->pmr & PMR_SME) {
> -            cpu_restore_state(cs, GETPC(), true);
> +            tcg.cpu_restore_state(cs, GETPC(), true);
>              env->pc +=3D 4;
>              cs->halted =3D 1;
>              raise_exception(cpu, EXCP_HALTED);
> @@ -222,14 +222,14 @@ target_ulong HELPER(mfspr)(CPUOpenRISCState *env, t=
arget_ulong rd,
>          return env->evbar;
> =20
>      case TO_SPR(0, 16): /* NPC (equals PC) */
> -        cpu_restore_state(cs, GETPC(), false);
> +        tcg.cpu_restore_state(cs, GETPC(), false);
>          return env->pc;
> =20
>      case TO_SPR(0, 17): /* SR */
>          return cpu_get_sr(env);
> =20
>      case TO_SPR(0, 18): /* PPC */
> -        cpu_restore_state(cs, GETPC(), false);
> +        tcg.cpu_restore_state(cs, GETPC(), false);
>          return env->ppc;
> =20
>      case TO_SPR(0, 32): /* EPCR */
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index 7b6ac16eef72..2db29b4d88a0 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -1498,7 +1498,7 @@ void ppc_cpu_do_unaligned_access(CPUState *cs, vadd=
r vaddr,
>      uint32_t insn;
> =20
>      /* Restore state and reload the insn we executed, for filling in DSI=
SR.  */
> -    cpu_restore_state(cs, retaddr, true);
> +    tcg.cpu_restore_state(cs, retaddr, true);
>      insn =3D cpu_ldl_code(env, env->nip);
> =20
>      cs->exception_index =3D POWERPC_EXCP_ALIGN;
> diff --git a/target/s390x/tcg/excp_helper.c b/target/s390x/tcg/excp_helpe=
r.c
> index a61917d04fab..08716f7ee6d3 100644
> --- a/target/s390x/tcg/excp_helper.c
> +++ b/target/s390x/tcg/excp_helper.c
> @@ -38,7 +38,7 @@ void QEMU_NORETURN tcg_s390_program_interrupt(CPUS390XS=
tate *env,
>  {
>      CPUState *cs =3D env_cpu(env);
> =20
> -    cpu_restore_state(cs, ra, true);
> +    tcg.cpu_restore_state(cs, ra, true);
>      qemu_log_mask(CPU_LOG_INT, "program interrupt at %#" PRIx64 "\n",
>                    env->psw.addr);
>      trigger_pgm_exception(env, code);
> diff --git a/target/tricore/op_helper.c b/target/tricore/op_helper.c
> index 32c2bc169981..a7e57abd9f7c 100644
> --- a/target/tricore/op_helper.c
> +++ b/target/tricore/op_helper.c
> @@ -31,7 +31,7 @@ raise_exception_sync_internal(CPUTriCoreState *env, uin=
t32_t class, int tin,
>  {
>      CPUState *cs =3D env_cpu(env);
>      /* in case we come from a helper-call we need to restore the PC */
> -    cpu_restore_state(cs, pc, true);
> +    tcg.cpu_restore_state(cs, pc, true);
> =20
>      /* Tin is loaded into d[15] */
>      env->gpr_d[15] =3D tin;
> diff --git a/target/xtensa/helper.c b/target/xtensa/helper.c
> index f18ab383fd89..347054520b87 100644
> --- a/target/xtensa/helper.c
> +++ b/target/xtensa/helper.c
> @@ -272,7 +272,7 @@ void xtensa_cpu_do_unaligned_access(CPUState *cs,
> =20
>      assert(xtensa_option_enabled(env->config,
>                                   XTENSA_OPTION_UNALIGNED_EXCEPTION));
> -    cpu_restore_state(CPU(cpu), retaddr, true);
> +    tcg.cpu_restore_state(CPU(cpu), retaddr, true);
>      HELPER(exception_cause_vaddr)(env,
>                                    env->pc, LOAD_STORE_ALIGNMENT_CAUSE,
>                                    addr);
> @@ -303,7 +303,7 @@ bool xtensa_cpu_tlb_fill(CPUState *cs, vaddr address,=
 int size,
>      } else if (probe) {
>          return false;
>      } else {
> -        cpu_restore_state(cs, retaddr, true);
> +        tcg.cpu_restore_state(cs, retaddr, true);
>          HELPER(exception_cause_vaddr)(env, env->pc, ret, address);
>      }
>  }
> @@ -316,7 +316,7 @@ void xtensa_cpu_do_transaction_failed(CPUState *cs, h=
waddr physaddr, vaddr addr,
>      XtensaCPU *cpu =3D XTENSA_CPU(cs);
>      CPUXtensaState *env =3D &cpu->env;
> =20
> -    cpu_restore_state(cs, retaddr, true);
> +    tcg.cpu_restore_state(cs, retaddr, true);
>      HELPER(exception_cause_vaddr)(env, env->pc,
>                                    access_type =3D=3D MMU_INST_FETCH ?
>                                    INSTR_PIF_ADDR_ERROR_CAUSE :

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--i0oKE9nC4j493StY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmEu5vwACgkQbDjKyiDZ
s5IQeA/9FpwpovbqU4pSaapu4OX1GCjGnM0ORf435Ae+2txFP03dv+/fWdwS/Hva
gN325LuAUwvkznhgzIod6497+tbdms0ml45hzIOQEIOKqFHnL1s+8nGZq6Y4RvPr
dcnPER6M4fdlSrBvO21h2udSORaj/Q0beeUBZmAv8TR7cFFdoMUofGSbNNNQCZGx
RxN2LMewroQrTs+wSc0JQWCBJ2KhNMgwplnycgqo8Cy7/9ACLqvFgjsOeyGk8TNK
Z80G/yIjdi5lY0Y3ePS6IvItYUt/3ZNf47bbVCy1l/ZtJbPBA2ZgwFCBxFUo4p1H
OoomaM09r4PshTwGKXfNzer0NoX2l+SpDK95ZTECAbjcBs1xr05mt2ypEUSpSATF
mg+kgMmmTGTW/pbPgd9gGHnJLhulAcW5CAZRlPewSe54h1JjabnJMdpX8xr/PI8H
9a2b4qI/HGj0cobv6PIRB6fUTQxjz7hu+NQ/6AT/skqlapfZsqSlAKfIaXuNfOJP
Jm7j9De54qHIQgoakzE8JmCBhiFdQhFRgUz1/HmKeNr8gPmPmTp+aIgpuSQ0pWAZ
1/Sxt6NQb1WI6YoVWAx9mCfiNMQnSp1SlRdGp3xcuU/eNqSREBWYHHintx0nA1l3
CSEDFKgJfiydfbSwvtL+4frOAlTCQbE6ufgg0XHXcalPVGIZhcs=
=flhZ
-----END PGP SIGNATURE-----

--i0oKE9nC4j493StY--

