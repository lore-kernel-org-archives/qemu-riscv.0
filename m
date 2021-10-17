Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mbuSz-0001wM-Hf
	for mharc-qemu-riscv@gnu.org; Sat, 16 Oct 2021 20:55:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbuSw-0001uw-PM
 for qemu-riscv@nongnu.org; Sat, 16 Oct 2021 20:55:54 -0400
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b]:36489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbuSt-0004DT-Ge
 for qemu-riscv@nongnu.org; Sat, 16 Oct 2021 20:55:53 -0400
Received: by mail-il1-x12b.google.com with SMTP id h10so11193778ilq.3
 for <qemu-riscv@nongnu.org>; Sat, 16 Oct 2021 17:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3iHm5eGI489TLcY19FXeaLUzzLoZD0XjaLWusUPucmM=;
 b=X7m8wJyCxNxOHw0s/u6c/cLoCxGT/MjtxDFdRwfzXNsMIvLP2CwV4UR8A31Wc4ObD5
 HixT0Kx08REaDKLVgOr3xAX2uGJBYwOnMzbIxFhz7Y5Y06Dv0dRwm3oNyr6WEuwY+NpZ
 SEfwFIOl8E9nCR9ZfhwBSY1OR+CCmF1FL9hLRF4A7JGOTd1UfmNnd8nCrmokCxoAoSJW
 DKNgGJDML554Z+TdTS8b5bGeCWV01NyGXPOU9XQLD3dw6ob+8ghKK7xGE1xOAbPqL5nu
 k/UGDZRY9R9rTm2JjxXky6WE2O3vkOIyLYuCPNqIHyleJh2UJLaDcbCjvR9YSkJd6xEA
 1wyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3iHm5eGI489TLcY19FXeaLUzzLoZD0XjaLWusUPucmM=;
 b=yCA97qmA4aWX44eM5kCrtKyWvjyWnU1cfCz2RRllXs5BwdWvZE31XL9LNFSgmgVe9/
 UVf1MgQOHGGqOPBzg/Y078HHsADzG/NiGUpp6F5mXnYPJY+QJn+2Tm7bq2nqSgD0Ah/s
 UFa+gvjV9frlLsp1SFDs/qtKI/8fpCWQ78u4udJ+Cov2I+sEoGxH0F4hA86M5LPd4Ykl
 rLZWi3IIit8hgCGD85a5/pJMCLKK+8WeMWxpokcY7IY4gJSREGvwEY7MCD/2m3EGSXCm
 KW/kIW7dNpuexgKBFAjtTp2iNUiQMBXkVaI3XrtMtZb4QztITguvjrn1VkfNsSAOuo3G
 Mc8w==
X-Gm-Message-State: AOAM533i/oeARMkIXouAKuh+ex7zHBVYzTd/7WaqZafMa0h/t1l4Wlgt
 1nBa6E4OkrLnaNNhjItj5PeVnj7Leb0xSjduB6LudA==
X-Google-Smtp-Source: ABdhPJxNMT3SFzrQpihIviBGgTYik9WpcbinJ2fYjPKCyYnvxmlP/hFBHM9vx9zRl8APnOmlIZgJTTulZQwDjCWNMNw=
X-Received: by 2002:a05:6e02:893:: with SMTP id
 z19mr9022336ils.224.1634432149663; 
 Sat, 16 Oct 2021 17:55:49 -0700 (PDT)
MIME-Version: 1.0
References: <20211015065500.3850513-1-frank.chang@sifive.com>
 <20211015065500.3850513-3-frank.chang@sifive.com>
 <4b718269-b222-c08f-ca72-656bacc31331@linaro.org>
 <CAE_xrPibc4W9FqoXUvLQ=pnW7h85ZYnYYwjLR-Rs+0NbifXc-A@mail.gmail.com>
 <2ac1b2bd-efa9-2005-5c0a-cace9346cbd7@linaro.org>
