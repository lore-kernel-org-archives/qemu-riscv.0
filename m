Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkEsW-00026s-N8
	for mharc-qemu-riscv@gnu.org; Wed, 05 Apr 2023 21:57:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pkEsS-000268-Lp; Wed, 05 Apr 2023 21:57:28 -0400
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pkEsQ-0003D7-Nr; Wed, 05 Apr 2023 21:57:28 -0400
Received: by mail-vs1-xe36.google.com with SMTP id df34so33152422vsb.8;
 Wed, 05 Apr 2023 18:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680746245;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3oWW0KpuWKhpJeTU99bxxrVEloAKzF8Gz1eOnPn5cCk=;
 b=HznmwYHc21mDqLYSvHKDVGLhK114gx1WaamaBRXrSlFR+SMzgBUrVlzxqHebZGHzPB
 uK+pvF4KZkNc+7997BXzJEJJz1F9MFSVHN5xs/v4y7nLWn6Yh4MqaDJzzmF0+oqLk3IY
 LNPfMPtjSp26je89iN99yiWM+tzBTSkjci5+f/DxauW9yA+XgrfFHIzdoWZQ60pAvioy
 +vZi7KY8qniTY7MfVzMG1LqGrzeZjeKIGbgUmJsH2hH0yj69DHlJt0MPPzpSVcKWEJ4e
 8MsI0oDqsF7UqOdHDTR+Szict/uA1AOpmu/VnH1aK+cV2MqeCd6lLRIa8sEtxQoL+yc+
 Yxfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680746245;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3oWW0KpuWKhpJeTU99bxxrVEloAKzF8Gz1eOnPn5cCk=;
 b=mTwZaDWH0Kr66Aiw32Zt7aigxxeyki+lMXjr1rfZYyVS1R0rbZjh9weMuDsDmw0tx8
 iKt7ZRY72XI6QNM9aBFJWUBXJyuyWFxi/c5XJ750b+28ttT6ZRfcDrn1BdmEuy4VfmFZ
 Us50qejrb+BRFxeCbzAGERpy9JDm/8oTy8TFNIpxpEfzRY1+TfP6BKaU77fgi1o3bdXi
 LwnNGC667Iu8HjtyWftsN3i6es1HSXtk/FFMpy2JN0I6y7Ldo9xafSW7F9eprXsF0ymO
 2oYeaNfBIkcJQotNeSsvy2FoomnCxlG1NqOaDTBGXrc0BonmwPaKQuiGjeY6hVFBPYhj
 ZZ1A==
X-Gm-Message-State: AAQBX9cFIL4LThh9itfNcfENXHFzWT70rw294Xcf180kMX4F/jgr7cAC
 5157eEVLmg9gNfBWPRDTa7JVhKxpiscz6yiParY=
X-Google-Smtp-Source: AKy350YXrQCCOgAmgRTGkxCZhb3P/Z1Xs8Nzb8tDCt9VebAdOe8QhqJTs0SaU+bZbbARM3HCW2zAWFs2AvEdynVucEc=
X-Received: by 2002:a67:c181:0:b0:42a:eb6:6c51 with SMTP id
 h1-20020a67c181000000b0042a0eb66c51mr6361690vsj.3.1680746244824; Wed, 05 Apr
 2023 18:57:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230312120538.15286-1-chenyi2000@zju.edu.cn>
In-Reply-To: <20230312120538.15286-1-chenyi2000@zju.edu.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 6 Apr 2023 11:56:58 +1000
Message-ID: <CAKmqyKMC=8oKaduPE3Zt44qLfuQH9b1ckQmqFTog8QTwJB3GVA@mail.gmail.com>
Subject: Re: [PATCH v4] target/riscv: fix H extension TVM trap
To: Yi Chen <chenyi2000@zju.edu.cn>
Cc: qemu-devel@nongnu.org, Weiwei Li <liweiwei@iscas.ac.cn>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e36;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe36.google.com
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
X-List-Received-Date: Thu, 06 Apr 2023 01:57:29 -0000

On Sun, Mar 12, 2023 at 10:07=E2=80=AFPM Yi Chen <chenyi2000@zju.edu.cn> wr=
ote:
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

