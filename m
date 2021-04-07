Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lU9YS-0006C3-2C
	for mharc-qemu-riscv@gnu.org; Wed, 07 Apr 2021 10:53:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lU9YO-0006Bf-U0; Wed, 07 Apr 2021 10:53:12 -0400
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129]:44860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lU9YM-0000qV-Tw; Wed, 07 Apr 2021 10:53:12 -0400
Received: by mail-il1-x129.google.com with SMTP id o15so12325024ilf.11;
 Wed, 07 Apr 2021 07:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dpl/8EOcUSRryI4OC4MeUbN8HMx04FTbZEqbjHIp7a4=;
 b=NmhldwaEqKlXxHixuOo6fdnlkr/8jrhM1KbTB0hgFUr1036Tp++BTNRi8SiHouYhB/
 bVsE2H+m9uHtdknhrCh2paZipJO2qRRICqfKDHCkhj7fNeNtlJtRfPmvqZmoI0sVYCZC
 qoV6mlfAedtU6RqTQHSqSmCvL+c5vBNp1ibwOzv1+EkCMagwcBdqoXqMz91pESt04EIo
 fv18Ljwj6URZfjFTzdjWFlvTHDyHGOTHr3y3lOO31vh75qUQ1M30HM/xBVhQEfPwk+ww
 ajEdZMm63dfQDsUFyqCIVOxLjRjMlSOC7dAVbV2HFgJ4TV79tQO6jh4Nxir37KATnRYr
 KXTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dpl/8EOcUSRryI4OC4MeUbN8HMx04FTbZEqbjHIp7a4=;
 b=oOZoJyHPNx3aHF71PVEi0AO7mcx6rIX38DIwnGV64vAbReKjkZO4o6r+hDIrel2eg+
 KxtQYWcHws24RJ2vEgGlfzqOv/IFB3XriRWfemWTQWnPNIgiEcy0SiwMAR5Q7xO4lS+5
 RlcX5YE7gci5b++ERnxScrrsuuVJ6y83KsrDdZiuj3LAdLFCjWuMIeSdJS/TVa9igOuo
 uLykvvee02ilP50pXtuAItnTL/+h/1rIOqhaHb81cWSajBBb9j7rlzaQNUW4Ex3XUDin
 DgHYI/zz29sUEEHbgfhFlX8omvuWLU/1m7luNJoKGzjqBQNFDiHTDOGpAg+h641onoEi
 HixQ==
X-Gm-Message-State: AOAM5339zvMAolphncxuUhBufjNB/2manttNK7UXy4jGWh7E/AQAxFxB
 O5EKA39m0EsvyDaGvIoRvIUtND8hsQGsA1gjXzA=
X-Google-Smtp-Source: ABdhPJwcWw+kxDf4/lRFGg8xIzZ7RcGkq9ak7sbNkDnirfXZi60/Rb2O2lBFgF94amW9rOWkrEj+e7Je2tzcrQpUnIM=
X-Received: by 2002:a05:6e02:5a2:: with SMTP id
 k2mr3152530ils.177.1617807189325; 
 Wed, 07 Apr 2021 07:53:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210406113109.1031033-1-qemu@jade.fyi>
In-Reply-To: <20210406113109.1031033-1-qemu@jade.fyi>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 7 Apr 2021 10:50:48 -0400
Message-ID: <CAKmqyKPA-gH02DJ4ktvjzRG-svawjxP2WGbbye2Y=4TG_07Ypg@mail.gmail.com>
Subject: Re: [PATCH] riscv: don't look at SUM when accessing memory from a
 debugger context
To: Jade Fink <qemu@jade.fyi>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::129;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x129.google.com
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
X-List-Received-Date: Wed, 07 Apr 2021 14:53:13 -0000

