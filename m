Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lbGrJ-0003Xy-G1
	for mharc-qemu-riscv@gnu.org; Tue, 27 Apr 2021 02:06:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lbGrH-0003TR-5o; Tue, 27 Apr 2021 02:06:07 -0400
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e]:37814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lbGrF-0000zw-DN; Tue, 27 Apr 2021 02:06:06 -0400
Received: by mail-io1-xd2e.google.com with SMTP id b10so741391iot.4;
 Mon, 26 Apr 2021 23:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2VE2942dQQwxAx/ezXxM/Ri5mJIjEUozlDX7MJITT44=;
 b=T1YwXWB9guIRA9QTJ0RGceO47hQ0MLHoamswfhyWTmXADDhx1NJzBSOhbv/Q0qNgFv
 IvoSSEDKyZnbn/m6zIY8lDfMfiPGtBqfqi0gim3jY6ITHzlOV6ZPWqoZ/0TpV17Slup9
 RlNCGZ8bCkO425QXI7C39DydSqCOVEPw0avUghO5YDukj6qQXhqC2xUiXR8esDpLaPzp
 OQnOan0te7/EURc9QmAWb74ah7u754+ihVh97/bSTkdmQGT7SLiqB/rUOlDiZkS8Rv2T
 DvtK5bKy3eAptY8XnMFvy81drMBB8thwZfLbR7LWvN6gvOJcNLhCvbxuP16Ytlcralyz
 LOaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2VE2942dQQwxAx/ezXxM/Ri5mJIjEUozlDX7MJITT44=;
 b=L5bqaq0KDXwN17CQ9byoKkTVlH7pmTNbZWdaBixMy5SHUvUCUM4aQOqyk8MhdnUvAL
 O7BOP7aeFfGlmzJKdRvceFg8u1BzVCplolVWLX4a4CiFjbWR5uySfapPVaR3Q6LvLjYk
 ZTkENeHeCD0/hi2SBRKxo1uU9SjI30O1u2HfGYf8UB8M7poIPFeVe/cFsb1NKOMXtwYc
 zDhPwVp+JEVzRD8tDjgdpLWC3b72IMHiRyDIpERw73nde6eIazNFIgZ2G1N9w5Xd69u+
 ycndgUqxERQ/pIEIs35y9i1CHKYpDwCrs9IFNK/qAOdySwYsy38lh+APEOQ0vbeSqNVC
 oBpQ==
X-Gm-Message-State: AOAM531aI3oi+NVS5ek59CuoKBI8kpcWu4SfQeGomuYcKY+AfuVKaRuo
 /Uv26kDXmuqZqerw+7chgmJtrnq+2tZGf/Xv17U=
X-Google-Smtp-Source: ABdhPJx/owxWZmMPZA5TWHbb1wMKFKLGgH8ZFgsMVjRw/MMhllboJqPjvBtvdkE9PEZS+c9xuEvwFNCldG7qyO5J5cY=
X-Received: by 2002:a05:6638:f:: with SMTP id
 z15mr19896161jao.26.1619503563884; 
 Mon, 26 Apr 2021 23:06:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210421041400.22243-1-frank.chang@sifive.com>
 <20210421041400.22243-6-frank.chang@sifive.com>
In-Reply-To: <20210421041400.22243-6-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 27 Apr 2021 16:05:37 +1000
Message-ID: <CAKmqyKNJ3m_nCqg2Ff71Ff564KShiudstjOOc8p4aVCTzD+5Kg@mail.gmail.com>
Subject: Re: [PATCH v5 05/17] target/riscv: rvb: pack two words into one
 register
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Kito Cheng <kito.cheng@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2e.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 27 Apr 2021 06:06:07 -0000

