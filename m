Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nqkzz-0003qU-BE
	for mharc-qemu-riscv@gnu.org; Mon, 16 May 2022 20:23:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nqkzx-0003pO-7i; Mon, 16 May 2022 20:23:37 -0400
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c]:41854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nqkzv-0008AP-EZ; Mon, 16 May 2022 20:23:36 -0400
Received: by mail-io1-xd2c.google.com with SMTP id z26so17743939iot.8;
 Mon, 16 May 2022 17:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qz/xf43qg3cdOdK2ZPZ9YxGgf2K4wjWTTuXe8TxNsGI=;
 b=gTwQLQSxYXODyKVskekT1kwrp8SX1nzZaLW5/VQQlJlC+8Wqtf9lJcv2NBlDJNzI3B
 f1y3Y52zrnly4DFyUataum8hdqLgObbKhLJT+FUgCkIZ0qxJM4lkG8yvgSza3wH4SOHR
 1Y3Y1E3qKrtma+rWM+bqqhRtZ/DgOPX7XjHfX4gOEjI7bB6ili/YPq+5uGmQTxDd9Z24
 iskqr/PbSGP0HcYgrgeVXu8PxEFujYNF7nckrVd69Vig4tJRgZMnPaGr8D+ZjtOiTlUS
 8xn8gxAZ4aX8HOMJL9dFYcmThfDK0V6lbLLTrBu6Orjk6GfvQjbpAjdaruRjxabHeEUA
 Keyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qz/xf43qg3cdOdK2ZPZ9YxGgf2K4wjWTTuXe8TxNsGI=;
 b=H2/cVm3/xvuNMOZx41Z6ly+6JH6Y+tCJFS6BWcT8n7Ll55x5J51zupubuwjJIJgOSL
 DTlDWcCuEJQXAUMZ89Blak5sSni3tm5C2l/ZkAoCafD1ERz0f/zPK49rnhkvj11n/plT
 pDKZ0a241tSysEafB6JJNsU6fM5Og1nkO4MC6dSz7K3P/jnBqXmt027hasOKq7+jHwoF
 sB+hQaSB0mxPt1tP2X9TpyeChhr428PLpA6qmbliBh6yC068dB/pgVyTpT2mmPViva3P
 gzIbCKWso6sy4SR66lLWH9HomT92t6q7y3zT3Ytat8pueM4YRU6gmE/joq1RNO44UJDw
 SPJw==
X-Gm-Message-State: AOAM5314qkbZQnLo0Ozc0ez7lffMFMYsS8i3UQu/0OQEbdPkmrwjwQ8z
 8Hmt2cVhD1J+h4dtSZa2cqFjIOejxr0qC0LnuNs=
X-Google-Smtp-Source: ABdhPJxXF5+Zcvb5cj/05qbAU7EhNDF5CWTs8wJLChja+gLsS8vSw598qGnjOJ0hzrj+Ml9YnuHlMvRH4rbogMt3gUE=
X-Received: by 2002:a5d:9818:0:b0:65b:ae2:863e with SMTP id
 a24-20020a5d9818000000b0065b0ae2863emr9080503iol.31.1652747013848; Mon, 16
 May 2022 17:23:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220516033357.12371-1-liweiwei@iscas.ac.cn>
In-Reply-To: <20220516033357.12371-1-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 17 May 2022 10:23:08 +1000
Message-ID: <CAKmqyKPOs+-ZfO6iuXWdZDCuBTgrQEb6ySf8NPUgb2OBKfp_8A@mail.gmail.com>
Subject: Re: [PATCH 1/2] target/riscv: check 'I' and 'E' after checking 'G' in
 riscv_cpu_realize
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wangjunqiang <wangjunqiang@iscas.ac.cn>, 
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2c.google.com
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
X-List-Received-Date: Tue, 17 May 2022 00:23:37 -0000

On Mon, May 16, 2022 at 1:36 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
>  - setting ext_g will implicitly set ext_i
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---
>  slirp              |  2 +-
>  target/riscv/cpu.c | 23 ++++++++++++-----------
>  2 files changed, 13 insertions(+), 12 deletions(-)
>
> diff --git a/slirp b/slirp
> index 9d59bb775d..a88d9ace23 160000
> --- a/slirp
> +++ b/slirp
> @@ -1 +1 @@
> -Subproject commit 9d59bb775d6294c8b447a88512f7bb43f12a25a8
> +Subproject commit a88d9ace234a24ce1c17189642ef9104799425e0

Looks like you accidentally included a submodule change

Alistair

> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index ccacdee215..b12f69c584 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -583,6 +583,18 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>      if (env->misa_ext == 0) {
>          uint32_t ext = 0;
>
> +        if (cpu->cfg.ext_g && !(cpu->cfg.ext_i & cpu->cfg.ext_m &
> +                                cpu->cfg.ext_a & cpu->cfg.ext_f &
> +                                cpu->cfg.ext_d)) {
> +            warn_report("Setting G will also set IMAFD");
> +            cpu->cfg.ext_i = true;
> +            cpu->cfg.ext_m = true;
> +            cpu->cfg.ext_a = true;
> +            cpu->cfg.ext_f = true;
> +            cpu->cfg.ext_d = true;
> +        }
> +
> +
>          /* Do some ISA extension error checking */
>          if (cpu->cfg.ext_i && cpu->cfg.ext_e) {
>              error_setg(errp,
> @@ -596,17 +608,6 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>              return;
>          }
>
> -        if (cpu->cfg.ext_g && !(cpu->cfg.ext_i & cpu->cfg.ext_m &
> -                                cpu->cfg.ext_a & cpu->cfg.ext_f &
> -                                cpu->cfg.ext_d)) {
> -            warn_report("Setting G will also set IMAFD");
> -            cpu->cfg.ext_i = true;
> -            cpu->cfg.ext_m = true;
> -            cpu->cfg.ext_a = true;
> -            cpu->cfg.ext_f = true;
> -            cpu->cfg.ext_d = true;
> -        }
> -
>          if (cpu->cfg.ext_zdinx || cpu->cfg.ext_zhinx ||
>              cpu->cfg.ext_zhinxmin) {
>              cpu->cfg.ext_zfinx = true;
> --
> 2.17.1
>
>

