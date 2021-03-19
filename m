Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lNFaT-0003Gx-Iu
	for mharc-qemu-riscv@gnu.org; Fri, 19 Mar 2021 09:54:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lNFaQ-0003Cr-Od; Fri, 19 Mar 2021 09:54:46 -0400
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35]:46916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lNFaP-0002O8-1f; Fri, 19 Mar 2021 09:54:46 -0400
Received: by mail-io1-xd35.google.com with SMTP id j26so6155644iog.13;
 Fri, 19 Mar 2021 06:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ybobm4xRlDne4W42noQKXgBEHx4LUhMfSBPhb/nWQaI=;
 b=KF2uZsAGD069nblh14gGPuI5JLZQLB1XHEZmwktD1Nst1KJnHv2aR++Y/5/KD4uFa/
 bU8TQWT/oGU2eyvY27BC9tbucHGBdhSKvaJqJ4mCJZJnIuQ6E5kJMISr6QPXg4JOI0Cj
 D/uTqVGft9yXwu9E6TQ2mZYCXZMYJSz1/BJAVF6sEs4ODzXPKoczsfWjatcoqEscfblJ
 G4c2fX76B0dLF4oxfwKO2CJ7bs1n1lsLV8jBSXGNZFgrEwdcAJ5k2vPNzvhSgASvQs/y
 lJq5dpijFFHd6+pBzq0JP3kB8B5yPDiD32UZaRclY7/bgjGqXkGnpvh1mrhPmJ9efBYQ
 ouxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ybobm4xRlDne4W42noQKXgBEHx4LUhMfSBPhb/nWQaI=;
 b=Dp+N7FGY1kx9yeOz0onvwKE53kU4SZmp7QhY/Rgrovhj6yTtK0BprcyML4kQxixwfm
 gkWHrkVJ2+JQ7bBe6tZW8B9I5nVQlOyn+yQgPlbVNfR9NIny0whnmPn4/Anoq1an4aQB
 IFOmkdczlMiWtlEXRiiiiiPijM7VuPvTREDuMpEfCapQyToo+O9VNVJmOqA+K/QXgX9l
 MOSwNTW4kCkMNznO+UIUzjf03h5gF9lxhas7HzC1fH0mVoICeREAv3aZFlPZVLa+MaAR
 ti4r21AzxBy7uacNmDO9me1Zqzd/tvPLzDA/exFyjQzr8nDdDdTq26fwdfNSqQn3Gizz
 PsBg==
X-Gm-Message-State: AOAM533bwwWwXll6aF+1K+t6x3CewaXTceSlBXU21JBGgM9ow5MXzN4L
 IrFykgs4vN79wv5iRBOG4mwr9KelHDLRi+XNSVk+rUdzC/I=
X-Google-Smtp-Source: ABdhPJyb3H1K6sFOA+mZkp9KHurJc/XhdFVcvFTt+aFxhZwDjrDQ0PrWDJVnOoyJ2bShfnBfybt8sXwDzlH6r53xLrM=
X-Received: by 2002:a05:6638:3791:: with SMTP id
 w17mr1420179jal.91.1616162083381; 
 Fri, 19 Mar 2021 06:54:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210316150354.1948265-1-georg.kotheimer@kernkonzept.com>
In-Reply-To: <20210316150354.1948265-1-georg.kotheimer@kernkonzept.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 19 Mar 2021 09:52:54 -0400
Message-ID: <CAKmqyKMp3aRCjRq2_c+_uybSS_GZDip8C3hoH5an=5a1A+1Lew@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Prevent lost illegal instruction exceptions
To: Georg Kotheimer <georg.kotheimer@kernkonzept.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d35;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd35.google.com
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
X-List-Received-Date: Fri, 19 Mar 2021 13:54:47 -0000

On Tue, Mar 16, 2021 at 11:05 AM Georg Kotheimer
<georg.kotheimer@kernkonzept.com> wrote:
>
> When decode_insn16() fails, we fall back to decode_RV32_64C() for
> further compressed instruction decoding. However, prior to this change,
> we did not raise an illegal instruction exception, if decode_RV32_64C()
> fails to decode the instruction. This means that we skipped illegal
> compressed instructions instead of raising an illegal instruction
> exception.
>
> Signed-off-by: Georg Kotheimer <georg.kotheimer@kernkonzept.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/translate.c | 19 ++++++++++++-------
>  1 file changed, 12 insertions(+), 7 deletions(-)
>
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 0f28b5f41e..8c00734252 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -537,7 +537,7 @@ static void gen_set_rm(DisasContext *ctx, int rm)
>      tcg_temp_free_i32(t0);
>  }
>
> -static void decode_RV32_64C0(DisasContext *ctx, uint16_t opcode)
> +static bool decode_RV32_64C0(DisasContext *ctx, uint16_t opcode)
>  {
>      uint8_t funct3 = extract16(opcode, 13, 3);
>      uint8_t rd_rs2 = GET_C_RS2S(opcode);
> @@ -554,7 +554,7 @@ static void decode_RV32_64C0(DisasContext *ctx, uint16_t opcode)
>          gen_fp_load(ctx, OPC_RISC_FLW, rd_rs2, rs1s,
>                      GET_C_LW_IMM(opcode));
>  #endif
> -        break;
> +        return true;
>      case 7:
>  #if defined(TARGET_RISCV64)
>          /* C.SD (RV64/128) -> sd rs2', offset[7:3](rs1')*/
> @@ -565,18 +565,21 @@ static void decode_RV32_64C0(DisasContext *ctx, uint16_t opcode)
>          gen_fp_store(ctx, OPC_RISC_FSW, rs1s, rd_rs2,
>                       GET_C_LW_IMM(opcode));
>  #endif
> -        break;
> +        return true;
> +    default:
> +        return false;
>      }
>  }
>
> -static void decode_RV32_64C(DisasContext *ctx, uint16_t opcode)
> +static bool decode_RV32_64C(DisasContext *ctx, uint16_t opcode)
>  {
>      uint8_t op = extract16(opcode, 0, 2);
>
>      switch (op) {
>      case 0:
> -        decode_RV32_64C0(ctx, opcode);
> -        break;
> +        return decode_RV32_64C0(ctx, opcode);
> +    default:
> +        return false;
>      }
>  }
>
> @@ -780,7 +783,9 @@ static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
>              ctx->pc_succ_insn = ctx->base.pc_next + 2;
>              if (!decode_insn16(ctx, opcode)) {
>                  /* fall back to old decoder */
> -                decode_RV32_64C(ctx, opcode);
> +                if (!decode_RV32_64C(ctx, opcode)) {
> +                    gen_exception_illegal(ctx);
> +                }
>              }
>          }
>      } else {
> --
> 2.30.1
>
>

