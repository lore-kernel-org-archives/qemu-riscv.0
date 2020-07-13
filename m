Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1junvv-0004yP-96
	for mharc-qemu-riscv@gnu.org; Sun, 12 Jul 2020 22:11:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1junvu-0004yJ-Ie
 for qemu-riscv@nongnu.org; Sun, 12 Jul 2020 22:11:06 -0400
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a]:33246)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1junvs-0008Ft-Gx
 for qemu-riscv@nongnu.org; Sun, 12 Jul 2020 22:11:06 -0400
Received: by mail-ot1-x32a.google.com with SMTP id h13so8437010otr.0
 for <qemu-riscv@nongnu.org>; Sun, 12 Jul 2020 19:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aCCzcEhMsYmcwKT8iqu9DTeEBGiKq/VBfCeYVCas5VM=;
 b=YpZRe9oa0tKVnKTdTau6cyuVFxKuO3XEr4WWhehCiONWqnZW7bXNMm9XbjXUnCALFo
 lib8RlPuLYQkpuDOqnfH1TCrVD6AUBVaza21QfZlWr9CaBYcajo6qGlARvUiWGpvUZy5
 oT4hHNyoQlbdnqMhhuyFCRrSDLbVDG7MvO5j1DM9/gtufKXlrlDzhHxs3/AQDZMjj1E5
 KBHqNGEJ061/+EFHfOuHbsXfvxYdoEl+HlFca5dlbIX3/ofkqppU9ZvUgCDkmzK2fAH4
 6k6yyOXA4xphj8ciRF1QnjmrGT/tA0FUy8seNxFcaU/a+i+BxAk8St0B9U/+A0TUZyAL
 wwIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aCCzcEhMsYmcwKT8iqu9DTeEBGiKq/VBfCeYVCas5VM=;
 b=GnlyIqzkpeCn7wv1MyaOXa4Hm+lGAGvdgDZVySeuSEAnYCfnN33qeyytKAgdc0v5yh
 KpWyU5dwLj5F2BD8l1rBYc8y93yyh+8Y6lqz5vE/Bfdan6hpiZwSpTQRc5LsdCd4IDbm
 38LhlZmfdQjvgXjlJOU1wN/64ytz11J6AvCJ1zfXcfLA85Vbm4R2G3bLblSZkWW0tuXe
 ngFuHwL5DoMC38Qx8xhUbZMQq56uPH2XEuzSq0Ksd018A8yE0KmJ9QXXf5HGenkBiazc
 mYKfBmNcoV4g7HeSRJVMy4lallG9CiVzrBNhIc3dj2NSuqB9U/iQpxP+c3rIiCFdPUaw
 S3oA==
X-Gm-Message-State: AOAM530IDZkILRHcil6Rg4PucV6c7yCZoj5Nsl2c3wveYesEndPOuH0g
 As92DvK+qhbkq1+Xm2xzocta0LXyll9vo3s7I6siDA==
X-Google-Smtp-Source: ABdhPJz27Evq7mAjVpEVt4zmc2G9o949X5qOuujZGqlpgu6KtDxOkMHQPlfmAM9D9eFsOPBfKnxddfLRIY78mreS9eU=
X-Received: by 2002:a9d:6350:: with SMTP id y16mr53170500otk.139.1594606263273; 
 Sun, 12 Jul 2020 19:11:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200710104920.13550-1-frank.chang@sifive.com>
 <20200710104920.13550-13-frank.chang@sifive.com>
 <ea39eb18-20fe-eecf-454c-6afc04d711f7@linaro.org>
In-Reply-To: <ea39eb18-20fe-eecf-454c-6afc04d711f7@linaro.org>
From: Frank Chang <frank.chang@sifive.com>
Date: Mon, 13 Jul 2020 10:10:52 +0800
Message-ID: <CAE_xrPi5pDVCMuM+DB+PfS750bHYL6pWZ43pZp4BdiL1B8WWww@mail.gmail.com>
Subject: Re: [RFC 12/65] target/riscv: rvv-0.9: update check functions
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Content-Type: multipart/alternative; boundary="000000000000e1223205aa493334"
Received-SPF: pass client-ip=2607:f8b0:4864:20::32a;
 envelope-from=frank.chang@sifive.com; helo=mail-ot1-x32a.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 13 Jul 2020 02:11:06 -0000

