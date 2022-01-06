Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n5HXM-0004OQ-5Y
	for mharc-qemu-riscv@gnu.org; Wed, 05 Jan 2022 20:25:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n5HXF-0004LR-SL; Wed, 05 Jan 2022 20:25:47 -0500
Received: from [2607:f8b0:4864:20::d2f] (port=34468
 helo=mail-io1-xd2f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n5HXD-0005zQ-7k; Wed, 05 Jan 2022 20:25:45 -0500
Received: by mail-io1-xd2f.google.com with SMTP id e128so1319575iof.1;
 Wed, 05 Jan 2022 17:25:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=XzVIJ/2wmFNmM8HijNvzs8drJ/8htsZ0fa7r+KDkM1k=;
 b=TQY8WGiaixTLStnA02vewB/2RRSKtptFTRsbraDOjdzccf5jiSRSvAZuGGVm8d3Tk9
 +KyoelIYHlGY6e8i5GTQe7N6j1pOGseGakeNWhfNmJo74sGIQG7jyWDLG015mHKPNQNw
 ZNHXRq84k8pcmgnxnCS+shq4bStMfYXmYzukwFjX6WJfNSob+xG0R7Ua9moCnvn1lFww
 kr2bygRPJ1MYe8C7KtcPsokdNR5AoWiY0UOWkWkNUfcCusrY5K+ighCHDjzQqhSSBrhd
 DTHcDgQzTHb7V350Nn5P9r1DhxOuxhMNz4eVRvU4IeRCQp4c+wTvc2t2g/itG+KJNaS8
 yXjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=XzVIJ/2wmFNmM8HijNvzs8drJ/8htsZ0fa7r+KDkM1k=;
 b=PjNl3e1hgd5TvuX1LoiulgwTBVAjssluBcsmqRwTjC4CyBJl8xAPSnwZ0/E53ncctk
 0JZwc6al65YYN38CuXHEDkcKIW7tdIYAQSk4mnurwCTbDPsE259+6kJEbLv4fw7Y33Zm
 yMEGE9toBX+PKLckAanf8wL//9NxRnbLgOuGA4avfpo5ubE185RxcnDarplSwRtJQNeX
 /FNGlGIE6LQmwAAxDQ/+RJMHj05caAJJIR4jPj/dbFGCfWgtDOT68N42LydoPWdwpmK7
 e5G4GnjQ1P5bD7h+L8tLQ3xv5RVc9VaVzNzM1S92MkkxSxyRHZ49IisvVytbHfmjdz/7
 GCRg==
X-Gm-Message-State: AOAM531xGMwcvAjuR1mXMedrHK+3m+ZkOiINQYlygGbEwKyKQUiyWMam
 +RN5+aix+RIiaUYEuat08Z0trtXl0VvT+PUxFmc=
X-Google-Smtp-Source: ABdhPJzf0ry1jQi9zCLv4tInj5Ek8T5oC8zFlImgDvGSsMjv0MFIe1o8BNf5cyHjFF+r9TBZ9snNINzeu/rESz9oKmQ=
X-Received: by 2002:a05:6638:38d:: with SMTP id
 y13mr24465113jap.318.1641432340241; 
 Wed, 05 Jan 2022 17:25:40 -0800 (PST)
MIME-Version: 1.0
References: <20211213163834.170504-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20211213163834.170504-17-frederic.petrot@univ-grenoble-alpes.fr>
In-Reply-To: <20211213163834.170504-17-frederic.petrot@univ-grenoble-alpes.fr>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 6 Jan 2022 11:25:13 +1000
Message-ID: <CAKmqyKPd9oVOHqSpNWB8HrY3XCeM0kXsmv1+dox0k4xCjuwhDw@mail.gmail.com>
Subject: Re: [PATCH v7 16/18] target/riscv: helper functions to wrap calls to
 128-bit csr insns
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
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Thu, 06 Jan 2022 01:25:48 -0000

On Tue, Dec 14, 2021 at 2:46 AM Fr=C3=A9d=C3=A9ric P=C3=A9trot
<frederic.petrot@univ-grenoble-alpes.fr> wrote:
>
> Given the side effects they have, the csr instructions are realized as
> helpers. We extend this existing infrastructure for 128-bit sized csr.
> We return 128-bit values using the same approach as for div/rem.
> Theses helpers all call a unique function that is currently a fallback
> on the 64-bit version.
> The trans_csrxx functions supporting 128-bit are yet to be implemented.
>
> Signed-off-by: Fr=C3=A9d=C3=A9ric P=C3=A9trot <frederic.petrot@univ-greno=
ble-alpes.fr>
> Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.h       |  5 +++++
>  target/riscv/helper.h    |  3 +++
>  target/riscv/csr.c       | 17 ++++++++++++++++
>  target/riscv/op_helper.c | 44 ++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 69 insertions(+)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index a7c2e5c93e..00e5081598 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -25,6 +25,7 @@
>  #include "exec/cpu-defs.h"
>  #include "fpu/softfloat-types.h"
>  #include "qom/object.h"
> +#include "qemu/int128.h"
>  #include "cpu_bits.h"
>
>  #define TCG_GUEST_DEFAULT_MO 0
> @@ -481,6 +482,10 @@ typedef RISCVException (*riscv_csr_op_fn)(CPURISCVSt=
ate *env, int csrno,
>                                            target_ulong new_value,
>                                            target_ulong write_mask);
>
> +RISCVException riscv_csrrw_i128(CPURISCVState *env, int csrno,
> +                                Int128 *ret_value,
> +                                Int128 new_value, Int128 write_mask);
> +
>  typedef struct {
>      const char *name;
>      riscv_csr_predicate_fn predicate;
> diff --git a/target/riscv/helper.h b/target/riscv/helper.h
> index c036825723..bf2b338bfd 100644
> --- a/target/riscv/helper.h
> +++ b/target/riscv/helper.h
> @@ -66,6 +66,9 @@ DEF_HELPER_FLAGS_2(clmulr, TCG_CALL_NO_RWG_SE, tl, tl, =
tl)
>  DEF_HELPER_2(csrr, tl, env, int)
>  DEF_HELPER_3(csrw, void, env, int, tl)
>  DEF_HELPER_4(csrrw, tl, env, int, tl, tl)
> +DEF_HELPER_2(csrr_i128, tl, env, int)
> +DEF_HELPER_4(csrw_i128, void, env, int, tl, tl)
> +DEF_HELPER_6(csrrw_i128, tl, env, int, tl, tl, tl, tl)
>  #ifndef CONFIG_USER_ONLY
>  DEF_HELPER_2(sret, tl, env, tl)
>  DEF_HELPER_2(mret, tl, env, tl)
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 9f41954894..dca9e19a64 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -1788,6 +1788,23 @@ RISCVException riscv_csrrw(CPURISCVState *env, int=
 csrno,
>      return RISCV_EXCP_NONE;
>  }
>
> +RISCVException riscv_csrrw_i128(CPURISCVState *env, int csrno,
> +                               Int128 *ret_value,
> +                               Int128 new_value, Int128 write_mask)
> +{
> +    /* fall back to 64-bit version for now */
> +    target_ulong ret_64;
> +    RISCVException ret =3D riscv_csrrw(env, csrno, &ret_64,
> +                                     int128_getlo(new_value),
> +                                     int128_getlo(write_mask));
> +
> +    if (ret_value) {
> +        *ret_value =3D int128_make64(ret_64);
> +    }
> +
> +    return ret;
> +}
> +
>  /*
>   * Debugger support.  If not in user mode, set env->debugger before the
>   * riscv_csrrw call and clear it after the call.
> diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
> index ee7c24efe7..f4cf9c4698 100644
> --- a/target/riscv/op_helper.c
> +++ b/target/riscv/op_helper.c
> @@ -69,6 +69,50 @@ target_ulong helper_csrrw(CPURISCVState *env, int csr,
>      return val;
>  }
>
> +target_ulong helper_csrr_i128(CPURISCVState *env, int csr)
> +{
> +    Int128 rv =3D int128_zero();
> +    RISCVException ret =3D riscv_csrrw_i128(env, csr, &rv,
> +                                          int128_zero(),
> +                                          int128_zero());
> +
> +    if (ret !=3D RISCV_EXCP_NONE) {
> +        riscv_raise_exception(env, ret, GETPC());
> +    }
> +
> +    env->retxh =3D int128_gethi(rv);
> +    return int128_getlo(rv);
> +}
> +
> +void helper_csrw_i128(CPURISCVState *env, int csr,
> +                      target_ulong srcl, target_ulong srch)
> +{
> +    RISCVException ret =3D riscv_csrrw_i128(env, csr, NULL,
> +                                          int128_make128(srcl, srch),
> +                                          UINT128_MAX);
> +
> +    if (ret !=3D RISCV_EXCP_NONE) {
> +        riscv_raise_exception(env, ret, GETPC());
> +    }
> +}
> +
> +target_ulong helper_csrrw_i128(CPURISCVState *env, int csr,
> +                       target_ulong srcl, target_ulong srch,
> +                       target_ulong maskl, target_ulong maskh)
> +{
> +    Int128 rv =3D int128_zero();
> +    RISCVException ret =3D riscv_csrrw_i128(env, csr, &rv,
> +                                          int128_make128(srcl, srch),
> +                                          int128_make128(maskl, maskh));
> +
> +    if (ret !=3D RISCV_EXCP_NONE) {
> +        riscv_raise_exception(env, ret, GETPC());
> +    }
> +
> +    env->retxh =3D int128_gethi(rv);
> +    return int128_getlo(rv);
> +}
> +
>  #ifndef CONFIG_USER_ONLY
>
>  target_ulong helper_sret(CPURISCVState *env, target_ulong cpu_pc_deb)
> --
> 2.34.1
>
>

