Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nz0Og-0004a8-Uw
	for mharc-qemu-riscv@gnu.org; Wed, 08 Jun 2022 14:27:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daolu@rivosinc.com>)
 id 1nz0Of-0004Zu-AR
 for qemu-riscv@nongnu.org; Wed, 08 Jun 2022 14:27:13 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:41610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <daolu@rivosinc.com>)
 id 1nz0Od-0006d4-Ex
 for qemu-riscv@nongnu.org; Wed, 08 Jun 2022 14:27:13 -0400
Received: by mail-pg1-x52e.google.com with SMTP id e66so19655623pgc.8
 for <qemu-riscv@nongnu.org>; Wed, 08 Jun 2022 11:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h+cK2bmHugVi2+Zcs8bL9KFSSMF+F4Jl0zV7svOxDIM=;
 b=EJm61z27vYcEiWeqINOKHTITI3pAZFnRK8wLWiIU0k/v4et9fUz2klZFfOF5x5iwvS
 awJjG1aUpx/rqHULdM/8nrfWiFghcqGqaHnQaJUFOLyL3Kl1xuekY1zBwk3vXdIYqQDD
 Q5eo2Qemi8SYbDMwNMcM7HoALv3boDacfXM8tFxR86swc8tGNZYt/l32OCAYndwoF9oA
 8wgldVByXn1gNnbY+cp5XiToHqm5tMCx6bGwEa7X5FYaSfEjRSAjGnat+61td3AvGCJm
 l6FpPqRBwUhZCL118tVkmtdR1dmuVGX+r9O3Wsv7FpB1McxgBv87hwTLU8eJD+PbUYnS
 oT1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h+cK2bmHugVi2+Zcs8bL9KFSSMF+F4Jl0zV7svOxDIM=;
 b=ktxkxNRUfUSn2oSwQ9jkgn/+zJVgRbhTdGraFEztDyGFZcZR6eJEk83TZjFcFj1snY
 IVVAdw6Q5NyjnIC6TwKBycd9c/13Y3zlbfvPGJxZ8jND6xJ8fNabFIQu90n5bZ2Cs3xE
 FLIDGWa0QaAVkzjpym1+7tyxOWhEL8vb+9XCv2YcGBA+O+RCTqMQoNulaHzfbJK2/dF/
 qj6iuusS97+YYC1S2/9+E+5P4JZgOIPWQchT0pKpnmJsLwOUdy/1U67sawb/DA4RqtD0
 e03zivcKhyqA0ZTgQjNZcZcDM6tFd5L9K9u4KW35LKxJl0nwtm7Zc0NN1b6JzaFOAr36
 ZYtw==
X-Gm-Message-State: AOAM53344PSY3yHgYw/xwkghg11JHKhX37ql1KYDKMe4X/N7tk5lcyxP
 QvpyN+rVfY1PBkz31ny9isO88MTFxCQsrUBJmZg2kA==
X-Google-Smtp-Source: ABdhPJzKe0RQHkJyJYeUe12TK04uAGsAP0s/tbtrhbNudqvu2dyjfYOdf273S5P4Of++fZ4EHAK9OquJ49jpQ0+Skl0=
X-Received: by 2002:a05:6a00:2390:b0:51c:21e1:782 with SMTP id
 f16-20020a056a00239000b0051c21e10782mr15503004pfc.21.1654712829776; Wed, 08
 Jun 2022 11:27:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220608034454.1528469-1-daolu@rivosinc.com>
 <20220608034454.1528469-2-daolu@rivosinc.com>
In-Reply-To: <20220608034454.1528469-2-daolu@rivosinc.com>
From: Dao Lu <daolu@rivosinc.com>
Date: Wed, 8 Jun 2022 11:26:59 -0700
Message-ID: <CAKh7v-QoaNO57Pv-Z=qH_9WZaiYe5kyZk+W-Q6oBZeVud1Oncw@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] target/riscv: Add Zihintpause support
To: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, 
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Heiko Stuebner <heiko@sntech.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=daolu@rivosinc.com; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Wed, 08 Jun 2022 18:27:13 -0000

Please ignore, I have missed the commit message, will resend a v3.

Sorry about that.
Dao

On Tue, Jun 7, 2022 at 8:44 PM Dao Lu <daolu@rivosinc.com> wrote:
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

