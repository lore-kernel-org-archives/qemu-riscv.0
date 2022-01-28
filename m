Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nDJjJ-00025J-U9
	for mharc-qemu-riscv@gnu.org; Fri, 28 Jan 2022 00:23:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nDJjF-000248-Fm; Fri, 28 Jan 2022 00:23:22 -0500
Received: from [2607:f8b0:4864:20::d30] (port=45817
 helo=mail-io1-xd30.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nDJjD-0006ZK-T5; Fri, 28 Jan 2022 00:23:21 -0500
Received: by mail-io1-xd30.google.com with SMTP id s18so6399928ioa.12;
 Thu, 27 Jan 2022 21:23:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QhIG/ECTxvcC2ZjOERhrRIhE5u9ElhunErGFfFqbcmE=;
 b=SNpiBuvYQtgTl7rjOf6ASWFuaioapy0ts6+1JVANy4FBQm+4BFAq27rHhb9o4+KWXQ
 71swFrsH4wpt7DcATOIBiE0Tj/8KszOH8oyA+JvctnqK222g6Tm4JLYccbohB7p9qgkf
 4nAlHOYFZ8/8InQDoThP/aFyj1P33hVmW6kCogZ4ouebpgcWQog0XFgzOoAkkOjZlB5j
 ZiePq3KExlQsQlgabaXJM5abifgY9Eazce6ab6fGI5rK19S7Ov34w7zXyepaBFf76/Eo
 GoEbWd636toN4yFMC/CLxA/gTy8ceIo8PoyzuaRYRsbnEEG8c59MpA602mXsyg7wqoN8
 KOdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QhIG/ECTxvcC2ZjOERhrRIhE5u9ElhunErGFfFqbcmE=;
 b=xMboTHMv/3wxU/KgI8euCTDP3gdAhG9XAR8qb6LZ3wVXU086M1EMwXTYgAqYY+Fi1R
 4DtqespADQU5bUZyH9u/Zm92NY+5nRS4npSuLIINcje9ftWTDMGXXJhvo+/yYc6w9b7m
 hXu0S5XTq0ZMnp9ZUp3wDMKCthcaoFW0JgJH8z+ENYYss1J2r8NUEoqZQiFgVGX/Z1Th
 KOckEeyZFFUJqYGyoUDQaBUCEIqLmu5dXwAY7uczaYFo9sOuUNuPUGTsoOlj8gngrLRE
 RiI+tDoVTc4e0iKG2NeZZOV5w6mWHAnkMU0B39p7SN7NqXuVwhW/Xugq/BivlVQo03JZ
 +nEg==
X-Gm-Message-State: AOAM530tJk9yWAAijlG4HPMxlosgxTgEr1q7fIVx6i24T3y0bhkZFuSQ
 X3Ea93odb/O29WW8uMqHlq+PC0tQ9IOIYvb9dnY=
X-Google-Smtp-Source: ABdhPJzvDL4VESOE4gMIWr1X4sQXTC7CNqDHKNs/KQWghsJrduSAEEXf/7R0aBY7KMu11f+QkZnVILpgo7BsBa4lZlY=
X-Received: by 2002:a02:3b2d:: with SMTP id c45mr3802559jaa.125.1643347398526; 
 Thu, 27 Jan 2022 21:23:18 -0800 (PST)
MIME-Version: 1.0
References: <20220113014959.21429-1-liweiwei@iscas.ac.cn>
 <20220113014959.21429-2-liweiwei@iscas.ac.cn>
In-Reply-To: <20220113014959.21429-2-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 28 Jan 2022 15:22:52 +1000
Message-ID: <CAKmqyKN9uSd9Bd063S6nmwo+RCassbuyOn0isUStcQD4b1orEQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/6] target/riscv: add cfg properties for zfinx, zdinx
 and zhinx{min}
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wangjunqiang <wangjunqiang@iscas.ac.cn>, 
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, ardxwe@gmail.com
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
X-List-Received-Date: Fri, 28 Jan 2022 05:23:23 -0000

On Thu, Jan 13, 2022 at 11:51 AM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
> Co-authored-by: ardxwe <ardxwe@gmail.com>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c       | 12 ++++++++++++
>  target/riscv/cpu.h       |  4 ++++
>  target/riscv/translate.c |  8 ++++++++
>  3 files changed, 24 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 9bc25d3055..fc3ec5bca1 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -518,6 +518,11 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>              cpu->cfg.ext_d = true;
>          }
>
> +        if (cpu->cfg.ext_zdinx || cpu->cfg.ext_zhinx ||
> +            cpu->cfg.ext_zhinxmin) {
> +            cpu->cfg.ext_zfinx = true;
> +        }
> +
>          /* Set the ISA extensions, checks should have happened above */
>          if (cpu->cfg.ext_i) {
>              ext |= RVI;
> @@ -592,6 +597,13 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>          if (cpu->cfg.ext_j) {
>              ext |= RVJ;
>          }
> +        if (cpu->cfg.ext_zfinx && ((ext & (RVF | RVD)) || cpu->cfg.ext_zfh ||
> +                                   cpu->cfg.ext_zfhmin)) {
> +            error_setg(errp,
> +                    "'Zfinx' cannot be supported together with 'F', 'D', 'Zfh',"
> +                    " 'Zfhmin'");
> +            return;
> +        }
>
>          set_misa(env, env->misa_mxl, ext);
>      }
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 4d63086765..b202bcbeff 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -327,8 +327,12 @@ struct RISCVCPU {
>          bool ext_counters;
>          bool ext_ifencei;
>          bool ext_icsr;
> +        bool ext_zdinx;
>          bool ext_zfh;
>          bool ext_zfhmin;
> +        bool ext_zfinx;
> +        bool ext_zhinx;
> +        bool ext_zhinxmin;
>
>          char *priv_spec;
>          char *user_spec;
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 615048ec87..9687fa3e7c 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -77,8 +77,12 @@ typedef struct DisasContext {
>      RISCVMXL ol;
>      bool virt_enabled;
>      bool ext_ifencei;
> +    bool ext_zdinx;
>      bool ext_zfh;
>      bool ext_zfhmin;
> +    bool ext_zfinx;
> +    bool ext_zhinx;
> +    bool ext_zhinxmin;
>      bool hlsx;
>      /* vector extension */
>      bool vill;
> @@ -892,8 +896,12 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>      ctx->misa_ext = env->misa_ext;
>      ctx->frm = -1;  /* unknown rounding mode */
>      ctx->ext_ifencei = cpu->cfg.ext_ifencei;
> +    ctx->ext_zdinx = cpu->cfg.ext_zdinx;
>      ctx->ext_zfh = cpu->cfg.ext_zfh;
>      ctx->ext_zfhmin = cpu->cfg.ext_zfhmin;
> +    ctx->ext_zfinx = cpu->cfg.ext_zfinx;
> +    ctx->ext_zhinx = cpu->cfg.ext_zhinx;
> +    ctx->ext_zhinxmin = cpu->cfg.ext_zhinxmin;
>      ctx->vlen = cpu->cfg.vlen;
>      ctx->elen = cpu->cfg.elen;
>      ctx->mstatus_hs_fs = FIELD_EX32(tb_flags, TB_FLAGS, MSTATUS_HS_FS);
> --
> 2.17.1
>
>

