Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k6yxO-00011H-3K
	for mharc-qemu-riscv@gnu.org; Sat, 15 Aug 2020 12:22:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k6yxM-00010x-Eu
 for qemu-riscv@nongnu.org; Sat, 15 Aug 2020 12:22:56 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:33464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k6yxK-0004Mx-QU
 for qemu-riscv@nongnu.org; Sat, 15 Aug 2020 12:22:56 -0400
Received: by mail-ot1-x344.google.com with SMTP id t7so10085396otp.0
 for <qemu-riscv@nongnu.org>; Sat, 15 Aug 2020 09:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7RMLVHoSe4RfTgt2yr7dUICRnUSgknP3fT/3lLIZJm4=;
 b=jL10nvl+FJFSXy1/WYR+Wy8tKZOfTWqQq2aEZ8uDYQNBiIB8B3CGGTGjidiIyAMass
 fEUIqA/27goxWxiRbdWDAL8euOyYNVZD8wi8UZgbhxsfav+ayduyFMNiOCuWyevvfgSa
 +Oq4ecxGarw1Ab+nrkV7/HbHXoaeQ2gXHFAKKk9xkR5Mfv2LlDBEOztHnI7ENMyq/N3a
 Y9RBoK0os8Y6Dp4q98La0IUwMbq3RMrz5Yqnu94VGMkand2Hjup/ftNVPr12BsTagyh5
 9sbcbr7ArjtS14XiE5aerJaj5ojODZ3/L07aDd0uuC72EBV/0FWQzceIAKbqtoOHZ9pR
 6OIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7RMLVHoSe4RfTgt2yr7dUICRnUSgknP3fT/3lLIZJm4=;
 b=NnBgp239fo0rm8q99noBbpXwS+jAza+/e2mXnsJsaLhkU0E5++sN478gVp17RoqNPA
 s9TZfSDxHu12peLc5z9waqk625a1NIniNPlS3lDsTdcSj7aJ79XGq4HOlGks5tOMpyZw
 T1YfxV/XNEBwcJWqsHG5kHWqzptyzoPlyzgk5/nbp/VIOmDx1YRmi5ufw4wBrQf4X/tl
 IEFXp2FvzTsVAqMzJC9muiBQXa9V6OAc6GusF3FskAnOC5uq/+wyukAB7zDS0iCRL74S
 oRGjA3BZ6tqREmob4vbeq61cPYE7O7ACvVPqgiUfJhSq/qsrpSQbQ6wSNopYWlrRN+us
 3QOg==
X-Gm-Message-State: AOAM5331S7jBMYWlGzaBRKLfFO+lNAwiQCcVe2JMA335H8ef9QauGfVM
 EUooKVP6lumIzFBMPMNmPw2GABGcCLg1ZA8WeVHR3gkfqLZxug==
X-Google-Smtp-Source: ABdhPJwFq1YG2ZrYuuPq4toItMcvIhzqOCt/pRNjBoX6XhtUzmaiSKAAQgFq8/bZE+FBt812jJQQAk8o7SXSYUSC18I=
X-Received: by 2002:a9d:3443:: with SMTP id v61mr4159868otb.139.1597459935137; 
 Fri, 14 Aug 2020 19:52:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200806104709.13235-1-frank.chang@sifive.com>
 <20200806104709.13235-27-frank.chang@sifive.com>
 <90f01984-54a4-2a56-c52f-d1f4332b39d4@linaro.org>
 <CAE_xrPiJRRV3FYtfve6LMOF6LNEYGfhmi9CiabxqUBEew9igLg@mail.gmail.com>
 <5706a1ca-1dd9-22cd-08ce-c70780111bfc@linaro.org>
In-Reply-To: <5706a1ca-1dd9-22cd-08ce-c70780111bfc@linaro.org>
From: Frank Chang <frank.chang@sifive.com>
Date: Sat, 15 Aug 2020 10:52:04 +0800
Message-ID: <CAE_xrPgSbzzJqHYTeSND4wQDJUMoMYPmmcH97VE6hRcxh2S54A@mail.gmail.com>
Subject: Re: [RFC v3 26/71] target/riscv: rvv-1.0: update vext_max_elems() for
 load/store insns
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Content-Type: multipart/alternative; boundary="000000000000fa2cc205ace19fc8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=frank.chang@sifive.com; helo=mail-ot1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Sat, 15 Aug 2020 16:22:56 -0000

--000000000000fa2cc205ace19fc8
Content-Type: text/plain; charset="UTF-8"

