Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nMc0P-0002Jo-Fv
	for mharc-qemu-riscv@gnu.org; Tue, 22 Feb 2022 15:43:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1nMc0M-0002Jd-Dn
 for qemu-riscv@nongnu.org; Tue, 22 Feb 2022 15:43:26 -0500
Received: from [2607:f8b0:4864:20::b2a] (port=46986
 helo=mail-yb1-xb2a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1nMc0K-0000sf-Ae
 for qemu-riscv@nongnu.org; Tue, 22 Feb 2022 15:43:26 -0500
Received: by mail-yb1-xb2a.google.com with SMTP id b35so16003244ybi.13
 for <qemu-riscv@nongnu.org>; Tue, 22 Feb 2022 12:43:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x6ZAofS/tQ6h9+sA/S5wrfETZJRu2LOx07C6zV7frGE=;
 b=TYRAXFM4p+tc586mgtdWgWGngoKOZLY44uZZpx/4P9U+VdrBx2ug4VDQku3lDHIBU9
 FJtdMZhH0dE14mA8RaKgNL5gZbWVF9YLfdsXqf4OrkzZOUykQMuiZ4CK8LVgikYpjFJu
 qNL9DSOX+o2TerZuI+CpYudTtAG/WdOozARwU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x6ZAofS/tQ6h9+sA/S5wrfETZJRu2LOx07C6zV7frGE=;
 b=q3oMg8HREsj8V7jbgVm2xXimmwGPxpfk0zEr5gXeKSf3zL/y7ib4gk7bPYgg+mW0RX
 m6jdFMT3xMcaNT016g9F0pEvrB6UZ/VMCuZvgdpV85hYgiKDqJijx+JmbDP8bxzre3pP
 axfyC9TVQKNqob2a9TMh8j/+8ayKZmbl3KBOmHyi5GGx5cIF2M6cEMF0z+duTWvxiPgj
 p6ZjjpXlMBjqmkIIhaAQytEUv1q5Xh747vwNI7KC24/ORebOs62s2V5TqlC+pyBVn68e
 Ej8024OoJf47sngatoyFgzEk3yKOb55IZfXOFQjnSproNySPr9ISmIaQZWQ+uqSy8HE0
 TNlg==
X-Gm-Message-State: AOAM532YbydJBFAoiGXtD2uKuT2EuSLyuuhsa9otsk9H3yR3YupBJvXE
 QpU5stJ5i767adA4hmPHmAFcdgjAWL9dWZBzdXU5R1GAMQ==
X-Google-Smtp-Source: ABdhPJxnJj4BgsD9jLxVTipOrugFifg07sLrBAv7sD1WZiGEmU6zHGmkT58z2sE+CUkTiIc+VX91iZH3QaqBj2YlhlY=
X-Received: by 2002:a0d:d512:0:b0:2d1:51a:5616 with SMTP id
 x18-20020a0dd512000000b002d1051a5616mr25988809ywd.62.1645562270373; Tue, 22
 Feb 2022 12:37:50 -0800 (PST)
MIME-Version: 1.0
References: <20220206091835.1244296-1-atishp@rivosinc.com>
 <20220206091835.1244296-4-atishp@rivosinc.com>
 <CAKmqyKN2HazVtQE669aOtTi4vZFt=z2BO1Yip3a7nrLmK5Kr2Q@mail.gmail.com>
In-Reply-To: <CAKmqyKN2HazVtQE669aOtTi4vZFt=z2BO1Yip3a7nrLmK5Kr2Q@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 22 Feb 2022 12:37:39 -0800
Message-ID: <CAOnJCUKRwSFT-0BCsZf1g4X9KvWNA+6B_n2Va=OKrefcbBxbDg@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] target/riscv: Introduce privilege version field in
 the CSR ops.
To: Alistair Francis <alistair23@gmail.com>
Cc: Atish Patra <atishp@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <alistair.francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=atishp@atishpatra.org; helo=mail-yb1-xb2a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 22 Feb 2022 20:43:26 -0000

On Mon, Feb 21, 2022 at 1:42 PM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Sun, Feb 6, 2022 at 7:19 PM Atish Patra <atishp@rivosinc.com> wrote:
> >
> > To allow/disallow the CSR access based on the privilege spec, a new field
> > in the csr_ops is introduced. It also adds the privileged specification
> > version (v1.12) for the CSRs introduced in the v1.12. This includes the
> > new ratified extensions such as Vector, Hypervisor and secconfig CSR.
> >
> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
>
> It might be worth mentioning that there is no enforcement in this commit
>

Sure. I will update the commit text and send a v4.

> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>
> Alistair
>
> > ---
> >  target/riscv/cpu.h |   2 +
> >  target/riscv/csr.c | 103 ++++++++++++++++++++++++++++++---------------
> >  2 files changed, 70 insertions(+), 35 deletions(-)
> >
> > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> > index 60b847141db2..0741f9822cf0 100644
> > --- a/target/riscv/cpu.h
> > +++ b/target/riscv/cpu.h
> > @@ -593,6 +593,8 @@ typedef struct {
> >      riscv_csr_op_fn op;
> >      riscv_csr_read128_fn read128;
> >      riscv_csr_write128_fn write128;
> > +    /* The default priv spec version should be PRIV_VERSION_1_10_0 (i.e 0) */
> > +    uint32_t min_priv_ver;
> >  } riscv_csr_operations;
> >
> >  /* CSR function table constants */
> > diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> > index 8c63caa39245..25a0df498669 100644
> > --- a/target/riscv/csr.c
> > +++ b/target/riscv/csr.c
> > @@ -2981,13 +2981,20 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
> >      [CSR_FRM]      = { "frm",      fs,     read_frm,     write_frm    },
> >      [CSR_FCSR]     = { "fcsr",     fs,     read_fcsr,    write_fcsr   },
> >      /* Vector CSRs */
> > -    [CSR_VSTART]   = { "vstart",   vs,     read_vstart,  write_vstart },
> > -    [CSR_VXSAT]    = { "vxsat",    vs,     read_vxsat,   write_vxsat  },
> > -    [CSR_VXRM]     = { "vxrm",     vs,     read_vxrm,    write_vxrm   },
> > -    [CSR_VCSR]     = { "vcsr",     vs,     read_vcsr,    write_vcsr   },
> > -    [CSR_VL]       = { "vl",       vs,     read_vl                    },
> > -    [CSR_VTYPE]    = { "vtype",    vs,     read_vtype                 },
> > -    [CSR_VLENB]    = { "vlenb",    vs,     read_vlenb                 },
> > +    [CSR_VSTART]   = { "vstart",   vs,    read_vstart,  write_vstart,
> > +                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
> > +    [CSR_VXSAT]    = { "vxsat",    vs,    read_vxsat,   write_vxsat,
> > +                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
> > +    [CSR_VXRM]     = { "vxrm",     vs,    read_vxrm,    write_vxrm,
> > +                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
> > +    [CSR_VCSR]     = { "vcsr",     vs,    read_vcsr,    write_vcsr,
> > +                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
> > +    [CSR_VL]       = { "vl",       vs,    read_vl,
> > +                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
> > +    [CSR_VTYPE]    = { "vtype",    vs,    read_vtype,
> > +                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
> > +    [CSR_VLENB]    = { "vlenb",    vs,    read_vlenb,
> > +                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
> >      /* User Timers and Counters */
> >      [CSR_CYCLE]    = { "cycle",    ctr,    read_instret  },
> >      [CSR_INSTRET]  = { "instret",  ctr,    read_instret  },
> > @@ -3096,33 +3103,58 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
> >      [CSR_SIEH]       = { "sieh",   aia_smode32, NULL, NULL, rmw_sieh },
> >      [CSR_SIPH]       = { "siph",   aia_smode32, NULL, NULL, rmw_siph },
> >
> > -    [CSR_HSTATUS]     = { "hstatus",     hmode,   read_hstatus,     write_hstatus     },
> > -    [CSR_HEDELEG]     = { "hedeleg",     hmode,   read_hedeleg,     write_hedeleg     },
> > -    [CSR_HIDELEG]     = { "hideleg",     hmode,   NULL,   NULL,     rmw_hideleg       },
> > -    [CSR_HVIP]        = { "hvip",        hmode,   NULL,   NULL,     rmw_hvip          },
> > -    [CSR_HIP]         = { "hip",         hmode,   NULL,   NULL,     rmw_hip           },
> > -    [CSR_HIE]         = { "hie",         hmode,   NULL,   NULL,     rmw_hie           },
> > -    [CSR_HCOUNTEREN]  = { "hcounteren",  hmode,   read_hcounteren,  write_hcounteren  },
> > -    [CSR_HGEIE]       = { "hgeie",       hmode,   read_hgeie,       write_hgeie       },
> > -    [CSR_HTVAL]       = { "htval",       hmode,   read_htval,       write_htval       },
> > -    [CSR_HTINST]      = { "htinst",      hmode,   read_htinst,      write_htinst      },
> > -    [CSR_HGEIP]       = { "hgeip",       hmode,   read_hgeip,       NULL              },
> > -    [CSR_HGATP]       = { "hgatp",       hmode,   read_hgatp,       write_hgatp       },
> > -    [CSR_HTIMEDELTA]  = { "htimedelta",  hmode,   read_htimedelta,  write_htimedelta  },
> > -    [CSR_HTIMEDELTAH] = { "htimedeltah", hmode32, read_htimedeltah, write_htimedeltah },
> > -
> > -    [CSR_VSSTATUS]    = { "vsstatus",    hmode,   read_vsstatus,    write_vsstatus    },
> > -    [CSR_VSIP]        = { "vsip",        hmode,   NULL,    NULL,    rmw_vsip          },
> > -    [CSR_VSIE]        = { "vsie",        hmode,   NULL,    NULL,    rmw_vsie          },
> > -    [CSR_VSTVEC]      = { "vstvec",      hmode,   read_vstvec,      write_vstvec      },
> > -    [CSR_VSSCRATCH]   = { "vsscratch",   hmode,   read_vsscratch,   write_vsscratch   },
> > -    [CSR_VSEPC]       = { "vsepc",       hmode,   read_vsepc,       write_vsepc       },
> > -    [CSR_VSCAUSE]     = { "vscause",     hmode,   read_vscause,     write_vscause     },
> > -    [CSR_VSTVAL]      = { "vstval",      hmode,   read_vstval,      write_vstval      },
> > -    [CSR_VSATP]       = { "vsatp",       hmode,   read_vsatp,       write_vsatp       },
> > -
> > -    [CSR_MTVAL2]      = { "mtval2",      hmode,   read_mtval2,      write_mtval2      },
> > -    [CSR_MTINST]      = { "mtinst",      hmode,   read_mtinst,      write_mtinst      },
> > +    [CSR_HSTATUS]     = { "hstatus",     hmode,   read_hstatus,   write_hstatus,
> > +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> > +    [CSR_HEDELEG]     = { "hedeleg",     hmode,   read_hedeleg,   write_hedeleg,
> > +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> > +    [CSR_HIDELEG]     = { "hideleg",     hmode,   NULL,   NULL, rmw_hideleg,
> > +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> > +    [CSR_HVIP]        = { "hvip",        hmode,   NULL,   NULL,   rmw_hvip,
> > +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> > +    [CSR_HIP]         = { "hip",         hmode,   NULL,   NULL,   rmw_hip,
> > +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> > +    [CSR_HIE]         = { "hie",         hmode,   NULL,   NULL,    rmw_hie,
> > +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> > +    [CSR_HCOUNTEREN]  = { "hcounteren",  hmode,   read_hcounteren, write_hcounteren,
> > +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> > +    [CSR_HGEIE]       = { "hgeie",       hmode,   read_hgeie,       write_hgeie,
> > +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> > +    [CSR_HTVAL]       = { "htval",       hmode,   read_htval,     write_htval,
> > +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> > +    [CSR_HTINST]      = { "htinst",      hmode,   read_htinst,    write_htinst,
> > +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> > +    [CSR_HGEIP]       = { "hgeip",       hmode,   read_hgeip,
> > +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> > +    [CSR_HGATP]       = { "hgatp",       hmode,   read_hgatp,     write_hgatp,
> > +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> > +    [CSR_HTIMEDELTA]  = { "htimedelta",  hmode,   read_htimedelta, write_htimedelta,
> > +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> > +    [CSR_HTIMEDELTAH] = { "htimedeltah", hmode32, read_htimedeltah, write_htimedeltah,
> > +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> > +
> > +    [CSR_VSSTATUS]    = { "vsstatus",    hmode,   read_vsstatus,  write_vsstatus,
> > +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> > +    [CSR_VSIP]        = { "vsip",        hmode,   NULL,    NULL,  rmw_vsip,
> > +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> > +    [CSR_VSIE]        = { "vsie",        hmode,   NULL,    NULL,    rmw_vsie ,
> > +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> > +    [CSR_VSTVEC]      = { "vstvec",      hmode,   read_vstvec,    write_vstvec,
> > +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> > +    [CSR_VSSCRATCH]   = { "vsscratch",   hmode,   read_vsscratch, write_vsscratch,
> > +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> > +    [CSR_VSEPC]       = { "vsepc",       hmode,   read_vsepc,     write_vsepc,
> > +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> > +    [CSR_VSCAUSE]     = { "vscause",     hmode,   read_vscause,   write_vscause,
> > +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> > +    [CSR_VSTVAL]      = { "vstval",      hmode,   read_vstval,    write_vstval,
> > +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> > +    [CSR_VSATP]       = { "vsatp",       hmode,   read_vsatp,     write_vsatp,
> > +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> > +
> > +    [CSR_MTVAL2]      = { "mtval2",      hmode,   read_mtval2,    write_mtval2,
> > +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> > +    [CSR_MTINST]      = { "mtinst",      hmode,   read_mtinst,    write_mtinst,
> > +                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> >
> >      /* Virtual Interrupts and Interrupt Priorities (H-extension with AIA) */
> >      [CSR_HVIEN]       = { "hvien",       aia_hmode, read_zero, write_ignore },
> > @@ -3154,7 +3186,8 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
> >      [CSR_VSIPH]       = { "vsiph",       aia_hmode32, NULL, NULL, rmw_vsiph },
> >
> >      /* Physical Memory Protection */
> > -    [CSR_MSECCFG]    = { "mseccfg",  epmp, read_mseccfg, write_mseccfg },
> > +    [CSR_MSECCFG]    = { "mseccfg",  epmp, read_mseccfg, write_mseccfg,
> > +                                     .min_priv_ver = PRIV_VERSION_1_12_0 },
> >      [CSR_PMPCFG0]    = { "pmpcfg0",   pmp, read_pmpcfg,  write_pmpcfg  },
> >      [CSR_PMPCFG1]    = { "pmpcfg1",   pmp, read_pmpcfg,  write_pmpcfg  },
> >      [CSR_PMPCFG2]    = { "pmpcfg2",   pmp, read_pmpcfg,  write_pmpcfg  },
> > --
> > 2.30.2
> >
> >
>


-- 
Regards,
Atish

