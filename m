Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o6hGe-0003SJ-6x
	for mharc-qemu-riscv@gnu.org; Wed, 29 Jun 2022 19:38:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1o6hGc-0003Ou-Et; Wed, 29 Jun 2022 19:38:42 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:38671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1o6hGa-00088U-AR; Wed, 29 Jun 2022 19:38:42 -0400
Received: by mail-pl1-x630.google.com with SMTP id m14so15508198plg.5;
 Wed, 29 Jun 2022 16:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WL5YzLGxB7WoB09Z/70FNm1qYiHGE3GxG4YOyBICXIc=;
 b=QwkpBWJdVixZ9bYmwEwkWXXsW6DLWU6A3lFlTqSCwkRwBNBARidxG4MP9eaTZCOqey
 MszY6pn9e6glSaXAdFh/mQF8z7bv5fVhU+dIdJ+syMikm3SxA1emDSyZjyXGBvhayj5b
 HazX1yYsxINulLkVct3c/3bmEuvCOXKw2aQqgjjFOITa0CIjwEHdiHB2xpfxkwhS/++M
 le438Qz2a0NbquhqMW0519b+5X5Ytbm/rtfI65b8SBMLGd+1N7VOm77tw0S0Cb7SacCy
 x27oJFBVutm33VUWnA5A1pPDpWkGvf2XNIbEYOImI/hvYWi5YobaDiPi4ZBcNDgVZ5kS
 QITw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WL5YzLGxB7WoB09Z/70FNm1qYiHGE3GxG4YOyBICXIc=;
 b=gsV61NpTEZ5Zs43+eTWJc3qshu6H5WczigQ7qvatcTXIn9qwBzaiyhdGFphy1Kl0sx
 Wj+6MtRads+/raZsHH/aQ5OFE10DFB/13ndsuC7V+ovqkEXyNyr8uDYw3ixCTokNyhbk
 jRZhRELzv3Ju3CBQEh8SoU6Q8Qi5PrTApwX7Zwpya2FJMuXRWPEcvMQKRH5WoRAIAdpy
 ufDnznyOcKfq9syvxZZm4k2Nr+iEAmI/pPB204huI1yMOSzGsMANXk1emF8oCBehAnp/
 DhY1NK17kwrrJHEwHpbIFAzJTaI7K+BbACKJdXG5+IfGDc0nzSAYP7q5+bzLHBnKqdei
 kWoQ==
X-Gm-Message-State: AJIora9BLh/WA1u8GPCGlJqH/gH9YQ5blBe8UDBs8roRcTxbCBjy90Bj
 4gdwHjddYM3dr1esVZ1Hv4R8zDsITyRgQSiw38gfQnLDwk1nOA==
X-Google-Smtp-Source: AGRyM1sV7ITnotlrPJdJYftnofjmDHcGWeRZhIv9TLjdZe7XBfUC4S1wjQAa/5wLhuvZ/7tB60Vz5PvdO5aoHCIItR8=
X-Received: by 2002:a17:90b:218:b0:1ef:1440:ebe1 with SMTP id
 fy24-20020a17090b021800b001ef1440ebe1mr8425354pjb.166.1656545918510; Wed, 29
 Jun 2022 16:38:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220616031543.953776-1-apatel@ventanamicro.com>
 <20220616031543.953776-2-apatel@ventanamicro.com>
In-Reply-To: <20220616031543.953776-2-apatel@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 30 Jun 2022 09:38:11 +1000
Message-ID: <CAKmqyKOGnZLzUFu4CCnhivzS6dDMzW8je5f3kb0UgYN27FTHHw@mail.gmail.com>
Subject: Re: [PATCH 1/2] target/riscv: Remove CSRs that set/clear an IMSIC
 interrupt file bits
To: Anup Patel <apatel@ventanamicro.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=alistair23@gmail.com; helo=mail-pl1-x630.google.com
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
X-List-Received-Date: Wed, 29 Jun 2022 23:38:42 -0000

