Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oEOKX-0005JT-Pr
	for mharc-qemu-riscv@gnu.org; Thu, 21 Jul 2022 01:02:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oEOKT-0005Ht-6l; Thu, 21 Jul 2022 01:02:30 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:42915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oEOKR-00006k-Et; Thu, 21 Jul 2022 01:02:28 -0400
Received: by mail-pl1-x62a.google.com with SMTP id d7so750302plr.9;
 Wed, 20 Jul 2022 22:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WUR8mankg3PDm0VT4HerseJCpDbs+TaTKGa5O/3DzKw=;
 b=bWsaOKuzJ/V7S2o0gEqo/yBYaatcVwa0zfcWuBeQAmL1cPcNpgwNjG7X/lXqmiPQ8w
 XKZVmce7h2Po/K50//ZDxz8Oej+bUq/cTKYZTc859vnpoRRknklJDtfWjUygBzAnCkhN
 BoDnPg6ps3TfsbNJZo5mS5Kmg9s3gXTepOl8nQnOMEhgIA5V8KYbe6P/7VccAMAcOQen
 2rGUP2bTZctWyD0IpK9XfrwkDICQXYid87IXmA2m+MlSpeEH/fICfcniPfmjin64EsDS
 TMG1uV0gCJmyE1LV6V4UTCvP7xMAwdwo5ZUmrnL+Zmpnng1bLfNZQsV3AMo4aAn4CdI8
 fqeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WUR8mankg3PDm0VT4HerseJCpDbs+TaTKGa5O/3DzKw=;
 b=7Gdg+Q+EIBHsOcFP0oGxuQUV7t7Vlh2DW7VinlLwE6GcGUrUYh0/t+b+SCGv8W+PzA
 SaGsk7ayxLUKewvZWD5LgAMfNjYbqK7gNqYhZkfUbJVEJjkYJzKRfEFm2/6OJYsrsd3J
 1ES+a7ulheADEVBjRYiJ++G67RWCAOMpvonkyd+YAG4Y/5ccBnkUyaBj9xtSSkEeiK7H
 KisQ/7XY7HHzGM+lZQWBefDRY00iNG1K5rKh5QjbwlFKORBWGQjqvy+5qOklfJjsYV7Y
 pCWKvUhv4FBJYEqjUWabA62yBN9p1QI6Z09PjR+SGuCZWgl83+a3TzC6MU+3vtiFGxGP
 zubQ==
X-Gm-Message-State: AJIora+4cahv2NYWEm5ca2509b625jrJWv/2sj2jtwqg4rvnU9MMconr
 9RTLB7yRxNZ935Ba4LdD+DxqP5sy2SgR4b0dtro=
X-Google-Smtp-Source: AGRyM1vf6nQsAP7CkwywhOkJrGxHBd/dZD5HwQ22WotENnAc9gcN7832dtV6VnWe8fr8+TH5In/6oL5jGL7NkrCL2ns=
X-Received: by 2002:a17:902:e5d1:b0:16b:ece4:79e6 with SMTP id
 u17-20020a170902e5d100b0016bece479e6mr42517901plf.83.1658379745507; Wed, 20
 Jul 2022 22:02:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220705174933.2898412-1-daolu@rivosinc.com>
 <20220705174933.2898412-2-daolu@rivosinc.com>
In-Reply-To: <20220705174933.2898412-2-daolu@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 21 Jul 2022 15:01:59 +1000
Message-ID: <CAKmqyKOgYEGVSZqnRQgbN_Ze2jxbvtcHwUcWF+orpG=bes3ERg@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] target/riscv: Add Zihintpause support
To: Dao Lu <daolu@rivosinc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Heiko Stuebner <heiko@sntech.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=alistair23@gmail.com; helo=mail-pl1-x62a.google.com
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
X-List-Received-Date: Thu, 21 Jul 2022 05:02:32 -0000

On Wed, Jul 6, 2022 at 3:50 AM Dao Lu <daolu@rivosinc.com> wrote:
>
> Added support for RISC-V PAUSE instruction from Zihintpause extension,
> enabled by default.
>
> Tested-by: Heiko Stuebner <heiko@sntech.de>
> Signed-off-by: Dao Lu <daolu@rivosinc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c                      |  2 ++
>  target/riscv/cpu.h                      |  1 +
>  target/riscv/insn32.decode              |  7 ++++++-
>  target/riscv/insn_trans/trans_rvi.c.inc | 16 ++++++++++++++++
>  4 files changed, 25 insertions(+), 1 deletion(-)
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
> index f1342f30f8..2fd07bc2e4 100644
> --- a/target/riscv/insn_trans/trans_rvi.c.inc
> +++ b/target/riscv/insn_trans/trans_rvi.c.inc
> @@ -796,6 +796,22 @@ static bool trans_srad(DisasContext *ctx, arg_srad *a)
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
> +     * end the TB and return to main loop
> +     */
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

