Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mRmyI-0004Rt-Em
	for mharc-qemu-riscv@gnu.org; Sat, 18 Sep 2021 22:54:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mRmyH-0004RX-6j
 for qemu-riscv@nongnu.org; Sat, 18 Sep 2021 22:54:25 -0400
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35]:34592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mRmyF-0003jL-5y
 for qemu-riscv@nongnu.org; Sat, 18 Sep 2021 22:54:24 -0400
Received: by mail-io1-xd35.google.com with SMTP id y18so17485805ioc.1
 for <qemu-riscv@nongnu.org>; Sat, 18 Sep 2021 19:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6UiP9wzPxCwX7fk5/0Fo/JDrizlxONhun5JgZl9nR+c=;
 b=GSoqllhhqHOeIJQuuuzvOSROEwvLtLvuLtQkw9dWzn1cfHZnyslzbzFh3P6YTtJY74
 HQQZMLuaYvTgwTZJqT6thFFKD1HWuMBGyfc7ah6uNthq+4V57OVQuP1mPPw6zZnSrqPy
 3dGXpYHQvDz58GokQj4u0oa++YSxuQr1oTg/wjk3DfWBhfA2YlOxEwPLZ+O+axUp2oid
 vronq86r+fInMidxll1eh3ktNl2TRB7M8kzCBQpNwFZ8bYapcNrxw/i2v/nA9uCxLc6x
 v8nTtDfkO9vMEL09vngIP8YcOi6Wkp/WyvI1nMMesMDA4klVDM+yclAVIca6V8XYucZW
 Un+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6UiP9wzPxCwX7fk5/0Fo/JDrizlxONhun5JgZl9nR+c=;
 b=bsSvYOCUfA+uCcZDWrLINnC7EHUileAFERabjTrEvzz07OkY4rXASdomi/H5HVXTqY
 RVJBVpFC51MfiZWj/n6tUEQu1HdhNWS6yJL0/ITMWE7wzwy+xYiHO0tWKJczRNykuse/
 OH8nXDPL9bIvAzLz5wSTy7HAyiQNeLPkQFlrXN6pDofffMqxwc/UBmUOzpQ8zBUu0EP6
 XhJ3K3GAxfxqJErSuwfQ7MMJkyzflP15ROr+Hke6ZiYtqSruonYqtZRAZ1BfqhX5w8bF
 WINA110RhwVq4eZkPIAKhMdtYwgpM9bB9r21egjBY0RFyX2FAvCwdv/V2tWGzTbfGX+9
 bZ0w==
X-Gm-Message-State: AOAM531kOAhCQ+gZZCUghw6tr8Hx2yGPI2wwTyIMLfRFv6JGhUQMs6hs
 OnujDh+it7ZsoeFJFuMlYLnGuQZHlXcsGts7O2s6yQ==
X-Google-Smtp-Source: ABdhPJyYoVCYLQWi6j2qnbVcVtKQsV5gRXTo0wMPuLLiiBuZ2Z/eqJzB/98QSEM/j3ReqZwcGUDQzcCWwK/qWOLMOvw=
X-Received: by 2002:a02:77d5:: with SMTP id g204mr8364903jac.25.1632020061073; 
 Sat, 18 Sep 2021 19:54:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210917093153.4067812-1-frank.chang@sifive.com>
 <93e9a615-94fb-3958-9560-111910668768@linaro.org>
In-Reply-To: <93e9a615-94fb-3958-9560-111910668768@linaro.org>
From: Frank Chang <frank.chang@sifive.com>
Date: Sun, 19 Sep 2021 10:54:10 +0800
Message-ID: <CAE_xrPh+CzNK-nnsO6NSk+FKowXW2Tbva9abhpgAD13xfPak4A@mail.gmail.com>
Subject: Re: [PATCH RESEND v2] target/riscv: Set mstatus_hs.[SD|FS] bits if
 Clean and V=1 in mark_fs_dirty()
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Vincent Chen <vincent.chen@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: multipart/alternative; boundary="00000000000001ca2e05cc50486b"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d35;
 envelope-from=frank.chang@sifive.com; helo=mail-io1-xd35.google.com
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
X-List-Received-Date: Sun, 19 Sep 2021 02:54:25 -0000

--00000000000001ca2e05cc50486b
Content-Type: text/plain; charset="UTF-8"

