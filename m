Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nsvkC-0008I3-7g
	for mharc-qemu-riscv@gnu.org; Sun, 22 May 2022 20:16:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nsvk9-0008Hf-C3; Sun, 22 May 2022 20:16:17 -0400
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31]:37431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nsvk7-00067r-P3; Sun, 22 May 2022 20:16:17 -0400
Received: by mail-io1-xd31.google.com with SMTP id i74so7093077ioa.4;
 Sun, 22 May 2022 17:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XW8bWKRtISZen4ZfhpNG8IM+ji//aOWufaFx4UH8KwY=;
 b=gA8t7/DV+03tI0mrig8PgibQn56DI6GGYQayBD0s33qLDaoUDi0RaDwjxmEJWI3I2W
 fYhuHvIMBGDxJgEY08XMoijqr4ujIZQxXni0Gq2KSFanZsDtfIOQc/GdlYnentJi6dNP
 LHTyut2hYUA4o8bfLp7LOpIeTEd9SgyxcrWlHVxSzxQLOD5s3fAVn+kVmLGDeHP/d/ei
 To0RrxSly5HivBYSqudbc6BNXJ5/Ggi/idkQ5ev29pZRpmlYtxi94pA9gQyIVR9Ovhhn
 wMFKBSlrE8ztgwbkcoGFwX+q+4guG8jqQdEUqAHS8bD7Ysjjr/1dbwJavvfTv4eNAgaq
 zElA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XW8bWKRtISZen4ZfhpNG8IM+ji//aOWufaFx4UH8KwY=;
 b=4QtP2bx5h7f5Tpiabt0S5yI6kzl5crrfD1ZcYhuLqHyoZHXYPmmAkA5M8ohYvglNrU
 Bk4t+W0ACJpd+9GLoWEUyhJ5Ugnic++8UJ88A1lrzIkH0mVsb6nBJatSse4QdVxJJia0
 U1HHf0o3ex+5zJadsmV4VPQV8xyH6jmZf2ixvjmyigib0L5OjQCa3xlykx848vRGG40i
 J7DNNQNKXKq+X5tlGEEkXuUtOTFqw/RuiHA+vUhlBE5e/IIrd8OW60r58kzyzJVxHcZm
 xHHYjRLTQOiKYXCH95NVi1erqf1lPC3PJ/gto66sMiUZjgeSxCZtIpGM6BmMnH2IlnDN
 ZjGQ==
X-Gm-Message-State: AOAM532ejkEg2Wuhca58vWp0LoDMFtpTDAtL1K579n9NYWGAi4hEtmPE
 eAQd9wXNWpMXZuv+b6BBZuLUS3Os+EBbMnTRQ5U=
X-Google-Smtp-Source: ABdhPJx3phA/rBdaeH3Jlhsb1tNtxCaEpu01uOGmvke3L0lWCoLLliHQWH6VKiEnLgkyY7JHfYrc1SoVLAd03BPZcm8=
X-Received: by 2002:a5d:948a:0:b0:64d:23a4:9afa with SMTP id
 v10-20020a5d948a000000b0064d23a49afamr9044434ioj.114.1653264974282; Sun, 22
 May 2022 17:16:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220518012611.6772-1-liweiwei@iscas.ac.cn>
In-Reply-To: <20220518012611.6772-1-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 23 May 2022 10:15:48 +1000
Message-ID: <CAKmqyKM=hAAROy+1Rov6iRtPmcBoZYj3HVhq8wRYhbBz0tp42g@mail.gmail.com>
Subject: Re: [PATCH v4] target/riscv: check 'I' and 'E' after checking 'G' in
 riscv_cpu_realize
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wangjunqiang <wangjunqiang@iscas.ac.cn>, 
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d31;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd31.google.com
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
X-List-Received-Date: Mon, 23 May 2022 00:16:17 -0000

On Wed, May 18, 2022 at 11:27 AM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
>  - setting ext_g will implicitly set ext_i
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  target/riscv/cpu.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 6d01569cad..e373c61ba2 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -584,18 +584,6 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>          uint32_t ext = 0;
>
>          /* Do some ISA extension error checking */
> -        if (cpu->cfg.ext_i && cpu->cfg.ext_e) {
> -            error_setg(errp,
> -                       "I and E extensions are incompatible");
> -            return;
> -        }
> -
> -        if (!cpu->cfg.ext_i && !cpu->cfg.ext_e) {
> -            error_setg(errp,
> -                       "Either I or E extension must be set");
> -            return;
> -        }
> -
>          if (cpu->cfg.ext_g && !(cpu->cfg.ext_i && cpu->cfg.ext_m &&
>                                  cpu->cfg.ext_a && cpu->cfg.ext_f &&
>                                  cpu->cfg.ext_d &&
> @@ -610,6 +598,18 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>              cpu->cfg.ext_ifencei = true;
>          }
>
> +        if (cpu->cfg.ext_i && cpu->cfg.ext_e) {
> +            error_setg(errp,
> +                       "I and E extensions are incompatible");
> +            return;
> +        }
> +
> +        if (!cpu->cfg.ext_i && !cpu->cfg.ext_e) {
> +            error_setg(errp,
> +                       "Either I or E extension must be set");
> +            return;
> +        }
> +
>          if (cpu->cfg.ext_f && !cpu->cfg.ext_icsr) {
>              error_setg(errp, "F extension requires Zicsr");
>              return;
> --
> 2.17.1
>
>

