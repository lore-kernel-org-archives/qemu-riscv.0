Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nhi2G-0003pg-Jt
	for mharc-qemu-riscv@gnu.org; Thu, 21 Apr 2022 21:24:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nhi2F-0003o2-4q
 for qemu-riscv@nongnu.org; Thu, 21 Apr 2022 21:24:35 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:33360)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nhi2B-00036Y-Mb
 for qemu-riscv@nongnu.org; Thu, 21 Apr 2022 21:24:34 -0400
Received: by mail-ed1-x52e.google.com with SMTP id e30so5122557eda.0
 for <qemu-riscv@nongnu.org>; Thu, 21 Apr 2022 18:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Z/icvVV1wNwbgluBxV5GVOplTnncAL+NrLXYDKesKew=;
 b=kh3p36DoGbeEDLUt0NFAJQB/Y8he9QkazCTuAzs1n1Y/wUyqkzddS0Qe5UDmNWQYVX
 KzexFAJr6x//S7DQ06zdnFJXZGxrneTa09wPrkWHkGwLCMiadQOCjoDiDzcSc++V4RIX
 jSfuPIJQEc1zOKnzuh3GBKSixvcHWqhjj6DvXI6LaGVdP0K1FCosfhXhx51siAt8Z4qG
 u0uEPxb3I1jC3df6l+sOCcOBg4CsjIiOBxSFxQOqGpDi8oOQst3+hl0HNosyv4qhPWpA
 L2flUBSPDf4wcfU+IXa80oCfgtKjkKJN+aUMMEe4XvqixFjWIYTcrHSo5CFePV2oQMbB
 geXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Z/icvVV1wNwbgluBxV5GVOplTnncAL+NrLXYDKesKew=;
 b=63kpYlTciOx6y8lacZb3+FqpFDxfnPSK0S53MEMJ83PdbooJ+Z8SivVdAyYXNfDZbA
 mkcw2p3n3ACgIOpmAkNXFw7dPsCY2MXRd5V/qhPCQ0TIqRCd/zpM0AWvhJr2UGb7nDpL
 GaRN029LT+UNlBHBqNq/aSTXnvPoJuOlRnNrJIWy3ToQSTc+EDEVJl3fUZPmZ1/4uxrl
 GFRuy7xyW9Twc1vLsZlR8H0h8Jd1ta5GOZkSbcL2OH06OsKlT7pkr4980pI0LRbpxM4O
 ZLZpiv+KO00Gn4buqQzQS+Ne8JYgHOo0ygzV4elGckvaIa8tB8yLsVRoZ3HOoOygqQAB
 Jtyw==
X-Gm-Message-State: AOAM530jkLW1Vk2TQ9+sJSQznXS0gJmjT6h0rNBp/g+ucYf0YB1y/NeJ
 OlFEBq5hkp8ZLukN4S/CeZ9A+VW81DK+0ygyOaHaSw==
X-Google-Smtp-Source: ABdhPJw7vVCelVdsqLYWZcATuzt6vzeaqgjsNsMPJhx6Mep2eK9B4CBPwdcVmrRijliCTam6jj5vHaF9YE9WDGJ0w34=
X-Received: by 2002:aa7:d553:0:b0:416:4dfc:126d with SMTP id
 u19-20020aa7d553000000b004164dfc126dmr2306260edr.213.1650590668419; Thu, 21
 Apr 2022 18:24:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220420095718.26392-1-frank.chang@sifive.com>
 <CAEUhbmXfoWOpjt6YyVztxv49P9-xQjmHgD6OZ8TgJ-yUTbZd8Q@mail.gmail.com>
 <CAKmqyKPVs4zG9vn_6haH2DcM2XW1M9tSP4c81inEd_pZtF0c2Q@mail.gmail.com>
In-Reply-To: <CAKmqyKPVs4zG9vn_6haH2DcM2XW1M9tSP4c81inEd_pZtF0c2Q@mail.gmail.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Fri, 22 Apr 2022 09:24:17 +0800
Message-ID: <CAE_xrPjPjjeuH34mNcRGFBUYvn_zUOhUL8AAnk6cMC0eMa9Yog@mail.gmail.com>
Subject: Re: [PATCH v2] target/riscv: Support configuarable marchid,
 mvendorid, mipid CSR values
To: Alistair Francis <alistair23@gmail.com>
Cc: Bin Meng <bmeng.cn@gmail.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Jim Shu <jim.shu@sifive.com>, Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: multipart/alternative; boundary="0000000000007610a205dd3416c5"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=frank.chang@sifive.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Fri, 22 Apr 2022 01:24:35 -0000

