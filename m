Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mfvFl-0007SO-4K
	for mharc-qemu-riscv@gnu.org; Wed, 27 Oct 2021 22:34:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rpathak@ventanamicro.com>)
 id 1mfvFe-0007Pg-Pg
 for qemu-riscv@nongnu.org; Wed, 27 Oct 2021 22:34:47 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:41624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rpathak@ventanamicro.com>)
 id 1mfvFc-0001YX-28
 for qemu-riscv@nongnu.org; Wed, 27 Oct 2021 22:34:46 -0400
Received: by mail-ed1-x532.google.com with SMTP id h7so18893718ede.8
 for <qemu-riscv@nongnu.org>; Wed, 27 Oct 2021 19:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=N3q7p2Kfz5SpCCLhrNbkaF8rASe1huHd1b/fICpGokU=;
 b=MlBrCFJ3ZXuIjjtYC+b7mxR4+tT+23rx20itVZUC041eA8mZJLO78gwdYkMWJft95v
 jjOSyp+KvVz5w/QLhadpmB/UhNHuvdSXqfqBEQdumoBe1yykXTO+9wEmhnIrUH8bhLXl
 CQFZm0KJa6JUNzXVrQP7YFQe51oGTc6jLeouU/Co1Vj3galGu8bfKZB5vXgxVCZzU1Qv
 uu1fArlgYGI/BDI/brvrLLirGjeuRczTUYrTN9jOba5pfzDJNdXY1RN9buGXKscrHzeY
 vwwCITPHD6Bwd1AWup5TOiTNBN6JrFMcrmS47dq0e8/oTyxP+f6I5D5JDckZGVbyzrQg
 s0PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=N3q7p2Kfz5SpCCLhrNbkaF8rASe1huHd1b/fICpGokU=;
 b=R6Txj6d42wOtAmd0dsARgZ4NCFbJIeu5EitURI0t4/xpB22apY/3+UcocN1EuUipPT
 HfBdtZ4WDYjrKdhPGvxvH0IKzNUAiyw6Ouzqgz5ayfsBy75YdqXvo4tFcbxHsPKFDvyY
 oIJ+zGVUqfQadhQakxU2gmpYeVmBfwkY73+uMZljLvaCd/OS4yGphSotuOtjCYx8rAEG
 BGgD3XsxWXvMwVqg/kWw4p8esl4qTKTkeECkr0nV5TTY4xeI5seb37Yz6v4PB/QJQP7u
 N7O9/6TzkZRtj4yfZe7vf0XeycBw+QfhoSqRvgr6yJyQAHnVpanV9tmYo4EZXbN96DeJ
 49NA==
X-Gm-Message-State: AOAM530uGrdcCROpQWx9aS/RsI/Bh3VMEHIxhpZjwDPTFZkJmB+A9yDW
 j32onSYTOiq3NNdw2YBIcltZyLVPFd+xcBdBaoiDvQ==
X-Google-Smtp-Source: ABdhPJzbfofDFI9Uno8kJTVLCyQu673W7GpzPcBYH8yNCwkvqlUc+GVISHD499JZ5z/9vVXftgd1c5IFXy/YBi1JC38=
X-Received: by 2002:a17:906:9501:: with SMTP id
 u1mr1725155ejx.496.1635388481316; 
 Wed, 27 Oct 2021 19:34:41 -0700 (PDT)
MIME-Version: 1.0
References: <20211025124319.195290-1-rpathak@ventanamicro.com>
 <CAKmqyKNrje6W0kzHgfRf6k9gVAz4c12zdKYYbsSJaHNFdbnQXA@mail.gmail.com>
In-Reply-To: <CAKmqyKNrje6W0kzHgfRf6k9gVAz4c12zdKYYbsSJaHNFdbnQXA@mail.gmail.com>
From: Rahul Pathak <rpathak@ventanamicro.com>
Date: Thu, 28 Oct 2021 08:04:05 +0530
Message-ID: <CA+Oz1=aCVsyxV38QtfWa001Gr6M6iqyToR9mTzu_B4jh9fDqTA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] mconfigptr support
To: Alistair Francis <alistair23@gmail.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: multipart/alternative; boundary="0000000000007fc00305cf608dfc"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=rpathak@ventanamicro.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
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
X-List-Received-Date: Thu, 28 Oct 2021 02:34:47 -0000

--0000000000007fc00305cf608dfc
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 27, 2021 at 8:14 AM Alistair Francis <alistair23@gmail.com>
wrote:

