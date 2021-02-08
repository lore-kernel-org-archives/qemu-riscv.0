Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l97nz-00062I-3S
	for mharc-qemu-riscv@gnu.org; Mon, 08 Feb 2021 09:46:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l97nv-0005zw-Vp
 for qemu-riscv@nongnu.org; Mon, 08 Feb 2021 09:46:20 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:50830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l97na-00064o-Oa
 for qemu-riscv@nongnu.org; Mon, 08 Feb 2021 09:46:12 -0500
Received: by mail-wm1-x332.google.com with SMTP id 190so12852160wmz.0
 for <qemu-riscv@nongnu.org>; Mon, 08 Feb 2021 06:45:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=xR9fGvWhoYeBEwD4RhHEsHWTNzhsE4RptkxQRS6BcaQ=;
 b=xlIXX1BprPFu1FnTvxamS+lh3CzWEgh0Jwk4eDJURXuGkt/FGpz+CfXNZ+lNCquZHy
 EUYbo2u9smM7bP2zhzMXz3LPBrlyNf+vNPgMn0vj1dj5pOlBDKQ/dLe6VLyqr/nmShrH
 fQ25D6L837sPJ+wDc00l6qCu5G+A3f4A5pl0vZ9oQPL9dQs/aWA7uTKJozDgIGiwKUMh
 bxQypQZZtM+0FASrVIINFy+2vEi7BF9ZZXsNYK/e+YjdhPevpBgrjtoYkdkrxLdYci56
 UsyQqdK55Tu9QIZYChFZ9GgZeT862gv8uDOnauOFyKQPMuwpigQ5z4qmmPhLIUm6fGoH
 nvKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=xR9fGvWhoYeBEwD4RhHEsHWTNzhsE4RptkxQRS6BcaQ=;
 b=nIuObJnDXJh0NkXOAkx/MjGsWAvNZlJBHpCOHJh/J2r9x4PLL24qzm6xGPUx6kF6YL
 yQyT5infVeRuQfcZKNLCMY5tPUCH4Q+JB3TdWUjAwGKzVjuAKiTf7vadFCSFuuGovLJZ
 XOTOyw4hDpcvEP/GCndxc6GjnI/eQ4vWqPlu2SCR+pSBSqOFJt2aIblip/0t7f0jRdDU
 bfWa4SWPHwxGSUw+7k6nFKmumgyxKz0JfYtmq1WxWNM4B9hl6RUTXjMNovmZS8dj5Dbc
 JDfwhi5CgnUNfokrVNYVidmNNfWNcQcDJi2pMrmn/+t3beTYRoHu0ry7d0cee3dkpS/D
 hISA==
X-Gm-Message-State: AOAM530N4pOvN8//vjZ95khqSLT7LFWP6QphE93mLmzG4EpK2uJHdK0i
 /PNCjlAYjPDT0DAWrwFvwRFmEw==
X-Google-Smtp-Source: ABdhPJxXS2+y31UVE1Ty5pYQHDeh5zY1HjuxbrS4epgxu3+jlTAqxPFcAxHrFuE3EFZZQ6ASwR7MDg==
X-Received: by 2002:a7b:c7c8:: with SMTP id z8mr14751257wmk.72.1612795554769; 
 Mon, 08 Feb 2021 06:45:54 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c9sm32743661wrw.76.2021.02.08.06.45.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 06:45:53 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 055BB1FF7E;
 Mon,  8 Feb 2021 14:45:53 +0000 (GMT)
References: <20210207232310.2505283-1-f4bug@amsat.org>
 <20210207232310.2505283-7-f4bug@amsat.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, Alistair Francis
 <Alistair.Francis@wdc.com>, qemu-riscv@nongnu.org, Yoshinori Sato
 <ysato@users.sourceforge.jp>, Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, Richard Henderson
 <richard.henderson@linaro.org>, Laurent Vivier <laurent@vivier.eu>,
 qemu-arm@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>, Claudio Fontana
 <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>, Aleksandar Rikalo
 <aleksandar.rikalo@syrmia.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v2 6/6] exec/cpu_ldst: Move tlb* declarations to
 "exec/exec-all.h"
