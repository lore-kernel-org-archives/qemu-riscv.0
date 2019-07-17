Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hnb2r-0004P7-Pi
	for mharc-qemu-riscv@gnu.org; Tue, 16 Jul 2019 23:55:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47062)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <chihmin.chao@sifive.com>) id 1hnb2o-0004Of-Sp
 for qemu-riscv@nongnu.org; Tue, 16 Jul 2019 23:55:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <chihmin.chao@sifive.com>) id 1hnb2n-0004Ez-Fb
 for qemu-riscv@nongnu.org; Tue, 16 Jul 2019 23:55:54 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:33961)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <chihmin.chao@sifive.com>)
 id 1hnb2n-0004Dt-6L
 for qemu-riscv@nongnu.org; Tue, 16 Jul 2019 23:55:53 -0400
Received: by mail-wr1-x443.google.com with SMTP id 31so23141655wrm.1
 for <qemu-riscv@nongnu.org>; Tue, 16 Jul 2019 20:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jnBei1yTTuleAylaqhr7+3dugwLg+SZA83nWp4EiY+A=;
 b=F4Vz1gTL9d24GYSRA3LpOgsPLKK/Wa7ZDwUzKLQ1MRij7zl2IT/a0qSiTOU4/4boQr
 ZELmKdVVPUk4i+WPTF8TzUsFkDy/GzJP0ICFZZymPlpz39pdKdVUc0fbeuTvXJTFxsp8
 NCBaG3UQKm96kenTyJ3oDOpPX5aHsrI6StcB9keUmX9RXdUGhhsarYJT9FweEVdTtGhs
 dbYALUEP3s8rno7ga2xIq9Dwovsvc4vqXBugvYh1GdW/c+MbN5nIjFScybphkBC0gDez
 K0RQ95gVB3kyuB5KkHFiDb4hy+wN0xp8jAh/y3zKYwvRFyC8Y7gMyRmPCK70ZqA08NnT
 gJyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jnBei1yTTuleAylaqhr7+3dugwLg+SZA83nWp4EiY+A=;
 b=Xpj3uQ7SjYoyWnY+EZZcVyD++e3bYQNaecQgt5E+KfONB/N3z2qYMHLTbwq+aG48Zl
 pyA+yCHRxluk4Y6rDyVs7wAFlyM/Y9nVOGjpYjHtgxqqKSM0TMfPOv3bbZHsYVl9i5iC
 LWOAaR9HrO9ECcEqPGW1Xi9TidnIYUaHFzZYEPxl0d2TNwA7w3pVbRvbXWY7gFo+2TDB
 Yshwh0TjCPpnwfrWPahMwubR+Ex12cVR3rYPA+9rgivXnxIwuI3eIYPAb6axCPAwyLqo
 CWByKuTazO8KPyGB/fh7f6osb1ZBdqvAeqvnkq+AZygCeHXUPgR1eRZPuyw7kcGug7f6
 tnSA==
X-Gm-Message-State: APjAAAVPNOyC0yAZOLcZdULXAhe7adutBL8/DMQa9kk32Yzb3v3wK02A
 yNzysap9m/I/h7XZVHjgo3OzBWjFyv9fNFoigLQqbA==
X-Google-Smtp-Source: APXvYqx0snTZ0UlF/nWwL7nSSv/h6FnsP12UjuFWL/qkLJMSmlKNOTPTjIKprSuj6K4iOtgoHSCEpTHc9qaidm6+5oQ=
X-Received: by 2002:adf:ecd0:: with SMTP id s16mr39066490wro.324.1563335751570; 
 Tue, 16 Jul 2019 20:55:51 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1559944445.git.alistair.francis@wdc.com>
 <CAFEAcA95grVBoiCbMAeZYTXYxc6nhjx1EM6=05G_3Qqpp8obNQ@mail.gmail.com>
 <CAKmqyKPPtSHSBMvrVxwi1aX=oPSEfxxpD-QQ=ym2ymvcvk5z0w@mail.gmail.com>
In-Reply-To: <CAKmqyKPPtSHSBMvrVxwi1aX=oPSEfxxpD-QQ=ym2ymvcvk5z0w@mail.gmail.com>
From: Chih-Min Chao <chihmin.chao@sifive.com>
Date: Wed, 17 Jul 2019 11:55:39 +0800
Message-ID: <CAEiOBXWW5HAEvsF0+UYWXJTpnfnawLFbShXyjmyiLmZMcZnUqQ@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@sifive.com>, Alistair Francis <alistair.francis@wdc.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000232cc9058dd8784e"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v1 00/27] Add RISC-V
 Hypervisor Extension
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
X-List-Received-Date: Wed, 17 Jul 2019 03:55:56 -0000

--000000000000232cc9058dd8784e
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 17, 2019 at 8:17 AM Alistair Francis <alistair23@gmail.com>
wrote:

