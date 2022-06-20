Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o3Qzj-0001D7-6m
	for mharc-qemu-riscv@gnu.org; Mon, 20 Jun 2022 19:39:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1o3Qzh-0001Cq-Q1; Mon, 20 Jun 2022 19:39:45 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:46153)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1o3QzY-00015y-UE; Mon, 20 Jun 2022 19:39:45 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 h9-20020a17090a648900b001ecb8596e43so2478360pjj.5; 
 Mon, 20 Jun 2022 16:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jPqxI9P58vdAhZok3bo7O/Xj+Ph9uTygruutVQ/fpgA=;
 b=noKR7i7IkAQtrhZ52gIgS+tmHBcLPkoui7u//6LPfjeAU2oNVd++QGTm4xw9lp3bYl
 I+047bakfOTWZk5VloychGS26ddRPVzE6+rOlRhTDZWJ5UFoduoG/tXYGNRmoKN4+Zy2
 o+KcKncgBRp9YQaEThBdo2t3Mflm5UPssJEjp6v2hwV6KrK4VzKJjlXf2LKIZ0MQ8vxS
 IMzO/yQ4tRmkd9x3aDtcd5usr6qfVCAroOwpfX+A3SYc/W7WbRE2HpIf5m0NUqmRZOPD
 PSC1xxZEYDfzaaGDZteMWKs3rAdueEmzMXRCAlG2J2j+UTxgW/C1BOsp+2n5ZsePV5ZS
 rxtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jPqxI9P58vdAhZok3bo7O/Xj+Ph9uTygruutVQ/fpgA=;
 b=7o7jHv5eWXgvaKavECzlnzs2Ts0yueWQah3HY1lF4nXD+zIjE4Zdrcojd8ZPPIWAZx
 c1lUqxjcp7ypGWtRDBUKGXxjZB/ingxSVT9i//mAiJXClRJtb0Hct5ndBZHR0wgL7XDq
 zbJLNt03oVpnYs1IM9wJ7sn38Ojj5YWbhURRO3j6iyVJb5fPBwEPnXHlRaUKvmrHcpdZ
 lYiQv15phUinUMm2RwQ/UEn7nLOb1gy7zHj5WYpJ4UOJRf4eUFMOfqudrSl4y87BTAw1
 cVK3jjDu/QzWri8zh9nB5CxKmMx8AmszR2wMoODy7Te8d7ah+tpiI/1YpzR3jQ1tfdqr
 fMrw==
X-Gm-Message-State: AJIora+DA8Cl7YlazyQ8bH/W96Z0hPt3Ems7H66WheM735FJST7XdOwa
 mVIbq5flK0MPs4ZJhWspY+mxzy6Cf0WVCf4rBkw=
X-Google-Smtp-Source: AGRyM1tmyh/jbbsg/wSEOhz+B0x5St2dODpQrRX3gPbVh7tZeiWxR8NgyDCI8e4VQGYdvPzt6REitUQZkYDSAllvW0M=
X-Received: by 2002:a17:90a:7e82:b0:1ec:9d45:7759 with SMTP id
 j2-20020a17090a7e8200b001ec9d457759mr10939019pjl.166.1655768369700; Mon, 20
 Jun 2022 16:39:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220609044046.1903865-1-daolu@rivosinc.com>
 <20220609044046.1903865-2-daolu@rivosinc.com>
In-Reply-To: <20220609044046.1903865-2-daolu@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 21 Jun 2022 09:39:02 +1000
Message-ID: <CAKmqyKN91QyYdhse0jUTGCX1i31tPuKpxBk46qJQVur4+50_tA@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] target/riscv: Add Zihintpause support
To: Dao Lu <daolu@rivosinc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Heiko Stuebner <heiko@sntech.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=alistair23@gmail.com; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 20 Jun 2022 23:39:46 -0000

