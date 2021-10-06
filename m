Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mYEbV-0008Kk-Ds
	for mharc-qemu-riscv@gnu.org; Wed, 06 Oct 2021 17:37:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mYEbS-0008GV-8a; Wed, 06 Oct 2021 17:37:30 -0400
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130]:45577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mYEbN-0006v2-2j; Wed, 06 Oct 2021 17:37:30 -0400
Received: by mail-il1-x130.google.com with SMTP id i11so3272918ila.12;
 Wed, 06 Oct 2021 14:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=iKJXez/Q0CMTHQ+bygFWb0XN6B02VccNJAecW5dBrhI=;
 b=foLN+ctHJ/FS5+Do7x8BRiKSsB1/Zn4g0NyUo7bus8EQuVtkRSgE5lYERTb+HuS8yi
 1JUNoa6NKF9Sc2TRSDrETQiIAMD/0R3szpAUR8jHDvH0ZvKC4+jCp3Kzyt9IDx31F7Ww
 AxYPdB6orp2VqP37TC3kO0iqvCooDSQ82ZzPpbv3aBcnZRwdK6ddVv64aEb73RNvMgA0
 izF4knjlizZJAMHL99lmZSWpDeDzkXixaA4jG4xa8CyFRGxY1qOsRom12AMD97+w74Pg
 ng2YSByBeO2NETL7gAABM+LyXz32jIp+UEbbi8chuuBu9ETFufMAoXEpicqfEE08E4lt
 8R8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=iKJXez/Q0CMTHQ+bygFWb0XN6B02VccNJAecW5dBrhI=;
 b=7WGEyL7V18Nn5cMG1WoYgtbg+0TJFBh/VKT9hLhTDamUgE21zbs3QIk/LI0ebgzftQ
 RI1NjQc+IqZiAKvzFkTe3Ap8aIHwEMPBYJlReRRl+NykfbGJcgM8Fwhx21520MWdiPeL
 9bsEF9EvPef/DdZOsTqEJq7KvGW31PUB2z8fzuZLtf2EhH5INeG9vnqPXpNonpGU52Ie
 hH7F3Zo8Y2gwD5n0cbPTXriToa5BgW9F93izsRprdQbgZusXbFrci+lo+U2E8aaCcFy2
 dwy9SR9999VVXBIJyRgVgBpPr6vtqvetVMJBVvvPR+cqcA8dKm/RjpPiru/nZqP1fUs/
 wPaw==
X-Gm-Message-State: AOAM532XRchDRW3WI+H9WsE1TjHjPLOepFqQbAhlSsYnHlrRQYLMejqA
 pMYV6cmrWbTYj22PYZDFE8guY1ZXJgLWCHDIJEoi2bUO1RLauQ==
X-Google-Smtp-Source: ABdhPJwM9s3QhSwgLh73EvqfSYFrc1I4KENFHWw0rFy0hzVc7ouAhUC+UrLzMWV1pKVxmgaHp+rl9HC+J1Tsw7qR++o=
X-Received: by 2002:a92:1a43:: with SMTP id z3mr395164ill.46.1633556242648;
 Wed, 06 Oct 2021 14:37:22 -0700 (PDT)
MIME-Version: 1.0
References: <20211006172307.780893-1-richard.henderson@linaro.org>
 <20211006172307.780893-36-richard.henderson@linaro.org>
In-Reply-To: <20211006172307.780893-36-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 7 Oct 2021 07:36:56 +1000
Message-ID: <CAKmqyKNr4T-KhNnzD4FJFT61rV7vACMah+MzWSH4M-FrLhLh6w@mail.gmail.com>
Subject: Re: [PATCH v4 35/41] target/riscv: Make riscv_cpu_tlb_fill sysemu only
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::130;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x130.google.com
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
X-List-Received-Date: Wed, 06 Oct 2021 21:37:30 -0000