> On Mon, Oct 25, 2021 at 10:51 PM Rahul Pathak <rpathak@ventanamicro.com>
> wrote:
> >
> > Patches add the mconfigptr csr support.
> > mconfigptr is newly incorporated in risc-v privileged architecture
> > specification 1.12 version.
> > priv spec 1.12.0 version check is also added.
> >
> >
> > qemu-system-riscv64 -nographic -machine virt -cpu rv64,priv_spec=v1.12.0
>
> Thanks for the patches!
>
> I gave some comments in line with the code changes. Overall this looks
> good, we just need to add the other v1.12.0 features.
>
> Alistair


Thanks Alistair, I will work on the comments and send the
next version.

>
>
>
> > Changelog:
> >
> > v1->v2
> > ------
> > 1. Added privileged architecture spec version 1.12 ("v1.12.0") check
> > 2. Added predicate function for mconfigptr which verifies
> > for priv spec version v1.12.0 or higher.
> >
> > Thanks
> > Rahul
> >
> > Rahul Pathak (2):
> >   target/riscv: Add priv spec 1.12.0 version check
> >   target/riscv: csr: Implement mconfigptr CSR
> >
> >  target/riscv/cpu.c      |  4 +++-
> >  target/riscv/cpu.h      |  1 +
> >  target/riscv/cpu_bits.h |  1 +
> >  target/riscv/csr.c      | 19 +++++++++++++++----
> >  4 files changed, 20 insertions(+), 5 deletions(-)
> >
> > --
> > 2.25.1
> >
> >
>

--0000000000007fc00305cf608dfc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-family:verdana,sans-serif"><br></div></div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Oct 27, 2021 at 8:14 AM Alis=
tair Francis &lt;<a href=3D"mailto:alistair23@gmail.com">alistair23@gmail.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">On Mon, Oct 25, 2021 at 10:51 PM Rahul Pathak &lt;<a href=3D"mailto:rpath=
ak@ventanamicro.com" target=3D"_blank">rpathak@ventanamicro.com</a>&gt; wro=
te:<br>
&gt;<br>
&gt; Patches add the mconfigptr csr support.<br>
&gt; mconfigptr is newly incorporated in risc-v privileged architecture<br>
&gt; specification 1.12 version.<br>
&gt; priv spec 1.12.0 version check is also added.<br>
&gt;<br>
&gt;<br>
&gt; qemu-system-riscv64 -nographic -machine virt -cpu rv64,priv_spec=3Dv1.=
12.0<br>
<br>
Thanks for the patches!<br>
<br>
I gave some comments in line with the code changes. Overall this looks<br>
good, we just need to add the other v1.12.0 features.<br>
<br>
Alistai<span class=3D"gmail_default" style=3D"font-family:verdana,sans-seri=
f">r</span></blockquote><div><br></div><div class=3D"gmail_default" style=
=3D"font-family:verdana,sans-serif">Thanks Alistair, I will work on the com=
ments and send the=C2=A0</div><div class=3D"gmail_default" style=3D"font-fa=
mily:verdana,sans-serif">next version.</div><div class=3D"gmail_default" st=
yle=3D"font-family:verdana,sans-serif"></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex"><span class=3D"gmail_default" style=3D"font-family:verd=
ana,sans-serif"></span>=C2=A0<br></blockquote><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">
&gt;<br>
&gt; Changelog:<br>
&gt;<br>
&gt; v1-&gt;v2<br>
&gt; ------<br>
&gt; 1. Added privileged architecture spec version 1.12 (&quot;v1.12.0&quot=
;) check<br>
&gt; 2. Added predicate function for mconfigptr which verifies<br>
&gt; for priv spec version v1.12.0 or higher.<br>
&gt;<br>
&gt; Thanks<br>
&gt; Rahul<br>
&gt;<br>
&gt; Rahul Pathak (2):<br>
&gt;=C2=A0 =C2=A0target/riscv: Add priv spec 1.12.0 version check<br>
&gt;=C2=A0 =C2=A0target/riscv: csr: Implement mconfigptr CSR<br>
&gt;<br>
&gt;=C2=A0 target/riscv/cpu.c=C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 +++-<br>
&gt;=C2=A0 target/riscv/cpu.h=C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
&gt;=C2=A0 target/riscv/cpu_bits.h |=C2=A0 1 +<br>
&gt;=C2=A0 target/riscv/csr.c=C2=A0 =C2=A0 =C2=A0 | 19 +++++++++++++++----<=
br>
&gt;=C2=A0 4 files changed, 20 insertions(+), 5 deletions(-)<br>
&gt;<br>
&gt; --<br>
&gt; 2.25.1<br>
&gt;<br>
&gt;<br>
</blockquote></div></div>

--0000000000007fc00305cf608dfc--

