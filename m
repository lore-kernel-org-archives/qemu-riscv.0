Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ocxfr-0005XE-2S
	for mharc-qemu-riscv@gnu.org; Mon, 26 Sep 2022 19:38:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tkng@rivosinc.com>) id 1ocxfp-0005Wu-Lj
 for qemu-riscv@nongnu.org; Mon, 26 Sep 2022 19:38:05 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:41759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tkng@rivosinc.com>) id 1ocxfn-0005Jj-LJ
 for qemu-riscv@nongnu.org; Mon, 26 Sep 2022 19:38:05 -0400
Received: by mail-pf1-x433.google.com with SMTP id l65so8171380pfl.8
 for <qemu-riscv@nongnu.org>; Mon, 26 Sep 2022 16:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=syFCTdEoUOvQ98PziCKAmBgZqVlXGKENbqYvhiaHxUA=;
 b=wdmsz7r2tGhVh0pyIFKaxJw25KSRwMSzXObLxUywsjkaemZ62JKbzj9hx7O8+PcWCU
 ehxjTLSDzivGELmJYFnIxgzEvdKWoEp/VQiJWm2LE/sFMP6xvIE1kifKcaAd+m5c2CTE
 iQiFZg2hsdUJJyaQ2OX7IFtg3AdcmHQkg+u1D3n6zU+560kdQr0bbI1xzVxvY/lcx1iA
 AEGWtGyDRTO4lNilMpytrp02KccMiLqXC/11CQBsvblQ4+cKPBHkHb23IThPm4tYPciR
 ICVhfgek5IP5JePWmnthN2IBxIrPqjDplYTz2BlOckM1QtHHOrUpjt30TR9TFxkpT+ED
 c7eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=syFCTdEoUOvQ98PziCKAmBgZqVlXGKENbqYvhiaHxUA=;
 b=fGBD3p5lWP8OU1KiSFtrVTLnuRlBes0Dnm06XMyF9wYIk+68jTK/GnR68wc5WXHlMN
 i62Ssnt8NNVi7KQpm47tkyXiEUbX7WKNgJZGUv5hmddVu7XtKoRyDIUc50rDTrvz4dJP
 Zl1Jw0fEsrgE+s19ygcrcP301Iz3Uxu7ec26hcw2i1+RF1W8vMW7+Wtex/HPS2VJt6ax
 3ZBeSlqjB4nzEXxIfFvHDE3uqs+/7Pi1DMkWzJG2aqR+dPQDwUSzrCu+8uwBiEZU4koH
 9ZjhYLn4E5QDA6D5Qe2Z6UMKTotdaelP7N+CV4Q15RvaYX94NCVQazbi8dFWdYUtKQsP
 cvXw==
X-Gm-Message-State: ACrzQf3gvYxxft8wVJ7ZrRV4EVrzOcb4LkGwpFhKh1uYwoP3OdGOi8Vp
 YIebB4qbaH9yiit/GdNv6Q15h+7+d+OmOoV9CzkmaQ==
X-Google-Smtp-Source: AMsMyM6cRCwkFqVhEYrwtZ7n63/RjZI2XO0o3qvmH1FeuvXOZj+deuqnpV3yRJ4HaYVtuzLQMbWDV8sEbxrEwD/8YFE=
X-Received: by 2002:a63:904c:0:b0:435:eb3:83da with SMTP id
 a73-20020a63904c000000b004350eb383damr22188460pge.612.1664235482040; Mon, 26
 Sep 2022 16:38:02 -0700 (PDT)
MIME-Version: 1.0
References: <CAB88-qOuB+uR6epr7h5F76A9qNOB358WikXDfmpvn-ceW71p7Q@mail.gmail.com>
 <99d260b4-2e06-e64b-48b0-f1ecbec8b39b@amsat.org>
