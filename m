Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oGps4-0007oj-40
	for mharc-qemu-riscv@gnu.org; Wed, 27 Jul 2022 18:51:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oGprx-0007kF-Ku
 for qemu-riscv@nongnu.org; Wed, 27 Jul 2022 18:51:11 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:43558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oGprt-0001Vk-E8
 for qemu-riscv@nongnu.org; Wed, 27 Jul 2022 18:51:07 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 o5-20020a17090a3d4500b001ef76490983so418710pjf.2
 for <qemu-riscv@nongnu.org>; Wed, 27 Jul 2022 15:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MtTEMVJkplxLfUhsfoZCSFaTTEY+xCkVAmrmFE+HlZg=;
 b=Gwm3ngSf4A+TAi6mTkM3Fop+m3XeKL0U/bA212rm07d26hI/JZQ/vmMMXQL3h+Onqd
 2q0ZcGRPEQGVnCK9v45eyboOGOB6gn5dGZCVlio38yqKT9N4X+rsQMXoATFnmjkaN54M
 zxsin6uQ7BkLntdauj0I3410JGrh6peKL4yq9MLyU8TS6SFWxV2xGTWD97d/ju1KBRWn
 dIozHPA5NWNHgpIyIA6y5Qh+wzN9MgKu0EXl6cWC/M0cFfmTXmhK4PxEAGEbkH0R7xLQ
 GuvlL36IQjCVWcbyzMoFadsx2AwD94ZICVH7jxPeO4dKgZQDAqbzKDDwfeKslv+A2RUK
 dCBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MtTEMVJkplxLfUhsfoZCSFaTTEY+xCkVAmrmFE+HlZg=;
 b=U2UNmDy9VNjy4EEmdezBxzupAKsAReEfpiVasbpqlCyLN9fr5J33HBWzkMP9f7+8SI
 4Z1PLBGKtfoirxGxfYGAAlJvO3U6YvvkoqhMiQvJBDBccsxSbaUIKCMgnKQNkdqnkgpk
 79G90TWt4SusVxdJH9AadbKjSLB3wsfIBFf/QJghv69VNMb8OAjA6ThYLlXA5QDe3XuX
 /MPa/v4FamCU7XTMciI0WTl/NMcH1a9NLMKltL7w7SfqStwdu025+Rc7tkaR/l45S3lH
 t9wxsPIothC9Hhb0+GuSlcBYvyjpItAxDcHqiFjVxFeBWf+4sg2Deu/6/u/81alv7T5K
 MW5g==
X-Gm-Message-State: AJIora/vFK/nwpiyMawJEhuMXlp5woa3VGFJjiyuSMxcSNvcholjzZuK
 bXdhVm4HNPgIp8J5AhTyAIk3Mae6swfgAHFd+vPySA==
X-Google-Smtp-Source: AGRyM1t0oM+MjsGhLatbGKtGb5IHdt71LEEGCS3F9ZhaHhBZ1idJlRhAOWvqPBtEZh2+Zx9dPj3/oGfXpY40PEfdDc4=
X-Received: by 2002:a17:902:b58e:b0:16c:489e:7a0b with SMTP id
 a14-20020a170902b58e00b0016c489e7a0bmr24023985pls.145.1658962263845; Wed, 27
 Jul 2022 15:51:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220727064913.1041427-1-atishp@rivosinc.com>
 <20220727064913.1041427-6-atishp@rivosinc.com>
 <1293559b-9c4e-4162-6453-28e7c51e85a2@iscas.ac.cn>
In-Reply-To: <1293559b-9c4e-4162-6453-28e7c51e85a2@iscas.ac.cn>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Wed, 27 Jul 2022 15:50:53 -0700
Message-ID: <CAHBxVyF_msaV9=86QnaUY4FJkr4HATd8Cs8c2sB-QRvwavTzOA@mail.gmail.com>
Subject: Re: [PATCH v11 5/6] target/riscv: Update the privilege field for
 sscofpmf CSRs
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000006ec53f05e4d1408a"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=atishp@rivosinc.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Wed, 27 Jul 2022 22:51:11 -0000

--0000000000006ec53f05e4d1408a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 27, 2022 at 1:27 AM Weiwei Li <liweiwei@iscas.ac.cn> wrote:

>
> =E5=9C=A8 2022/7/27 =E4=B8=8B=E5=8D=882:49, Atish Patra =E5=86=99=E9=81=
=93:
> > The sscofpmf extension was ratified as a part of priv spec v1.12.
> > Mark the csr_ops accordingly.
> >
> > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > ---
> >   target/riscv/csr.c | 90 ++++++++++++++++++++++++++++++---------------=
-
> >   1 file changed, 60 insertions(+), 30 deletions(-)
> >
> > diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> > index 57dbbf9b09a0..ec6d7f022ad5 100644
> > --- a/target/riscv/csr.c
> > +++ b/target/riscv/csr.c
> > @@ -3859,63 +3859,92 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =
=3D {
> >                                                          write_mhpmeven=
t
> },
> >
> >       [CSR_MHPMEVENT3H]    =3D { "mhpmevent3h",    sscofpmf,
> read_mhpmeventh,
> > -
>  write_mhpmeventh},
> > +
> write_mhpmeventh,
> > +                                         .min_priv_ver =3D
> PRIV_VERSION_1_12_0 },
>
> Similar to the first commit, it's better to align with the first element
> "mhpmevent3h" .Otherwise,
>
>
Fixed it. Thanks for the review.


> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
>
> Regards,
>
> Weiwei Li
>
> >       [CSR_MHPMEVENT4H]    =3D { "mhpmevent4h",    sscofpmf,
> read_mhpmeventh,
> > -
>  write_mhpmeventh},
> > +
> write_mhpmeventh,
> > +                                         .min_priv_ver =3D
> PRIV_VERSION_1_12_0 },
> >       [CSR_MHPMEVENT5H]    =3D { "mhpmevent5h",    sscofpmf,
> read_mhpmeventh,
> > -
>  write_mhpmeventh},
> > +
> write_mhpmeventh,
> > +                                         .min_priv_ver =3D
> PRIV_VERSION_1_12_0 },
> >       [CSR_MHPMEVENT6H]    =3D { "mhpmevent6h",    sscofpmf,
> read_mhpmeventh,
> > -
>  write_mhpmeventh},
> > +
> write_mhpmeventh,
> > +                                         .min_priv_ver =3D
> PRIV_VERSION_1_12_0 },
> >       [CSR_MHPMEVENT7H]    =3D { "mhpmevent7h",    sscofpmf,
> read_mhpmeventh,
> > -
>  write_mhpmeventh},
> > +
> write_mhpmeventh,
> > +                                         .min_priv_ver =3D
> PRIV_VERSION_1_12_0 },
> >       [CSR_MHPMEVENT8H]    =3D { "mhpmevent8h",    sscofpmf,
> read_mhpmeventh,
> > -
>  write_mhpmeventh},
> > +
> write_mhpmeventh,
> > +                                         .min_priv_ver =3D
> PRIV_VERSION_1_12_0 },
> >       [CSR_MHPMEVENT9H]    =3D { "mhpmevent9h",    sscofpmf,
> read_mhpmeventh,
> > -
>  write_mhpmeventh},
> > +
> write_mhpmeventh,
> > +                                         .min_priv_ver =3D
> PRIV_VERSION_1_12_0 },
> >       [CSR_MHPMEVENT10H]   =3D { "mhpmevent10h",    sscofpmf,
> read_mhpmeventh,
> > -
>  write_mhpmeventh},
> > +
>  write_mhpmeventh,
> > +                                         .min_priv_ver =3D
> PRIV_VERSION_1_12_0 },
> >       [CSR_MHPMEVENT11H]   =3D { "mhpmevent11h",    sscofpmf,
> read_mhpmeventh,
> > -
>  write_mhpmeventh},
> > +
>  write_mhpmeventh,
> > +                                         .min_priv_ver =3D
> PRIV_VERSION_1_12_0 },
> >       [CSR_MHPMEVENT12H]   =3D { "mhpmevent12h",    sscofpmf,
> read_mhpmeventh,
> > -
>  write_mhpmeventh},
> > +
>  write_mhpmeventh,
> > +                                         .min_priv_ver =3D
> PRIV_VERSION_1_12_0 },
> >       [CSR_MHPMEVENT13H]   =3D { "mhpmevent13h",    sscofpmf,
> read_mhpmeventh,
> > -
>  write_mhpmeventh},
> > +
>  write_mhpmeventh,
> > +                                         .min_priv_ver =3D
> PRIV_VERSION_1_12_0 },
> >       [CSR_MHPMEVENT14H]   =3D { "mhpmevent14h",    sscofpmf,
> read_mhpmeventh,
> > -
>  write_mhpmeventh},
> > +
>  write_mhpmeventh,
> > +                                         .min_priv_ver =3D
> PRIV_VERSION_1_12_0 },
> >       [CSR_MHPMEVENT15H]   =3D { "mhpmevent15h",    sscofpmf,
> read_mhpmeventh,
> > -
>  write_mhpmeventh},
> > +
>  write_mhpmeventh,
> > +                                         .min_priv_ver =3D
> PRIV_VERSION_1_12_0 },
> >       [CSR_MHPMEVENT16H]   =3D { "mhpmevent16h",    sscofpmf,
> read_mhpmeventh,
> > -
>  write_mhpmeventh},
> > +
>  write_mhpmeventh,
> > +                                         .min_priv_ver =3D
> PRIV_VERSION_1_12_0 },
> >       [CSR_MHPMEVENT17H]   =3D { "mhpmevent17h",    sscofpmf,
> read_mhpmeventh,
> > -
>  write_mhpmeventh},
> > +
>  write_mhpmeventh,
> > +                                         .min_priv_ver =3D
> PRIV_VERSION_1_12_0 },
> >       [CSR_MHPMEVENT18H]   =3D { "mhpmevent18h",    sscofpmf,
> read_mhpmeventh,
> > -
>  write_mhpmeventh},
> > +
>  write_mhpmeventh,
> > +                                         .min_priv_ver =3D
> PRIV_VERSION_1_12_0 },
> >       [CSR_MHPMEVENT19H]   =3D { "mhpmevent19h",    sscofpmf,
> read_mhpmeventh,
> > -
>  write_mhpmeventh},
> > +
>  write_mhpmeventh,
> > +                                         .min_priv_ver =3D
> PRIV_VERSION_1_12_0 },
> >       [CSR_MHPMEVENT20H]   =3D { "mhpmevent20h",    sscofpmf,
> read_mhpmeventh,
> > -
>  write_mhpmeventh},
> > +
>  write_mhpmeventh,
> > +                                         .min_priv_ver =3D
> PRIV_VERSION_1_12_0 },
> >       [CSR_MHPMEVENT21H]   =3D { "mhpmevent21h",    sscofpmf,
> read_mhpmeventh,
> > -
>  write_mhpmeventh},
> > +
>  write_mhpmeventh,
> > +                                         .min_priv_ver =3D
> PRIV_VERSION_1_12_0 },
> >       [CSR_MHPMEVENT22H]   =3D { "mhpmevent22h",    sscofpmf,
> read_mhpmeventh,
> > -
>  write_mhpmeventh},
> > +
>  write_mhpmeventh,
> > +                                         .min_priv_ver =3D
> PRIV_VERSION_1_12_0 },
> >       [CSR_MHPMEVENT23H]   =3D { "mhpmevent23h",    sscofpmf,
> read_mhpmeventh,
> > -
>  write_mhpmeventh},
> > +
>  write_mhpmeventh,
> > +                                         .min_priv_ver =3D
> PRIV_VERSION_1_12_0 },
> >       [CSR_MHPMEVENT24H]   =3D { "mhpmevent24h",    sscofpmf,
> read_mhpmeventh,
> > -
>  write_mhpmeventh},
> > +
>  write_mhpmeventh,
> > +                                         .min_priv_ver =3D
> PRIV_VERSION_1_12_0 },
> >       [CSR_MHPMEVENT25H]   =3D { "mhpmevent25h",    sscofpmf,
> read_mhpmeventh,
> > -
>  write_mhpmeventh},
> > +
>  write_mhpmeventh,
> > +                                         .min_priv_ver =3D
> PRIV_VERSION_1_12_0 },
> >       [CSR_MHPMEVENT26H]   =3D { "mhpmevent26h",    sscofpmf,
> read_mhpmeventh,
> > -
>  write_mhpmeventh},
> > +
>  write_mhpmeventh,
> > +                                         .min_priv_ver =3D
> PRIV_VERSION_1_12_0 },
> >       [CSR_MHPMEVENT27H]   =3D { "mhpmevent27h",    sscofpmf,
> read_mhpmeventh,
> > -
>  write_mhpmeventh},
> > +
>  write_mhpmeventh,
> > +                                         .min_priv_ver =3D
> PRIV_VERSION_1_12_0 },
> >       [CSR_MHPMEVENT28H]   =3D { "mhpmevent28h",    sscofpmf,
> read_mhpmeventh,
> > -
>  write_mhpmeventh},
> > +
>  write_mhpmeventh,
> > +                                         .min_priv_ver =3D
> PRIV_VERSION_1_12_0 },
> >       [CSR_MHPMEVENT29H]   =3D { "mhpmevent29h",    sscofpmf,
> read_mhpmeventh,
> > -
>  write_mhpmeventh},
> > +
>  write_mhpmeventh,
> > +                                         .min_priv_ver =3D
> PRIV_VERSION_1_12_0 },
> >       [CSR_MHPMEVENT30H]   =3D { "mhpmevent30h",    sscofpmf,
> read_mhpmeventh,
> > -
>  write_mhpmeventh},
> > +
>  write_mhpmeventh,
> > +                                         .min_priv_ver =3D
> PRIV_VERSION_1_12_0 },
> >       [CSR_MHPMEVENT31H]   =3D { "mhpmevent31h",    sscofpmf,
> read_mhpmeventh,
> > -
>  write_mhpmeventh},
> > +
>  write_mhpmeventh,
> > +                                         .min_priv_ver =3D
> PRIV_VERSION_1_12_0 },
> >
> >       [CSR_HPMCOUNTER3H]   =3D { "hpmcounter3h",   ctr32,
> read_hpmcounterh },
> >       [CSR_HPMCOUNTER4H]   =3D { "hpmcounter4h",   ctr32,
> read_hpmcounterh },
> > @@ -4005,7 +4034,8 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D =
{
> >
> write_mhpmcounterh },
> >       [CSR_MHPMCOUNTER31H] =3D { "mhpmcounter31h", mctr32,
> read_hpmcounterh,
> >
> write_mhpmcounterh },
> > -    [CSR_SCOUNTOVF]      =3D { "scountovf", sscofpmf,  read_scountovf =
},
> > +    [CSR_SCOUNTOVF]      =3D { "scountovf", sscofpmf,  read_scountovf,
> > +                                         .min_priv_ver =3D
> PRIV_VERSION_1_12_0 },
> >
> >   #endif /* !CONFIG_USER_ONLY */
> >   };
>
>