In-Reply-To: <2ac1b2bd-efa9-2005-5c0a-cace9346cbd7@linaro.org>
From: Frank Chang <frank.chang@sifive.com>
Date: Sun, 17 Oct 2021 08:55:38 +0800
Message-ID: <CAE_xrPhF+86T9m1taX3RvcMXptnmhUvP-n64S7znL4=vXUa4eg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] target/riscv: change the api for single/double
 fmin/fmax
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Chih-Min Chao <chihmin.chao@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: multipart/alternative; boundary="000000000000b0d0a205ce81e3cd"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12b;
 envelope-from=frank.chang@sifive.com; helo=mail-il1-x12b.google.com
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
X-List-Received-Date: Sun, 17 Oct 2021 00:55:55 -0000

--000000000000b0d0a205ce81e3cd
Content-Type: text/plain; charset="UTF-8"

On Sun, Oct 17, 2021 at 1:56 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 10/16/21 1:52 AM, Frank Chang wrote:
> > On Sat, Oct 16, 2021 at 1:05 AM Richard Henderson <
> richard.henderson@linaro.org
> > <mailto:richard.henderson@linaro.org>> wrote:
> >
> >     On 10/14/21 11:54 PM, frank.chang@sifive.com <mailto:
> frank.chang@sifive.com> wrote:
> >      > From: Chih-Min Chao<chihmin.chao@sifive.com <mailto:
> chihmin.chao@sifive.com>>
> >      >
> >      > The sNaN propagation behavior has been changed since
> >      > cd20cee7 inhttps://github.com/riscv/riscv-isa-manual
> >     <http://github.com/riscv/riscv-isa-manual>
> >      >
> >      > Signed-off-by: Chih-Min Chao<chihmin.chao@sifive.com <mailto:
> chihmin.chao@sifive.com>>
> >      > ---
> >      >   target/riscv/fpu_helper.c | 8 ++++----
> >      >   1 file changed, 4 insertions(+), 4 deletions(-)
> >      >
> >      > diff --git a/target/riscv/fpu_helper.c b/target/riscv/fpu_helper.c
> >      > index 8700516a14c..1472ead2528 100644
> >      > --- a/target/riscv/fpu_helper.c
> >      > +++ b/target/riscv/fpu_helper.c
> >      > @@ -174,14 +174,14 @@ uint64_t helper_fmin_s(CPURISCVState *env,
> uint64_t rs1,
> >     uint64_t rs2)
> >      >   {
> >      >       float32 frs1 = check_nanbox_s(rs1);
> >      >       float32 frs2 = check_nanbox_s(rs2);
> >      > -    return nanbox_s(float32_minnum(frs1, frs2, &env->fp_status));
> >      > +    return nanbox_s(float32_minnum_noprop(frs1, frs2,
> &env->fp_status));
> >      >   }
> >
> >     Don't you need to conditionalize behaviour on the isa revision?
> >
> >
> > I will pick the right API based on CPU privilege spec version.
>
> There's a separate F-extension revision number: 2.2.
>
> But I'll leave it up to those more knowledgeable about the revision
> combinations actually
> present in the field to decide.
>
>
I did some history searches on RISC-V ISA spec Github repo.

F-extension was bumped to v2.2 at (2018/08/28):
https://github.com/riscv/riscv-isa-manual/releases/tag/draft-20180828-eb78171
The privilege spec is v1.10-draft at the time.

and later ratified at (2019/03/26):
https://github.com/riscv/riscv-isa-manual/releases/tag/IMFDQC-Ratification-20190305

The spec was updated to use IEEE 754-2019 min/max functions in commit:
#cd20cee7
<https://github.com/riscv/riscv-isa-manual/commit/cd20cee7efd9bac7c5aa127ec3b451749d2b3cce>
 (2019/06/05).

Privilege spec v1.11 is ratified at (2019/06/10):
https://github.com/riscv/riscv-isa-manual/releases/tag/Ratified-IMFDQC-and-Priv-v1.11

In fact, Unprivileged spec v2.2 was released at (2017/05/10):
https://github.com/riscv/riscv-isa-manual/releases/tag/riscv-user-2.2