--0000000000007610a205dd3416c5
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 22, 2022 at 8:48 AM Alistair Francis <alistair23@gmail.com>
wrote:

> On Thu, Apr 21, 2022 at 12:17 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > On Wed, Apr 20, 2022 at 5:57 PM <frank.chang@sifive.com> wrote:
> > >
> > > From: Frank Chang <frank.chang@sifive.com>
> > >
> > > Allow user to set core's marchid, mvendorid, mipid CSRs through
> > > -cpu command line option.
> > >
> > > The default values of marchid and mipid are built with QEMU's version
> > > numbers.
> > >
> > > Signed-off-by: Frank Chang <frank.chang@sifive.com>
> > > Reviewed-by: Jim Shu <jim.shu@sifive.com>
> > > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> > > ---
> > >  target/riscv/cpu.c |  9 +++++++++
> > >  target/riscv/cpu.h |  4 ++++
> > >  target/riscv/csr.c | 38 ++++++++++++++++++++++++++++++++++----
> > >  3 files changed, 47 insertions(+), 4 deletions(-)
> > >
> >
> > Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
>
> Do you mind rebasing this on
> https://github.com/alistair23/qemu/tree/riscv-to-apply.next ?
>

Sure, will do.

Regards,
Frank Chang


>
> I have sent a PR and hopefully it should be merged into master soon
>
> Alistair
>
> >
>

--0000000000007610a205dd3416c5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, Apr 22, 2022 at 8:48 AM Alistair =
Francis &lt;<a href=3D"mailto:alistair23@gmail.com">alistair23@gmail.com</a=
>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">On Thu, Apr 21, 2022 at 12:17 PM Bin Meng &lt;<a hr=
ef=3D"mailto:bmeng.cn@gmail.com" target=3D"_blank">bmeng.cn@gmail.com</a>&g=
t; wrote:<br>
&gt;<br>
&gt; On Wed, Apr 20, 2022 at 5:57 PM &lt;<a href=3D"mailto:frank.chang@sifi=
ve.com" target=3D"_blank">frank.chang@sifive.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; From: Frank Chang &lt;<a href=3D"mailto:frank.chang@sifive.com" t=
arget=3D"_blank">frank.chang@sifive.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; Allow user to set core&#39;s marchid, mvendorid, mipid CSRs throu=
gh<br>
&gt; &gt; -cpu command line option.<br>
&gt; &gt;<br>
&gt; &gt; The default values of marchid and mipid are built with QEMU&#39;s=
 version<br>
&gt; &gt; numbers.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Frank Chang &lt;<a href=3D"mailto:frank.chang@sifi=
ve.com" target=3D"_blank">frank.chang@sifive.com</a>&gt;<br>
&gt; &gt; Reviewed-by: Jim Shu &lt;<a href=3D"mailto:jim.shu@sifive.com" ta=
rget=3D"_blank">jim.shu@sifive.com</a>&gt;<br>
&gt; &gt; Reviewed-by: Alistair Francis &lt;<a href=3D"mailto:alistair.fran=
cis@wdc.com" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 target/riscv/cpu.c |=C2=A0 9 +++++++++<br>
&gt; &gt;=C2=A0 target/riscv/cpu.h |=C2=A0 4 ++++<br>
&gt; &gt;=C2=A0 target/riscv/csr.c | 38 ++++++++++++++++++++++++++++++++++-=
---<br>
&gt; &gt;=C2=A0 3 files changed, 47 insertions(+), 4 deletions(-)<br>
&gt; &gt;<br>
&gt;<br>
&gt; Reviewed-by: Bin Meng &lt;<a href=3D"mailto:bmeng.cn@gmail.com" target=
=3D"_blank">bmeng.cn@gmail.com</a>&gt;<br>
<br>
Do you mind rebasing this on<br>
<a href=3D"https://github.com/alistair23/qemu/tree/riscv-to-apply.next" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/alistair23/qemu/tree/r=
iscv-to-apply.next</a> ?<br></blockquote><div><br></div><div>Sure, will do.=
</div><div><br></div><div>Regards,</div><div>Frank Chang</div><div>=C2=A0</=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
I have sent a PR and hopefully it should be merged into master soon<br>
<br>
Alistair<br>
<br>
&gt;<br>
</blockquote></div></div>

--0000000000007610a205dd3416c5--

