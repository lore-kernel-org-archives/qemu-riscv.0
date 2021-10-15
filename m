Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mbH4a-0003Tu-Oo
	for mharc-qemu-riscv@gnu.org; Fri, 15 Oct 2021 02:52:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbH4Y-0003Pl-K8
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 02:52:06 -0400
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131]:37719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbH4W-0004zE-2p
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 02:52:06 -0400
Received: by mail-il1-x131.google.com with SMTP id x1so6119127ilv.4
 for <qemu-riscv@nongnu.org>; Thu, 14 Oct 2021 23:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DZzD1e/boVb500fcL2/MmvFtxCksuoNQtn4/JzhJ+i4=;
 b=GHDVAMKhWG4fQM1JrumaMYuEtD2GwdIzZPMQj18I2shiEWyTBRcV+nf1qW/3vKQcJG
 MS5wVApEkq4f5ih5z2N5x3VjUFk3/t6VwS7r1XZziAnhwDW5tqQ0CYUV/+84VGSwihXx
 d7qIy5iYqGsmRwm1MBEunWarRUZFqckQZrp3wLKG7g0LcWLP13L6mQ8tV3dxYmygXh5q
 UVbbGft5ffGbAD103wMvQ6cj7OZMtaf+MnB8BbcWA41sy+4lCsnmC2JWPfpEOsP4ektE
 73hIQQTNo1RUomvccYrCCmoLTN2Oj9aZbMO8aceBl4++gFTbfSG04s65F3aTSeqECqT4
 TSLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DZzD1e/boVb500fcL2/MmvFtxCksuoNQtn4/JzhJ+i4=;
 b=6Te6F1GHLz488Zqic9XzRCOv2shX+/bDJkcVygoJn/mjfByMhS73ZlGylrmRXTJOgu
 p7qPLmzQiXhisQwVeF2G52XjyTh9fvCYYC8VBEPvvQOwUV1B/lA0lkjqdkYsG3dXTarE
 ATv0S4bNwpoOG+pHLDA+IeYW9fqqu+a2LkiUTqTlgfLrBwuLY+l2dJnuPPHR9dlVxLkj
 AAOkcF0nPAYQi4lHerHAAMs+NwzJAS2o5++IB8oMZzsK8SvqPaQsvqKKDJUMNqAWcFte
 i5EI+cN3u2CBq5rIUuJ7uWSEZmRvDpimiAIBXkYGyhM2hnpxeSGUEOrPl1eKHqG9UvhX
 stVg==
X-Gm-Message-State: AOAM531tjXoHnRLlRePJtAGFRWOYhBw5/WYkNvS8t65ebYlc1Bj7rIcR
 JzkbUR58ar74sY6xRM1AqTZJ6A+YfcjvdegfrBLVhQ==
X-Google-Smtp-Source: ABdhPJzNCzkOrWJPE2WY5Xs0lUYdruu6GYCHoz9HuKU+03X1k+LTSI/Y+zkOL6/KIgffXCPbOoWUlY48MtMkPP5tGG8=
X-Received: by 2002:a05:6e02:893:: with SMTP id
 z19mr2553656ils.224.1634280722681; 
 Thu, 14 Oct 2021 23:52:02 -0700 (PDT)
MIME-Version: 1.0
References: <20211015061138.3766862-1-frank.chang@sifive.com>
In-Reply-To: <20211015061138.3766862-1-frank.chang@sifive.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Fri, 15 Oct 2021 14:51:51 +0800
Message-ID: <CAE_xrPgExT7fEuK20788_gkfxv_tXa0o30baYS6EDn+P58t97Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] softfloat: add APIs to handle alternative sNaN
 propagation for fmax/fmin
To: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Cc: Chih-Min Chao <chihmin.chao@sifive.com>,
 Aurelien Jarno <aurelien@aurel32.net>, 
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000f0655205ce5ea189"
Received-SPF: pass client-ip=2607:f8b0:4864:20::131;
 envelope-from=frank.chang@sifive.com; helo=mail-il1-x131.google.com
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
X-List-Received-Date: Fri, 15 Oct 2021 06:52:06 -0000

