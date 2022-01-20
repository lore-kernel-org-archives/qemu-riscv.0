Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nAewF-000449-Vw
	for mharc-qemu-riscv@gnu.org; Thu, 20 Jan 2022 16:25:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nAew4-00040P-Fm; Thu, 20 Jan 2022 16:25:42 -0500
Received: from [2607:f8b0:4864:20::d29] (port=46998
 helo=mail-io1-xd29.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nAew2-0001D1-G0; Thu, 20 Jan 2022 16:25:36 -0500
Received: by mail-io1-xd29.google.com with SMTP id e79so8520185iof.13;
 Thu, 20 Jan 2022 13:25:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=N6NdDlsT4VR150qUTSqG62HdtHP0SKXx6MdY/GhM+RM=;
 b=Jl2u7CIqbjW1CdQbWxBmxbNHLiy1pvLpfztxbzp/GMU8XAZbIjz5kU2jYP2BDmzNC2
 q12FIbdke2WpyC1OKJzwJuzNL+SJQA51xY28rFjm0WCuqnfMdAPrBg5p3R/Fxf5QxDLo
 SvBq+/K84OiBPwlEoEYxpdwvBGOT43NXbeE646DWkDdObdfvZ+d32iIYds8/yfYYJb7m
 Py8GipAs7P6zdRh3wM6kyqVGXDHjjt7/Tle4RrCOuwLiIi81LRlE6vixkJrFaP+u4pYP
 RMZFWuFFkLeFzYkqadHfPdeEve8OpLhah3CQQviFFAzpK5bBhdopDmuIbWsL7TcG1eHp
 AQqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=N6NdDlsT4VR150qUTSqG62HdtHP0SKXx6MdY/GhM+RM=;
 b=3ZVTUj6aZbgp8VTh38MTpSx6jNvbGaM1dwVfBptfRNe11b3rHrAOn8AO8E/wOFQdGp
 X0HJi3X73DoTksHQRgmtoMp5flNr+kFhha3m0M2/JXbLOxffrOZmNf/dLTrT6lCeKgfq
 loYhTpkoo1Rw3y33tkg/1UvSo561HLtq+IafYz+qORTnckUGZNbojBs1tIz71COtWLsl
 s7ERZLLNwC8g34yBsAercfL8z+AynoqlcO3D3pTqCa/onjwluPyR3qNjMv18/dWCsKR4
 X9bXbCbxf8UFw7srcC02jAygsgsoBqdszFXCg7vuAUNFGQQ5sYb13LgSxej9VERInIhA
 BUAQ==
X-Gm-Message-State: AOAM532nc1SByOBCiXJ23P3lFWEoYTSyaurZBv06VcC7TbaOEl3v6Aux
 va8CaccCQeDuqOkJDlD+ajec7rYlsDpDAIuiiNA=
X-Google-Smtp-Source: ABdhPJx761NIXnAXb+fNF2nB82datn5mQLNiOMniB1i5sEUpM5tCCLVr6j4Yz8jfwEf1moKZFA2VkpSH4uOdundWnZ4=
X-Received: by 2002:a02:a818:: with SMTP id f24mr327721jaj.125.1642713932978; 
 Thu, 20 Jan 2022 13:25:32 -0800 (PST)
MIME-Version: 1.0
References: <20220120122050.41546-1-zhiwei_liu@c-sky.com>
 <20220120122050.41546-22-zhiwei_liu@c-sky.com>
In-Reply-To: <20220120122050.41546-22-zhiwei_liu@c-sky.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 21 Jan 2022 07:25:06 +1000
Message-ID: <CAKmqyKMKJtErDpecNu1AfYbdwxWAVyJC48TSXDOFVON1SqU3xw@mail.gmail.com>
Subject: Re: [PATCH v8 21/23] target/riscv: Set default XLEN for hypervisor
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 guoren@linux.alibaba.com, Bin Meng <bin.meng@windriver.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d29
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d29;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd29.google.com
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
X-List-Received-Date: Thu, 20 Jan 2022 21:25:44 -0000

On Fri, Jan 21, 2022 at 3:16 AM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>
> When swap regs for hypervisor, the value of vsstatus or mstatus_hs
> should have the right XLEN. Otherwise, it will propagate to mstatus.
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index a120d474df..1cb0436187 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -422,6 +422,16 @@ static void riscv_cpu_reset(DeviceState *dev)
>           */
>          env->mstatus = set_field(env->mstatus, MSTATUS64_SXL, env->misa_mxl);
>          env->mstatus = set_field(env->mstatus, MSTATUS64_UXL, env->misa_mxl);
> +        if (riscv_has_ext(env, RVH)) {
> +            env->vsstatus = set_field(env->vsstatus,
> +                                      MSTATUS64_SXL, env->misa_mxl);
> +            env->vsstatus = set_field(env->vsstatus,
> +                                      MSTATUS64_UXL, env->misa_mxl);
> +            env->mstatus_hs = set_field(env->mstatus_hs,
> +                                        MSTATUS64_SXL, env->misa_mxl);
> +            env->mstatus_hs = set_field(env->mstatus_hs,
> +                                        MSTATUS64_UXL, env->misa_mxl);
> +        }
>      }
>      env->mcause = 0;
>      env->pc = env->resetvec;
> --
> 2.25.1
>
>

