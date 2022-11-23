Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oxdEL-0006Wt-5o
	for mharc-qemu-riscv@gnu.org; Tue, 22 Nov 2022 19:03:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oxdEJ-0006Wb-8K; Tue, 22 Nov 2022 19:03:07 -0500
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oxdEG-0000pF-Fp; Tue, 22 Nov 2022 19:03:07 -0500
Received: by mail-vs1-xe2b.google.com with SMTP id c184so10331505vsc.3;
 Tue, 22 Nov 2022 16:03:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=e8KU4balBIJc+8raNyf3FDeJNeZ/H8DqoWvZS882i90=;
 b=CqssymfNGFpkos8TaqkJMTFYppam37eDPTb+MBj/ObHyEFt2sgCz+s2d0xARQBWUpC
 56e2zv+MaD7DP+kpjDPrejW1vCBPt4mK+2mINFvnfWQiptzbwl5kT8QNth9ugxe1veZ1
 MJtghmSU4y183nEQhNulye2GiAK5AJ+y10L7ecW0LE46J4YcgMczxPR5PNvtZAgRyzZ8
 qZ262oyBnzoVH4t6OiiGNWG6y1XMJ6C9CVy7r7q4M75C/WL7nmqfl8Dj1zo/yZFZAY53
 +nsqAoSrTHIhe5TUUFdnMsTcx5wbGZEhlns/U63C0i6gZeqbOBxY3LtizteUEeLCjE4I
 0zuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=e8KU4balBIJc+8raNyf3FDeJNeZ/H8DqoWvZS882i90=;
 b=6FaOpWHlsa0/9eLuZSRHBVJWRRy69Qz5rcooKMn8tihf6VBmBGo4V8BvDxe2HnFsxj
 c12WhJ37uem8/auzGyPAgyacYGqTnhHMT3o/oCjV+ADLE8fqnIBBXglgLq4ATGSEfQ8e
 wAe8Ihkp11Bhh62t3oUyiVTbUSU56M6FMrJZ+CUu+mq0VZv1++fM0Ohjx8NS9ytLeNF+
 VTRssnO8QKb51dTz/VAH06CzlGWHlkal9LhFJEUJZpsLVIhpA8oreDVHSJhtXikiIxSq
 VEWDg0vx/TYh6urY7wz9Fq5vHIkjc+wvpEXiAELi8Ynvs0CDI3iP6/yxvgomHlFT7hg4
 nv2w==
X-Gm-Message-State: ANoB5pl+Uxj2wUwbolvloaVZJrpAfTC2qvkxaXULEFzDlbT6XBjdqxb0
 qwmH8eC+dWQKcdCAOWDeJ2MGG1aaqYWxAyK0+QWf6l1Ge9w=
X-Google-Smtp-Source: AA0mqf5KXXKrdkI97Sxusu0ofT74ZL2OG2CJmTL/1yGZRNo/W9Q0YE8UyD6WoZcAxK4oL1wvbH8Upeq/ANVKrZdsOKg=
X-Received: by 2002:a05:6102:11f1:b0:3a6:fde0:cf74 with SMTP id
 e17-20020a05610211f100b003a6fde0cf74mr4039858vsg.73.1669161775060; Tue, 22
 Nov 2022 16:02:55 -0800 (PST)
MIME-Version: 1.0
References: <20221122154628.3138131-1-bmeng@tinylab.org>
In-Reply-To: <20221122154628.3138131-1-bmeng@tinylab.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 23 Nov 2022 10:02:28 +1000
Message-ID: <CAKmqyKMxtFQ7==QrtY_sPvxCjW0U-sBnegoa5TKOLO-J8=R=Mw@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Dump sstatus CSR in riscv_cpu_dump_state()
To: Bin Meng <bmeng@tinylab.org>
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2b;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2b.google.com
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
X-List-Received-Date: Wed, 23 Nov 2022 00:03:07 -0000

On Wed, Nov 23, 2022 at 2:07 AM Bin Meng <bmeng@tinylab.org> wrote:
>
> sstatus register dump is currently missing in riscv_cpu_dump_state().
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1332
> Signed-off-by: Bin Meng <bmeng@tinylab.org>
>
> ---
>
>  target/riscv/cpu.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index d14e95c9dc..80d76f0181 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -382,6 +382,7 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
>              CSR_MHARTID,
>              CSR_MSTATUS,
>              CSR_MSTATUSH,
> +            CSR_SSTATUS,

I don't think we need this. mstatus contains all of the information
already and there is limited space to print all of this information
out.

Alistair

>              CSR_HSTATUS,
>              CSR_VSSTATUS,
>              CSR_MIP,
> --
> 2.34.1
>
>

