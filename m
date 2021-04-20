Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lYf1x-0008Qm-Av
	for mharc-qemu-riscv@gnu.org; Mon, 19 Apr 2021 21:18:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lYf1w-0008Q3-7K
 for qemu-riscv@nongnu.org; Mon, 19 Apr 2021 21:18:20 -0400
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35]:41650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lYf1p-0000Mw-Gr
 for qemu-riscv@nongnu.org; Mon, 19 Apr 2021 21:18:18 -0400
Received: by mail-oo1-xc35.google.com with SMTP id
 d16-20020a4a3c100000b02901f0590a614eso345755ooa.8
 for <qemu-riscv@nongnu.org>; Mon, 19 Apr 2021 18:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=La//RfGONs+3JM2I8X+3GiKclBW0ANPQpSJqOXhZrnM=;
 b=RRGrvdxv7qZcTO34CfYRr3wV0xkNgkr778j5i3ZQ2XTYpE0Hva34lYnL1aFFJOvZzc
 QYpvMQ2KICeh6N2iCUqeoAfl30WbRnoDdvamM5NMjiQ1XDOgt1sjV9VP2RHmtNFtwDdJ
 NKX69wT5axwmLhV394Eh0wFtILCSqwtg9at9slKCejg406Ygqtax4ZZvpUVnLO1Vh96C
 VasQoFRFjphR8Q6C2vqzyrSQ+nrrJQVhh3fMMYQbUvuYLj5R3f89VhVsQLb4/G6cpL8T
 PVQE5nhGjBKJvuqQJaTS5cawpqLbOJ+SaZ5vEtPLmVgmCQIxOTH53TyFp0T3WgD5inyB
 pmlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=La//RfGONs+3JM2I8X+3GiKclBW0ANPQpSJqOXhZrnM=;
 b=apW3RDd3j6wkOcNHfItwRowmXeir2B2fSrtFtkhZOKYIQkUgas8px3OCOLProk02SX
 9Ok/lzZ0AhK7mLCqka9EnozZIxh2mInRP8e+rHyIyBn8Jxeg7qZG8ZLlCMoPBc2u7jpk
 a32P+a80k5+DS6rnqR8G8IHidxGVqxVRQvCLxPkbtTZ8WHErpf38AkcvKSy2SH4PD1EI
 K1mzITFkTbl0iDsXPiwJpooLlrmhQynk9hmKxc8uoOZ2CRO9BQS73lL622g3CF2TN+qK
 s1j8qIAR278iItDiMOa2oYIpt+rg3DfkWvn3Q+z/MKP5tBkBuSFSUI6NJD+rLFb8LKNy
 bIlQ==
X-Gm-Message-State: AOAM532w+wfYGV85z5Xhh63OvmoE/rkftmiVKDMAbkQ1DybMKRwb2j5A
 qjmOBxOvxh7UJ+3Y2x5NGIISizMppuPkenCcCnBN+w==
X-Google-Smtp-Source: ABdhPJyx586kcz2CYe7Z8rMX0w8Snca2th2YWygOeWMv3F12QxVeIEwOy5W7FiOjFLZStP7qwR7Y91AU2vdqp+RiTjY=
X-Received: by 2002:a4a:d685:: with SMTP id i5mr15256719oot.32.1618881491011; 
 Mon, 19 Apr 2021 18:18:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210419055614.28361-1-frank.chang@sifive.com>
 <448d86ca-28b0-6523-d84b-4f9e867cf01b@linaro.org>
In-Reply-To: <448d86ca-28b0-6523-d84b-4f9e867cf01b@linaro.org>
From: Frank Chang <frank.chang@sifive.com>
Date: Tue, 20 Apr 2021 09:18:01 +0800
Message-ID: <CAE_xrPhW1eE_-yLXd3J4vovCKeq3xtHDXB1Dn5kQe3c5gSgjwA@mail.gmail.com>
Subject: Re: [PATCH] fpu/softfloat: set invalid excp flag for RISC-V muladd
 instructions
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Aurelien Jarno <aurelien@aurel32.net>
Content-Type: multipart/alternative; boundary="00000000000034a42b05c05d38e1"
Received-SPF: pass client-ip=2607:f8b0:4864:20::c35;
 envelope-from=frank.chang@sifive.com; helo=mail-oo1-xc35.google.com
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
X-List-Received-Date: Tue, 20 Apr 2021 01:18:20 -0000

--00000000000034a42b05c05d38e1
Content-Type: text/plain; charset="UTF-8"

On Mon, Apr 19, 2021 at 11:28 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 4/18/21 10:56 PM, frank.chang@sifive.com wrote:
> > +#elif defined(TARGET_RISCV)
> > +    /*
> > +     * For RISC-V, InvalidOp is set when multiplicands are Inf and zero
> > +     * and returns default NaN.
> > +     */
> > +    if (infzero) {
> > +        float_raise(float_flag_invalid, status);
> > +        return 3;
> > +    }
> > +
> > +    if (is_nan(a_cls)) {
> > +        return 0;
> > +    } else if (is_nan(b_cls)) {
> > +        return 1;
> > +    } else {
> > +        return 2;
> > +    }
>
> This second half of the function made me go look into the spec to make
> sure you
> had got that selection right.  But RISCV is always in default_nan mode, so
> all
> this is unused (and overridden in pick_nan_muladd).
>
> I think for avoidance of confusion, you should use
>
>      if (infzero) {
>          float_raise(float_flag_invalid, status);
>      }
>      return 3; /* default nan */
>
>
> r~
>

Sure, I'll update my patch and resend again.

Thanks
Frank Chang

--00000000000034a42b05c05d38e1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, Apr 19, 2021 at 11:28 PM Richard =
Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.hende=
rson@linaro.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">On 4/18/21 10:56 PM, <a href=3D"m=
ailto:frank.chang@sifive.com" target=3D"_blank">frank.chang@sifive.com</a> =
wrote:<br>
&gt; +#elif defined(TARGET_RISCV)<br>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* For RISC-V, InvalidOp is set when multiplicands=
 are Inf and zero<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* and returns default NaN.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 if (infzero) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 float_raise(float_flag_invalid, status);<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 3;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (is_nan(a_cls)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; +=C2=A0 =C2=A0 } else if (is_nan(b_cls)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 1;<br>
&gt; +=C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 2;<br>
&gt; +=C2=A0 =C2=A0 }<br>
<br>
This second half of the function made me go look into the spec to make sure=
 you <br>
had got that selection right.=C2=A0 But RISCV is always in default_nan mode=
, so all <br>
this is unused (and overridden in pick_nan_muladd).<br>
<br>
I think for avoidance of confusion, you should use<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (infzero) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0float_raise(float_flag_invalid, status);<=
br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0return 3; /* default nan */<br>
<br>
<br>
r~<br></blockquote><div><br></div><div>Sure, I&#39;ll update my patch and r=
esend again.</div><div><br></div><div>Thanks</div><div>Frank Chang</div></d=
iv></div>

--00000000000034a42b05c05d38e1--

