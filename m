Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mmTbL-0002yy-1U
	for mharc-qemu-riscv@gnu.org; Sun, 14 Nov 2021 23:28:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mmTbI-0002x3-6x; Sun, 14 Nov 2021 23:28:12 -0500
Received: from [2607:f8b0:4864:20::d2a] (port=36763
 helo=mail-io1-xd2a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mmTbG-0004y2-CJ; Sun, 14 Nov 2021 23:28:11 -0500
Received: by mail-io1-xd2a.google.com with SMTP id e144so19523945iof.3;
 Sun, 14 Nov 2021 20:28:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=R89Ni0G7INrK1R6F/KXxYYXIUazS58/T8c4vB0XqYOk=;
 b=VA2BxBKndHO/MuMs/8fjctBSvbylxuUH/b3e0+FKJ7M4WkH/+dvj7DGs7nhZmq5I4p
 fN0NkItxwaW+qhpNlobBEsuXRTHsWNivhpNd+sInyMeq5rDz3e65HMD4EB3TL7q7Z1qI
 9+DClY9fzHkl8YtJw+iJgnBCBK0opGa5/MJ4wSEqndCTV2Rp7P+o5rj5zJtuBlo0QT/5
 Xu9+mApoOBtbDHh7p2rTf18Y3HOXB1WFyhT4RRn8GWVZ1J7hto+SLaGY7/863/bBs7Ww
 tTaCIMXLU31HYJcsq1A9XTKGCsWv4V2oyd8J68appPphoKYxuHUcHeZ5tOp21cjeR/Z4
 r1Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=R89Ni0G7INrK1R6F/KXxYYXIUazS58/T8c4vB0XqYOk=;
 b=EtnqhAM73KX3m5T+XWeinF4nlvZSvjVVuI/xAKQdql7gi/PWhmz+LHBuGqxc+awL/g
 +0yJbVF2Sg0jFZmy6/tkuPOxjWxmFefQbwN0EOwSMU1g/7XlBr4sWEm3eTKlSEBiVA7X
 5up7rJ/auxiM2RZ1o++3E17j/YAnEnQZRhvCKcsEF0JjF25nMtOcnyOIkLnPWzedgxj7
 LyOAHn0KN/LQ5RYbUAw307nJljafrNh05MLVE4MCZwh4UdOPnKpXnl++86L9x5KNoRaZ
 RzyZp62JLasFsZqoJ8IY5kHDqOAVxjFhQv0WUCDO399fviW5saOft243xpKdyNFhK62L
 aIWw==
X-Gm-Message-State: AOAM5328gBm6kZuC250fUZjOrgpkpjF8UT9oVyORPrcA1Q6Gn3LL+tMW
 ZTjjf91n3S3G0AGeIMvOkQSCr6GwYaW7ffAFFxk=
X-Google-Smtp-Source: ABdhPJynpuFhOGv3+YqHGL5clyXEQMMEv5fvfYwA3zu8oT/IsVuZKcbXA+wLMN9Dyy10CnBYqUyp6OExLrEI/wEfPtA=
X-Received: by 2002:a02:a601:: with SMTP id c1mr26960016jam.114.1636950489080; 
 Sun, 14 Nov 2021 20:28:09 -0800 (PST)
MIME-Version: 1.0
References: <20211111155149.58172-1-zhiwei_liu@c-sky.com>
 <20211111155149.58172-4-zhiwei_liu@c-sky.com>
In-Reply-To: <20211111155149.58172-4-zhiwei_liu@c-sky.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 15 Nov 2021 14:27:43 +1000
Message-ID: <CAKmqyKOyV6R1YFTDsQGDTbU9ggBijGDgyD_2z-CC2jR44Cao-g@mail.gmail.com>
Subject: Re: [PATCH v4 03/20] target/riscv: Ignore the pc bits above XLEN
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2a.google.com
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
X-List-Received-Date: Mon, 15 Nov 2021 04:28:12 -0000

On Fri, Nov 12, 2021 at 1:54 AM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>
> The read from PC for translation is in cpu_get_tb_cpu_state, before translation.
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu_helper.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 9eeed38c7e..4c048cc266 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -70,8 +70,9 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
>                            target_ulong *cs_base, uint32_t *pflags)
>  {
>      uint32_t flags = 0;
> +    RISCVMXL xl = cpu_get_xl(env);
>
> -    *pc = env->pc;
> +    *pc = xl == MXL_RV32 ? env->pc & UINT32_MAX : env->pc;
>      *cs_base = 0;
>
>      if (riscv_has_ext(env, RVV)) {
> @@ -127,7 +128,7 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
>      }
>  #endif
>
> -    flags = FIELD_DP32(flags, TB_FLAGS, XL, cpu_get_xl(env));
> +    flags = FIELD_DP32(flags, TB_FLAGS, XL, xl);
>
>      *pflags = flags;
>  }
> --
> 2.25.1
>
>

