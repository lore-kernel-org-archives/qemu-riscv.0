Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1puQHM-0008FP-01
	for mharc-qemu-riscv@gnu.org; Thu, 04 May 2023 00:09:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1puQHI-0008FA-T9
 for qemu-riscv@nongnu.org; Thu, 04 May 2023 00:09:14 -0400
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1puQHG-0008Pb-Rp
 for qemu-riscv@nongnu.org; Thu, 04 May 2023 00:09:12 -0400
Received: by mail-yb1-xb2d.google.com with SMTP id
 3f1490d57ef6-b9d8b2e1576so62625276.2
 for <qemu-riscv@nongnu.org>; Wed, 03 May 2023 21:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1683173349; x=1685765349; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ASou4eLJmlxCFH9GmndnKP9GaSdJ2slWZnd/a8wOtiQ=;
 b=XD56QyP4ROwBFpk+KYFbC8vgETFLxTicFurtz7AmxZLSiJ78haLwmhoMrt+HoXer+m
 rpYCgBrVRga12jZCtfhQHncYECO9yLH/Pi8WcheKgVMa1lenZXYIxPrEcBMfnEEzJSLP
 eB2qpT88aoW+Vz+un+AY+4ru9d3DWO3nJPnTUhQofdv7zePalcL1TPWJXF6rzEJAaNhw
 z3ADvfB8wr8gMbl/3GAD018xbxxlYSa9/5dmYoAWk77NnD7SRynouUXeJS319YP18sAZ
 0sJ4uhmlWBSnk652qffbmCfUAP6wFekhR3a4ftWScWlsjfe319HKN9wJ7UV2Kq6Nz7+/
 voXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683173349; x=1685765349;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ASou4eLJmlxCFH9GmndnKP9GaSdJ2slWZnd/a8wOtiQ=;
 b=Ii+h4WcS9vgSCwoibQ/Xb1RYfFZAPoXOnG07JwufllW3dr9RGE9cEWjD8/iv+pbLbA
 GvI19xi6twnPote0OVsxFD+re5CG/VsKxRnBfAje8TXvLKjAuBkOBsNed72ldtwJnV5S
 aTWBOItRlHM3b9RKGDK/4m757HTI9SN+05GD7QkX2tWMnz5CutkwKNUIhboKA6ZgGmSz
 dItCt8IRsd2sfG8dHIib3qTIA9SCScgPTu0s1lCzlL19bQHNvxlmNrGt927P12DKEF2H
 oUSz1Kbqy4qO10SSl86Vate0d274J1Ii7iNs5HGiI/l37rJLDriCrkrmHG20lE7NtxSs
 gJEA==
X-Gm-Message-State: AC+VfDztownUUJt/saRLgJUfjUPbd31Exif20piY5ck92DGBASSU4E5M
 hO4TXwxMWmH35fzrlv46fUwTi/VkSo1yNFN9C201IuQ3/dhl+CX+76c=
X-Google-Smtp-Source: ACHHUZ7f3qipw8JWTYn4C5tsby8mO6XiUF/s/6DlkhBQvcQdGOTYXpSTgIyLUPZz9HIHNPw0imGZZFT6UdLoJsK/Vwg=
X-Received: by 2002:a25:e4c2:0:b0:b96:7d4b:7aeb with SMTP id
 b185-20020a25e4c2000000b00b967d4b7aebmr20531413ybh.34.1683173349200; Wed, 03
 May 2023 21:09:09 -0700 (PDT)
MIME-Version: 1.0
References: <SJ0PR04MB787223A0357CF1901224B0AE906B9@SJ0PR04MB7872.namprd04.prod.outlook.com>
 <SJ0PR04MB7872731EEB43478A94698A34906B9@SJ0PR04MB7872.namprd04.prod.outlook.com>
 <CAOnJCUL3ou38Jw3MRExp3j64-tqQP0cPvbgF0Sk2izcCTn+X5Q@mail.gmail.com>
 <SJ0PR04MB78728BA9A1105067AD238C62906D9@SJ0PR04MB7872.namprd04.prod.outlook.com>
 <SJ0PR04MB787226486E2F78B2693FDCF1906D9@SJ0PR04MB7872.namprd04.prod.outlook.com>
