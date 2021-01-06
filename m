Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kx6Uv-0001SD-UH
	for mharc-qemu-riscv@gnu.org; Wed, 06 Jan 2021 05:57:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kx6Uu-0001Rj-G7; Wed, 06 Jan 2021 05:57:00 -0500
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34]:37143)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kx6Us-0003GH-Sr; Wed, 06 Jan 2021 05:57:00 -0500
Received: by mail-yb1-xb34.google.com with SMTP id d37so2432313ybi.4;
 Wed, 06 Jan 2021 02:56:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=N3yJYBR2yWeyk4VMToBYP/yuZIZCnIfwVDqlAL/CFCA=;
 b=eA6d5BsszGSmQpnYaVHCo0KGlMMcXxLb+x4t73bAG03vu8pc4qNDZ47fD+kGZTD4zO
 bcN1tHuRVYFjjNGEehPFZJOUptRdwHS1vZDC10tNgQmNdfhyOtrBpwvT3iCsdpftMRVb
 RQFw+w7SnfrlRn1lGAybtOXTbzvDuUqj0fM23nUw64+0OLNQ3WxBu7uvAfbhwOe4cVGv
 0VJkU3w7cZihuJn6BUSW5wWc1zwwT+D/YvOFUL2Kct3PyEoGLIUwuUCDbKBzT7H8BITp
 MRA5/Ll0NhIirURakHa2ty0CLlMWZTv2yY7lc8pS2GK71vv3+vTqtmjX84sHwEl5VAeO
 cdqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=N3yJYBR2yWeyk4VMToBYP/yuZIZCnIfwVDqlAL/CFCA=;
 b=g8/JRQMr3V9pdIFB19CJ33X6Kr2p8gIPMRMyHRPSbI2FxLYF5cIUc0tMSX7L7yDstC
 Zmh6grAQZGbm/L2t4bacvMtbspyTtN3gFCrL4e0JiIaaf37LNhyAwedo+J1wJC9PnsLM
 f7OJoYuxDI5fXSHj6ZA29IOhdTLcPP4W35PYwh/w9zTA8xVXfxhrTTlcuvbG3csJoJzY
 WgRd+3+oua0IdMHgTtEeDTuKSiNR37aej/yLVa3/+fKypzbk2FJxrZpp4WjeSLHU11+E
 hrXLbiwR1eZ1A+vRQOg9a/zz/XqJLcaWHAp4PvVtZyf3079EEfN4L92v8AAomVAHZGSA
 RjEQ==
X-Gm-Message-State: AOAM532m1bva4L8M79mn3B8kGVFsI/v73wWHnTg/Vhqtg97GJSVoh8BV
 rsf+xWiNNhR+JT4h38gtTkQRhpdwthRiXky+9+g=
X-Google-Smtp-Source: ABdhPJyA+mDoAgv5GroTwbHRPwpWAnUxvLRhMAPzW8l2U0QfXC0xpKoiW4e+jG0Z9bBy1PG5e/Y+xfoPsw/aBFh5Pog=
X-Received: by 2002:a25:2041:: with SMTP id g62mr5592448ybg.152.1609930614236; 
 Wed, 06 Jan 2021 02:56:54 -0800 (PST)
MIME-Version: 1.0
References: <20210106103254.35615-1-sylvain.pelissier@gmail.com>
In-Reply-To: <20210106103254.35615-1-sylvain.pelissier@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 6 Jan 2021 18:56:43 +0800
Message-ID: <CAEUhbmWZn98AR4x1Hp+gh0dZbLdk1RB9U0dTCi=k56c4ZePOiA@mail.gmail.com>
Subject: Re: [PATCH v3] gdb: riscv: Add target description
To: Sylvain Pelissier <sylvain.pelissier@gmail.com>
Cc: "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Wed, 06 Jan 2021 10:57:00 -0000

Hi Sylvain,

On Wed, Jan 6, 2021 at 6:34 PM Sylvain Pelissier
<sylvain.pelissier@gmail.com> wrote:
>
> Target description is not currently implemented in RISC-V architecture. Thus GDB won't set it properly when attached. The patch implements the target description response.

Please limit the commit message in less than 70 characters per line.

>
> Signed-off-by: Sylvain Pelissier <sylvain.pelissier@gmail.com>
> ---
>  target/riscv/cpu.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 254cd83f8b..ed4971978b 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -556,6 +556,18 @@ static Property riscv_cpu_properties[] = {
>      DEFINE_PROP_END_OF_LIST(),
>  };
>
> +static gchar *riscv_gdb_arch_name(CPUState *cs)
> +{
> +    RISCVCPU *cpu = RISCV_CPU(cs);
> +    CPURISCVState *env = &cpu->env;
> +
> +    if (riscv_cpu_is_32bit(env)) {
> +        return g_strdup("riscv:rv32");
> +    } else {
> +        return g_strdup("riscv:rv64");
> +    }
> +}
> +

Regards,
Bin

