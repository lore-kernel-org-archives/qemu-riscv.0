Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mPOzk-0000Am-8k
	for mharc-qemu-riscv@gnu.org; Sun, 12 Sep 2021 08:54:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mPOzj-00006Y-2v
 for qemu-riscv@nongnu.org; Sun, 12 Sep 2021 08:54:03 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:46732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mPOzh-0000EW-0w
 for qemu-riscv@nongnu.org; Sun, 12 Sep 2021 08:54:02 -0400
Received: by mail-pf1-x431.google.com with SMTP id y17so6258781pfl.13
 for <qemu-riscv@nongnu.org>; Sun, 12 Sep 2021 05:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tT6nZbm/VfYPa/W51T3Ca3jy9/S+gCk2HkF2JtJwn5Q=;
 b=Pjg0CMdU5nzRhd6Whlkanb0DOabcgPF6L+ckrSCgLUcmkQk98u1VpXz8MYJz0e09eK
 uGP2zCCzyk7a5nrG7kFUislCjdFXU8sK60cbWHsoVBy658l34Oeakx1VtNI4o6k2/y6F
 793w7Mfh8tJDW5fqttRQ8SF5ifSi+qD7jh5rVtU63LjHH6JHaVK+lacR6e8idbdtxYIQ
 4iNwpBA4UPTFPeYXF9ff4CpCUOFnuozYyk/OP3uHX83KNVXE7qNh7YEhaCpq7M2nOcb/
 ZKZkvNP6Z6FPuVwev04EAZxHKqc0hE67sdgsGxZimweui04/FCIIgIzgdAjgo6vRUxsp
 oOdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tT6nZbm/VfYPa/W51T3Ca3jy9/S+gCk2HkF2JtJwn5Q=;
 b=T22Z4s78nf179ko7/dz+o5pT0JB47lgIvx726DZOXRXvgQ0VaCeaol+Kf+v/T2kR87
 Z89jbObL9tdf3uJbfQc9+RJQSvFU5UqAbqFM7BXsC5sRuzXlioRY6tILQAlXWoC8ZdfK
 9K+rsaNn+Xa4MzyL2TFCX/cC+6WmW9Ik+taWbaB2rtRfrzBO2MkTlefQOWjv2/VzUowg
 FRzUsBFHL3Q8AR9zD8dOf91pZB0mdnUHZkkDLzfz6gx6GTNBKZR46PmsK9gxsq8mlZo+
 563Zq/mB2aRrTit5mLUdK0P6ouudoegQt1Elm8VDReYSXl9lf3mUVvSxC0iA1YxmIBol
 wQhw==
X-Gm-Message-State: AOAM530zIaYs/XkZlNTKLjtdLfiDVVezuzbptq7zv9BflyV79l9Fc+R6
 X9/HwKTA1RJAtScX9ze694cVgp4ucWMVRQ==
X-Google-Smtp-Source: ABdhPJzvrFQeAU9WhNk7asJpuNHf2DQHZX+MD5c0wPG5GUK5OTv9dEhbt0DegXoBmJd9BMEkcxSTCA==
X-Received: by 2002:a63:1504:: with SMTP id v4mr6539703pgl.151.1631451238771; 
 Sun, 12 Sep 2021 05:53:58 -0700 (PDT)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com.
 [209.85.216.52])
 by smtp.gmail.com with ESMTPSA id m12sm4143662pjc.18.2021.09.12.05.53.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Sep 2021 05:53:58 -0700 (PDT)
Received: by mail-pj1-f52.google.com with SMTP id k23so4439777pji.0;
 Sun, 12 Sep 2021 05:53:58 -0700 (PDT)
X-Received: by 2002:a17:90a:4a8a:: with SMTP id
 f10mr7422690pjh.195.1631451238040; 
 Sun, 12 Sep 2021 05:53:58 -0700 (PDT)
