Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nSZUB-0006rf-KH
	for mharc-qemu-riscv@gnu.org; Fri, 11 Mar 2022 02:14:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nSZU9-0006od-DS; Fri, 11 Mar 2022 02:14:49 -0500
Received: from [2607:f8b0:4864:20::12c] (port=37829
 helo=mail-il1-x12c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nSZU7-00064e-9m; Fri, 11 Mar 2022 02:14:48 -0500
Received: by mail-il1-x12c.google.com with SMTP id j29so5400378ila.4;
 Thu, 10 Mar 2022 23:14:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fb4RMpQdI11GTLJ+5IjzyChRL6lwFloiycOPCuKl/C8=;
 b=hBAIjDkqFTD1O18BS16AEElhItM0Re+lKPrVHvpThGI+Akxc8XE3MIPV+a9Mni//qp
 nXyoJkX71iZ3hyhKgnO7RzD+be9Ny8jV2ZMSG2nZ7TN1MixJZfD9Qrqfl7jBM5kPqlOE
 KEgpdlPewMLjrAhh5UAzFqNtHscu7TY+K/X6QxlfCjwk43CyX5o7R1fepm3IigV2X1CO
 VncFtJkFlg5TspyypNcLt4TtEdI8ox1oObW+p0CM5MkWIYm38O2YwqfUEuK2bfjLgzs1
 aRQrNeB8kurBLfTZ6JwuRXn5YWwOuSRqe12Eq9y75t5Khbw6cwbOLiszTJ+MhohbVivX
 +C2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fb4RMpQdI11GTLJ+5IjzyChRL6lwFloiycOPCuKl/C8=;
 b=0HmJEHI65Tl82MiSOYvoGytmnhcoVplQZW8hgb4atw6q6XI6dovekcrx0A7cGMqbkq
 8QuN864UunjpRfKvqjktPD5QE6LT3qVFF38v52C8GxGA0/OmMhnJpPltb7Z2uHVp2NCZ
 JnBe+fmMWvwMTZDt+G7LZy368CaNnVr+ToDwRgubmSAppDIvJeS3vg8S1hbzoNI5Js1H
 J+Ib2+GJx4k2TizH5/a0U5gh1bLE6um6pm/kBLNDRTIJks0bX15vk8YeiSGHuWxee2tF
 znb1mI5ZyTraLcvWhnLVVXrYsoSB6ZD8FJyudVqXE5hwzBnH4xcXqaHNWSlr8lVFUsyQ
 SZWw==
X-Gm-Message-State: AOAM532jWYSrXh/7iD1R1VT7oA2ImCHhiyztYy2s6NKmyf/yhG+hrtbK
 1L37CkSv43ngJb+saD+hzQG7KLkOahmCQDp6/OI=
X-Google-Smtp-Source: ABdhPJyHSkqo+8f9nos0G2jxoH2XuQMJOTiDqsUaMq+GnMRlzyXW1jFdFp7EYh/NBBt1PhvvsmxROu+nDz3fNgOik/c=
X-Received: by 2002:a05:6e02:20ec:b0:2c6:158a:cb33 with SMTP id
 q12-20020a056e0220ec00b002c6158acb33mr6738576ilv.113.1646982885767; Thu, 10
 Mar 2022 23:14:45 -0800 (PST)
MIME-Version: 1.0
References: <20220301115828.355-1-liweiwei@iscas.ac.cn>
 <20220301115828.355-10-liweiwei@iscas.ac.cn>
In-Reply-To: <20220301115828.355-10-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 11 Mar 2022 17:14:19 +1000
Message-ID: <CAKmqyKPioFgCJtyts9pF8EXjigOmTyvvhu937am-CNOJKLeavQ@mail.gmail.com>
Subject: Re: [PATCH v8 09/14] target/riscv: rvk: add support for sha512
 related instructions for RV32 in zknh extension
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
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::12c;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12c.google.com
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
X-List-Received-Date: Fri, 11 Mar 2022 07:14:49 -0000

On Tue, Mar 1, 2022 at 10:01 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
>  - add sha512sum0r, sha512sig0l, sha512sum1r, sha512sig1l, sha512sig0h and sha512sig1h instructions
>
> Co-authored-by: Zewen Ye <lustrew@foxmail.com>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn32.decode              |   6 ++
>  target/riscv/insn_trans/trans_rvk.c.inc | 100 ++++++++++++++++++++++++
>  2 files changed, 106 insertions(+)
>
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index db28ecdd2b..02a0c71890 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -862,3 +862,9 @@ sha256sig0  00 01000 00010 ..... 001 ..... 0010011 @r2
>  sha256sig1  00 01000 00011 ..... 001 ..... 0010011 @r2
>  sha256sum0  00 01000 00000 ..... 001 ..... 0010011 @r2
>  sha256sum1  00 01000 00001 ..... 001 ..... 0010011 @r2
> +sha512sum0r 01 01000 ..... ..... 000 ..... 0110011 @r
> +sha512sum1r 01 01001 ..... ..... 000 ..... 0110011 @r
> +sha512sig0l 01 01010 ..... ..... 000 ..... 0110011 @r
> +sha512sig0h 01 01110 ..... ..... 000 ..... 0110011 @r
> +sha512sig1l 01 01011 ..... ..... 000 ..... 0110011 @r
> +sha512sig1h 01 01111 ..... ..... 000 ..... 0110011 @r
> diff --git a/target/riscv/insn_trans/trans_rvk.c.inc b/target/riscv/insn_trans/trans_rvk.c.inc
> index beea7f8e96..bb89a53f52 100644
> --- a/target/riscv/insn_trans/trans_rvk.c.inc
> +++ b/target/riscv/insn_trans/trans_rvk.c.inc
> @@ -167,3 +167,103 @@ static bool trans_sha256sum1(DisasContext *ctx, arg_sha256sum1 *a)
>      REQUIRE_ZKNH(ctx);
>      return gen_sha256(ctx, a, EXT_NONE, tcg_gen_rotri_i32, 6, 11, 25);
>  }
> +
> +static bool gen_sha512_rv32(DisasContext *ctx, arg_r *a, DisasExtend ext,
> +                            void (*func1)(TCGv_i64, TCGv_i64, int64_t),
> +                            void (*func2)(TCGv_i64, TCGv_i64, int64_t),
> +                            int64_t num1, int64_t num2, int64_t num3)
> +{
> +    TCGv dest = dest_gpr(ctx, a->rd);
> +    TCGv src1 = get_gpr(ctx, a->rs1, ext);
> +    TCGv src2 = get_gpr(ctx, a->rs2, ext);
> +    TCGv_i64 t0 = tcg_temp_new_i64();
> +    TCGv_i64 t1 = tcg_temp_new_i64();
> +    TCGv_i64 t2 = tcg_temp_new_i64();
> +
> +    tcg_gen_concat_tl_i64(t0, src1, src2);
> +    func1(t1, t0, num1);
> +    func2(t2, t0, num2);
> +    tcg_gen_xor_i64(t1, t1, t2);
> +    tcg_gen_rotri_i64(t2, t0, num3);
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
> +static bool trans_sha512sum0r(DisasContext *ctx, arg_sha512sum0r *a)
> +{
> +    REQUIRE_32BIT(ctx);
> +    REQUIRE_ZKNH(ctx);
> +    return gen_sha512_rv32(ctx, a, EXT_NONE, tcg_gen_rotli_i64,
> +                           tcg_gen_rotli_i64, 25, 30, 28);
> +}
> +
> +static bool trans_sha512sum1r(DisasContext *ctx, arg_sha512sum1r *a)
> +{
> +    REQUIRE_32BIT(ctx);
> +    REQUIRE_ZKNH(ctx);
> +    return gen_sha512_rv32(ctx, a, EXT_NONE, tcg_gen_rotli_i64,
> +                           tcg_gen_rotri_i64, 23, 14, 18);
> +}
> +
> +static bool trans_sha512sig0l(DisasContext *ctx, arg_sha512sig0l *a)
> +{
> +    REQUIRE_32BIT(ctx);
> +    REQUIRE_ZKNH(ctx);
> +    return gen_sha512_rv32(ctx, a, EXT_NONE, tcg_gen_rotri_i64,
> +                           tcg_gen_rotri_i64, 1, 7, 8);
> +}
> +
> +static bool trans_sha512sig1l(DisasContext *ctx, arg_sha512sig1l *a)
> +{
> +    REQUIRE_32BIT(ctx);
> +    REQUIRE_ZKNH(ctx);
> +    return gen_sha512_rv32(ctx, a, EXT_NONE, tcg_gen_rotli_i64,
> +                           tcg_gen_rotri_i64, 3, 6, 19);
> +}
> +
> +static bool gen_sha512h_rv32(DisasContext *ctx, arg_r *a, DisasExtend ext,
> +                             void (*func)(TCGv_i64, TCGv_i64, int64_t),
> +                             int64_t num1, int64_t num2, int64_t num3)
> +{
> +    TCGv dest = dest_gpr(ctx, a->rd);
> +    TCGv src1 = get_gpr(ctx, a->rs1, ext);
> +    TCGv src2 = get_gpr(ctx, a->rs2, ext);
> +    TCGv_i64 t0 = tcg_temp_new_i64();
> +    TCGv_i64 t1 = tcg_temp_new_i64();
> +    TCGv_i64 t2 = tcg_temp_new_i64();
> +
> +    tcg_gen_concat_tl_i64(t0, src1, src2);
> +    func(t1, t0, num1);
> +    tcg_gen_ext32u_i64(t2, t0);
> +    tcg_gen_shri_i64(t2, t2, num2);
> +    tcg_gen_xor_i64(t1, t1, t2);
> +    tcg_gen_rotri_i64(t2, t0, num3);
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
> +static bool trans_sha512sig0h(DisasContext *ctx, arg_sha512sig0h *a)
> +{
> +    REQUIRE_32BIT(ctx);
> +    REQUIRE_ZKNH(ctx);
> +    return gen_sha512h_rv32(ctx, a, EXT_NONE, tcg_gen_rotri_i64, 1, 7, 8);
> +}
> +
> +static bool trans_sha512sig1h(DisasContext *ctx, arg_sha512sig1h *a)
> +{
> +    REQUIRE_32BIT(ctx);
> +    REQUIRE_ZKNH(ctx);
> +    return gen_sha512h_rv32(ctx, a, EXT_NONE, tcg_gen_rotli_i64, 3, 6, 19);
> +}
> --
> 2.17.1
>
>