In-Reply-To: <SJ0PR04MB787226486E2F78B2693FDCF1906D9@SJ0PR04MB7872.namprd04.prod.outlook.com>
From: Deepak Gupta <debug@rivosinc.com>
Date: Wed, 3 May 2023 21:08:59 -0700
Message-ID: <CAKC1njRj_a-ASY_WWFp10ajfA9ut790JOAuRNqF=_UEqRc6zuw@mail.gmail.com>
Subject: Re: QEMU SIG Meeting
To: Alistair Francis <Alistair.Francis@wdc.com>
Cc: Atish Patra <atishp@atishpatra.org>, 
 "sig-qemu@lists.riscv.org" <sig-qemu@lists.riscv.org>,
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>, 
 "alistair@alistair23.me" <alistair@alistair23.me>
Content-Type: multipart/alternative; boundary="000000000000932b7a05fad655e9"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=debug@rivosinc.com; helo=mail-yb1-xb2d.google.com
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
X-List-Received-Date: Thu, 04 May 2023 04:09:14 -0000

--000000000000932b7a05fad655e9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I can see the passcode now in the meeting invite and it lets me through
(although the meeting is over).
I am assuming it'll work next time.

-Deepak

On Wed, May 3, 2023 at 5:37=E2=80=AFPM Alistair Francis <Alistair.Francis@w=
dc.com>
wrote:

> Is that better?
>
> Alistair
>
> -----Original Message-----
> From: Alistair Francis
> Sent: Thursday, 4 May 2023 10:35 AM
> To: Atish Patra <atishp@atishpatra.org>; sig-qemu@lists.riscv.org
> Cc: qemu-riscv@nongnu.org; alistair@alistair23.me
> Subject: RE: QEMU SIG Meeting
>
> Hmmm... The link is in the original invite. I'll try updating it and see
> if that works.
>
> Alistair
>
> -----Original Message-----
> From: Atish Patra <atishp@atishpatra.org>
> Sent: Thursday, 4 May 2023 10:14 AM
> To: Alistair Francis <Alistair.Francis@wdc.com>; sig-qemu@lists.riscv.org
> Cc: qemu-riscv@nongnu.org; alistair@alistair23.me
> Subject: Re: QEMU SIG Meeting
>
> On Fri, Apr 28, 2023 at 8:02=E2=80=AFAM Alistair Francis <Alistair.Franci=
s@wdc.com>
> wrote:
> >
> > Ok! The calendar events are created (took a few goes) and you should be
> able to see them.
> >
> >
>
> The meeting invite doesn't have the direct link to zoom or the passcode
> for the meeting.
>
> >
> > Also I have lost any RISC-V list messages sent over the last month, so
> Guerney if you want to resend your email I can try and help.
> >
> >
> >
> > Alistair
> >
> >
> >
> > From: Alistair Francis
> > Sent: Friday, 28 April 2023 12:17 PM
> > To: qemu-riscv@nongnu.org
> > Cc: alistair@alistair23.me
> > Subject: QEMU SIG Meeting
> >
> >
> >
> > Hello!
> >
> >
> >
> > Sorry about the delay! We have had some technical issues over here and =
I
> haven't had access to emails. I am trying to switch over to my personal
> email to simplify things in the future.
> >
> >
> >
> > So a few updates from last time.
> >
> >
> >
> > First, Zhiwei and I are switching chair and vice-chair positions. I'm n=
o
> longer a RISC-V foundation member so I can't remain as chair.
> >
> >
> >
> > Secondly let's actually schedule that meeting! From the poll the two
> best times are:
> >
> >
> >
> > Tuesday 4PM AEST -> Tuesday 6AM UTC
> > Thursday 10AM AEST -> Thursday 12AM UTC
> >
> >
> >
> > So let's alternate between those two. We can start with fortnightly (so
> people should be able to attend a meeting a month) and go from there.
> >
> >
> >
> > Alistair
> >
> >
>
>
>
> --
> Regards,
> Atish
>

