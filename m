Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jtrwO-0000xq-Pf
	for mharc-qemu-riscv@gnu.org; Fri, 10 Jul 2020 08:15:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jtrwL-0000wH-2J
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 08:15:41 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:40634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jtrwF-0001n6-Fa
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 08:15:40 -0400
Received: by mail-wr1-x441.google.com with SMTP id f2so5695372wrp.7
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2020 05:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=MCQ9WA/8NwYtDsWZBUTGgRv06ftsvD29lhucjJSGXos=;
 b=Trt/DoKBldRWIQoBoj51eS3E8lsB8Z5BSF09AprrBks4ZKT2R8t6p0+ipmysy0PBSs
 QNtrF7xBD9hVKCqNgTp/n2UVYJ/pM6rK/q8XuOKN3qti7JmNNymk4G3fV/ex5E8b9sCG
 MRDqXD2/1P8Q2NeGWde3YHMLbkZY/B+GT5YBuWAbP6hUbhv4QFCJnaPFw+/51XTbspSK
 HHIv2QlMdcaT3vN6AwqUSN9GsicL6hyExZ90317YLyGkcEktZq+pQi1+2gjFVEd1bJPr
 UQB0auTzypgqaLfEbbQa3BETaLf4Ysp7xbgTmNPdpiKiaBH5zZ5dQmRgA0JHPfph3VX7
 3QdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=MCQ9WA/8NwYtDsWZBUTGgRv06ftsvD29lhucjJSGXos=;
 b=sb3/w+Xs2m5wUFAnJn0NjSpAw3pr/PFegCv1aOjcp6vhsITWmOvq/ZxENeYbTRRsdq
 0XvwYqLaKZvpGKVnOMLCVDY+gE2rotkqQUevxskdciVsTfbsyQXQFyR+wRTXBkzOuw1R
 /le9k/Z//YC4mOvsbN2nyaL617fpVI0ms459pRIbsebZ2EhIOOVDyGws/hY1PCBWZwfP
 L8JHeEMbBCNlFT+92/n9mY82DRAZa9XVH7eLoJJxDcXFcvDbxJXmrssMNH6pproQE/zW
 ABjxjdDkxsQrj3A0Hl8J7lbAdT9fbXTq5vtVocRJSqIe3YmkofWWrrCA3/ArNvSzJrrv
 Lk+g==
X-Gm-Message-State: AOAM53100S6nKTJMTSmnEklvZQMQaRWX+NNfmSoS5oTw+BxhtAYVRNsa
 4NlPATZOTDTibXVX38rTIkFl+Q==
X-Google-Smtp-Source: ABdhPJx3tDpFxowiMilN5dh1ZwaFVQ7e39WybWd6M011LLTUBkHsoidfxzYFFjUf1DBqVPud+Ihc7Q==
X-Received: by 2002:a5d:69cf:: with SMTP id s15mr57496634wrw.10.1594383333032; 
 Fri, 10 Jul 2020 05:15:33 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o29sm10790366wra.5.2020.07.10.05.15.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 05:15:31 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 36FD01FF7E;
 Fri, 10 Jul 2020 13:15:31 +0100 (BST)
References: <20200710104920.13550-1-frank.chang@sifive.com>
 <20200710104920.13550-63-frank.chang@sifive.com>
User-agent: mu4e 1.5.4; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: frank.chang@sifive.com
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, Chih-Min Chao
 <chihmin.chao@sifive.com>, Aurelien Jarno <aurelien@aurel32.net>, Peter
 Maydell <peter.maydell@linaro.org>
Subject: Re: [RFC 62/65] fpu: add api to handle alternative sNaN propagation
In-reply-to: <20200710104920.13550-63-frank.chang@sifive.com>
Date: Fri, 10 Jul 2020 13:15:30 +0100
Message-ID: <87h7uflg65.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 10 Jul 2020 12:15:42 -0000


frank.chang@sifive.com writes:

