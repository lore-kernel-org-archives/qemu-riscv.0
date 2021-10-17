Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mc9k7-0004cI-OL
	for mharc-qemu-riscv@gnu.org; Sun, 17 Oct 2021 13:14:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1mc9k5-0004bq-J0; Sun, 17 Oct 2021 13:14:37 -0400
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f]:35555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1mc9k1-0000ko-S3; Sun, 17 Oct 2021 13:14:36 -0400
Received: by mail-lf1-x12f.google.com with SMTP id p16so62152520lfa.2;
 Sun, 17 Oct 2021 10:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Qg1coNEIB1YR9khX0B6aQ5AJ7RN7zZ9sXOD2cOhDCLI=;
 b=laH16L39MfgasEc27C6966VWZ9gEHedu2qrvMlEKxdk7BkC2HT7Xe0kevigiiAmUvS
 op94r9h630wBVEL9d3XhoU41V2GkhF/EjMDQ+3VcglM38JSnMD4FLeHpCs7yOCszFkET
 LClz29HgBHqQSpRTx7Y+byhGMIagor52PuuZy9R+ANp807V+IpUZ3V6KowLs4J2T3oPP
 En8I62VyLR2CYvMPmUYAtNAbVKzM8LX4XTHj/T1NX9tIbzjIX/X1iFlHv3MkzUg21SRY
 n9QHseygfOuTPJPDZ+hffrnvv7RYxw3ucC/j2xlmIIVgjjMhZB5N42DUimKN/VGKsJcF
 y16w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Qg1coNEIB1YR9khX0B6aQ5AJ7RN7zZ9sXOD2cOhDCLI=;
 b=uq7ZwZtDCGSolHffctuGIprMqyoMdB0IxnZG1vPG/bynQeRcJvU/uIiuCX/XZPG6nM
 H15SxLrPoukCoTzurvMi+RS1fRL234Cso0b735n5aALqPAjPyGkjawxurXcxrJhp+W/p
 hXe7jAqj/fxOFEA9RYMxcLkEEky3qYUDCWDPytyOeXM2la4vpSMNVmMeoUJ4uUuyB3u/
 i2J+u+i1xKaehf5TjB6k5XhQ4wgam/7knCOgVqrH7bg8Wdh1vZvw1F/QaN4khh91SAX6
 jQReaPOZUVLoH1Hj+r4Z0i4QJgYeyNsyMZZOwMIqOeG/ClKwTu9bxzDRt9a+IquoBVeR
 TzZA==
X-Gm-Message-State: AOAM533FSxPJ0WcWvda4K9PRUJ1QsPDV0dhKO7a6kBjYRdbpEa/w4wVv
 gQ7C0nNrF1M6iIflqGKWAfgKSbajctRb55Ow2Bg=
X-Google-Smtp-Source: ABdhPJyDAfrsmIWIR0g/D6mjmf3pg4D17cXFHg1I4i1PFIPV9kr0ubs9T9iLM0Rgx7+dKP9rxM5biTc0tEzqouAG6Y4=
X-Received: by 2002:ac2:4e97:: with SMTP id o23mr23932973lfr.412.1634490871139; 
 Sun, 17 Oct 2021 10:14:31 -0700 (PDT)
MIME-Version: 1.0
References: <20211015192931.227387-1-space.monkey.delivers@gmail.com>
 <20211015192931.227387-7-space.monkey.delivers@gmail.com>
 <c66f7198-362e-8311-b063-e88b018044b1@linaro.org>
In-Reply-To: <c66f7198-362e-8311-b063-e88b018044b1@linaro.org>
From: Alexey Baturo <baturo.alexey@gmail.com>
Date: Sun, 17 Oct 2021 20:14:20 +0300
Message-ID: <CAFukJ-DQncmtYiDGo9nLP9NCL-QmQU_fBZbW-QWrAAnPnPspYA@mail.gmail.com>
Subject: Re: [PATCH v13 6/7] [RISCV_PM] Implement address masking functions
 required for RISC-V Pointer Masking extension
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
Content-Type: multipart/alternative; boundary="000000000000c3503405ce8f8f08"
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=baturo.alexey@gmail.com; helo=mail-lf1-x12f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Sun, 17 Oct 2021 17:14:37 -0000

--000000000000c3503405ce8f8f08
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Richard,

Thanks for the review.

>Merge error.
fixed

>You might as well place the function correctly in the previous patch.
>Drop the silly alignment of parameters.
fixed

> int priv =3D flags & TB_FLAGS_PRIV_MMU_MASK;
fixed

>priv =3D tb_flags & TB_FLAGS_PRIV_MMU_MASK;
fixed

=D1=81=D0=B1, 16 =D0=BE=D0=BA=D1=82. 2021 =D0=B3. =D0=B2 03:01, Richard Hen=
derson <richard.henderson@linaro.org
>:

