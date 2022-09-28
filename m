Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1odKhn-0005CL-Fg
	for mharc-qemu-riscv@gnu.org; Tue, 27 Sep 2022 20:13:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tkng@rivosinc.com>) id 1odKhm-0005C9-1C
 for qemu-riscv@nongnu.org; Tue, 27 Sep 2022 20:13:38 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:41568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tkng@rivosinc.com>) id 1odKhj-0003Nb-UP
 for qemu-riscv@nongnu.org; Tue, 27 Sep 2022 20:13:37 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 q15-20020a17090a304f00b002002ac83485so279905pjl.0
 for <qemu-riscv@nongnu.org>; Tue, 27 Sep 2022 17:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=WFa7ZRnqxMN+y/LRs6tJAycIebJhsIaRM+TScBfZG9s=;
 b=6X8+co7XyqBTd0NEDuS1Sbjr9W3FfmEm30xjAwijHTMRoZuMGgrelqE6PGZHZ2ssvM
 vMbZsdqXGF4GYs6G5vFYKdH8XBAHWi9kPb0j2hq1WFi/1v2s+THDbDhx93gKKf5w8MjY
 SbwwCd66paqQpNGUQktB5qrj/ENyTY3yknoCM1hOHbYDlv6N4csZ1SD0kIRuX92HStDj
 /ELo5p6PB8GCVWcasps0cKwINaCrStg68Q4bhBZ5y72tGQDJPTz/78IxagqPCtarZiZr
 EDM0HZB61r1ydRAWXoPRoPB0kqiyo3ifxqaphqxYvbc105WFp0nkM9XiIXgjVwhWDryF
 8yiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=WFa7ZRnqxMN+y/LRs6tJAycIebJhsIaRM+TScBfZG9s=;
 b=Oz8VYnpCT7ScFN9Xk9csstey6VWvJddY0AHllYIB7LQTGGLozJ2AJPsFRmhhi72/b/
 pa5zUBmOY5sYC7upRR7G3kEHpOPSdhlhPFlK0FS/im5Bz+iEso4vOe6oth7hZw8QIJOp
 cjCDdHrqHyUJeiv7QhdEsjPn4vf3lcoMMtY60ZGw05KC9zOTgJ8DJsEGlL9+jDFX1JHv
 EZcjQKV0dKkBX8WQOPGVJSqrGEfFAt1QWB5XRjCXSED+hpwaYSDXVM69o/jPlAm52vsX
 9yaekCqrSEukKuzL6AR19pFlWn59xCByMNg6yZG6mjQx5kEguY8lHk9Fve6V9CuXzKa4
 AG6w==
X-Gm-Message-State: ACrzQf1BBQ8fXWjOnAbBwRiIMZdlgCwv2vAgN304ATMbw8vd3pSCwJoG
 ekv4E2Vh/UrtVB6F54QAiT4OdTD0by55UVgGeLJLXA==
X-Google-Smtp-Source: AMsMyM67ORFvbptck9D4JYCtUABqvskmuTEt2hhUHFhOkjsuhk5Afou/aLEd90TxSbKXXJ4X/wO0DDwfe2dvoTnwsXs=
X-Received: by 2002:a17:90b:3149:b0:202:e9e9:632f with SMTP id
 ip9-20020a17090b314900b00202e9e9632fmr7466352pjb.96.1664324013798; Tue, 27
 Sep 2022 17:13:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAB88-qOh7dBoFP4SWcM4G5EVp6cumVnZ5j4tNRqSvMT08=dAcA@mail.gmail.com>
 <BL0PR11MB3042E97131ADE38A3535984F8A529@BL0PR11MB3042.namprd11.prod.outlook.com>
 <CAB88-qMZiPgFx-13WiXqJ9+EV04THXuSHkLjFxLqvZxKp5LNkA@mail.gmail.com>
 <BL0PR11MB304295EA40A39F491D8DEFA58A559@BL0PR11MB3042.namprd11.prod.outlook.com>
In-Reply-To: <BL0PR11MB304295EA40A39F491D8DEFA58A559@BL0PR11MB3042.namprd11.prod.outlook.com>
From: Tyler Ng <tkng@rivosinc.com>
Date: Tue, 27 Sep 2022 17:13:22 -0700
Message-ID: <CAB88-qNCDw3r_oJK+wYhxLuZKtoWYAHkue3U-wWViqipYO=wJA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] hw/watchdog: wdt_ibex_aon.c: Implement the
 watchdog for the OpenTitan
To: "Dong, Eddie" <eddie.dong@intel.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 "Meng, Bin" <bin.meng@windriver.com>, Thomas Huth <thuth@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Laurent Vivier <lvivier@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000a250ba05e9b1a194"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=tkng@rivosinc.com; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 28 Sep 2022 00:13:38 -0000

--000000000000a250ba05e9b1a194
Content-Type: text/plain; charset="UTF-8"

Hi Eddie,


On Tue, Sep 27, 2022 at 3:04 PM Dong, Eddie <eddie.dong@intel.com> wrote:

