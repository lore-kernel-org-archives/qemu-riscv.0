Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pmQcy-0006ag-8q
	for mharc-qemu-riscv@gnu.org; Tue, 11 Apr 2023 22:54:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pmQcs-0006Yn-Sb; Tue, 11 Apr 2023 22:54:26 -0400
Received: from mail-vs1-xe2a.google.com ([2607:f8b0:4864:20::e2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pmQcq-0003VH-Ny; Tue, 11 Apr 2023 22:54:26 -0400
Received: by mail-vs1-xe2a.google.com with SMTP id b17so9304360vsj.7;
 Tue, 11 Apr 2023 19:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681268063; x=1683860063;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Lom4CntLc48U0/P8ePsDOLx5/IvQ4kCEgYBdDIQ7USU=;
 b=FXlbq8TvnO+YMnkg6mO0NhobI6S8eISdtFUHlCYgfRziCxhd4EsE5FrZ4KybR79rEd
 LuO/PL7T1eCjpz7L/vOgaTlzKWoAsYHmR8VwhRqymV/dclMtNgnObJNrdNn6nAAaRCTI
 Hhr8cgBBqOPEihsjZ/gA/YEc2jTAQ80K8oUH2WPKldYDGyhDpG0eTdffxP5ywGE/xdVJ
 REqo3ogy6trO8nkQW4+lLoa6V3Mk6jH/ETsknKmov1EhA4qFegrGWvlENO79s3Tgiwfm
 b2t0RWf/80ovz1a4SuSj/vCHDElPSAdCcaQpqL5GEwbinrysIA6AZcyOS/yWMTkHIU8L
 7i0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681268063; x=1683860063;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Lom4CntLc48U0/P8ePsDOLx5/IvQ4kCEgYBdDIQ7USU=;
 b=W7KljgejT7CaOlMmMAoi8ScIh15GFen12MBNirtbJFMRX5J9PfxoZ5oXrjh5Yw5T96
 0P+eeUmOC8oKSOqUY2pDNTJdtCATXB6Zj7PWAU1cqZCr+feQgroz8kHRkbYC4akLU6tX
 rISUhpYgTa5WfxUIamwWkIFxF8VD8Ti8BDXn8PBbGJFly3YRhd1h5LbUE/+EwZYHKTwO
 ADsVUxY7XqAd1iyeyCg93pa39RtT54XD0uncxMaL0aqQc8LJyMTVsLQubHDgoVFASjm+
 3rgwcBB0ec56leX7koE3UrcE6uI+YJjYbxhFbY+/MHc2cqJ05zbTbkAyVyVwa+Z5yRqB
 Oibw==
X-Gm-Message-State: AAQBX9eDEMrO9q0cDbckXHrVyaWF+LB3kO3H9T7VLTp5KGW7GQgN1eZa
 ekHcgir0pIHwmXhVVnDdE20Aw0ne6yJAWlT2LDY=
X-Google-Smtp-Source: AKy350bkBW0jO5ZNJicDxf/vdLsD7AXXG6DE/yO+5EBuGKsvRjqHVsp6pCyApONlkK/jIyIeMEvPQhRYYo3EZm3Yhps=
X-Received: by 2002:a67:d60f:0:b0:42c:8f72:623d with SMTP id
 n15-20020a67d60f000000b0042c8f72623dmr813415vsj.3.1681268063217; Tue, 11 Apr
 2023 19:54:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230406101559.39632-1-chenyi2000@zju.edu.cn>
In-Reply-To: <20230406101559.39632-1-chenyi2000@zju.edu.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 12 Apr 2023 12:53:57 +1000
Message-ID: <CAKmqyKMdmmFhP15vMDipyJcv7DmOow4u9aYtcN4Ru6aw=0pFCw@mail.gmail.com>
Subject: Re: [PATCH v5] target/riscv: fix H extension TVM trap
To: Yi Chen <chenyi2000@zju.edu.cn>
Cc: qemu-devel@nongnu.org, Weiwei Li <liweiwei@iscas.ac.cn>, 
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2a;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2a.google.com
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
X-List-Received-Date: Wed, 12 Apr 2023 02:54:27 -0000

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

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

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