In-Reply-To: <99d260b4-2e06-e64b-48b0-f1ecbec8b39b@amsat.org>
From: Tyler Ng <tkng@rivosinc.com>
Date: Mon, 26 Sep 2022 16:37:51 -0700
Message-ID: <CAB88-qPLHLxxAkLeQk=N0d_s44sXRyhsUkqsJLLxa1cbnZDG4w@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] hw/timer: ibex_timer.c: Add support for writes to
 mtime
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Thomas Huth <thuth@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Laurent Vivier <lvivier@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000baec3805e99d040b"
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=tkng@rivosinc.com; helo=mail-pf1-x433.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 26 Sep 2022 23:38:05 -0000

--000000000000baec3805e99d040b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 22, 2022 at 2:45 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g>
wrote:

> On 22/9/22 17:58, Tyler Ng wrote:
> > 1. Adds fields to hold the value of mtime in timer_upper0 and
> timer_lower0.
> >
> > 2. Changes the read and write functions to use the mtime fields.
> >
> > 3. Updates the value of mtime in update_mtime() by extrapolating the
> > time elapsed. This will need to change if/when the prescalar is
> > implemented.
> >
> > 4. Adds a qtest for the ibex timer.
> >
> > Signed-off-by: Tyler Ng <tkng@rivosinc.com>
> > ---
> >   hw/timer/ibex_timer.c         |  98 +++++++++++++------
> >   include/hw/timer/ibex_timer.h |   6 ++
> >   tests/qtest/ibex-timer-test.c | 178 +++++++++++++++++++++++++++++++++=
+
> >   tests/qtest/meson.build       |   3 +-
> >   4 files changed, 256 insertions(+), 29 deletions(-)
> >   create mode 100644 tests/qtest/ibex-timer-test.c
>
> > -static void ibex_timer_update_irqs(IbexTimerState *s)
> > +/*
> > + * The goal of this function is to:
> > + * 1. Check if the timer is enabled. If not, return false,
> > + * 2. Calculate the amount of time that has passed since.
> > + * 3. Extrapolate the number of ticks that have passed, and add it to
> `mtime`.
> > + * 4. Return true.
> > + */
> > +static bool update_mtime(IbexTimerState *s)
> >   {
> > -    uint64_t value =3D s->timer_compare_lower0 |
> > -                         ((uint64_t)s->timer_compare_upper0 << 32);
> > -    uint64_t next, diff;
> > -    uint64_t now =3D cpu_riscv_read_rtc(s->timebase_freq);
> > -
> >       if (!(s->timer_ctrl & R_CTRL_ACTIVE_MASK)) {
> > -        /* Timer isn't active */
> > +        return false;
> > +    }
> > +    /* Get the time then extrapolate the number of ticks that have
> elapsed */
> > +    uint64_t mtime =3D get_mtime(s);
> > +    int64_t now =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> > +    int64_t elapsed =3D now - s->timer_last_update;
> > +    if (elapsed < 0) {
> > +        /* We jumped back in time. */
> > +        mtime -=3D muldiv64((uint64_t)(-elapsed), s->timebase_freq,
> > +                           NANOSECONDS_PER_SECOND);
> > +    } else {
> > +        mtime +=3D muldiv64(elapsed, s->timebase_freq,
> NANOSECONDS_PER_SECOND);
> > +    }
> > +    s->timer_lower0 =3D mtime & 0xffffffff;
> > +    s->timer_upper0 =3D (mtime >> 32) & 0xffffffff;
>
> Could use extract64(mtime, 0, 32) and extract64(mtime, 32, 32);
>
>
Didn't know about this function, thanks.


> > +    /* update last-checkpoint timestamp */
> > +    s->timer_last_update =3D now;
> > +    return true;
> > +}
>