> Hi Tyler:
>
> > +}
> > +
> > +/* Called when the bark timer expires */ static void
> > +ibex_aon_barker_expired(void *opaque) {
> This may happen during ibex_aon_update_count(), right?
>
> > +    IbexAONTimerState *s = IBEX_AON_TIMER(opaque);
> > +    if (ibex_aon_update_count(s) &&
>         This may happen during ibex_aon_update_count().
>         Nested call may lead to incorrect s->regs[R_WDOG_COUNT] &
> s->wdog_last.
>
>     Can you elaborate? The timers for bark and bite are not updated in
> "update_count".
>
> When 1st ibex_aon_update_count() is executing, and is in the place PPP
> (after updating s->regs[R_WDOG_COUNT] but before updating s->wdog_last), a
> timer (barker) may happen.
> Inside ibex_aon_barker_expired(), it calls ibex_aon_update_count() again
> (nest call), and update s->regs[R_WDOG_COUNT] & s->wdog_last, with the new
> value.
> After the nest execution ends, and returns to the initial point (PPP) ,
> the s->wdog_last is updated (with the value of 1st execution time), this
> leads to mismatch of s->regs[R_WDOG_COUNT] & s->wdog_last.
>
> This case may not be triggered at normal case, but if the guest read
> A_WDOG_COUNT, the 1st ibex_aon_update_count() does execute, and bring the
> potential issue.
>

I see, I wasn't aware that the virtual clock continued running while the
device address was being read.


> I think we can solve the problem, by not updating s->regs[R_WDOG_COUNT] &
> s->wdog_last in the timer call back API.  The update is not necessary given
> that the stored value is anyway not the current COUNT. We only need to
> update when the guest write the COUNT.
>
>
My initial concern about this is that the HW does the comparison check to
determine a bark/bite occurred, which is why I think the count should be
updated on a timer expiration,


>
> > +        s->regs[R_WDOG_COUNT] >= s->regs[R_WDOG_BARK_THOLD]) {
> > +        s->regs[R_INTR_STATE] |= (1 << 1);
> > +        qemu_irq_raise(s->bark_irq);
> > +    }
> > +}
> > +
>
>
> THX  Eddie
>
Thanks,
-Tyler

--000000000000a250ba05e9b1a194
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Eddie,<br></div><div dir=3D"ltr"><div dir=3D"ltr">=
<br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Tue, Sep 27, 2022 at 3:04 PM Dong, Eddie &lt;<a href=3D"mailto:eddie=
.dong@intel.com" target=3D"_blank">eddie.dong@intel.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Tyler:<br>
<br>
&gt; +}<br>
&gt; +<br>
&gt; +/* Called when the bark timer expires */ static void<br>
&gt; +ibex_aon_barker_expired(void *opaque) {<br>
This may happen during ibex_aon_update_count(), right? <br>
<br>
&gt; +=C2=A0 =C2=A0 IbexAONTimerState *s =3D IBEX_AON_TIMER(opaque);<br>
&gt; +=C2=A0 =C2=A0 if (ibex_aon_update_count(s) &amp;&amp;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 This may happen during ibex_aon_update_count().=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Nested call may lead to incorrect s-&gt;regs[R_=
WDOG_COUNT] &amp; s-&gt;wdog_last. <br>
<br>
=C2=A0 =C2=A0 Can you elaborate? The timers for bark and bite are not updat=
ed in &quot;update_count&quot;.<br>
<br>
When 1st ibex_aon_update_count() is executing, and is in the place PPP (aft=
er updating s-&gt;regs[R_WDOG_COUNT] but before updating s-&gt;wdog_last), =
a timer (barker) may happen.<br>
Inside ibex_aon_barker_expired(), it calls ibex_aon_update_count() again (n=
est call), and update s-&gt;regs[R_WDOG_COUNT] &amp; s-&gt;wdog_last, with =
the new value.<br>
After the nest execution ends, and returns to the initial point (PPP) , the=
 s-&gt;wdog_last is updated (with the value of 1st execution time), this le=
ads to mismatch of s-&gt;regs[R_WDOG_COUNT] &amp; s-&gt;wdog_last.<br>
<br></blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
This case may not be triggered at normal case, but if the guest read A_WDOG=
_COUNT, the 1st ibex_aon_update_count() does execute, and bring the potenti=
al issue.<br></blockquote><div><br></div><div>I see, I wasn&#39;t aware tha=
t the virtual clock continued running while the device address was being re=
ad.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
I think we can solve the problem, by not updating s-&gt;regs[R_WDOG_COUNT] =
&amp; s-&gt;wdog_last in the timer call back API.=C2=A0 The update is not n=
ecessary given that the stored value is anyway not the current COUNT. We on=
ly need to update when the guest write the COUNT.<br>
<br></blockquote><div><br></div><div>My initial concern about this is that =
the HW does the comparison check to determine a bark/bite occurred, which i=
s why I think the count should be updated on a timer expiration,<br></div><=
div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;regs[R_WDOG_COUNT] &gt;=3D s-&gt;re=
gs[R_WDOG_BARK_THOLD]) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;regs[R_INTR_STATE] |=3D (1 &lt;&lt;=
 1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_irq_raise(s-&gt;bark_irq);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
&gt; +<br>
<br>
<br>
THX=C2=A0 Eddie<br></blockquote><div>Thanks,<br></div><div>-Tyler <br></div=
></div></div>
</div>

--000000000000a250ba05e9b1a194--