--000000000000e1223205aa493334
Content-Type: text/plain; charset="UTF-8"

On Sat, Jul 11, 2020 at 1:51 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 7/10/20 3:48 AM, frank.chang@sifive.com wrote:
> > +#define REQUIRE_RVV do {    \
> > +    if (s->mstatus_vs == 0) \
> > +        return false;       \
> > +} while (0)
>
> You've used this macro already back in patch 7.  I guess it should not have
> been there?  Or this bit belongs there, one or the other.
>
> I think this patch requires a description and justification.  I have no
> idea
> why you are replacing
>

Yes, this change should be moved to patch 7.


>
> > -    return (vext_check_isa_ill(s) &&
> > -            vext_check_overlap_mask(s, a->rd, a->vm, false) &&
> > -            vext_check_reg(s, a->rd, false) &&
> > -            vext_check_reg(s, a->rs2, false) &&
> > -            vext_check_reg(s, a->rs1, false));
>
> with invisible returns
>
> > +    REQUIRE_RVV;
> > +    VEXT_CHECK_ISA_ILL(s);
> > +    VEXT_CHECK_SSS(s, a->rd, a->rs1, a->rs2, a->vm, true);
> > +    return true;
>
>
> r~
>

You're right, I will resend the patches with more description and
justification.

Frank Chang

--000000000000e1223205aa493334
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sat, Jul 11, 2020 at 1:51 AM Richard H=
enderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.hender=
son@linaro.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">On 7/10/20 3:48 AM, <a href=3D"mai=
lto:frank.chang@sifive.com" target=3D"_blank">frank.chang@sifive.com</a> wr=
ote:<br>
&gt; +#define REQUIRE_RVV do {=C2=A0 =C2=A0 \<br>
&gt; +=C2=A0 =C2=A0 if (s-&gt;mstatus_vs =3D=3D 0) \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;=C2=A0 =C2=A0 =C2=A0 =C2=A0\=
<br>
&gt; +} while (0)<br>
<br>
You&#39;ve used this macro already back in patch 7.=C2=A0 I guess it should=
 not have<br>
been there?=C2=A0 Or this bit belongs there, one or the other.<br>
<br>
I think this patch requires a description and justification.=C2=A0 I have n=
o idea<br>
why you are replacing<br></blockquote><div><br></div><div>Yes, this change =
should be moved to patch 7.</div><div>=C2=A0</div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">
<br>
&gt; -=C2=A0 =C2=A0 return (vext_check_isa_ill(s) &amp;&amp;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vext_check_overlap_mask(s, =
a-&gt;rd, a-&gt;vm, false) &amp;&amp;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vext_check_reg(s, a-&gt;rd,=
 false) &amp;&amp;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vext_check_reg(s, a-&gt;rs2=
, false) &amp;&amp;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vext_check_reg(s, a-&gt;rs1=
, false));<br>
<br>
with invisible returns<br>
<br>
&gt; +=C2=A0 =C2=A0 REQUIRE_RVV;<br>
&gt; +=C2=A0 =C2=A0 VEXT_CHECK_ISA_ILL(s);<br>
&gt; +=C2=A0 =C2=A0 VEXT_CHECK_SSS(s, a-&gt;rd, a-&gt;rs1, a-&gt;rs2, a-&gt=
;vm, true);<br>
&gt; +=C2=A0 =C2=A0 return true;<br>
<br>
<br>
r~<br></blockquote><div><br></div><div>You&#39;re right, I will resend the =
patches with more description and justification.</div><div><br></div><div>F=
rank Chang=C2=A0</div></div></div>

--000000000000e1223205aa493334--