On Sun, Sep 19, 2021 at 2:46 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 9/17/21 2:31 AM, frank.chang@sifive.com wrote:
> > From: Frank Chang <frank.chang@sifive.com>
> >
> > When V=1, both vsstauts.FS and HS-level sstatus.FS are in effect.
> > Modifying the floating-point state when V=1 causes both fields to
> > be set to 3 (Dirty).
> >
> > However, it's possible that HS-level sstatus.FS is Clean and VS-level
> > vsstatus.FS is Dirty at the time mark_fs_dirty() is called when V=1.
> > We can't early return for this case because we still need to set
> > sstatus.FS to Dirty according to spec.
> >
> > Signed-off-by: Frank Chang <frank.chang@sifive.com>
> > Reviewed-by: Vincent Chen <vincent.chen@sifive.com>
> > Tested-by: Vincent Chen <vincent.chen@sifive.com>
> > ---
> >   target/riscv/cpu.h       |  4 ++++
> >   target/riscv/translate.c | 24 +++++++++++++++---------
> >   2 files changed, 19 insertions(+), 9 deletions(-)
>
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
> >   static void mark_fs_dirty(DisasContext *ctx)
> >   {
> >       TCGv tmp;
> > -    target_ulong sd;
> > +    target_ulong sd = is_32bit(ctx) ? MSTATUS32_SD : MSTATUS64_SD;
> > +
> > +    if (ctx->virt_enabled && ctx->mstatus_hs_fs != MSTATUS_FS) {
> > +        /* Remember the stage change for the rest of the TB. */
> > +        ctx->mstatus_hs_fs = MSTATUS_FS;
> > +
> > +        tmp = tcg_temp_new();
> > +        tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState,
> mstatus_hs));
> > +        tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS | sd);
> > +        tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState,
> mstatus_hs));
> > +        tcg_temp_free(tmp);
> > +    }
> >
> >       if (ctx->mstatus_fs == MSTATUS_FS) {
> >           return;
> >       }
> > +
> >       /* Remember the state change for the rest of the TB.  */
> >       ctx->mstatus_fs = MSTATUS_FS;
> >
> >       tmp = tcg_temp_new();
> > -    sd = is_32bit(ctx) ? MSTATUS32_SD : MSTATUS64_SD;
> > -
> >       tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
> >       tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS | sd);
> >       tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
> > -
> > -    if (ctx->virt_enabled) {
> > -        tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState,
> mstatus_hs));
> > -        tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS | sd);
> > -        tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState,
> mstatus_hs));
> > -    }
> >       tcg_temp_free(tmp);
>
> While it works, it would be nicer to keep these two cases as similar as
> possible.
>
>
Hi, Richard, thanks for the review.

Do you mean it's better to change to code sequence to something like:

static void mark_fs_dirty(DisasContext *ctx)
{
    .....

    if (ctx->virt_enabled && ctx->mstatus_hs_fs != MSTATUS_FS) {
        /* Remember the stage change for the rest of the TB. */
        ctx->mstatus_hs_fs = MSTATUS_FS;
        .....
    }

    if (ctx->mstatus_fs != MSTATUS_FS) {
         /* Remember the state change for the rest of the TB.  */
        ctx->mstatus_fs = MSTATUS_FS;
        .....
     }
}

If so, I can update and send out the v3 patch.

Regards,
Frank Chang


>
> r~
>

--00000000000001ca2e05cc50486b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sun, Sep 19, 2021 at 2:46 AM Richard H=
enderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.hender=
son@linaro.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">On 9/17/21 2:31 AM, <a href=3D"mai=
lto:frank.chang@sifive.com" target=3D"_blank">frank.chang@sifive.com</a> wr=
ote:<br>
&gt; From: Frank Chang &lt;<a href=3D"mailto:frank.chang@sifive.com" target=
=3D"_blank">frank.chang@sifive.com</a>&gt;<br>
&gt; <br>
&gt; When V=3D1, both vsstauts.FS and HS-level sstatus.FS are in effect.<br=
>
&gt; Modifying the floating-point state when V=3D1 causes both fields to<br=
>
&gt; be set to 3 (Dirty).<br>
&gt; <br>
&gt; However, it&#39;s possible that HS-level sstatus.FS is Clean and VS-le=
vel<br>
&gt; vsstatus.FS is Dirty at the time mark_fs_dirty() is called when V=3D1.=
<br>
&gt; We can&#39;t early return for this case because we still need to set<b=
r>
&gt; sstatus.FS to Dirty according to spec.<br>
&gt; <br>
&gt; Signed-off-by: Frank Chang &lt;<a href=3D"mailto:frank.chang@sifive.co=
m" target=3D"_blank">frank.chang@sifive.com</a>&gt;<br>
&gt; Reviewed-by: Vincent Chen &lt;<a href=3D"mailto:vincent.chen@sifive.co=
m" target=3D"_blank">vincent.chen@sifive.com</a>&gt;<br>
&gt; Tested-by: Vincent Chen &lt;<a href=3D"mailto:vincent.chen@sifive.com"=
 target=3D"_blank">vincent.chen@sifive.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0target/riscv/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 +++=
