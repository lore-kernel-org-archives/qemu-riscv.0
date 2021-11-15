Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mmTaZ-0001uw-5N
	for mharc-qemu-riscv@gnu.org; Sun, 14 Nov 2021 23:27:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mmTaW-0001pp-Fw; Sun, 14 Nov 2021 23:27:24 -0500
Received: from [2607:f8b0:4864:20::133] (port=36676
 helo=mail-il1-x133.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mmTaU-0004u9-PV; Sun, 14 Nov 2021 23:27:24 -0500
Received: by mail-il1-x133.google.com with SMTP id l8so15171701ilv.3;
 Sun, 14 Nov 2021 20:27:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lcZVYpr0tprsdis5Dl4IpuaeZgHeXqG3TY5d3qT/9Vo=;
 b=RYePsUiAezxgq/NMB7W4vWt2XLiBRCDH+aRB3u9AKJ8KWTctsErrX1w2gBMhew25Mo
 ElTGIcM8HzrDchnYWa/cdcS4ocZ188QuBWQwaWiduY5j1/BX/QenXlTS0HquFmhR7YCI
 s0YxbycgerZ6qhwFS3QYn9LTcH+WVPUQBODMTKjQOF6kA+ICuxHaKNm7d+cOlKDu+gtD
 MxuZFcPBuNbI5NinU0WOHbB6LXb1Pi5+z7Pgp2heX/ndfIrGsJ26oBNpiLxbGCQ0PxME
 dINDhIkcO5oidHzIrVXAmojmbbn4v6ia5jrve3UIqe3D5wcYMdRBRVdo4pMmBa06J7GP
 m2gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lcZVYpr0tprsdis5Dl4IpuaeZgHeXqG3TY5d3qT/9Vo=;
 b=nXhWsQ/T8cGm/tceFS0gCDCTw7QdvxXZr+24P3A4lIf/iFrYNcPPWu13Yg0t7n9jgI
 rX+So5HhElOJ4Wgej6CgU1ZYMXzb3ym+TX7zm32IDnZQC25uEVD5AsMbHt5X5bavmbLL
 brxOqW6YYONxFjqQEu3HozTDFof3hRFykBKqXR3po+WtObJ7HI+mC6KcwUUZJwLBMGOK
 vAaK8G9qrQsMYcJD+J0biZHUmLbV657TY3GJKTV0e9Xb9zTQqpoUqmm2+mIJ+tmw4Lyl
 ew5+MEe0QXqhu5qjtVLHl7ATu9/I1r/AcfBcdShtSZCjA/vnRfPo5U2V8QKEdyVjVYyN
 Zivg==
X-Gm-Message-State: AOAM530aAQDyFZ67l1SWt3Ha3vVELG3Kf+tOVuFc8CAQiVHGZ3Ib2vrg
 cckamJ17IUSIYisp+C2KYr0UvShzfH+gUWa97Zk=
X-Google-Smtp-Source: ABdhPJwIcALP3+fx0Zq+mU7PdRbndS0Pv9t7VKnMfm5ea26+mE8z13gR4xjorbmZW3howIF5b2ROy1GnEB/Prtc+kwQ=
X-Received: by 2002:a05:6e02:1a07:: with SMTP id
 s7mr20544582ild.290.1636950441510; 
 Sun, 14 Nov 2021 20:27:21 -0800 (PST)
MIME-Version: 1.0
References: <20211111155149.58172-1-zhiwei_liu@c-sky.com>
 <20211111155149.58172-3-zhiwei_liu@c-sky.com>
In-Reply-To: <20211111155149.58172-3-zhiwei_liu@c-sky.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 15 Nov 2021 14:26:55 +1000
Message-ID: <CAKmqyKMPLfoa5rYwAbNXXtduJh8=hF54ts4DdcStkxg+aMqG1A@mail.gmail.com>
Subject: Re: [PATCH v4 02/20] target/riscv: Sign extend pc for different XLEN
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::133
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::133;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x133.google.com
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
X-List-Received-Date: Mon, 15 Nov 2021 04:27:24 -0000

On Fri, Nov 12, 2021 at 1:56 AM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>
> When pc is written, it is sign-extended to fill the widest supported XLEN.
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/translate.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
>
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 1d57bc97b5..a6a73ced9e 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -150,16 +150,24 @@ static void gen_check_nanbox_s(TCGv_i64 out, TCGv_i64 in)
>      tcg_gen_movcond_i64(TCG_COND_GEU, out, in, t_max, in, t_nan);
>  }
>
> +static void gen_set_pc(DisasContext *ctx, target_ulong dest)
> +{
> +    if (get_xl(ctx) == MXL_RV32) {
> +        dest = (int32_t)dest;
> +    }
> +    tcg_gen_movi_tl(cpu_pc, dest);
> +}
> +
>  static void generate_exception(DisasContext *ctx, int excp)
>  {
> -    tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next);
> +    gen_set_pc(ctx, ctx->base.pc_next);
>      gen_helper_raise_exception(cpu_env, tcg_constant_i32(excp));
>      ctx->base.is_jmp = DISAS_NORETURN;
>  }
>
>  static void generate_exception_mtval(DisasContext *ctx, int excp)
>  {
> -    tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next);
> +    gen_set_pc(ctx, ctx->base.pc_next);
>      tcg_gen_st_tl(cpu_pc, cpu_env, offsetof(CPURISCVState, badaddr));
>      gen_helper_raise_exception(cpu_env, tcg_constant_i32(excp));
>      ctx->base.is_jmp = DISAS_NORETURN;
> @@ -179,10 +187,10 @@ static void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
>  {
>      if (translator_use_goto_tb(&ctx->base, dest)) {
>          tcg_gen_goto_tb(n);
> -        tcg_gen_movi_tl(cpu_pc, dest);
> +        gen_set_pc(ctx, dest);
>          tcg_gen_exit_tb(ctx->base.tb, n);
>      } else {
> -        tcg_gen_movi_tl(cpu_pc, dest);
> +        gen_set_pc(ctx, dest);
>          tcg_gen_lookup_and_goto_ptr();
>      }
>  }
> --
> 2.25.1
>
>