On Tue, Apr 6, 2021 at 9:10 AM Jade Fink <qemu@jade.fyi> wrote:
>
> Previously the qemu monitor and gdbstub looked at SUM and refused to
> perform accesses to user memory if it is off, which was an impediment to
> debugging.
>
> Signed-off-by: Jade Fink <qemu@jade.fyi>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  target/riscv/cpu_helper.c | 20 ++++++++++++--------
>  1 file changed, 12 insertions(+), 8 deletions(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 83a6bcfad0..18ea2cba57 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -299,12 +299,14 @@ void riscv_cpu_set_mode(CPURISCVState *env, target_ulong newpriv)
>   * @first_stage: Are we in first stage translation?
>   *               Second stage is used for hypervisor guest translation
>   * @two_stage: Are we going to perform two stage translation
> + * @is_debug: Is this access from a debugger or the monitor?
>   */
>  static int get_physical_address(CPURISCVState *env, hwaddr *physical,
>                                  int *prot, target_ulong addr,
>                                  target_ulong *fault_pte_addr,
>                                  int access_type, int mmu_idx,
> -                                bool first_stage, bool two_stage)
> +                                bool first_stage, bool two_stage,
> +                                bool is_debug)
>  {
>      /* NOTE: the env->pc value visible here will not be
>       * correct, but the value visible to the exception handler
> @@ -369,7 +371,7 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
>          widened = 2;
>      }
>      /* status.SUM will be ignored if execute on background */
> -    sum = get_field(env->mstatus, MSTATUS_SUM) || use_background;
> +    sum = get_field(env->mstatus, MSTATUS_SUM) || use_background || is_debug;
>      switch (vm) {
>      case VM_1_10_SV32:
>        levels = 2; ptidxbits = 10; ptesize = 4; break;
> @@ -428,7 +430,8 @@ restart:
>              /* Do the second stage translation on the base PTE address. */
>              int vbase_ret = get_physical_address(env, &vbase, &vbase_prot,
>                                                   base, NULL, MMU_DATA_LOAD,
> -                                                 mmu_idx, false, true);
> +                                                 mmu_idx, false, true,
> +                                                 is_debug);
>
>              if (vbase_ret != TRANSLATE_SUCCESS) {
>                  if (fault_pte_addr) {
> @@ -616,13 +619,13 @@ hwaddr riscv_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
>      int mmu_idx = cpu_mmu_index(&cpu->env, false);
>
>      if (get_physical_address(env, &phys_addr, &prot, addr, NULL, 0, mmu_idx,
> -                             true, riscv_cpu_virt_enabled(env))) {
> +                             true, riscv_cpu_virt_enabled(env), true)) {
>          return -1;
>      }
>
>      if (riscv_cpu_virt_enabled(env)) {
>          if (get_physical_address(env, &phys_addr, &prot, phys_addr, NULL,
> -                                 0, mmu_idx, false, true)) {
> +                                 0, mmu_idx, false, true, true)) {
>              return -1;
>          }
>      }
> @@ -714,7 +717,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>          /* Two stage lookup */
>          ret = get_physical_address(env, &pa, &prot, address,
>                                     &env->guest_phys_fault_addr, access_type,
> -                                   mmu_idx, true, true);
> +                                   mmu_idx, true, true, false);
>
>          /*
>           * A G-stage exception may be triggered during two state lookup.
> @@ -736,7 +739,8 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>              im_address = pa;
>
>              ret = get_physical_address(env, &pa, &prot2, im_address, NULL,
> -                                       access_type, mmu_idx, false, true);
> +                                       access_type, mmu_idx, false, true,
> +                                       false);
>
>              qemu_log_mask(CPU_LOG_MMU,
>                      "%s 2nd-stage address=%" VADDR_PRIx " ret %d physical "
> @@ -765,7 +769,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>      } else {
>          /* Single stage lookup */
>          ret = get_physical_address(env, &pa, &prot, address, NULL,
> -                                   access_type, mmu_idx, true, false);
> +                                   access_type, mmu_idx, true, false, false);
>
>          qemu_log_mask(CPU_LOG_MMU,
>                        "%s address=%" VADDR_PRIx " ret %d physical "
> --
> 2.31.1
>
>

