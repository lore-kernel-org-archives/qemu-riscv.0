Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mpOvv-0004Eu-VH
	for mharc-qemu-riscv@gnu.org; Tue, 23 Nov 2021 01:05:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mpOvq-0004Dc-Ge; Tue, 23 Nov 2021 01:05:34 -0500
Received: from [2607:f8b0:4864:20::d2f] (port=45828
 helo=mail-io1-xd2f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mpOvk-0004va-Am; Tue, 23 Nov 2021 01:05:26 -0500
Received: by mail-io1-xd2f.google.com with SMTP id v23so26482939iom.12;
 Mon, 22 Nov 2021 22:05:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=4kINVuWnDNEG139KzrNWOcNZrtZ1ghbF+Sou7XJu3Os=;
 b=OOC33y+Kh+vhKgxEOv0UJDxpQRxtVu6sRu03kzLUnydIkb3qc10kcdHgT1iyrUI3OF
 hZw2dnADPK9Tdj3oXcqKt+F/pVIGFnrZvcWwvlaON0h+yH0uFeuXDHxXQchprCF5BzgJ
 3Oy/6FvHZw18tDS0Saj15RpEKc9va6bhDskKpwqIu4UlQq1yx2vc/vdTwi6/VVFjvVrp
 Q24DWvFDsfySKFtJG2tRmBAhPw7VAnDIndbj38+v1pHxusWuzozKtsPTlDKmoaPTqi1A
 QgyEylkJdDgrB9mBzYKFq4uVGTK2QZEKcDKwScikWbqWBW1k3ZratUjIV6Y0d4DJ/nmz
 4L6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4kINVuWnDNEG139KzrNWOcNZrtZ1ghbF+Sou7XJu3Os=;
 b=HVrChrYo1GbToUbL9Nso8V1UF99GrIfYa/ARjqVwlNOc20SvOc6ivWNKwp5KZEmDFF
 x9d/pazirBjn3iV7zGrPaC+GNAqaBhlP1/G+U28Gf75RIn2+wjD+3mgRTsZwG1p2JHO6
 VN6CLnAbDljWgwTEDlabsefz+Km2D0p6BoMYzKZFoSOyzi1VIeYsw08joz+LXH04CbMI
 F2DJhVMXKoSRXZ3oQLpfjVqUsg2r1V9NMdD5hOYYqBlSUHxhy2WEohVNVdRUKKNIYvz7
 bRcx2YmkcJ3OohB4YRnuZaEEChB+8V3Sx9ERaqc7xKj3XestHy6lH5uqGRaK2Yh/5a2h
 S/pQ==
X-Gm-Message-State: AOAM532YbBZYw5G0jzboXUPCiLYr3xgJmogceXVzC1O9Z0qs7QVGYVqU
 2psGDm/3uJW1ng++CpvEolbuUvMyIJm6WbY8OME=
X-Google-Smtp-Source: ABdhPJwCzj49FJ4gFTaezKZf4y7qMkCnOnoFr1pPbDkBCuaskMGgeZq+ub3zhmVFBycdtg3A0MC7csrYAshIUFr3wW8=
X-Received: by 2002:a6b:6802:: with SMTP id d2mr3206391ioc.187.1637647522111; 
 Mon, 22 Nov 2021 22:05:22 -0800 (PST)
MIME-Version: 1.0
References: <20211112145902.205131-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20211112145902.205131-4-frederic.petrot@univ-grenoble-alpes.fr>
In-Reply-To: <20211112145902.205131-4-frederic.petrot@univ-grenoble-alpes.fr>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 23 Nov 2021 16:04:55 +1000
Message-ID: <CAKmqyKPdRpyYa=gBowqOu65vOP_guhKEFRm001qmVdE-WGtyFw@mail.gmail.com>
Subject: Re: [PATCH v5 03/18] qemu/int128: addition of div/rem 128-bit
 operations
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Fabien Portas <fabien.portas@grenoble-inp.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2f.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 23 Nov 2021 06:05:34 -0000

On Sat, Nov 13, 2021 at 1:06 AM Fr=C3=A9d=C3=A9ric P=C3=A9trot
<frederic.petrot@univ-grenoble-alpes.fr> wrote:
>
> Addition of div and rem on 128-bit integers, using the 128/64->128 divu a=
nd
> 64x64->128 mulu in host-utils.
> These operations will be used within div/rem helpers in the 128-bit riscv
> target.
>
> Signed-off-by: Fr=C3=A9d=C3=A9ric P=C3=A9trot <frederic.petrot@univ-greno=
ble-alpes.fr>
> Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  include/qemu/int128.h |   6 ++
>  util/int128.c         | 145 ++++++++++++++++++++++++++++++++++++++++++
>  util/meson.build      |   1 +
>  3 files changed, 152 insertions(+)
>  create mode 100644 util/int128.c
>
> diff --git a/include/qemu/int128.h b/include/qemu/int128.h
> index b6d517aea4..ef41892dac 100644
> --- a/include/qemu/int128.h
> +++ b/include/qemu/int128.h
> @@ -386,4 +386,10 @@ static inline void bswap128s(Int128 *s)
>      *s =3D bswap128(*s);
>  }
>
> +#define UINT128_MAX int128_make128(~0LL, ~0LL)
> +Int128 int128_divu(Int128, Int128);
> +Int128 int128_remu(Int128, Int128);
> +Int128 int128_divs(Int128, Int128);
> +Int128 int128_rems(Int128, Int128);
> +
>  #endif /* INT128_H */
> diff --git a/util/int128.c b/util/int128.c
> new file mode 100644
> index 0000000000..c2ddf197e1
> --- /dev/null
> +++ b/util/int128.c
> @@ -0,0 +1,145 @@
> +#include "qemu/osdep.h"
> +#include "qemu/host-utils.h"
> +#include "qemu/int128.h"
> +
> +#ifdef CONFIG_INT128
> +
> +Int128 int128_divu(Int128 a, Int128 b)
> +{
> +    return (__uint128_t)a / (__uint128_t)b;
> +}
> +
> +Int128 int128_remu(Int128 a, Int128 b)
> +{
> +    return (__uint128_t)a % (__uint128_t)b;
> +}
> +
> +Int128 int128_divs(Int128 a, Int128 b)
> +{
> +    return a / b;
> +}
> +
> +Int128 int128_rems(Int128 a, Int128 b)
> +{
> +    return a % b;
> +}
> +
> +#else
> +
> +/*
> + * Division and remainder algorithms for 128-bit due to Stefan Kanthak,
> + * https://skanthak.homepage.t-online.de/integer.html#udivmodti4
> + * Preconditions:
> + *     - function should never be called with v equals to 0, it has to
> + *       be dealt with beforehand
> + *     - quotien pointer must be valid
> + */
> +static Int128 divrem128(Int128 u, Int128 v, Int128 *q)
> +{
> +    Int128 qq;
> +    uint64_t hi, lo, tmp;
> +    int s;
> +
> +    if ((s =3D clz64(v.hi)) =3D=3D 64) {
> +        /* we have uu=C3=B70v =3D> let's use divu128 */
> +        hi =3D u.hi;
> +        lo =3D u.lo;
> +        tmp =3D divu128(&lo, &hi, v.lo);
> +        *q =3D int128_make128(lo, hi);
> +        return int128_make128(tmp, 0);
> +    } else {
> +        hi =3D int128_gethi(int128_lshift(v, s));
> +
> +        if (hi > u.hi) {
> +            lo =3D u.lo;
> +            tmp =3D u.hi;
> +            divu128(&lo, &tmp, hi);
> +            lo =3D int128_gethi(int128_lshift(int128_make128(lo, 0), s))=
;
> +        } else { /* prevent overflow */
> +            lo =3D u.lo;
> +            tmp =3D u.hi - hi;
> +            divu128(&lo, &tmp, hi);
> +            lo =3D int128_gethi(int128_lshift(int128_make128(lo, 1), s))=
;
> +        }
> +
> +        qq =3D int128_make64(lo);
> +
> +        tmp =3D lo * v.hi;
> +        mulu64(&lo, &hi, lo, v.lo);
> +        hi +=3D tmp;
> +
> +        if (hi < tmp     /* quotient * divisor >=3D 2**128 > dividend */
> +            || hi > u.hi /* quotient * divisor > dividend */
> +            || (hi =3D=3D u.hi && lo > u.lo)) {
> +            qq.lo -=3D 1;
> +            mulu64(&lo, &hi, qq.lo, v.lo);
> +            hi +=3D qq.lo * v.hi;
> +        }
> +
> +        *q =3D qq;
> +        u.hi -=3D hi + (u.lo < lo);
> +        u.lo -=3D lo;
> +        return u;
> +    }
> +}
> +
> +Int128 int128_divu(Int128 a, Int128 b)
> +{
> +    Int128 q;
> +    divrem128(a, b, &q);
> +    return q;
> +}
> +
> +Int128 int128_remu(Int128 a, Int128 b)
> +{
> +    Int128 q;
> +    return divrem128(a, b, &q);
> +}
> +
> +Int128 int128_divs(Int128 a, Int128 b)
> +{
> +    Int128 q;
> +    bool sgna =3D !int128_nonneg(a);
> +    bool sgnb =3D !int128_nonneg(b);
> +
> +    if (sgna) {
> +        a =3D int128_neg(a);
> +    }
> +
> +    if (sgnb) {
> +        b =3D int128_neg(b);
> +    }
> +
> +    divrem128(a, b, &q);
> +
> +    if (sgna !=3D sgnb) {
> +        q =3D int128_neg(q);
> +    }
> +
> +    return q;
> +}
> +
> +Int128 int128_rems(Int128 a, Int128 b)
> +{
> +    Int128 q, r;
> +    bool sgna =3D !int128_nonneg(a);
> +    bool sgnb =3D !int128_nonneg(b);
> +
> +    if (sgna) {
> +        a =3D int128_neg(a);
> +    }
> +
> +    if (sgnb) {
> +        b =3D int128_neg(b);
> +    }
> +
> +    r =3D divrem128(a, b, &q);
> +
> +    if (sgna) {
> +        r =3D int128_neg(r);
> +    }
> +
> +    return r;
> +}
> +
> +#endif
> diff --git a/util/meson.build b/util/meson.build
> index 05b593055a..e676b2f6c6 100644
> --- a/util/meson.build
> +++ b/util/meson.build
> @@ -48,6 +48,7 @@ util_ss.add(files('transactions.c'))
>  util_ss.add(when: 'CONFIG_POSIX', if_true: files('drm.c'))
>  util_ss.add(files('guest-random.c'))
>  util_ss.add(files('yank.c'))
> +util_ss.add(files('int128.c'))
>
>  if have_user
>    util_ss.add(files('selfmap.c'))
> --
> 2.33.1
>
>

