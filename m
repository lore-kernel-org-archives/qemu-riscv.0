Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mc9qf-0007Oz-05
	for mharc-qemu-riscv@gnu.org; Sun, 17 Oct 2021 13:21:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1mc9qd-0007OJ-Ag; Sun, 17 Oct 2021 13:21:23 -0400
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b]:40562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1mc9qb-0006IH-O8; Sun, 17 Oct 2021 13:21:23 -0400
Received: by mail-lj1-x22b.google.com with SMTP id w23so4456913lje.7;
 Sun, 17 Oct 2021 10:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bODScJZecwkFA8zCzr9S/xvHWgxFs0eiGf4jkHXp0v0=;
 b=kvAoZ9XLc4r6M/SI1sdvDVev+4xMiaUfJD1NT7x9HjPQpqPeVwiuJVB+a2ixNffdVO
 qRFOELTCY/Mjv4mlxxOn6Vx5YZUtRS+xho2KNvYwK1/isxQ3+m+AfeqsPwnOO0TtOP8D
 YD9kpbozkUcjeu457XinQsOqdUngox8a+ky0QEHJq+0apLR1N9IeqV5Jr7XhE4PVZf9O
 UAzufVylAjHVStQlQ+sEePWKYWyBx1jIimvpVMrU+sg0EB5cXlBJBTq2eYOEecXYqyHN
 Wmc0cy67/gzYmCH4Sz1YIvWBiZo5MbTyHOq6Fj7gKAv2DH5WkP7euUkfWDQikFpGS9c5
 bDbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bODScJZecwkFA8zCzr9S/xvHWgxFs0eiGf4jkHXp0v0=;
 b=mZtb4m6OghW8lkzTs5f8bPYzutWKyKO+Vm/KjnuM2e3aRmY2JXDtG2x0691yxLIVEs
 QotKodSEm70+jb7M6Kaz7XFY8lJipJDtll7U7nTWEsyLvJRE/O0AWeeaXWXo/m7QYvos
 l1FU+a5svlRsmg1mIQvnDsuKRgGiHWFZti8QN9diyB4f4yzODq/34PnnWzKhFzchpNbm
 cpa0j1JxNqx2NhCDMiuZBc8sMks5AmKoaosTGpg4vw4a5yRdsez//UilzrIJ16XVqk0m
 cFGK1Hn/sXk4oeZIN41aFZFF+PhW9xTKdMhobP3o0ijqkNY9irIQzyrTog6Qiqa/aQP3
 4hAA==
X-Gm-Message-State: AOAM5322oi5ZpIyPM7lSRIQYqc0zMuzN1GcwLc5Fy8wwf/7NfJz3az3U
 0F+5/Nv2zOWLI69ACZ1OhIRqu8zvDE65tjxDKLo=
X-Google-Smtp-Source: ABdhPJz5ZCt2QKHWwqo9knwkpqbRc0roGQN2tsrcOUKYVrAFYoue6bnrqCNVfqVwSSvViBQ5VbyNYQmcaFZYdjJoKSs=
X-Received: by 2002:a2e:504:: with SMTP id 4mr26125092ljf.100.1634491279657;
 Sun, 17 Oct 2021 10:21:19 -0700 (PDT)
MIME-Version: 1.0
References: <20211015192931.227387-1-space.monkey.delivers@gmail.com>
 <20211015192931.227387-6-space.monkey.delivers@gmail.com>
 <046b0cc0-2911-87b7-ccae-0819250dc909@linaro.org>
In-Reply-To: <046b0cc0-2911-87b7-ccae-0819250dc909@linaro.org>
From: Alexey Baturo <baturo.alexey@gmail.com>
Date: Sun, 17 Oct 2021 20:21:08 +0300
Message-ID: <CAFukJ-DKwtJbEAr9R83571OQCGedOnqM7Ru9g8gV0+gzHRhwaQ@mail.gmail.com>
Subject: Re: [PATCH v13 5/7] [RISCV_PM] Support pointer masking for RISC-V for
 i/c/f/d/a types of instructions
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "space.monkey.delivers@gmail.com" <space.monkey.delivers@gmail.com>,
 Dave Smith <kupokupokupopo@gmail.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>
Content-Type: multipart/alternative; boundary="0000000000001ccebb05ce8fa8e5"
Received-SPF: pass client-ip=2a00:1450:4864:20::22b;
 envelope-from=baturo.alexey@gmail.com; helo=mail-lj1-x22b.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 GAPPY_SUBJECT=0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sun, 17 Oct 2021 17:21:23 -0000

--0000000000001ccebb05ce8fa8e5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Sorry, my bad, got it wrong.
Fixed now.

Thanks!

=D1=81=D0=B1, 16 =D0=BE=D0=BA=D1=82. 2021 =D0=B3. =D0=B2 02:49, Richard Hen=
derson <richard.henderson@linaro.org
>:

