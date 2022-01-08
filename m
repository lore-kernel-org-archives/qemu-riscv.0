Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n6ARj-0004Eb-3l
	for mharc-qemu-riscv@gnu.org; Sat, 08 Jan 2022 07:03:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n6ARh-0004Du-CJ
 for qemu-riscv@nongnu.org; Sat, 08 Jan 2022 07:03:41 -0500
Received: from [2a00:1450:4864:20::433] (port=41859
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n6ARf-0007I7-KW
 for qemu-riscv@nongnu.org; Sat, 08 Jan 2022 07:03:41 -0500
Received: by mail-wr1-x433.google.com with SMTP id v6so16337763wra.8
 for <qemu-riscv@nongnu.org>; Sat, 08 Jan 2022 04:03:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=yfFxu4v90Fx6fZByVpAAQEDN0ofHbBjHbVnibUy2pbI=;
 b=OOJmpzThN8feJea1+ERhebIyYvQcFEeShH2HGfJVSVkeRUDJpmttREhLSASkTrt3v7
 2XtOfxaW8KAOThIBvHyGIY2KQrY7WvUzBIuff7hro5qO3tMrU/BvXFk62cumy8ED/eDh
 b3YS+mbX2X+2WdiM94pPA7fPt4IphfpYetAM7L3goI915caKcpshAEfwnc1XlbBiMgy/
 CQKadA2HrR7RbF+G9Zr91/MFtdsIP9lklXg9yt0DYIHV9K07oI6ChoM2ScDx4LXpeMti
 Qmhm7+b1NKIn4TMc+AyKd+TcrYbled9+iRplVAKXxvg0vw+rOzSYpEW93sarYfLaRWbO
 Azew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=yfFxu4v90Fx6fZByVpAAQEDN0ofHbBjHbVnibUy2pbI=;
 b=nmb3pkM7YCC/j5pXHbw2sY71FUjuyc6DevCV0Q1KbJZ15JWcC/0R67X8jQqDdv5UyE
 VlGRMHwJOTBnhFIwrr0rBKqHJkoszPnQXtbeZFxAIt7miwoV9kf1nAi4cwUPCFJQJSAU
 MHaZURF0GmmOutlBr2UlxiGZ6oVEk/8VtPfH+TtDtZmrfartamQaBAEh54zzr3+OOi4r
 DmJYgNEkiRQz3+n+EzI2HBATiC9id28+lqbHKG0SlQnqa/bpg1/bK2Yh5/aLh7NPv/ql
 5et5SZGcWFV0Aezk/DGGb0XnWSReNB9Mc7l8AEg7eDPVWQLBAJV95AfugfOcV7fvsziP
 q0+g==
X-Gm-Message-State: AOAM5303u2Lt/EfYv0oZjRPfA90Zo57i1zhKMVqo27szbaGp/5VFJD7k
 jT+F8sAxbh25Ye0qPNGog2cQTD5aw4OmF5f7N0xo/A==
X-Google-Smtp-Source: ABdhPJwKFcKdlFMIb8suqfkkGG+TJJvgjiz3OCLbiDeNOs0WK1MU7a1eUT3nsDxK1bs6IQdcVlEwrAh0bqtNPIjE9xw=
X-Received: by 2002:adf:e38e:: with SMTP id e14mr2117445wrm.313.1641643418036; 
 Sat, 08 Jan 2022 04:03:38 -0800 (PST)
MIME-Version: 1.0
References: <20211230123539.52786-1-anup@brainfault.org>
 <20211230123539.52786-16-anup@brainfault.org>
 <CANzO1D3jRnEV6X_=WpFfSFNx3O5XwJWkzBcLMTkpy_Lu0yRAvw@mail.gmail.com>
In-Reply-To: <CANzO1D3jRnEV6X_=WpFfSFNx3O5XwJWkzBcLMTkpy_Lu0yRAvw@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 8 Jan 2022 17:33:26 +0530
Message-ID: <CAAhSdy0LbSAL8+mqz2kh-qRoFXtQn5rvuaij_FMwBZ6wVstb8w@mail.gmail.com>
Subject: Re: [PATCH v6 15/23] target/riscv: Implement AIA IMSIC interface CSRs
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
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::433;
 envelope-from=anup@brainfault.org; helo=mail-wr1-x433.google.com
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
X-List-Received-Date: Sat, 08 Jan 2022 12:03:41 -0000

On Wed, Jan 5, 2022 at 9:01 AM Frank Chang <frank.chang@sifive.com> wrote:
>
> Anup Patel <anup@brainfault.org> =E6=96=BC 2021=E5=B9=B412=E6=9C=8830=E6=
=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=888:53=E5=AF=AB=E9=81=93=EF=BC=9A
>>
>> From: Anup Patel <anup.patel@wdc.com>
>>
>> The AIA specification defines IMSIC interface CSRs for easy access
>> to the per-HART IMSIC registers without using indirect xiselect and
>> xireg CSRs. This patch implements the AIA IMSIC interface CSRs.
>>
>> Signed-off-by: Anup Patel <anup.patel@wdc.com>
>> Signed-off-by: Anup Patel <anup@brainfault.org>
>> ---
>>  target/riscv/csr.c | 202 +++++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 202 insertions(+)
>>
>> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
>> index 488877e89c..89e74f848d 100644
>> --- a/target/riscv/csr.c
>> +++ b/target/riscv/csr.c
>> @@ -906,6 +906,16 @@ static int aia_xlate_vs_csrno(CPURISCVState *env, i=
nt csrno)
>>          return CSR_VSISELECT;
>>      case CSR_SIREG:
>>          return CSR_VSIREG;
>> +    case CSR_SSETEIPNUM:
>> +        return CSR_VSSETEIPNUM;
>> +    case CSR_SCLREIPNUM:
>> +        return CSR_VSCLREIPNUM;
>> +    case CSR_SSETEIENUM:
>> +        return CSR_VSSETEIENUM;
>> +    case CSR_SCLREIENUM:
>> +        return CSR_VSCLREIENUM;
>> +    case CSR_STOPEI:
>> +        return CSR_VSTOPEI;
>>      default:
>>          return csrno;
>>      };
>> @@ -1058,6 +1068,177 @@ done:
>>      return RISCV_EXCP_NONE;
>>  }
>>
>> +static int rmw_xsetclreinum(CPURISCVState *env, int csrno, target_ulong=
 *val,
>> +                            target_ulong new_val, target_ulong wr_mask)
>> +{
>> +    int ret =3D -EINVAL;
>> +    bool set, pend, virt;
>> +    target_ulong priv, isel, vgein, xlen, nval, wmask;
>> +
>> +    /* Translate CSR number for VS-mode */
>> +    csrno =3D aia_xlate_vs_csrno(env, csrno);
>> +
>> +    /* Decode register details from CSR number */
>> +    virt =3D set =3D pend =3D false;
>> +    switch (csrno) {
>> +    case CSR_MSETEIPNUM:
>> +        priv =3D PRV_M;
>> +        set =3D true;
>
>
> Missing: pend =3D true; here?

Ahh, good catch. I will fix this in the next revision.

Thanks,
Anup

>
> Frank Chang
>
>>
>> +        break;
>> +    case CSR_MCLREIPNUM:
>> +        priv =3D PRV_M;
>> +        pend =3D true;
>> +        break;
>> +    case CSR_MSETEIENUM:
>> +        priv =3D PRV_M;
>> +        set =3D true;
>> +        break;
>> +    case CSR_MCLREIENUM:
>> +        priv =3D PRV_M;
>> +        break;
>> +    case CSR_SSETEIPNUM:
>> +        priv =3D PRV_S;
>> +        set =3D true;
>> +        pend =3D true;
>> +        break;
>> +    case CSR_SCLREIPNUM:
>> +        priv =3D PRV_S;
>> +        pend =3D true;
>> +        break;
>> +    case CSR_SSETEIENUM:
>> +        priv =3D PRV_S;
>> +        set =3D true;
>> +        break;
>> +    case CSR_SCLREIENUM:
>> +        priv =3D PRV_S;
>> +        break;
>> +    case CSR_VSSETEIPNUM:
>> +        priv =3D PRV_S;
>> +        virt =3D true;
>> +        set =3D true;
>> +        pend =3D true;
>> +        break;
>> +    case CSR_VSCLREIPNUM:
>> +        priv =3D PRV_S;
>> +        virt =3D true;
>> +        pend =3D true;
>> +        break;
>> +    case CSR_VSSETEIENUM:
>> +        priv =3D PRV_S;
>> +        virt =3D true;
>> +        set =3D true;
>> +        break;
>> +    case CSR_VSCLREIENUM:
>> +        priv =3D PRV_S;
>> +        virt =3D true;
>> +        break;
>> +    default:
>> +         goto done;
>> +    };
>> +
>> +    /* IMSIC CSRs only available when machine implements IMSIC. */
>> +    if (!env->aia_ireg_rmw_fn[priv]) {
>> +        goto done;
>> +    }
>> +
>> +    /* Find the selected guest interrupt file */
>> +    vgein =3D (virt) ? get_field(env->hstatus, HSTATUS_VGEIN) : 0;
>> +
>> +    /* Selected guest interrupt file should be valid */
>> +    if (virt && (!vgein || env->geilen < vgein)) {
>> +        goto done;
>> +    }
>> +
>> +    /* Set/Clear CSRs always read zero */
>> +    if (val) {
>> +        *val =3D 0;
>> +    }
>> +
>> +    if (wr_mask) {
>> +        /* Get interrupt number */
>> +        new_val &=3D wr_mask;
>> +
>> +        /* Find target interrupt pending/enable register */
>> +        xlen =3D riscv_cpu_mxl_bits(env);
>> +        isel =3D (new_val / xlen);
>> +        isel *=3D (xlen / IMSIC_EIPx_BITS);
>> +        isel +=3D (pend) ? ISELECT_IMSIC_EIP0 : ISELECT_IMSIC_EIE0;
>> +
>> +        /* Find the interrupt bit to be set/clear */
>> +        wmask =3D ((target_ulong)1) << (new_val % xlen);
>> +        nval =3D (set) ? wmask : 0;
>> +
>> +        /* Call machine specific IMSIC register emulation */
>> +        ret =3D env->aia_ireg_rmw_fn[priv](env->aia_ireg_rmw_fn_arg[pri=
v],
>> +                                         AIA_MAKE_IREG(isel, priv, virt=
,
>> +                                                       vgein, xlen),
>> +                                         NULL, nval, wmask);
>> +    } else {
>> +        ret =3D 0;
>> +    }
>> +
>> +done:
>> +    if (ret) {
>> +        return (riscv_cpu_virt_enabled(env) && virt) ?
>> +               RISCV_EXCP_VIRT_INSTRUCTION_FAULT : RISCV_EXCP_ILLEGAL_I=
NST;
>> +    }
>> +    return RISCV_EXCP_NONE;
>> +}
>> +
>> +static int rmw_xtopei(CPURISCVState *env, int csrno, target_ulong *val,
>> +                      target_ulong new_val, target_ulong wr_mask)
>> +{
>> +    bool virt;
>> +    int ret =3D -EINVAL;
>> +    target_ulong priv, vgein;
>> +
>> +    /* Translate CSR number for VS-mode */
>> +    csrno =3D aia_xlate_vs_csrno(env, csrno);
>> +
>> +    /* Decode register details from CSR number */
>> +    virt =3D false;
>> +    switch (csrno) {
>> +    case CSR_MTOPEI:
>> +        priv =3D PRV_M;
>> +        break;
>> +    case CSR_STOPEI:
>> +        priv =3D PRV_S;
>> +        break;
>> +    case CSR_VSTOPEI:
>> +        priv =3D PRV_S;
>> +        virt =3D true;
>> +        break;
>> +    default:
>> +        goto done;
>> +    };
>> +
>> +    /* IMSIC CSRs only available when machine implements IMSIC. */
>> +    if (!env->aia_ireg_rmw_fn[priv]) {
>> +        goto done;
>> +    }
>> +
>> +    /* Find the selected guest interrupt file */
>> +    vgein =3D (virt) ? get_field(env->hstatus, HSTATUS_VGEIN) : 0;
>> +
>> +    /* Selected guest interrupt file should be valid */
>> +    if (virt && (!vgein || env->geilen < vgein)) {
>> +        goto done;
>> +    }
>> +
>> +    /* Call machine specific IMSIC register emulation for TOPEI */
>> +    ret =3D env->aia_ireg_rmw_fn[priv](env->aia_ireg_rmw_fn_arg[priv],
>> +                    AIA_MAKE_IREG(ISELECT_IMSIC_TOPEI, priv, virt, vgei=
n,
>> +                                  riscv_cpu_mxl_bits(env)),
>> +                    val, new_val, wr_mask);
>> +
>> +done:
>> +    if (ret) {
>> +        return (riscv_cpu_virt_enabled(env) && virt) ?
>> +               RISCV_EXCP_VIRT_INSTRUCTION_FAULT : RISCV_EXCP_ILLEGAL_I=
NST;
>> +    }
>> +    return RISCV_EXCP_NONE;
>> +}
>> +
>>  static RISCVException read_mtvec(CPURISCVState *env, int csrno,
>>                                   target_ulong *val)
>>  {
>> @@ -2706,6 +2887,13 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D =
{
>>      /* Machine-Level Interrupts (AIA) */
>>      [CSR_MTOPI]    =3D { "mtopi",    aia_any,   read_mtopi },
>>
>> +    /* Machine-Level IMSIC Interface (AIA) */
>> +    [CSR_MSETEIPNUM] =3D { "mseteipnum", aia_any, NULL, NULL, rmw_xsetc=
lreinum },
>> +    [CSR_MCLREIPNUM] =3D { "mclreipnum", aia_any, NULL, NULL, rmw_xsetc=
lreinum },
>> +    [CSR_MSETEIENUM] =3D { "mseteienum", aia_any, NULL, NULL, rmw_xsetc=
lreinum },
>> +    [CSR_MCLREIENUM] =3D { "mclreienum", aia_any, NULL, NULL, rmw_xsetc=
lreinum },
>> +    [CSR_MTOPEI]     =3D { "mtopei",     aia_any, NULL, NULL, rmw_xtope=
i },
>> +
>>      /* Virtual Interrupts for Supervisor Level (AIA) */
>>      [CSR_MVIEN]      =3D { "mvien", aia_any, read_zero, write_ignore },
>>      [CSR_MVIP]       =3D { "mvip",  aia_any, read_zero, write_ignore },
>> @@ -2740,6 +2928,13 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D =
{
>>      /* Supervisor-Level Interrupts (AIA) */
>>      [CSR_STOPI]      =3D { "stopi",      aia_smode, read_stopi },
>>
>> +    /* Supervisor-Level IMSIC Interface (AIA) */
>> +    [CSR_SSETEIPNUM] =3D { "sseteipnum", aia_smode, NULL, NULL, rmw_xse=
tclreinum },
>> +    [CSR_SCLREIPNUM] =3D { "sclreipnum", aia_smode, NULL, NULL, rmw_xse=
tclreinum },
>> +    [CSR_SSETEIENUM] =3D { "sseteienum", aia_smode, NULL, NULL, rmw_xse=
tclreinum },
>> +    [CSR_SCLREIENUM] =3D { "sclreienum", aia_smode, NULL, NULL, rmw_xse=
tclreinum },
>> +    [CSR_STOPEI]     =3D { "stopei",     aia_smode, NULL, NULL, rmw_xto=
pei },
>> +
>>      /* Supervisor-Level High-Half CSRs (AIA) */
>>      [CSR_SIEH]       =3D { "sieh",   aia_smode32, NULL, NULL, rmw_sieh =
},
>>      [CSR_SIPH]       =3D { "siph",   aia_smode32, NULL, NULL, rmw_siph =
},
>> @@ -2785,6 +2980,13 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D =
{
>>      /* VS-Level Interrupts (H-extension with AIA) */
>>      [CSR_VSTOPI]      =3D { "vstopi",      aia_hmode, read_vstopi },
>>
>> +    /* VS-Level IMSIC Interface (H-extension with AIA) */
>> +    [CSR_VSSETEIPNUM] =3D { "vsseteipnum", aia_hmode, NULL, NULL, rmw_x=
setclreinum },
>> +    [CSR_VSCLREIPNUM] =3D { "vsclreipnum", aia_hmode, NULL, NULL, rmw_x=
setclreinum },
>> +    [CSR_VSSETEIENUM] =3D { "vsseteienum", aia_hmode, NULL, NULL, rmw_x=
setclreinum },
>> +    [CSR_VSCLREIENUM] =3D { "vsclreienum", aia_hmode, NULL, NULL, rmw_x=
setclreinum },
>> +    [CSR_VSTOPEI]     =3D { "vstopei",     aia_hmode, NULL, NULL, rmw_x=
topei },
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

