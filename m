Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mQJL0-0003sL-26
	for mharc-qemu-riscv@gnu.org; Tue, 14 Sep 2021 21:03:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mQJKz-0003qg-0Z; Tue, 14 Sep 2021 21:03:45 -0400
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34]:37461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mQJKx-0003wM-63; Tue, 14 Sep 2021 21:03:44 -0400
Received: by mail-io1-xd34.google.com with SMTP id b7so1285645iob.4;
 Tue, 14 Sep 2021 18:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=q+vMTfUyumI+7C5pQOZGeDJc/bIjz3tcg6i6wI9pUXU=;
 b=Gl1NzGhRVaFFsx2+rN9CaM95JjMsYqe3jHiYNMng6tl4ptrfkWApH0nQPtLRFoBcr5
 oTaR7FfpbadG2XUk+jRn1LsDHo9hHU1uJhZJLzfGyxyh3MIKhXxKrK3cS7GzvL1B0hLf
 KmupiwflqmEx5Gpdhv+Ld4lxgBRoF+Jz1LrwL2/ZtOK5GgSp1LgzAo3cEOJYPVvybbzw
 QtGEUeDiOjdGGJq7c2P1yrrA2voLOiFBla7F0DqVscbCNipdwuhyzV5IIjm8ylQH9Viw
 i2DGcvDo92NIeG9XA1zTavyVZQOijrechtG5KU1oR/lMpyuD2Ixjz+uGEfRnGZpflw5r
 WHMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=q+vMTfUyumI+7C5pQOZGeDJc/bIjz3tcg6i6wI9pUXU=;
 b=ojbde7IISQcPuqS5J7zNRrHesBGTBoR5NTgEx2yX+mt50ACPObC5k5PfcH1uDUatBV
 1VF/+1RkT820Rv+42hZm6tFb4Xo1itixzsqYn513q/zS5G3Gzn1393CnChlxx10q1YU9
 SHbEjPa9RcAaJhTStRTs8iO1W2C/Zf0xevPYLtYtlbwaOPvefUIWQmFtI6xePBXadysN
 kx7ie2fuF0zkNivBH+hG0Lr3CojrLEBOOhafZYTyx0g2XNPcgMm+QsLx/W+Qc8foeCbW
 K9l/byF1g9DpCRvfy+JtFRit868P75SW/QEZamK8x9w52qCKFLWQOf8B9LGBHR8EoSat
 JChQ==
X-Gm-Message-State: AOAM532Roc6LGteifQ9GTsl3tO0aVlYk9VR2imycF71BQD2m9o1WKlz7
 2ResGfdm+JkzQaTNsA9IqdJe31oDvWZ2eRuWTzA=
X-Google-Smtp-Source: ABdhPJw8mtHU26pTL/j2bktj3Tdj2/C0ox1cAS3Cb480KNGHVLP5Th98r19M0STfO6AZ507lVfoxcoOafPGZvDbEtZA=
X-Received: by 2002:a6b:ce17:: with SMTP id p23mr16112629iob.90.1631667821389; 
 Tue, 14 Sep 2021 18:03:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210902112520.475901-1-anup.patel@wdc.com>
 <20210902112520.475901-3-anup.patel@wdc.com>
In-Reply-To: <20210902112520.475901-3-anup.patel@wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 15 Sep 2021 11:03:14 +1000
Message-ID: <CAKmqyKOgK62+AQtg4eoFck40Fq8DkFDr2JWXCOX21x4UBTgyLQ@mail.gmail.com>
Subject: Re: [PATCH v2 02/22] target/riscv: Implement SGEIP bit in hip and hie
 CSRs
To: Anup Patel <anup.patel@wdc.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Atish Patra <atish.patra@wdc.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Anup Patel <anup@brainfault.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d34;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd34.google.com
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
X-List-Received-Date: Wed, 15 Sep 2021 01:03:45 -0000

