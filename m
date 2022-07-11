Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oAm07-0007KV-RH
	for mharc-qemu-riscv@gnu.org; Mon, 11 Jul 2022 01:30:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oAlzj-0007Fr-Q4; Mon, 11 Jul 2022 01:30:08 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:45761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oAlzh-0003dj-Py; Mon, 11 Jul 2022 01:30:07 -0400
Received: by mail-pl1-x634.google.com with SMTP id d5so3530650plo.12;
 Sun, 10 Jul 2022 22:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ywcHVC464EgeAGOMLDv1E1ff1J4xAakoYAfTFnhfesk=;
 b=gR2kuAu2XnxpEgeJQn8LwTBueviaSQUud38A5z6KlPKzO9/9/5N2Lh1F872NFCxq+O
 nEpwgUFkTbCHsrRuxoCz2krSxeRKmZwKP48403DFIblLCmswR7oYAW1tROf7CMh+TH50
 OAHsQpZBEPbJg0CJVo50J7d1JZqgLqp+dlpj4eW6QZupohzo6l/YsoMzLT6i75/kWcwO
 iHY2XT600gYaoPBS69Cl7ek7SwbtBmkoOUNqdR6dh5bno5tFUujjHw2kRgEjYhwGqHFA
 tdTpSWdUZQMDPVRLrIfBAl+LvlhfDjqzhx6FEnRgdwShq899oTShdAcxBNrYkvslbQiI
 HLsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ywcHVC464EgeAGOMLDv1E1ff1J4xAakoYAfTFnhfesk=;
 b=xZr2gv9bVk9gAKjE8YPj7GIjq9cpNsrPrySXbInUmzltJOMzJEwqPEZ+xNopbufZGH
 IzmgK/NQjjzbGf+M4UPxSY3ycE38m9AEdDEW/Rnxlk0BaFFF+seluCNFYF7q6X4zAn0P
 +ojx+1ZSyZW6FnfGWi7xUyLTQWWl/c3UferlxflJGWpCSY/3JWVl0oR0lGKA2Uy4wHaK
 DOx/VJHUFcBMKmeKe8SBSt9YrElDtSzwKjQ9ErDz+kPugv8G25PQDj+lVax1UihK9A79
 xIUnxSw1tg0lSkxC/sWPrq1Y05rMeRf6s+KF06qyrM7ruKpnWTKwYlkRRm0FUwS3PiN3
 gQxA==
X-Gm-Message-State: AJIora+MHrEM+pZRUeVAZXnFocrPe3DaDTEV6Lh/QJ3XdS4vPifz0WWB
 3r94m0wIDqbkmkW/2PfWrJALoEVGfM/ZmAWe93k=
X-Google-Smtp-Source: AGRyM1uukRiuLfIN1Qx06PjrdmQbrs1TAnXvnx1hnOV2tTqAqd7Uqu0G/CL1HlEyj56dC0YCimJwX7r2DZpN8tP+a3g=
X-Received: by 2002:a17:902:b412:b0:16b:d846:77ee with SMTP id
 x18-20020a170902b41200b0016bd84677eemr15790323plr.25.1657517402333; Sun, 10
 Jul 2022 22:30:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220710082400.29224-1-liweiwei@iscas.ac.cn>
 <20220710082400.29224-3-liweiwei@iscas.ac.cn>
In-Reply-To: <20220710082400.29224-3-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 11 Jul 2022 15:29:36 +1000
Message-ID: <CAKmqyKOV6gzmj26nsr=4mZp4aukdskn0hBLU1Eo8JRKOhQSE-Q@mail.gmail.com>
Subject: Re: [PATCH 2/6] target/riscv: H extension depends on I extension
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wangjunqiang <wangjunqiang@iscas.ac.cn>, 
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=alistair23@gmail.com; helo=mail-pl1-x634.google.com
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
X-List-Received-Date: Mon, 11 Jul 2022 05:30:08 -0000

On Sun, Jul 10, 2022 at 6:24 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
> - add check for "H depends on an I base integer ISA with 32 x registers"
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 0dad6906bc..4e40f26e13 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -642,6 +642,12 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>              return;
>          }
>
> +        if (cpu->cfg.ext_h && !cpu->cfg.ext_i) {
> +            error_setg(errp,
> +                       "H depends on an I base integer ISA with 32 x registers");
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

