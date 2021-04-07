Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lU9JS-0003Ad-78
	for mharc-qemu-riscv@gnu.org; Wed, 07 Apr 2021 10:37:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lU9JN-00038x-Io; Wed, 07 Apr 2021 10:37:41 -0400
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136]:39465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lU9JK-0007xZ-Ib; Wed, 07 Apr 2021 10:37:40 -0400
Received: by mail-il1-x136.google.com with SMTP id b17so1030253ilh.6;
 Wed, 07 Apr 2021 07:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CazD4c0d0uyed+kTmDzFInaQ3PjdbHIKRtEplIiZnUs=;
 b=VWeXOEUfuhVX2MJ19uDXx7+TISUMSG2c2WbLTqI5Qw+De7hx6VCwSiDeGs3eCbM0Rl
 pa5JcxBbGwSBPWG3k33zeryhuMekDWNaCtGafSFktyuQt2WDSbhiqBUCyah+yI48lLTt
 NYaZ7F5TMUi7NYUiTQ8KXJhgzH0mvdfw52GWhUFD25hEihYbTzZwyTkZTdhwT9ssB/Yh
 9MZb5lC5WSu4LKcLO2lkQIheqkEyMzzvxydA1TFl8JoKotAAbIR5fGDPEFnc6whv+Js2
 XTRB5LuKda4lJVf0JiVbLtIkcgKPkI3poR2BqxdyiGZVT9+sSrOE0jYPVehjc+nFWdly
 8ZbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CazD4c0d0uyed+kTmDzFInaQ3PjdbHIKRtEplIiZnUs=;
 b=EKrKdb/hBEquMbcuUm+muqh8B7sJdYOx/BFRkgO4x6pPFPe0Lz8nGc6eWDgfBE0P8J
 OE1QNTKmvZNS4rkLzoEszHMuhb95JXC4corG45n8AZuHAQcG6OIa/d/5clG5o/MjR+JG
 Z4+Mx2CVagGuM9sSmzMmd5ibrKHmzuPnhKPoT3GXPZbd2JtHgXmbWgTHahzS3ZyB3BJf
 I4QqOhQKll4c0/8Fk6jS7eXYXPGDw4k9CX5KUSvlYOyebqhOnVhL2K45dtbFhpw3clal
 /fPgW0pzWqZkWvKBZaYSuZv8WfxGa1+a6D0D30p5zT4JBH5lD0EO+AhDInMuz47aS2ja
 tz2Q==
X-Gm-Message-State: AOAM533bJ1dtOetww/DcnJiX+QD3AAIldzBStBt9XIEZ9jeF9yGPvDEn
 qlCfUkzHu9aeet7xU0lFtsvjjHRDzkSNFWyivx0=
X-Google-Smtp-Source: ABdhPJxc9TVG6lybVn5neeAyO8Oyk8t58KeMI+/KF5781ASEv9i2shGWQzW23bCEO03NMoxYOqqWOq+lTw/dPJbqa6M=
X-Received: by 2002:a92:d6cb:: with SMTP id z11mr2934405ilp.227.1617806256955; 
 Wed, 07 Apr 2021 07:37:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210406113109.1031033-1-qemu@jade.fyi>
In-Reply-To: <20210406113109.1031033-1-qemu@jade.fyi>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 7 Apr 2021 10:35:16 -0400
Message-ID: <CAKmqyKNxZuN1xMN6gL+c3dtwXUOjHoC_7P3bkwBpzJu9hGP4MQ@mail.gmail.com>
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::136;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x136.google.com
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
X-List-Received-Date: Wed, 07 Apr 2021 14:37:42 -0000

On Tue, Apr 6, 2021 at 9:10 AM Jade Fink <qemu@jade.fyi> wrote:
>
> Previously the qemu monitor and gdbstub looked at SUM and refused to
> perform accesses to user memory if it is off, which was an impediment to
> debugging.
>
> Signed-off-by: Jade Fink <qemu@jade.fyi>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

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

