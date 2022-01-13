Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n7xem-0003jK-0Q
	for mharc-qemu-riscv@gnu.org; Thu, 13 Jan 2022 05:48:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n7xec-0003gw-P4
 for qemu-riscv@nongnu.org; Thu, 13 Jan 2022 05:48:27 -0500
Received: from [2a00:1450:4864:20::435] (port=43722
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n7xeZ-0002un-Q9
 for qemu-riscv@nongnu.org; Thu, 13 Jan 2022 05:48:25 -0500
Received: by mail-wr1-x435.google.com with SMTP id o3so9271517wrh.10
 for <qemu-riscv@nongnu.org>; Thu, 13 Jan 2022 02:48:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+qVBKBr1cN556tnjLs+glnx/gJfdkJKpFnnpE+Olvtc=;
 b=yPoCSv/P3xAHNoTCs+NndAGMc06eCtZGf99YnB9zGB+tQvIowFAnV1a+Qo56f9FyIJ
 gcN7hx+cjW2IgX4rDkJiMEdBu7/f/NUqICy+zunuQu8G9PIJ+6N7zkElFkQfYlYuGgj3
 podZAJbt9dfaOu9+aEXXW0vQekhAcJc4NGRqby+bDDXq/KW7cTd8IlflwUBnr5yHk4FA
 smIplLhed909/ZdsHobvEp+8xvbq0wB3ujhbBiodzTnL+gtck90fbz2gFu2XyceaddIm
 0L1QCYg+qDOBkdlKlcacNS9/iO28FVcM2OsctrrnHuJkn14qoRcu3hkVEjCIKtznsCDZ
 PmfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+qVBKBr1cN556tnjLs+glnx/gJfdkJKpFnnpE+Olvtc=;
 b=M9HOSIYUWkGneOKjSqHfWUWfo/yB2CMZUG3SigzNheVcl3Tl6pK+4YrWOCaBcpsPlu
 bzvUON3RTUkG3/q7xUDunkNX/gC29zhE7mjX2Fi3Tk6r4qt5tdWlCePWeqA4o0t7jv9K
 mnsKPf/30bWnLsMvZ/HPC7a9MNfbklxp3r/6uMyW3acub6LeYPOVG/BjxkUfkG8r+Qeg
 bUuh/dyrMXmXjOtR8NpUEFubjP9xQUu/kVqJgobh96rU2QTYOV8r/Ef3zJLfHuSK9WTe
 3XNdt+FxBdUL43WB38ZGuDbUeyA691FuOz4q1Q7sJg+zvGT3G3ZafK28OttxkFNEUpkp
 Kyfg==
X-Gm-Message-State: AOAM530/G8kPdvz8DsykWITckNGtSHySdBI2SQzSdDTzGq5QGFEcaPtW
 rv05S9Tn248rLgesqqVs2U5Naqr7meLkvhC3HSRnQQ==
X-Google-Smtp-Source: ABdhPJyLaXhFsrU/l7/5XZnXVvKB4LGnzETSYvqrHNe9yIzdTxmtYzekt5KaRf6GaJKwquWGgqnbUsx1FNy2vDpyMyM=
X-Received: by 2002:a5d:64e2:: with SMTP id g2mr3507956wri.690.1642070901697; 
 Thu, 13 Jan 2022 02:48:21 -0800 (PST)
MIME-Version: 1.0
References: <20211230123539.52786-1-anup@brainfault.org>
 <20211230123539.52786-14-anup@brainfault.org>
 <CANzO1D2vuO6RRafcPy6AhjOgoRk4LE3M8iAnXvdMrYXaWVTQUA@mail.gmail.com>
In-Reply-To: <CANzO1D2vuO6RRafcPy6AhjOgoRk4LE3M8iAnXvdMrYXaWVTQUA@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 13 Jan 2022 16:18:09 +0530
Message-ID: <CAAhSdy2gfP4mJ_bOxM=j4--qWDkPKgk9Ge8zHu6pGixyAUZcJg@mail.gmail.com>
Subject: Re: [PATCH v6 13/23] target/riscv: Implement AIA mtopi, stopi, and
 vstopi CSRs
To: Frank Chang <frank.chang@sifive.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bin Meng <bmeng.cn@gmail.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Atish Patra <atishp@atishpatra.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::435;
 envelope-from=anup@brainfault.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Thu, 13 Jan 2022 10:48:29 -0000

On Wed, Jan 12, 2022 at 5:46 PM Frank Chang <frank.chang@sifive.com> wrote:
>
> Anup Patel <anup@brainfault.org> =E6=96=BC 2021=E5=B9=B412=E6=9C=8830=E6=
=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=888:47=E5=AF=AB=E9=81=93=EF=BC=9A
>>
>> From: Anup Patel <anup.patel@wdc.com>
>>
>> The AIA specification introduces new [m|s|vs]topi CSRs for
>> reporting pending local IRQ number and associated IRQ priority.
>>
>> Signed-off-by: Anup Patel <anup.patel@wdc.com>
>> Signed-off-by: Anup Patel <anup@brainfault.org>
>> ---
>>  target/riscv/csr.c | 156 +++++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 156 insertions(+)
>>
>> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
>> index 55e747fbf7..5a27c3bfbb 100644
>> --- a/target/riscv/csr.c
>> +++ b/target/riscv/csr.c
>> @@ -190,6 +190,15 @@ static int smode32(CPURISCVState *env, int csrno)
>>      return smode(env, csrno);
>>  }
>>
>> +static int aia_smode(CPURISCVState *env, int csrno)
>> +{
>> +    if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
>> +        return RISCV_EXCP_ILLEGAL_INST;
>> +    }
>> +
>> +    return smode(env, csrno);
>> +}
>> +
>>  static int aia_smode32(CPURISCVState *env, int csrno)
>>  {
>>      if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
>> @@ -502,6 +511,8 @@ static RISCVException read_timeh(CPURISCVState *env,=
 int csrno,
>>  #define VS_MODE_INTERRUPTS ((uint64_t)(MIP_VSSIP | MIP_VSTIP | MIP_VSEI=
P))
>>  #define HS_MODE_INTERRUPTS ((uint64_t)(MIP_SGEIP | VS_MODE_INTERRUPTS))
>>
>> +#define VSTOPI_NUM_SRCS 5
>
>
> Nit:
> VSTOPI_NUM_SRCS can be reduced to 2 as AIA spec says:
>   The list of candidate interrupts can be reduced to two finalists relati=
vely.
> But it's fine to keep it to 5 if you think it has better readability.

