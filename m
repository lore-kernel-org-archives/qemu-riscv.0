Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1moybN-0005t5-7V
	for mharc-qemu-riscv@gnu.org; Sun, 21 Nov 2021 20:58:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1moybI-0005sV-R6; Sun, 21 Nov 2021 20:58:33 -0500
Received: from [2607:f8b0:4864:20::d36] (port=40564
 helo=mail-io1-xd36.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1moybH-00009e-49; Sun, 21 Nov 2021 20:58:32 -0500
Received: by mail-io1-xd36.google.com with SMTP id p23so21283358iod.7;
 Sun, 21 Nov 2021 17:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=u1Ygz5hQs1Cxb2pKI34tUnAvp8b3L7Iq85EX8qUfHF4=;
 b=JIXcVcqtu3U4zp4JLEDhMciG+L2ZGYNewNCYEpYcNHJCB0lKhrqxKZBD+9OHg/RoSX
 Adzo9UapQ+myj71zeXNOZF9QRl/zmXb4LNvuDjlURowg895pxfv6v0LT4SCns34Akk4C
 ++umMZhGkQyuMuVyjNeCi4Z4c/0x4FNkvFfpDaVsvs3wGsFp6qP9FAkLRJgfvLfx32Ru
 9ydyqsKyii9wxjPR+Whxwuw5s2dUEHhouFO7+9NmSagr1EXbXtCQW+9n/n6AUMeuuB5S
 pSWJtwsYoqnU5B6i3cLSUZhxRxyNLElu39j4x28u+l0rnuFnzXzOX5CZH7sVT58KpF5N
 6hHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=u1Ygz5hQs1Cxb2pKI34tUnAvp8b3L7Iq85EX8qUfHF4=;
 b=LoGPM0K+3wVqluEqiVyhVovJTiSMRPIH8KFv1elBBg7SyguOAmV41iRgVJtTtKV38X
 UqlvlUVA/6Ddv/Y2+1mgQqifIMv3seb6/i0VHkMuOi0Wi6lho8t//Z+SAYLXT6je+bZZ
 HcDqSJt8bPCGxMxbR3Q0q+HCzBPN98KVL8GTXGgTHE4wVJTip/wPNrtVe+uVzLsj823u
 FeEnZHxavPwutU1OG4PZIG65CZPRM9bKJB1SUhG0BXY5cdtU/+UDMbaycF/q7c9HX7pU
 S/aeYKtpUUMuAqNbQFIzBTTYqxKKvasGXuIEt9FJ/IjxJQOuibnn/QfbTrwslo42wHuI
 tU2Q==
X-Gm-Message-State: AOAM5303nkMJUlUftvN4r1RwTbr+o7TJSFugb75G1IZ45thSrjxCVIHW
 qkOV80aJQ+vPxBf1I9L6Ukd/jrrcvzQCUi0c0wk=
X-Google-Smtp-Source: ABdhPJz3g2Ha3q83kvyr3JQv/KF3jo+U4E66XHPCQcC9vfw2VrFKVmL2ywm/RXje+b+HZjSf8KlhHXKUaWPd+ex0k3k=
X-Received: by 2002:a05:6638:32a2:: with SMTP id
 f34mr44342976jav.63.1637546309727; 
 Sun, 21 Nov 2021 17:58:29 -0800 (PST)
MIME-Version: 1.0
References: <20211116080621.2521-1-liweiwei@iscas.ac.cn>
 <20211116080621.2521-2-liweiwei@iscas.ac.cn>
In-Reply-To: <20211116080621.2521-2-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 22 Nov 2021 11:58:03 +1000
Message-ID: <CAKmqyKPDJ801SFJTBYfkcKQ9B295J+TKoAiY=syduuKSw3pS7Q@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/7] target/riscv: rvk: add cfg properties for zbk*
 and zk*
To: liweiwei <liweiwei@iscas.ac.cn>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wangjunqiang <wangjunqiang@iscas.ac.cn>, lazyparser@gmail.com, 
 luruibo2000@163.com, lustrew@foxmail.com
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d36
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d36;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd36.google.com
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
X-List-Received-Date: Mon, 22 Nov 2021 01:58:33 -0000

On Tue, Nov 16, 2021 at 6:11 PM liweiwei <liweiwei@iscas.ac.cn> wrote:
>
> Signed-off-by: liweiwei <liweiwei@iscas.ac.cn>
> Signed-off-by: wangjunqiang <wangjunqiang@iscas.ac.cn>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 23 +++++++++++++++++++++++
>  target/riscv/cpu.h | 13 +++++++++++++
>  2 files changed, 36 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index f812998123..a5ec182a86 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -491,6 +491,29 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>              cpu->cfg.ext_d = true;
>          }
>
> +        if (cpu->cfg.ext_zk) {
> +            cpu->cfg.ext_zkn = true;
> +            cpu->cfg.ext_zkr = true;
> +            cpu->cfg.ext_zkt = true;
> +        }
> +
> +        if (cpu->cfg.ext_zkn) {
> +            cpu->cfg.ext_zbkb = true;
> +            cpu->cfg.ext_zbkc = true;
> +            cpu->cfg.ext_zbkx = true;
> +            cpu->cfg.ext_zkne = true;
> +            cpu->cfg.ext_zknd = true;
> +            cpu->cfg.ext_zknh = true;
> +        }
> +
> +        if (cpu->cfg.ext_zks) {
> +            cpu->cfg.ext_zbkb = true;
> +            cpu->cfg.ext_zbkc = true;
> +            cpu->cfg.ext_zbkx = true;
> +            cpu->cfg.ext_zksed = true;
> +            cpu->cfg.ext_zksh = true;
> +        }
> +
>          /* Set the ISA extensions, checks should have happened above */
>          if (cpu->cfg.ext_i) {
>              ext |= RVI;
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 0760c0af93..74e8be4847 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -308,7 +308,20 @@ struct RISCVCPU {
>          bool ext_zba;
>          bool ext_zbb;
>          bool ext_zbc;
> +        bool ext_zbkb;
> +        bool ext_zbkc;
> +        bool ext_zbkx;
>          bool ext_zbs;
> +        bool ext_zk;
> +        bool ext_zkn;
> +        bool ext_zknd;
> +        bool ext_zkne;
> +        bool ext_zknh;
> +        bool ext_zkr;
> +        bool ext_zks;
> +        bool ext_zksed;
> +        bool ext_zksh;
> +        bool ext_zkt;
>          bool ext_counters;
>          bool ext_ifencei;
>          bool ext_icsr;
> --
> 2.17.1
>
>