MIME-Version: 1.0
References: <CAKP3tdRSYSfyTPeBk2+WYaUxt1jApK6XXYjXyZw4JwTxfTackQ@mail.gmail.com>
In-Reply-To: <CAKP3tdRSYSfyTPeBk2+WYaUxt1jApK6XXYjXyZw4JwTxfTackQ@mail.gmail.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Sun, 12 Sep 2021 20:53:47 +0800
X-Gmail-Original-Message-ID: <CANzO1D3ET=2H_Y8i6bTJ3LNoo38+2Z3Sv3rcWjBJDXuqqXa5uw@mail.gmail.com>
Message-ID: <CANzO1D3ET=2H_Y8i6bTJ3LNoo38+2Z3Sv3rcWjBJDXuqqXa5uw@mail.gmail.com>
Subject: Re: Question about riscv-qemu trace
To: Zahra Azad <zazad@bu.edu>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, qemu-discuss@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000008308d805cbcbd757"
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Sun, 12 Sep 2021 12:54:03 -0000

--0000000000008308d805cbcbd757
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Zahra Azad <zazad@bu.edu> =E6=96=BC 2021=E5=B9=B49=E6=9C=8812=E6=97=A5 =E9=
=80=B1=E6=97=A5 =E4=B8=8B=E5=8D=8812:33=E5=AF=AB=E9=81=93=EF=BC=9A

> Hi all,
>
> I want to use riscv-qemu to get a trace of the guest executed instruction=
s
> of a vectorized program. I'm using the following command:
> qemu-riscv64 -cpu rv64,x-v=3Dtrue,x-k=3Dtrue,vlen=3D256,elen=3D64,vext_sp=
ec=3Dv1.0
> -D logfile.log -d in_asm,cpu,fpu program
>
> Although the program is executed correctly without throwing any error, in
> the trace log all the vector instructions are shown as illegal
> instructions. Any ideas what is going wrong?
>
> I built riscv toolchain and llvm from the main branch (following sifive
> instructions <https://github.com/sifive/riscv-llvm>), and riscv qemu is
> built from https://github.com/sifive/qemu/tree/v5.2.0-rvv-rvb-zfh.
>
> Thank you!
>

Hi Zahra,

We are missing RVV related instructions disassembler in QEMU.
The illegal instruction messages for vector instructions in the trace log
are just false alarms for now.
We need to update disas/riscv.c to decode RVV instructions properly.

Regards,
Frank Chang

--0000000000008308d805cbcbd757
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Zahra Azad &lt;<a href=3D"mailto:zazad@bu=
.edu">zazad@bu.edu</a>&gt; =E6=96=BC 2021=E5=B9=B49=E6=9C=8812=E6=97=A5 =E9=
=80=B1=E6=97=A5 =E4=B8=8B=E5=8D=8812:33=E5=AF=AB=E9=81=93=EF=BC=9A<br></div=
><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x"><div dir=3D"ltr"><div>Hi all,<br></div><div><br></div><div>I want to use=
 riscv-qemu to get a trace of the guest executed instructions of a vectoriz=
ed program. I&#39;m using the following command:</div><div>qemu-riscv64 -cp=
u rv64,x-v=3Dtrue,x-k=3Dtrue,vlen=3D256,elen=3D64,vext_spec=3Dv1.0 -D logfi=
le.log -d in_asm,cpu,fpu program <br></div><div><br></div>Although the prog=
ram is executed correctly without throwing any error, in the trace log all =
the vector instructions are shown as illegal instructions. Any ideas what i=
s going wrong?<br><br><div>I built riscv toolchain and llvm from the main b=
ranch (<a href=3D"https://github.com/sifive/riscv-llvm" target=3D"_blank">f=
ollowing sifive instructions</a>), and riscv qemu is built from <a href=3D"=
https://github.com/sifive/qemu/tree/v5.2.0-rvv-rvb-zfh" target=3D"_blank">h=
ttps://github.com/sifive/qemu/tree/v5.2.0-rvv-rvb-zfh</a>.</div><div><br></=
div><div>Thank you!<br></div></div></blockquote><div><br></div><div>Hi Zahr=
a,</div><div><br></div><div>We are missing RVV related instructions disasse=
mbler in QEMU.</div><div>The illegal instruction messages for vector instru=
ctions in the trace log are just false alarms for now.<br></div><div>We nee=
d to update=C2=A0disas/riscv.c=C2=A0to decode RVV instructions properly.<br=
></div><div><br></div><div>Regards,</div><div>Frank Chang=C2=A0</div></div>=
</div>

--0000000000008308d805cbcbd757--