> On 10/15/21 12:29 PM, Alexey Baturo wrote:
> >   FIELD(TB_FLAGS, MSTATUS_HS_FS, 10, 2)
> > +/* If PointerMasking should be applied */
> > +FIELD(TB_FLAGS, PM_ENABLED, 10, 1)
>
> Merge error.
>
> > +    if (riscv_has_ext(env, RVJ)) {
> > +        int priv =3D cpu_mmu_index(env, false) & TB_FLAGS_PRIV_MMU_MAS=
K;
>
> cpu_mmu_index has already been computed.
> You want
>
>      int priv =3D flags & TB_FLAGS_PRIV_MMU_MASK;
>
> > @@ -118,16 +125,6 @@ static void gen_nanbox_s(TCGv_i64 out, TCGv_i64 in=
)
> >      tcg_gen_ori_i64(out, in, MAKE_64BIT_MASK(32, 32));
> >  }
> >
> > -/*
> > - * Temp stub: generates address adjustment for PointerMasking
> > - */
> > -static void gen_pm_adjust_address(DisasContext *s,
> > -                                  TCGv         *dst,
> > -                                  TCGv          src)
> > -{
> > -    tcg_gen_mov_tl(*dst, src);
> > -}
> > -
>
> You might as well place the function correctly in the previous patch.
> Drop the silly alignment of parameters.
>
> > +    int priv =3D cpu_mmu_index(env, false) & TB_FLAGS_PRIV_MMU_MASK;
> > +    ctx->pm_mask =3D pm_mask[priv];
>
> Using cpu_mmu_index within the translator is incorrect.  You want
>
>      priv =3D tb_flags & TB_FLAGS_PRIV_MMU_MASK;
>
>
> r~
>

--000000000000c3503405ce8f8f08
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Richard,<div><br></div><div>Thanks for the review.</div=
><div><br></div><div>&gt;Merge error.</div><div>fixed</div><div><br></div><=
div>&gt;You might as well place the function correctly in the previous patc=
h.</div>&gt;Drop the silly alignment of parameters.<div>fixed<br><div><br><=
/div><div>&gt; int priv =3D flags &amp; TB_FLAGS_PRIV_MMU_MASK;</div><div>f=
ixed</div><div><br></div><div>&gt;priv =3D tb_flags &amp; TB_FLAGS_PRIV_MMU=
_MASK;<br></div><div>fixed</div></div></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">=D1=81=D0=B1, 16 =D0=BE=D0=BA=D1=82. =
2021 =D0=B3. =D0=B2 03:01, Richard Henderson &lt;<a href=3D"mailto:richard.=
henderson@linaro.org">richard.henderson@linaro.org</a>&gt;:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">On 10/15/21 12:29 PM, Alexey Ba=
turo wrote:<br>
&gt;=C2=A0 =C2=A0FIELD(TB_FLAGS, MSTATUS_HS_FS, 10, 2)<br>
&gt; +/* If PointerMasking should be applied */<br>
&gt; +FIELD(TB_FLAGS, PM_ENABLED, 10, 1)<br>
<br>
Merge error.<br>
<br>
&gt; +=C2=A0 =C2=A0 if (riscv_has_ext(env, RVJ)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 int priv =3D cpu_mmu_index(env, false) &a=
mp; TB_FLAGS_PRIV_MMU_MASK;<br>
<br>
cpu_mmu_index has already been computed.<br>
You want<br>
<br>
=C2=A0 =C2=A0 =C2=A0int priv =3D flags &amp; TB_FLAGS_PRIV_MMU_MASK;<br>
<br>
&gt; @@ -118,16 +125,6 @@ static void gen_nanbox_s(TCGv_i64 out, TCGv_i64 i=
n)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 tcg_gen_ori_i64(out, in, MAKE_64BIT_MASK(32, 32));=
<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -/*<br>
&gt; - * Temp stub: generates address adjustment for PointerMasking<br>
&gt; - */<br>
&gt; -static void gen_pm_adjust_address(DisasContext *s,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TCGv=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0*dst,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TCGv=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 src)<br>
&gt; -{<br>
&gt; -=C2=A0 =C2=A0 tcg_gen_mov_tl(*dst, src);<br>
&gt; -}<br>
&gt; -<br>
<br>
You might as well place the function correctly in the previous patch.<br>
Drop the silly alignment of parameters.<br>
<br>
&gt; +=C2=A0 =C2=A0 int priv =3D cpu_mmu_index(env, false) &amp; TB_FLAGS_P=
RIV_MMU_MASK;<br>
&gt; +=C2=A0 =C2=A0 ctx-&gt;pm_mask =3D pm_mask[priv];<br>
<br>
Using cpu_mmu_index within the translator is incorrect.=C2=A0 You want<br>
<br>
=C2=A0 =C2=A0 =C2=A0priv =3D tb_flags &amp; TB_FLAGS_PRIV_MMU_MASK;<br>
<br>
<br>
r~<br>
</blockquote></div>

--000000000000c3503405ce8f8f08--

