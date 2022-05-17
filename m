Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nqpRj-0004So-2h
	for mharc-qemu-riscv@gnu.org; Tue, 17 May 2022 01:08:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nqpRf-0004SA-8B; Tue, 17 May 2022 01:08:31 -0400
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135]:36382)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nqpRb-0001Xq-I9; Tue, 17 May 2022 01:08:30 -0400
Received: by mail-il1-x135.google.com with SMTP id l15so11916475ilh.3;
 Mon, 16 May 2022 22:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9oj2WvTy1eCbC9ANyeKFwZbKh4mDNffftCrC0OtgxJ0=;
 b=AlkvPBRn4DlMHXu5fwqlW1SgKmBvnlYWn7WpREPyhtntZP+tNtdE/an49TzuRHUV0h
 W3SVGrOjdwZW/VQV9M5EylbpbQGk9g8eK1BmmnpdY8FBKTSAXKP2Zsv6HGSX3vcryasL
 QUjL2eoclmlKDnwC9+Qnfi5c/b0U7ffRpCVv11ABCw+8YnOg0M2puXjCb6Ay966qF7Pt
 ptfLin7dq8wYmBIC448aYWgxbr8FTARVRpJHeqMu6ecxFuXKstgSFmoTgiu7YQtQBdNa
 6AcusU+Ru32ro1cjVTvGJi18DJrF/kQdnCpaBVSxcq9rK1Oj6BTozWI/QI+z4BiRpFui
 kV9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9oj2WvTy1eCbC9ANyeKFwZbKh4mDNffftCrC0OtgxJ0=;
 b=KcUTHPT0Ug4Q7ZLINqetcBMWuPw6e5kJGggTzNnFVTTEYo9hpToPBWiYraz7m6FYzt
 I5gELkZ37zjWDTmFCje++8qLHF7K+kWkXQQPC1DoU2JyC4U7yZmujp1tVYCKDQWUA3Ga
 fPDEaeqcWoCroLidvD/9JQOm+UrvmLiC8znisCsYKAoT2t4WmgXVpISstJkYgbv2R/+R
 CdebsKz9y5KhJjPedWEyQk9UYuaBLjsaTec/UbVqL9OJfMKQoNrgRvCIrHxH1pb0XVbl
 5RaBhDLZmmlBeNhqKGRcQoVDHX0GGRzBF/O+AQzXy/pJ8NCU/VxNBrHKb+ErQ09DADqw
 VBiw==
X-Gm-Message-State: AOAM531s1tEiZpJ6a0M8x8Ew7Zq8gENiC0JSaWzn8JqFKFLK8LvY3+W1
 DxltD7xNRBW3qmT25bjP7zThM/yK/52eeHMO4Yg=
X-Google-Smtp-Source: ABdhPJxi/3NoZh79/kS04dNT73O+h0B2Ql33iX2rMyfsfjcU6kmkKIa19jJaaQEi/JddRhe+nLLNKNNamozVuHxOWT4=
X-Received: by 2002:a05:6e02:e04:b0:2d1:d92:7981 with SMTP id
 a4-20020a056e020e0400b002d10d927981mr6661970ilk.310.1652764105230; Mon, 16
 May 2022 22:08:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220517041100.93045-1-alistair.francis@opensource.wdc.com>
 <20220517041100.93045-3-alistair.francis@opensource.wdc.com>
 <f071a26d-224b-74e8-207d-dedd5c16ec01@iscas.ac.cn>
In-Reply-To: <f071a26d-224b-74e8-207d-dedd5c16ec01@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 17 May 2022 15:07:58 +1000
Message-ID: <CAKmqyKPn8NM45X=dk8P4rtq4VAQpzCduJF9qmLqu-xupkqg9Bg@mail.gmail.com>
Subject: Re: [PATCH 2/2] target/riscv: Run extension checks for all CPUs
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: Alistair Francis <alistair.francis@opensource.wdc.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bmeng.cn@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::135;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x135.google.com
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
X-List-Received-Date: Tue, 17 May 2022 05:08:31 -0000

On Tue, May 17, 2022 at 3:02 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
>
> =E5=9C=A8 2022/5/17 =E4=B8=8B=E5=8D=8812:11, Alistair Francis =E5=86=99=
=E9=81=93:
> > From: Alistair Francis <alistair.francis@wdc.com>
> >
> > Instead of just running the extension checks for the base CPUs, instead
> > run them for all CPUs.
> >
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >   target/riscv/cpu.c | 161 ++++++++++++++++++++++----------------------=
-
> >   1 file changed, 80 insertions(+), 81 deletions(-)
> >
> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > index 49b844535a..ee48a18ae4 100644
> > --- a/target/riscv/cpu.c
> > +++ b/target/riscv/cpu.c
> > @@ -593,102 +593,101 @@ static void riscv_cpu_realize(DeviceState *dev,=
 Error **errp)
