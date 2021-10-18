Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcJga-0005J2-NT
	for mharc-qemu-riscv@gnu.org; Sun, 17 Oct 2021 23:51:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mcJgY-0005HZ-C5
 for qemu-riscv@nongnu.org; Sun, 17 Oct 2021 23:51:38 -0400
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b]:40542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mcJgT-0003z4-Ve
 for qemu-riscv@nongnu.org; Sun, 17 Oct 2021 23:51:37 -0400
Received: by mail-io1-xd2b.google.com with SMTP id x1so14610546iof.7
 for <qemu-riscv@nongnu.org>; Sun, 17 Oct 2021 20:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fL1+dtG3QA+7ouU/u8eZLvzSKEbAzc51F8KF1GoSFYI=;
 b=DnPPxFnUyxgSrixZYT1y+b+MzyTEjaj+41SiSaq5ijAEaMbi/MKk4qK3LaCgHXwEE4
 mJwKzIFtoninHUTMZUQ6BRvf8TRFkZXgwL9/w2zftl5QXWPC/CeKJvMqA38B6GwSt9zn
 OIogkP1OJ9CCEEr7RXnw2P8H35iGZM2GDruftue78QWsQPw4PdE4ahSaMtSBkX7HjM6N
 2Q4GMRnccTai0qFLJyHKZMvVDdUH/slsihuomPeKwtXGnognMutob7LKfAxq133erUZp
 6V5/i9XSlYDHuxLPC5ddQ6eGvxxfS8wNuPQhMH+FG3uVwD/Rug4zp/M+x0ubsOipwXxO
 7g+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fL1+dtG3QA+7ouU/u8eZLvzSKEbAzc51F8KF1GoSFYI=;
 b=dAVGtRpmRUj2hxIYlVlQL+dZ2hi5ib0AjQkQY2wnGKGikQB4NKDbph+goz9j+f5pcP
 lh1PsaLITZUzR5jKFympfktyRNUhsrztriFbyjpd4DAQhSJ0CepTx52x/MqabfV084+2
 axUP0T7N++UGcpCqV5clJJbHREYBQxMP1thRgDg+JLT1N8lREb8yA4+ewM45RNqhD5Ne
 p1Apy+6W07Vm3NkB1nYkufwzqdusxR9QuU05LbT9RuzRxlJmp5OgmSlF2YqshSgpM2tr
 ZiqM1WHebxhgSGVziFyin5V9z9u7EyQewkjPG9dpQBdJAaweI7FsGWaCsi1WO5QPlflQ
 WXbw==
X-Gm-Message-State: AOAM533G5HwgZodhLuOILL+jG7s8dMjgatrpkY74yXbS1QhV46XeFqyj
 Vdr94+vvYSaHshzu4g9oqBG84ZH0oZcmE+GtUg3Sxw==
X-Google-Smtp-Source: ABdhPJxmQE10zsCINLmhbRroAoq7Y4F62YcJbku3AioIMDnKI4qNndePPTLHtRFp+tmxnzSMz8fF508Qbsrfwvn7Z08=
X-Received: by 2002:a5d:9256:: with SMTP id e22mr12702683iol.152.1634529092904; 
 Sun, 17 Oct 2021 20:51:32 -0700 (PDT)
MIME-Version: 1.0
References: <20211015065500.3850513-1-frank.chang@sifive.com>
 <20211015065500.3850513-3-frank.chang@sifive.com>
 <4b718269-b222-c08f-ca72-656bacc31331@linaro.org>
 <CAE_xrPibc4W9FqoXUvLQ=pnW7h85ZYnYYwjLR-Rs+0NbifXc-A@mail.gmail.com>
 <2ac1b2bd-efa9-2005-5c0a-cace9346cbd7@linaro.org>
 <CAE_xrPhF+86T9m1taX3RvcMXptnmhUvP-n64S7znL4=vXUa4eg@mail.gmail.com>
 <CAE_xrPg6MF0CmQE+RzdoAavY1gJ-GDbgmh0Lqay3ogG6-zvK5g@mail.gmail.com>
 <CAKmqyKMBn5HS+5_Q5YLw_-Ep_GTscemx-oRphecs-YK-nzS9dA@mail.gmail.com>
