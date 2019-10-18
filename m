Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iLXvs-00036j-2H
	for mharc-qemu-riscv@gnu.org; Fri, 18 Oct 2019 15:29:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43613)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dayeol@berkeley.edu>) id 1iLXvo-00036L-JT
 for qemu-riscv@nongnu.org; Fri, 18 Oct 2019 15:29:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dayeol@berkeley.edu>) id 1iLXvm-0004El-GH
 for qemu-riscv@nongnu.org; Fri, 18 Oct 2019 15:28:59 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:42751)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <dayeol@berkeley.edu>) id 1iLXvl-0004E8-VA
 for qemu-riscv@nongnu.org; Fri, 18 Oct 2019 15:28:58 -0400
Received: by mail-pf1-x442.google.com with SMTP id q12so4461305pff.9
 for <qemu-riscv@nongnu.org>; Fri, 18 Oct 2019 12:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=berkeley-edu.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=o2ASzqNDOudnlD9OoriHepPheuyTCPpOcDnqilBEaGA=;
 b=E/DQLOre61oJePXWKAcCM2FJ90Gq955P1sO9rndKdQcJ16wudPnPIpXgHLXj57lkPa
 dHcNRHuhLRzX7OrPj/M7mwcwSjslrhstemtHGx/2uqs/7A84Au7/zJ+2AbXh1aaD1GPA
 KLCwXTNZ2nkjw7LL+ynA42iEA7liz2Q5GuXhBBjMVwYUnRTQve7iWZBhHT1Vaq8Pxu9R
 NJSGF76AS/0bAZwSwBXPbhjx0IYOgJy/ynuRQsquv4agmZQwmlE7r4UNw2UrV/24oYvg
 Aps3Rd8iuWnH91YtQzr2Le86aluptvS0c38sfwXadTJNFH94I2VjX63kvSHPOpNcEv0z
 9Eew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o2ASzqNDOudnlD9OoriHepPheuyTCPpOcDnqilBEaGA=;
 b=KBUunt2uVpwGC3+2E6Q+iomm28vCmnLpdcvBh+7Nm85UaHFGfY34r5ydJ88xGcLCVk
 pP5sU1Qtw/9VjphdwyXoHDHRyzjDoozmRPAelwipRpKGMpfK3OKK/SMRaecP7PwfuZI/
 55gK7QaScl8+0q8cfiGGtmCA8b7K3/ZiPzrDzPZRqk9QLlmyYZfUFplFxl0qYVoQ6IWl
 o9OeuN498DS/jNIVW7HbZDCh6yp+MbfaYGhQmPul89P3NjQvXu6WQCif5D7X1sHlFlh2
 dAIknysJtenibhJYoQSSrWCeJlHgvnN42FutPWc7S1QoLkfSnqBfJlSLiaKJfs2ggZgI
 RnGQ==
X-Gm-Message-State: APjAAAWB+NrsF+d7L1aUM4EfGS8BY353lOesTh5HGCD4mNyzm9KiIED0
 qQZJge9AS+SRiEqXI3znwEGZywjprmXedggTTP9M4g==
X-Google-Smtp-Source: APXvYqyz4p9Xdnw6TsnqaTKQuROcf1yapEIpffd92Zc74q3zdKBTSX6GYQ83+MXfBxn8yYbSIwEOmWj5YD8izYaIvlI=
X-Received: by 2002:a65:5b02:: with SMTP id y2mr12177529pgq.365.1571426935785; 
 Fri, 18 Oct 2019 12:28:55 -0700 (PDT)
MIME-Version: 1.0
References: <CACjxMEt-zOt8VktL_Ut-9vA0FdeO5jPf0XVeCzuT2OOnyehMmA@mail.gmail.com>
 <mhng-20e0918b-b63e-4054-bae9-b94145e22cbe@palmer-si-x1c4>
