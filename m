Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1hzkfy-0001B5-6b
	for mharc-qemu-riscv@gnu.org; Mon, 19 Aug 2019 12:38:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40524)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <chihmin.chao@sifive.com>) id 1hzkfu-00014k-Bo
 for qemu-riscv@nongnu.org; Mon, 19 Aug 2019 12:38:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <chihmin.chao@sifive.com>) id 1hzkfs-0000K9-C3
 for qemu-riscv@nongnu.org; Mon, 19 Aug 2019 12:38:30 -0400
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42]:37451)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <chihmin.chao@sifive.com>)
 id 1hzkfs-0000JU-1l
 for qemu-riscv@nongnu.org; Mon, 19 Aug 2019 12:38:28 -0400
Received: by mail-io1-xd42.google.com with SMTP id q22so5679595iog.4
 for <qemu-riscv@nongnu.org>; Mon, 19 Aug 2019 09:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LqaMVi2bhKEsy7fqdRpYFiDwvc9O1DVGTsv5s250QcQ=;
 b=BYKbTk6DJmlvdHwMz0s5lx0Iz1BHVk/HfPHqprIxOOXp+cFQ3tuwZp2IXzRY9P5X1p
 KSwzUxJdbxKSBCGiC0ClvxjqY9Cwqw9IwVHcPg06c7TSMutrPtfkiiIkBvIZP2VENpcl
 ihFDwL9lM917d1G8HteBs5/h9Rh37ZqHnEHok+6XcIU4AdPx1RVUjnB1XzfMJRU6A5PR
 0Nx9aSvSh3653IZrvzVUV8D+Nk2Xa+QQlkFhAn+nTc423Oho71hLUJDnextu6WKGMXr0
 rc5WC5DXM4eFRP19dUiuJidl9Tk5Hq59sGaodnFHTrBUuB9Xn48U0PCYTeHbsZqxWKCB
 HoYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LqaMVi2bhKEsy7fqdRpYFiDwvc9O1DVGTsv5s250QcQ=;
 b=VQGNvnCoF/32/dvqf1SquE2c7FQQey7VhOCkAXVnghtUVUcw8W5E7qCY2uxk7qn98C
 +MoVlOA99I10bpZlReT9KYmKztGeUtmH6YOVyB991V1owmXqubRsTFBUomxj9v1zjNmH
 APLmRLsvlaw7KpypZes5CklSSXN6EvrQ1xBBazwU1lK7Lph5Z8BKgJ6OvKppTCIuoMz1
 CmxSQBE+o/G79D8VqtvuT1Cx+C489Yz2SF8fw+fcxSAmE7sZCzl1gzz7v5v+Ra7rsXtO
 poFqrzhOhiNbSepOvyiP7EmJuENMe/rNs46k186OagPUexqas9HDt2EdzXQ+8a5jXjb1
 iAhQ==
X-Gm-Message-State: APjAAAVkHdpK9fPT2BpvkTC8sf80Kz6VlRE1Dr8jyoaQV1accOmTlOBW
 R6PfTBlyF6G8ma6548tmV4Z0HeZtWyPwQXQBava55Q==
X-Google-Smtp-Source: APXvYqzib2XRArNBbh1PVLHZC9BtixpPG2+lrquZCIF1Zvpj0GPnt8XIKD9LBCc60gaB2wZHL/p5pr41jhdl4ITcCyI=
X-Received: by 2002:a05:6602:228e:: with SMTP id
 d14mr26772808iod.85.1566232706956; 
 Mon, 19 Aug 2019 09:38:26 -0700 (PDT)
MIME-Version: 1.0
References: <0141541d-43ff-98d8-e9d4-4a2fdcfdcf36@c-sky.com>
 <CAKmqyKPr0V6acB2-Y+N1-aoj-5LSofwi=Jz=u6KFJN1fPUWjzA@mail.gmail.com>
 <2b741fb0-0f12-0f07-a516-9cc23abc0b6e@c-sky.com>
In-Reply-To: <2b741fb0-0f12-0f07-a516-9cc23abc0b6e@c-sky.com>
From: Chih-Min Chao <chihmin.chao@sifive.com>
Date: Tue, 20 Aug 2019 00:38:15 +0800
Message-ID: <CAEiOBXU1SbdgJdsn_Cvny4=7NTxE+XQPrQQn6NevBxwB8Wox5w@mail.gmail.com>
To: liuzhiwei <zhiwei_liu@c-sky.com>
Cc: Alistair Francis <alistair23@gmail.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@sifive.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: multipart/alternative; boundary="000000000000225d9d05907af8a1"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::d42
Subject: Re: [Qemu-riscv] [Qemu-devel] RISCV: when will the CLIC be ready?
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
X-List-Received-Date: Mon, 19 Aug 2019 16:38:32 -0000

