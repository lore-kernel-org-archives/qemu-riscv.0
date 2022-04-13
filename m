Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nemd9-0001uz-JV
	for mharc-qemu-riscv@gnu.org; Wed, 13 Apr 2022 19:42:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nemd8-0001uF-1s; Wed, 13 Apr 2022 19:42:34 -0400
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f]:44860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nemd6-0001ow-86; Wed, 13 Apr 2022 19:42:33 -0400
Received: by mail-il1-x12f.google.com with SMTP id 14so2099605ily.11;
 Wed, 13 Apr 2022 16:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=l3Z3l5JoIGFNp9pNEy0hu4q1r/gQE7WZEhERrgz+loM=;
 b=pdRPEj5H2ZJMdjU0qpk90REyf9cA4EU+KFleMgS2840RsrJnbhk4C1QiNw7XkEGUhw
 qULIevl1sa0YNdCVI9+moT1rTFscUFsG1v/CHy9me5iK1fep6vpYIrViMS8A1v4g5uqn
 /R883mhq8aDHVALJ1pDAVcDb9VylMm7HzH86laOB1EGC0UOscuKPv5S8PzC41uGKUksh
 lkpChoznt8hHQMyKFjMkjNgtXAmEh0BElE8nNFy0taM7uLrZSmPNbSbo6TxTNen3IijA
 ZPUztKVSqDnkm1k0J58yQQ+fQrYMtC/RmYGCPiUXqIvmINvtOnat/CFulC3jvRcXaDSp
 nkjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l3Z3l5JoIGFNp9pNEy0hu4q1r/gQE7WZEhERrgz+loM=;
 b=RGv1kZ9KiiuBnLgbQdmJfW959Rad9kTyo7Kqw6V0nhugEQbewJy95gJCvlBDWFKATX
 FMj03uMaemw4pe6erttHOUOi/kH5sI7eKO75AMKo+8RlxhyTak+I1dszb8mMa8pzr0V8
 ea0FVxF4sKh+jaU0BTrqUQvlHoDferYaII00xSChHlgufvRyRyep2iKBYvlA8U4Qnqe7
 IBjzcLf9pn/A7dI+hDf8jb52G/sm8c4S5g7HsH+zmFy6n0J0tC0Oobbhy/43tiRt6P9V
 dYGld6uE1kHchxMVOcZlMqHNpE1CW18I482rNs7MIC6IH9MN4Sw5wpHGacZ5TyGkujw8
 MYIg==
X-Gm-Message-State: AOAM531RHsxjvX3rH+b6GmfhrQko5U1d2Y62OeaRV7e+g9W05kHg3Tp4
 yjQ4PXxHNsGvugkauoHtlQ7p4NEwfHXQrfWZM8A=
X-Google-Smtp-Source: ABdhPJyLx8g4v6J/ByBtKgNxyn0Cxpr8ySTMdEpuRtqlL6BeD8Q1FVYbaHWbzlJ/19mK25ESESrovd0jYPJbjLswGyQ=
X-Received: by 2002:a05:6e02:1645:b0:2cb:dff3:86d6 with SMTP id
 v5-20020a056e02164500b002cbdff386d6mr16044ilu.260.1649893350795; Wed, 13 Apr
 2022 16:42:30 -0700 (PDT)
MIME-Version: 1.0
References: <rq81o86n-17ps-92no-p65o-79o88476266@syhkavp.arg>
In-Reply-To: <rq81o86n-17ps-92no-p65o-79o88476266@syhkavp.arg>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 14 Apr 2022 09:42:04 +1000
Message-ID: <CAKmqyKMshHikPyf55nVMZdfKX-=VZQnj+Szmr3LXXL4CXiKGcA@mail.gmail.com>
Subject: Re: [PATCH] target/riscv/pmp: fix NAPOT range computation overflow
To: Nicolas Pitre <nico@fluxnic.net>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12f;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Wed, 13 Apr 2022 23:42:34 -0000

On Sat, Apr 9, 2022 at 2:25 AM Nicolas Pitre <nico@fluxnic.net> wrote:
>
> There is an overflow with the current code where a pmpaddr value of
> 0x1fffffff is decoded as sa=0 and ea=0 whereas it should be sa=0 and
> ea=0xffffffff.
>
> Fix that by simplifying the computation. There is in fact no need for
> ctz64() nor special case for -1 to achieve proper results.
>
> Signed-off-by: Nicolas Pitre <nico@fluxnic.net>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
> This is in fact the same patch I posted yesterday but turns out its
> scope is far more important than I initially thought.
>
> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> index 81b61bb65c..151da3fa08 100644
> --- a/target/riscv/pmp.c
> +++ b/target/riscv/pmp.c
> @@ -141,17 +141,9 @@ static void pmp_decode_napot(target_ulong a, target_ulong *sa, target_ulong *ea)
>         0111...1111   2^(XLEN+2)-byte NAPOT range
>         1111...1111   Reserved
>      */
> -    if (a == -1) {
> -        *sa = 0u;
> -        *ea = -1;
> -        return;
> -    } else {
> -        target_ulong t1 = ctz64(~a);
> -        target_ulong base = (a & ~(((target_ulong)1 << t1) - 1)) << 2;
> -        target_ulong range = ((target_ulong)1 << (t1 + 3)) - 1;
> -        *sa = base;
> -        *ea = base + range;
> -    }
> +    a = (a << 2) | 0x3;
> +    *sa = a & (a + 1);
> +    *ea = a | (a + 1);
>  }
>
>  void pmp_update_rule_addr(CPURISCVState *env, uint32_t pmp_index)
>

