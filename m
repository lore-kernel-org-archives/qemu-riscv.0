Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oAn7H-00072v-Fh
	for mharc-qemu-riscv@gnu.org; Mon, 11 Jul 2022 02:41:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oAn7F-00072M-MR; Mon, 11 Jul 2022 02:41:57 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:41815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oAn7C-0004tb-Gw; Mon, 11 Jul 2022 02:41:57 -0400
Received: by mail-pg1-x529.google.com with SMTP id 23so3939932pgc.8;
 Sun, 10 Jul 2022 23:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K73XwNQdNSCOMdPH0uAjzWS029RHwpulqZrTeKTFPTQ=;
 b=YijwmR5ZiO4DgYEciZBm8ESHN2btND6zO54cIEoOpt1OXDpnqThpPuRRlmRFShz3dd
 VVWrusuwxJEeASgd1DJyuibv5UWZ7rAv+XqeiIQfVidQCw2ox6krnLsh7zWo4WVAj4xV
 45vg7ShYz3mHhMR1p7rUKB+1dHl9bjx3sOGutxCAqVAoRjepXBMt6t7XCiS2c+Vw+CZW
 wJWv1ZH9N+SxW83D3iGWudVhYv4fbNgc57iwBcQq7AQiTBjUzAVeSIfv7VkFJf06QG6p
 bXE+kl0sQmkxjcleQuL8jrFJ5jXYKTMVZ95dX/QxiYnW4JSA19QcN6yLXAg0WSaejI55
 ZvaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K73XwNQdNSCOMdPH0uAjzWS029RHwpulqZrTeKTFPTQ=;
 b=QUzBSbJFoJ+ln7tEB8zuid6sRW9A5qax8mkuRTgOs+0FH38z9l/m8hLxKwNIUGhOD7
 dtT9Ti6evo6LTDKmHj2NaN5Z2p15wmVkyWCj50GUPv6FBOjIz19U+e1SoWIAZ1kI8frV
 vIF+J2U63i6FmwgxXe60p0sWfsG+0kTY4jOW8HHUoWTwae7QgVdFYUbt2n/2fTjDS2ml
 sEMVydNJNpiHLHN2xVyfNG7ACPoPXxJ1NLT7rb5Bq6YbCL/2QCiv11AhAl8XNnmZml3k
 FtTs7ATye3dtZd55OKnRX1E6iNHVfWbRDSqdz2AJ14Qs6JeaUAKd0hvQppuqe7pYkuQr
 /1Bg==
X-Gm-Message-State: AJIora9xvEkTJdgH+BlOKaTA4XXQtYcAbbJxCNHZD6wdaBK3bLMqlJdt
 x7YVSbuLugjeGiqeM8UMLsdjtTC8VR8eq7bTlcw=
X-Google-Smtp-Source: AGRyM1uGoAxBKV93whI1yNoxggxpBJsi4INc759K8/96tOTScj/r+onyBDX32vW92tdAhgovihP67XHQ2yyBwRfKCck=
X-Received: by 2002:a05:6a00:1312:b0:528:2948:e974 with SMTP id
 j18-20020a056a00131200b005282948e974mr16999137pfu.79.1657521712487; Sun, 10
 Jul 2022 23:41:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220710082400.29224-1-liweiwei@iscas.ac.cn>
 <20220710082400.29224-4-liweiwei@iscas.ac.cn>
In-Reply-To: <20220710082400.29224-4-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 11 Jul 2022 16:41:25 +1000
Message-ID: <CAKmqyKPoRCGkM7VD83Rf-yr7s-bDCWAcuy8yet8k6KmScAtXwQ@mail.gmail.com>
Subject: Re: [PATCH 3/6] target/riscv: fix checkpatch warning may triggered in
 csr_ops table
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wangjunqiang <wangjunqiang@iscas.ac.cn>, 
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=alistair23@gmail.com; helo=mail-pg1-x529.google.com
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
X-List-Received-Date: Mon, 11 Jul 2022 06:41:57 -0000

On Sun, Jul 10, 2022 at 6:28 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
> - line over 80 characters will trigger warning when running checkpatch
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---
>  target/riscv/csr.c | 362 ++++++++++++++++++++++++---------------------
>  1 file changed, 196 insertions(+), 166 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 235f2a011e..9bda1ff993 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -3462,19 +3462,19 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>      [CSR_FCSR]     = { "fcsr",     fs,     read_fcsr,    write_fcsr   },
>      /* Vector CSRs */
>      [CSR_VSTART]   = { "vstart",   vs,    read_vstart,  write_vstart,
> -                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
> +                                    .min_priv_ver = PRIV_VERSION_1_12_0 },

Thanks for this!

I think while we are changing these we should have all of the newlines
start at the same position. So the .min_priv_ver should line up with
"vstart" in this case

Alistair