> From: Chih-Min Chao <chihmin.chao@sifive.com>
>
> Signed-off-by: Chih-Min Chao <chihmin.chao@sifive.com>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  fpu/softfloat.c         | 68 +++++++++++++++++++++++++----------------
>  include/fpu/softfloat.h |  6 ++++
>  2 files changed, 48 insertions(+), 26 deletions(-)
>
> diff --git a/fpu/softfloat.c b/fpu/softfloat.c
> index fa1c99c03e..028b857167 100644
> --- a/fpu/softfloat.c
> +++ b/fpu/softfloat.c
> @@ -2777,23 +2777,32 @@ float64 uint16_to_float64(uint16_t a, float_statu=
s *status)
>   * and minNumMag() from the IEEE-754 2008.
>   */
>  static FloatParts minmax_floats(FloatParts a, FloatParts b, bool ismin,
> -                                bool ieee, bool ismag, float_status *s)
> +                                bool ieee, bool ismag, bool issnan_prop,
> +                                float_status *s)
>  {
>      if (unlikely(is_nan(a.cls) || is_nan(b.cls))) {
>          if (ieee) {
>              /* Takes two floating-point values `a' and `b', one of
>               * which is a NaN, and returns the appropriate NaN
>               * result. If either `a' or `b' is a signaling NaN,
> -             * the invalid exception is raised.
> +             * the invalid exception is raised but the NaN
> +             * propagation is 'shall'.
>               */
>              if (is_snan(a.cls) || is_snan(b.cls)) {
> -                return pick_nan(a, b, s);
> -            } else if (is_nan(a.cls) && !is_nan(b.cls)) {
> +                if (issnan_prop) {
> +                    pick_nan(a, b, s);

This looks funky to me because you don't actually pick a nan - are you
just using this for side effects?

I'm also confused by the fact the new helpers have the prototype noprop
which implies no propagation yes the bool flag is true and named
issnan_prop which implies it should propagate.

I think we need a clearer problem statement in the commit of what you
are trying to achieve here. I suspect it might be worth splitting the
flag setting from pick_nan to it's own mini helper if that is all we
want to do in this case.

> +                } else {
> +                    return pick_nan(a, b, s);
> +                }
> +            }
> +
> +            if (is_nan(a.cls) && !is_nan(b.cls)) {
>                  return b;
>              } else if (is_nan(b.cls) && !is_nan(a.cls)) {
>                  return a;
>              }
>          }
> +

nit: stray space

>          return pick_nan(a, b, s);
>      } else {
>          int a_exp, b_exp;
> @@ -2847,37 +2856,44 @@ static FloatParts minmax_floats(FloatParts a, Flo=
atParts b, bool ismin,
>      }
>  }
>=20=20
> -#define MINMAX(sz, name, ismin, isiee, ismag)                           \
> +#define MINMAX(sz, name, ismin, isiee, ismag, issnan_prop)              \
>  float ## sz float ## sz ## _ ## name(float ## sz a, float ## sz b,      \
>                                       float_status *s)                   \
>  {                                                                       \
>      FloatParts pa =3D float ## sz ## _unpack_canonical(a, s);           =
  \
>      FloatParts pb =3D float ## sz ## _unpack_canonical(b, s);           =
  \
> -    FloatParts pr =3D minmax_floats(pa, pb, ismin, isiee, ismag, s);    =
  \
> +    FloatParts pr =3D minmax_floats(pa, pb, ismin, isiee, ismag,        =
  \
> +                                  issnan_prop, s);                      \
>                                                                          \
>      return float ## sz ## _round_pack_canonical(pr, s);                 \
>  }
>=20=20
> -MINMAX(16, min, true, false, false)
> -MINMAX(16, minnum, true, true, false)
> -MINMAX(16, minnummag, true, true, true)
> -MINMAX(16, max, false, false, false)
> -MINMAX(16, maxnum, false, true, false)
> -MINMAX(16, maxnummag, false, true, true)
> -
> -MINMAX(32, min, true, false, false)
> -MINMAX(32, minnum, true, true, false)
> -MINMAX(32, minnummag, true, true, true)
> -MINMAX(32, max, false, false, false)
> -MINMAX(32, maxnum, false, true, false)
> -MINMAX(32, maxnummag, false, true, true)
> -
> -MINMAX(64, min, true, false, false)
> -MINMAX(64, minnum, true, true, false)
> -MINMAX(64, minnummag, true, true, true)
> -MINMAX(64, max, false, false, false)
> -MINMAX(64, maxnum, false, true, false)
> -MINMAX(64, maxnummag, false, true, true)
> +MINMAX(16, min, true, false, false, false)
> +MINMAX(16, minnum, true, true, false, false)
> +MINMAX(16, minnum_noprop, true, true, false, true)
> +MINMAX(16, minnummag, true, true, true, false)
> +MINMAX(16, max, false, false, false, false)
> +MINMAX(16, maxnum, false, true, false, false)
> +MINMAX(16, maxnum_noprop, false, true, false, true)
> +MINMAX(16, maxnummag, false, true, true, false)
> +
> +MINMAX(32, min, true, false, false, false)
> +MINMAX(32, minnum, true, true, false, false)
> +MINMAX(32, minnum_noprop, true, true, false, true)
> +MINMAX(32, minnummag, true, true, true, false)
> +MINMAX(32, max, false, false, false, false)
> +MINMAX(32, maxnum, false, true, false, false)
> +MINMAX(32, maxnum_noprop, false, true, false, true)
> +MINMAX(32, maxnummag, false, true, true, false)
> +
> +MINMAX(64, min, true, false, false, false)
> +MINMAX(64, minnum, true, true, false, false)
> +MINMAX(64, minnum_noprop, true, true, false, true)
> +MINMAX(64, minnummag, true, true, true, false)
> +MINMAX(64, max, false, false, false, false)
> +MINMAX(64, maxnum, false, true, false, false)
> +MINMAX(64, maxnum_noprop, false, true, false, true)
> +MINMAX(64, maxnummag, false, true, true, false)
>=20=20
>  #undef MINMAX
>=20=20
> diff --git a/include/fpu/softfloat.h b/include/fpu/softfloat.h
> index b0ae8f6295..075c680456 100644
> --- a/include/fpu/softfloat.h
> +++ b/include/fpu/softfloat.h
> @@ -239,6 +239,8 @@ float16 float16_minnum(float16, float16, float_status=
 *status);
