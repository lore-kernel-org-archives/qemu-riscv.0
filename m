Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oDh9e-00028v-4h
	for mharc-qemu-riscv@gnu.org; Tue, 19 Jul 2022 02:56:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oDh9c-00027V-AC; Tue, 19 Jul 2022 02:56:24 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:39911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oDh9a-00024z-Uh; Tue, 19 Jul 2022 02:56:24 -0400
Received: by mail-pg1-x52e.google.com with SMTP id q16so9576241pgq.6;
 Mon, 18 Jul 2022 23:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sv4V2ANSQfL6UAYKA+BFNW3ijGtHssIlstd4F8ksYZ8=;
 b=VboQ7W8ZRlNLX6w4lupCnHnL10Fgr3giNE1l9aLmqg95uN2ZIBOKDe0b4xBcfmo824
 mNEk1NmEjKpinMGb+WG1NSUL76FMdmq500vvtE9HB5c/XKIN/+e3xi7uka1DYo6cLQCe
 PfjCR0yYoYnanN7ADF2kxjbWplt04MULB74hG8ooxa535WubVnsxJxJxcKAzimfKRQ27
 nAlaDs/f3XkdX4rhGv535UqprBLeYx1iKf275c5xTfXRh7uwpbzDERWVsD2da00wUoxX
 O8WFswT7w1Mskto9hqFPJDoo1Q4B62A+6+49GoJeoX20MDzSHg2i6/RZcEvoVKNPrxU0
 fcHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sv4V2ANSQfL6UAYKA+BFNW3ijGtHssIlstd4F8ksYZ8=;
 b=IaBeGHYK01GRkuYvxMSlAlbxTeoTwVshICFe77HJRwmNJa3Xigcl8YJuVKF7cl14kn
 LJJpOfMKSpOsU235uYQObD3XnpozVtewazxR5JgVf+J76gRJugU/4fdWdTgbfblpEE9y
 TSqEWhmR+GRnOavniDafPWg3BCW3q1uUIkfueSVNCFABmw6nEYSGVJnjZ8pGW6QXwrHQ
 k1UOdHosxdU0NqigseIbqA1TmGRhGTbmHzMTgx4VZFaszH4zz2ikrbSDCHpRI2QP0YM6
 9Zu5XYkfqNJY002xYCtr4NmsqDAsS1xqJb/r7OZBK0+ydfMS0WpYWU8rAY1hhr2cbxJi
 D30w==
X-Gm-Message-State: AJIora8WVmwZCfjTdMFUaNAdszJ5c7gMjlUabT8AJG0NTPg20m//0f/f
 A7FGFgtkK1XsCG9aE2p/t2Zq1UovbmLZ7+pyfhQ=
X-Google-Smtp-Source: AGRyM1uctDImGBnmFjqRrcdgGR67z5RW/h7mCi/T+1sjNptg3W59TW29kCCkDpLaREY1j0/zQT9RXLyrmiGWuL8YQtU=
X-Received: by 2002:a05:6a00:885:b0:510:950f:f787 with SMTP id
 q5-20020a056a00088500b00510950ff787mr31437833pfj.83.1658213780902; Mon, 18
 Jul 2022 23:56:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220717101543.478533-1-space.monkey.delivers@gmail.com>
 <20220717101543.478533-2-space.monkey.delivers@gmail.com>
In-Reply-To: <20220717101543.478533-2-space.monkey.delivers@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 19 Jul 2022 16:55:54 +1000
Message-ID: <CAKmqyKPDK9XrTxA1yRCLDEC8yOVEsxr4aJxqZKCppad5YrVG_g@mail.gmail.com>
Subject: Re: [PATCH 1/1] target/riscv: Fix typo and restore Pointer Masking
 functionality for RISC-V
To: Alexey Baturo <baturo.alexey@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 space.monkey.delivers@gmail.com, 
 Dave Smith <kupokupokupopo@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=alistair23@gmail.com; helo=mail-pg1-x52e.google.com
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
X-List-Received-Date: Tue, 19 Jul 2022 06:56:24 -0000

On Sun, Jul 17, 2022 at 8:17 PM Alexey Baturo <baturo.alexey@gmail.com> wrote:
>
> From: Alexey Baturo <baturo.alexey@gmail.com>
>
> Signed-off-by: Alexey Baturo <baturo.alexey@gmail.com>

Fixes: 4302bef9e178 ("target/riscv: Calculate address according to XLEN")

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/translate.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 63b04e8a94..86c19ea74e 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -544,7 +544,7 @@ static TCGv get_address(DisasContext *ctx, int rs1, int imm)
>
>      tcg_gen_addi_tl(addr, src1, imm);
>      if (ctx->pm_mask_enabled) {
> -        tcg_gen_and_tl(addr, addr, pm_mask);
> +        tcg_gen_andc_tl(addr, addr, pm_mask);
>      } else if (get_xl(ctx) == MXL_RV32) {
>          tcg_gen_ext32u_tl(addr, addr);
>      }
> --
> 2.30.2
>
>

