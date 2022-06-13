Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o0Y4Z-0000hm-3b
	for mharc-qemu-riscv@gnu.org; Sun, 12 Jun 2022 20:36:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1o0Y4X-0000fk-Oa; Sun, 12 Jun 2022 20:36:49 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:35534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1o0Y4J-0004bf-Ah; Sun, 12 Jun 2022 20:36:49 -0400
Received: by mail-pl1-x62c.google.com with SMTP id o6so3810067plg.2;
 Sun, 12 Jun 2022 17:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IVLUC0C/88D7S8BL1aWmKcSVX3nSDGTJ48q64BFFa8I=;
 b=SHGL0FIvU0pmowK9YCGeS0dI2S9556YXaL386yVStwT6QuqaiRueowfh/BLp+n1awO
 jzAl8Dg+EPX3A+XADQqkO0mr/YHyxXohkHd+y+0dn0LtG1RMbINTo8dcgZkwsSyTeFIS
 AAEuJbzqFFJTmEqNv2EV8NhV+i1eM3rgz0ZmT7pegUPKa7NRFqcZnD7feaTM2p3MkZDI
 GNPSF0rJfNkkFDKYnH2spFeyMeBUJJjIC5r2UpUXXniRk/rLuaQjcm4dK60XR4OPlSjm
 h7pvklYo/Xafk7E1NXAUvqkdlYSFSvYAujM3eNndQMVQuo5iN0pgXnwir7jc4A3cXiFK
 HhbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IVLUC0C/88D7S8BL1aWmKcSVX3nSDGTJ48q64BFFa8I=;
 b=cxsIPwv7/sYUJG/nrxdzMFMdJSTESr4JnAXWalW2O1EWUkWS2SUo/3SfVsqJYYqKeZ
 P0XiTTmP6XjwriX+V1Su2ULgYW2hDOZ53Rl8++aO8m+L1tuYMNhyIgJZ+phufq1xFj5C
 lfe/0QymGkPNkTesDwQ4UhR9nnrcxayn/0bUUJnvT8hT9XzafptsYXnKpu9RDmNR5fyi
 fg9Fyq4upJbyWW3l+ZbNsqqPttgiA6cXeJl+PY0AhAyafvQ4KIuc10KWIV+WTZ2sP6B5
 iy8vttDUlhsf8/o2mMTYfe30+aJGu8tbDee+0utn4JNiXsmSy7I2D08gR4D5BUzHN23g
 xO+g==
X-Gm-Message-State: AOAM532vWgWlbFpXjxvt/JhR6C2wsL6tinTR2szX/KM+g1QQ6BFsfx9F
 kP0BLm4MbubBG8SdnvgHlXnSFyc6Rt4PDo16yS0FYAyeAgdXI3ur
X-Google-Smtp-Source: ABdhPJwR+fCSBOifwlPrOWepC4QEwoD5daaclCFLOOuxWGl6MUfjJcYComDIpDNd4bLdtpdqyuYhi3+nzoIP1nnq/Gs=
X-Received: by 2002:a17:902:d18c:b0:167:82d5:4710 with SMTP id
 m12-20020a170902d18c00b0016782d54710mr35911642plb.25.1655080593539; Sun, 12
 Jun 2022 17:36:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220609010724.104033-1-bmeng.cn@gmail.com>
 <20220609010724.104033-3-bmeng.cn@gmail.com>
In-Reply-To: <20220609010724.104033-3-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 13 Jun 2022 10:36:07 +1000
Message-ID: <CAKmqyKOf0bk=jce5vFLvrx-dH-f+QLCitneuf2BTEvuVtAa-9A@mail.gmail.com>
Subject: Re: [PATCH 3/3] target/riscv: Skip parsing extensions from properties
 for KVM
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=alistair23@gmail.com; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 13 Jun 2022 00:36:50 -0000

On Thu, Jun 9, 2022 at 11:11 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> When running with accel=kvm, the extensions are actually told by
> KVM, so let's skip the parsing logic from properties for KVM.
>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  target/riscv/cpu.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 61d1737741..ff911017c3 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -581,8 +581,11 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>      }
>      assert(env->misa_mxl_max == env->misa_mxl);
>
> -    /* If only MISA_EXT is unset for misa, then set it from properties */
> -    if (env->misa_ext == 0) {
> +    /*
> +     * If only MISA_EXT is unset for misa, then set it from properties.
> +     * For KVM, misa is told by KVM so properties are ignored.
> +     */
> +    if (!kvm_enabled() && env->misa_ext == 0) {
>          uint32_t ext = 0;
>
>          /* Do some ISA extension error checking */
> --
> 2.34.1
>
>

