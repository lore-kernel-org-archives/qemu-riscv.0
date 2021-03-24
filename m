Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lP51E-0003U9-N0
	for mharc-qemu-riscv@gnu.org; Wed, 24 Mar 2021 11:02:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lP51C-0003Qo-W5; Wed, 24 Mar 2021 11:01:59 -0400
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729]:37604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lP51B-0008BL-5G; Wed, 24 Mar 2021 11:01:58 -0400
Received: by mail-qk1-x729.google.com with SMTP id g15so18310308qkl.4;
 Wed, 24 Mar 2021 08:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w2l/tX9K5T4/wKJhsUatQajQ52ONUR4EFX8qLEZUPKU=;
 b=R8OvE79XkeajDvGz/gC5gOh649bSznJIhvuZcwAq6cCIhGvlCF9KGHbhiCv0X0bMX0
 o96VCVCkWNwzEYYjfW+8wtu6GWWCWe5gHpZZNpleGvZz3O5Tjtkn1WsmHuVsBqDBpThO
 RUoT3a0jUe8JeuXbPJ6mNSHFY7ibbZHLcnJxiA1E6kDXU8fIlmKSEd7FfFDGtF/XSHLT
 jXZW6ZeusJ1fp4g9a/NRt/iz6Dp9ZIKVkfiJROVZkzS6yGCDNrN4e317Yptg/giwuiyH
 FzVas+H9Mgr42jxyqbmO91NjELUhNTuN/aCmhPUUvqIu23KWGR8fJBjKmyXyHrQQl0Ku
 lcrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w2l/tX9K5T4/wKJhsUatQajQ52ONUR4EFX8qLEZUPKU=;
 b=IdqQnhUi7CrTP/dAX1jKOlKQcKR/VPTHNC/MurwrXiaeSCBkaIGjpJouotq9vDBE5T
 Mgbj+Nh53IOaW3FdYyEkt2yYV+xWdyOwQCVpZ9OPShc6QfVeFjGsNBdvssyWvUYf6HuR
 RxFnqAQxq9pB/y3qkCLv2WHCa3lvi+0yWXvG9hDmlHcfypyyQ/Abozk3HgsSXjM5yr16
 m84nkiGBd9yVY+xfK/7VgiByM8IrZlJ7GgOO1esYfEngdtGPwRup8HKgZlgu6amCHDXz
 IvLZt80l9TmBzy+/2jrP2VoiHiCaEgcTS2wZJT8NNw7PrDaiU4vhrISRxqHLYO6K26m8
 OolA==
X-Gm-Message-State: AOAM530/+DjtCcv3mK0ihZobITUA0fG7MkYem5eN3dHJnqHIjj1eajGZ
 9DO1rHCzkk/Ndfx6Hk90RazGAt45IJzqMj23/IY=
X-Google-Smtp-Source: ABdhPJzmE7zX4k0eT83lX3e+VUYWhBzi/65Bg/NIui/q/R/fAoMJoBHfANHIS2bCgK1QiVfLL2ESQPMh9uR4cy3NIRQ=
X-Received: by 2002:a05:620a:1483:: with SMTP id
 w3mr3411006qkj.339.1616598114307; 
 Wed, 24 Mar 2021 08:01:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210323091409.1226-1-dylan@andestech.com>
In-Reply-To: <20210323091409.1226-1-dylan@andestech.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 24 Mar 2021 10:59:55 -0400
Message-ID: <CAKmqyKMTkDcO9_in28QSg7Spk=K9PdsSghUVJF4i1744fNdkYw@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Align the data type of reset vector address
To: Dylan Jhong <dylan@andestech.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 "Alan Quey-Liang Kao(((((((((()" <alankao@andestech.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 Alistair Francis <alistair.francis@wdc.com>, x5710999x@gmail.com, 
 "Ruinland Chuan-Tzu Tsa(((((((((()" <ruinland@andestech.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::729;
 envelope-from=alistair23@gmail.com; helo=mail-qk1-x729.google.com
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
X-List-Received-Date: Wed, 24 Mar 2021 15:01:59 -0000

On Tue, Mar 23, 2021 at 5:15 AM Dylan Jhong <dylan@andestech.com> wrote:
>
> Although the AE350 has not been upstream (preparing for v2),
> the reset vector of the AE350 is known to be at the 2G position,
> so this patch is corrected in advance.
>
> Signed-off-by: Dylan Jhong <dylan@andestech.com>
> Signed-off-by: Ruinland ChuanTzu Tsai <ruinland@andestech.com>
> ---
>  target/riscv/cpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 2a990f6253..0236abf169 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -137,7 +137,7 @@ static void set_feature(CPURISCVState *env, int feature)
>      env->features |= (1ULL << feature);
>  }
>
> -static void set_resetvec(CPURISCVState *env, int resetvec)
> +static void set_resetvec(CPURISCVState *env, uint64_t resetvec)

resetvec in env is a target_ulong so this should be as well (instead
of a uint64_t).

Alistair

>  {
>  #ifndef CONFIG_USER_ONLY
>      env->resetvec = resetvec;
> --
> 2.17.1
>
>

