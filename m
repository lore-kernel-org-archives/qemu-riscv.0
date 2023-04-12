Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pmQsb-0002Or-Nc
	for mharc-qemu-riscv@gnu.org; Tue, 11 Apr 2023 23:10:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pmQsa-0002OQ-IQ; Tue, 11 Apr 2023 23:10:40 -0400
Received: from mail-ua1-x930.google.com ([2607:f8b0:4864:20::930])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pmQsY-0006bm-K1; Tue, 11 Apr 2023 23:10:40 -0400
Received: by mail-ua1-x930.google.com with SMTP id t20so20024231uaw.5;
 Tue, 11 Apr 2023 20:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681269037; x=1683861037;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v3Twu/tshg9IMk0DWkRfGeoXgx14siLOjGEMghA+soE=;
 b=llwLuco9vUxKViV4xmLwPfJIxjXPVDog9esfuweCzOkdPaxjM+AEIl2+veTXx1JctS
 bD6CXVBj3oQo4W3rHADute9gPSU6WW9QD6MwFO+o5QdWpd2QAgOmoek24/VoX7Diwryh
 ZmJYrNOoyaJRKjm9VGdfMRRFoVDaS19qnT7ThiGZRzqCI7f5bkg6EUeOhlFF++ahSdlV
 bhpAFcCdrFlUYErgwvxce7Z0PyNWyH5zEyqY+mptpdPl41YiVmS6yEGHwkXefWSVfrNd
 hO7VD33Tp1UWwZlLZV/OzJvNEBA8MMxQYJqU7/N/3ZaL9die8mfuJ+JZK+qH55vYfUcw
 Tfwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681269037; x=1683861037;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v3Twu/tshg9IMk0DWkRfGeoXgx14siLOjGEMghA+soE=;
 b=lTOM2QFj/i8qOGLXi+pocaW9DegRNAVRYcK4YEEAnmiSJangO4Thl61EJuq1+vXMps
 j5UPjzpGRsyx7ZVCB/twNOVNXmbhn2hyQoUoU7zXD8RV4QhmYc0IotbPCrPada6Iv/H7
 IsIyt5cpwqLtcjI6PLu/A280Dffc/FwHz8zqT/W1T+WM1KzOksGDU2CDsu1LGpukb93O
 ZUuiZVHT+E9FPaoUNETAjMxBdIfZo/kRfSIxyY1rBEhDVu8KDdV8vbOYAIWD68m8STvR
 2u+JFA94dgmVn9WsvQ6FHgzvhcaBMDGpyVZtaNls4xleAnsYM9DLh6/ig/ePdZ/o8D2m
 ifig==
X-Gm-Message-State: AAQBX9fkvBKuzhnf6+dxHlxYIq6LG4LLgCenhN3GTJCs+jcKX8SiWXG+
 xzsW0fJh2mpc1smQ1+iAIquF6VGdfQpFpMlpqSvtruAoX+Q/Jg==
X-Google-Smtp-Source: AKy350ZeuEoco25EzwIZmOyEDYX0HkztMXP3Pz9c36u4Dha68pv+v3J5gbSGYn64vHhltzdQnaep2xC68aw04UPgEVM=
X-Received: by 2002:a1f:2489:0:b0:43b:ff63:e79a with SMTP id
 k131-20020a1f2489000000b0043bff63e79amr2806130vkk.0.1681269036789; Tue, 11
 Apr 2023 20:10:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230406101559.39632-1-chenyi2000@zju.edu.cn>
In-Reply-To: <20230406101559.39632-1-chenyi2000@zju.edu.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 12 Apr 2023 13:10:10 +1000
Message-ID: <CAKmqyKMrzSUUPoNaaOcQx=GeZ0k0KL-yQ1FNjH6f40GnVxsYtw@mail.gmail.com>
Subject: Re: [PATCH v5] target/riscv: fix H extension TVM trap
To: Yi Chen <chenyi2000@zju.edu.cn>
Cc: qemu-devel@nongnu.org, Weiwei Li <liweiwei@iscas.ac.cn>, 
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::930;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x930.google.com
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
X-List-Received-Date: Wed, 12 Apr 2023 03:10:41 -0000

