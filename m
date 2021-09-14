Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mPxxY-0003Rj-QB
	for mharc-qemu-riscv@gnu.org; Mon, 13 Sep 2021 22:14:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mPxxX-0003RM-7X
 for qemu-riscv@nongnu.org; Mon, 13 Sep 2021 22:14:07 -0400
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135]:39468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mPxxU-0002Eq-SK
 for qemu-riscv@nongnu.org; Mon, 13 Sep 2021 22:14:06 -0400
Received: by mail-il1-x135.google.com with SMTP id a1so12309299ilj.6
 for <qemu-riscv@nongnu.org>; Mon, 13 Sep 2021 19:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iJpFzoZCp0zYSVuDxMx3wgCXjkLSyCRWqn4Iozd1TMA=;
 b=mTAmxmfkoDTF7S+HHdwv69w+wfz/Mnsi95E/8x+IRu0BuvDfXqFrofpdPgTCklh6TW
 jA9Tqshf+Gii8fi8giz6XdBXcEqwpW1zfMUl0KQsA+OrY1zbrEcU7I79n4Q3Y3hAekop
 K/awm9My0ga7EvtSdztGzBd/KtuJu9bNd/qzopOBAByKUJWVJ7AE5w2gTy2p5UwpOeWj
 WYuWWNVUrthY4E/XClruxAOq7yELaBqFGyq3l9LvpXk2LRVw651kL6NdqILWnE42vubP
 IaEKi6unLEAcvOmcx3QXdDlxuo0tHI3ivzTTkiUn3PUd2NlexuUlCBa1N7upDvopptkj
 DEuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iJpFzoZCp0zYSVuDxMx3wgCXjkLSyCRWqn4Iozd1TMA=;
 b=QfFM3dlR6rUrYTg5OGlHkVhggrYDD6C6zdCvlSK8W5KOp7mezUyhcajBc2VOC8I1fb
 MB7zFefx+VD2QD4JyzM7qVel2YhlFWJHLBdnzD+1kYnvqDF2AUCfLXjV2g65nDODdAsd
 zcWsw0WyexoXkk9z0cZ2FSSTlQJWj1YsOX4yoQHmuekjbrvoP6EKRIphp7g8Bw3ddv+w
 DlTHDmxbvByk/grVyVEyR9DThGUgEZTTwdpHviNY4ZwPUivuAVo4xZbe6Zkybv1BhExL
 /4j//H+tgnMpSqgNa1DGUA7Zp5R4oVBzkqZBeh9VQTa8V4nDGBskNhV5VMZ5aJZaFGPt
 MZDg==
X-Gm-Message-State: AOAM530AkjAjoXUknmTPgahqB/ubZ3b156gzPYFgOIGe/gw9E84Ea8Dl
 lA2rK6oLlxDE5OYxDItIP14D3KJqco+l0LwMYZSX6A==
X-Google-Smtp-Source: ABdhPJwlmgv1nxXUyiCdmuycEblJsdc+exAwUjlc+baaZP3QN4hfnKh+ayfcq9JT6ULnHrfUVsBZcEogv163+Knznao=
X-Received: by 2002:a92:194b:: with SMTP id e11mr10060061ilm.200.1631585643425; 
 Mon, 13 Sep 2021 19:14:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210914013732.881754-1-frank.chang@sifive.com>
 <f7b4ea83-ddef-d70c-99e3-3c9afff2afb2@linaro.org>
In-Reply-To: <f7b4ea83-ddef-d70c-99e3-3c9afff2afb2@linaro.org>
From: Frank Chang <frank.chang@sifive.com>
Date: Tue, 14 Sep 2021 10:13:52 +0800
Message-ID: <CAE_xrPh44msuefacdYSYmXUthEV=5JS-8nSKTU+v9vkx7-tVzQ@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Force to set mstatus_hs.[SD|FS] bits in
 mark_fs_dirty()
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Vincent Chen <vincent.chen@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: multipart/alternative; boundary="000000000000b28bd105cbeb22fb"
Received-SPF: pass client-ip=2607:f8b0:4864:20::135;
 envelope-from=frank.chang@sifive.com; helo=mail-il1-x135.google.com
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
X-List-Received-Date: Tue, 14 Sep 2021 02:14:07 -0000

--000000000000b28bd105cbeb22fb
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 14, 2021 at 10:10 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 9/13/21 6:37 PM, frank.chang@sifive.com wrote:
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
> >   target/riscv/translate.c | 19 ++++++++++---------
> >   1 file changed, 10 insertions(+), 9 deletions(-)
> >
> > diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> > index e356fc6c46c..0096b098738 100644
> > --- a/target/riscv/translate.c
> > +++ b/target/riscv/translate.c
> > @@ -280,26 +280,27 @@ static void gen_jal(DisasContext *ctx, int rd,
> target_ulong imm)
> >   static void mark_fs_dirty(DisasContext *ctx)
> >   {
> >       TCGv tmp;
> > -    target_ulong sd;
> > +    target_ulong sd = is_32bit(ctx) ? MSTATUS32_SD : MSTATUS64_SD;
> > +
> > +    if (ctx->virt_enabled) {
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
>
> You should introduce a ctx->mstatus_hs field to track the code that you
> moved.  Otherwise
> you'll be setting this dirty bit for every fp insn.
>
>
Thanks, Richard, I was struggling with whether to introduce a new field
in DisasContext.
I will update my patch.

Regards,
Frank Chang


>
> r~
>

--000000000000b28bd105cbeb22fb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, Sep 14, 2021 at 10:10 AM Richard =
Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.hende=
rson@linaro.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">On 9/13/21 6:37 PM, <a href=3D"ma=
ilto:frank.chang@sifive.com" target=3D"_blank">frank.chang@sifive.com</a> w=
rote:<br>
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
&gt;=C2=A0 =C2=A0target/riscv/translate.c | 19 ++++++++++---------<br>
&gt;=C2=A0 =C2=A01 file changed, 10 insertions(+), 9 deletions(-)<br>
&gt; <br>
&gt; diff --git a/target/riscv/translate.c b/target/riscv/translate.c<br>
&gt; index e356fc6c46c..0096b098738 100644<br>
&gt; --- a/target/riscv/translate.c<br>
&gt; +++ b/target/riscv/translate.c<br>
&gt; @@ -280,26 +280,27 @@ static void gen_jal(DisasContext *ctx, int rd, t=
arget_ulong imm)<br>
&gt;=C2=A0 =C2=A0static void mark_fs_dirty(DisasContext *ctx)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0TCGv tmp;<br>
&gt; -=C2=A0 =C2=A0 target_ulong sd;<br>
&gt; +=C2=A0 =C2=A0 target_ulong sd =3D is_32bit(ctx) ? MSTATUS32_SD : MSTA=
TUS64_SD;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (ctx-&gt;virt_enabled) {<br>
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
<br>
You should introduce a ctx-&gt;mstatus_hs field to track the code that you =
moved.=C2=A0 Otherwise <br>
you&#39;ll be setting this dirty bit for every fp insn.<br>
<br></blockquote><div><br></div><div>Thanks, Richard, I was struggling with=
 whether to introduce a new field in=C2=A0DisasContext.</div><div>I will up=
date my patch.</div><div><br></div><div>Regards,</div><div>Frank Chang</div=
><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
r~<br>
</blockquote></div></div>

--000000000000b28bd105cbeb22fb--

