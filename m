Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mfvDS-0004jU-7o
	for mharc-qemu-riscv@gnu.org; Wed, 27 Oct 2021 22:32:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rpathak@ventanamicro.com>)
 id 1mfvDM-0004hD-Bc
 for qemu-riscv@nongnu.org; Wed, 27 Oct 2021 22:32:24 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:40838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rpathak@ventanamicro.com>)
 id 1mfvDJ-0001La-DS
 for qemu-riscv@nongnu.org; Wed, 27 Oct 2021 22:32:24 -0400
Received: by mail-ed1-x531.google.com with SMTP id 5so17925462edw.7
 for <qemu-riscv@nongnu.org>; Wed, 27 Oct 2021 19:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Jj9XSAwuolwYN4hf3vcnVNvN6r1wN2htT8wWFV89ObQ=;
 b=OpkO6YSEcy/+3pH3Yk5PIRXaFxRhYRpwrglTqv4SYbDuBiKnZbcQP98eFCNTa0yLKD
 X6F5Pg5o5RkWK0X9Fd/cfqaK1WpA/CCV6uh8Kz2uh1L+gPMVgv5QPJKMGwO/TFJpc4Gt
 6XdpOe/SjLbaVmR3s69CZCBnfMy9Ar4lkPDc3LxOOKjX+QnkjbBG7+h3kqeSJv0pvdIJ
 uIlcg+Qqbo72Yp0o3vprnZZnR+NtfB7cKfaq4lS+KOQoGrINSlq24MwxEK/QSI/lxKw4
 YIilori19BVd6Vr21HAK1195aIR9CQkPNA9MA6rcb700izoSoSzy/f0Mt/h1rto0Toau
 AdkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Jj9XSAwuolwYN4hf3vcnVNvN6r1wN2htT8wWFV89ObQ=;
 b=lvxlGKa3cw3tdOILrln9D2wpmWFY3Cnobz+3n74eLlEoo/bEzl0VXl4D732rAeYxCh
 1cYGuHeXb+K4A//MbUuRzqSuOKHk2BiC8VSCWG2nlx+kF7fLXLEnkqupoDvdMb7EWT/r
 genW1VuDrh8bIbrBMrGFNLR49tWxzL+lwRNd/AfrEBIthpHE7vlneeGgW5f4yuBOhICx
 ke8qYDpChvofDH/iVMXjvIWfUTx3s9hq/ZUi3+fzEHm5olyG6UG7LSf2dsGtAYGLdMZD
 c8mW+h8iDHP1Px7XWymWzFR+Nlz0q+pFMmqfKrI30i3wfTeaBYCN0snuYh2KDzBRu9x/
 abAw==
X-Gm-Message-State: AOAM532O1e6Bfdozzp2LX55E83YpKr9J1/nDfsaL2yGQRK2O/JZIkAH0
 GxnyJIHPOxZJ9d061rWKf6tfKiI2LVFmlF8PlaY8ow==
X-Google-Smtp-Source: ABdhPJzzOer/yoyYAkGEngrrkIxCXeN4ubZ2ioZ8r/urX9M1M30k4ZLRXB+XsdyZtF+LNqgSondPBisZGJ5oJIw8sHk=
X-Received: by 2002:a05:6402:1157:: with SMTP id
 g23mr2292543edw.379.1635388338395; 
 Wed, 27 Oct 2021 19:32:18 -0700 (PDT)
MIME-Version: 1.0
References: <20211025124319.195290-1-rpathak@ventanamicro.com>
 <20211025124319.195290-3-rpathak@ventanamicro.com>
 <CAKmqyKMVEZkKdp0vmFo_tc4oFuVhaTRXBiB-uEksYtfjyRibqw@mail.gmail.com>
In-Reply-To: <CAKmqyKMVEZkKdp0vmFo_tc4oFuVhaTRXBiB-uEksYtfjyRibqw@mail.gmail.com>
From: Rahul Pathak <rpathak@ventanamicro.com>
Date: Thu, 28 Oct 2021 08:01:42 +0530
Message-ID: <CA+Oz1=Ya_j-d1eMJ+jrw=TNWd6EOM613vONR9UU=9ny5MGg=Hg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] target/riscv: csr: Implement mconfigptr CSR
To: Alistair Francis <alistair23@gmail.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: multipart/alternative; boundary="000000000000faf96805cf6084c9"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=rpathak@ventanamicro.com; helo=mail-ed1-x531.google.com
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
X-List-Received-Date: Thu, 28 Oct 2021 02:32:24 -0000

--000000000000faf96805cf6084c9
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 27, 2021 at 8:13 AM Alistair Francis <alistair23@gmail.com>
wrote:

