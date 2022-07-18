Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oDV3t-0001fP-8l
	for mharc-qemu-riscv@gnu.org; Mon, 18 Jul 2022 14:01:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daolu@rivosinc.com>)
 id 1oDV3r-0001aU-EU
 for qemu-riscv@nongnu.org; Mon, 18 Jul 2022 14:01:39 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:41650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <daolu@rivosinc.com>)
 id 1oDV3o-0007t3-5Z
 for qemu-riscv@nongnu.org; Mon, 18 Jul 2022 14:01:39 -0400
Received: by mail-pl1-x635.google.com with SMTP id j12so9732405plj.8
 for <qemu-riscv@nongnu.org>; Mon, 18 Jul 2022 11:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LWq7AZvjII4MS41D3TE30nRdQGH0barwX4pXUwhDyF4=;
 b=qbjqThGKvDgnWfsM20x9Ekp37ErnwfP4PEIZQ4LP7uL0O9vsTDPgHO5xO79+WtIsFB
 HXVG6p8y9sfIWaScNlef7gHYstRqlBSrlwnIIAchx3JiyfxebWuzeaKPnd+RMcZHOl15
 aX6tjb1pqsuGToMsBqE7m0MDC+llvjGwvshCdAiJhMm9H74lIuob08k0lSy6SyNI3IiU
 O1fLfiu+5M7cOxdk4pWMGO4pabIwb3JlPVw9SGyj8kGqJBoRLmKvISL1CPY9rcobbX6S
 AO25SKLwsa3OQLsgHl+g9ls2qetMfod8/sVLcM5DE3GXbAtMZy1Z7zLdJcCyCaNhImzP
 DZAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LWq7AZvjII4MS41D3TE30nRdQGH0barwX4pXUwhDyF4=;
 b=hwNU27xTBLs7o9j6VGWy3/YiUdwlgbLyiVZv8o/3RvxUqKyFrNWwIg33VC1mHWTYvn
 WUqU6he0nW5ysNaA9kMCdkak8QPVgOXdl1zBejNnr2QVXz/Cr2PReImLg+tIaag25wEs
 wN+APrZesw53TYlK8Pkurk8a4Xcgb+WmeIiN3w6mmyRH9eGnzRrIbgA3/M8B0PnwKb/T
 rqyNTPwzWzWg6D05owiHveFEnlu1qtn/H7jtjrJrKlq4MO3/ibfO/QwHl4y//qx++5aQ
 FC8qPTo4htT5FC1XZZOHiRxpPe2JvASXTOd4mzgMEIfL2byw1iVJPJ0rjkV3Nm+r21V7
 HPDw==
X-Gm-Message-State: AJIora+/qTzku8/uBDBG4GgXgpztxu66zbVD+OyX2PSwUPMK00CXDh72
 ofXWbOmjAr6ZencKj+TO8shsh7UtSIYSw359GXHL6w==
X-Google-Smtp-Source: AGRyM1vgZapPNFvkQTg2fgQyeGsjn2SxTUNNV2E8+KfGNufEqbUT4/ToRYAZBgHmGJVzcw7IVz2ckR+XB7mTlhcb4qY=
X-Received: by 2002:a17:902:6b02:b0:16c:3d67:8a8a with SMTP id
 o2-20020a1709026b0200b0016c3d678a8amr29516409plk.87.1658167293936; Mon, 18
 Jul 2022 11:01:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220705174933.2898412-1-daolu@rivosinc.com>
 <20220705174933.2898412-2-daolu@rivosinc.com>
In-Reply-To: <20220705174933.2898412-2-daolu@rivosinc.com>
From: Dao Lu <daolu@rivosinc.com>
Date: Mon, 18 Jul 2022 11:01:23 -0700
Message-ID: <CAKh7v-R_NmGyHXNL3cEvMu8rCHbJ_S9vkLsVRaiMjG6GHxcYbw@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] target/riscv: Add Zihintpause support
To: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, 
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Heiko Stuebner <heiko@sntech.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=daolu@rivosinc.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 18 Jul 2022 18:01:39 -0000

ping

On Tue, Jul 5, 2022 at 10:49 AM Dao Lu <daolu@rivosinc.com> wrote:
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

