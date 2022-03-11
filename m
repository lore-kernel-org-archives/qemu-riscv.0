Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nSZP2-0003Es-PL
	for mharc-qemu-riscv@gnu.org; Fri, 11 Mar 2022 02:09:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nSZOz-0003DE-7y; Fri, 11 Mar 2022 02:09:29 -0500
Received: from [2607:f8b0:4864:20::133] (port=39777
 helo=mail-il1-x133.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nSZOx-0005J8-D2; Fri, 11 Mar 2022 02:09:28 -0500
Received: by mail-il1-x133.google.com with SMTP id b14so5399220ilf.6;
 Thu, 10 Mar 2022 23:09:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=U9Cg9LDGRSRNWKVhIi8Dgou251u7kPB1hbhTCK5s5nQ=;
 b=fC7xaP+a08/PMhHa6IrXw73fBmxXg0Tu6p3TxdZBAtgZx6FPaSpqzwl9fzXFqMwup0
 JG2me98AvVgUe2QNOhe1fP3X6CywwtuHltaIu8whFWLOIZBM3mk3ahrEMtjmdSJYBa3O
 qjlwKYGs0aK4wYVW1WI3FU//wcqLiBKWGgbX5sHRwbMAjCvz1OerscrHprlFtMrLY7ZH
 cfmJ3Mhq8Ao4Jy8h0cjUDLlo46+i4lf7sopzhVtUOfe+CS5FNdAtQnvaZHPPrDr8fdlC
 QJqYPXupPom6Sy20p/g7vcfpCBTHxfZAoOYmNGWddDcCmHKOLvkjzIB6DVRpsFD+L83h
 8bPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U9Cg9LDGRSRNWKVhIi8Dgou251u7kPB1hbhTCK5s5nQ=;
 b=ScCuCK4S1w1oK27vP2uaeHUNVylZezG/SFBsQAjCMHDN0tRt2ZAY/Qe8hf8qMRoLpO
 jmGl3ofAfrfIKyiwvzCK8gAlNSauhl9iGFMc09UotVsjDp2L3G6d6qoTUdZVz7eQ/2MD
 MQR/W6UgtCBOirowFxtZDY7mcihdnijr7AWTA0sf8EqnhgWKrZb84Gb8tknAtGj84Azz
 +VwRIZXjPXbEAwAMvKdwvt1upD3GxasyNoGaSjavm/AnVhIy0L1tU5/ZiMjyPXYa/ydp
 4PC48kAeTjAj7ddNMgQId0OTf6W3+4h5A6zMd8o8xoRYZnbgIF9ty+cxL9LLx97KnTbY
 B4fQ==
X-Gm-Message-State: AOAM5333WaH6W+PNHvh+HQpdk6AJGzvOQ4fHDFPRq0nbw7MMWe9vqr+V
 LOLdk2rNjnnDbgEI+wx+15+VsGpdQtUeJmh0N04=
X-Google-Smtp-Source: ABdhPJwHJc5C+bUErPToP3p1NZubn1EZcfCSTN23ps2C9DurAme3kE81M1R+qpCosM/twIJ+2iCPMw1M94jytf/qQu4=
X-Received: by 2002:a05:6e02:154c:b0:2c6:4ffa:57ec with SMTP id
 j12-20020a056e02154c00b002c64ffa57ecmr6502688ilu.55.1646982555655; Thu, 10
 Mar 2022 23:09:15 -0800 (PST)
MIME-Version: 1.0
References: <20220301115828.355-1-liweiwei@iscas.ac.cn>
 <20220301115828.355-9-liweiwei@iscas.ac.cn>
In-Reply-To: <20220301115828.355-9-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 11 Mar 2022 17:08:49 +1000
Message-ID: <CAKmqyKMWF2ebp2SmRNg0SNCxXo3nvWDdGmnLi9418zveukSktg@mail.gmail.com>
Subject: Re: [PATCH v8 08/14] target/riscv: rvk: add support for sha256
 related instructions in zknh extension
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
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::133
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::133;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x133.google.com
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
X-List-Received-Date: Fri, 11 Mar 2022 07:09:29 -0000

On Tue, Mar 1, 2022 at 10:09 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
>  - add sha256sig0, sha256sig1, sha256sum0 and sha256sum1 instructions
>
> Co-authored-by: Zewen Ye <lustrew@foxmail.com>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn32.decode              |  5 +++
>  target/riscv/insn_trans/trans_rvk.c.inc | 55 +++++++++++++++++++++++++
>  2 files changed, 60 insertions(+)
>
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index 0b800b4093..db28ecdd2b 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -857,3 +857,8 @@ aes64esm    00 11011 ..... ..... 000 ..... 0110011 @r
>  # *** RV64 Zkne/zknd Standard Extension ***
>  aes64ks2    01 11111 ..... ..... 000 ..... 0110011 @r
>  aes64ks1i   00 11000 1.... ..... 001 ..... 0010011 @i_aes
> +# *** RV32 Zknh Standard Extension ***
> +sha256sig0  00 01000 00010 ..... 001 ..... 0010011 @r2
> +sha256sig1  00 01000 00011 ..... 001 ..... 0010011 @r2
> +sha256sum0  00 01000 00000 ..... 001 ..... 0010011 @r2
> +sha256sum1  00 01000 00001 ..... 001 ..... 0010011 @r2
> diff --git a/target/riscv/insn_trans/trans_rvk.c.inc b/target/riscv/insn_trans/trans_rvk.c.inc
> index b86f931b13..beea7f8e96 100644
> --- a/target/riscv/insn_trans/trans_rvk.c.inc
> +++ b/target/riscv/insn_trans/trans_rvk.c.inc
> @@ -29,6 +29,12 @@
>      }                                           \
>  } while (0)
>
> +#define REQUIRE_ZKNH(ctx) do {                  \
> +    if (!ctx->cfg_ptr->ext_zknh) {              \
> +        return false;                           \
> +    }                                           \
> +} while (0)
> +
>  static bool gen_aes32_sm4(DisasContext *ctx, arg_k_aes *a,
>                            void (*func)(TCGv, TCGv, TCGv, TCGv))
>  {
> @@ -112,3 +118,52 @@ static bool trans_aes64im(DisasContext *ctx, arg_aes64im *a)
>      REQUIRE_ZKND(ctx);
>      return gen_unary(ctx, a, EXT_NONE, gen_helper_aes64im);
>  }
> +
> +static bool gen_sha256(DisasContext *ctx, arg_r2 *a, DisasExtend ext,
> +                       void (*func)(TCGv_i32, TCGv_i32, int32_t),
> +                       int32_t num1, int32_t num2, int32_t num3)
> +{
> +    TCGv dest = dest_gpr(ctx, a->rd);
> +    TCGv src1 = get_gpr(ctx, a->rs1, ext);
> +    TCGv_i32 t0 = tcg_temp_new_i32();
> +    TCGv_i32 t1 = tcg_temp_new_i32();
> +    TCGv_i32 t2 = tcg_temp_new_i32();
> +
> +    tcg_gen_trunc_tl_i32(t0, src1);
> +    tcg_gen_rotri_i32(t1, t0, num1);
> +    tcg_gen_rotri_i32(t2, t0, num2);
> +    tcg_gen_xor_i32(t1, t1, t2);
> +    func(t2, t0, num3);
> +    tcg_gen_xor_i32(t1, t1, t2);
> +    tcg_gen_ext_i32_tl(dest, t1);
> +
> +    gen_set_gpr(ctx, a->rd, dest);
> +    tcg_temp_free_i32(t0);
> +    tcg_temp_free_i32(t1);
> +    tcg_temp_free_i32(t2);
> +    return true;
> +}
> +
> +static bool trans_sha256sig0(DisasContext *ctx, arg_sha256sig0 *a)
> +{
> +    REQUIRE_ZKNH(ctx);
> +    return gen_sha256(ctx, a, EXT_NONE, tcg_gen_shri_i32, 7, 18, 3);
> +}
> +
> +static bool trans_sha256sig1(DisasContext *ctx, arg_sha256sig1 *a)
> +{
> +    REQUIRE_ZKNH(ctx);
> +    return gen_sha256(ctx, a, EXT_NONE, tcg_gen_shri_i32, 17, 19, 10);
> +}
> +
> +static bool trans_sha256sum0(DisasContext *ctx, arg_sha256sum0 *a)
> +{
> +    REQUIRE_ZKNH(ctx);
> +    return gen_sha256(ctx, a, EXT_NONE, tcg_gen_rotri_i32, 2, 13, 22);
> +}
> +
> +static bool trans_sha256sum1(DisasContext *ctx, arg_sha256sum1 *a)
> +{
> +    REQUIRE_ZKNH(ctx);
> +    return gen_sha256(ctx, a, EXT_NONE, tcg_gen_rotri_i32, 6, 11, 25);
> +}
> --
> 2.17.1
>
>