On Wed, Apr 21, 2021 at 2:17 PM <frank.chang@sifive.com> wrote:
>
> From: Kito Cheng <kito.cheng@sifive.com>
>
> Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn32-64.decode           |  3 ++
>  target/riscv/insn32.decode              |  3 ++
>  target/riscv/insn_trans/trans_rvb.c.inc | 30 +++++++++++++++++++
>  target/riscv/translate.c                | 40 +++++++++++++++++++++++++
>  4 files changed, 76 insertions(+)
>
> diff --git a/target/riscv/insn32-64.decode b/target/riscv/insn32-64.decode
> index 89498a9a28a..d28c0bcf2c1 100644
> --- a/target/riscv/insn32-64.decode
> +++ b/target/riscv/insn32-64.decode
> @@ -91,3 +91,6 @@ hsv_d     0110111  .....   ..... 100 00000 1110011 @r2_s
>  clzw       0110000 00000 ..... 001 ..... 0011011 @r2
>  ctzw       0110000 00001 ..... 001 ..... 0011011 @r2
>  cpopw      0110000 00010 ..... 001 ..... 0011011 @r2
> +
> +packw      0000100 .......... 100 ..... 0111011 @r
> +packuw     0100100 .......... 100 ..... 0111011 @r
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index d0b3f109b4e..7f32b8c6d15 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -602,3 +602,6 @@ cpop       011000 000010 ..... 001 ..... 0010011 @r2
>  andn       0100000 .......... 111 ..... 0110011 @r
>  orn        0100000 .......... 110 ..... 0110011 @r
>  xnor       0100000 .......... 100 ..... 0110011 @r
> +pack       0000100 .......... 100 ..... 0110011 @r
> +packu      0100100 .......... 100 ..... 0110011 @r
> +packh      0000100 .......... 111 ..... 0110011 @r
> diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
> index 73c4693a263..2d24dafac09 100644
> --- a/target/riscv/insn_trans/trans_rvb.c.inc
> +++ b/target/riscv/insn_trans/trans_rvb.c.inc
> @@ -53,6 +53,24 @@ static bool trans_xnor(DisasContext *ctx, arg_xnor *a)
>      return gen_arith(ctx, a, tcg_gen_eqv_tl);
>  }
>
> +static bool trans_pack(DisasContext *ctx, arg_pack *a)
> +{
> +    REQUIRE_EXT(ctx, RVB);
> +    return gen_arith(ctx, a, gen_pack);
> +}
> +
> +static bool trans_packu(DisasContext *ctx, arg_packu *a)
> +{
> +    REQUIRE_EXT(ctx, RVB);
> +    return gen_arith(ctx, a, gen_packu);
> +}
> +
> +static bool trans_packh(DisasContext *ctx, arg_packh *a)
> +{
> +    REQUIRE_EXT(ctx, RVB);
> +    return gen_arith(ctx, a, gen_packh);
> +}
> +
>  /* RV64-only instructions */
>  #ifdef TARGET_RISCV64
>
> @@ -74,4 +92,16 @@ static bool trans_cpopw(DisasContext *ctx, arg_cpopw *a)
>      return gen_unary(ctx, a, gen_cpopw);
>  }
>
> +static bool trans_packw(DisasContext *ctx, arg_packw *a)
> +{
> +    REQUIRE_EXT(ctx, RVB);
> +    return gen_arith(ctx, a, gen_packw);
> +}
> +
> +static bool trans_packuw(DisasContext *ctx, arg_packuw *a)
> +{
> +    REQUIRE_EXT(ctx, RVB);
> +    return gen_arith(ctx, a, gen_packuw);
> +}
> +
>  #endif
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index b20a58c63b4..4333207aeff 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -536,6 +536,29 @@ static bool gen_arith_div_uw(DisasContext *ctx, arg_r *a,
>
>  #endif
>
> +static void gen_pack(TCGv ret, TCGv arg1, TCGv arg2)
> +{
> +    tcg_gen_deposit_tl(ret, arg1, arg2,
> +                       TARGET_LONG_BITS / 2,
> +                       TARGET_LONG_BITS / 2);
> +}
> +
> +static void gen_packu(TCGv ret, TCGv arg1, TCGv arg2)
> +{
> +    TCGv t = tcg_temp_new();
> +    tcg_gen_shri_tl(t, arg1, TARGET_LONG_BITS / 2);
> +    tcg_gen_deposit_tl(ret, arg2, t, 0, TARGET_LONG_BITS / 2);
> +    tcg_temp_free(t);
> +}
> +
> +static void gen_packh(TCGv ret, TCGv arg1, TCGv arg2)
> +{
> +    TCGv t = tcg_temp_new();
> +    tcg_gen_ext8u_tl(t, arg2);
> +    tcg_gen_deposit_tl(ret, arg1, t, 8, TARGET_LONG_BITS - 8);
> +    tcg_temp_free(t);
> +}
> +
>  #ifdef TARGET_RISCV64
>
>  static void gen_ctzw(TCGv ret, TCGv arg1)
> @@ -557,6 +580,23 @@ static void gen_cpopw(TCGv ret, TCGv arg1)
>      tcg_gen_ctpop_tl(ret, arg1);
>  }
>
> +static void gen_packw(TCGv ret, TCGv arg1, TCGv arg2)
> +{
> +    TCGv t = tcg_temp_new();
> +    tcg_gen_ext16s_i64(t, arg2);
> +    tcg_gen_deposit_i64(ret, arg1, t, 16, 48);
> +    tcg_temp_free(t);
> +}
> +
> +static void gen_packuw(TCGv ret, TCGv arg1, TCGv arg2)
> +{
> +    TCGv t = tcg_temp_new();
> +    tcg_gen_shri_i64(t, arg1, 16);
> +    tcg_gen_deposit_i64(ret, arg2, t, 0, 16);
> +    tcg_gen_ext32s_i64(ret, ret);
> +    tcg_temp_free(t);
> +}
> +
>  #endif
>
>  static bool gen_arith(DisasContext *ctx, arg_r *a,
> --
> 2.17.1
>
>