and Privilege spec v1.10 was released at (2017/05/10):
https://github.com/riscv/riscv-isa-manual/releases/tag/riscv-priv-1.10

Privilege spec was then bumped to v1.11-draft in the next draft release
right after v1.10 (2018/05/24):
https://github.com/riscv/riscv-isa-manual/releases/tag/draft-20180524001518-9981ad7
(RVF was still v2.0 at the time.)

It seems that when Privilege spec v1.11 was ratified, RVF had been bumped
to v2.2,
and when Privilege spec v1.10 was ratified, RVF was still v2.0.

As in QEMU, there's only *priv_ver* variable existing for now.
So unless we introduce other variables like: *unpriv_ver* or *fext_ver*.
Otherwise, I think using *priv_ver* is still valid here.
Though it is not accurate, somehow confused,
and may not be true anymore in future standards.

Let me know which way is better for our maintenance.

Thanks,
Frank Chang

r~
>

--000000000000b0d0a205ce81e3cd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sun, Oct 17, 2021 at 1:56 AM Richard H=
enderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.hender=
son@linaro.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">On 10/16/21 1:52 AM, Frank Chang w=
rote:<br>
&gt; On Sat, Oct 16, 2021 at 1:05 AM Richard Henderson &lt;<a href=3D"mailt=
o:richard.henderson@linaro.org" target=3D"_blank">richard.henderson@linaro.=
org</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:richard.henderson@linaro.org" target=3D"_=
blank">richard.henderson@linaro.org</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On 10/14/21 11:54 PM, <a href=3D"mailto:frank.chang=
@sifive.com" target=3D"_blank">frank.chang@sifive.com</a> &lt;mailto:<a hre=
f=3D"mailto:frank.chang@sifive.com" target=3D"_blank">frank.chang@sifive.co=
m</a>&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; From: Chih-Min Chao&lt;<a href=3D"mailto:chih=
min.chao@sifive.com" target=3D"_blank">chihmin.chao@sifive.com</a> &lt;mail=
to:<a href=3D"mailto:chihmin.chao@sifive.com" target=3D"_blank">chihmin.cha=
o@sifive.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; The sNaN propagation behavior has been change=
d since<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; cd20cee7 inhttps://<a href=3D"http://github.c=
om/riscv/riscv-isa-manual" rel=3D"noreferrer" target=3D"_blank">github.com/=
riscv/riscv-isa-manual</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://github.com/riscv/riscv-isa-ma=
nual" rel=3D"noreferrer" target=3D"_blank">http://github.com/riscv/riscv-is=
a-manual</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Signed-off-by: Chih-Min Chao&lt;<a href=3D"ma=
ilto:chihmin.chao@sifive.com" target=3D"_blank">chihmin.chao@sifive.com</a>=
 &lt;mailto:<a href=3D"mailto:chihmin.chao@sifive.com" target=3D"_blank">ch=
