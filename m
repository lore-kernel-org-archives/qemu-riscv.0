Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nF9KT-0003Iv-HB
	for mharc-qemu-riscv@gnu.org; Wed, 02 Feb 2022 01:41:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nF9Iy-0003Et-P8; Wed, 02 Feb 2022 01:40:29 -0500
Received: from [2607:f8b0:4864:20::130] (port=44892
 helo=mail-il1-x130.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nF9Il-0000ZP-IT; Wed, 02 Feb 2022 01:39:40 -0500
Received: by mail-il1-x130.google.com with SMTP id q11so8058234ild.11;
 Tue, 01 Feb 2022 22:39:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/e4Eu8RH67F4NV8x9qFUzHoXeWEBN+3hF6UOMldwYGM=;
 b=WVOywRk8vWxS0Bu4FDcvXuh9aEFfDsv9iIu1a07py4PiAAjd+kUxGKCNZVD5ehkX0o
 qd+cBtTIBwCBD9O4pXpXvBPPhtBYliKnS95bKskjd55D5yvoP9P3jLiMmIUYEGQVAlQL
 PFZ5bFNklrtHk18ncb+7GiaBrqQBHD3bVoh0neCxRtYt3iv5B5xxuUSbQY5H6pjAgTa0
 19579ecBmCKtayOBDlnvETKSJYvISzX++3unKrBW2RecUUGfr7DeswFZKfumD+JFKCC7
 KsUcUAwnh+YfePHYY8whv/L0kGRSVaXYsTQ2G/hwMd5hyYIYV6Zq5z7tHRTkfF6I+F4Y
 2LaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/e4Eu8RH67F4NV8x9qFUzHoXeWEBN+3hF6UOMldwYGM=;
 b=m1liAVCXZRK6XXVzHONfW04XLIr2XrT8dWvtFm8BxSHWugS1ArPe0I1YZNx2gppNF3
 zDZKuO6Chg0ZPGMipoVqHTVPlWHzsHa1kMk3ca+j+lv27myoVbKK4z1HrkhhHOjd9Zc1
 DUrxGEwjUeBZipaOsHRKyFapTPI1nxkqLJd97Wh1iC/cvBaeYQIe3g8NJYGTW0o7FYXc
 D62o7HJWqnqIuJ2WPNabNBwMGEsHsBM6/K/KFm4f9/s6vErNn3XuwyZ1LYU/c9a1kbPG
 TYP+V2iJYxLtQFbRwb5u6i3UISCIYXu8vWMfdCbbcZ5YkmMpAuL/ILiZv+LqLVfQnR1W
 xFHw==
X-Gm-Message-State: AOAM532WGdPfC6SFjrqq0HoCZdpnch9pU7nB+EPw/qp42FkqxpYcjCHn
 30RTh+puTP7jr2+sRK7g1n3iXeDmT3kP+R4mI/8=
X-Google-Smtp-Source: ABdhPJzRsTWENuT5uSlbQUZ7c0aNQuUYKj13Zq/OBeePH4ZZH1v6gi4QJtPQCCI34TaszHFgCgRoNzlay2OEdysbtOs=
X-Received: by 2002:a05:6e02:1ba7:: with SMTP id
 n7mr17525323ili.290.1643783945295; 
 Tue, 01 Feb 2022 22:39:05 -0800 (PST)
MIME-Version: 1.0
References: <20220201064601.41143-1-zhiwei_liu@c-sky.com>
In-Reply-To: <20220201064601.41143-1-zhiwei_liu@c-sky.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 2 Feb 2022 16:38:38 +1000
Message-ID: <CAKmqyKN0LtNwhtvgpCUO53Vr4t9EcJox4G2RPwT25n_pcs0VrA@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Fix vill field write in vtype
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::130
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::130;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x130.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Wed, 02 Feb 2022 06:41:02 -0000

On Tue, Feb 1, 2022 at 5:08 PM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>
> The guest should be able to set the vill bit as part of vsetvl.
>
> Currently we may set env->vill to 1 in the vsetvl helper, but there
> is nowhere that we set it to 0, so once it transitions to 1 it's stuck
> there until the system is reset.
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/vector_helper.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index 020d2e841f..3bd4aac9c9 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -71,6 +71,7 @@ target_ulong HELPER(vsetvl)(CPURISCVState *env, target_ulong s1,
>      env->vl = vl;
>      env->vtype = s2;
>      env->vstart = 0;
> +    env->vill = 0;
>      return vl;
>  }
>
> --
> 2.25.1
>
>