In-Reply-To: <CAKmqyKMBn5HS+5_Q5YLw_-Ep_GTscemx-oRphecs-YK-nzS9dA@mail.gmail.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Mon, 18 Oct 2021 11:51:22 +0800
Message-ID: <CAE_xrPi=0Fu_7kfnXhXH=93hFv=CqioUS1Vu-HoAfPRgNDf5hQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] target/riscv: change the api for single/double
 fmin/fmax
To: Alistair Francis <alistair23@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, Bin Meng <bin.meng@windriver.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Chih-Min Chao <chihmin.chao@sifive.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: multipart/alternative; boundary="000000000000f53c3e05ce98759f"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=frank.chang@sifive.com; helo=mail-io1-xd2b.google.com
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
X-List-Received-Date: Mon, 18 Oct 2021 03:51:38 -0000

--000000000000f53c3e05ce98759f
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 18, 2021 at 8:18 AM Alistair Francis <alistair23@gmail.com>
wrote:

> On Sun, Oct 17, 2021 at 4:59 PM Frank Chang <frank.chang@sifive.com>
> wrote:
> >
> > On Sun, Oct 17, 2021 at 8:55 AM Frank Chang <frank.chang@sifive.com>
> wrote:
> >>
> >> On Sun, Oct 17, 2021 at 1:56 AM Richard Henderson <
> richard.henderson@linaro.org> wrote:
> >>>
> >>> On 10/16/21 1:52 AM, Frank Chang wrote:
> >>> > On Sat, Oct 16, 2021 at 1:05 AM Richard Henderson <
> richard.henderson@linaro.org
> >>> > <mailto:richard.henderson@linaro.org>> wrote:
> >>> >
> >>> >     On 10/14/21 11:54 PM, frank.chang@sifive.com <mailto:
> frank.chang@sifive.com> wrote:
> >>> >      > From: Chih-Min Chao<chihmin.chao@sifive.com <mailto:
> chihmin.chao@sifive.com>>
> >>> >      >
> >>> >      > The sNaN propagation behavior has been changed since
> >>> >      > cd20cee7 inhttps://github.com/riscv/riscv-isa-manual
> >>> >     <http://github.com/riscv/riscv-isa-manual>
> >>> >      >
> >>> >      > Signed-off-by: Chih-Min Chao<chihmin.chao@sifive.com <mailto:
> chihmin.chao@sifive.com>>
> >>> >      > ---
> >>> >      >   target/riscv/fpu_helper.c | 8 ++++----
> >>> >      >   1 file changed, 4 insertions(+), 4 deletions(-)
> >>> >      >
> >>> >      > diff --git a/target/riscv/fpu_helper.c
> b/target/riscv/fpu_helper.c
> >>> >      > index 8700516a14c..1472ead2528 100644
> >>> >      > --- a/target/riscv/fpu_helper.c
> >>> >      > +++ b/target/riscv/fpu_helper.c
> >>> >      > @@ -174,14 +174,14 @@ uint64_t helper_fmin_s(CPURISCVState
> *env, uint64_t rs1,
> >>> >     uint64_t rs2)
> >>> >      >   {
> >>> >      >       float32 frs1 = check_nanbox_s(rs1);
> >>> >      >       float32 frs2 = check_nanbox_s(rs2);
> >>> >      > -    return nanbox_s(float32_minnum(frs1, frs2,
> &env->fp_status));
> >>> >      > +    return nanbox_s(float32_minnum_noprop(frs1, frs2,
> &env->fp_status));
> >>> >      >   }
> >>> >
> >>> >     Don't you need to conditionalize behaviour on the isa revision?
> >>> >
> >>> >
> >>> > I will pick the right API based on CPU privilege spec version.
> >>>
> >>> There's a separate F-extension revision number: 2.2.
> >>>
> >>> But I'll leave it up to those more knowledgeable about the revision
> combinations actually
> >>> present in the field to decide.
> >>>
> >>
> >> I did some history searches on RISC-V ISA spec Github repo.
> >>
> >> F-extension was bumped to v2.2 at (2018/08/28):
> >>
> https://github.com/riscv/riscv-isa-manual/releases/tag/draft-20180828-eb78171
> >> The privilege spec is v1.10-draft at the time.
> >>
> >> and later ratified at (2019/03/26):
> >>
> https://github.com/riscv/riscv-isa-manual/releases/tag/IMFDQC-Ratification-20190305
> >>
> >> The spec was updated to use IEEE 754-2019 min/max functions in commit:
> #cd20cee7 (2019/06/05).
> >
> >
> > Sorry, the commit date is 2017/06/05, not 2019/06/05.
> >
> > But I think it's probably easier and clearer to just introduce an extra
> fext_ver variable.
> > We can set CPUs which are Privilege spec v1.10 to RVF v2.0
> (FEXT_VERSION_2_00_0),
> > and others with Privilege spec v1.11 to RVF v2.2 (FEXT_VERSION_2_02_0).
>
> I think it's probably simpler to just tie this to the priv_spec. It's
> not completely accurate, but it should be close enough. Otherwise we
> have the risk of having too many version variables and it becomes a
> pain for users to deal with.
>
> If the unpriv spec is better, we could also introduce that. We will
> probably need that one day for something else anyway.
>
> If you feel that we really need a fext_ver (to avoid large software
> breakage for example) then it's also ok, we just need to justify why.
>
> Alistair
>