> On Mon, Oct 25, 2021 at 10:55 PM Rahul Pathak <rpathak@ventanamicro.com>
> wrote:
> >
> > Signed-off-by: Rahul Pathak <rpathak@ventanamicro.com>
> > ---
> >  target/riscv/cpu_bits.h |  1 +
> >  target/riscv/csr.c      | 19 +++++++++++++++----
> >  2 files changed, 16 insertions(+), 4 deletions(-)
> >
> > diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> > index cffcd3a5df..e2f154b7c5 100644
> > --- a/target/riscv/cpu_bits.h
> > +++ b/target/riscv/cpu_bits.h
> > @@ -140,6 +140,7 @@
> >  #define CSR_MARCHID         0xf12
> >  #define CSR_MIMPID          0xf13
> >  #define CSR_MHARTID         0xf14
> > +#define CSR_MCONFIGPTR      0xf15
> >
> >  /* Machine Trap Setup */
> >  #define CSR_MSTATUS         0x300
> > diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> > index 69e4d65fcd..2d7f608d49 100644
> > --- a/target/riscv/csr.c
> > +++ b/target/riscv/csr.c
> > @@ -209,6 +209,16 @@ static RISCVException epmp(CPURISCVState *env, int
> csrno)
> >
> >      return RISCV_EXCP_ILLEGAL_INST;
> >  }
> > +
> > +static RISCVException priv1p12(CPURISCVState *env, int csrno)
> > +{
> > +       if (env->priv_ver >= PRIV_VERSION_1_12_0) {
> > +               return RISCV_EXCP_NONE;
> > +       }
> > +
> > +       return RISCV_EXCP_ILLEGAL_INST;
> > +}
> > +
> >  #endif
> >
> >  /* User Floating-Point CSRs */
> > @@ -1569,10 +1579,11 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
> >      [CSR_MINSTRETH] = { "minstreth", any32, read_instreth },
> >
> >      /* Machine Information Registers */
> > -    [CSR_MVENDORID] = { "mvendorid", any,   read_zero    },
> > -    [CSR_MARCHID]   = { "marchid",   any,   read_zero    },
> > -    [CSR_MIMPID]    = { "mimpid",    any,   read_zero    },
> > -    [CSR_MHARTID]   = { "mhartid",   any,   read_mhartid },
> > +    [CSR_MVENDORID] = { "mvendorid",   any,            read_zero    },
> > +    [CSR_MARCHID]   = { "marchid",     any,            read_zero    },
> > +    [CSR_MIMPID]    = { "mimpid",      any,            read_zero    },
> > +    [CSR_MHARTID]   = { "mhartid",     any,            read_mhartid },
>
> Why change these?
>
The alignment of all structure entries is consistent in their respective
blocks, that's why I aligned these with the mconfigptr line.
It's really not necessary and if my observation on the alignment is
really not a requirement I will undo this.



>
>
>
> > +    [CSR_MCONFIGPTR] = {"mconfigptr",  priv1p12,       read_zero    },
>
> This looks fine, but there are more changes then this in v1.12.
> Looking at the preface we need mret/sret changes at least. It also
> looks like some other changes will need to be implemented or at least
> checked.
>
>
Agree, I will look into that


> Alistair
>
> >
> >      /* Machine Trap Setup */
> >      [CSR_MSTATUS]     = { "mstatus",    any,   read_mstatus,
>  write_mstatus     },
> > --
> > 2.25.1
> >
> >
>

