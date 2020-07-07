Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jsppN-00072m-Ag
	for mharc-qemu-riscv@gnu.org; Tue, 07 Jul 2020 11:48:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lazyparser@gmail.com>)
 id 1jsppK-000701-98
 for qemu-riscv@nongnu.org; Tue, 07 Jul 2020 11:48:10 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:37183)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lazyparser@gmail.com>)
 id 1jsppI-0002mW-93
 for qemu-riscv@nongnu.org; Tue, 07 Jul 2020 11:48:10 -0400
Received: by mail-ot1-x342.google.com with SMTP id w17so26801687otl.4
 for <qemu-riscv@nongnu.org>; Tue, 07 Jul 2020 08:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1us8gUXtI2KWxa8AIk1mj+Avcpx3wvkQ0xO5/LLiM3M=;
 b=uJSvpDPXtM7/l4sZ9+Er52muq8kMH/KqumrRnMALz+EiIy2xCF/yhSQ/T5WkHlRCUy
 zmjVmnAjEG6nPzUKUth1qQYXsFBKtDFuESZ7CP3Iw0xO5V+C5jtKwRFRMxyEr2ynVyik
 kBqNXU5CHDdLnOCPZrwGQ86l5OXJk8acsLUOw3c5COviGFN3P3B9FyHOAmbpRm+BXYzk
 7rT7yg1T1Mquc2lrVti7No+yS1BVusMhsRVRNzOfD83Vl7Fb4Qso0VYH0kOsspUsZtSo
 7JN+QZhAd6djmJsZtEVVYoJgLSZUuWoyOG4BFDHip3VEi600XdfNlAPxG92hpQI7JXj4
 xIOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1us8gUXtI2KWxa8AIk1mj+Avcpx3wvkQ0xO5/LLiM3M=;
 b=rgjDzUiuQ0NRFiOZDRFBOljSmPP0Bdy2tqXSQyJMbkqGrr6ezpa6a5R8C4i+lmOOtc
 /RSbz4GjsLR8o1nqmDHouJKxh8bRkcv+dhn8epTpJVkY1Wmz4AS3ZOvylCra9KX97qXg
 eY789mm2s8cwDjljbhi22HG4FJAjQXEpRHJ0UP3yce8rxXwdRCOJQUAxbD3YOIOKNZSD
 9WsyI6wSe+m8dlKRBfMaaJ+YwhgQhrGgV6tn/3bPAzMvmZDNZKtGfn9qio7DtS7AFlo4
 JUL7JcBj8LC7cW5WZCQNlZm0ObjOgVrYnV0III4n3+52crrTWtzLCsUaDmAv67lWLxTX
 PwBA==
X-Gm-Message-State: AOAM5328Lz4iZQ0VuZbFt9I4U+TDYjfDh0bePwaT958Fo/3vdSJE6f52
 RZPN6+hgY9ouv0bFOn7BsJOPfSvjyyuFO8o1x30=
X-Google-Smtp-Source: ABdhPJzYEP+dzIVHhyNdSHzmPoocI02dDY8/3VokyFO6FXQgPY8K4TvLzjvnXBFmJpi7CJYXIXWU4/+sUriqlErQmm0=
X-Received: by 2002:a9d:6c56:: with SMTP id g22mr44033384otq.280.1594136887199; 
 Tue, 07 Jul 2020 08:48:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200707100930.4041-1-lazyparser@gmail.com>
 <cda6e3acd4e462cfc0cfcfe81ac3132e3447e6ef.camel@wdc.com>
In-Reply-To: <cda6e3acd4e462cfc0cfcfe81ac3132e3447e6ef.camel@wdc.com>
From: =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>
Date: Tue, 7 Jul 2020 23:47:30 +0800
Message-ID: <CANkjrB7XtDNSiaCYvOCyVxDY0iwsWPbwv3HCJ_MU_8XGRx3pqQ@mail.gmail.com>
Subject: Re: [PATCH] disas/riscv: Fix incorrect disassembly for `imm20`
 operand.
To: Alistair Francis <Alistair.Francis@wdc.com>
Cc: "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>
Content-Type: multipart/alternative; boundary="000000000000e28aa305a9dbeae5"
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=lazyparser@gmail.com; helo=mail-ot1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Tue, 07 Jul 2020 15:48:10 -0000