In-Reply-To: <mhng-20e0918b-b63e-4054-bae9-b94145e22cbe@palmer-si-x1c4>
From: Dayeol Lee <dayeol@berkeley.edu>
Date: Fri, 18 Oct 2019 15:28:43 -0400
Message-ID: <CACjxMEsN-7x0O_j0BYj1LYt_YD9nGdg4snhZM0He=L4Ogiq+iA@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: PMP violation due to wrong size parameter
To: Palmer Dabbelt <palmer@sifive.com>
Cc: Jonathan Behrens <fintelia@gmail.com>, Qemu Devel <qemu-devel@nongnu.org>,
 qemu-riscv@nongnu.org, 
 sagark@eecs.berkeley.edu, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 richard.henderson@linaro.org, Alistair Francis <Alistair.Francis@wdc.com>,
 diodesign@tuta.io
Content-Type: multipart/alternative; boundary="0000000000004c6ef805953458ee"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::442
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
X-List-Received-Date: Fri, 18 Oct 2019 19:29:02 -0000

--0000000000004c6ef805953458ee
Content-Type: text/plain; charset="UTF-8"

I'll move the entire check into pmp_hart_has_privs as it makes more sense.

Thanks!

On Fri, Oct 18, 2019, 3:01 PM Palmer Dabbelt <palmer@sifive.com> wrote:

> On Tue, 15 Oct 2019 10:04:32 PDT (-0700), dayeol@berkeley.edu wrote:
> > Hi,
> >
> > Could this patch go through?
> > If not please let me know so that I can fix.
> > Thank you!
>
> Sorry, I dropped this one.  It's in the patch queue now.  We should also
> check
> for size==0 in pmp_hart_has_privs(), as that won't work.  LMK if you want
> to
> send a patch for that.
>
> >
> > Dayeol
> >
> >
> > On Sat, Oct 12, 2019, 11:30 AM Dayeol Lee <dayeol@berkeley.edu> wrote:
> >
> >> No it doesn't mean that.
> >> But the following code will make the size TARGET_PAGE_SIZE - (page
> offset)
> >> if the address is not aligned.
> >>
> >> pmp_size = -(address | TARGET_PAGE_MASK)
> >>
> >>
> >> On Fri, Oct 11, 2019, 7:37 PM Jonathan Behrens <fintelia@gmail.com>
> wrote:
> >>
> >>> How do you know that the access won't straddle a page boundary? Is
> there
> >>> a guarantee somewhere that size=0 means that the access is naturally
> >>> aligned?
> >>>
> >>> Jonathan
> >>>
> >>>
> >>> On Fri, Oct 11, 2019 at 7:14 PM Dayeol Lee <dayeol@berkeley.edu>
> wrote:
> >>>
> >>>> riscv_cpu_tlb_fill() uses the `size` parameter to check PMP violation
> >>>> using pmp_hart_has_privs().
> >>>> However, if the size is unknown (=0), the ending address will be
> >>>> `addr - 1` as it is `addr + size - 1` in `pmp_hart_has_privs()`.
> >>>> This always causes a false PMP violation on the starting address of
> the
> >>>> range, as `addr - 1` is not in the range.
> >>>>
> >>>> In order to fix, we just assume that all bytes from addr to the end of
> >>>> the page will be accessed if the size is unknown.
> >>>>
> >>>> Signed-off-by: Dayeol Lee <dayeol@berkeley.edu>
> >>>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> >>>> ---
> >>>>  target/riscv/cpu_helper.c | 13 ++++++++++++-
> >>>>  1 file changed, 12 insertions(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> >>>> index e32b6126af..7d9a22b601 100644
> >>>> --- a/target/riscv/cpu_helper.c
> >>>> +++ b/target/riscv/cpu_helper.c
> >>>> @@ -441,6 +441,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr
> address,
> >>>> int size,
> >>>>      CPURISCVState *env = &cpu->env;
> >>>>      hwaddr pa = 0;
> >>>>      int prot;
> >>>> +    int pmp_size = 0;
> >>>>      bool pmp_violation = false;
> >>>>      int ret = TRANSLATE_FAIL;
> >>>>      int mode = mmu_idx;
> >>>> @@ -460,9 +461,19 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr
> >>>> address, int size,
> >>>>                    "%s address=%" VADDR_PRIx " ret %d physical "
> >>>> TARGET_FMT_plx
> >>>>                    " prot %d\n", __func__, address, ret, pa, prot);
> >>>>
> >>>> +    /*
> >>>> +     * if size is unknown (0), assume that all bytes
> >>>> +     * from addr to the end of the page will be accessed.
> >>>> +     */
> >>>> +    if (size == 0) {
> >>>> +        pmp_size = -(address | TARGET_PAGE_MASK);
> >>>> +    } else {
> >>>> +        pmp_size = size;
> >>>> +    }
> >>>> +
> >>>>      if (riscv_feature(env, RISCV_FEATURE_PMP) &&
> >>>>          (ret == TRANSLATE_SUCCESS) &&
> >>>> -        !pmp_hart_has_privs(env, pa, size, 1 << access_type, mode)) {
> >>>> +        !pmp_hart_has_privs(env, pa, pmp_size, 1 << access_type,
> mode))
> >>>> {
> >>>>          ret = TRANSLATE_PMP_FAIL;
> >>>>      }
> >>>>      if (ret == TRANSLATE_PMP_FAIL) {
> >>>> --
> >>>> 2.20.1
> >>>>
> >>>>
> >>>>
>

--0000000000004c6ef805953458ee
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I&#39;ll move the entire check into pmp_hart_has_privs as=
 it makes more=C2=A0sense.<div dir=3D"auto"><br></div><div dir=3D"auto">Tha=
nks!</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gm=
ail_attr">On Fri, Oct 18, 2019, 3:01 PM Palmer Dabbelt &lt;<a href=3D"mailt=
o:palmer@sifive.com">palmer@sifive.com</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex">On Tue, 15 Oct 2019 10:04:32 PDT (-0700), <a href=3D"mai=
lto:dayeol@berkeley.edu" target=3D"_blank" rel=3D"noreferrer">dayeol@berkel=
ey.edu</a> wrote:<br>
&gt; Hi,<br>
&gt;<br>
&gt; Could this patch go through?<br>
&gt; If not please let me know so that I can fix.<br>
&gt; Thank you!<br>
<br>
Sorry, I dropped this one.=C2=A0 It&#39;s in the patch queue now.=C2=A0 We =
should also check <br>
for size=3D=3D0 in pmp_hart_has_privs(), as that won&#39;t work.=C2=A0 LMK =
if you want to <br>
send a patch for that.<br>
<br>
&gt;<br>
&gt; Dayeol<br>
&gt;<br>
&gt;<br>
&gt; On Sat, Oct 12, 2019, 11:30 AM Dayeol Lee &lt;<a href=3D"mailto:dayeol=
@berkeley.edu" target=3D"_blank" rel=3D"noreferrer">dayeol@berkeley.edu</a>=
&gt; wrote:<br>
&gt;<br>
&gt;&gt; No it doesn&#39;t mean that.<br>
&gt;&gt; But the following code will make the size TARGET_PAGE_SIZE - (page=
 offset)<br>
&gt;&gt; if the address is not aligned.<br>
&gt;&gt;<br>
&gt;&gt; pmp_size =3D -(address | TARGET_PAGE_MASK)<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; On Fri, Oct 11, 2019, 7:37 PM Jonathan Behrens &lt;<a href=3D"mail=
to:fintelia@gmail.com" target=3D"_blank" rel=3D"noreferrer">fintelia@gmail.=
com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt;&gt; How do you know that the access won&#39;t straddle a page boun=
dary? Is there<br>
&gt;&gt;&gt; a guarantee somewhere that size=3D0 means that the access is n=
aturally<br>
&gt;&gt;&gt; aligned?<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Jonathan<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On Fri, Oct 11, 2019 at 7:14 PM Dayeol Lee &lt;<a href=3D"mail=
to:dayeol@berkeley.edu" target=3D"_blank" rel=3D"noreferrer">dayeol@berkele=
y.edu</a>&gt; wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; riscv_cpu_tlb_fill() uses the `size` parameter to check PM=
P violation<br>
&gt;&gt;&gt;&gt; using pmp_hart_has_privs().<br>
&gt;&gt;&gt;&gt; However, if the size is unknown (=3D0), the ending address=
 will be<br>
&gt;&gt;&gt;&gt; `addr - 1` as it is `addr + size - 1` in `pmp_hart_has_pri=
vs()`.<br>
&gt;&gt;&gt;&gt; This always causes a false PMP violation on the starting a=
ddress of the<br>
&gt;&gt;&gt;&gt; range, as `addr - 1` is not in the range.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; In order to fix, we just assume that all bytes from addr t=
o the end of<br>
&gt;&gt;&gt;&gt; the page will be accessed if the size is unknown.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Signed-off-by: Dayeol Lee &lt;<a href=3D"mailto:dayeol@ber=
keley.edu" target=3D"_blank" rel=3D"noreferrer">dayeol@berkeley.edu</a>&gt;=
<br>
&gt;&gt;&gt;&gt; Reviewed-by: Richard Henderson &lt;<a href=3D"mailto:richa=
rd.henderson@linaro.org" target=3D"_blank" rel=3D"noreferrer">richard.hende=
rson@linaro.org</a>&gt;<br>
&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt;=C2=A0 target/riscv/cpu_helper.c | 13 ++++++++++++-<br>
&gt;&gt;&gt;&gt;=C2=A0 1 file changed, 12 insertions(+), 1 deletion(-)<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_=
helper.c<br>
&gt;&gt;&gt;&gt; index e32b6126af..7d9a22b601 100644<br>
&gt;&gt;&gt;&gt; --- a/target/riscv/cpu_helper.c<br>
&gt;&gt;&gt;&gt; +++ b/target/riscv/cpu_helper.c<br>
&gt;&gt;&gt;&gt; @@ -441,6 +441,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, =
vaddr address,<br>
&gt;&gt;&gt;&gt; int size,<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 CPURISCVState *env =3D &amp;cpu-&gt;en=
v;<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 hwaddr pa =3D 0;<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 int prot;<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 int pmp_size =3D 0;<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 bool pmp_violation =3D false;<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 int ret =3D TRANSLATE_FAIL;<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 int mode =3D mmu_idx;<br>
&gt;&gt;&gt;&gt; @@ -460,9 +461,19 @@ bool riscv_cpu_tlb_fill(CPUState *cs,=
 vaddr<br>
&gt;&gt;&gt;&gt; address, int size,<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;%s address=3D%&quot; VADDR_PRIx &quot; ret %d physical &qu=
ot;<br>
&gt;&gt;&gt;&gt; TARGET_FMT_plx<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot; prot %d\n&quot;, __func__, address, ret, pa, prot);<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 /*<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0* if size is unknown (0), assume that=
 all bytes<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0* from addr to the end of the page wi=
ll be accessed.<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 if (size =3D=3D 0) {<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pmp_size =3D -(address | TARG=
ET_PAGE_MASK);<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 } else {<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pmp_size =3D size;<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 if (riscv_feature(env, RISCV_FEATURE_P=
MP) &amp;&amp;<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (ret =3D=3D TRANSLATE_SU=
CCESS) &amp;&amp;<br>
&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 !pmp_hart_has_privs(env, pa, =
size, 1 &lt;&lt; access_type, mode)) {<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 !pmp_hart_has_privs(env, pa, =
pmp_size, 1 &lt;&lt; access_type, mode))<br>
&gt;&gt;&gt;&gt; {<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D TRANSLATE_PMP_FA=
IL;<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 if (ret =3D=3D TRANSLATE_PMP_FAIL) {<b=
r>
&gt;&gt;&gt;&gt; --<br>
&gt;&gt;&gt;&gt; 2.20.1<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
</blockquote></div>

--0000000000004c6ef805953458ee--