A little problem with Unpriv spec is that it uses v2.2 and later with the
date as of version tag.
It shouldn't be a real problem because we can still use the date v2.2. was
released.

But if it's okay to tie RVF version with Priv spec version,
then let's just use Priv spec version for now.
We can introduce other version variables when we really need them in the
future.

Thanks,
Frank Chang


>
> >
> > Any comments are welcome.
> >
> > Regards,
> > Frank Chang
> >
> >>
> >>
> >> Privilege spec v1.11 is ratified at (2019/06/10):
> >>
> https://github.com/riscv/riscv-isa-manual/releases/tag/Ratified-IMFDQC-and-Priv-v1.11
> >>
> >> In fact, Unprivileged spec v2.2 was released at (2017/05/10):
> >> https://github.com/riscv/riscv-isa-manual/releases/tag/riscv-user-2.2
> >>
> >> and Privilege spec v1.10 was released at (2017/05/10):
> >> https://github.com/riscv/riscv-isa-manual/releases/tag/riscv-priv-1.10
> >>
> >> Privilege spec was then bumped to v1.11-draft in the next draft release
> right after v1.10 (2018/05/24):
> >>
> https://github.com/riscv/riscv-isa-manual/releases/tag/draft-20180524001518-9981ad7
> >> (RVF was still v2.0 at the time.)
> >>
> >> It seems that when Privilege spec v1.11 was ratified, RVF had been
> bumped to v2.2,
> >> and when Privilege spec v1.10 was ratified, RVF was still v2.0.
> >>
> >> As in QEMU, there's only priv_ver variable existing for now.
> >> So unless we introduce other variables like: unpriv_ver or fext_ver.
> >> Otherwise, I think using priv_ver is still valid here.
> >> Though it is not accurate, somehow confused,
> >> and may not be true anymore in future standards.
> >>
> >> Let me know which way is better for our maintenance.
> >>
> >> Thanks,
> >> Frank Chang
> >>
> >>> r~
>