>  float16 float16_maxnum(float16, float16, float_status *status);
>  float16 float16_minnummag(float16, float16, float_status *status);
>  float16 float16_maxnummag(float16, float16, float_status *status);
> +float16 float16_minnum_noprop(float16, float16, float_status *status);
> +float16 float16_maxnum_noprop(float16, float16, float_status *status);
>  float16 float16_sqrt(float16, float_status *status);
>  FloatRelation float16_compare(float16, float16, float_status *status);
>  FloatRelation float16_compare_quiet(float16, float16, float_status *stat=
us);
> @@ -359,6 +361,8 @@ float32 float32_minnum(float32, float32, float_status=
 *status);
>  float32 float32_maxnum(float32, float32, float_status *status);
>  float32 float32_minnummag(float32, float32, float_status *status);
>  float32 float32_maxnummag(float32, float32, float_status *status);
> +float32 float32_minnum_noprop(float32, float32, float_status *status);
> +float32 float32_maxnum_noprop(float32, float32, float_status *status);
>  bool float32_is_quiet_nan(float32, float_status *status);
>  bool float32_is_signaling_nan(float32, float_status *status);
>  float32 float32_silence_nan(float32, float_status *status);
> @@ -548,6 +552,8 @@ float64 float64_minnum(float64, float64, float_status=
 *status);
>  float64 float64_maxnum(float64, float64, float_status *status);
>  float64 float64_minnummag(float64, float64, float_status *status);
>  float64 float64_maxnummag(float64, float64, float_status *status);
> +float64 float64_minnum_noprop(float64, float64, float_status *status);
> +float64 float64_maxnum_noprop(float64, float64, float_status *status);
>  bool float64_is_quiet_nan(float64 a, float_status *status);
>  bool float64_is_signaling_nan(float64, float_status *status);
>  float64 float64_silence_nan(float64, float_status *status);


--=20
Alex Benn=C3=A9e