Let's keep is 5 for now. This is little high to ensure that
we don't run out space in the candidate array.

Regards,
Anup

>
>>
>> +
>>  static const uint64_t delegable_ints =3D S_MODE_INTERRUPTS |
>>                                             VS_MODE_INTERRUPTS;
>>  static const uint64_t vs_delegable_ints =3D VS_MODE_INTERRUPTS;
>> @@ -862,6 +873,28 @@ static RISCVException rmw_mieh(CPURISCVState *env, =
int csrno,
>>      return ret;
>>  }
>>
>> +static int read_mtopi(CPURISCVState *env, int csrno, target_ulong *val)
>> +{
>> +    int irq;
>> +    uint8_t iprio;
>> +
>> +    irq =3D riscv_cpu_mirq_pending(env);
>> +    if (irq <=3D 0 || irq > 63) {
>> +       *val =3D 0;
>> +    } else {
>> +       iprio =3D env->miprio[irq];
>> +       if (!iprio) {
>> +           if (riscv_cpu_default_priority(irq) > IPRIO_DEFAULT_M) {
>> +               iprio =3D IPRIO_MMAXIPRIO;
>> +           }
>> +       }
>> +       *val =3D (irq & TOPI_IID_MASK) << TOPI_IID_SHIFT;
>> +       *val |=3D iprio;
>> +    }
>> +
>> +    return RISCV_EXCP_NONE;
>> +}
>> +
>>  static RISCVException read_mtvec(CPURISCVState *env, int csrno,
>>                                   target_ulong *val)
>>  {
>> @@ -1391,6 +1424,120 @@ static RISCVException write_satp(CPURISCVState *=
env, int csrno,
>>      return RISCV_EXCP_NONE;
>>  }
>>
>> +static int read_vstopi(CPURISCVState *env, int csrno, target_ulong *val=
)
>> +{
>> +    int irq, ret;
>> +    target_ulong topei;
>> +    uint64_t vseip, vsgein;
>> +    uint32_t iid, iprio, hviid, hviprio, gein;
>> +    uint32_t s, scount =3D 0, siid[VSTOPI_NUM_SRCS], siprio[VSTOPI_NUM_=
SRCS];
>> +
>> +    gein =3D get_field(env->hstatus, HSTATUS_VGEIN);
>> +    hviid =3D get_field(env->hvictl, HVICTL_IID);
>> +    hviprio =3D get_field(env->hvictl, HVICTL_IPRIO);
>> +
>> +    if (gein) {
>> +        vsgein =3D (env->hgeip & (1ULL << gein)) ? MIP_VSEIP : 0;
>> +        vseip =3D env->mie & (env->mip | vsgein) & MIP_VSEIP;
>> +        if (gein <=3D env->geilen && vseip) {
>> +            siid[scount] =3D IRQ_S_EXT;
>> +            siprio[scount] =3D IPRIO_MMAXIPRIO + 1;
>> +            if (env->aia_ireg_rmw_fn[PRV_S]) {
>> +                /*
>> +                 * Call machine specific IMSIC register emulation for
>> +                 * reading TOPEI.
>> +                 */
>> +                ret =3D env->aia_ireg_rmw_fn[PRV_S](
>> +                        env->aia_ireg_rmw_fn_arg[PRV_S],
>> +                        AIA_MAKE_IREG(ISELECT_IMSIC_TOPEI, PRV_S, true,=
 gein,
>> +                                      riscv_cpu_mxl_bits(env)),
>> +                        &topei, 0, 0);
>> +                if (!ret && topei) {
>> +                    siprio[scount] =3D topei & IMSIC_TOPEI_IPRIO_MASK;
>> +                }
>> +            }
>> +            scount++;
>> +        }
>> +    } else {
>> +        if (hviid =3D=3D IRQ_S_EXT && hviprio) {
>> +            siid[scount] =3D IRQ_S_EXT;
>> +            siprio[scount] =3D hviprio;
>> +            scount++;
>> +        }
>> +    }
>> +
>> +    if (env->hvictl & HVICTL_VTI) {
>> +        if (hviid !=3D IRQ_S_EXT) {
>> +            siid[scount] =3D hviid;
>> +            siprio[scount] =3D hviprio;
>> +            scount++;
>> +        }
>> +    } else {
>> +        irq =3D riscv_cpu_vsirq_pending(env);
>> +        if (irq !=3D IRQ_S_EXT && 0 < irq && irq <=3D 63) {
>> +           siid[scount] =3D irq;
>> +           siprio[scount] =3D env->hviprio[irq];
>> +           scount++;
>> +        }
>> +    }
>> +
>> +    iid =3D 0;
>> +    iprio =3D UINT_MAX;
>> +    for (s =3D 0; s < scount; s++) {
>> +        if (siprio[s] < iprio) {
>> +            iid =3D siid[s];
>> +            iprio =3D siprio[s];
>> +        }
>> +    }
>> +
>> +    if (iid) {
>> +        if (env->hvictl & HVICTL_IPRIOM) {
>> +            if (iprio > IPRIO_MMAXIPRIO) {
>> +                iprio =3D IPRIO_MMAXIPRIO;
>> +            }
>> +            if (!iprio) {
>> +                if (riscv_cpu_default_priority(iid) > IPRIO_DEFAULT_S) =
{
>> +                    iprio =3D IPRIO_MMAXIPRIO;
>> +                }
>> +            }
>> +        } else {
>> +            iprio =3D 1;
>> +        }
>> +    } else {
>> +        iprio =3D 0;
>> +    }
>> +
>> +    *val =3D (iid & TOPI_IID_MASK) << TOPI_IID_SHIFT;
>> +    *val |=3D iprio;
>> +    return RISCV_EXCP_NONE;
>> +}
>> +
>> +static int read_stopi(CPURISCVState *env, int csrno, target_ulong *val)
>> +{
>> +    int irq;
>> +    uint8_t iprio;
>> +
>> +    if (riscv_cpu_virt_enabled(env)) {
>> +        return read_vstopi(env, CSR_VSTOPI, val);
>> +    }
>> +
>> +    irq =3D riscv_cpu_sirq_pending(env);
>> +    if (irq <=3D 0 || irq > 63) {
>> +       *val =3D 0;
>> +    } else {
>> +       iprio =3D env->siprio[irq];
>> +       if (!iprio) {
>> +           if (riscv_cpu_default_priority(irq) > IPRIO_DEFAULT_S) {
>> +               iprio =3D IPRIO_MMAXIPRIO;
>> +           }
>> +       }
>> +       *val =3D (irq & TOPI_IID_MASK) << TOPI_IID_SHIFT;
>> +       *val |=3D iprio;
>> +    }
>> +
>> +    return RISCV_EXCP_NONE;
>> +}
>> +
>>  /* Hypervisor Extensions */
>>  static RISCVException read_hstatus(CPURISCVState *env, int csrno,
>>                                     target_ulong *val)
>> @@ -2389,6 +2536,9 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {
>>      [CSR_MTVAL]    =3D { "mtval",    any,  read_mtval,    write_mtval  =
  },
>>      [CSR_MIP]      =3D { "mip",      any,  NULL,    NULL, rmw_mip      =
  },
>>
>> +    /* Machine-Level Interrupts (AIA) */
>> +    [CSR_MTOPI]    =3D { "mtopi",    aia_any,   read_mtopi },
>> +
>>      /* Virtual Interrupts for Supervisor Level (AIA) */
>>      [CSR_MVIEN]      =3D { "mvien", aia_any, read_zero, write_ignore },
>>      [CSR_MVIP]       =3D { "mvip",  aia_any, read_zero, write_ignore },
>> @@ -2416,6 +2566,9 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {
>>      /* Supervisor Protection and Translation */
>>      [CSR_SATP]     =3D { "satp",     smode, read_satp,    write_satp   =
   },
>>
>> +    /* Supervisor-Level Interrupts (AIA) */
>> +    [CSR_STOPI]      =3D { "stopi",      aia_smode, read_stopi },
>> +
>>      /* Supervisor-Level High-Half CSRs (AIA) */
>>      [CSR_SIEH]       =3D { "sieh",   aia_smode32, NULL, NULL, rmw_sieh =
},
>>      [CSR_SIPH]       =3D { "siph",   aia_smode32, NULL, NULL, rmw_siph =
},
>> @@ -2454,6 +2607,9 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {
>>      [CSR_HVIPRIO1]    =3D { "hviprio1",    aia_hmode, read_hviprio1,   =
write_hviprio1 },
>>      [CSR_HVIPRIO2]    =3D { "hviprio2",    aia_hmode, read_hviprio2,   =
write_hviprio2 },
>>
>> +    /* VS-Level Interrupts (H-extension with AIA) */
>> +    [CSR_VSTOPI]      =3D { "vstopi",      aia_hmode, read_vstopi },
>> +
>>      /* Hypervisor and VS-Level High-Half CSRs (H-extension with AIA) */
>>      [CSR_HIDELEGH]    =3D { "hidelegh",    aia_hmode32, NULL, NULL, rmw=
_hidelegh },
>>      [CSR_HVIENH]      =3D { "hvienh",      aia_hmode32, read_zero, writ=
e_ignore },
>> --
>> 2.25.1
>>
>>
>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>