On Thu, Oct 7, 2021 at 4:12 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The fallback code in cpu_loop_exit_sigsegv is sufficient
> for riscv linux-user.
>
> Remove the code from cpu_loop that raised SIGSEGV.
>
> Cc: qemu-riscv@nongnu.org
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  linux-user/riscv/cpu_loop.c |  7 -------
>  target/riscv/cpu.c          |  2 +-
>  target/riscv/cpu_helper.c   | 21 +--------------------
>  3 files changed, 2 insertions(+), 28 deletions(-)
>
> diff --git a/linux-user/riscv/cpu_loop.c b/linux-user/riscv/cpu_loop.c
> index 9859a366e4..aef019b1c8 100644
> --- a/linux-user/riscv/cpu_loop.c
> +++ b/linux-user/riscv/cpu_loop.c
> @@ -87,13 +87,6 @@ void cpu_loop(CPURISCVState *env)
>              sigcode =3D TARGET_TRAP_BRKPT;
>              sigaddr =3D env->pc;
>              break;
> -        case RISCV_EXCP_INST_PAGE_FAULT:
> -        case RISCV_EXCP_LOAD_PAGE_FAULT:
> -        case RISCV_EXCP_STORE_PAGE_FAULT:
> -            signum =3D TARGET_SIGSEGV;
> -            sigcode =3D TARGET_SEGV_MAPERR;
> -            sigaddr =3D env->badaddr;
> -            break;
>          case RISCV_EXCP_SEMIHOST:
>              env->gpr[xA0] =3D do_common_semihosting(cs);
>              env->pc +=3D 4;
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 7c626d89cd..0292a72feb 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -675,9 +675,9 @@ static const struct SysemuCPUOps riscv_sysemu_ops =3D=
 {
>  static const struct TCGCPUOps riscv_tcg_ops =3D {
>      .initialize =3D riscv_translate_init,
>      .synchronize_from_tb =3D riscv_cpu_synchronize_from_tb,
> -    .tlb_fill =3D riscv_cpu_tlb_fill,
>
>  #ifndef CONFIG_USER_ONLY
> +    .tlb_fill =3D riscv_cpu_tlb_fill,
>      .cpu_exec_interrupt =3D riscv_cpu_exec_interrupt,
>      .do_interrupt =3D riscv_cpu_do_interrupt,
>      .do_transaction_failed =3D riscv_cpu_do_transaction_failed,
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index d41d5cd27c..b520d6fc78 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -748,7 +748,6 @@ void riscv_cpu_do_unaligned_access(CPUState *cs, vadd=
r addr,
>                              riscv_cpu_two_stage_lookup(mmu_idx);
>      riscv_raise_exception(env, cs->exception_index, retaddr);
>  }
> -#endif /* !CONFIG_USER_ONLY */
>
>  bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>                          MMUAccessType access_type, int mmu_idx,
> @@ -756,7 +755,6 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, =
int size,
>  {
>      RISCVCPU *cpu =3D RISCV_CPU(cs);
>      CPURISCVState *env =3D &cpu->env;
> -#ifndef CONFIG_USER_ONLY
>      vaddr im_address;
>      hwaddr pa =3D 0;
>      int prot, prot2, prot_pmp;
> @@ -888,25 +886,8 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address,=
 int size,
>      }
>
>      return true;
> -
> -#else
> -    switch (access_type) {
> -    case MMU_INST_FETCH:
> -        cs->exception_index =3D RISCV_EXCP_INST_PAGE_FAULT;
> -        break;
> -    case MMU_DATA_LOAD:
> -        cs->exception_index =3D RISCV_EXCP_LOAD_PAGE_FAULT;
> -        break;
> -    case MMU_DATA_STORE:
> -        cs->exception_index =3D RISCV_EXCP_STORE_PAGE_FAULT;
> -        break;
> -    default:
> -        g_assert_not_reached();
> -    }
> -    env->badaddr =3D address;
> -    cpu_loop_exit_restore(cs, retaddr);
> -#endif
>  }
> +#endif /* !CONFIG_USER_ONLY */
>
>  /*
>   * Handle Traps
> --
> 2.25.1
>
>