>      [CSR_VXSAT]    = { "vxsat",    vs,    read_vxsat,   write_vxsat,
> -                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
> +                                    .min_priv_ver = PRIV_VERSION_1_12_0 },
>      [CSR_VXRM]     = { "vxrm",     vs,    read_vxrm,    write_vxrm,
> -                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
> +                                    .min_priv_ver = PRIV_VERSION_1_12_0 },
>      [CSR_VCSR]     = { "vcsr",     vs,    read_vcsr,    write_vcsr,
> -                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
> +                                    .min_priv_ver = PRIV_VERSION_1_12_0 },
>      [CSR_VL]       = { "vl",       vs,    read_vl,
> -                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
> +                                    .min_priv_ver = PRIV_VERSION_1_12_0 },
>      [CSR_VTYPE]    = { "vtype",    vs,    read_vtype,
> -                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
> +                                    .min_priv_ver = PRIV_VERSION_1_12_0 },
>      [CSR_VLENB]    = { "vlenb",    vs,    read_vlenb,
> -                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
> +                                    .min_priv_ver = PRIV_VERSION_1_12_0 },
>      /* User Timers and Counters */
>      [CSR_CYCLE]    = { "cycle",    ctr,    read_hpmcounter  },
>      [CSR_INSTRET]  = { "instret",  ctr,    read_hpmcounter  },
> @@ -3493,10 +3493,14 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>
>  #if !defined(CONFIG_USER_ONLY)
>      /* Machine Timers and Counters */
> -    [CSR_MCYCLE]    = { "mcycle",    any,   read_hpmcounter, write_mhpmcounter},
> -    [CSR_MINSTRET]  = { "minstret",  any,   read_hpmcounter, write_mhpmcounter},
> -    [CSR_MCYCLEH]   = { "mcycleh",   any32, read_hpmcounterh, write_mhpmcounterh},
> -    [CSR_MINSTRETH] = { "minstreth", any32, read_hpmcounterh, write_mhpmcounterh},
> +    [CSR_MCYCLE]    = { "mcycle",    any,   read_hpmcounter,
> +                                            write_mhpmcounter  },
> +    [CSR_MINSTRET]  = { "minstret",  any,   read_hpmcounter,
> +                                            write_mhpmcounter  },
> +    [CSR_MCYCLEH]   = { "mcycleh",   any32, read_hpmcounterh,
> +                                            write_mhpmcounterh },
> +    [CSR_MINSTRETH] = { "minstreth", any32, read_hpmcounterh,
> +                                            write_mhpmcounterh },
>
>      /* Machine Information Registers */
>      [CSR_MVENDORID] = { "mvendorid", any,   read_mvendorid },
> @@ -3507,29 +3511,32 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>      [CSR_MCONFIGPTR]  = { "mconfigptr", any,   read_zero,
>                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
>      /* Machine Trap Setup */
> -    [CSR_MSTATUS]     = { "mstatus",    any,   read_mstatus,     write_mstatus, NULL,
> -                                               read_mstatus_i128                   },
> -    [CSR_MISA]        = { "misa",       any,   read_misa,        write_misa, NULL,
> -                                               read_misa_i128                      },
> -    [CSR_MIDELEG]     = { "mideleg",    any,   NULL,    NULL,    rmw_mideleg       },
> -    [CSR_MEDELEG]     = { "medeleg",    any,   read_medeleg,     write_medeleg     },
> -    [CSR_MIE]         = { "mie",        any,   NULL,    NULL,    rmw_mie           },
> -    [CSR_MTVEC]       = { "mtvec",      any,   read_mtvec,       write_mtvec       },
> -    [CSR_MCOUNTEREN]  = { "mcounteren", any,   read_mcounteren,  write_mcounteren  },
> -
> -    [CSR_MSTATUSH]    = { "mstatush",   any32, read_mstatush,    write_mstatush    },
> +    [CSR_MSTATUS]     = { "mstatus",    any,   read_mstatus,
> +                                               write_mstatus, NULL,
> +                                               read_mstatus_i128            },
> +    [CSR_MISA]        = { "misa",       any,   read_misa,
> +                                               write_misa, NULL,
> +                                               read_misa_i128               },
> +    [CSR_MIDELEG]     = { "mideleg",    any,   NULL,  NULL,   rmw_mideleg   },
> +    [CSR_MEDELEG]     = { "medeleg",    any,   read_medeleg,  write_medeleg },
> +    [CSR_MIE]         = { "mie",        any,   NULL,  NULL,   rmw_mie       },
> +    [CSR_MTVEC]       = { "mtvec",      any,   read_mtvec,    write_mtvec   },
> +    [CSR_MCOUNTEREN]  = { "mcounteren", any,   read_mcounteren,
> +                                               write_mcounteren             },
> +
> +    [CSR_MSTATUSH]    = { "mstatush", any32, read_mstatush, write_mstatush  },
>
>      /* Machine Trap Handling */
> -    [CSR_MSCRATCH] = { "mscratch", any,  read_mscratch,      write_mscratch, NULL,
> -                                         read_mscratch_i128, write_mscratch_i128   },
> +    [CSR_MSCRATCH] = { "mscratch", any,  read_mscratch, write_mscratch,
> +                         NULL, read_mscratch_i128, write_mscratch_i128 },
>      [CSR_MEPC]     = { "mepc",     any,  read_mepc,     write_mepc     },
>      [CSR_MCAUSE]   = { "mcause",   any,  read_mcause,   write_mcause   },
>      [CSR_MTVAL]    = { "mtval",    any,  read_mtval,    write_mtval    },
>      [CSR_MIP]      = { "mip",      any,  NULL,    NULL, rmw_mip        },
>
>      /* Machine-Level Window to Indirectly Accessed Registers (AIA) */
> -    [CSR_MISELECT] = { "miselect", aia_any,   NULL, NULL,    rmw_xiselect },
> -    [CSR_MIREG]    = { "mireg",    aia_any,   NULL, NULL,    rmw_xireg },
> +    [CSR_MISELECT] = { "miselect", aia_any,   NULL, NULL, rmw_xiselect },
> +    [CSR_MIREG]    = { "mireg",    aia_any,   NULL, NULL, rmw_xireg    },
>
>      /* Machine-Level Interrupts (AIA) */
>      [CSR_MTOPEI]     = { "mtopei",     aia_any, NULL, NULL, rmw_xtopei },
> @@ -3548,26 +3555,27 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>
>      /* Execution environment configuration */
>      [CSR_MENVCFG]  = { "menvcfg",  any,   read_menvcfg,  write_menvcfg,
> -                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
> +                                    .min_priv_ver = PRIV_VERSION_1_12_0 },
>      [CSR_MENVCFGH] = { "menvcfgh", any32, read_menvcfgh, write_menvcfgh,
> -                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
> +                                    .min_priv_ver = PRIV_VERSION_1_12_0 },
>      [CSR_SENVCFG]  = { "senvcfg",  smode, read_senvcfg,  write_senvcfg,
> -                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
> +                                    .min_priv_ver = PRIV_VERSION_1_12_0 },
>      [CSR_HENVCFG]  = { "henvcfg",  hmode, read_henvcfg, write_henvcfg,
> -                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
> +                                    .min_priv_ver = PRIV_VERSION_1_12_0 },
>      [CSR_HENVCFGH] = { "henvcfgh", hmode32, read_henvcfgh, write_henvcfgh,
> -                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
> +                                    .min_priv_ver = PRIV_VERSION_1_12_0 },
>
>      /* Supervisor Trap Setup */
> -    [CSR_SSTATUS]    = { "sstatus",    smode, read_sstatus,    write_sstatus, NULL,
> -                                              read_sstatus_i128                 },
> -    [CSR_SIE]        = { "sie",        smode, NULL,   NULL,    rmw_sie          },
> -    [CSR_STVEC]      = { "stvec",      smode, read_stvec,      write_stvec      },
> -    [CSR_SCOUNTEREN] = { "scounteren", smode, read_scounteren, write_scounteren },
> +    [CSR_SSTATUS]    = { "sstatus",    smode, read_sstatus,  write_sstatus,
> +                                       NULL,  read_sstatus_i128          },
> +    [CSR_SIE]        = { "sie",        smode, NULL,   NULL,  rmw_sie     },
> +    [CSR_STVEC]      = { "stvec",      smode, read_stvec,    write_stvec },
> +    [CSR_SCOUNTEREN] = { "scounteren", smode, read_scounteren,
> +                                              write_scounteren           },
>
>      /* Supervisor Trap Handling */
> -    [CSR_SSCRATCH] = { "sscratch", smode, read_sscratch, write_sscratch, NULL,
> -                                          read_sscratch_i128, write_sscratch_i128  },
> +    [CSR_SSCRATCH] = { "sscratch", smode, read_sscratch, write_sscratch,
> +                        NULL,      read_sscratch_i128, write_sscratch_i128 },
>      [CSR_SEPC]     = { "sepc",     smode, read_sepc,     write_sepc     },
>      [CSR_SCAUSE]   = { "scause",   smode, read_scause,   write_scause   },
>      [CSR_STVAL]    = { "stval",    smode, read_stval,   write_stval   },
> @@ -3588,81 +3596,94 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>      [CSR_SIEH]       = { "sieh",   aia_smode32, NULL, NULL, rmw_sieh },
>      [CSR_SIPH]       = { "siph",   aia_smode32, NULL, NULL, rmw_siph },
>
> -    [CSR_HSTATUS]     = { "hstatus",     hmode,   read_hstatus,   write_hstatus,
> -                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> -    [CSR_HEDELEG]     = { "hedeleg",     hmode,   read_hedeleg,   write_hedeleg,
> -                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> +    [CSR_HSTATUS]     = { "hstatus",     hmode,   read_hstatus, write_hstatus,
> +                                        .min_priv_ver = PRIV_VERSION_1_12_0 },
> +    [CSR_HEDELEG]     = { "hedeleg",     hmode,   read_hedeleg, write_hedeleg,
> +                                        .min_priv_ver = PRIV_VERSION_1_12_0 },
>      [CSR_HIDELEG]     = { "hideleg",     hmode,   NULL,   NULL, rmw_hideleg,
> -                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> -    [CSR_HVIP]        = { "hvip",        hmode,   NULL,   NULL,   rmw_hvip,
> -                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> -    [CSR_HIP]         = { "hip",         hmode,   NULL,   NULL,   rmw_hip,
> -                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> -    [CSR_HIE]         = { "hie",         hmode,   NULL,   NULL,    rmw_hie,
> -                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> -    [CSR_HCOUNTEREN]  = { "hcounteren",  hmode,   read_hcounteren, write_hcounteren,
> -                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> -    [CSR_HGEIE]       = { "hgeie",       hmode,   read_hgeie,       write_hgeie,
> -                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> -    [CSR_HTVAL]       = { "htval",       hmode,   read_htval,     write_htval,
> -                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> -    [CSR_HTINST]      = { "htinst",      hmode,   read_htinst,    write_htinst,
> -                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> +                                        .min_priv_ver = PRIV_VERSION_1_12_0 },
> +    [CSR_HVIP]        = { "hvip",        hmode,   NULL,   NULL, rmw_hvip,
> +                                        .min_priv_ver = PRIV_VERSION_1_12_0 },
> +    [CSR_HIP]         = { "hip",         hmode,   NULL,   NULL, rmw_hip,
> +                                        .min_priv_ver = PRIV_VERSION_1_12_0 },
> +    [CSR_HIE]         = { "hie",         hmode,   NULL,   NULL, rmw_hie,
> +                                        .min_priv_ver = PRIV_VERSION_1_12_0 },
> +    [CSR_HCOUNTEREN]  = { "hcounteren",  hmode,   read_hcounteren,
> +                                         write_hcounteren,
> +                                        .min_priv_ver = PRIV_VERSION_1_12_0 },
> +    [CSR_HGEIE]       = { "hgeie",       hmode,   read_hgeie,   write_hgeie,
> +                                        .min_priv_ver = PRIV_VERSION_1_12_0 },
> +    [CSR_HTVAL]       = { "htval",       hmode,   read_htval,   write_htval,
> +                                        .min_priv_ver = PRIV_VERSION_1_12_0 },
> +    [CSR_HTINST]      = { "htinst",      hmode,   read_htinst,  write_htinst,
> +                                        .min_priv_ver = PRIV_VERSION_1_12_0 },
>      [CSR_HGEIP]       = { "hgeip",       hmode,   read_hgeip,
> -                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> -    [CSR_HGATP]       = { "hgatp",       hmode,   read_hgatp,     write_hgatp,
> -                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> -    [CSR_HTIMEDELTA]  = { "htimedelta",  hmode,   read_htimedelta, write_htimedelta,
> -                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> -    [CSR_HTIMEDELTAH] = { "htimedeltah", hmode32, read_htimedeltah, write_htimedeltah,
> -                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> -
> -    [CSR_VSSTATUS]    = { "vsstatus",    hmode,   read_vsstatus,  write_vsstatus,
> -                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> -    [CSR_VSIP]        = { "vsip",        hmode,   NULL,    NULL,  rmw_vsip,
> -                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> -    [CSR_VSIE]        = { "vsie",        hmode,   NULL,    NULL,    rmw_vsie ,
> -                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> -    [CSR_VSTVEC]      = { "vstvec",      hmode,   read_vstvec,    write_vstvec,
> -                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> -    [CSR_VSSCRATCH]   = { "vsscratch",   hmode,   read_vsscratch, write_vsscratch,
> -                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> -    [CSR_VSEPC]       = { "vsepc",       hmode,   read_vsepc,     write_vsepc,
> -                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> -    [CSR_VSCAUSE]     = { "vscause",     hmode,   read_vscause,   write_vscause,
> -                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> -    [CSR_VSTVAL]      = { "vstval",      hmode,   read_vstval,    write_vstval,
> -                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> -    [CSR_VSATP]       = { "vsatp",       hmode,   read_vsatp,     write_vsatp,
> -                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> -
> -    [CSR_MTVAL2]      = { "mtval2",      hmode,   read_mtval2,    write_mtval2,
> -                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> -    [CSR_MTINST]      = { "mtinst",      hmode,   read_mtinst,    write_mtinst,
> -                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> +                                        .min_priv_ver = PRIV_VERSION_1_12_0 },
> +    [CSR_HGATP]       = { "hgatp",       hmode,   read_hgatp,   write_hgatp,
> +                                        .min_priv_ver = PRIV_VERSION_1_12_0 },
> +    [CSR_HTIMEDELTA]  = { "htimedelta",  hmode,   read_htimedelta,
> +                                         write_htimedelta,
> +                                        .min_priv_ver = PRIV_VERSION_1_12_0 },
> +    [CSR_HTIMEDELTAH] = { "htimedeltah", hmode32, read_htimedeltah,
> +                                         write_htimedeltah,
> +                                        .min_priv_ver = PRIV_VERSION_1_12_0 },
> +
> +    [CSR_VSSTATUS]    = { "vsstatus",    hmode,   read_vsstatus,
> +                                         write_vsstatus,
> +                                        .min_priv_ver = PRIV_VERSION_1_12_0 },
> +    [CSR_VSIP]        = { "vsip",        hmode,   NULL,   NULL, rmw_vsip,
> +                                        .min_priv_ver = PRIV_VERSION_1_12_0 },
> +    [CSR_VSIE]        = { "vsie",        hmode,   NULL,   NULL, rmw_vsie,
> +                                        .min_priv_ver = PRIV_VERSION_1_12_0 },
> +    [CSR_VSTVEC]      = { "vstvec",      hmode,   read_vstvec,  write_vstvec,
> +                                        .min_priv_ver = PRIV_VERSION_1_12_0 },
> +    [CSR_VSSCRATCH]   = { "vsscratch",   hmode,   read_vsscratch,
> +                                         write_vsscratch,
> +                                        .min_priv_ver = PRIV_VERSION_1_12_0 },
> +    [CSR_VSEPC]       = { "vsepc",       hmode,   read_vsepc,   write_vsepc,
> +                                        .min_priv_ver = PRIV_VERSION_1_12_0 },
> +    [CSR_VSCAUSE]     = { "vscause",     hmode,   read_vscause, write_vscause,
> +                                        .min_priv_ver = PRIV_VERSION_1_12_0 },
> +    [CSR_VSTVAL]      = { "vstval",      hmode,   read_vstval,  write_vstval,
> +                                        .min_priv_ver = PRIV_VERSION_1_12_0 },
> +    [CSR_VSATP]       = { "vsatp",       hmode,   read_vsatp,   write_vsatp,
> +                                        .min_priv_ver = PRIV_VERSION_1_12_0 },
> +
> +    [CSR_MTVAL2]      = { "mtval2",      hmode,   read_mtval2,  write_mtval2,
> +                                        .min_priv_ver = PRIV_VERSION_1_12_0 },
> +    [CSR_MTINST]      = { "mtinst",      hmode,   read_mtinst,  write_mtinst,
> +                                        .min_priv_ver = PRIV_VERSION_1_12_0 },
>
>      /* Virtual Interrupts and Interrupt Priorities (H-extension with AIA) */
>      [CSR_HVIEN]       = { "hvien",       aia_hmode, read_zero, write_ignore },
> -    [CSR_HVICTL]      = { "hvictl",      aia_hmode, read_hvictl, write_hvictl },
> -    [CSR_HVIPRIO1]    = { "hviprio1",    aia_hmode, read_hviprio1,   write_hviprio1 },
> -    [CSR_HVIPRIO2]    = { "hviprio2",    aia_hmode, read_hviprio2,   write_hviprio2 },
> +    [CSR_HVICTL]      = { "hvictl",      aia_hmode, read_hvictl,
> +                                                    write_hvictl            },
> +    [CSR_HVIPRIO1]    = { "hviprio1",    aia_hmode, read_hviprio1,
> +                                                    write_hviprio1          },
> +    [CSR_HVIPRIO2]    = { "hviprio2",    aia_hmode, read_hviprio2,
> +                                                    write_hviprio2          },
>
>      /*
>       * VS-Level Window to Indirectly Accessed Registers (H-extension with AIA)
>       */
> -    [CSR_VSISELECT]   = { "vsiselect",   aia_hmode, NULL, NULL,      rmw_xiselect },
> -    [CSR_VSIREG]      = { "vsireg",      aia_hmode, NULL, NULL,      rmw_xireg },
> +    [CSR_VSISELECT]   = { "vsiselect",   aia_hmode, NULL, NULL,
> +                                                    rmw_xiselect            },
> +    [CSR_VSIREG]      = { "vsireg",      aia_hmode, NULL, NULL,  rmw_xireg  },
>
>      /* VS-Level Interrupts (H-extension with AIA) */
> -    [CSR_VSTOPEI]     = { "vstopei",     aia_hmode, NULL, NULL, rmw_xtopei },
> +    [CSR_VSTOPEI]     = { "vstopei",     aia_hmode, NULL, NULL,  rmw_xtopei },
>      [CSR_VSTOPI]      = { "vstopi",      aia_hmode, read_vstopi },
>
>      /* Hypervisor and VS-Level High-Half CSRs (H-extension with AIA) */
> -    [CSR_HIDELEGH]    = { "hidelegh",    aia_hmode32, NULL, NULL, rmw_hidelegh },
> -    [CSR_HVIENH]      = { "hvienh",      aia_hmode32, read_zero, write_ignore },
> +    [CSR_HIDELEGH]    = { "hidelegh",    aia_hmode32, NULL, NULL,
> +                                                      rmw_hidelegh          },
> +    [CSR_HVIENH]      = { "hvienh",      aia_hmode32, read_zero,
> +                                                      write_ignore          },
>      [CSR_HVIPH]       = { "hviph",       aia_hmode32, NULL, NULL, rmw_hviph },
> -    [CSR_HVIPRIO1H]   = { "hviprio1h",   aia_hmode32, read_hviprio1h, write_hviprio1h },
> -    [CSR_HVIPRIO2H]   = { "hviprio2h",   aia_hmode32, read_hviprio2h, write_hviprio2h },
> +    [CSR_HVIPRIO1H]   = { "hviprio1h",   aia_hmode32, read_hviprio1h,
> +                                                      write_hviprio1h       },
> +    [CSR_HVIPRIO2H]   = { "hviprio2h",   aia_hmode32, read_hviprio2h,
> +                                                      write_hviprio2h       },
>      [CSR_VSIEH]       = { "vsieh",       aia_hmode32, NULL, NULL, rmw_vsieh },
>      [CSR_VSIPH]       = { "vsiph",       aia_hmode32, NULL, NULL, rmw_vsiph },
>
> @@ -3697,17 +3718,26 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>      [CSR_TDATA3]    =  { "tdata3",  debug, read_tdata,   write_tdata   },
>
>      /* User Pointer Masking */
> -    [CSR_UMTE]    =    { "umte",    pointer_masking, read_umte,    write_umte    },
> -    [CSR_UPMMASK] =    { "upmmask", pointer_masking, read_upmmask, write_upmmask },
> -    [CSR_UPMBASE] =    { "upmbase", pointer_masking, read_upmbase, write_upmbase },
> +    [CSR_UMTE]    =    { "umte",    pointer_masking, read_umte,
> +                                                     write_umte    },
> +    [CSR_UPMMASK] =    { "upmmask", pointer_masking, read_upmmask,
> +                                                     write_upmmask },
> +    [CSR_UPMBASE] =    { "upmbase", pointer_masking, read_upmbase,
> +                                                     write_upmbase },
>      /* Machine Pointer Masking */
> -    [CSR_MMTE]    =    { "mmte",    pointer_masking, read_mmte,    write_mmte    },
> -    [CSR_MPMMASK] =    { "mpmmask", pointer_masking, read_mpmmask, write_mpmmask },
> -    [CSR_MPMBASE] =    { "mpmbase", pointer_masking, read_mpmbase, write_mpmbase },
> +    [CSR_MMTE]    =    { "mmte",    pointer_masking, read_mmte,
> +                                                     write_mmte    },
> +    [CSR_MPMMASK] =    { "mpmmask", pointer_masking, read_mpmmask,
> +                                                     write_mpmmask },
> +    [CSR_MPMBASE] =    { "mpmbase", pointer_masking, read_mpmbase,
> +                                                     write_mpmbase },
>      /* Supervisor Pointer Masking */
> -    [CSR_SMTE]    =    { "smte",    pointer_masking, read_smte,    write_smte    },
> -    [CSR_SPMMASK] =    { "spmmask", pointer_masking, read_spmmask, write_spmmask },
> -    [CSR_SPMBASE] =    { "spmbase", pointer_masking, read_spmbase, write_spmbase },
> +    [CSR_SMTE]    =    { "smte",    pointer_masking, read_smte,
> +                                                     write_smte    },
> +    [CSR_SPMMASK] =    { "spmmask", pointer_masking, read_spmmask,
> +                                                     write_spmmask },
> +    [CSR_SPMBASE] =    { "spmbase", pointer_masking, read_spmbase,
> +                                                     write_spmbase },
>
>      /* Performance Counters */
>      [CSR_HPMCOUNTER3]    = { "hpmcounter3",    ctr,    read_hpmcounter },
> @@ -3740,66 +3770,66 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>      [CSR_HPMCOUNTER30]   = { "hpmcounter30",   ctr,    read_hpmcounter },
>      [CSR_HPMCOUNTER31]   = { "hpmcounter31",   ctr,    read_hpmcounter },
>
> -    [CSR_MHPMCOUNTER3]   = { "mhpmcounter3",   mctr,    read_hpmcounter,
> +    [CSR_MHPMCOUNTER3]   = { "mhpmcounter3",   mctr,   read_hpmcounter,
>                                                         write_mhpmcounter },
> -    [CSR_MHPMCOUNTER4]   = { "mhpmcounter4",   mctr,    read_hpmcounter,
> +    [CSR_MHPMCOUNTER4]   = { "mhpmcounter4",   mctr,   read_hpmcounter,
>                                                         write_mhpmcounter },
> -    [CSR_MHPMCOUNTER5]   = { "mhpmcounter5",   mctr,    read_hpmcounter,
> +    [CSR_MHPMCOUNTER5]   = { "mhpmcounter5",   mctr,   read_hpmcounter,
>                                                         write_mhpmcounter },
> -    [CSR_MHPMCOUNTER6]   = { "mhpmcounter6",   mctr,    read_hpmcounter,
> +    [CSR_MHPMCOUNTER6]   = { "mhpmcounter6",   mctr,   read_hpmcounter,
>                                                         write_mhpmcounter },
> -    [CSR_MHPMCOUNTER7]   = { "mhpmcounter7",   mctr,    read_hpmcounter,
> +    [CSR_MHPMCOUNTER7]   = { "mhpmcounter7",   mctr,   read_hpmcounter,
>                                                         write_mhpmcounter },
> -    [CSR_MHPMCOUNTER8]   = { "mhpmcounter8",   mctr,    read_hpmcounter,
> +    [CSR_MHPMCOUNTER8]   = { "mhpmcounter8",   mctr,   read_hpmcounter,
>                                                         write_mhpmcounter },
> -    [CSR_MHPMCOUNTER9]   = { "mhpmcounter9",   mctr,    read_hpmcounter,
> +    [CSR_MHPMCOUNTER9]   = { "mhpmcounter9",   mctr,   read_hpmcounter,
>                                                         write_mhpmcounter },
> -    [CSR_MHPMCOUNTER10]  = { "mhpmcounter10",  mctr,    read_hpmcounter,
> +    [CSR_MHPMCOUNTER10]  = { "mhpmcounter10",  mctr,   read_hpmcounter,
>                                                         write_mhpmcounter },
> -    [CSR_MHPMCOUNTER11]  = { "mhpmcounter11",  mctr,    read_hpmcounter,
> +    [CSR_MHPMCOUNTER11]  = { "mhpmcounter11",  mctr,   read_hpmcounter,
>                                                         write_mhpmcounter },
> -    [CSR_MHPMCOUNTER12]  = { "mhpmcounter12",  mctr,    read_hpmcounter,
> +    [CSR_MHPMCOUNTER12]  = { "mhpmcounter12",  mctr,   read_hpmcounter,
>                                                         write_mhpmcounter },
> -    [CSR_MHPMCOUNTER13]  = { "mhpmcounter13",  mctr,    read_hpmcounter,
> +    [CSR_MHPMCOUNTER13]  = { "mhpmcounter13",  mctr,   read_hpmcounter,
>                                                         write_mhpmcounter },
> -    [CSR_MHPMCOUNTER14]  = { "mhpmcounter14",  mctr,    read_hpmcounter,
> +    [CSR_MHPMCOUNTER14]  = { "mhpmcounter14",  mctr,   read_hpmcounter,
>                                                         write_mhpmcounter },
> -    [CSR_MHPMCOUNTER15]  = { "mhpmcounter15",  mctr,    read_hpmcounter,
> +    [CSR_MHPMCOUNTER15]  = { "mhpmcounter15",  mctr,   read_hpmcounter,
>                                                         write_mhpmcounter },
> -    [CSR_MHPMCOUNTER16]  = { "mhpmcounter16",  mctr,    read_hpmcounter,
> +    [CSR_MHPMCOUNTER16]  = { "mhpmcounter16",  mctr,   read_hpmcounter,
>                                                         write_mhpmcounter },
> -    [CSR_MHPMCOUNTER17]  = { "mhpmcounter17",  mctr,    read_hpmcounter,
> +    [CSR_MHPMCOUNTER17]  = { "mhpmcounter17",  mctr,   read_hpmcounter,
>                                                         write_mhpmcounter },
> -    [CSR_MHPMCOUNTER18]  = { "mhpmcounter18",  mctr,    read_hpmcounter,
> +    [CSR_MHPMCOUNTER18]  = { "mhpmcounter18",  mctr,   read_hpmcounter,
>                                                         write_mhpmcounter },
> -    [CSR_MHPMCOUNTER19]  = { "mhpmcounter19",  mctr,    read_hpmcounter,
> +    [CSR_MHPMCOUNTER19]  = { "mhpmcounter19",  mctr,   read_hpmcounter,
>                                                         write_mhpmcounter },
> -    [CSR_MHPMCOUNTER20]  = { "mhpmcounter20",  mctr,    read_hpmcounter,
> +    [CSR_MHPMCOUNTER20]  = { "mhpmcounter20",  mctr,   read_hpmcounter,
>                                                         write_mhpmcounter },
> -    [CSR_MHPMCOUNTER21]  = { "mhpmcounter21",  mctr,    read_hpmcounter,
> +    [CSR_MHPMCOUNTER21]  = { "mhpmcounter21",  mctr,   read_hpmcounter,
>                                                         write_mhpmcounter },
> -    [CSR_MHPMCOUNTER22]  = { "mhpmcounter22",  mctr,    read_hpmcounter,
> +    [CSR_MHPMCOUNTER22]  = { "mhpmcounter22",  mctr,   read_hpmcounter,
>                                                         write_mhpmcounter },
> -    [CSR_MHPMCOUNTER23]  = { "mhpmcounter23",  mctr,    read_hpmcounter,
> +    [CSR_MHPMCOUNTER23]  = { "mhpmcounter23",  mctr,   read_hpmcounter,
>                                                         write_mhpmcounter },
> -    [CSR_MHPMCOUNTER24]  = { "mhpmcounter24",  mctr,    read_hpmcounter,
> +    [CSR_MHPMCOUNTER24]  = { "mhpmcounter24",  mctr,   read_hpmcounter,
>                                                         write_mhpmcounter },
> -    [CSR_MHPMCOUNTER25]  = { "mhpmcounter25",  mctr,    read_hpmcounter,
> +    [CSR_MHPMCOUNTER25]  = { "mhpmcounter25",  mctr,   read_hpmcounter,
>                                                         write_mhpmcounter },
> -    [CSR_MHPMCOUNTER26]  = { "mhpmcounter26",  mctr,    read_hpmcounter,
> +    [CSR_MHPMCOUNTER26]  = { "mhpmcounter26",  mctr,   read_hpmcounter,
>                                                         write_mhpmcounter },
> -    [CSR_MHPMCOUNTER27]  = { "mhpmcounter27",  mctr,    read_hpmcounter,
> +    [CSR_MHPMCOUNTER27]  = { "mhpmcounter27",  mctr,   read_hpmcounter,
>                                                         write_mhpmcounter },
> -    [CSR_MHPMCOUNTER28]  = { "mhpmcounter28",  mctr,    read_hpmcounter,
> +    [CSR_MHPMCOUNTER28]  = { "mhpmcounter28",  mctr,   read_hpmcounter,
>                                                         write_mhpmcounter },
> -    [CSR_MHPMCOUNTER29]  = { "mhpmcounter29",  mctr,    read_hpmcounter,
> +    [CSR_MHPMCOUNTER29]  = { "mhpmcounter29",  mctr,   read_hpmcounter,
>                                                         write_mhpmcounter },
> -    [CSR_MHPMCOUNTER30]  = { "mhpmcounter30",  mctr,    read_hpmcounter,
> +    [CSR_MHPMCOUNTER30]  = { "mhpmcounter30",  mctr,   read_hpmcounter,
>                                                         write_mhpmcounter },
> -    [CSR_MHPMCOUNTER31]  = { "mhpmcounter31",  mctr,    read_hpmcounter,
> +    [CSR_MHPMCOUNTER31]  = { "mhpmcounter31",  mctr,   read_hpmcounter,
>                                                         write_mhpmcounter },
>
> -    [CSR_MCOUNTINHIBIT]  = { "mcountinhibit",  any, read_mcountinhibit,
> +    [CSR_MCOUNTINHIBIT]  = { "mcountinhibit",  any,    read_mcountinhibit,
>                 write_mcountinhibit, .min_priv_ver = PRIV_VERSION_1_11_0  },
>
>      [CSR_MHPMEVENT3]     = { "mhpmevent3",     any,    read_mhpmevent,
> @@ -3891,63 +3921,63 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>      [CSR_HPMCOUNTER30H]  = { "hpmcounter30h",  ctr32,  read_hpmcounterh },
>      [CSR_HPMCOUNTER31H]  = { "hpmcounter31h",  ctr32,  read_hpmcounterh },
>
> -    [CSR_MHPMCOUNTER3H]  = { "mhpmcounter3h",  mctr32,  read_hpmcounterh,
> +    [CSR_MHPMCOUNTER3H]  = { "mhpmcounter3h",  mctr32, read_hpmcounterh,
>                                                         write_mhpmcounterh },
> -    [CSR_MHPMCOUNTER4H]  = { "mhpmcounter4h",  mctr32,  read_hpmcounterh,
> +    [CSR_MHPMCOUNTER4H]  = { "mhpmcounter4h",  mctr32, read_hpmcounterh,
>                                                         write_mhpmcounterh },
> -    [CSR_MHPMCOUNTER5H]  = { "mhpmcounter5h",  mctr32,  read_hpmcounterh,
> +    [CSR_MHPMCOUNTER5H]  = { "mhpmcounter5h",  mctr32, read_hpmcounterh,
>                                                         write_mhpmcounterh },
> -    [CSR_MHPMCOUNTER6H]  = { "mhpmcounter6h",  mctr32,  read_hpmcounterh,
> +    [CSR_MHPMCOUNTER6H]  = { "mhpmcounter6h",  mctr32, read_hpmcounterh,
>                                                         write_mhpmcounterh },
> -    [CSR_MHPMCOUNTER7H]  = { "mhpmcounter7h",  mctr32,  read_hpmcounterh,
> +    [CSR_MHPMCOUNTER7H]  = { "mhpmcounter7h",  mctr32, read_hpmcounterh,
>                                                         write_mhpmcounterh },
> -    [CSR_MHPMCOUNTER8H]  = { "mhpmcounter8h",  mctr32,  read_hpmcounterh,
> +    [CSR_MHPMCOUNTER8H]  = { "mhpmcounter8h",  mctr32, read_hpmcounterh,
>                                                         write_mhpmcounterh },
> -    [CSR_MHPMCOUNTER9H]  = { "mhpmcounter9h",  mctr32,  read_hpmcounterh,
> +    [CSR_MHPMCOUNTER9H]  = { "mhpmcounter9h",  mctr32, read_hpmcounterh,
>                                                         write_mhpmcounterh },
> -    [CSR_MHPMCOUNTER10H] = { "mhpmcounter10h", mctr32,  read_hpmcounterh,
> +    [CSR_MHPMCOUNTER10H] = { "mhpmcounter10h", mctr32, read_hpmcounterh,
>                                                         write_mhpmcounterh },
> -    [CSR_MHPMCOUNTER11H] = { "mhpmcounter11h", mctr32,  read_hpmcounterh,
> +    [CSR_MHPMCOUNTER11H] = { "mhpmcounter11h", mctr32, read_hpmcounterh,
>                                                         write_mhpmcounterh },
> -    [CSR_MHPMCOUNTER12H] = { "mhpmcounter12h", mctr32,  read_hpmcounterh,
> +    [CSR_MHPMCOUNTER12H] = { "mhpmcounter12h", mctr32, read_hpmcounterh,
>                                                         write_mhpmcounterh },
> -    [CSR_MHPMCOUNTER13H] = { "mhpmcounter13h", mctr32,  read_hpmcounterh,
> +    [CSR_MHPMCOUNTER13H] = { "mhpmcounter13h", mctr32, read_hpmcounterh,
>                                                         write_mhpmcounterh },
> -    [CSR_MHPMCOUNTER14H] = { "mhpmcounter14h", mctr32,  read_hpmcounterh,
> +    [CSR_MHPMCOUNTER14H] = { "mhpmcounter14h", mctr32, read_hpmcounterh,
>                                                         write_mhpmcounterh },
> -    [CSR_MHPMCOUNTER15H] = { "mhpmcounter15h", mctr32,  read_hpmcounterh,
> +    [CSR_MHPMCOUNTER15H] = { "mhpmcounter15h", mctr32, read_hpmcounterh,
>                                                         write_mhpmcounterh },
> -    [CSR_MHPMCOUNTER16H] = { "mhpmcounter16h", mctr32,  read_hpmcounterh,
> +    [CSR_MHPMCOUNTER16H] = { "mhpmcounter16h", mctr32, read_hpmcounterh,
>                                                         write_mhpmcounterh },
> -    [CSR_MHPMCOUNTER17H] = { "mhpmcounter17h", mctr32,  read_hpmcounterh,
> +    [CSR_MHPMCOUNTER17H] = { "mhpmcounter17h", mctr32, read_hpmcounterh,
>                                                         write_mhpmcounterh },
> -    [CSR_MHPMCOUNTER18H] = { "mhpmcounter18h", mctr32,  read_hpmcounterh,
> +    [CSR_MHPMCOUNTER18H] = { "mhpmcounter18h", mctr32, read_hpmcounterh,
>                                                         write_mhpmcounterh },
> -    [CSR_MHPMCOUNTER19H] = { "mhpmcounter19h", mctr32,  read_hpmcounterh,
> +    [CSR_MHPMCOUNTER19H] = { "mhpmcounter19h", mctr32, read_hpmcounterh,
>                                                         write_mhpmcounterh },
> -    [CSR_MHPMCOUNTER20H] = { "mhpmcounter20h", mctr32,  read_hpmcounterh,
> +    [CSR_MHPMCOUNTER20H] = { "mhpmcounter20h", mctr32, read_hpmcounterh,
>                                                         write_mhpmcounterh },
> -    [CSR_MHPMCOUNTER21H] = { "mhpmcounter21h", mctr32,  read_hpmcounterh,
> +    [CSR_MHPMCOUNTER21H] = { "mhpmcounter21h", mctr32, read_hpmcounterh,
>                                                         write_mhpmcounterh },
> -    [CSR_MHPMCOUNTER22H] = { "mhpmcounter22h", mctr32,  read_hpmcounterh,
> +    [CSR_MHPMCOUNTER22H] = { "mhpmcounter22h", mctr32, read_hpmcounterh,
>                                                         write_mhpmcounterh },
> -    [CSR_MHPMCOUNTER23H] = { "mhpmcounter23h", mctr32,  read_hpmcounterh,
> +    [CSR_MHPMCOUNTER23H] = { "mhpmcounter23h", mctr32, read_hpmcounterh,
>                                                         write_mhpmcounterh },
> -    [CSR_MHPMCOUNTER24H] = { "mhpmcounter24h", mctr32,  read_hpmcounterh,
> +    [CSR_MHPMCOUNTER24H] = { "mhpmcounter24h", mctr32, read_hpmcounterh,
>                                                         write_mhpmcounterh },
> -    [CSR_MHPMCOUNTER25H] = { "mhpmcounter25h", mctr32,  read_hpmcounterh,
> +    [CSR_MHPMCOUNTER25H] = { "mhpmcounter25h", mctr32, read_hpmcounterh,
>                                                         write_mhpmcounterh },
> -    [CSR_MHPMCOUNTER26H] = { "mhpmcounter26h", mctr32,  read_hpmcounterh,
> +    [CSR_MHPMCOUNTER26H] = { "mhpmcounter26h", mctr32, read_hpmcounterh,
>                                                         write_mhpmcounterh },
> -    [CSR_MHPMCOUNTER27H] = { "mhpmcounter27h", mctr32,  read_hpmcounterh,
> +    [CSR_MHPMCOUNTER27H] = { "mhpmcounter27h", mctr32, read_hpmcounterh,
>                                                         write_mhpmcounterh },
> -    [CSR_MHPMCOUNTER28H] = { "mhpmcounter28h", mctr32,  read_hpmcounterh,
> +    [CSR_MHPMCOUNTER28H] = { "mhpmcounter28h", mctr32, read_hpmcounterh,
>                                                         write_mhpmcounterh },
> -    [CSR_MHPMCOUNTER29H] = { "mhpmcounter29h", mctr32,  read_hpmcounterh,
> +    [CSR_MHPMCOUNTER29H] = { "mhpmcounter29h", mctr32, read_hpmcounterh,
>                                                         write_mhpmcounterh },
> -    [CSR_MHPMCOUNTER30H] = { "mhpmcounter30h", mctr32,  read_hpmcounterh,
> +    [CSR_MHPMCOUNTER30H] = { "mhpmcounter30h", mctr32, read_hpmcounterh,
>                                                         write_mhpmcounterh },
> -    [CSR_MHPMCOUNTER31H] = { "mhpmcounter31h", mctr32,  read_hpmcounterh,
> +    [CSR_MHPMCOUNTER31H] = { "mhpmcounter31h", mctr32, read_hpmcounterh,
>                                                         write_mhpmcounterh },
>  #endif /* !CONFIG_USER_ONLY */
>  };
> --
> 2.17.1
>
>