--000000000000932b7a05fad655e9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I can see the passcode now in the meeting invite and it le=
ts me through (although the meeting is over).<div>I am assuming it&#39;ll w=
ork next time.</div><div><br></div><div>-Deepak</div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, May 3, 2023 =
at 5:37=E2=80=AFPM Alistair Francis &lt;<a href=3D"mailto:Alistair.Francis@=
wdc.com">Alistair.Francis@wdc.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Is that better?<br>
<br>
Alistair<br>
<br>
-----Original Message-----<br>
From: Alistair Francis <br>
Sent: Thursday, 4 May 2023 10:35 AM<br>
To: Atish Patra &lt;<a href=3D"mailto:atishp@atishpatra.org" target=3D"_bla=
nk">atishp@atishpatra.org</a>&gt;; <a href=3D"mailto:sig-qemu@lists.riscv.o=
rg" target=3D"_blank">sig-qemu@lists.riscv.org</a><br>
Cc: <a href=3D"mailto:qemu-riscv@nongnu.org" target=3D"_blank">qemu-riscv@n=
ongnu.org</a>; <a href=3D"mailto:alistair@alistair23.me" target=3D"_blank">=
alistair@alistair23.me</a><br>
Subject: RE: QEMU SIG Meeting<br>
<br>
Hmmm... The link is in the original invite. I&#39;ll try updating it and se=
e if that works.<br>
<br>
Alistair<br>
<br>
-----Original Message-----<br>
From: Atish Patra &lt;<a href=3D"mailto:atishp@atishpatra.org" target=3D"_b=
lank">atishp@atishpatra.org</a>&gt; <br>
Sent: Thursday, 4 May 2023 10:14 AM<br>
To: Alistair Francis &lt;<a href=3D"mailto:Alistair.Francis@wdc.com" target=
=3D"_blank">Alistair.Francis@wdc.com</a>&gt;; <a href=3D"mailto:sig-qemu@li=
sts.riscv.org" target=3D"_blank">sig-qemu@lists.riscv.org</a><br>
Cc: <a href=3D"mailto:qemu-riscv@nongnu.org" target=3D"_blank">qemu-riscv@n=
ongnu.org</a>; <a href=3D"mailto:alistair@alistair23.me" target=3D"_blank">=
alistair@alistair23.me</a><br>
Subject: Re: QEMU SIG Meeting<br>
<br>
On Fri, Apr 28, 2023 at 8:02=E2=80=AFAM Alistair Francis &lt;<a href=3D"mai=
lto:Alistair.Francis@wdc.com" target=3D"_blank">Alistair.Francis@wdc.com</a=
>&gt; wrote:<br>
&gt;<br>
&gt; Ok! The calendar events are created (took a few goes) and you should b=
e able to see them.<br>
&gt;<br>
&gt;<br>
<br>
The meeting invite doesn&#39;t have the direct link to zoom or the passcode=
 for the meeting.<br>
<br>
&gt;<br>
&gt; Also I have lost any RISC-V list messages sent over the last month, so=
 Guerney if you want to resend your email I can try and help.<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; Alistair<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; From: Alistair Francis<br>
&gt; Sent: Friday, 28 April 2023 12:17 PM<br>
&gt; To: <a href=3D"mailto:qemu-riscv@nongnu.org" target=3D"_blank">qemu-ri=
scv@nongnu.org</a><br>
&gt; Cc: <a href=3D"mailto:alistair@alistair23.me" target=3D"_blank">alista=
ir@alistair23.me</a><br>
&gt; Subject: QEMU SIG Meeting<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; Hello!<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; Sorry about the delay! We have had some technical issues over here and=
 I haven&#39;t had access to emails. I am trying to switch over to my perso=
nal email to simplify things in the future.<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; So a few updates from last time.<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; First, Zhiwei and I are switching chair and vice-chair positions. I&#3=
9;m no longer a RISC-V foundation member so I can&#39;t remain as chair.<br=
>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; Secondly let&#39;s actually schedule that meeting! From the poll the t=
wo best times are:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; Tuesday 4PM AEST -&gt; Tuesday 6AM UTC<br>
&gt; Thursday 10AM AEST -&gt; Thursday 12AM UTC<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; So let&#39;s alternate between those two. We can start with fortnightl=
y (so people should be able to attend a meeting a month) and go from there.=
<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; Alistair<br>
&gt;<br>
&gt;<br>
<br>
<br>
<br>
--<br>
Regards,<br>
Atish<br>
</blockquote></div>

--000000000000932b7a05fad655e9--

