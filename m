Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mbfR2-0002UD-58
	for mharc-qemu-riscv@gnu.org; Sat, 16 Oct 2021 04:52:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbfR0-0002SL-DX
 for qemu-riscv@nongnu.org; Sat, 16 Oct 2021 04:52:54 -0400
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133]:41927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbfQy-0003sS-MC
 for qemu-riscv@nongnu.org; Sat, 16 Oct 2021 04:52:54 -0400
Received: by mail-il1-x133.google.com with SMTP id d11so9588559ilc.8
 for <qemu-riscv@nongnu.org>; Sat, 16 Oct 2021 01:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=T9u1nm+CwLhB5jIRVog43fyVg5RFc3gabjxZL45eFMo=;
 b=drMuEa7aOb+ltn+PkGuEStIsSFzDfrZIxiIo7wAoen7zptr8Wnm0x3nh6fevsvdP7G
 QgpkByB4uO8T13zheiiTblDxAFBV7h3DOE41jpzg7Cwp2DaiGyykf9zjrzIQtOkUTHOq
 UbO2J3f6RI47+rtblKrCoyTOyyrdYJH3znFEczmZp6B5lWwnoCYZB1N6obNKc0Ba4+XP
 WsBQOzwuE0yvWzvnGvDo6DFzJLQ73JPJtC9JyuKdFXnvzSExOHSAEBry1H6VyJFzbgFD
 aKo5u2wTGT3vHJmoSG79Fzd86wdUz0vnqmVlvKEFQlIalklOzCUXa40q57nobI+Fn0AQ
 NDzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T9u1nm+CwLhB5jIRVog43fyVg5RFc3gabjxZL45eFMo=;
 b=GZ+QrPyEYKmyDw16PYFjKmBpDkLdHgVBlYsGaWIimzYjpjVTIlP87rhXNxghO3poJA
 N3Oj5ulbndCn6jSaTCecB9LS2ovYwPmi8wmaNo86cAI8/Q3VMvRuot5ClGgv/BdYsI1v
 m8u3Aoin9KejY4J7MbcmduCdtR8J9En7qi/ZyFU1WfQoRhGJh6jz5xsV+KGGXo+/44Y7
 LuKfdenYnwgjyL53JomafdsUau2BKQ8bPJQK2ur2hqDiWMl69wT9D8zUeKi5RFoPgcm9
 nqfloicJ2q/nZeaxVwVjlJVvpnN53WG1M7rxjh6IRshWVtjUbbJfGZytuLH6B95BM1DV
 mtsQ==
X-Gm-Message-State: AOAM533cKcz6PyvGzyyD1/sXoaXCNTIzmrJ5TtSpgrYuVlZnkJOaTh77
 ukHMHVqvqqO2qQdKg3eW657FdkFWdfr8zrN7gb7Tsm7bh3Xfdw==
X-Google-Smtp-Source: ABdhPJyOMYavmsBV/9CNup2HmuAHG4mt4zLcl4ZJXEI7wRxydERQnw+TpJB3bXw8372+e2Msw82cFODJK4MXgaD3jHg=
X-Received: by 2002:a05:6e02:b2a:: with SMTP id
 e10mr6873416ilu.53.1634374371656; 
 Sat, 16 Oct 2021 01:52:51 -0700 (PDT)
MIME-Version: 1.0
References: <20211015065500.3850513-1-frank.chang@sifive.com>
 <20211015065500.3850513-3-frank.chang@sifive.com>
 <4b718269-b222-c08f-ca72-656bacc31331@linaro.org>
In-Reply-To: <4b718269-b222-c08f-ca72-656bacc31331@linaro.org>
From: Frank Chang <frank.chang@sifive.com>
Date: Sat, 16 Oct 2021 16:52:40 +0800
Message-ID: <CAE_xrPibc4W9FqoXUvLQ=pnW7h85ZYnYYwjLR-Rs+0NbifXc-A@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] target/riscv: change the api for single/double
 fmin/fmax
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Chih-Min Chao <chihmin.chao@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: multipart/alternative; boundary="000000000000da59e705ce746ffb"
Received-SPF: pass client-ip=2607:f8b0:4864:20::133;
 envelope-from=frank.chang@sifive.com; helo=mail-il1-x133.google.com
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
X-List-Received-Date: Sat, 16 Oct 2021 08:52:54 -0000

