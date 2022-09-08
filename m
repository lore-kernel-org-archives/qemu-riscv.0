Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oWPdk-00041B-9T
	for mharc-qemu-riscv@gnu.org; Thu, 08 Sep 2022 18:04:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tkng@rivosinc.com>) id 1oWPdi-0003zv-WF
 for qemu-riscv@nongnu.org; Thu, 08 Sep 2022 18:04:51 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:39628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tkng@rivosinc.com>) id 1oWPdg-0007VA-TH
 for qemu-riscv@nongnu.org; Thu, 08 Sep 2022 18:04:50 -0400
Received: by mail-pl1-x631.google.com with SMTP id d12so39222plr.6
 for <qemu-riscv@nongnu.org>; Thu, 08 Sep 2022 15:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=hi9b2Mtn8C6RY2bFpaQjGztpzZ3p5ZJmjRZbCHwYCZo=;
 b=U4HXoMZIt+5qYWEWlD+HFhqe6RVYhwJl6NQrxQkqBjEAs13GblCCny0Yk9AMQOb0lX
 kLbzB97yYTzjgO84azzbupJlVmoARrv6gHzZDorG6DGZluE6GB665k7+9TD4uakP+eRK
 Yqbpv4Nud4CJR3jqXyMy+CSuEQ9V2VDeUN1J+LRmdYHy2jEGf4KrkM+UkwV2ftAngHBD
 bAsChH3BZEb/PWLV7oqsDZ5UQgkIM1m9rUe4QnpmY44xFPohCxmx6SsXHcf3WZBbdY3l
 TGzsIDMKNtV0U4CS3rUgNAVs59QLb0ALfNM61vYhT36N/3B7GKf+Oje4Xy07ZqJj/MkM
 wK/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=hi9b2Mtn8C6RY2bFpaQjGztpzZ3p5ZJmjRZbCHwYCZo=;
 b=nvsgtY6kAt1xTECjM6PazpIX/CagrpVPGgfOrt81T3WpvxgICV6sNMlB9mBTDG7jhH
 MzDe3FAJTok4g7zTfADmzfcYxPWNVfFt09zr2EHgfmSsxXpkCY22lI3ZUcSCi/MSHy3b
 qpnmxe6iEQN/WZv7WaTSDcj57FNcTY9pWPAOpCSgzhIEzuR9wroCpmLzMah3LuOJC/63
 Biek2TR2ONRAgijpPtKBOuu5LV4DIydmw/dIkBNyqlmgCd/mIGLMt3p3VmKaLF0/KxwZ
 FqBn2ZZgzK7zCOLroZ9kzZhOLZIiH+gNJzWl6twpAjdfEWSwEqGl/yvz6roMr2SQ+gff
 qTsg==
X-Gm-Message-State: ACgBeo3QtAfu5tJl0LRfEWJ5fxx8jIsYq6NG+MmU570X3JWXTOrXoepr
 jgb6g9jkgWFKRDwSXhE7OW7SGE+6CkLbGeTwA8tUUQ==
X-Google-Smtp-Source: AA6agR4Z8qY/1PG11hFc05XEAjfdpOdmJfieuNOvMNxj4Eh0epoPpK4ninvdwge7rD9xZXBabh2Cs2rhqK+6D8ITn58=
X-Received: by 2002:a17:902:7d86:b0:176:a6eb:1758 with SMTP id
 a6-20020a1709027d8600b00176a6eb1758mr11213429plm.90.1662674687444; Thu, 08
 Sep 2022 15:04:47 -0700 (PDT)
MIME-Version: 1.0
References: <CAB88-qPZr7G8Lp0Q=851JSFyb5v7ub5Hi4DaD6mVQKZxFt5UOw@mail.gmail.com>
 <CAKmqyKOCeBU5yZkW7d90vFDvL_n+M1KKSGexDZ59DN1LiY9mww@mail.gmail.com>
In-Reply-To: <CAKmqyKOCeBU5yZkW7d90vFDvL_n+M1KKSGexDZ59DN1LiY9mww@mail.gmail.com>
From: Tyler Ng <tkng@rivosinc.com>
Date: Thu, 8 Sep 2022 15:04:36 -0700
Message-ID: <CAB88-qOMHk1_Mh1YOYREaTXixEf8uGYb+o8bYAvgfQhQEfQ9aQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] hw/timer: ibex_timer.c: Update register addresses
To: Alistair Francis <alistair23@gmail.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000001f647705e8319e63"
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=tkng@rivosinc.com; helo=mail-pl1-x631.google.com
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
X-List-Received-Date: Thu, 08 Sep 2022 22:04:51 -0000