--000000000000faf96805cf6084c9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-family:verdana,sans-serif"><br></div></div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Oct 27, 2021 at 8:13 AM Alis=
tair Francis &lt;<a href=3D"mailto:alistair23@gmail.com">alistair23@gmail.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">On Mon, Oct 25, 2021 at 10:55 PM Rahul Pathak &lt;<a href=3D"mailto:rpath=
ak@ventanamicro.com" target=3D"_blank">rpathak@ventanamicro.com</a>&gt; wro=
te:<br>
&gt;<br>
&gt; Signed-off-by: Rahul Pathak &lt;<a href=3D"mailto:rpathak@ventanamicro=
.com" target=3D"_blank">rpathak@ventanamicro.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 target/riscv/cpu_bits.h |=C2=A0 1 +<br>
&gt;=C2=A0 target/riscv/csr.c=C2=A0 =C2=A0 =C2=A0 | 19 +++++++++++++++----<=
br>
&gt;=C2=A0 2 files changed, 16 insertions(+), 4 deletions(-)<br>
&gt;<br>
&gt; diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h<br>
&gt; index cffcd3a5df..e2f154b7c5 100644<br>
&gt; --- a/target/riscv/cpu_bits.h<br>
&gt; +++ b/target/riscv/cpu_bits.h<br>
&gt; @@ -140,6 +140,7 @@<br>
&gt;=C2=A0 #define CSR_MARCHID=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00xf12<br>
&gt;=C2=A0 #define CSR_MIMPID=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0xf13<br>
&gt;=C2=A0 #define CSR_MHARTID=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00xf14<br>
&gt; +#define CSR_MCONFIGPTR=C2=A0 =C2=A0 =C2=A0 0xf15<br>
&gt;<br>
&gt;=C2=A0 /* Machine Trap Setup */<br>
&gt;=C2=A0 #define CSR_MSTATUS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x300<br>
&gt; diff --git a/target/riscv/csr.c b/target/riscv/csr.c<br>
&gt; index 69e4d65fcd..2d7f608d49 100644<br>
&gt; --- a/target/riscv/csr.c<br>
&gt; +++ b/target/riscv/csr.c<br>
&gt; @@ -209,6 +209,16 @@ static RISCVException epmp(CPURISCVState *env, in=
t csrno)<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return RISCV_EXCP_ILLEGAL_INST;<br>
&gt;=C2=A0 }<br>
&gt; +<br>
&gt; +static RISCVException priv1p12(CPURISCVState *env, int csrno)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (env-&gt;priv_ver &gt;=3D PRIV_VERSION_=
1_12_0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return RISCV_E=
XCP_NONE;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return RISCV_EXCP_ILLEGAL_INST;<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 #endif<br>
&gt;<br>
&gt;=C2=A0 /* User Floating-Point CSRs */<br>
&gt; @@ -1569,10 +1579,11 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =
=3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 [CSR_MINSTRETH] =3D { &quot;minstreth&quot;, any32=
, read_instreth },<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 /* Machine Information Registers */<br>
&gt; -=C2=A0 =C2=A0 [CSR_MVENDORID] =3D { &quot;mvendorid&quot;, any,=C2=A0=
 =C2=A0read_zero=C2=A0 =C2=A0 },<br>
&gt; -=C2=A0 =C2=A0 [CSR_MARCHID]=C2=A0 =C2=A0=3D { &quot;marchid&quot;,=C2=
=A0 =C2=A0any,=C2=A0 =C2=A0read_zero=C2=A0 =C2=A0 },<br>
&gt; -=C2=A0 =C2=A0 [CSR_MIMPID]=C2=A0 =C2=A0 =3D { &quot;mimpid&quot;,=C2=
=A0 =C2=A0 any,=C2=A0 =C2=A0read_zero=C2=A0 =C2=A0 },<br>
&gt; -=C2=A0 =C2=A0 [CSR_MHARTID]=C2=A0 =C2=A0=3D { &quot;mhartid&quot;,=C2=
=A0 =C2=A0any,=C2=A0 =C2=A0read_mhartid },<br>
&gt; +=C2=A0 =C2=A0 [CSR_MVENDORID] =3D { &quot;mvendorid&quot;,=C2=A0 =C2=
=A0any,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 read_zero=C2=A0 =C2=A0 },<=
br>
&gt; +=C2=A0 =C2=A0 [CSR_MARCHID]=C2=A0 =C2=A0=3D { &quot;marchid&quot;,=C2=
=A0 =C2=A0 =C2=A0any,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 read_zero=C2=
=A0 =C2=A0 },<br>
&gt; +=C2=A0 =C2=A0 [CSR_MIMPID]=C2=A0 =C2=A0 =3D { &quot;mimpid&quot;,=C2=
=A0 =C2=A0 =C2=A0 any,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 read_zero=
=C2=A0 =C2=A0 },<br>
&gt; +=C2=A0 =C2=A0 [CSR_MHARTID]=C2=A0 =C2=A0=3D { &quot;mhartid&quot;,=C2=
=A0 =C2=A0 =C2=A0any,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 read_mhartid=
 },<br>
<br>
Why change these?<br></blockquote><div><div class=3D"gmail_default" style=
=3D"font-family:verdana,sans-serif">The alignment of all structure entries =
is consistent in their respective=C2=A0</div><div class=3D"gmail_default" s=
tyle=3D"font-family:verdana,sans-serif">blocks, that&#39;s why I aligned th=
ese with the mconfigptr=C2=A0line.</div><div class=3D"gmail_default" style=
=3D"font-family:verdana,sans-serif">It&#39;s really not necessary and if my=
 observation on the alignment is</div><div class=3D"gmail_default" style=3D=
"font-family:verdana,sans-serif">really not a requirement I will undo this.=
</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">
<br>
<br>
<br>
&gt; +=C2=A0 =C2=A0 [CSR_MCONFIGPTR] =3D {&quot;mconfigptr&quot;,=C2=A0 pri=
v1p12,=C2=A0 =C2=A0 =C2=A0 =C2=A0read_zero=C2=A0 =C2=A0 },<br>
<br>
This looks fine, but there are more changes then this in v1.12.<br>
Looking at the preface we need mret/sret changes at least. It also<br>
looks like some other changes will need to be implemented or at least<br>
checked.<br>
<br></blockquote><div>=C2=A0</div><div><span class=3D"gmail_default" style=
=3D"font-family:verdana,sans-serif">Agree, I will look into that</span></di=
v><div><span class=3D"gmail_default" style=3D"font-family:verdana,sans-seri=
f"></span>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Alistair<br>
<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 /* Machine Trap Setup */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 [CSR_MSTATUS]=C2=A0 =C2=A0 =C2=A0=3D { &quot;mstat=
us&quot;,=C2=A0 =C2=A0 any,=C2=A0 =C2=A0read_mstatus,=C2=A0 =C2=A0 =C2=A0wr=
ite_mstatus=C2=A0 =C2=A0 =C2=A0},<br>
&gt; --<br>
&gt; 2.25.1<br>
&gt;<br>
&gt;<br>
</blockquote></div></div>

--000000000000faf96805cf6084c9--

