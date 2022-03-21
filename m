Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nWBBd-0005cj-CS
	for mharc-qemu-riscv@gnu.org; Mon, 21 Mar 2022 02:06:37 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nWBBb-0005bg-QF; Mon, 21 Mar 2022 02:06:35 -0400
Received: from [2607:f8b0:4864:20::132] (port=43638
 helo=mail-il1-x132.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nWBBa-0002Ec-6X; Mon, 21 Mar 2022 02:06:35 -0400
Received: by mail-il1-x132.google.com with SMTP id d3so9710924ilr.10;
 Sun, 20 Mar 2022 23:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FoRNLXGA7EOnGhW5ilQEzNFlGp6gwMnBAKZcohLM9Z8=;
 b=FHCWj+I77XF13u9kDWscSuE99FCtZFiOcbyy1SQVVFoJwFT01Ke0BJoJMrG6OnsWgA
 4jwD55ukGxJX/lApmejkQ8QZIxDYtZkYqGw2B5C88cbeT291J/M2pXwXzsazaF3VsnUY
 DdneBxcR2iblte7TL2/+ZLjou47GyTGh5foaaRJkB6TxIw1YYeWsC6MQcmo+x3OHAOMU
 rEsQ+wyGhmNgrAMvcqUHuM6qmzcX6qFkupBrHmijhWfp5OlUU7lyVTbeLgxUX8ibCVX2
 Eag8bEGjNOuCP6M8tonneaa+AD2oXL5j4v4ML39gr5WqxUByf8JTpcnPTdvvSc4zviJh
 7HVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FoRNLXGA7EOnGhW5ilQEzNFlGp6gwMnBAKZcohLM9Z8=;
 b=j2Czr4bC6tbNHz+RHCfQ8q8dg4GHa+sj1e2UinmsgWr8dErTLd10ACgS2b/KeaVSPm
 EVBlzLiMOGZPNpV+mDxHVgZ/CLa3sJAyutF9nGg9PT/s0tvqrb2jLI3XOD/mU4mlpKCZ
 JoJWSJO8GL+vVmJO5Jievc04Ahnqfu7zD8BFIiHbNSMIEBs/li9SvpWrs6I3J9hDKn29
 ZsIpSpH5yxR3Rphyo9OTI2uXVQh3NHQ40/DLqN371K4pJDrAVmG7TW9OHastSn5xgVy/
 nxprmiCWOJ2+c555tr+eqN2zxdlmP5dy2s2quOJCO8pYcyF9drl/wUSKFFjlqiOdS32c
 YPTA==
X-Gm-Message-State: AOAM533tz+rdyKjGS8PyIeFRvpLpua0x9HrYC38R7QeceaGSJmHRqRo/
 rtGWD/EYRYDY2wOts+a4CYJ2UkH1j0IFQ4vZtOU=
X-Google-Smtp-Source: ABdhPJyHMxUhMvtdPfSlPEaKbVQGZkQYTF5VIU/3aYzhmcoTz89zFHh3lvougQNlFVzxaYdQPpaB6Yh36XraiHyoT08=
X-Received: by 2002:a05:6e02:c73:b0:2c8:2608:50e1 with SMTP id
 f19-20020a056e020c7300b002c8260850e1mr1878754ilj.310.1647842792784; Sun, 20
 Mar 2022 23:06:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220318041944.19859-1-liweiwei@iscas.ac.cn>
 <20220318041944.19859-11-liweiwei@iscas.ac.cn>
In-Reply-To: <20220318041944.19859-11-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 21 Mar 2022 16:06:07 +1000
Message-ID: <CAKmqyKNthKXZCjswvDMh1o+vKtFwnXcYwXC7mit1DcwARWW4nw@mail.gmail.com>
Subject: Re: [PATCH v9 10/14] target/riscv: rvk: add support for sha512
 related instructions for RV64 in zknh extension
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wangjunqiang <wangjunqiang@iscas.ac.cn>, 
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, luruibo2000@163.com, 
 lustrew@foxmail.com
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::132
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::132;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x132.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 21 Mar 2022 06:06:36 -0000

On Fri, Mar 18, 2022 at 2:26 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
>  - add sha512sum0, sha512sig0, sha512sum1 and sha512sig1 instructions
>
> Co-authored-by: Zewen Ye <lustrew@foxmail.com>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn32.decode              |  5 +++
>  target/riscv/insn_trans/trans_rvk.c.inc | 53 +++++++++++++++++++++++++
>  2 files changed, 58 insertions(+)
>
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index 02a0c71890..d9ebb138d1 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -868,3 +868,8 @@ sha512sig0l 01 01010 ..... ..... 000 ..... 0110011 @r
>  sha512sig0h 01 01110 ..... ..... 000 ..... 0110011 @r
>  sha512sig1l 01 01011 ..... ..... 000 ..... 0110011 @r
>  sha512sig1h 01 01111 ..... ..... 000 ..... 0110011 @r
> +# *** RV64 Zknh Standard Extension ***
> +sha512sig0  00 01000 00110 ..... 001 ..... 0010011 @r2
> +sha512sig1  00 01000 00111 ..... 001 ..... 0010011 @r2
> +sha512sum0  00 01000 00100 ..... 001 ..... 0010011 @r2
> +sha512sum1  00 01000 00101 ..... 001 ..... 0010011 @r2
> diff --git a/target/riscv/insn_trans/trans_rvk.c.inc b/target/riscv/insn_trans/trans_rvk.c.inc
> index bb89a53f52..b1ce4f27cf 100644
> --- a/target/riscv/insn_trans/trans_rvk.c.inc
> +++ b/target/riscv/insn_trans/trans_rvk.c.inc
> @@ -267,3 +267,56 @@ static bool trans_sha512sig1h(DisasContext *ctx, arg_sha512sig1h *a)
>      REQUIRE_ZKNH(ctx);
>      return gen_sha512h_rv32(ctx, a, EXT_NONE, tcg_gen_rotli_i64, 3, 6, 19);
>  }
> +
> +static bool gen_sha512_rv64(DisasContext *ctx, arg_r2 *a, DisasExtend ext,
> +                            void (*func)(TCGv_i64, TCGv_i64, int64_t),
> +                            int64_t num1, int64_t num2, int64_t num3)
> +{
> +    TCGv dest = dest_gpr(ctx, a->rd);
> +    TCGv src1 = get_gpr(ctx, a->rs1, ext);
> +    TCGv_i64 t0 = tcg_temp_new_i64();
> +    TCGv_i64 t1 = tcg_temp_new_i64();
> +    TCGv_i64 t2 = tcg_temp_new_i64();
> +
> +    tcg_gen_extu_tl_i64(t0, src1);
> +    tcg_gen_rotri_i64(t1, t0, num1);
> +    tcg_gen_rotri_i64(t2, t0, num2);
> +    tcg_gen_xor_i64(t1, t1, t2);
> +    func(t2, t0, num3);
> +    tcg_gen_xor_i64(t1, t1, t2);
> +    tcg_gen_trunc_i64_tl(dest, t1);
> +
> +    gen_set_gpr(ctx, a->rd, dest);
> +    tcg_temp_free_i64(t0);
> +    tcg_temp_free_i64(t1);
> +    tcg_temp_free_i64(t2);
> +    return true;
> +}
> +
> +static bool trans_sha512sig0(DisasContext *ctx, arg_sha512sig0 *a)
> +{
> +    REQUIRE_64BIT(ctx);
> +    REQUIRE_ZKNH(ctx);
> +    return gen_sha512_rv64(ctx, a, EXT_NONE, tcg_gen_shri_i64, 1, 8, 7);
> +}
> +
> +static bool trans_sha512sig1(DisasContext *ctx, arg_sha512sig1 *a)
> +{
> +    REQUIRE_64BIT(ctx);
> +    REQUIRE_ZKNH(ctx);
> +    return gen_sha512_rv64(ctx, a, EXT_NONE, tcg_gen_shri_i64, 19, 61, 6);
> +}
> +
> +static bool trans_sha512sum0(DisasContext *ctx, arg_sha512sum0 *a)
> +{
> +    REQUIRE_64BIT(ctx);
> +    REQUIRE_ZKNH(ctx);
> +    return gen_sha512_rv64(ctx, a, EXT_NONE, tcg_gen_rotri_i64, 28, 34, 39);
> +}
> +
> +static bool trans_sha512sum1(DisasContext *ctx, arg_sha512sum1 *a)
> +{
> +    REQUIRE_64BIT(ctx);
> +    REQUIRE_ZKNH(ctx);
> +    return gen_sha512_rv64(ctx, a, EXT_NONE, tcg_gen_rotri_i64, 14, 18, 41);
> +}
> --
> 2.17.1
>
>