Thanks for the patch!

It looks like this patch needs to be rebased. Do you mind rebasing it
on https://github.com/alistair23/qemu/tree/riscv-to-apply.next and
then re-sending?

Also, when you are fixing a range of issues it's best to split the
fixes into patches that fix each individual issue (where that is
possible). This makes it easier to review but also makes it easier to
track changes and regressions if any problems arise.

In this case you don't need to split them up for a v5, but in future
it's something to keep in mind

The changes look good otherwise though :)

Alistair

>
> Signed-off-by: Yi Chen <chenyi2000@zju.edu.cn>
> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
> ---
> Add reviewed-by
> Replace "env->priv <=3D PRV_S && riscv_cpu_virt_enabled(env)" with "riscv=
_cpu_virt_enabled(env)"
>  target/riscv/csr.c       | 56 +++++++++++++++++++++++++---------------
>  target/riscv/op_helper.c | 12 ++++-----
>  2 files changed, 41 insertions(+), 27 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index d522efc0b6..26a02e57bd 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -443,6 +443,30 @@ static RISCVException sstc_32(CPURISCVState *env, in=
t csrno)
>      return sstc(env, csrno);
>  }
>
> +static RISCVException satp(CPURISCVState *env, int csrno)
> +{
> +    if (env->priv =3D=3D PRV_S && !riscv_cpu_virt_enabled(env) &&
> +        get_field(env->mstatus, MSTATUS_TVM)) {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }
> +    if (env->priv =3D=3D PRV_S && riscv_cpu_virt_enabled(env) &&
> +        get_field(env->hstatus, HSTATUS_VTVM)) {
> +        return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> +    }
> +
> +    return smode(env, csrno);
> +}
> +
> +static RISCVException hgatp(CPURISCVState *env, int csrno)
> +{
> +    if (env->priv =3D=3D PRV_S && !riscv_cpu_virt_enabled(env) &&
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
> @@ -2655,13 +2679,7 @@ static RISCVException read_satp(CPURISCVState *env=
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
> @@ -2684,18 +2702,14 @@ static RISCVException write_satp(CPURISCVState *e=
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
> @@ -4180,7 +4194,7 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {
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
> @@ -4217,7 +4231,7 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {
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
> index 84ee018f7d..8e16020f8d 100644
> --- a/target/riscv/op_helper.c
> +++ b/target/riscv/op_helper.c
> @@ -381,12 +381,12 @@ void helper_wfi(CPURISCVState *env)
>  void helper_tlb_flush(CPURISCVState *env)
>  {
>      CPUState *cs =3D env_cpu(env);
> -    if (!(env->priv >=3D PRV_S) ||
> -        (env->priv =3D=3D PRV_S &&
> -         get_field(env->mstatus, MSTATUS_TVM))) {
> +    if (!riscv_cpu_virt_enabled(env) &&
> +        (env->priv =3D=3D PRV_U ||
> +         (env->priv =3D=3D PRV_S && get_field(env->mstatus, MSTATUS_TVM)=
))) {
>          riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
> -    } else if (riscv_has_ext(env, RVH) && riscv_cpu_virt_enabled(env) &&
> -               get_field(env->hstatus, HSTATUS_VTVM)) {
> +    } else if (riscv_cpu_virt_enabled(env) &&
> +               (env->priv =3D=3D PRV_U || get_field(env->hstatus, HSTATU=
S_VTVM))) {
>          riscv_raise_exception(env, RISCV_EXCP_VIRT_INSTRUCTION_FAULT, GE=
TPC());
>      } else {
>          tlb_flush(cs);
> @@ -403,7 +403,7 @@ void helper_hyp_tlb_flush(CPURISCVState *env)
>  {
>      CPUState *cs =3D env_cpu(env);
>
> -    if (env->priv =3D=3D PRV_S && riscv_cpu_virt_enabled(env)) {
> +    if (riscv_cpu_virt_enabled(env)) {
>          riscv_raise_exception(env, RISCV_EXCP_VIRT_INSTRUCTION_FAULT, GE=
TPC());
>      }
>
> --
> 2.39.2
>
>