On Sat, Aug 15, 2020 at 2:36 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 8/13/20 7:48 PM, Frank Chang wrote:
> > esz is passed from e.g. GEN_VEXT_LD_STRIDE() macro:
> >
> >> #define GEN_VEXT_LD_STRIDE(NAME, ETYPE, LOAD_FN)        \
> >> void HELPER(NAME)(void *vd, void * v0, target_ulong base,  \
> >>                   target_ulong stride, CPURISCVState *env, \
> >>                   uint32_t desc)                           \
> >> {                                                          \
> >>     uint32_t vm = vext_vm(desc);                           \
> >>     vext_ldst_stride(vd, v0, base, stride, env, desc, vm, LOAD_FN, \
> >>                      sizeof(ETYPE), GETPC(), MMU_DATA_LOAD);       \
> >> }
> >>
> >> GEN_VEXT_LD_STRIDE(vlse8_v,  int8_t,  lde_b)
> >
> > which is calculated by sizeof(ETYPE), so the results would be: 1, 2, 4,
> 8.
> > and vext_max_elems() is called by e.g. vext_ldst_stride():
>
> Ah, yes.
>
> >> uint32_t max_elems = vext_max_elems(desc, esz);
> >
> > I can add another parameter to the macro and pass the hard-coded
> log2(esz) number
> > if it's the better way instead of using ctzl().
> > Or if there's another approach to get the log2(esz) number more
> elegantly?
>
> Using ctzl(sizeof(type)) in the GEN_VEXT_LD_STRIDE macro will work well.
> This
> will be constant folded by the compiler.
>
>
> r~
>

Checked the codes again,
GEN_VEXT_LD_STRIDE() will eventually call vext_ldst_stride() and pass esz
as the parameter.
However, esz is not only used in vext_max_elems() but also used for other
calculation, e.g.:

    probe_pages(env, base + stride * i, nf * esz, ra, access_type);
and
    target_ulong addr = base + stride * i + k * esz;

If we pass ctzl(sizeof(type)) in GEN_VEXT_LD_STRIDE(),
I would still have to do: (1 << esz) to get the correct element size in the
above calculations.
Would it eliminate the performance gain we have in vext_max_elems() instead?

Frank Chang

--000000000000fa2cc205ace19fc8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sat, Aug 15, 2020 at 2:36 AM Richard H=
enderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.hender=
son@linaro.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">On 8/13/20 7:48 PM, Frank Chang wr=
ote:<br>
&gt; esz is passed from e.g.=C2=A0GEN_VEXT_LD_STRIDE() macro:<br>
&gt; <br>
&gt;&gt; #define GEN_VEXT_LD_STRIDE(NAME, ETYPE, LOAD_FN)=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 \<br>
&gt;&gt; void HELPER(NAME)(void *vd, void * v0, target_ulong base,=C2=A0 \<=
br>
&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tar=
get_ulong stride, CPURISCVState *env, \<br>
&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uin=
t32_t desc)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; {=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt; =C2=A0 =C2=A0 uint32_t vm =3D vext_vm(desc);=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0\<br>
&gt;&gt; =C2=A0 =C2=A0 vext_ldst_stride(vd, v0, base, stride, env, desc, vm=
, LOAD_FN, \<br>
&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0sizeof(ETYPE), GETPC(), MMU_DATA_LOAD); =C2=A0 =C2=A0 =C2=A0 \<br=
>
&gt;&gt; }<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0GEN_VEXT_LD_STRIDE(vlse8_v, =C2=A0int8_t, =C2=A0lde_b)<br>
&gt; <br>
&gt; which is calculated by sizeof(ETYPE), so the results would be: 1, 2, 4=
, 8.<br>
&gt; and vext_max_elems() is called by e.g. vext_ldst_stride():<br>
<br>
Ah, yes.<br>
<br>
&gt;&gt; uint32_t max_elems =3D vext_max_elems(desc, esz);<br>
&gt; <br>
&gt; I can add another parameter to the macro and pass the hard-coded log2(=
esz) number<br>
&gt; if it&#39;s the better way instead of using=C2=A0ctzl().<br>
&gt; Or if there&#39;s another approach to get the log2(esz) number more el=
egantly?<br>
<br>
Using ctzl(sizeof(type)) in the GEN_VEXT_LD_STRIDE macro will work well.=C2=
=A0 This<br>
will be constant folded by the compiler.<br>
<br>
<br>
r~<br></blockquote><div><br></div><div>Checked the codes again,</div><div>G=
EN_VEXT_LD_STRIDE() will eventually call=C2=A0vext_ldst_stride() and pass e=
sz as the parameter.</div><div>However, esz is not only used in=C2=A0vext_m=
ax_elems() but also used for other calculation, e.g.:</div><div><br></div><=
div>=C2=A0 =C2=A0 probe_pages(env, base + stride * i, nf * esz, ra, access_=
type);<br></div><div>and</div><div>=C2=A0 =C2=A0 target_ulong addr =3D base=
 + stride * i + k * esz;</div><div><br></div><div>If we pass ctzl(sizeof(ty=
pe)) in=C2=A0GEN_VEXT_LD_STRIDE(),</div><div>I would still have to do: (1 &=
lt;&lt; esz) to get the correct element size in the above calculations.</di=
v><div>Would it eliminate the performance gain we have in=C2=A0vext_max_ele=
ms() instead?</div><div><br></div><div>Frank Chang</div></div></div>

--000000000000fa2cc205ace19fc8--

