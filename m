Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mpP7y-0000yz-Pi
	for mharc-qemu-riscv@gnu.org; Tue, 23 Nov 2021 01:18:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mpP7t-0000uF-Ck; Tue, 23 Nov 2021 01:17:57 -0500
Received: from [2607:f8b0:4864:20::d2c] (port=42893
 helo=mail-io1-xd2c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mpP7s-0007Dw-1S; Tue, 23 Nov 2021 01:17:57 -0500
Received: by mail-io1-xd2c.google.com with SMTP id x10so26526245ioj.9;
 Mon, 22 Nov 2021 22:17:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KmO1eM5agAjQiwBFXW5Su7ynaSzr9TRx4vlY0I68DFc=;
 b=jeYtM0BnHLpdazPKmadLsFrhK8hB36ouGnM0UYnIB7LC5118gE7WfgudF7EQZTJJWU
 gb90MihisrsVADarfpscznJGJ4VnG62I0sGgKKIbiDxyvfNZ4GZK4cH3DKZiEDbeLgxn
 70ecXZJlTNbS5IYDzWpb70KqLtVKix/eIXD0WRqGlw03gAScq0Ft2HV3L0PDP3Tq+BN6
 ZReICEzG4c54t+hArednIT7qNqLtZfd7S6HCint23FyzkVxzNnTQNVuSXPOvEWHanJ+x
 LAW12ZYkfLJXjhOcHXm46HXqg4m371PWhlxvSGW8everfrP8E9WUHxoR+pJhbgObm25k
 ARtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KmO1eM5agAjQiwBFXW5Su7ynaSzr9TRx4vlY0I68DFc=;
 b=a7op4FYeepHeKWY2xB0FSYqu0A2tRnqQCXa72+Gkai6OsIVPgg7aymjiVZ+zrYkW0k
 5YCjSGr/dCHZILkn1amDs/IxIYVa+RtFYRXKfct9DCjD/9C9hwDDWPETlA9XxdfoBmJW
 KRB5QC+U+1AByI78r1+CPkBHkThCm/xucBj3IgvsJ5rAcA73yG/xcM7s+cQRmt+Umvss
 hXZcbXzif4MaQBaqOydwWD0cmIEfhl3m++sSqa8nBLxxxGJYhKj+cyrgbH7+paCAdYk4
 wcDrNLkDarLLiE/7zkTKIenCKL/RjQfK7PpCGW8N7lTIKiE0Y+o4dNqRXCjXeVyOar2T
 GK+w==
X-Gm-Message-State: AOAM531arU2+fMJeQD06DgN6sWQakG3gfhu+46vIKpsHPVeeUn8P4vOI
 QeNr0YoVQV/DdnPSLLJhpDuX3Cr1876KqzSgzXw=
X-Google-Smtp-Source: ABdhPJyyvD46Ss+aftESo+kRYwbdXvLhfBWBdrz0+tEuQgwQ8pRIvJpoR+//tcew6oIF6NaTveA0CBH6QHGIYhIrhKw=
X-Received: by 2002:a05:6638:148b:: with SMTP id
 j11mr2976589jak.114.1637648274654; 
 Mon, 22 Nov 2021 22:17:54 -0800 (PST)
MIME-Version: 1.0
References: <20211122110230.38783-1-zhiwei_liu@c-sky.com>
 <20211122110230.38783-2-zhiwei_liu@c-sky.com>
In-Reply-To: <20211122110230.38783-2-zhiwei_liu@c-sky.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 23 Nov 2021 16:17:28 +1000
Message-ID: <CAKmqyKN0gqUymBEhiUHPQUNmqLw-jURuh2-+BZaDTbA_pxKKmQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] target/riscv: Check PMP rules num before
 propagation
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2c.google.com
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
X-List-Received-Date: Tue, 23 Nov 2021 06:17:58 -0000

On Mon, Nov 22, 2021 at 9:15 PM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>
> When an address is in [0-4K) and no pmp rule configured, the tlb_size will
> be set to 1.
>
> This is caused by pmp_get_tlb_size return a value 1.
>
> if (pmp_sa >= tlb_sa && pmp_ea <= tlb_ea) {
>     return pmp_ea - pmp_sa + 1;
> }
>
> Here pmp_sa == 0 and pmp_ea == 0.
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/pmp.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> index 54abf42583..190ff59fab 100644
> --- a/target/riscv/pmp.c
> +++ b/target/riscv/pmp.c
> @@ -627,6 +627,10 @@ bool pmp_is_range_in_tlb(CPURISCVState *env, hwaddr tlb_sa,
>      target_ulong val;
>      target_ulong tlb_ea = (tlb_sa + TARGET_PAGE_SIZE - 1);
>
> +    if (pmp_get_num_rules(env) == 0) {
> +        return false;
> +    }
> +
>      for (i = 0; i < MAX_RISCV_PMPS; i++) {
>          val = pmp_get_tlb_size(env, i, tlb_sa, tlb_ea);
>          if (val) {
> --
> 2.25.1
>
>