On Thu, Jun 9, 2022 at 2:42 PM Dao Lu <daolu@rivosinc.com> wrote:
>
> Added support for RISC-V PAUSE instruction from Zihintpause extension,
> enabled by default.
>
> Tested-by: Heiko Stuebner <heiko@sntech.de>
> Signed-off-by: Dao Lu <daolu@rivosinc.com>
> ---
>  target/riscv/cpu.c                      |  2 ++
>  target/riscv/cpu.h                      |  1 +
>  target/riscv/insn32.decode              |  7 ++++++-
>  target/riscv/insn_trans/trans_rvi.c.inc | 18 ++++++++++++++++++
>  4 files changed, 27 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index ccacdee215..183fb37fdf 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -825,6 +825,7 @@ static Property riscv_cpu_properties[] = {
>      DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
>      DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
>      DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
> +    DEFINE_PROP_BOOL("Zihintpause", RISCVCPU, cfg.ext_zihintpause, true),
>      DEFINE_PROP_BOOL("Zfh", RISCVCPU, cfg.ext_zfh, false),
>      DEFINE_PROP_BOOL("Zfhmin", RISCVCPU, cfg.ext_zfhmin, false),
>      DEFINE_PROP_BOOL("Zve32f", RISCVCPU, cfg.ext_zve32f, false),
> @@ -996,6 +997,7 @@ static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str, int max_str_len)
>       *    extensions by an underscore.
>       */
>      struct isa_ext_data isa_edata_arr[] = {
> +        ISA_EDATA_ENTRY(zihintpause, ext_zihintpause),
>          ISA_EDATA_ENTRY(zfh, ext_zfh),
>          ISA_EDATA_ENTRY(zfhmin, ext_zfhmin),
>          ISA_EDATA_ENTRY(zfinx, ext_zfinx),
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index fe6c9a2c92..e466a04a59 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -394,6 +394,7 @@ struct RISCVCPUConfig {
>      bool ext_counters;
>      bool ext_ifencei;
>      bool ext_icsr;
> +    bool ext_zihintpause;
>      bool ext_svinval;
>      bool ext_svnapot;
>      bool ext_svpbmt;
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index 4033565393..595fdcdad8 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -149,7 +149,12 @@ srl      0000000 .....    ..... 101 ..... 0110011 @r
>  sra      0100000 .....    ..... 101 ..... 0110011 @r
>  or       0000000 .....    ..... 110 ..... 0110011 @r
>  and      0000000 .....    ..... 111 ..... 0110011 @r
> -fence    ---- pred:4 succ:4 ----- 000 ----- 0001111
> +
> +{
> +  pause  0000 0001   0000   00000 000 00000 0001111
> +  fence  ---- pred:4 succ:4 ----- 000 ----- 0001111
> +}
> +
>  fence_i  ---- ----   ----   ----- 001 ----- 0001111
>  csrrw    ............     ..... 001 ..... 1110011 @csr
>  csrrs    ............     ..... 010 ..... 1110011 @csr
> diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
> index f1342f30f8..ca75e05f4b 100644
> --- a/target/riscv/insn_trans/trans_rvi.c.inc
> +++ b/target/riscv/insn_trans/trans_rvi.c.inc
> @@ -796,6 +796,24 @@ static bool trans_srad(DisasContext *ctx, arg_srad *a)
>      return gen_shift(ctx, a, EXT_SIGN, tcg_gen_sar_tl, NULL);
>  }
>
> +static bool trans_pause(DisasContext *ctx, arg_pause *a)
> +{
> +    if (!ctx->cfg_ptr->ext_zihintpause) {
> +        return false;
> +    }
> +
> +    /*
> +     * PAUSE is a no-op in QEMU,
> +     * however we need to clear the reservation,
> +     * end the TB and return to main loop
> +     */
> +    tcg_gen_movi_tl(load_res, -1);

I'm not clear why we need to clear the load_res? We don't do it for
fence instruction

Alistair

> +    gen_set_pc_imm(ctx, ctx->pc_succ_insn);
> +    tcg_gen_exit_tb(NULL, 0);
> +    ctx->base.is_jmp = DISAS_NORETURN;
> +
> +    return true;
> +}
>
>  static bool trans_fence(DisasContext *ctx, arg_fence *a)
>  {
> --
> 2.25.1
>
>