--0000000000006ec53f05e4d1408a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGJyPjwvZGl2Pjxicj48ZGl2IGNsYXNzPSJn
bWFpbF9xdW90ZSI+PGRpdiBkaXI9Imx0ciIgY2xhc3M9ImdtYWlsX2F0dHIiPk9uIFdlZCwgSnVs
IDI3LCAyMDIyIGF0IDE6MjcgQU0gV2Vpd2VpIExpICZsdDs8YSBocmVmPSJtYWlsdG86bGl3ZWl3
ZWlAaXNjYXMuYWMuY24iPmxpd2Vpd2VpQGlzY2FzLmFjLmNuPC9hPiZndDsgd3JvdGU6PGJyPjwv
ZGl2PjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowcHggMHB4
IDBweCAwLjhleDtib3JkZXItbGVmdDoxcHggc29saWQgcmdiKDIwNCwyMDQsMjA0KTtwYWRkaW5n
LWxlZnQ6MWV4Ij48YnI+DQrlnKggMjAyMi83LzI3IOS4i+WNiDI6NDksIEF0aXNoIFBhdHJhIOWG
memBkzo8YnI+DQomZ3Q7IFRoZSBzc2NvZnBtZiBleHRlbnNpb24gd2FzIHJhdGlmaWVkIGFzIGEg
cGFydCBvZiBwcml2IHNwZWMgdjEuMTIuPGJyPg0KJmd0OyBNYXJrIHRoZSBjc3Jfb3BzIGFjY29y
ZGluZ2x5Ljxicj4NCiZndDs8YnI+DQomZ3Q7IFJldmlld2VkLWJ5OiBBbGlzdGFpciBGcmFuY2lz
ICZsdDs8YSBocmVmPSJtYWlsdG86YWxpc3RhaXIuZnJhbmNpc0B3ZGMuY29tIiB0YXJnZXQ9Il9i
bGFuayI+YWxpc3RhaXIuZnJhbmNpc0B3ZGMuY29tPC9hPiZndDs8YnI+DQomZ3Q7IFNpZ25lZC1v
ZmYtYnk6IEF0aXNoIFBhdHJhICZsdDs8YSBocmVmPSJtYWlsdG86YXRpc2hwQHJpdm9zaW5jLmNv
bSIgdGFyZ2V0PSJfYmxhbmsiPmF0aXNocEByaXZvc2luYy5jb208L2E+Jmd0Ozxicj4NCiZndDsg
LS0tPGJyPg0KJmd0O8KgIMKgdGFyZ2V0L3Jpc2N2L2Nzci5jIHwgOTAgKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLTxicj4NCiZndDvCoCDCoDEgZmlsZSBjaGFu
Z2VkLCA2MCBpbnNlcnRpb25zKCspLCAzMCBkZWxldGlvbnMoLSk8YnI+DQomZ3Q7PGJyPg0KJmd0
OyBkaWZmIC0tZ2l0IGEvdGFyZ2V0L3Jpc2N2L2Nzci5jIGIvdGFyZ2V0L3Jpc2N2L2Nzci5jPGJy
Pg0KJmd0OyBpbmRleCA1N2RiYmY5YjA5YTAuLmVjNmQ3ZjAyMmFkNSAxMDA2NDQ8YnI+DQomZ3Q7
IC0tLSBhL3RhcmdldC9yaXNjdi9jc3IuYzxicj4NCiZndDsgKysrIGIvdGFyZ2V0L3Jpc2N2L2Nz
ci5jPGJyPg0KJmd0OyBAQCAtMzg1OSw2MyArMzg1OSw5MiBAQCByaXNjdl9jc3Jfb3BlcmF0aW9u
cyBjc3Jfb3BzW0NTUl9UQUJMRV9TSVpFXSA9IHs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgd3JpdGVfbWhwbWV2ZW50IH0sPGJyPg0KJmd0O8KgIMKgPGJyPg0KJmd0O8Kg
IMKgIMKgIMKgW0NTUl9NSFBNRVZFTlQzSF3CoCDCoCA9IHsgJnF1b3Q7bWhwbWV2ZW50M2gmcXVv
dDsswqAgwqAgc3Njb2ZwbWYswqAgcmVhZF9taHBtZXZlbnRoLDxicj4NCiZndDsgLcKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgd3JpdGVfbWhwbWV2ZW50aH0sPGJyPg0KJmd0OyArwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgd3JpdGVfbWhwbWV2ZW50aCw8YnI+DQomZ3Q7ICvCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoC5t
aW5fcHJpdl92ZXIgPSBQUklWX1ZFUlNJT05fMV8xMl8wIH0sPGJyPg0KPGJyPg0KU2ltaWxhciB0
byB0aGUgZmlyc3QgY29tbWl0LCBpdCYjMzk7cyBiZXR0ZXIgdG8gYWxpZ24gd2l0aCB0aGUgZmly
c3QgZWxlbWVudCA8YnI+DQomcXVvdDttaHBtZXZlbnQzaCZxdW90OyAuT3RoZXJ3aXNlLDxicj4N
Cjxicj48L2Jsb2NrcXVvdGU+PGRpdj48YnI+PC9kaXY+PGRpdj5GaXhlZCBpdC4gVGhhbmtzIGZv
ciB0aGUgcmV2aWV3LjwvZGl2PjxkaXY+wqA8L2Rpdj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxf
cXVvdGUiIHN0eWxlPSJtYXJnaW46MHB4IDBweCAwcHggMC44ZXg7Ym9yZGVyLWxlZnQ6MXB4IHNv
bGlkIHJnYigyMDQsMjA0LDIwNCk7cGFkZGluZy1sZWZ0OjFleCI+DQpSZXZpZXdlZC1ieTogV2Vp
d2VpIExpICZsdDs8YSBocmVmPSJtYWlsdG86bGl3ZWl3ZWlAaXNjYXMuYWMuY24iIHRhcmdldD0i
X2JsYW5rIj5saXdlaXdlaUBpc2Nhcy5hYy5jbjwvYT4mZ3Q7PGJyPg0KPGJyPg0KUmVnYXJkcyw8
YnI+DQo8YnI+DQpXZWl3ZWkgTGk8YnI+DQo8YnI+DQomZ3Q7wqAgwqAgwqAgwqBbQ1NSX01IUE1F
VkVOVDRIXcKgIMKgID0geyAmcXVvdDttaHBtZXZlbnQ0aCZxdW90OyzCoCDCoCBzc2NvZnBtZizC
oCByZWFkX21ocG1ldmVudGgsPGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB3
cml0ZV9taHBtZXZlbnRofSw8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCB3cml0ZV9taHBtZXZlbnRoLDxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgLm1pbl9wcml2X3ZlciA9IFBSSVZf
VkVSU0lPTl8xXzEyXzAgfSw8YnI+DQomZ3Q7wqAgwqAgwqAgwqBbQ1NSX01IUE1FVkVOVDVIXcKg
IMKgID0geyAmcXVvdDttaHBtZXZlbnQ1aCZxdW90OyzCoCDCoCBzc2NvZnBtZizCoCByZWFkX21o
cG1ldmVudGgsPGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB3cml0ZV9taHBt
ZXZlbnRofSw8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB3cml0ZV9t
aHBtZXZlbnRoLDxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgLm1pbl9wcml2X3ZlciA9IFBSSVZfVkVSU0lPTl8x
XzEyXzAgfSw8YnI+DQomZ3Q7wqAgwqAgwqAgwqBbQ1NSX01IUE1FVkVOVDZIXcKgIMKgID0geyAm
cXVvdDttaHBtZXZlbnQ2aCZxdW90OyzCoCDCoCBzc2NvZnBtZizCoCByZWFkX21ocG1ldmVudGgs
PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB3cml0ZV9taHBtZXZlbnRofSw8
YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB3cml0ZV9taHBtZXZlbnRo
LDxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgLm1pbl9wcml2X3ZlciA9IFBSSVZfVkVSU0lPTl8xXzEyXzAgfSw8
YnI+DQomZ3Q7wqAgwqAgwqAgwqBbQ1NSX01IUE1FVkVOVDdIXcKgIMKgID0geyAmcXVvdDttaHBt
ZXZlbnQ3aCZxdW90OyzCoCDCoCBzc2NvZnBtZizCoCByZWFkX21ocG1ldmVudGgsPGJyPg0KJmd0
OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB3cml0ZV9taHBtZXZlbnRofSw8YnI+DQomZ3Q7
ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB3cml0ZV9taHBtZXZlbnRoLDxicj4NCiZn
dDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgLm1pbl9wcml2X3ZlciA9IFBSSVZfVkVSU0lPTl8xXzEyXzAgfSw8YnI+DQomZ3Q7
wqAgwqAgwqAgwqBbQ1NSX01IUE1FVkVOVDhIXcKgIMKgID0geyAmcXVvdDttaHBtZXZlbnQ4aCZx
dW90OyzCoCDCoCBzc2NvZnBtZizCoCByZWFkX21ocG1ldmVudGgsPGJyPg0KJmd0OyAtwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqB3cml0ZV9taHBtZXZlbnRofSw8YnI+DQomZ3Q7ICvCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB3cml0ZV9taHBtZXZlbnRoLDxicj4NCiZndDsgK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
Lm1pbl9wcml2X3ZlciA9IFBSSVZfVkVSU0lPTl8xXzEyXzAgfSw8YnI+DQomZ3Q7wqAgwqAgwqAg
wqBbQ1NSX01IUE1FVkVOVDlIXcKgIMKgID0geyAmcXVvdDttaHBtZXZlbnQ5aCZxdW90OyzCoCDC
oCBzc2NvZnBtZizCoCByZWFkX21ocG1ldmVudGgsPGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqB3cml0ZV9taHBtZXZlbnRofSw8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCB3cml0ZV9taHBtZXZlbnRoLDxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgLm1pbl9wcml2
X3ZlciA9IFBSSVZfVkVSU0lPTl8xXzEyXzAgfSw8YnI+DQomZ3Q7wqAgwqAgwqAgwqBbQ1NSX01I
UE1FVkVOVDEwSF3CoCDCoD0geyAmcXVvdDttaHBtZXZlbnQxMGgmcXVvdDsswqAgwqAgc3Njb2Zw
bWYswqAgcmVhZF9taHBtZXZlbnRoLDxicj4NCiZndDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgd3JpdGVfbWhwbWV2ZW50aH0sPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqB3cml0ZV9taHBtZXZlbnRoLDxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgLm1pbl9wcml2X3ZlciA9
IFBSSVZfVkVSU0lPTl8xXzEyXzAgfSw8YnI+DQomZ3Q7wqAgwqAgwqAgwqBbQ1NSX01IUE1FVkVO
VDExSF3CoCDCoD0geyAmcXVvdDttaHBtZXZlbnQxMWgmcXVvdDsswqAgwqAgc3Njb2ZwbWYswqAg
cmVhZF9taHBtZXZlbnRoLDxicj4NCiZndDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgd3Jp
dGVfbWhwbWV2ZW50aH0sPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqB3cml0ZV9taHBtZXZlbnRoLDxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgLm1pbl9wcml2X3ZlciA9IFBSSVZf
VkVSU0lPTl8xXzEyXzAgfSw8YnI+DQomZ3Q7wqAgwqAgwqAgwqBbQ1NSX01IUE1FVkVOVDEySF3C
oCDCoD0geyAmcXVvdDttaHBtZXZlbnQxMmgmcXVvdDsswqAgwqAgc3Njb2ZwbWYswqAgcmVhZF9t
aHBtZXZlbnRoLDxicj4NCiZndDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgd3JpdGVfbWhw
bWV2ZW50aH0sPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB3cml0
ZV9taHBtZXZlbnRoLDxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgLm1pbl9wcml2X3ZlciA9IFBSSVZfVkVSU0lP
Tl8xXzEyXzAgfSw8YnI+DQomZ3Q7wqAgwqAgwqAgwqBbQ1NSX01IUE1FVkVOVDEzSF3CoCDCoD0g
eyAmcXVvdDttaHBtZXZlbnQxM2gmcXVvdDsswqAgwqAgc3Njb2ZwbWYswqAgcmVhZF9taHBtZXZl
bnRoLDxicj4NCiZndDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgd3JpdGVfbWhwbWV2ZW50
aH0sPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB3cml0ZV9taHBt
ZXZlbnRoLDxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgLm1pbl9wcml2X3ZlciA9IFBSSVZfVkVSU0lPTl8xXzEy
XzAgfSw8YnI+DQomZ3Q7wqAgwqAgwqAgwqBbQ1NSX01IUE1FVkVOVDE0SF3CoCDCoD0geyAmcXVv
dDttaHBtZXZlbnQxNGgmcXVvdDsswqAgwqAgc3Njb2ZwbWYswqAgcmVhZF9taHBtZXZlbnRoLDxi
cj4NCiZndDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgd3JpdGVfbWhwbWV2ZW50aH0sPGJy
Pg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB3cml0ZV9taHBtZXZlbnRo
LDxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgLm1pbl9wcml2X3ZlciA9IFBSSVZfVkVSU0lPTl8xXzEyXzAgfSw8
YnI+DQomZ3Q7wqAgwqAgwqAgwqBbQ1NSX01IUE1FVkVOVDE1SF3CoCDCoD0geyAmcXVvdDttaHBt
ZXZlbnQxNWgmcXVvdDsswqAgwqAgc3Njb2ZwbWYswqAgcmVhZF9taHBtZXZlbnRoLDxicj4NCiZn
dDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgd3JpdGVfbWhwbWV2ZW50aH0sPGJyPg0KJmd0
OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB3cml0ZV9taHBtZXZlbnRoLDxicj4N
CiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgLm1pbl9wcml2X3ZlciA9IFBSSVZfVkVSU0lPTl8xXzEyXzAgfSw8YnI+DQom
Z3Q7wqAgwqAgwqAgwqBbQ1NSX01IUE1FVkVOVDE2SF3CoCDCoD0geyAmcXVvdDttaHBtZXZlbnQx
NmgmcXVvdDsswqAgwqAgc3Njb2ZwbWYswqAgcmVhZF9taHBtZXZlbnRoLDxicj4NCiZndDsgLcKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgd3JpdGVfbWhwbWV2ZW50aH0sPGJyPg0KJmd0OyArwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB3cml0ZV9taHBtZXZlbnRoLDxicj4NCiZndDsg
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgLm1pbl9wcml2X3ZlciA9IFBSSVZfVkVSU0lPTl8xXzEyXzAgfSw8YnI+DQomZ3Q7wqAg
wqAgwqAgwqBbQ1NSX01IUE1FVkVOVDE3SF3CoCDCoD0geyAmcXVvdDttaHBtZXZlbnQxN2gmcXVv
dDsswqAgwqAgc3Njb2ZwbWYswqAgcmVhZF9taHBtZXZlbnRoLDxicj4NCiZndDsgLcKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgd3JpdGVfbWhwbWV2ZW50aH0sPGJyPg0KJmd0OyArwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB3cml0ZV9taHBtZXZlbnRoLDxicj4NCiZndDsgK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
Lm1pbl9wcml2X3ZlciA9IFBSSVZfVkVSU0lPTl8xXzEyXzAgfSw8YnI+DQomZ3Q7wqAgwqAgwqAg
wqBbQ1NSX01IUE1FVkVOVDE4SF3CoCDCoD0geyAmcXVvdDttaHBtZXZlbnQxOGgmcXVvdDsswqAg
wqAgc3Njb2ZwbWYswqAgcmVhZF9taHBtZXZlbnRoLDxicj4NCiZndDsgLcKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgd3JpdGVfbWhwbWV2ZW50aH0sPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqB3cml0ZV9taHBtZXZlbnRoLDxicj4NCiZndDsgK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgLm1pbl9w
cml2X3ZlciA9IFBSSVZfVkVSU0lPTl8xXzEyXzAgfSw8YnI+DQomZ3Q7wqAgwqAgwqAgwqBbQ1NS
X01IUE1FVkVOVDE5SF3CoCDCoD0geyAmcXVvdDttaHBtZXZlbnQxOWgmcXVvdDsswqAgwqAgc3Nj
b2ZwbWYswqAgcmVhZF9taHBtZXZlbnRoLDxicj4NCiZndDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgd3JpdGVfbWhwbWV2ZW50aH0sPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqB3cml0ZV9taHBtZXZlbnRoLDxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgLm1pbl9wcml2X3Zl
ciA9IFBSSVZfVkVSU0lPTl8xXzEyXzAgfSw8YnI+DQomZ3Q7wqAgwqAgwqAgwqBbQ1NSX01IUE1F
VkVOVDIwSF3CoCDCoD0geyAmcXVvdDttaHBtZXZlbnQyMGgmcXVvdDsswqAgwqAgc3Njb2ZwbWYs
wqAgcmVhZF9taHBtZXZlbnRoLDxicj4NCiZndDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
d3JpdGVfbWhwbWV2ZW50aH0sPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqB3cml0ZV9taHBtZXZlbnRoLDxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgLm1pbl9wcml2X3ZlciA9IFBS
SVZfVkVSU0lPTl8xXzEyXzAgfSw8YnI+DQomZ3Q7wqAgwqAgwqAgwqBbQ1NSX01IUE1FVkVOVDIx
SF3CoCDCoD0geyAmcXVvdDttaHBtZXZlbnQyMWgmcXVvdDsswqAgwqAgc3Njb2ZwbWYswqAgcmVh
ZF9taHBtZXZlbnRoLDxicj4NCiZndDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgd3JpdGVf
bWhwbWV2ZW50aH0sPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB3
cml0ZV9taHBtZXZlbnRoLDxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgLm1pbl9wcml2X3ZlciA9IFBSSVZfVkVS
U0lPTl8xXzEyXzAgfSw8YnI+DQomZ3Q7wqAgwqAgwqAgwqBbQ1NSX01IUE1FVkVOVDIySF3CoCDC
oD0geyAmcXVvdDttaHBtZXZlbnQyMmgmcXVvdDsswqAgwqAgc3Njb2ZwbWYswqAgcmVhZF9taHBt
ZXZlbnRoLDxicj4NCiZndDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgd3JpdGVfbWhwbWV2
ZW50aH0sPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB3cml0ZV9t
aHBtZXZlbnRoLDxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgLm1pbl9wcml2X3ZlciA9IFBSSVZfVkVSU0lPTl8x
XzEyXzAgfSw8YnI+DQomZ3Q7wqAgwqAgwqAgwqBbQ1NSX01IUE1FVkVOVDIzSF3CoCDCoD0geyAm
cXVvdDttaHBtZXZlbnQyM2gmcXVvdDsswqAgwqAgc3Njb2ZwbWYswqAgcmVhZF9taHBtZXZlbnRo
LDxicj4NCiZndDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgd3JpdGVfbWhwbWV2ZW50aH0s
PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB3cml0ZV9taHBtZXZl
bnRoLDxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgLm1pbl9wcml2X3ZlciA9IFBSSVZfVkVSU0lPTl8xXzEyXzAg
fSw8YnI+DQomZ3Q7wqAgwqAgwqAgwqBbQ1NSX01IUE1FVkVOVDI0SF3CoCDCoD0geyAmcXVvdDtt
aHBtZXZlbnQyNGgmcXVvdDsswqAgwqAgc3Njb2ZwbWYswqAgcmVhZF9taHBtZXZlbnRoLDxicj4N
CiZndDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgd3JpdGVfbWhwbWV2ZW50aH0sPGJyPg0K
Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB3cml0ZV9taHBtZXZlbnRoLDxi
cj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgLm1pbl9wcml2X3ZlciA9IFBSSVZfVkVSU0lPTl8xXzEyXzAgfSw8YnI+
DQomZ3Q7wqAgwqAgwqAgwqBbQ1NSX01IUE1FVkVOVDI1SF3CoCDCoD0geyAmcXVvdDttaHBtZXZl
bnQyNWgmcXVvdDsswqAgwqAgc3Njb2ZwbWYswqAgcmVhZF9taHBtZXZlbnRoLDxicj4NCiZndDsg
LcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgd3JpdGVfbWhwbWV2ZW50aH0sPGJyPg0KJmd0OyAr
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB3cml0ZV9taHBtZXZlbnRoLDxicj4NCiZn
dDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgLm1pbl9wcml2X3ZlciA9IFBSSVZfVkVSU0lPTl8xXzEyXzAgfSw8YnI+DQomZ3Q7
wqAgwqAgwqAgwqBbQ1NSX01IUE1FVkVOVDI2SF3CoCDCoD0geyAmcXVvdDttaHBtZXZlbnQyNmgm
cXVvdDsswqAgwqAgc3Njb2ZwbWYswqAgcmVhZF9taHBtZXZlbnRoLDxicj4NCiZndDsgLcKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgd3JpdGVfbWhwbWV2ZW50aH0sPGJyPg0KJmd0OyArwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB3cml0ZV9taHBtZXZlbnRoLDxicj4NCiZndDsgK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgLm1pbl9wcml2X3ZlciA9IFBSSVZfVkVSU0lPTl8xXzEyXzAgfSw8YnI+DQomZ3Q7wqAgwqAg
wqAgwqBbQ1NSX01IUE1FVkVOVDI3SF3CoCDCoD0geyAmcXVvdDttaHBtZXZlbnQyN2gmcXVvdDss
wqAgwqAgc3Njb2ZwbWYswqAgcmVhZF9taHBtZXZlbnRoLDxicj4NCiZndDsgLcKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgd3JpdGVfbWhwbWV2ZW50aH0sPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqB3cml0ZV9taHBtZXZlbnRoLDxicj4NCiZndDsgK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgLm1p
bl9wcml2X3ZlciA9IFBSSVZfVkVSU0lPTl8xXzEyXzAgfSw8YnI+DQomZ3Q7wqAgwqAgwqAgwqBb
Q1NSX01IUE1FVkVOVDI4SF3CoCDCoD0geyAmcXVvdDttaHBtZXZlbnQyOGgmcXVvdDsswqAgwqAg
c3Njb2ZwbWYswqAgcmVhZF9taHBtZXZlbnRoLDxicj4NCiZndDsgLcKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgd3JpdGVfbWhwbWV2ZW50aH0sPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqB3cml0ZV9taHBtZXZlbnRoLDxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgLm1pbl9wcml2
X3ZlciA9IFBSSVZfVkVSU0lPTl8xXzEyXzAgfSw8YnI+DQomZ3Q7wqAgwqAgwqAgwqBbQ1NSX01I
UE1FVkVOVDI5SF3CoCDCoD0geyAmcXVvdDttaHBtZXZlbnQyOWgmcXVvdDsswqAgwqAgc3Njb2Zw
bWYswqAgcmVhZF9taHBtZXZlbnRoLDxicj4NCiZndDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgd3JpdGVfbWhwbWV2ZW50aH0sPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqB3cml0ZV9taHBtZXZlbnRoLDxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgLm1pbl9wcml2X3ZlciA9
IFBSSVZfVkVSU0lPTl8xXzEyXzAgfSw8YnI+DQomZ3Q7wqAgwqAgwqAgwqBbQ1NSX01IUE1FVkVO
VDMwSF3CoCDCoD0geyAmcXVvdDttaHBtZXZlbnQzMGgmcXVvdDsswqAgwqAgc3Njb2ZwbWYswqAg
cmVhZF9taHBtZXZlbnRoLDxicj4NCiZndDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgd3Jp
dGVfbWhwbWV2ZW50aH0sPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqB3cml0ZV9taHBtZXZlbnRoLDxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgLm1pbl9wcml2X3ZlciA9IFBSSVZf
VkVSU0lPTl8xXzEyXzAgfSw8YnI+DQomZ3Q7wqAgwqAgwqAgwqBbQ1NSX01IUE1FVkVOVDMxSF3C
oCDCoD0geyAmcXVvdDttaHBtZXZlbnQzMWgmcXVvdDsswqAgwqAgc3Njb2ZwbWYswqAgcmVhZF9t
aHBtZXZlbnRoLDxicj4NCiZndDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgd3JpdGVfbWhw
bWV2ZW50aH0sPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB3cml0
ZV9taHBtZXZlbnRoLDxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgLm1pbl9wcml2X3ZlciA9IFBSSVZfVkVSU0lP
Tl8xXzEyXzAgfSw8YnI+DQomZ3Q7wqAgwqA8YnI+DQomZ3Q7wqAgwqAgwqAgwqBbQ1NSX0hQTUNP
VU5URVIzSF3CoCDCoD0geyAmcXVvdDtocG1jb3VudGVyM2gmcXVvdDsswqAgwqBjdHIzMizCoCBy
ZWFkX2hwbWNvdW50ZXJoIH0sPGJyPg0KJmd0O8KgIMKgIMKgIMKgW0NTUl9IUE1DT1VOVEVSNEhd
wqAgwqA9IHsgJnF1b3Q7aHBtY291bnRlcjRoJnF1b3Q7LMKgIMKgY3RyMzIswqAgcmVhZF9ocG1j
b3VudGVyaCB9LDxicj4NCiZndDsgQEAgLTQwMDUsNyArNDAzNCw4IEBAIHJpc2N2X2Nzcl9vcGVy
YXRpb25zIGNzcl9vcHNbQ1NSX1RBQkxFX1NJWkVdID0gezxicj4NCiZndDvCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCB3cml0ZV9taHBtY291bnRlcmggfSw8YnI+DQomZ3Q7wqAgwqAgwqAg
wqBbQ1NSX01IUE1DT1VOVEVSMzFIXSA9IHsgJnF1b3Q7bWhwbWNvdW50ZXIzMWgmcXVvdDssIG1j
dHIzMizCoCByZWFkX2hwbWNvdW50ZXJoLDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCB3cml0ZV9taHBtY291bnRlcmggfSw8YnI+DQomZ3Q7IC3CoCDCoCBbQ1NSX1NDT1VO
VE9WRl3CoCDCoCDCoCA9IHsgJnF1b3Q7c2NvdW50b3ZmJnF1b3Q7LCBzc2NvZnBtZizCoCByZWFk
X3Njb3VudG92ZiB9LDxicj4NCiZndDsgK8KgIMKgIFtDU1JfU0NPVU5UT1ZGXcKgIMKgIMKgID0g
eyAmcXVvdDtzY291bnRvdmYmcXVvdDssIHNzY29mcG1mLMKgIHJlYWRfc2NvdW50b3ZmLDxicj4N
CiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgLm1pbl9wcml2X3ZlciA9IFBSSVZfVkVSU0lPTl8xXzEyXzAgfSw8YnI+DQom
Z3Q7wqAgwqA8YnI+DQomZ3Q7wqAgwqAjZW5kaWYgLyogIUNPTkZJR19VU0VSX09OTFkgKi88YnI+
DQomZ3Q7wqAgwqB9Ozxicj4NCjxicj4NCjwvYmxvY2txdW90ZT48L2Rpdj48L2Rpdj4NCg==
--0000000000006ec53f05e4d1408a--

