Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1my3kb-0007vv-GS
	for mharc-qemu-riscv@gnu.org; Thu, 16 Dec 2021 22:17:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1my3kU-0007sN-VU; Thu, 16 Dec 2021 22:17:36 -0500
Received: from [2607:f8b0:4864:20::d30] (port=38690
 helo=mail-io1-xd30.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1my3kT-0007fO-F9; Thu, 16 Dec 2021 22:17:34 -0500
Received: by mail-io1-xd30.google.com with SMTP id z18so1152679iof.5;
 Thu, 16 Dec 2021 19:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BKHji+IkuyOpiN39efIMxEhXh4gUFKzskwRo2bL9pLE=;
 b=e6SB6betrXUQ66mNEntZbWfjvvewq1R0oj9L2Z3DEghAFgDg4CXPpYEE+MmUL/dzmd
 12zWXyqFWFfUu2i0oyH54alrrZFdvEsJKpGPq8BNQaQzu5RPcRCaKXvEIQWcQeYS8SmS
 WPb5og+9AsJbO1QEmB3aSUxPr87Gom1SFVWytAIohApXbbISbydfZ6seQtcnjgGvZdO1
 5aqb1nVpA+rsnHLtV/YoxsLd+1UsNcS/xLF+eyRCGUWzfXIvHGABwYaWt3BrcJJHor3A
 W66QFciUen4cl+pCph7S0Rs8eijBjrNsKfBdX5+9N7ZMe7DnnMTnfdttolQ7z5yFukbq
 4YPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BKHji+IkuyOpiN39efIMxEhXh4gUFKzskwRo2bL9pLE=;
 b=MIjT7WkC3FMgbzv/IS0T9zgoJuavwXbO7y1ATNWGzTvip0xjgk2DWETZ35LYm4GlZx
 mkIOUMBoKGpv3DzhL7HuXWWY1zdd6BicQetv/TdsIbNB1K+PClRtTQttF/MSwiJAjtpF
 etU8hoc7wtH3c5kGyPBfmv+Zk0zutGCQoS/EM0EqGRBZ4wl3r/DDoMc3TgXY1/L63UAd
 0tyUCUn/3PDFRnG+Ogb2sIaU3Uos2InKlSLB6esQqiiU+jfgVGEvrl23XBLRAXR8h7+T
 PBGEOEHikzwsE2SinC43Qb9lSTqcLVT7iNmOfFzogf8YtKjd4NSAyOrROqNoiJg9iwfi
 V+Kw==
X-Gm-Message-State: AOAM5313vbDtQkz8gkyRr3Vlawgt5mgm1czwlnUxBUpMXDM4mlTc8134
 93qC1bJZyIUxPiYp7Dxodwintt/8J64YfM1xCyY=
X-Google-Smtp-Source: ABdhPJy2zicmts1/gCcSWNmNCLMRRdfoR2Y/cqK9Ha7uq7SXOn17P5dHxC/fOIe9zSC+yVYKsIHNWnErFYh5vINlj10=
X-Received: by 2002:a05:6638:1395:: with SMTP id
 w21mr625940jad.125.1639711050489; 
 Thu, 16 Dec 2021 19:17:30 -0800 (PST)
MIME-Version: 1.0
References: <20211211041917.135345-1-anup.patel@wdc.com>
 <20211211041917.135345-9-anup.patel@wdc.com>
In-Reply-To: <20211211041917.135345-9-anup.patel@wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 17 Dec 2021 13:17:04 +1000
Message-ID: <CAKmqyKNZQPWV3dV5wQqs3fCxPT-_cAFmAdX53=jWBz1oztaShQ@mail.gmail.com>
Subject: Re: [PATCH v5 08/23] target/riscv: Allow AIA device emulation to set
 ireg rmw callback
To: Anup Patel <anup.patel@wdc.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, Anup Patel <anup@brainfault.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Atish Patra <atishp@atishpatra.org>, Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d30
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d30;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd30.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Fri, 17 Dec 2021 03:17:36 -0000

On Sat, Dec 11, 2021 at 2:26 PM Anup Patel <anup.patel@wdc.com> wrote:
>
> The AIA device emulation (such as AIA IMSIC) should be able to set
> (or provide) AIA ireg read-modify-write callback for each privilege
> level of a RISC-V HART.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.h        | 23 +++++++++++++++++++++++
>  target/riscv/cpu_helper.c | 14 ++++++++++++++
>  2 files changed, 37 insertions(+)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 6e5b6acd44..df1d792951 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -240,6 +240,22 @@ struct CPURISCVState {
>      uint64_t (*rdtime_fn)(uint32_t);
>      uint32_t rdtime_fn_arg;
>
> +    /* machine specific AIA ireg read-modify-write callback */
> +#define AIA_MAKE_IREG(__isel, __priv, __virt, __vgein, __xlen) \
> +    ((((__xlen) & 0xff) << 24) | \
> +     (((__vgein) & 0x3f) << 20) | \
> +     (((__virt) & 0x1) << 18) | \
> +     (((__priv) & 0x3) << 16) | \
> +     (__isel & 0xffff))
> +#define AIA_IREG_ISEL(__ireg)                  ((__ireg) & 0xffff)
> +#define AIA_IREG_PRIV(__ireg)                  (((__ireg) >> 16) & 0x3)
> +#define AIA_IREG_VIRT(__ireg)                  (((__ireg) >> 18) & 0x1)
> +#define AIA_IREG_VGEIN(__ireg)                 (((__ireg) >> 20) & 0x3f)
> +#define AIA_IREG_XLEN(__ireg)                  (((__ireg) >> 24) & 0xff)
> +    int (*aia_ireg_rmw_fn[4])(void *arg, target_ulong reg,
> +        target_ulong *val, target_ulong new_val, target_ulong write_mask);
> +    void *aia_ireg_rmw_fn_arg[4];
> +
>      /* True if in debugger mode.  */
>      bool debugger;
>
> @@ -391,6 +407,13 @@ uint32_t riscv_cpu_update_mip(RISCVCPU *cpu, uint32_t mask, uint32_t value);
>  #define BOOL_TO_MASK(x) (-!!(x)) /* helper for riscv_cpu_update_mip value */
>  void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t (*fn)(uint32_t),
>                               uint32_t arg);
> +void riscv_cpu_set_aia_ireg_rmw_fn(CPURISCVState *env, uint32_t priv,
> +                                   int (*rmw_fn)(void *arg,
> +                                                 target_ulong reg,
> +                                                 target_ulong *val,
> +                                                 target_ulong new_val,
> +                                                 target_ulong write_mask),
> +                                   void *rmw_fn_arg);
>  #endif
>  void riscv_cpu_set_mode(CPURISCVState *env, target_ulong newpriv);
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 1fa9f0e584..57c07ba1a4 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -364,6 +364,20 @@ void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t (*fn)(uint32_t),
>      env->rdtime_fn_arg = arg;
>  }
>
> +void riscv_cpu_set_aia_ireg_rmw_fn(CPURISCVState *env, uint32_t priv,
> +                                   int (*rmw_fn)(void *arg,
> +                                                 target_ulong reg,
> +                                                 target_ulong *val,
> +                                                 target_ulong new_val,
> +                                                 target_ulong write_mask),
> +                                   void *rmw_fn_arg)
> +{
> +    if (priv <= PRV_M) {
> +        env->aia_ireg_rmw_fn[priv] = rmw_fn;
> +        env->aia_ireg_rmw_fn_arg[priv] = rmw_fn_arg;
> +    }
> +}
> +
>  void riscv_cpu_set_mode(CPURISCVState *env, target_ulong newpriv)
>  {
>      if (newpriv > PRV_M) {
> --
> 2.25.1
>
>