On Thu, Apr 6, 2023 at 8:17=E2=80=AFPM Yi Chen <chenyi2000@zju.edu.cn> wrot=
e:
>
> - Trap satp/hgatp accesses from HS-mode when MSTATUS.TVM is enabled.
> - Trap satp accesses from VS-mode when HSTATUS.VTVM is enabled.
> - Raise RISCV_EXCP_ILLEGAL_INST when U-mode executes SFENCE.VMA/SINVAL.VM=
A.
> - Raise RISCV_EXCP_VIRT_INSTRUCTION_FAULT when VU-mode executes
>   SFENCE.VMA/SINVAL.VMA or VS-mode executes SFENCE.VMA/SINVAL.VMA with
>   HSTATUS.VTVM enabled.
> - Raise RISCV_EXCP_VIRT_INSTRUCTION_FAULT when VU-mode executes
>   HFENCE.GVMA/HFENCE.VVMA/HINVAL.GVMA/HINVAL.VVMA.
>
> Signed-off-by: Yi Chen <chenyi2000@zju.edu.cn>
> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
> Rebase the patch on https://github.com/alistair23/qemu/tree/riscv-to-appl=
y.next
> Add "Reviewed-by: LIU Zhiwei"
>  target/riscv/csr.c       | 56 +++++++++++++++++++++++++---------------
>  target/riscv/op_helper.c | 12 ++++-----
>  2 files changed, 41 insertions(+), 27 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index e0b871f6dc..d6669d8524 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -449,6 +449,30 @@ static RISCVException sstc_32(CPURISCVState *env, in=
t csrno)
>      return sstc(env, csrno);
>  }
>
> +static RISCVException satp(CPURISCVState *env, int csrno)
> +{
> +    if (env->priv =3D=3D PRV_S && !env->virt_enabled &&
> +        get_field(env->mstatus, MSTATUS_TVM)) {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }
> +    if (env->priv =3D=3D PRV_S && env->virt_enabled &&
> +        get_field(env->hstatus, HSTATUS_VTVM)) {
> +        return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> +    }
> +
> +    return smode(env, csrno);
> +}
> +
> +static RISCVException hgatp(CPURISCVState *env, int csrno)
> +{
> +    if (env->priv =3D=3D PRV_S && !env->virt_enabled &&
> +        get_field(env->mstatus, MSTATUS_TVM)) {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }
> +
> +    return hmode(env, csrno);
> +}
> +
>  /* Checks if PointerMasking registers could be accessed */
>  static RISCVException pointer_masking(CPURISCVState *env, int csrno)
>  {
> @@ -2647,13 +2671,7 @@ static RISCVException read_satp(CPURISCVState *env=
, int csrno,
>          *val =3D 0;
>          return RISCV_EXCP_NONE;
>      }
> -
> -    if (env->priv =3D=3D PRV_S && get_field(env->mstatus, MSTATUS_TVM)) =
{
> -        return RISCV_EXCP_ILLEGAL_INST;
> -    } else {
> -        *val =3D env->satp;
> -    }
> -
> +    *val =3D env->satp;
>      return RISCV_EXCP_NONE;
>  }
>
> @@ -2676,18 +2694,14 @@ static RISCVException write_satp(CPURISCVState *e=
nv, int csrno,
>      }
>
>      if (vm && mask) {
> -        if (env->priv =3D=3D PRV_S && get_field(env->mstatus, MSTATUS_TV=
M)) {
> -            return RISCV_EXCP_ILLEGAL_INST;
> -        } else {
> -            /*
> -             * The ISA defines SATP.MODE=3DBare as "no translation", but=
 we still
> -             * pass these through QEMU's TLB emulation as it improves
> -             * performance.  Flushing the TLB on SATP writes with paging
> -             * enabled avoids leaking those invalid cached mappings.
> -             */
> -            tlb_flush(env_cpu(env));
> -            env->satp =3D val;
> -        }
> +        /*
> +         * The ISA defines SATP.MODE=3DBare as "no translation", but we =
still
> +         * pass these through QEMU's TLB emulation as it improves
> +         * performance.  Flushing the TLB on SATP writes with paging
> +         * enabled avoids leaking those invalid cached mappings.
> +         */
> +        tlb_flush(env_cpu(env));
> +        env->satp =3D val;
>      }
>      return RISCV_EXCP_NONE;
>  }
> @@ -4183,7 +4197,7 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {
>                           .min_priv_ver =3D PRIV_VERSION_1_12_0 },
>
>      /* Supervisor Protection and Translation */
> -    [CSR_SATP]     =3D { "satp",     smode, read_satp,     write_satp   =
  },