--000000000000225d9d05907af8a1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 19, 2019 at 9:47 PM liuzhiwei <zhiwei_liu@c-sky.com> wrote:

>
> On 2019/8/17 =E4=B8=8A=E5=8D=881:29, Alistair Francis wrote:
> > On Thu, Aug 15, 2019 at 8:39 PM liuzhiwei<zhiwei_liu@c-sky.com>  wrote:
> >> Hi, Palmer
> >>
> >> When Michael Clark still was the maintainer of RISCV QEMU, he wrote in
> the mail list, "the CLIC interrupt controller is under testing,
> >> and will be included in QEMU 3.1 or 3.2". It is pity that the CLIC is
> not in
> >> included even in QEMU 4.1.0.
> > I see that there is a CLIC branch available here:
> > https://github.com/riscv/riscv-qemu/pull/157
> >
> > It looks like all of the work is in a single commit
> > (
> https://github.com/riscv/riscv-qemu/pull/157/commits/206d9ac339feb9ef2c32=
5402a00f0f45f453d019
> )
> > and that most of the other commits in the PR have already made it into
> > master.
> >
> > Although the CLIC commit is very large it doesn't seem impossible to
> > manually pull out the CLIC bits and apply it onto master.
> >
> > Do you know the state of the CLIC model? If it's working it shouldn't
> > be too hard to rebase the work and get the code into mainline.
> >
> > Alistair
> >
> Hi,  Alistair
>
> In my opinion, the CLIC code almost works.
>
> Last year when my workmate ported an RTOS, I once read the CLIC
> specification and used the CLIC model code. It worked through  all the
> tests after fixed two bugs. I also had sent the patch to Michael, but
> without response(maybe a wrong email address).
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 7bf6cbc..95d80ab 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -505,6 +505,9 @@ static target_ulong riscv_intr_pc(CPURISCVState *env,
>       if (!(async || clic)) {
>           return tvec & ~0b11;
>       }
> +    if (clic) {
> +        cause &=3D 0x3ff;
> +    }
>
>       /* bits [1:0] encode mode; 0 =3D direct, 1 =3D vectored, 2 >=3D res=
erved */
>       switch (mode1) {
> @@ -645,6 +648,9 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>           riscv_cpu_set_mode(env, PRV_M);
>       }
>
> +    if (clic) {
> +        env->exccode =3D 0;
> +    }
>       /* NOTE: it is not necessary to yield load reservations here. It is
> only
>          necessary for an SC from "another hart" to cause a load
> reservation
>          to be yielded. Refer to the memory consistency model section of
> the
>
> After that, the specification has updated and the code may changed. I
> didn't pull new code again.
>
> If the CLIC model may merged into the mainline, and no body maintain the
> code, I'd like to work on it, fixing the bugs and updating the code
> according to latest specification.
>
> Best Regards,
> Zhiwei
>
> >> As we have cpus using CLIC, I have to use the out of tree qemu code in
> SIFIVE
> >> a long time. Could you tell me when it will be upstreamed?
> >>
> >> Best Regards
> >> Zhiwei
> >>
>
>
Hi Zhiwei,

I think what Alistair point out is the latest clic version (or
https://github.com/riscv/riscv-qemu/tree/riscv-qemu-3.1).  The two
versions, on pull request and 3.1 branch, should be similar.
As far as I know, there is no concrete plan on CLIC patch in short term.
It is good to know that the clic patch has been run with real RTOS.
It is also great if you could update the implementation to latest spec and
send the patch again.

chihmin

--000000000000225d9d05907af8a1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Aug 19, 2019 at 9:47 PM liuzh=
iwei &lt;<a href=3D"mailto:zhiwei_liu@c-sky.com" target=3D"_blank">zhiwei_l=
iu@c-sky.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex"><br>
On 2019/8/17 =E4=B8=8A=E5=8D=881:29, Alistair Francis wrote:<br>
&gt; On Thu, Aug 15, 2019 at 8:39 PM liuzhiwei&lt;<a href=3D"mailto:zhiwei_=
liu@c-sky.com" target=3D"_blank">zhiwei_liu@c-sky.com</a>&gt;=C2=A0 wrote:<=
br>
&gt;&gt; Hi, Palmer<br>
&gt;&gt;<br>
&gt;&gt; When Michael Clark still was the maintainer of RISCV QEMU, he wrot=
e in the mail list, &quot;the CLIC interrupt controller is under testing,<b=
r>
&gt;&gt; and will be included in QEMU 3.1 or 3.2&quot;. It is pity that the=
 CLIC is not in<br>
&gt;&gt; included even in QEMU 4.1.0.<br>
&gt; I see that there is a CLIC branch available here:<br>
&gt; <a href=3D"https://github.com/riscv/riscv-qemu/pull/157" rel=3D"norefe=
rrer" target=3D"_blank">https://github.com/riscv/riscv-qemu/pull/157</a><br=
>
&gt;<br>
&gt; It looks like all of the work is in a single commit<br>
&gt; (<a href=3D"https://github.com/riscv/riscv-qemu/pull/157/commits/206d9=
ac339feb9ef2c325402a00f0f45f453d019" rel=3D"noreferrer" target=3D"_blank">h=
ttps://github.com/riscv/riscv-qemu/pull/157/commits/206d9ac339feb9ef2c32540=
2a00f0f45f453d019</a>)<br>
&gt; and that most of the other commits in the PR have already made it into=
<br>
&gt; master.<br>
&gt;<br>
&gt; Although the CLIC commit is very large it doesn&#39;t seem impossible =
to<br>
&gt; manually pull out the CLIC bits and apply it onto master.<br>
&gt;<br>
&gt; Do you know the state of the CLIC model? If it&#39;s working it should=
n&#39;t<br>
&gt; be too hard to rebase the work and get the code into mainline.<br>
&gt;<br>
&gt; Alistair<br>
&gt;<br>
Hi,=C2=A0 Alistair<br>
<br>
In my opinion, the CLIC code almost works.<br>
<br>
Last year when my workmate ported an RTOS, I once read the CLIC specificati=
on and used the CLIC model code. It worked through=C2=A0 all the tests afte=
r fixed two bugs. I also had sent the patch to Michael, but without respons=
e(maybe a wrong email address).<br>
<br>
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c<br>
index 7bf6cbc..95d80ab 100644<br>
--- a/target/riscv/cpu_helper.c<br>
+++ b/target/riscv/cpu_helper.c<br>
@@ -505,6 +505,9 @@ static target_ulong riscv_intr_pc(CPURISCVState *env,<b=
r>
=C2=A0 =C2=A0 =C2=A0 if (!(async || clic)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return tvec &amp; ~0b11;<br>
=C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 if (clic) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cause &amp;=3D 0x3ff;<br>
+=C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0 /* bits [1:0] encode mode; 0 =3D direct, 1 =3D vectore=
d, 2 &gt;=3D reserved */<br>
=C2=A0 =C2=A0 =C2=A0 switch (mode1) {<br>
@@ -645,6 +648,9 @@ void riscv_cpu_do_interrupt(CPUState *cs)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_cpu_set_mode(env, PRV_M);<br>
=C2=A0 =C2=A0 =C2=A0 }<br>
<br>
+=C2=A0 =C2=A0 if (clic) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;exccode =3D 0;<br>
+=C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 /* NOTE: it is not necessary to yield load reservation=
s here. It is only<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0necessary for an SC from &quot;another ha=
rt&quot; to cause a load reservation<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0to be yielded. Refer to the memory consis=
tency model section of the<br>
<br>
After that, the specification has updated and the code may changed. I didn&=
#39;t pull new code again.<br>
<br>
If the CLIC model may merged into the mainline, and no body maintain the co=
de, I&#39;d like to work on it, fixing the bugs and updating the code accor=
ding to latest specification.<br>
<br>
Best Regards,<br>
Zhiwei<br>
<br>
&gt;&gt; As we have cpus using CLIC, I have to use the out of tree qemu cod=
e in SIFIVE<br>
&gt;&gt; a long time. Could you tell me when it will be upstreamed?<br>
&gt;&gt;<br>
&gt;&gt; Best Regards<br>
&gt;&gt; Zhiwei<br>
&gt;&gt;<br>
<br></blockquote><div><br></div><div>Hi Zhiwei,</div><div><br></div><div>I =
think what Alistair point out is the latest clic version (or=C2=A0<a href=
=3D"https://github.com/riscv/riscv-qemu/tree/riscv-qemu-3.1" target=3D"_bla=
nk">https://github.com/riscv/riscv-qemu/tree/riscv-qemu-3.1</a>).=C2=A0 The=
 two versions, on pull request and 3.1 branch, should be similar.</div><div=
>As far as I know, there is no concrete plan on CLIC patch in short term.=
=C2=A0=C2=A0<br>It is good to know that the clic patch has been run with re=
al RTOS.</div><div>It is also great if you could update the implementation =
to latest spec and send the patch again.</div><div><br></div><div>chihmin</=
div></div></div>

--000000000000225d9d05907af8a1--