--000000000000f0655205ce5ea189
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 15, 2021 at 2:11 PM <frank.chang@sifive.com> wrote:

> From: Chih-Min Chao <chihmin.chao@sifive.com>
>
> For "fmax/fmin ft0, ft1, ft2" and if one of the inputs is sNaN,
>
>   The original logic:
>     Return NaN and set invalid flag if ft1 == sNaN || ft2 == sNan.
>
>   The alternative path:
>     Set invalid flag if ft1 == sNaN || ft2 == sNaN.
>     Return NaN only if ft1 == NaN && ft2 == NaN.
>
> The IEEE 754 spec allows both implementation and some architecture such
> as riscv choose different defintions in two spec versions.
> (riscv-spec-v2.2 use original version, riscv-spec-20191213 changes to
>  alternative)
>
> Signed-off-by: Chih-Min Chao <chihmin.chao@sifive.com>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  fpu/softfloat-parts.c.inc | 19 +++++++++++++++++++
>  fpu/softfloat.c           | 18 +++++++++++++-----
>  include/fpu/softfloat.h   | 10 ++++++++++
>  3 files changed, 42 insertions(+), 5 deletions(-)
>
> diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
> index dddee92d6ee..a8d74624f5a 100644
> --- a/fpu/softfloat-parts.c.inc
> +++ b/fpu/softfloat-parts.c.inc
> @@ -1227,6 +1227,25 @@ static FloatPartsN *partsN(minmax)(FloatPartsN *a,
> FloatPartsN *b,
>              && (ab_mask & ~float_cmask_qnan)) {
>              return is_nan(a->cls) ? b : a;
>          }
> +
> +        /*
> +         * In IEEE 754-2019, minNum, maxNum, minNumMag and maxNumMag
> +         * are removed and replaced with minimum, minimumNumber, maximum
> +         * and maximumNumber.
> +         * minimumNumber/maximumNumber behavior for SNaN is changed to:
> +         *   If both operands are NaNs, a QNaN is returned.
> +         *   If either operand is a SNaN,
> +         *   an invalid operation exception is signaled,
> +         *   but unless both operands are NaNs,
> +         *   the SNaN is otherwise ignored and not converted to a QNaN.
> +         */
> +        if (!(~flags & (minmax_isnum | minmax_snan_noprop))
> +            && (ab_mask & float_cmask_snan)
> +            && (ab_mask & ~float_cmask_anynan)) {
> +            float_raise(float_flag_invalid, s);
> +            return is_nan(a->cls) ? b : a;
> +        }
> +
>          return parts_pick_nan(a, b, s);
>      }
>
> diff --git a/fpu/softfloat.c b/fpu/softfloat.c
> index 6e769f990c2..eee65e9934c 100644
> --- a/fpu/softfloat.c
> +++ b/fpu/softfloat.c
> @@ -436,6 +436,11 @@ enum {
>      minmax_isnum = 2,
>      /* Set for the IEEE 754-2008 minNumMag() and minNumMag() operations.
> */
>      minmax_ismag = 4,
> +    /*
> +     * Set for the IEEE 754-2019 minimumNumber() maximumNumber()
> operations,
> +     * without sNaN propagation.
> +     */
> +    minmax_snan_noprop = 8,
>  };
>
>  /* Simple helpers for checking if, or what kind of, NaN we have */
> @@ -3927,11 +3932,14 @@ static float128 float128_minmax(float128 a,
> float128 b,
>      { return type##_minmax(a, b, s, flags); }
>
>  #define MINMAX_2(type) \
> -    MINMAX_1(type, max, 0)                                      \
> -    MINMAX_1(type, maxnum, minmax_isnum)                        \
> -    MINMAX_1(type, maxnummag, minmax_isnum | minmax_ismag)      \
> -    MINMAX_1(type, min, minmax_ismin)                           \
> -    MINMAX_1(type, minnum, minmax_ismin | minmax_isnum)         \
> +    MINMAX_1(type, max, 0)                                           \
> +    MINMAX_1(type, maxnum, minmax_isnum)                             \
> +    MINMAX_1(type, maxnum_noprop, minmax_isnum | minmax_snan_noprop) \
> +    MINMAX_1(type, maxnummag, minmax_isnum | minmax_ismag)           \
> +    MINMAX_1(type, min, minmax_ismin)                                \
> +    MINMAX_1(type, minnum, minmax_ismin | minmax_isnum)              \
> +    MINMAX_1(type, minnum_noprop, minmax_ismin | minmax_isnum |      \
> +                                  minmax_snan_noprop)                \
>      MINMAX_1(type, minnummag, minmax_ismin | minmax_isnum | minmax_ismag)
>
>  MINMAX_2(float16)
> diff --git a/include/fpu/softfloat.h b/include/fpu/softfloat.h
> index ec7dca09606..b77917ea661 100644
> --- a/include/fpu/softfloat.h
> +++ b/include/fpu/softfloat.h
> @@ -241,6 +241,8 @@ float16 float16_min(float16, float16, float_status
> *status);
>  float16 float16_max(float16, float16, float_status *status);
>  float16 float16_minnum(float16, float16, float_status *status);
>  float16 float16_maxnum(float16, float16, float_status *status);
> +float16 float16_minnum_noprop(float16, float16, float_status *status);
> +float16 float16_maxnum_noprop(float16, float16, float_status *status);
>  float16 float16_minnummag(float16, float16, float_status *status);
>  float16 float16_maxnummag(float16, float16, float_status *status);
>  float16 float16_sqrt(float16, float_status *status);
> @@ -420,6 +422,8 @@ bfloat16 bfloat16_min(bfloat16, bfloat16, float_status
> *status);
>  bfloat16 bfloat16_max(bfloat16, bfloat16, float_status *status);
>  bfloat16 bfloat16_minnum(bfloat16, bfloat16, float_status *status);
>  bfloat16 bfloat16_maxnum(bfloat16, bfloat16, float_status *status);
> +bfloat16 bfloat16_minnum_noprop(bfloat16, bfloat16, float_status *status);
> +bfloat16 bfloat16_maxnum_noprop(bfloat16, bfloat16, float_status *status);
>  bfloat16 bfloat16_minnummag(bfloat16, bfloat16, float_status *status);
>  bfloat16 bfloat16_maxnummag(bfloat16, bfloat16, float_status *status);
>  bfloat16 bfloat16_sqrt(bfloat16, float_status *status);
> @@ -587,6 +591,8 @@ float32 float32_min(float32, float32, float_status
> *status);
>  float32 float32_max(float32, float32, float_status *status);
>  float32 float32_minnum(float32, float32, float_status *status);
>  float32 float32_maxnum(float32, float32, float_status *status);
> +float32 float32_minnum_noprop(float32, float32, float_status *status);
> +float32 float32_maxnum_noprop(float32, float32, float_status *status);
>  float32 float32_minnummag(float32, float32, float_status *status);
>  float32 float32_maxnummag(float32, float32, float_status *status);
>  bool float32_is_quiet_nan(float32, float_status *status);
> @@ -776,6 +782,8 @@ float64 float64_min(float64, float64, float_status
> *status);
>  float64 float64_max(float64, float64, float_status *status);
>  float64 float64_minnum(float64, float64, float_status *status);
>  float64 float64_maxnum(float64, float64, float_status *status);
> +float64 float64_minnum_noprop(float64, float64, float_status *status);
> +float64 float64_maxnum_noprop(float64, float64, float_status *status);
>  float64 float64_minnummag(float64, float64, float_status *status);
>  float64 float64_maxnummag(float64, float64, float_status *status);
>  bool float64_is_quiet_nan(float64 a, float_status *status);
> @@ -1208,6 +1216,8 @@ float128 float128_min(float128, float128,
> float_status *status);
>  float128 float128_max(float128, float128, float_status *status);
>  float128 float128_minnum(float128, float128, float_status *status);
>  float128 float128_maxnum(float128, float128, float_status *status);
> +float128 float128_minnum_noprop(float128, float128, float_status *status);
> +float128 float128_maxnum_noprop(float128, float128, float_status *status);
>  float128 float128_minnummag(float128, float128, float_status *status);
>  float128 float128_maxnummag(float128, float128, float_status *status);
>  bool float128_is_quiet_nan(float128, float_status *status);
> --
> 2.25.1
>
>
I should add the cover letter for this series of patchset, will resend it.
Sorry for the confusion.

Regards,
Frank Chang

--000000000000f0655205ce5ea189
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, Oct 15, 2021 at 2:11 PM &lt;<a hr=
ef=3D"mailto:frank.chang@sifive.com">frank.chang@sifive.com</a>&gt; wrote:<=
br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">From: Chih-Min Chao &lt;<a href=3D"mailto:chihmin.chao@sifive.co=
m" target=3D"_blank">chihmin.chao@sifive.com</a>&gt;<br>
<br>
For &quot;fmax/fmin ft0, ft1, ft2&quot; and if one of the inputs is sNaN,<b=
r>
<br>
=C2=A0 The original logic:<br>
=C2=A0 =C2=A0 Return NaN and set invalid flag if ft1 =3D=3D sNaN || ft2 =3D=
=3D sNan.<br>
<br>
=C2=A0 The alternative path:<br>
=C2=A0 =C2=A0 Set invalid flag if ft1 =3D=3D sNaN || ft2 =3D=3D sNaN.<br>
=C2=A0 =C2=A0 Return NaN only if ft1 =3D=3D NaN &amp;&amp; ft2 =3D=3D NaN.<=
br>
<br>
The IEEE 754 spec allows both implementation and some architecture such<br>
as riscv choose different defintions in two spec versions.<br>
(riscv-spec-v2.2 use original version, riscv-spec-20191213 changes to<br>
=C2=A0alternative)<br>
<br>
Signed-off-by: Chih-Min Chao &lt;<a href=3D"mailto:chihmin.chao@sifive.com"=
 target=3D"_blank">chihmin.chao@sifive.com</a>&gt;<br>
Signed-off-by: Frank Chang &lt;<a href=3D"mailto:frank.chang@sifive.com" ta=
rget=3D"_blank">frank.chang@sifive.com</a>&gt;<br>
---<br>
=C2=A0fpu/softfloat-parts.c.inc | 19 +++++++++++++++++++<br>
=C2=A0fpu/softfloat.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 18 ++++++++=
+++++-----<br>
=C2=A0include/fpu/softfloat.h=C2=A0 =C2=A0| 10 ++++++++++<br>
=C2=A03 files changed, 42 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc<br>
index dddee92d6ee..a8d74624f5a 100644<br>
--- a/fpu/softfloat-parts.c.inc<br>
+++ b/fpu/softfloat-parts.c.inc<br>
@@ -1227,6 +1227,25 @@ static FloatPartsN *partsN(minmax)(FloatPartsN *a, F=
loatPartsN *b,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; (ab_mask &amp; ~=
float_cmask_qnan)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return is_nan(a-&gt;cls) ? =
b : a;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* In IEEE 754-2019, minNum, maxNum, minN=
umMag and maxNumMag<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* are removed and replaced with minimum,=
 minimumNumber, maximum<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* and maximumNumber.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* minimumNumber/maximumNumber behavior f=
or SNaN is changed to:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0If both operands are NaNs,=
 a QNaN is returned.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0If either operand is a SNa=
N,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0an invalid operation excep=
tion is signaled,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0but unless both operands a=
re NaNs,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0the SNaN is otherwise igno=
red and not converted to a QNaN.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!(~flags &amp; (minmax_isnum | minmax_snan=
_noprop))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; (ab_mask &amp; float_=
cmask_snan)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; (ab_mask &amp; ~float=
_cmask_anynan)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 float_raise(float_flag_invalid, =
s);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return is_nan(a-&gt;cls) ? b : a=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return parts_pick_nan(a, b, s);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
diff --git a/fpu/softfloat.c b/fpu/softfloat.c<br>
index 6e769f990c2..eee65e9934c 100644<br>
--- a/fpu/softfloat.c<br>
+++ b/fpu/softfloat.c<br>
@@ -436,6 +436,11 @@ enum {<br>
=C2=A0 =C2=A0 =C2=A0minmax_isnum =3D 2,<br>
=C2=A0 =C2=A0 =C2=A0/* Set for the IEEE 754-2008 minNumMag() and minNumMag(=
) operations. */<br>
=C2=A0 =C2=A0 =C2=A0minmax_ismag =3D 4,<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* Set for the IEEE 754-2019 minimumNumber() maximumNum=
ber() operations,<br>
+=C2=A0 =C2=A0 =C2=A0* without sNaN propagation.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 minmax_snan_noprop =3D 8,<br>
=C2=A0};<br>
<br>
=C2=A0/* Simple helpers for checking if, or what kind of, NaN we have */<br=
>
@@ -3927,11 +3932,14 @@ static float128 float128_minmax(float128 a, float12=
8 b,<br>
=C2=A0 =C2=A0 =C2=A0{ return type##_minmax(a, b, s, flags); }<br>
<br>
=C2=A0#define MINMAX_2(type) \<br>
-=C2=A0 =C2=A0 MINMAX_1(type, max, 0)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 \<br>
-=C2=A0 =C2=A0 MINMAX_1(type, maxnum, minmax_isnum)=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
-=C2=A0 =C2=A0 MINMAX_1(type, maxnummag, minmax_isnum | minmax_ismag)=C2=A0=
 =C2=A0 =C2=A0 \<br>
-=C2=A0 =C2=A0 MINMAX_1(type, min, minmax_ismin)=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
-=C2=A0 =C2=A0 MINMAX_1(type, minnum, minmax_ismin | minmax_isnum)=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 MINMAX_1(type, max, 0)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 MINMAX_1(type, maxnum, minmax_isnum)=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0\<br>
+=C2=A0 =C2=A0 MINMAX_1(type, maxnum_noprop, minmax_isnum | minmax_snan_nop=
rop) \<br>
+=C2=A0 =C2=A0 MINMAX_1(type, maxnummag, minmax_isnum | minmax_ismag)=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 MINMAX_1(type, min, minmax_ismin)=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 MINMAX_1(type, minnum, minmax_ismin | minmax_isnum)=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 MINMAX_1(type, minnum_noprop, minmax_ismin | minmax_isnum |=
=C2=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 minmax_snan_noprop)=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
=C2=A0 =C2=A0 =C2=A0MINMAX_1(type, minnummag, minmax_ismin | minmax_isnum |=
 minmax_ismag)<br>
<br>
=C2=A0MINMAX_2(float16)<br>
diff --git a/include/fpu/softfloat.h b/include/fpu/softfloat.h<br>
index ec7dca09606..b77917ea661 100644<br>
--- a/include/fpu/softfloat.h<br>
+++ b/include/fpu/softfloat.h<br>
@@ -241,6 +241,8 @@ float16 float16_min(float16, float16, float_status *sta=
tus);<br>
=C2=A0float16 float16_max(float16, float16, float_status *status);<br>
=C2=A0float16 float16_minnum(float16, float16, float_status *status);<br>
=C2=A0float16 float16_maxnum(float16, float16, float_status *status);<br>
+float16 float16_minnum_noprop(float16, float16, float_status *status);<br>
+float16 float16_maxnum_noprop(float16, float16, float_status *status);<br>
=C2=A0float16 float16_minnummag(float16, float16, float_status *status);<br=
>
=C2=A0float16 float16_maxnummag(float16, float16, float_status *status);<br=
>
=C2=A0float16 float16_sqrt(float16, float_status *status);<br>
@@ -420,6 +422,8 @@ bfloat16 bfloat16_min(bfloat16, bfloat16, float_status =
*status);<br>
=C2=A0bfloat16 bfloat16_max(bfloat16, bfloat16, float_status *status);<br>
=C2=A0bfloat16 bfloat16_minnum(bfloat16, bfloat16, float_status *status);<b=
r>
=C2=A0bfloat16 bfloat16_maxnum(bfloat16, bfloat16, float_status *status);<b=
r>
+bfloat16 bfloat16_minnum_noprop(bfloat16, bfloat16, float_status *status);=
<br>
+bfloat16 bfloat16_maxnum_noprop(bfloat16, bfloat16, float_status *status);=
<br>
=C2=A0bfloat16 bfloat16_minnummag(bfloat16, bfloat16, float_status *status)=
;<br>
=C2=A0bfloat16 bfloat16_maxnummag(bfloat16, bfloat16, float_status *status)=
;<br>
=C2=A0bfloat16 bfloat16_sqrt(bfloat16, float_status *status);<br>
@@ -587,6 +591,8 @@ float32 float32_min(float32, float32, float_status *sta=
tus);<br>
=C2=A0float32 float32_max(float32, float32, float_status *status);<br>
=C2=A0float32 float32_minnum(float32, float32, float_status *status);<br>
=C2=A0float32 float32_maxnum(float32, float32, float_status *status);<br>
+float32 float32_minnum_noprop(float32, float32, float_status *status);<br>
+float32 float32_maxnum_noprop(float32, float32, float_status *status);<br>
=C2=A0float32 float32_minnummag(float32, float32, float_status *status);<br=
>
=C2=A0float32 float32_maxnummag(float32, float32, float_status *status);<br=
>
=C2=A0bool float32_is_quiet_nan(float32, float_status *status);<br>
@@ -776,6 +782,8 @@ float64 float64_min(float64, float64, float_status *sta=
tus);<br>
=C2=A0float64 float64_max(float64, float64, float_status *status);<br>
=C2=A0float64 float64_minnum(float64, float64, float_status *status);<br>
=C2=A0float64 float64_maxnum(float64, float64, float_status *status);<br>
+float64 float64_minnum_noprop(float64, float64, float_status *status);<br>
+float64 float64_maxnum_noprop(float64, float64, float_status *status);<br>
=C2=A0float64 float64_minnummag(float64, float64, float_status *status);<br=
>
=C2=A0float64 float64_maxnummag(float64, float64, float_status *status);<br=
>
=C2=A0bool float64_is_quiet_nan(float64 a, float_status *status);<br>
@@ -1208,6 +1216,8 @@ float128 float128_min(float128, float128, float_statu=
s *status);<br>
=C2=A0float128 float128_max(float128, float128, float_status *status);<br>
=C2=A0float128 float128_minnum(float128, float128, float_status *status);<b=
r>
=C2=A0float128 float128_maxnum(float128, float128, float_status *status);<b=
r>
+float128 float128_minnum_noprop(float128, float128, float_status *status);=
<br>
+float128 float128_maxnum_noprop(float128, float128, float_status *status);=
<br>
=C2=A0float128 float128_minnummag(float128, float128, float_status *status)=
;<br>
=C2=A0float128 float128_maxnummag(float128, float128, float_status *status)=
;<br>
=C2=A0bool float128_is_quiet_nan(float128, float_status *status);<br>
-- <br>
2.25.1<br>
<br></blockquote><div><br></div><div>I should add the cover letter for this=
 series of patchset, will resend it.</div><div>Sorry for the confusion.</di=
v><div><br></div><div>Regards,</div><div>Frank Chang</div><div>=C2=A0</div>=
</div></div>

--000000000000f0655205ce5ea189--