> +    [CSR_SATP]     =3D { "satp",     satp, read_satp,     write_satp    =
 },
>
>      /* Supervisor-Level Window to Indirectly Accessed Registers (AIA) */
>      [CSR_SISELECT]   =3D { "siselect",   aia_smode, NULL, NULL, rmw_xise=
lect },
> @@ -4220,7 +4234,7 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {
>                            .min_priv_ver =3D PRIV_VERSION_1_12_0         =
       },
>      [CSR_HGEIP]       =3D { "hgeip",       hmode,   read_hgeip,
>                            .min_priv_ver =3D PRIV_VERSION_1_12_0         =
       },
> -    [CSR_HGATP]       =3D { "hgatp",       hmode,   read_hgatp,   write_=
hgatp,
> +    [CSR_HGATP]       =3D { "hgatp",       hgatp,   read_hgatp,   write_=
hgatp,
>                            .min_priv_ver =3D PRIV_VERSION_1_12_0         =
       },
>      [CSR_HTIMEDELTA]  =3D { "htimedelta",  hmode,   read_htimedelta,
>                            write_htimedelta,
> diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
> index ec9a384772..7cbe13db3f 100644
> --- a/target/riscv/op_helper.c
> +++ b/target/riscv/op_helper.c
> @@ -380,12 +380,12 @@ void helper_wfi(CPURISCVState *env)
>  void helper_tlb_flush(CPURISCVState *env)
>  {
>      CPUState *cs =3D env_cpu(env);
> -    if (!(env->priv >=3D PRV_S) ||
> -        (env->priv =3D=3D PRV_S &&
> -         get_field(env->mstatus, MSTATUS_TVM))) {
> +    if (!env->virt_enabled &&
> +        (env->priv =3D=3D PRV_U ||
> +         (env->priv =3D=3D PRV_S && get_field(env->mstatus, MSTATUS_TVM)=
))) {
>          riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
> -    } else if (riscv_has_ext(env, RVH) && env->virt_enabled &&
> -               get_field(env->hstatus, HSTATUS_VTVM)) {
> +    } else if (env->virt_enabled &&
> +               (env->priv =3D=3D PRV_U || get_field(env->hstatus, HSTATU=
S_VTVM))) {
>          riscv_raise_exception(env, RISCV_EXCP_VIRT_INSTRUCTION_FAULT, GE=
TPC());
>      } else {
>          tlb_flush(cs);
> @@ -402,7 +402,7 @@ void helper_hyp_tlb_flush(CPURISCVState *env)
>  {
>      CPUState *cs =3D env_cpu(env);
>
> -    if (env->priv =3D=3D PRV_S && env->virt_enabled) {
> +    if (env->virt_enabled) {
>          riscv_raise_exception(env, RISCV_EXCP_VIRT_INSTRUCTION_FAULT, GE=
TPC());
>      }
>
> --
> 2.40.0
>
>