> On 10/15/21 12:29 PM, Alexey Baturo wrote:
> > Signed-off-by: Alexey Baturo <space.monkey.delivers@gmail.com>
> > Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >   target/riscv/insn_trans/trans_rva.c.inc |  3 +++
> >   target/riscv/insn_trans/trans_rvd.c.inc |  2 ++
> >   target/riscv/insn_trans/trans_rvf.c.inc |  2 ++
> >   target/riscv/insn_trans/trans_rvi.c.inc |  2 ++
> >   target/riscv/translate.c                | 10 ++++++++++
> >   5 files changed, 19 insertions(+)
> >
> > diff --git a/target/riscv/insn_trans/trans_rva.c.inc
> b/target/riscv/insn_trans/trans_rva.c.inc
> > index 6ea07d89b0..5bdc412191 100644
> > --- a/target/riscv/insn_trans/trans_rva.c.inc
> > +++ b/target/riscv/insn_trans/trans_rva.c.inc
> > @@ -25,6 +25,7 @@ static bool gen_lr(DisasContext *ctx, arg_atomic *a,
> MemOp mop)
> >       if (a->rl) {
> >           tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
> >       }
> > +    gen_pm_adjust_address(ctx, &src1, src1);
> ...
> > +/*
> > + * Temp stub: generates address adjustment for PointerMasking
> > + */
> > +static void gen_pm_adjust_address(DisasContext *s,
> > +                                  TCGv         *dst,
> > +                                  TCGv          src)
> > +{
> > +    tcg_gen_mov_tl(*dst, src);
> > +}
>
> I mentioned before that you would not be able to do this.
> You are writing to the live cpu register, even if in this case it's a nop=
.
>
> You could, for example, make the stub be
>
>      *dst =3D src;
>
> but that begs the question of why not use the return value, and have the
> stub be
>
>      return src;
>
>
> r~
>

--0000000000001ccebb05ce8fa8e5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>Sorry, my bad, got it wrong.</div><=
div>Fixed now.</div><div><br></div><div>Thanks!</div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=D1=81=D0=B1, 16 =D0=
=BE=D0=BA=D1=82. 2021 =D0=B3. =D0=B2 02:49, Richard Henderson &lt;<a href=
=3D"mailto:richard.henderson@linaro.org">richard.henderson@linaro.org</a>&g=
t;:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 10/15/21 =
12:29 PM, Alexey Baturo wrote:<br>
&gt; Signed-off-by: Alexey Baturo &lt;<a href=3D"mailto:space.monkey.delive=
rs@gmail.com" target=3D"_blank">space.monkey.delivers@gmail.com</a>&gt;<br>
&gt; Reviewed-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson=
@linaro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
&gt; Reviewed-by: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@w=
dc.com" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0target/riscv/insn_trans/trans_rva.c.inc |=C2=A0 3 +++<br>
&gt;=C2=A0 =C2=A0target/riscv/insn_trans/trans_rvd.c.inc |=C2=A0 2 ++<br>
&gt;=C2=A0 =C2=A0target/riscv/insn_trans/trans_rvf.c.inc |=C2=A0 2 ++<br>
&gt;=C2=A0 =C2=A0target/riscv/insn_trans/trans_rvi.c.inc |=C2=A0 2 ++<br>
&gt;=C2=A0 =C2=A0target/riscv/translate.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 | 10 ++++++++++<br>
&gt;=C2=A0 =C2=A05 files changed, 19 insertions(+)<br>
&gt; <br>
&gt; diff --git a/target/riscv/insn_trans/trans_rva.c.inc b/target/riscv/in=
sn_trans/trans_rva.c.inc<br>
&gt; index 6ea07d89b0..5bdc412191 100644<br>
&gt; --- a/target/riscv/insn_trans/trans_rva.c.inc<br>
&gt; +++ b/target/riscv/insn_trans/trans_rva.c.inc<br>
&gt; @@ -25,6 +25,7 @@ static bool gen_lr(DisasContext *ctx, arg_atomic *a,=
 MemOp mop)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (a-&gt;rl) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcg_gen_mb(TCG_MO_ALL | TCG_BA=
R_STRL);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 gen_pm_adjust_address(ctx, &amp;src1, src1);<br>
...<br>
&gt; +/*<br>
&gt; + * Temp stub: generates address adjustment for PointerMasking<br>
&gt; + */<br>
&gt; +static void gen_pm_adjust_address(DisasContext *s,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TCGv=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0*dst,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TCGv=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 src)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 tcg_gen_mov_tl(*dst, src);<br>
&gt; +}<br>
<br>
I mentioned before that you would not be able to do this.<br>
You are writing to the live cpu register, even if in this case it&#39;s a n=
op.<br>
<br>
You could, for example, make the stub be<br>
<br>
=C2=A0 =C2=A0 =C2=A0*dst =3D src;<br>
<br>
but that begs the question of why not use the return value, and have the st=
ub be<br>
<br>
=C2=A0 =C2=A0 =C2=A0return src;<br>
<br>
<br>
r~<br>
</blockquote></div>

--0000000000001ccebb05ce8fa8e5--