On Thu, Sep 2, 2021 at 9:40 PM Anup Patel <anup.patel@wdc.com> wrote:
>
> A hypervsior can optionally take guest external interrupts using
> SGEIP bit of hip and hie CSRs.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c      |  3 ++-
>  target/riscv/cpu_bits.h |  3 +++
>  target/riscv/csr.c      | 18 +++++++++++-------
>  3 files changed, 16 insertions(+), 8 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index dc1353b858..9d97fbe3d9 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -368,6 +368,7 @@ static void riscv_cpu_reset(DeviceState *dev)
>      env->priv = PRV_M;
>      env->mstatus &= ~(MSTATUS_MIE | MSTATUS_MPRV);
>      env->mcause = 0;
> +    env->miclaim = MIP_SGEIP;
>      env->pc = env->resetvec;
>      env->two_stage_lookup = false;
>  #endif
> @@ -600,7 +601,7 @@ static void riscv_cpu_init(Object *obj)
>      cpu_set_cpustate_pointers(cpu);
>
>  #ifndef CONFIG_USER_ONLY
> -    qdev_init_gpio_in(DEVICE(cpu), riscv_cpu_set_irq, 12);
> +    qdev_init_gpio_in(DEVICE(cpu), riscv_cpu_set_irq, IRQ_LOCAL_MAX);
>  #endif /* CONFIG_USER_ONLY */
>  }
>
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index 7330ff5a19..17ede1d4a9 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -504,6 +504,8 @@ typedef enum RISCVException {
>  #define IRQ_S_EXT                          9
>  #define IRQ_VS_EXT                         10
>  #define IRQ_M_EXT                          11
> +#define IRQ_S_GEXT                         12
> +#define IRQ_LOCAL_MAX                      13
>
>  /* mip masks */
>  #define MIP_USIP                           (1 << IRQ_U_SOFT)
> @@ -518,6 +520,7 @@ typedef enum RISCVException {
>  #define MIP_SEIP                           (1 << IRQ_S_EXT)
>  #define MIP_VSEIP                          (1 << IRQ_VS_EXT)
>  #define MIP_MEIP                           (1 << IRQ_M_EXT)
> +#define MIP_SGEIP                          (1 << IRQ_S_GEXT)
>
>  /* sip masks */
>  #define SIP_SSIP                           MIP_SSIP
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 1f13d1042d..bc25c79e39 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -408,12 +408,13 @@ static RISCVException read_timeh(CPURISCVState *env, int csrno,
>  #define M_MODE_INTERRUPTS  (MIP_MSIP | MIP_MTIP | MIP_MEIP)
>  #define S_MODE_INTERRUPTS  (MIP_SSIP | MIP_STIP | MIP_SEIP)
>  #define VS_MODE_INTERRUPTS (MIP_VSSIP | MIP_VSTIP | MIP_VSEIP)
> +#define HS_MODE_INTERRUPTS (MIP_SGEIP | VS_MODE_INTERRUPTS)
>
>  static const target_ulong delegable_ints = S_MODE_INTERRUPTS |
>                                             VS_MODE_INTERRUPTS;
>  static const target_ulong vs_delegable_ints = VS_MODE_INTERRUPTS;
>  static const target_ulong all_ints = M_MODE_INTERRUPTS | S_MODE_INTERRUPTS |
> -                                     VS_MODE_INTERRUPTS;
> +                                     HS_MODE_INTERRUPTS;
>  #define DELEGABLE_EXCPS ((1ULL << (RISCV_EXCP_INST_ADDR_MIS)) | \
>                           (1ULL << (RISCV_EXCP_INST_ACCESS_FAULT)) | \
>                           (1ULL << (RISCV_EXCP_ILLEGAL_INST)) | \
> @@ -644,7 +645,7 @@ static RISCVException write_mideleg(CPURISCVState *env, int csrno,
>  {
>      env->mideleg = (env->mideleg & ~delegable_ints) | (val & delegable_ints);
>      if (riscv_has_ext(env, RVH)) {
> -        env->mideleg |= VS_MODE_INTERRUPTS;
> +        env->mideleg |= HS_MODE_INTERRUPTS;
>      }
>      return RISCV_EXCP_NONE;
>  }
> @@ -660,6 +661,9 @@ static RISCVException write_mie(CPURISCVState *env, int csrno,
>                                  target_ulong val)
>  {
>      env->mie = (env->mie & ~all_ints) | (val & all_ints);
> +    if (!riscv_has_ext(env, RVH)) {
> +        env->mie &= ~MIP_SGEIP;
> +    }
>      return RISCV_EXCP_NONE;
>  }
>
> @@ -960,7 +964,7 @@ static RISCVException rmw_sip(CPURISCVState *env, int csrno,
>      }
>
>      if (ret_value) {
> -        *ret_value &= env->mideleg;
> +        *ret_value &= env->mideleg & S_MODE_INTERRUPTS;
>      }
>      return ret;
>  }
> @@ -1078,7 +1082,7 @@ static RISCVException rmw_hvip(CPURISCVState *env, int csrno,
>                        write_mask & hvip_writable_mask);
>
>      if (ret_value) {
> -        *ret_value &= hvip_writable_mask;
> +        *ret_value &= VS_MODE_INTERRUPTS;
>      }
>      return ret;
>  }
> @@ -1091,7 +1095,7 @@ static RISCVException rmw_hip(CPURISCVState *env, int csrno,
>                        write_mask & hip_writable_mask);
>
>      if (ret_value) {
> -        *ret_value &= hip_writable_mask;
> +        *ret_value &= HS_MODE_INTERRUPTS;
>      }
>      return ret;
>  }
> @@ -1099,14 +1103,14 @@ static RISCVException rmw_hip(CPURISCVState *env, int csrno,
>  static RISCVException read_hie(CPURISCVState *env, int csrno,
>                                 target_ulong *val)
>  {
> -    *val = env->mie & VS_MODE_INTERRUPTS;
> +    *val = env->mie & HS_MODE_INTERRUPTS;
>      return RISCV_EXCP_NONE;
>  }
>
>  static RISCVException write_hie(CPURISCVState *env, int csrno,
>                                  target_ulong val)
>  {
> -    target_ulong newval = (env->mie & ~VS_MODE_INTERRUPTS) | (val & VS_MODE_INTERRUPTS);
> +    target_ulong newval = (env->mie & ~HS_MODE_INTERRUPTS) | (val & HS_MODE_INTERRUPTS);
>      return write_mie(env, CSR_MIE, newval);
>  }
>
> --
> 2.25.1
>
>