On Thu, Jun 16, 2022 at 1:18 PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> Based on architecture review committee feedback, the [m|s|vs]seteienum,
> [m|s|vs]clreienum, [m|s|vs]seteipnum, and [m|s|vs]clreipnum CSRs are
> removed in the latest AIA draft v0.3.0 specification.
> (Refer, https://github.com/riscv/riscv-aia/releases/tag/0.3.0-draft.31)
>
> These CSRs were mostly for software convenience and software can always
> use [m|s|vs]iselect and [m|s|vs]ireg CSRs to update the IMSIC interrupt
> file bits.
>
> We update the IMSIC CSR emulation as-per above to match the latest AIA
> draft specification.
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu_bits.h |  24 +------
>  target/riscv/csr.c      | 150 +---------------------------------------
>  2 files changed, 6 insertions(+), 168 deletions(-)
>
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index 4a55c6a709..01608f86e5 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -177,14 +177,8 @@
>  #define CSR_MIREG           0x351
>
>  /* Machine-Level Interrupts (AIA) */
> -#define CSR_MTOPI           0xfb0
> -
> -/* Machine-Level IMSIC Interface (AIA) */
> -#define CSR_MSETEIPNUM      0x358
> -#define CSR_MCLREIPNUM      0x359
> -#define CSR_MSETEIENUM      0x35a
> -#define CSR_MCLREIENUM      0x35b
>  #define CSR_MTOPEI          0x35c
> +#define CSR_MTOPI           0xfb0
>
>  /* Virtual Interrupts for Supervisor Level (AIA) */
>  #define CSR_MVIEN           0x308
> @@ -224,14 +218,8 @@
>  #define CSR_SIREG           0x151
>
>  /* Supervisor-Level Interrupts (AIA) */
> -#define CSR_STOPI           0xdb0
> -
> -/* Supervisor-Level IMSIC Interface (AIA) */
> -#define CSR_SSETEIPNUM      0x158
> -#define CSR_SCLREIPNUM      0x159
> -#define CSR_SSETEIENUM      0x15a
> -#define CSR_SCLREIENUM      0x15b
>  #define CSR_STOPEI          0x15c
> +#define CSR_STOPI           0xdb0
>
>  /* Supervisor-Level High-Half CSRs (AIA) */
>  #define CSR_SIEH            0x114
> @@ -282,14 +270,8 @@
>  #define CSR_VSIREG          0x251
>
>  /* VS-Level Interrupts (H-extension with AIA) */
> -#define CSR_VSTOPI          0xeb0
> -
> -/* VS-Level IMSIC Interface (H-extension with AIA) */
> -#define CSR_VSSETEIPNUM     0x258
> -#define CSR_VSCLREIPNUM     0x259
> -#define CSR_VSSETEIENUM     0x25a
> -#define CSR_VSCLREIENUM     0x25b
>  #define CSR_VSTOPEI         0x25c
> +#define CSR_VSTOPI          0xeb0
>
>  /* Hypervisor and VS-Level High-Half CSRs (H-extension with AIA) */
>  #define CSR_HIDELEGH        0x613
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 409a209f14..a4890ebc70 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -1040,14 +1040,6 @@ static int aia_xlate_vs_csrno(CPURISCVState *env, int csrno)
>          return CSR_VSISELECT;
>      case CSR_SIREG:
>          return CSR_VSIREG;
> -    case CSR_SSETEIPNUM:
> -        return CSR_VSSETEIPNUM;
> -    case CSR_SCLREIPNUM:
> -        return CSR_VSCLREIPNUM;
> -    case CSR_SSETEIENUM:
> -        return CSR_VSSETEIENUM;
> -    case CSR_SCLREIENUM:
> -        return CSR_VSCLREIENUM;
>      case CSR_STOPEI:
>          return CSR_VSTOPEI;
>      default:
> @@ -1202,124 +1194,6 @@ done:
>      return RISCV_EXCP_NONE;
>  }
>
> -static int rmw_xsetclreinum(CPURISCVState *env, int csrno, target_ulong *val,
> -                            target_ulong new_val, target_ulong wr_mask)
> -{
> -    int ret = -EINVAL;
> -    bool set, pend, virt;
> -    target_ulong priv, isel, vgein, xlen, nval, wmask;
> -
> -    /* Translate CSR number for VS-mode */
> -    csrno = aia_xlate_vs_csrno(env, csrno);
> -
> -    /* Decode register details from CSR number */
> -    virt = set = pend = false;
> -    switch (csrno) {
> -    case CSR_MSETEIPNUM:
> -        priv = PRV_M;
> -        set = true;
> -        pend = true;
> -        break;
> -    case CSR_MCLREIPNUM:
> -        priv = PRV_M;
> -        pend = true;
> -        break;
> -    case CSR_MSETEIENUM:
> -        priv = PRV_M;
> -        set = true;
> -        break;
> -    case CSR_MCLREIENUM:
> -        priv = PRV_M;
> -        break;
> -    case CSR_SSETEIPNUM:
> -        priv = PRV_S;
> -        set = true;
> -        pend = true;
> -        break;
> -    case CSR_SCLREIPNUM:
> -        priv = PRV_S;
> -        pend = true;
> -        break;
> -    case CSR_SSETEIENUM:
> -        priv = PRV_S;
> -        set = true;
> -        break;
> -    case CSR_SCLREIENUM:
> -        priv = PRV_S;
> -        break;
> -    case CSR_VSSETEIPNUM:
> -        priv = PRV_S;
> -        virt = true;
> -        set = true;
> -        pend = true;
> -        break;
> -    case CSR_VSCLREIPNUM:
> -        priv = PRV_S;
> -        virt = true;
> -        pend = true;
> -        break;
> -    case CSR_VSSETEIENUM:
> -        priv = PRV_S;
> -        virt = true;
> -        set = true;
> -        break;
> -    case CSR_VSCLREIENUM:
> -        priv = PRV_S;
> -        virt = true;
> -        break;
> -    default:
> -         goto done;
> -    };
> -
> -    /* IMSIC CSRs only available when machine implements IMSIC. */
> -    if (!env->aia_ireg_rmw_fn[priv]) {
> -        goto done;
> -    }
> -
> -    /* Find the selected guest interrupt file */
> -    vgein = (virt) ? get_field(env->hstatus, HSTATUS_VGEIN) : 0;
> -
> -    /* Selected guest interrupt file should be valid */
> -    if (virt && (!vgein || env->geilen < vgein)) {
> -        goto done;
> -    }
> -
> -    /* Set/Clear CSRs always read zero */
> -    if (val) {
> -        *val = 0;
> -    }
> -
> -    if (wr_mask) {
> -        /* Get interrupt number */
> -        new_val &= wr_mask;
> -
> -        /* Find target interrupt pending/enable register */
> -        xlen = riscv_cpu_mxl_bits(env);
> -        isel = (new_val / xlen);
> -        isel *= (xlen / IMSIC_EIPx_BITS);
> -        isel += (pend) ? ISELECT_IMSIC_EIP0 : ISELECT_IMSIC_EIE0;
> -
> -        /* Find the interrupt bit to be set/clear */
> -        wmask = ((target_ulong)1) << (new_val % xlen);
> -        nval = (set) ? wmask : 0;
> -
> -        /* Call machine specific IMSIC register emulation */
> -        ret = env->aia_ireg_rmw_fn[priv](env->aia_ireg_rmw_fn_arg[priv],
> -                                         AIA_MAKE_IREG(isel, priv, virt,
> -                                                       vgein, xlen),
> -                                         NULL, nval, wmask);
> -    } else {
> -        ret = 0;
> -    }
> -
> -done:
> -    if (ret) {
> -        return (riscv_cpu_virt_enabled(env) && virt) ?
> -               RISCV_EXCP_VIRT_INSTRUCTION_FAULT : RISCV_EXCP_ILLEGAL_INST;
> -    }
> -    return RISCV_EXCP_NONE;
> -}
> -
>  static int rmw_xtopei(CPURISCVState *env, int csrno, target_ulong *val,
>                        target_ulong new_val, target_ulong wr_mask)
>  {
> @@ -3409,14 +3283,8 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>      [CSR_MIREG]    = { "mireg",    aia_any,   NULL, NULL,    rmw_xireg },
>
>      /* Machine-Level Interrupts (AIA) */
> -    [CSR_MTOPI]    = { "mtopi",    aia_any,   read_mtopi },
> -
> -    /* Machine-Level IMSIC Interface (AIA) */
> -    [CSR_MSETEIPNUM] = { "mseteipnum", aia_any, NULL, NULL, rmw_xsetclreinum },
> -    [CSR_MCLREIPNUM] = { "mclreipnum", aia_any, NULL, NULL, rmw_xsetclreinum },
> -    [CSR_MSETEIENUM] = { "mseteienum", aia_any, NULL, NULL, rmw_xsetclreinum },
> -    [CSR_MCLREIENUM] = { "mclreienum", aia_any, NULL, NULL, rmw_xsetclreinum },
>      [CSR_MTOPEI]     = { "mtopei",     aia_any, NULL, NULL, rmw_xtopei },
> +    [CSR_MTOPI]    = { "mtopi",    aia_any,   read_mtopi },
>
>      /* Virtual Interrupts for Supervisor Level (AIA) */
>      [CSR_MVIEN]      = { "mvien", aia_any, read_zero, write_ignore },
> @@ -3464,14 +3332,8 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>      [CSR_SIREG]      = { "sireg",      aia_smode, NULL, NULL, rmw_xireg },
>
>      /* Supervisor-Level Interrupts (AIA) */
> -    [CSR_STOPI]      = { "stopi",      aia_smode, read_stopi },
> -
> -    /* Supervisor-Level IMSIC Interface (AIA) */
> -    [CSR_SSETEIPNUM] = { "sseteipnum", aia_smode, NULL, NULL, rmw_xsetclreinum },
> -    [CSR_SCLREIPNUM] = { "sclreipnum", aia_smode, NULL, NULL, rmw_xsetclreinum },
> -    [CSR_SSETEIENUM] = { "sseteienum", aia_smode, NULL, NULL, rmw_xsetclreinum },
> -    [CSR_SCLREIENUM] = { "sclreienum", aia_smode, NULL, NULL, rmw_xsetclreinum },
>      [CSR_STOPEI]     = { "stopei",     aia_smode, NULL, NULL, rmw_xtopei },
> +    [CSR_STOPI]      = { "stopi",      aia_smode, read_stopi },
>
>      /* Supervisor-Level High-Half CSRs (AIA) */
>      [CSR_SIEH]       = { "sieh",   aia_smode32, NULL, NULL, rmw_sieh },
> @@ -3543,14 +3405,8 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>      [CSR_VSIREG]      = { "vsireg",      aia_hmode, NULL, NULL,      rmw_xireg },
>
>      /* VS-Level Interrupts (H-extension with AIA) */
> -    [CSR_VSTOPI]      = { "vstopi",      aia_hmode, read_vstopi },
> -
> -    /* VS-Level IMSIC Interface (H-extension with AIA) */
> -    [CSR_VSSETEIPNUM] = { "vsseteipnum", aia_hmode, NULL, NULL, rmw_xsetclreinum },
> -    [CSR_VSCLREIPNUM] = { "vsclreipnum", aia_hmode, NULL, NULL, rmw_xsetclreinum },
> -    [CSR_VSSETEIENUM] = { "vsseteienum", aia_hmode, NULL, NULL, rmw_xsetclreinum },
> -    [CSR_VSCLREIENUM] = { "vsclreienum", aia_hmode, NULL, NULL, rmw_xsetclreinum },
>      [CSR_VSTOPEI]     = { "vstopei",     aia_hmode, NULL, NULL, rmw_xtopei },
> +    [CSR_VSTOPI]      = { "vstopi",      aia_hmode, read_vstopi },
>
>      /* Hypervisor and VS-Level High-Half CSRs (H-extension with AIA) */
>      [CSR_HIDELEGH]    = { "hidelegh",    aia_hmode32, NULL, NULL, rmw_hidelegh },
> --
> 2.34.1
>
>