> >       }
> >       assert(env->misa_mxl_max =3D=3D env->misa_mxl);
> >
> > -    /* If only MISA_EXT is unset for misa, then set it from properties=
 */
> > -    if (env->misa_ext =3D=3D 0) {
> > -        uint32_t ext =3D 0;
> > +    /* Do some ISA extension error checking */
> > +    if (cpu->cfg.ext_i && cpu->cfg.ext_e) {
> > +        error_setg(errp,
> > +                   "I and E extensions are incompatible");
> > +        return;
> > +    }
> >
> > -        /* Do some ISA extension error checking */
> > -        if (cpu->cfg.ext_i && cpu->cfg.ext_e) {
> > -            error_setg(errp,
> > -                       "I and E extensions are incompatible");
> > -            return;
> > -        }
> > +    if (!cpu->cfg.ext_i && !cpu->cfg.ext_e) {
> > +        error_setg(errp,
> > +                   "Either I or E extension must be set");
> > +        return;
> > +    }
> >
> > -        if (!cpu->cfg.ext_i && !cpu->cfg.ext_e) {
> > -            error_setg(errp,
> > -                       "Either I or E extension must be set");
> > -            return;
> > -        }
> > +    if (cpu->cfg.ext_g && !(cpu->cfg.ext_i && cpu->cfg.ext_m &&
> > +                            cpu->cfg.ext_a && cpu->cfg.ext_f &&
> > +                            cpu->cfg.ext_d &&
> > +                            cpu->cfg.ext_icsr && cpu->cfg.ext_ifencei)=
) {
> > +        warn_report("Setting G will also set IMAFD_Zicsr_Zifencei");
> > +        cpu->cfg.ext_i =3D true;
> > +        cpu->cfg.ext_m =3D true;
> > +        cpu->cfg.ext_a =3D true;
> > +        cpu->cfg.ext_f =3D true;
> > +        cpu->cfg.ext_d =3D true;
> > +        cpu->cfg.ext_icsr =3D true;
> > +        cpu->cfg.ext_ifencei =3D true;
> > +    }
>
> Maybe you can merge the changes from my first patch to here and put this
> before the check on 'I' and 'E'.

This patch causes some failures as the extensions aren't set on all
machines now, so I'm actually going to drop it

Alistair

>
> Regards,
>
> Weiwei Li
>
> >
> > -        if (cpu->cfg.ext_g && !(cpu->cfg.ext_i && cpu->cfg.ext_m &&
> > -                                cpu->cfg.ext_a && cpu->cfg.ext_f &&
> > -                                cpu->cfg.ext_d &&
> > -                                cpu->cfg.ext_icsr && cpu->cfg.ext_ifen=
cei)) {
> > -            warn_report("Setting G will also set IMAFD_Zicsr_Zifencei"=
);
> > -            cpu->cfg.ext_i =3D true;
> > -            cpu->cfg.ext_m =3D true;
> > -            cpu->cfg.ext_a =3D true;
> > -            cpu->cfg.ext_f =3D true;
> > -            cpu->cfg.ext_d =3D true;
> > -            cpu->cfg.ext_icsr =3D true;
> > -            cpu->cfg.ext_ifencei =3D true;
> > -        }
> > +    if (cpu->cfg.ext_f && !cpu->cfg.ext_icsr) {
> > +        error_setg(errp, "F extension requires Zicsr");
> > +        return;
> > +    }
> >
> > -        if (cpu->cfg.ext_f && !cpu->cfg.ext_icsr) {
> > -            error_setg(errp, "F extension requires Zicsr");
> > -            return;
> > -        }
> > +    if ((cpu->cfg.ext_zfh || cpu->cfg.ext_zfhmin) && !cpu->cfg.ext_f) =
{
> > +        error_setg(errp, "Zfh/Zfhmin extensions require F extension");
> > +        return;
> > +    }
> >
> > -        if ((cpu->cfg.ext_zfh || cpu->cfg.ext_zfhmin) && !cpu->cfg.ext=
_f) {
> > -            error_setg(errp, "Zfh/Zfhmin extensions require F extensio=
n");
> > -            return;
> > -        }
> > +    if (cpu->cfg.ext_d && !cpu->cfg.ext_f) {
> > +        error_setg(errp, "D extension requires F extension");
> > +        return;
> > +    }
> >
> > -        if (cpu->cfg.ext_d && !cpu->cfg.ext_f) {
> > -            error_setg(errp, "D extension requires F extension");
> > -            return;
> > -        }
> > +    if (cpu->cfg.ext_v && !cpu->cfg.ext_d) {
> > +        error_setg(errp, "V extension requires D extension");
> > +        return;
> > +    }
> >
> > -        if (cpu->cfg.ext_v && !cpu->cfg.ext_d) {
> > -            error_setg(errp, "V extension requires D extension");
> > -            return;
> > -        }
> > +    if ((cpu->cfg.ext_zve32f || cpu->cfg.ext_zve64f) && !cpu->cfg.ext_=
f) {
> > +        error_setg(errp, "Zve32f/Zve64f extensions require F extension=
");
> > +        return;
> > +    }
> > +
> > +    if (cpu->cfg.ext_zdinx || cpu->cfg.ext_zhinx ||
> > +        cpu->cfg.ext_zhinxmin) {
> > +        cpu->cfg.ext_zfinx =3D true;
> > +    }
> >
> > -        if ((cpu->cfg.ext_zve32f || cpu->cfg.ext_zve64f) && !cpu->cfg.=
ext_f) {
> > -            error_setg(errp, "Zve32f/Zve64f extensions require F exten=
sion");
> > +    if (cpu->cfg.ext_zfinx) {
> > +        if (!cpu->cfg.ext_icsr) {
> > +            error_setg(errp, "Zfinx extension requires Zicsr");
> >               return;
> >           }
> > -
> > -        /* Set the ISA extensions, checks should have happened above *=
/
> > -        if (cpu->cfg.ext_zdinx || cpu->cfg.ext_zhinx ||
> > -            cpu->cfg.ext_zhinxmin) {
> > -            cpu->cfg.ext_zfinx =3D true;
> > +        if (cpu->cfg.ext_f) {
> > +            error_setg(errp,
> > +                "Zfinx cannot be supported together with F extension")=
;
> > +            return;
> >           }
> > +    }
> >
> > -        if (cpu->cfg.ext_zfinx) {
> > -            if (!cpu->cfg.ext_icsr) {
> > -                error_setg(errp, "Zfinx extension requires Zicsr");
> > -                return;
> > -            }
> > -            if (cpu->cfg.ext_f) {
> > -                error_setg(errp,
> > -                    "Zfinx cannot be supported together with F extensi=
on");
> > -                return;
> > -            }
> > -        }
> > +    if (cpu->cfg.ext_zk) {
> > +        cpu->cfg.ext_zkn =3D true;
> > +        cpu->cfg.ext_zkr =3D true;
> > +        cpu->cfg.ext_zkt =3D true;
> > +    }
> >
> > -        if (cpu->cfg.ext_zk) {
> > -            cpu->cfg.ext_zkn =3D true;
> > -            cpu->cfg.ext_zkr =3D true;
> > -            cpu->cfg.ext_zkt =3D true;
> > -        }
> > +    if (cpu->cfg.ext_zkn) {
> > +        cpu->cfg.ext_zbkb =3D true;
> > +        cpu->cfg.ext_zbkc =3D true;
> > +        cpu->cfg.ext_zbkx =3D true;
> > +        cpu->cfg.ext_zkne =3D true;
> > +        cpu->cfg.ext_zknd =3D true;
> > +        cpu->cfg.ext_zknh =3D true;
> > +    }
> >
> > -        if (cpu->cfg.ext_zkn) {
> > -            cpu->cfg.ext_zbkb =3D true;
> > -            cpu->cfg.ext_zbkc =3D true;
> > -            cpu->cfg.ext_zbkx =3D true;
> > -            cpu->cfg.ext_zkne =3D true;
> > -            cpu->cfg.ext_zknd =3D true;
> > -            cpu->cfg.ext_zknh =3D true;
> > -        }
> > +    if (cpu->cfg.ext_zks) {
> > +        cpu->cfg.ext_zbkb =3D true;
> > +        cpu->cfg.ext_zbkc =3D true;
> > +        cpu->cfg.ext_zbkx =3D true;
> > +        cpu->cfg.ext_zksed =3D true;
> > +        cpu->cfg.ext_zksh =3D true;
> > +    }
> >
> > -        if (cpu->cfg.ext_zks) {
> > -            cpu->cfg.ext_zbkb =3D true;
> > -            cpu->cfg.ext_zbkc =3D true;
> > -            cpu->cfg.ext_zbkx =3D true;
> > -            cpu->cfg.ext_zksed =3D true;
> > -            cpu->cfg.ext_zksh =3D true;
> > -        }
> > +    /* If only MISA_EXT is unset for misa, then set it from properties=
 */
> > +    if (env->misa_ext =3D=3D 0) {
> > +        uint32_t ext =3D 0;
> >
> >           if (cpu->cfg.ext_i) {
> >               ext |=3D RVI;
>
>