ihmin.chao@sifive.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ---<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0target/riscv/fpu_helper.c | 8 +++=
+----<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A01 file changed, 4 insertions(+), =
4 deletions(-)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; diff --git a/target/riscv/fpu_helper.c b/targ=
et/riscv/fpu_helper.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; index 8700516a14c..1472ead2528 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; --- a/target/riscv/fpu_helper.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +++ b/target/riscv/fpu_helper.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; @@ -174,14 +174,14 @@ uint64_t helper_fmin_s(=
CPURISCVState *env, uint64_t rs1,<br>
&gt;=C2=A0 =C2=A0 =C2=A0uint64_t rs2)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0float32 frs1 =3D ch=
eck_nanbox_s(rs1);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0float32 frs2 =3D ch=
eck_nanbox_s(rs2);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0 return nanbox_s(float32_minnum=
(frs1, frs2, &amp;env-&gt;fp_status));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 return nanbox_s(float32_minnum=
_noprop(frs1, frs2, &amp;env-&gt;fp_status));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0}<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Don&#39;t you need to conditionalize behaviour on t=
he isa revision?<br>
&gt; <br>
&gt; <br>
&gt; I will pick the right API based on CPU privilege spec version.<br>
<br>
There&#39;s a separate F-extension revision number: 2.2.<br>
<br>
But I&#39;ll leave it up to those more knowledgeable about the revision com=
binations actually <br>
present in the field to decide.<br><br></blockquote><div><br></div><div>I d=
id some history searches on RISC-V ISA spec Github repo.</div><div><br></di=
v><div>F-extension was bumped to v2.2 at (2018/08/28):</div><div><a href=3D=
"https://github.com/riscv/riscv-isa-manual/releases/tag/draft-20180828-eb78=
171">https://github.com/riscv/riscv-isa-manual/releases/tag/draft-20180828-=
eb78171</a></div><div>The privilege spec is v1.10-draft at the time.</div><=
div><br></div><div>and later ratified at (2019/03/26):</div><div><a href=3D=
"https://github.com/riscv/riscv-isa-manual/releases/tag/IMFDQC-Ratification=
-20190305">https://github.com/riscv/riscv-isa-manual/releases/tag/IMFDQC-Ra=
tification-20190305</a><br></div><div><br></div><div>The spec was updated t=
o use IEEE 754-2019 min/max functions in commit: <a href=3D"https://github.=
com/riscv/riscv-isa-manual/commit/cd20cee7efd9bac7c5aa127ec3b451749d2b3cce"=
>#cd20cee7</a>=C2=A0(2019/06/05).</div><div><br></div><div>Privilege spec v=
1.11 is ratified at (2019/06/10):</div><div><a href=3D"https://github.com/r=
iscv/riscv-isa-manual/releases/tag/Ratified-IMFDQC-and-Priv-v1.11">https://=
github.com/riscv/riscv-isa-manual/releases/tag/Ratified-IMFDQC-and-Priv-v1.=
11</a><br></div><div>=C2=A0</div><div>In fact, Unprivileged=C2=A0spec v2.2 =
was released at (2017/05/10):</div><div><a href=3D"https://github.com/riscv=
/riscv-isa-manual/releases/tag/riscv-user-2.2">https://github.com/riscv/ris=
cv-isa-manual/releases/tag/riscv-user-2.2</a><br></div><div><br></div><div>=
and Privilege spec v1.10 was released at (2017/05/10):</div><div><a href=3D=
"https://github.com/riscv/riscv-isa-manual/releases/tag/riscv-priv-1.10">ht=
tps://github.com/riscv/riscv-isa-manual/releases/tag/riscv-priv-1.10</a><br=
></div><div><br></div><div>Privilege=C2=A0spec was then bumped to v1.11-dra=
ft in the next draft release right after v1.10 (2018/05/24):</div><div><a h=
ref=3D"https://github.com/riscv/riscv-isa-manual/releases/tag/draft-2018052=
4001518-9981ad7">https://github.com/riscv/riscv-isa-manual/releases/tag/dra=
ft-20180524001518-9981ad7</a><br></div><div>(RVF was still v2.0 at the time=
.)</div><div><br></div><div>It seems that when Privilege spec v1.11 was rat=
ified, RVF had been bumped to v2.2,<br></div><div>and when Privilege=C2=A0s=
pec v1.10 was ratified, RVF was still v2.0.</div><div><div><br></div><div>A=
s in QEMU, there&#39;s only=C2=A0<i>priv_ver</i>=C2=A0variable existing for=
 now.</div><div>So unless we introduce=C2=A0other=C2=A0variables like:=C2=
=A0<i>unpriv_ver</i> or <i>fext_ver</i>.</div><div>Otherwise, I think using=
 <i>priv_ver</i> is still valid here.</div></div><div>Though it is not accu=
rate, somehow confused,</div><div>and may not be true anymore in=C2=A0futur=
e standards.</div><div><br></div><div>Let me know which way is better for o=
ur maintenance.</div><div><br></div><div>Thanks,</div><div>Frank Chang</div=
><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
r~<br>
</blockquote></div></div>

--000000000000b0d0a205ce81e3cd--

