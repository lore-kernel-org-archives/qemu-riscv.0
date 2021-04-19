Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lYNMX-0002Zv-Qv
	for mharc-qemu-riscv@gnu.org; Mon, 19 Apr 2021 02:26:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lYNMW-0002Xp-Fw; Mon, 19 Apr 2021 02:26:24 -0400
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a]:40940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lYNMU-0001vu-K3; Mon, 19 Apr 2021 02:26:24 -0400
Received: by mail-io1-xd2a.google.com with SMTP id e186so33743401iof.7;
 Sun, 18 Apr 2021 23:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=SUgXZiDgQKcTQZem/YT9GdIBFt32xK2Xvi5yepo2U6U=;
 b=uuwddG0d+KERd/CK/OjtX3to5RdlIMDp/PD8S4I6d3g657gabWkCjxTmG3xBdg6MCM
 wGRCUr8Ag87iQOeetTNRlNl1XZUbpNc6VTlV0UubxPBPrTlE/1xjvavqcqRJ0m4uxnEm
 Qh/YxMQ8Ak52lUSeY3eRwYeyHIbo4zb6uM+flGVTckhLmuoEiX6aYqi3MeJXpOj1K8ul
 54HMC0UzTJGuxBwz6630WS8+130xKvH6FomKnbpe+syJfwtyRsQ6WxieNPIj8gdQmV0U
 bemmt8mnuLHkU6bmOEnNoc0N8g4InV187gJGSXP85um/EwwwArjyKBc6Sjqombl2lHYI
 HyDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=SUgXZiDgQKcTQZem/YT9GdIBFt32xK2Xvi5yepo2U6U=;
 b=Alg3iKztl8bomRRUsDLemanvNF7FSJ0B5GEEu+ZSSQFTYi26D9G31dpCHH1vCdImRd
 VZH1uhBmoBx+Guutnefk+IpPA18MCV+DVq20eDbzKMGyRVrG76PdUy1M/ejO1JRPfdGI
 2CTTV8BWt2EjxYhspurzJ9dw38Wz61fKVxi2THyPocNQdgfDFOBf56Q9Sj4S9quXBpX2
 nh9QHyCWgrmWUZszReFtgafKUVowpK1r/r57Jz5MgJjO+x+8WHs+ujPbDsoLiYfyNj10
 LAb370XH4rN+tRCytL0B4CkR7F43aSbEl7zXj9tETmQwsKFeliclhMuRWrK3wCInz9K6
 l95Q==
X-Gm-Message-State: AOAM532FAB1J30X2X6IvvzY9jFY5lhqaHmQzYPcW53QyW5wpnGelwOMG
 9LOvxGJadRlCIRu8iHkAaNqMsnbEyBZRtMy/r4g=
X-Google-Smtp-Source: ABdhPJwtEqoVNYLuENDwyD8GY2BXOPQ30kbIlZ5sAkxGnRsSKiho/9Ag7m8+jIIGsGFcAqRwLsVrg2U+DdoEXH6s/e0=
X-Received: by 2002:a05:6638:f:: with SMTP id z15mr2985367jao.26.1618813580247; 
 Sun, 18 Apr 2021 23:26:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210419060145.11152-1-frank.chang@sifive.com>
In-Reply-To: <20210419060145.11152-1-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 19 Apr 2021 16:25:53 +1000
Message-ID: <CAKmqyKOwZeqbbeZxQ2uGiKxGWZrBUk5Xq93kAeQecrFy9p718g@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: fix vssub.vv saturation bug
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2a.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Mon, 19 Apr 2021 06:26:24 -0000

On Mon, Apr 19, 2021 at 4:02 PM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> Doing a negate (0x0 =E2=80=93 0x80000000) using vssub.vv produces
> an incorrect result of 0x80000000 (should saturate to 0x7fffffff)
>
> Fix this bug by treating zero as a positive number.
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>

Thanks for the patch!

A similar fix is already in the riscv-to-apply.next queue

   target/riscv: Fixup saturate subtract function

   The overflow predication ((a - b) ^ a) & (a ^ b) & INT64_MIN is right.
   However, when the predication is ture and a is 0, it should return maxim=
um.

   Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
   Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
   Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
   Message-id: 20210212150256.885-4-zhiwei_liu@c-sky.com
   Message-Id: <20210212150256.885-4-zhiwei_liu@c-sky.com>


Alistair

> ---
>  target/riscv/vector_helper.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index a156573d281..356cef8a090 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -2451,7 +2451,7 @@ static inline int8_t ssub8(CPURISCVState *env, int =
vxrm, int8_t a, int8_t b)
>  {
>      int8_t res =3D a - b;
>      if ((res ^ a) & (a ^ b) & INT8_MIN) {
> -        res =3D a > 0 ? INT8_MAX : INT8_MIN;
> +        res =3D a >=3D 0 ? INT8_MAX : INT8_MIN;
>          env->vxsat =3D 0x1;
>      }
>      return res;
> @@ -2461,7 +2461,7 @@ static inline int16_t ssub16(CPURISCVState *env, in=
t vxrm, int16_t a, int16_t b)
>  {
>      int16_t res =3D a - b;
>      if ((res ^ a) & (a ^ b) & INT16_MIN) {
> -        res =3D a > 0 ? INT16_MAX : INT16_MIN;
> +        res =3D a >=3D 0 ? INT16_MAX : INT16_MIN;
>          env->vxsat =3D 0x1;
>      }
>      return res;
> @@ -2471,7 +2471,7 @@ static inline int32_t ssub32(CPURISCVState *env, in=
t vxrm, int32_t a, int32_t b)
>  {
>      int32_t res =3D a - b;
>      if ((res ^ a) & (a ^ b) & INT32_MIN) {
> -        res =3D a > 0 ? INT32_MAX : INT32_MIN;
> +        res =3D a >=3D 0 ? INT32_MAX : INT32_MIN;
>          env->vxsat =3D 0x1;
>      }
>      return res;
> @@ -2481,7 +2481,7 @@ static inline int64_t ssub64(CPURISCVState *env, in=
t vxrm, int64_t a, int64_t b)
>  {
>      int64_t res =3D a - b;
>      if ((res ^ a) & (a ^ b) & INT64_MIN) {
> -        res =3D a > 0 ? INT64_MAX : INT64_MIN;
> +        res =3D a >=3D 0 ? INT64_MAX : INT64_MIN;
>          env->vxsat =3D 0x1;
>      }
>      return res;
> --
> 2.17.1
>
>

