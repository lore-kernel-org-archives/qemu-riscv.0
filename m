Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pvnlA-00036O-Ah
	for mharc-qemu-riscv@gnu.org; Sun, 07 May 2023 19:25:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pvnl9-00036A-Ah; Sun, 07 May 2023 19:25:43 -0400
Received: from mail-vs1-xe30.google.com ([2607:f8b0:4864:20::e30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pvnl7-0008Rf-L9; Sun, 07 May 2023 19:25:43 -0400
Received: by mail-vs1-xe30.google.com with SMTP id
 ada2fe7eead31-42e371846d9so2616854137.2; 
 Sun, 07 May 2023 16:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683501940; x=1686093940;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5jwOuG3OdJTBMrR4TbhnU8IEiD53uLwJJuW8zBD9MAA=;
 b=kOOzb3RPk1XPXV3neVJ+JPl29rKk/4jpPlb37rYTNC0LMPXIPbrU05rCABOCNdUZ/5
 RfHUziS4VR/Aqr3rrU9eNTTAGHjcLqxnt5f4Zg2PuwIWR9OlErLEMXMD1f3U8itoKnnc
 zRVlh5MTQ3zQDjj1pUKDj5AoIcyHBJDBw6dmVb7DxmZO4MWvfigT4b2fDkhgR+lTsin7
 vTkm8DdDoYNqxwt8R88reumRFV8+431Zj2neeaXFc5V/6iv2C8R7moOWDfyFZppeYxNT
 vvWYQ2dEexyAzhygSJwFTdo0R0gjpuOzz70acGMGBw6NKm8NcQ242frb/ie/oOC4n8ab
 uYuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683501940; x=1686093940;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5jwOuG3OdJTBMrR4TbhnU8IEiD53uLwJJuW8zBD9MAA=;
 b=KrXnZNlLwYNHSCj8YcdQmyHBqDJKbQTuIbawcesZHCXKi6oGNTNtQTkN/ti1MtrDRr
 09JRpWmi0HoADtDPjpZmXn8bnmaPRiq20FmJ1tGGnGn2HVC3zUoiA6IPKf/Ps0RJD2jF
 u9L0ZWGvv8msOi4zjlRJe1Yq3dQycRfRi5u3Swx4lEN+8BP5hySmdjNen1dCOuCPa/XT
 BhBZhEkoSC8eOMTfiFa9aGSIJtg80SK7AiJocluL0X7TC6PySMBGAIXbm/8dNZ+GJpXM
 J+kwwyTAoOJxh8VAzTin9Rj2V0NKLHfZefvfPZpfce0jbS6GOUj8dI76g8ASU9OnqhbS
 SBow==
X-Gm-Message-State: AC+VfDx8XL7o51JZhhJvy4+VsqPqq5z4k1Xbqi25rZUJ1YxvnXfYfmp4
 b3PgZ7aEyxhz2MadN/tAim9H+tE9FwnEoVfdJtg=
X-Google-Smtp-Source: ACHHUZ7DNcqSrCmxz0dkOEl1SUeTY+w5WrtxEVQLoRthAkfJhq61dWXdlbEIifTBx4HuRnYWAteIMAWjHqIPqmlkRYI=
X-Received: by 2002:a05:6102:112:b0:42e:5077:759e with SMTP id
 z18-20020a056102011200b0042e5077759emr2594340vsq.13.1683501940165; Sun, 07
 May 2023 16:25:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230421132727.121462-1-dbarboza@ventanamicro.com>
 <20230421132727.121462-12-dbarboza@ventanamicro.com>
In-Reply-To: <20230421132727.121462-12-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 8 May 2023 09:25:14 +1000
Message-ID: <CAKmqyKPcEvWXb7m4uRxBJoVzNmjoX-Oo=H+GNO_c4PY0HOJNpQ@mail.gmail.com>
Subject: Re: [PATCH v8 11/11] target/riscv: rework write_misa()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e30;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe30.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sun, 07 May 2023 23:25:43 -0000

On Fri, Apr 21, 2023 at 11:29=E2=80=AFPM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> write_misa() must use as much common logic as possible. We want to open
> code just the bits that are exclusive to the CSR write operation and TCG
> internals.
>
> Our validation is done with riscv_cpu_validate_set_extensions(), but we
> need a small tweak first. When enabling RVG we're doing:
>
>         env->misa_ext |=3D RVI | RVM | RVA | RVF | RVD;
>         env->misa_ext_mask =3D env->misa_ext;
>
> This works fine for realize() time but this can potentially overwrite
> env->misa_ext_mask if we reutilize the function for write_misa().
>
> Instead of doing misa_ext_mask =3D misa_ext, sum up the RVG extensions in
> misa_ext_mask as well. This won't change realize() time behavior
> (misa_ext_mask will be =3D=3D misa_ext) and will ensure that write_misa()
> won't change misa_ext_mask by accident.
>
> After that, rewrite write_misa() to work as follows:
>
> - mask the write using misa_ext_mask to avoid enabling unsupported
>   extensions;
>
> - suppress RVC if the next insn isn't aligned;
>
> - disable RVG if any of RVG dependencies are being disabled by the user;
>
> - assign env->misa_ext and run riscv_cpu_validate_set_extensions(). On
>   error, rollback env->misa_ext to its original value;
>
> - handle RVF and MSTATUS_FS and continue as usual.
>
> Let's keep write_misa() as experimental for now until this logic gains
> enough mileage.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
> ---
>  target/riscv/cpu.c |  4 ++--
>  target/riscv/cpu.h |  1 +
>  target/riscv/csr.c | 47 ++++++++++++++++++++--------------------------
>  3 files changed, 23 insertions(+), 29 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 7d407321aa..4fa720a39d 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -944,7 +944,7 @@ static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu=
, Error **errp)
>   * Check consistency between chosen extensions while setting
>   * cpu->cfg accordingly.
>   */
> -static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **err=
p)
> +void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
>  {
>      CPURISCVState *env =3D &cpu->env;
>      Error *local_err =3D NULL;
> @@ -960,7 +960,7 @@ static void riscv_cpu_validate_set_extensions(RISCVCP=
U *cpu, Error **errp)
>          cpu->cfg.ext_ifencei =3D true;
>
>          env->misa_ext |=3D RVI | RVM | RVA | RVF | RVD;
> -        env->misa_ext_mask =3D env->misa_ext;
> +        env->misa_ext_mask |=3D RVI | RVM | RVA | RVF | RVD;
>      }
>
>      if (riscv_has_ext(env, RVI) && riscv_has_ext(env, RVE)) {
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 15423585d0..1f39edc687 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -548,6 +548,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, =
int size,
>                          bool probe, uintptr_t retaddr);
>  char *riscv_isa_string(RISCVCPU *cpu);
>  void riscv_cpu_list(void);
> +void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp);
>
>  #define cpu_list riscv_cpu_list
>  #define cpu_mmu_index riscv_cpu_mmu_index
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 4451bd1263..4a3c57ea6f 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -1387,39 +1387,18 @@ static RISCVException read_misa(CPURISCVState *en=
v, int csrno,
>  static RISCVException write_misa(CPURISCVState *env, int csrno,
>                                   target_ulong val)
>  {
> +    RISCVCPU *cpu =3D env_archcpu(env);
> +    uint32_t orig_misa_ext =3D env->misa_ext;
> +    Error *local_err =3D NULL;
> +
>      if (!riscv_cpu_cfg(env)->misa_w) {
>          /* drop write to misa */
>          return RISCV_EXCP_NONE;
>      }
>
> -    /* 'I' or 'E' must be present */
> -    if (!(val & (RVI | RVE))) {
> -        /* It is not, drop write to misa */
> -        return RISCV_EXCP_NONE;
> -    }
> -
> -    /* 'E' excludes all other extensions */
> -    if (val & RVE) {
> -        /*
> -         * when we support 'E' we can do "val =3D RVE;" however
> -         * for now we just drop writes if 'E' is present.
> -         */
> -        return RISCV_EXCP_NONE;
> -    }
> -
> -    /*
> -     * misa.MXL writes are not supported by QEMU.
> -     * Drop writes to those bits.
> -     */
> -
>      /* Mask extensions that are not supported by this hart */
>      val &=3D env->misa_ext_mask;
>
> -    /* 'D' depends on 'F', so clear 'D' if 'F' is not present */
> -    if ((val & RVD) && !(val & RVF)) {
> -        val &=3D ~RVD;
> -    }
> -
>      /*
>       * Suppress 'C' if next instruction is not aligned
>       * TODO: this should check next_pc
> @@ -1428,18 +1407,32 @@ static RISCVException write_misa(CPURISCVState *e=
nv, int csrno,
>          val &=3D ~RVC;
>      }
>
> +    /* Disable RVG if any of its dependencies are disabled */
> +    if (!(val & RVI && val & RVM && val & RVA &&
> +          val & RVF && val & RVD)) {
> +        val &=3D ~RVG;
> +    }
> +
>      /* If nothing changed, do nothing. */
>      if (val =3D=3D env->misa_ext) {
>          return RISCV_EXCP_NONE;
>      }
>
> -    if (!(val & RVF)) {
> +    env->misa_ext =3D val;
> +    riscv_cpu_validate_set_extensions(cpu, &local_err);
> +    if (local_err !=3D NULL) {
> +        /* Rollback on validation error */
> +        env->misa_ext =3D orig_misa_ext;

I don't think this is right though. The spec even states:

" An attempt to write an unsupported combination causes those bits to
be set to some supported combination."

So we should try to follow what the guest requested as closely as we
can, instead of just rolling back.

Alistair

> +
> +        return RISCV_EXCP_NONE;
> +    }
> +
> +    if (!(env->misa_ext & RVF)) {
>          env->mstatus &=3D ~MSTATUS_FS;
>      }
>
>      /* flush translation cache */
>      tb_flush(env_cpu(env));
> -    env->misa_ext =3D val;
>      env->xl =3D riscv_cpu_mxl(env);
>      return RISCV_EXCP_NONE;
>  }
> --
> 2.40.0
>
>