--000000000000da59e705ce746ffb
Content-Type: text/plain; charset="UTF-8"

On Sat, Oct 16, 2021 at 1:05 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 10/14/21 11:54 PM, frank.chang@sifive.com wrote:
> > From: Chih-Min Chao<chihmin.chao@sifive.com>
> >
> > The sNaN propagation behavior has been changed since
> > cd20cee7 inhttps://github.com/riscv/riscv-isa-manual
> >
> > Signed-off-by: Chih-Min Chao<chihmin.chao@sifive.com>
> > ---
> >   target/riscv/fpu_helper.c | 8 ++++----
> >   1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/target/riscv/fpu_helper.c b/target/riscv/fpu_helper.c
> > index 8700516a14c..1472ead2528 100644
> > --- a/target/riscv/fpu_helper.c
> > +++ b/target/riscv/fpu_helper.c
> > @@ -174,14 +174,14 @@ uint64_t helper_fmin_s(CPURISCVState *env,
> uint64_t rs1, uint64_t rs2)
> >   {
> >       float32 frs1 = check_nanbox_s(rs1);
> >       float32 frs2 = check_nanbox_s(rs2);
> > -    return nanbox_s(float32_minnum(frs1, frs2, &env->fp_status));
> > +    return nanbox_s(float32_minnum_noprop(frs1, frs2, &env->fp_status));
> >   }
>
> Don't you need to conditionalize behaviour on the isa revision?
>
>
I will pick the right API based on CPU privilege spec version.

Thanks,
Frank Chang


>
> r~
>

--000000000000da59e705ce746ffb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sat, Oct 16, 2021 at 1:05 AM Richard H=
enderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.hender=
son@linaro.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">On 10/14/21 11:54 PM, <a href=3D"m=
ailto:frank.chang@sifive.com" target=3D"_blank">frank.chang@sifive.com</a> =
wrote:<br>
&gt; From: Chih-Min Chao&lt;<a href=3D"mailto:chihmin.chao@sifive.com" targ=
et=3D"_blank">chihmin.chao@sifive.com</a>&gt;<br>
&gt; <br>
&gt; The sNaN propagation behavior has been changed since<br>
&gt; cd20cee7 inhttps://<a href=3D"http://github.com/riscv/riscv-isa-manual=
" rel=3D"noreferrer" target=3D"_blank">github.com/riscv/riscv-isa-manual</a=
><br>
&gt; <br>
&gt; Signed-off-by: Chih-Min Chao&lt;<a href=3D"mailto:chihmin.chao@sifive.=
com" target=3D"_blank">chihmin.chao@sifive.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0target/riscv/fpu_helper.c | 8 ++++----<br>
&gt;=C2=A0 =C2=A01 file changed, 4 insertions(+), 4 deletions(-)<br>
&gt; <br>
&gt; diff --git a/target/riscv/fpu_helper.c b/target/riscv/fpu_helper.c<br>
&gt; index 8700516a14c..1472ead2528 100644<br>
&gt; --- a/target/riscv/fpu_helper.c<br>
&gt; +++ b/target/riscv/fpu_helper.c<br>
&gt; @@ -174,14 +174,14 @@ uint64_t helper_fmin_s(CPURISCVState *env, uint6=
4_t rs1, uint64_t rs2)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0float32 frs1 =3D check_nanbox_s(rs1);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0float32 frs2 =3D check_nanbox_s(rs2);<br>
&gt; -=C2=A0 =C2=A0 return nanbox_s(float32_minnum(frs1, frs2, &amp;env-&gt=
;fp_status));<br>
&gt; +=C2=A0 =C2=A0 return nanbox_s(float32_minnum_noprop(frs1, frs2, &amp;=
env-&gt;fp_status));<br>
&gt;=C2=A0 =C2=A0}<br>
<br>
Don&#39;t you need to conditionalize behaviour on the isa revision?<br>
<br></blockquote><div><br></div><div>I will pick the right API based on CPU=
 privilege spec version.</div><div><br></div><div>Thanks,</div><div>Frank C=
hang</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
<br>
r~<br>
</blockquote></div></div>

--000000000000da59e705ce746ffb--