Date: Mon, 08 Feb 2021 14:40:41 +0000
In-reply-to: <20210207232310.2505283-7-f4bug@amsat.org>
Message-ID: <874kimbotb.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 08 Feb 2021 14:46:20 -0000


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> Keep MMU functions in "exec/cpu_ldst.h", and move TLB functions
> to "exec/exec-all.h". As tlb_addr_write() is only called in
> accel/tcg/cputlb.c, make move it there as a static function.
>
> Doing so we removed the "tcg/tcg.h" dependency on "exec/cpu_ldst.h".
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  include/exec/cpu_ldst.h | 28 ----------------------------
>  include/exec/exec-all.h | 16 ++++++++++++++++
>  accel/tcg/cputlb.c      |  9 +++++++++
>  3 files changed, 25 insertions(+), 28 deletions(-)
>
> diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
> index ef54cb7e1f8..c1753a64dfd 100644
> --- a/include/exec/cpu_ldst.h
> +++ b/include/exec/cpu_ldst.h
> @@ -291,34 +291,6 @@ static inline void cpu_stq_le_mmuidx_ra(CPUArchState=
 *env, abi_ptr addr,
>=20=20
>  #else
>=20=20
> -/* Needed for TCG_OVERSIZED_GUEST */
> -#include "tcg/tcg.h"
> -
> -static inline target_ulong tlb_addr_write(const CPUTLBEntry *entry)
> -{
> -#if TCG_OVERSIZED_GUEST
> -    return entry->addr_write;
> -#else
> -    return qatomic_read(&entry->addr_write);
> -#endif
> -}
> -
> -/* Find the TLB index corresponding to the mmu_idx + address pair.  */
> -static inline uintptr_t tlb_index(CPUArchState *env, uintptr_t mmu_idx,
> -                                  target_ulong addr)
> -{
> -    uintptr_t size_mask =3D env_tlb(env)->f[mmu_idx].mask >> CPU_TLB_ENT=
RY_BITS;
> -
> -    return (addr >> TARGET_PAGE_BITS) & size_mask;
> -}
> -
> -/* Find the TLB entry corresponding to the mmu_idx + address pair.  */
> -static inline CPUTLBEntry *tlb_entry(CPUArchState *env, uintptr_t mmu_id=
x,
> -                                     target_ulong addr)
> -{
> -    return &env_tlb(env)->f[mmu_idx].table[tlb_index(env, mmu_idx, addr)=
];
> -}
> -
>  uint32_t cpu_ldub_mmuidx_ra(CPUArchState *env, abi_ptr addr,
>                              int mmu_idx, uintptr_t ra);
>  int cpu_ldsb_mmuidx_ra(CPUArchState *env, abi_ptr addr,
> diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
> index c5e8e355b7f..8e54b537189 100644
> --- a/include/exec/exec-all.h
> +++ b/include/exec/exec-all.h
> @@ -297,6 +297,22 @@ void tlb_set_page(CPUState *cpu, target_ulong vaddr,
>                    hwaddr paddr, int prot,
>                    int mmu_idx, target_ulong size);
>=20=20
> +/* Find the TLB index corresponding to the mmu_idx + address pair.  */
> +static inline uintptr_t tlb_index(CPUArchState *env, uintptr_t mmu_idx,
> +                                  target_ulong addr)
> +{
> +    uintptr_t size_mask =3D env_tlb(env)->f[mmu_idx].mask >> CPU_TLB_ENT=
RY_BITS;
> +
> +    return (addr >> TARGET_PAGE_BITS) & size_mask;
> +}
> +
> +/* Find the TLB entry corresponding to the mmu_idx + address pair.  */
> +static inline CPUTLBEntry *tlb_entry(CPUArchState *env, uintptr_t mmu_id=
x,
> +                                     target_ulong addr)
> +{
> +    return &env_tlb(env)->f[mmu_idx].table[tlb_index(env, mmu_idx, addr)=
];
> +}
> +

I wonder if throwing these into exec-all is worth it, could we not use
the cputlb.h so we avoid too much kitchen sink for a header (after all
we are trying to avoid recompilations and not everything needs detailed
access to the tlb structures).

>  /*
>   * Find the iotlbentry for ptr.  This *must* be present in the TLB
>   * because we just found the mapping.
> diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
> index a6247da34a0..084d19b52d7 100644
> --- a/accel/tcg/cputlb.c
> +++ b/accel/tcg/cputlb.c
> @@ -429,6 +429,15 @@ void tlb_flush_all_cpus_synced(CPUState *src_cpu)
>      tlb_flush_by_mmuidx_all_cpus_synced(src_cpu, ALL_MMUIDX_BITS);
>  }
>=20=20
> +static inline target_ulong tlb_addr_write(const CPUTLBEntry *entry)
> +{
> +#if TCG_OVERSIZED_GUEST
> +    return entry->addr_write;
> +#else
> +    return qatomic_read(&entry->addr_write);
> +#endif
> +}

You can drop the inline, compiler should know best what to do in this case.

>  void tlb_assert_iotlb_entry_for_ptr_present(CPUArchState *env, int ptr_m=
mu_idx,
>                                              uint64_t ptr,
>                                              MMUAccessType ptr_access,


--=20
Alex Benn=C3=A9e