--000000000000f53c3e05ce98759f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, Oct 18, 2021 at 8:18 AM Alistair =
Francis &lt;<a href=3D"mailto:alistair23@gmail.com">alistair23@gmail.com</a=
>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">On Sun, Oct 17, 2021 at 4:59 PM Frank Chang &lt;<a =
href=3D"mailto:frank.chang@sifive.com" target=3D"_blank">frank.chang@sifive=
.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Sun, Oct 17, 2021 at 8:55 AM Frank Chang &lt;<a href=3D"mailto:fran=
k.chang@sifive.com" target=3D"_blank">frank.chang@sifive.com</a>&gt; wrote:=
<br>
&gt;&gt;<br>
&gt;&gt; On Sun, Oct 17, 2021 at 1:56 AM Richard Henderson &lt;<a href=3D"m=
ailto:richard.henderson@linaro.org" target=3D"_blank">richard.henderson@lin=
aro.org</a>&gt; wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On 10/16/21 1:52 AM, Frank Chang wrote:<br>
&gt;&gt;&gt; &gt; On Sat, Oct 16, 2021 at 1:05 AM Richard Henderson &lt;<a =
href=3D"mailto:richard.henderson@linaro.org" target=3D"_blank">richard.hend=
erson@linaro.org</a><br>
&gt;&gt;&gt; &gt; &lt;mailto:<a href=3D"mailto:richard.henderson@linaro.org=
" target=3D"_blank">richard.henderson@linaro.org</a>&gt;&gt; wrote:<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0On 10/14/21 11:54 PM, <a href=3D"mailt=
o:frank.chang@sifive.com" target=3D"_blank">frank.chang@sifive.com</a> &lt;=
mailto:<a href=3D"mailto:frank.chang@sifive.com" target=3D"_blank">frank.ch=
ang@sifive.com</a>&gt; wrote:<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; From: Chih-Min Chao&lt;<a href=
=3D"mailto:chihmin.chao@sifive.com" target=3D"_blank">chihmin.chao@sifive.c=
om</a> &lt;mailto:<a href=3D"mailto:chihmin.chao@sifive.com" target=3D"_bla=
nk">chihmin.chao@sifive.com</a>&gt;&gt;<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; The sNaN propagation behavior ha=
s been changed since<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; cd20cee7 inhttps://<a href=3D"ht=
tp://github.com/riscv/riscv-isa-manual" rel=3D"noreferrer" target=3D"_blank=
">github.com/riscv/riscv-isa-manual</a><br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://github.com/riscv=
/riscv-isa-manual" rel=3D"noreferrer" target=3D"_blank">http://github.com/r=
iscv/riscv-isa-manual</a>&gt;<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; Signed-off-by: Chih-Min Chao&lt;=
<a href=3D"mailto:chihmin.chao@sifive.com" target=3D"_blank">chihmin.chao@s=
ifive.com</a> &lt;mailto:<a href=3D"mailto:chihmin.chao@sifive.com" target=
=3D"_blank">chihmin.chao@sifive.com</a>&gt;&gt;<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; ---<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0target/riscv/fpu_hel=
per.c | 8 ++++----<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A01 file changed, 4 in=
sertions(+), 4 deletions(-)<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; diff --git a/target/riscv/fpu_he=
lper.c b/target/riscv/fpu_helper.c<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; index 8700516a14c..1472ead2528 1=
00644<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; --- a/target/riscv/fpu_helper.c<=
br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +++ b/target/riscv/fpu_helper.c<=
br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; @@ -174,14 +174,14 @@ uint64_t h=
elper_fmin_s(CPURISCVState *env, uint64_t rs1,<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0uint64_t rs2)<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0{<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0float3=
2 frs1 =3D check_nanbox_s(rs1);<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0float3=
2 frs2 =3D check_nanbox_s(rs2);<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0 return nanbox_s(f=
loat32_minnum(frs1, frs2, &amp;env-&gt;fp_status));<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 return nanbox_s(f=
loat32_minnum_noprop(frs1, frs2, &amp;env-&gt;fp_status));<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0}<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0Don&#39;t you need to conditionalize b=
ehaviour on the isa revision?<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; I will pick the right API based on CPU privilege spec ver=
sion.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; There&#39;s a separate F-extension revision number: 2.2.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; But I&#39;ll leave it up to those more knowledgeable about the=
 revision combinations actually<br>
&gt;&gt;&gt; present in the field to decide.<br>
&gt;&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; I did some history searches on RISC-V ISA spec Github repo.<br>
&gt;&gt;<br>
&gt;&gt; F-extension was bumped to v2.2 at (2018/08/28):<br>
&gt;&gt; <a href=3D"https://github.com/riscv/riscv-isa-manual/releases/tag/=
draft-20180828-eb78171" rel=3D"noreferrer" target=3D"_blank">https://github=
.com/riscv/riscv-isa-manual/releases/tag/draft-20180828-eb78171</a><br>
&gt;&gt; The privilege spec is v1.10-draft at the time.<br>
&gt;&gt;<br>
&gt;&gt; and later ratified at (2019/03/26):<br>
&gt;&gt; <a href=3D"https://github.com/riscv/riscv-isa-manual/releases/tag/=
IMFDQC-Ratification-20190305" rel=3D"noreferrer" target=3D"_blank">https://=
github.com/riscv/riscv-isa-manual/releases/tag/IMFDQC-Ratification-20190305=
</a><br>
&gt;&gt;<br>
&gt;&gt; The spec was updated to use IEEE 754-2019 min/max functions in com=
mit: #cd20cee7 (2019/06/05).<br>
&gt;<br>
&gt;<br>
&gt; Sorry, the commit date is 2017/06/05, not 2019/06/05.<br>
&gt;<br>
&gt; But I think it&#39;s probably easier and clearer to just introduce an =
extra fext_ver variable.<br>
&gt; We can set CPUs which are Privilege spec v1.10 to RVF v2.0 (FEXT_VERSI=
ON_2_00_0),<br>
&gt; and others with Privilege spec v1.11 to RVF v2.2 (FEXT_VERSION_2_02_0)=
.<br>
<br>
I think it&#39;s probably simpler to just tie this to the priv_spec. It&#39=
;s<br>
not completely accurate, but it should be close enough. Otherwise we<br>
have the risk of having too many version variables and it becomes a<br>
pain for users to deal with.<br>
<br>
If the unpriv spec is better, we could also introduce that. We will<br>
probably need that one day for something else anyway.<br>
<br>
If you feel that we really need a fext_ver (to avoid large software<br>
breakage for example) then it&#39;s also ok, we just need to justify why.<b=
r>
<br>
Alistair<br></blockquote><div><br></div><div>A little problem with Unpriv s=
pec is that it uses v2.2 and later with the date as of version tag.</div><d=
iv>It shouldn&#39;t be a real problem because we can still use the date v2.=
2. was released.</div><div><br></div><div>But if it&#39;s okay to tie RVF v=
ersion with Priv spec version,</div><div>then let&#39;s just use Priv spec =
version for now.</div><div>We can introduce other version variables when we=
 really need them in the future.</div><div><br></div><div>Thanks,</div><div=