--000000000000e28aa305a9dbeae5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alistair,

Thank you for your quick response. I've sent the patch to the qemu-devel.


On Tue, Jul 7, 2020 at 11:15 PM Alistair Francis <Alistair.Francis@wdc.com>
wrote:

> On Tue, 2020-07-07 at 18:09 +0800, lazyparser@gmail.com wrote:
> > From: Wei Wu <lazyparser@gmail.com>
> >
> > `imm20` operand type is used in LUI/AUIPC and other instructions.
> > The value should not be left shifted 12bits for disassembly output.
> >
> > Signed-off-by: Wei Wu <lazyparser@gmail.com>
>
> Hello,
>
> Thanks for the patch.
>
> Can you please send it again and make sure you CC the QEMU mailing
> list? https://lists.nongnu.org/mailman/listinfo/qemu-devel
>
> Alistair
>
> > ---
> >  disas/riscv.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/disas/riscv.c b/disas/riscv.c
> > index 278d9be924..a2b6472bd8 100644
> > --- a/disas/riscv.c
> > +++ b/disas/riscv.c
> > @@ -2083,7 +2083,7 @@ static int32_t operand_imm12(rv_inst inst)
> >
> >  static int32_t operand_imm20(rv_inst inst)
> >  {
> > -    return (((int64_t)inst << 32) >> 44) << 12;
> > +    return ((int64_t)inst << 32) >> 44;
> >  }
> >
> >  static int32_t operand_jimm20(rv_inst inst)
>


--=20
Best wishes,
Wei Wu (=E5=90=B4=E4=BC=9F)

--000000000000e28aa305a9dbeae5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Alistair,</div><div><br></div><div>Thank you for y=
our quick response. I&#39;ve sent the patch to the qemu-devel.</div><div><b=
r></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmai=
l_attr">On Tue, Jul 7, 2020 at 11:15 PM Alistair Francis &lt;<a href=3D"mai=
lto:Alistair.Francis@wdc.com">Alistair.Francis@wdc.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue, 2020-07-07 at=
 18:09 +0800, <a href=3D"mailto:lazyparser@gmail.com" target=3D"_blank">laz=
yparser@gmail.com</a> wrote:<br>
&gt; From: Wei Wu &lt;<a href=3D"mailto:lazyparser@gmail.com" target=3D"_bl=
ank">lazyparser@gmail.com</a>&gt;<br>
&gt; <br>
&gt; `imm20` operand type is used in LUI/AUIPC and other instructions.<br>
&gt; The value should not be left shifted 12bits for disassembly output.<br=
>
&gt; <br>
&gt; Signed-off-by: Wei Wu &lt;<a href=3D"mailto:lazyparser@gmail.com" targ=
et=3D"_blank">lazyparser@gmail.com</a>&gt;<br>
<br>
Hello,<br>
<br>
Thanks for the patch.<br>
<br>
Can you please send it again and make sure you CC the QEMU mailing<br>
list? <a href=3D"https://lists.nongnu.org/mailman/listinfo/qemu-devel" rel=
=3D"noreferrer" target=3D"_blank">https://lists.nongnu.org/mailman/listinfo=
/qemu-devel</a><br>
<br>
Alistair<br>
<br>
&gt; ---<br>
&gt;=C2=A0 disas/riscv.c | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/disas/riscv.c b/disas/riscv.c<br>
&gt; index 278d9be924..a2b6472bd8 100644<br>
&gt; --- a/disas/riscv.c<br>
&gt; +++ b/disas/riscv.c<br>
&gt; @@ -2083,7 +2083,7 @@ static int32_t operand_imm12(rv_inst inst)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 static int32_t operand_imm20(rv_inst inst)<br>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 return (((int64_t)inst &lt;&lt; 32) &gt;&gt; 44) &lt;&l=
t; 12;<br>
&gt; +=C2=A0 =C2=A0 return ((int64_t)inst &lt;&lt; 32) &gt;&gt; 44;<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 static int32_t operand_jimm20(rv_inst inst)<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Best wishes,<br>Wei Wu (=E5=90=B4=E4=BC=9F)<br></div>

--000000000000e28aa305a9dbeae5--