+<br>
&gt;=C2=A0 =C2=A0target/riscv/translate.c | 24 +++++++++++++++---------<br>
&gt;=C2=A0 =C2=A02 files changed, 19 insertions(+), 9 deletions(-)<br>
<br>
<br>
Reviewed-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@lina=
ro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
<br>
&gt;=C2=A0 =C2=A0static void mark_fs_dirty(DisasContext *ctx)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0TCGv tmp;<br>
&gt; -=C2=A0 =C2=A0 target_ulong sd;<br>
&gt; +=C2=A0 =C2=A0 target_ulong sd =3D is_32bit(ctx) ? MSTATUS32_SD : MSTA=
TUS64_SD;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (ctx-&gt;virt_enabled &amp;&amp; ctx-&gt;mstatus_hs_=
fs !=3D MSTATUS_FS) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Remember the stage change for the rest=
 of the TB. */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ctx-&gt;mstatus_hs_fs =3D MSTATUS_FS;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 tmp =3D tcg_temp_new();<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPUR=
ISCVState, mstatus_hs));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS | sd)=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_st_tl(tmp, cpu_env, offsetof(CPUR=
ISCVState, mstatus_hs));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_temp_free(tmp);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ctx-&gt;mstatus_fs =3D=3D MSTATUS_FS) {<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Remember the state change for the rest of=
 the TB.=C2=A0 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;mstatus_fs =3D MSTATUS_FS;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0tmp =3D tcg_temp_new();<br>
&gt; -=C2=A0 =C2=A0 sd =3D is_32bit(ctx) ? MSTATUS32_SD : MSTATUS64_SD;<br>
&gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISC=
VState, mstatus));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS | sd);<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISC=
VState, mstatus));<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 if (ctx-&gt;virt_enabled) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPUR=
ISCVState, mstatus_hs));<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS | sd)=
;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_st_tl(tmp, cpu_env, offsetof(CPUR=
ISCVState, mstatus_hs));<br>
&gt; -=C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0tcg_temp_free(tmp);<br>
<br>
While it works, it would be nicer to keep these two cases as similar as pos=
sible.<br>
<br></blockquote><div><br></div><div>Hi, Richard, thanks for the review.</d=
iv><div><br></div><div>Do you mean it&#39;s better to change to code sequen=
ce to something like:</div><div><br></div><div>static void mark_fs_dirty(Di=
sasContext *ctx)<br></div><div>{</div><div>=C2=A0 =C2=A0 .....</div><div><b=
r></div><div>=C2=A0 =C2=A0 if (ctx-&gt;virt_enabled &amp;&amp; ctx-&gt;msta=
tus_hs_fs !=3D MSTATUS_FS) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Remember the=
 stage change for the rest of the TB. */<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 ctx=
-&gt;mstatus_hs_fs =3D MSTATUS_FS;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 .....<br>=
</div><div>=C2=A0 =C2=A0 }</div><div><br></div><div>=C2=A0 =C2=A0 if (ctx-&=
gt;mstatus_fs !=3D MSTATUS_FS) {</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0/* Remember the state change for the rest of the TB.=C2=A0 */</div>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 ctx-&gt;mstatus_fs =3D MSTATUS_FS;</div><div class=
=3D"gmail_quote">=C2=A0 =C2=A0 =C2=A0 =C2=A0 .....</div><div class=3D"gmail=
_quote">=C2=A0 =C2=A0 =C2=A0}</div><div class=3D"gmail_quote">}</div><div c=
lass=3D"gmail_quote"><br></div><div class=3D"gmail_quote">If so, I can upda=
te and send out the v3 patch.</div><div class=3D"gmail_quote"><br></div><di=
v class=3D"gmail_quote">Regards,</div><div class=3D"gmail_quote">Frank Chan=
g<br><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
r~<br>
</blockquote></div></div>

--00000000000001ca2e05cc50486b--