--000000000000baec3805e99d040b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 22, 2022 at 2:45 PM Phili=
ppe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@amsat.o=
rg</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">On 22/9/22 17:58, Tyler Ng wrote:<br>
&gt; 1. Adds fields to hold the value of mtime in timer_upper0 and timer_lo=
wer0.<br>
&gt; <br>
&gt; 2. Changes the read and write functions to use the mtime fields.<br>
&gt; <br>
&gt; 3. Updates the value of mtime in update_mtime() by extrapolating the<b=
r>
&gt; time elapsed. This will need to change if/when the prescalar is<br>
&gt; implemented.<br>
&gt; <br>
&gt; 4. Adds a qtest for the ibex timer.<br>
&gt; <br>
&gt; Signed-off-by: Tyler Ng &lt;<a href=3D"mailto:tkng@rivosinc.com" targe=
t=3D"_blank">tkng@rivosinc.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0hw/timer/ibex_timer.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 98 +++++++++++++------<br>
&gt;=C2=A0 =C2=A0include/hw/timer/ibex_timer.h |=C2=A0 =C2=A06 ++<br>
&gt;=C2=A0 =C2=A0tests/qtest/ibex-timer-test.c | 178 ++++++++++++++++++++++=
++++++++++++<br>
&gt;=C2=A0 =C2=A0tests/qtest/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A03 +-<br>
&gt;=C2=A0 =C2=A04 files changed, 256 insertions(+), 29 deletions(-)<br>
&gt;=C2=A0 =C2=A0create mode 100644 tests/qtest/ibex-timer-test.c<br>
<br>
&gt; -static void ibex_timer_update_irqs(IbexTimerState *s)<br>
&gt; +/*<br>
&gt; + * The goal of this function is to:<br>
&gt; + * 1. Check if the timer is enabled. If not, return false,<br>
&gt; + * 2. Calculate the amount of time that has passed since.<br>
&gt; + * 3. Extrapolate the number of ticks that have passed, and add it to=
 `mtime`.<br>
&gt; + * 4. Return true.<br>
&gt; + */<br>
&gt; +static bool update_mtime(IbexTimerState *s)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt; -=C2=A0 =C2=A0 uint64_t value =3D s-&gt;timer_compare_lower0 |<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0((uint64_t)s-&gt;timer_compare_upper0 &lt;&lt; 32);<br=
>
&gt; -=C2=A0 =C2=A0 uint64_t next, diff;<br>
&gt; -=C2=A0 =C2=A0 uint64_t now =3D cpu_riscv_read_rtc(s-&gt;timebase_freq=
);<br>
&gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!(s-&gt;timer_ctrl &amp; R_CTRL_ACTIVE_M=
ASK)) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Timer isn&#39;t active */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 /* Get the time then extrapolate the number of ticks th=
at have elapsed */<br>
&gt; +=C2=A0 =C2=A0 uint64_t mtime =3D get_mtime(s);<br>
&gt; +=C2=A0 =C2=A0 int64_t now =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);<=
br>
&gt; +=C2=A0 =C2=A0 int64_t elapsed =3D now - s-&gt;timer_last_update;<br>
&gt; +=C2=A0 =C2=A0 if (elapsed &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* We jumped back in time. */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 mtime -=3D muldiv64((uint64_t)(-elapsed),=
 s-&gt;timebase_freq,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0NANOSECONDS_PER_SECOND);<br>
&gt; +=C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 mtime +=3D muldiv64(elapsed, s-&gt;timeba=
se_freq, NANOSECONDS_PER_SECOND);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 s-&gt;timer_lower0 =3D mtime &amp; 0xffffffff;<br>
&gt; +=C2=A0 =C2=A0 s-&gt;timer_upper0 =3D (mtime &gt;&gt; 32) &amp; 0xffff=
ffff;<br>
<br>
Could use extract64(mtime, 0, 32) and extract64(mtime, 32, 32);<br>
<br></blockquote><div>=C2=A0</div><div>Didn&#39;t know about this function,=
 thanks.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
&gt; +=C2=A0 =C2=A0 /* update last-checkpoint timestamp */<br>
&gt; +=C2=A0 =C2=A0 s-&gt;timer_last_update =3D now;<br>
&gt; +=C2=A0 =C2=A0 return true;<br>
&gt; +}<br>
</blockquote></div></div>

--000000000000baec3805e99d040b--