>Frank Chang</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
&gt;<br>
&gt; Any comments are welcome.<br>
&gt;<br>
&gt; Regards,<br>
&gt; Frank Chang<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Privilege spec v1.11 is ratified at (2019/06/10):<br>
&gt;&gt; <a href=3D"https://github.com/riscv/riscv-isa-manual/releases/tag/=
Ratified-IMFDQC-and-Priv-v1.11" rel=3D"noreferrer" target=3D"_blank">https:=
//github.com/riscv/riscv-isa-manual/releases/tag/Ratified-IMFDQC-and-Priv-v=
1.11</a><br>
&gt;&gt;<br>
&gt;&gt; In fact, Unprivileged spec v2.2 was released at (2017/05/10):<br>
&gt;&gt; <a href=3D"https://github.com/riscv/riscv-isa-manual/releases/tag/=
riscv-user-2.2" rel=3D"noreferrer" target=3D"_blank">https://github.com/ris=
cv/riscv-isa-manual/releases/tag/riscv-user-2.2</a><br>
&gt;&gt;<br>
&gt;&gt; and Privilege spec v1.10 was released at (2017/05/10):<br>
&gt;&gt; <a href=3D"https://github.com/riscv/riscv-isa-manual/releases/tag/=
riscv-priv-1.10" rel=3D"noreferrer" target=3D"_blank">https://github.com/ri=
scv/riscv-isa-manual/releases/tag/riscv-priv-1.10</a><br>
&gt;&gt;<br>
&gt;&gt; Privilege spec was then bumped to v1.11-draft in the next draft re=
lease right after v1.10 (2018/05/24):<br>
&gt;&gt; <a href=3D"https://github.com/riscv/riscv-isa-manual/releases/tag/=
draft-20180524001518-9981ad7" rel=3D"noreferrer" target=3D"_blank">https://=
github.com/riscv/riscv-isa-manual/releases/tag/draft-20180524001518-9981ad7=
</a><br>
&gt;&gt; (RVF was still v2.0 at the time.)<br>
&gt;&gt;<br>
&gt;&gt; It seems that when Privilege spec v1.11 was ratified, RVF had been=
 bumped to v2.2,<br>
&gt;&gt; and when Privilege spec v1.10 was ratified, RVF was still v2.0.<br=
>
&gt;&gt;<br>
&gt;&gt; As in QEMU, there&#39;s only priv_ver variable existing for now.<b=
r>
&gt;&gt; So unless we introduce other variables like: unpriv_ver or fext_ve=
r.<br>
&gt;&gt; Otherwise, I think using priv_ver is still valid here.<br>
&gt;&gt; Though it is not accurate, somehow confused,<br>
&gt;&gt; and may not be true anymore in future standards.<br>
&gt;&gt;<br>
&gt;&gt; Let me know which way is better for our maintenance.<br>
&gt;&gt;<br>
&gt;&gt; Thanks,<br>
&gt;&gt; Frank Chang<br>
&gt;&gt;<br>
&gt;&gt;&gt; r~<br>
</blockquote></div></div>

--000000000000f53c3e05ce98759f--