--0000000000001f647705e8319e63
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 8, 2022 at 4:56 AM Alistair Francis <alistair23@gmail.com>
wrote:

> On Fri, Sep 2, 2022 at 3:24 AM Tyler Ng <tkng@rivosinc.com> wrote:
> >
> > Updates the register addresses to match the OpenTitan spec.
> >
> > These changes were made in this commit:
> >
> https://github.com/lowRISC/opentitan/commit/a25e162b8f91bd0ca32258c83d1d480f93327204
>
> Thanks for the patch
>
> We try to keep all OpenTitan devices in sync with each other. QEMU
> currently supports OT commit 217a0168ba118503c166a9587819e3811eeb0c0c
>
> We don't want to update a single device without updating all of them.
> If you want you are welcome to update all devices to a newer commit
>
> Also, the commits QEMU supports are generally driven by Tock, as
> that's the software running on QEMU OT. Have a look here for the board
> https://github.com/tock/tock/tree/master/boards/opentitan or here for
> the latest update (which QEMU already supports)
> https://github.com/tock/tock/pull/3056
>
> Alistair
>
> Alright, thanks for the info. I'll look into it; the AON spec could have
changed since that commit as I was using the latest version.

-Tyler


> >
> > Signed-off-by: Tyler Ng <tkng@rivosinc.com>
> > ---
> >  hw/timer/ibex_timer.c | 20 ++++++++++----------
> >  1 file changed, 10 insertions(+), 10 deletions(-)
> >
> > diff --git a/hw/timer/ibex_timer.c b/hw/timer/ibex_timer.c
> > index 8c2ca364da..9ffd4821e8 100644
> > --- a/hw/timer/ibex_timer.c
> > +++ b/hw/timer/ibex_timer.c
> > @@ -38,19 +38,19 @@ REG32(ALERT_TEST, 0x00)
> >      FIELD(ALERT_TEST, FATAL_FAULT, 0, 1)
> >  REG32(CTRL, 0x04)
> >      FIELD(CTRL, ACTIVE, 0, 1)
> > -REG32(CFG0, 0x100)
> > -    FIELD(CFG0, PRESCALE, 0, 12)
> > -    FIELD(CFG0, STEP, 16, 8)
> > -REG32(LOWER0, 0x104)
> > -REG32(UPPER0, 0x108)
> > -REG32(COMPARE_LOWER0, 0x10C)
> > -REG32(COMPARE_UPPER0, 0x110)
> > -REG32(INTR_ENABLE, 0x114)
> > +REG32(INTR_ENABLE, 0x100)
> >      FIELD(INTR_ENABLE, IE_0, 0, 1)
> > -REG32(INTR_STATE, 0x118)
> > +REG32(INTR_STATE, 0x104)
> >      FIELD(INTR_STATE, IS_0, 0, 1)
> > -REG32(INTR_TEST, 0x11C)
> > +REG32(INTR_TEST, 0x108)
> >      FIELD(INTR_TEST, T_0, 0, 1)
> > +REG32(CFG0, 0x10C)
> > +    FIELD(CFG0, PRESCALE, 0, 12)
> > +    FIELD(CFG0, STEP, 16, 8)
> > +REG32(LOWER0, 0x110)
> > +REG32(UPPER0, 0x114)
> > +REG32(COMPARE_LOWER0, 0x118)
> > +REG32(COMPARE_UPPER0, 0x11C)
> >
> >  static uint64_t cpu_riscv_read_rtc(uint32_t timebase_freq)
> >  {
> > --
> > 2.30.2
> >
>

--0000000000001f647705e8319e63
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 8, 2022 at 4:56 AM Alista=
ir Francis &lt;<a href=3D"mailto:alistair23@gmail.com" target=3D"_blank">al=
istair23@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On Fri, Sep 2, 2022 at 3:24 AM Tyler Ng &lt;<a href=3D"ma=
ilto:tkng@rivosinc.com" target=3D"_blank">tkng@rivosinc.com</a>&gt; wrote:<=
br>
&gt;<br>
&gt; Updates the register addresses to match the OpenTitan spec.<br>
&gt;<br>
&gt; These changes were made in this commit:<br>
&gt; <a href=3D"https://github.com/lowRISC/opentitan/commit/a25e162b8f91bd0=
ca32258c83d1d480f93327204" rel=3D"noreferrer" target=3D"_blank">https://git=
hub.com/lowRISC/opentitan/commit/a25e162b8f91bd0ca32258c83d1d480f93327204</=
a><br>
<br>
Thanks for the patch<br>
<br>
We try to keep all OpenTitan devices in sync with each other. QEMU<br>
currently supports OT commit 217a0168ba118503c166a9587819e3811eeb0c0c<br>
<br>
We don&#39;t want to update a single device without updating all of them.<b=
r>
If you want you are welcome to update all devices to a newer commit<br>
<br>
Also, the commits QEMU supports are generally driven by Tock, as<br>
that&#39;s the software running on QEMU OT. Have a look here for the board<=
br>
<a href=3D"https://github.com/tock/tock/tree/master/boards/opentitan" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/tock/tock/tree/master/=
boards/opentitan</a> or here for<br>
the latest update (which QEMU already supports)<br>
<a href=3D"https://github.com/tock/tock/pull/3056" rel=3D"noreferrer" targe=
t=3D"_blank">https://github.com/tock/tock/pull/3056</a><br>
<br>
Alistair<br>
<br></blockquote><div>Alright, thanks for the info. I&#39;ll look into it; =
the AON spec could have changed since that commit as I was using the latest=
 version.<br></div><div><br></div><div>-Tyler<br></div><div>=C2=A0</div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
&gt;<br>
&gt; Signed-off-by: Tyler Ng &lt;<a href=3D"mailto:tkng@rivosinc.com" targe=
t=3D"_blank">tkng@rivosinc.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 hw/timer/ibex_timer.c | 20 ++++++++++----------<br>
&gt;=C2=A0 1 file changed, 10 insertions(+), 10 deletions(-)<br>
&gt;<br>
&gt; diff --git a/hw/timer/ibex_timer.c b/hw/timer/ibex_timer.c<br>
&gt; index 8c2ca364da..9ffd4821e8 100644<br>
&gt; --- a/hw/timer/ibex_timer.c<br>
&gt; +++ b/hw/timer/ibex_timer.c<br>
&gt; @@ -38,19 +38,19 @@ REG32(ALERT_TEST, 0x00)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 FIELD(ALERT_TEST, FATAL_FAULT, 0, 1)<br>
&gt;=C2=A0 REG32(CTRL, 0x04)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 FIELD(CTRL, ACTIVE, 0, 1)<br>
&gt; -REG32(CFG0, 0x100)<br>
&gt; -=C2=A0 =C2=A0 FIELD(CFG0, PRESCALE, 0, 12)<br>
&gt; -=C2=A0 =C2=A0 FIELD(CFG0, STEP, 16, 8)<br>
&gt; -REG32(LOWER0, 0x104)<br>
&gt; -REG32(UPPER0, 0x108)<br>
&gt; -REG32(COMPARE_LOWER0, 0x10C)<br>
&gt; -REG32(COMPARE_UPPER0, 0x110)<br>
&gt; -REG32(INTR_ENABLE, 0x114)<br>
&gt; +REG32(INTR_ENABLE, 0x100)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 FIELD(INTR_ENABLE, IE_0, 0, 1)<br>
&gt; -REG32(INTR_STATE, 0x118)<br>
&gt; +REG32(INTR_STATE, 0x104)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 FIELD(INTR_STATE, IS_0, 0, 1)<br>
&gt; -REG32(INTR_TEST, 0x11C)<br>
&gt; +REG32(INTR_TEST, 0x108)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 FIELD(INTR_TEST, T_0, 0, 1)<br>
&gt; +REG32(CFG0, 0x10C)<br>
&gt; +=C2=A0 =C2=A0 FIELD(CFG0, PRESCALE, 0, 12)<br>
&gt; +=C2=A0 =C2=A0 FIELD(CFG0, STEP, 16, 8)<br>
&gt; +REG32(LOWER0, 0x110)<br>
&gt; +REG32(UPPER0, 0x114)<br>
&gt; +REG32(COMPARE_LOWER0, 0x118)<br>
&gt; +REG32(COMPARE_UPPER0, 0x11C)<br>
&gt;<br>
&gt;=C2=A0 static uint64_t cpu_riscv_read_rtc(uint32_t timebase_freq)<br>
&gt;=C2=A0 {<br>
&gt; --<br>
&gt; 2.30.2<br>
&gt;<br></blockquote></div></div>

--0000000000001f647705e8319e63--