> On Mon, Jul 15, 2019 at 5:00 AM Peter Maydell <peter.maydell@linaro.org>
> wrote:
> >
> > On Fri, 7 Jun 2019 at 23:03, Alistair Francis <alistair.francis@wdc.com>
> wrote:
> > > At the moment this spec is in a draft state and is subject to change.
> As
> > > QEMU is extreamly useful in early bring up I think it makes sense for
> > > QEMU to support non-frozen extensions. I would like to decide with this
> > > series how QEMU will handle all future non-frozen extensions. That is a
> > > standard way that QEMU users can test future RISC-V extensions while
> > > still understanding things will change. One idea is just to disable it
> by
> > > default, another option is to maybe use the Kconfig to make it a
> compile
> > > time option which developers can use. Should we also display a warning
> > > when running non-frozen extensions?
> >
> > We had an instance of this for Arm (though in fact the
> > relevant patches to QEMU didn't end up getting into master
> > before the spec was finalized in the end). My suggestion
> > would be at minimum:
> >  * by default non-frozen extensions should not be provided
>
> Yep, these are off by default.
>
> >  * they should be enabled via a command line option (cpu
> >    property) whose name starts with "x-", which is our standard
> >    way of flagging properties that are experimental and subject
> >    to change or removal in future QEMU versions
>
> Sounds good, I'll rename the property in the next version.
>
> Alistair
>
> >
> > That way end-users know they're doing something non-standard
> > that won't necessarily be supported in future by newer versions
> > of QEMU, and if people copy recipes/commandlines/random guest
> > images off old blog posts there'll be a hint that there's a
> > reason why they don't work on newer QEMU that adheres to the
> > final spec.
> >
> > thanks
> > -- PMM
>


Hi Peter,

I agree that unfrozen extension should't be merged into master but I think
the patch set is more like RFC version.
Some part of the patches have been merged in into master and will be
available in 4.1.  So my intention is to be
familiar with present h-extension by reviewing the Alistair's great work
and help the work when new patch set are ready
for 4.2 cycle.

chihmin.chao

--000000000000232cc9058dd8784e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 17, 2019 at 8:17 AM Alistair =
Francis &lt;<a href=3D"mailto:alistair23@gmail.com">alistair23@gmail.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On =
Mon, Jul 15, 2019 at 5:00 AM Peter Maydell &lt;<a href=3D"mailto:peter.mayd=
ell@linaro.org" target=3D"_blank">peter.maydell@linaro.org</a>&gt; wrote:<b=
r>
&gt;<br>
&gt; On Fri, 7 Jun 2019 at 23:03, Alistair Francis &lt;<a href=3D"mailto:al=
istair.francis@wdc.com" target=3D"_blank">alistair.francis@wdc.com</a>&gt; =
wrote:<br>
&gt; &gt; At the moment this spec is in a draft state and is subject to cha=
nge. As<br>
&gt; &gt; QEMU is extreamly useful in early bring up I think it makes sense=
 for<br>
&gt; &gt; QEMU to support non-frozen extensions. I would like to decide wit=
h this<br>
&gt; &gt; series how QEMU will handle all future non-frozen extensions. Tha=
t is a<br>
&gt; &gt; standard way that QEMU users can test future RISC-V extensions wh=
ile<br>
&gt; &gt; still understanding things will change. One idea is just to disab=
le it by<br>
&gt; &gt; default, another option is to maybe use the Kconfig to make it a =
compile<br>
&gt; &gt; time option which developers can use. Should we also display a wa=
rning<br>
&gt; &gt; when running non-frozen extensions?<br>
&gt;<br>
&gt; We had an instance of this for Arm (though in fact the<br>
&gt; relevant patches to QEMU didn&#39;t end up getting into master<br>
&gt; before the spec was finalized in the end). My suggestion<br>
&gt; would be at minimum:<br>
&gt;=C2=A0 * by default non-frozen extensions should not be provided<br>
<br>
Yep, these are off by default.<br>
<br>
&gt;=C2=A0 * they should be enabled via a command line option (cpu<br>
&gt;=C2=A0 =C2=A0 property) whose name starts with &quot;x-&quot;, which is=
 our standard<br>
&gt;=C2=A0 =C2=A0 way of flagging properties that are experimental and subj=
ect<br>
&gt;=C2=A0 =C2=A0 to change or removal in future QEMU versions<br>
<br>
Sounds good, I&#39;ll rename the property in the next version.<br>
<br>
Alistair<br>
<br>
&gt;<br>
&gt; That way end-users know they&#39;re doing something non-standard<br>
&gt; that won&#39;t necessarily be supported in future by newer versions<br=
>
&gt; of QEMU, and if people copy recipes/commandlines/random guest<br>
&gt; images off old blog posts there&#39;ll be a hint that there&#39;s a<br=
>
&gt; reason why they don&#39;t work on newer QEMU that adheres to the<br>
&gt; final spec.<br>
&gt;<br>
&gt; thanks<br>
&gt; -- PMM<br></blockquote><div>=C2=A0</div><div><br></div><div>Hi Peter,<=
/div><div><br></div><div>I agree that unfrozen extension should&#39;t be me=
rged into master but I think the patch set is more like RFC version.</div><=
div>Some part of the patches have been merged in into master and will be av=
ailable in 4.1.=C2=A0 So my intention is to be</div><div>familiar with pres=
ent h-extension by reviewing the Alistair&#39;s great work and help the wor=
k when new patch set are ready</div><div>for 4.2 cycle.</div><div><br></div=
><div>chihmin.chao</div></div></div>

--000000000000232cc9058dd8784e--

