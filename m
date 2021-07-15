Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m3tNG-0002JR-8N
	for mharc-qemu-riscv@gnu.org; Thu, 15 Jul 2021 00:53:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1m3tND-0002JB-Dd; Thu, 15 Jul 2021 00:53:23 -0400
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31]:45937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1m3tNC-0006hE-1T; Thu, 15 Jul 2021 00:53:23 -0400
Received: by mail-io1-xd31.google.com with SMTP id y16so4921782iol.12;
 Wed, 14 Jul 2021 21:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9nbAa96SVEsdANJkzv8Uee1Nf7N/Qikmt7DBzcBzfOc=;
 b=hG0yISqaZv7ZXQpLm5JDS0bRraFgJ+pZU4/34IQRtpU9wAVXMu9U3JHcE5VDYYJM2F
 p+oXjUsrrQipsI/dmhkVIH5b3NnT2PZcX++bqmJzDl+37vR6anZKlonCWi5Cd65x0SKx
 XLn6zWFEyssWfHyjOZ/kttzaOWuIsYGMiqMf0NQFSsyyI+iMgilQFgMhvVpY1e5XvidY
 pSqqIIWqdMwEJCY9O7da4B3Fn6IfTtFDTcMbFlHrUYS7U2J2YSjAkLew/LnR/jWZQxkP
 KPYP1CasB1GOumuDrudEb/+BRsbg6hBe27mNwUfzw/zFVnLujV+n9l0LyzbS8dRb2qlD
 Ve/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9nbAa96SVEsdANJkzv8Uee1Nf7N/Qikmt7DBzcBzfOc=;
 b=Ww0LGSV+UHaTV7W/8YFOqk0bCcmJGHL5ZcdB4lwUj8cw1vMB5Sb51xK/F56cZIuDY0
 bYgOZBW3YpUiAaTvuqvxQlXF1SREJgV35Z/s3tUwfXJZkbLECd1glQSnJMWGdNcjnrlv
 wU4SswgEos2oCxChyrLZcCmZjbfm+TCCKyvwKSNsN5PhDR1BIAY6YOLWZBtcuqnn3JWq
 fZ68pIQi4mWCYdVolJL2TR6I3YzyrXH7Wd/3WKj59/Py/NC+psJQYZ+ZXEDOCTT5DplL
 s15GiTy4UkEQgAUxguQytMpxRAQ/UOhqidrXwJKGDrFQsyds+a0+gFyTYaWKJEMcMoLs
 YvYA==
X-Gm-Message-State: AOAM532BFHC0oM2dM8DgU1n18ZuBLhALkQd1e0HLWrWla4+LsLvQ2A1T
 lADQb+FRNJ1j+0bGnH7wokWIQidfAOSzF7QBTqA=
X-Google-Smtp-Source: ABdhPJyvold/vUBDyxC4P18+JHIUmVC56kfWg+KKmjM+Fu9bc5BnmeS3AjgyOjiA7xXYqFM/nWprjN0WXs2kUrMdXpQ=
X-Received: by 2002:a5e:9703:: with SMTP id w3mr1605322ioj.118.1626324800233; 
 Wed, 14 Jul 2021 21:53:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210709042608.883256-1-richard.henderson@linaro.org>
 <20210709042608.883256-12-richard.henderson@linaro.org>
In-Reply-To: <20210709042608.883256-12-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 15 Jul 2021 14:52:54 +1000
Message-ID: <CAKmqyKOih0wuGJrtBuW=5tP12Q11EV9h5OkY2n4RtPDJppAMZw@mail.gmail.com>
Subject: Re: [PATCH 11/17] target/riscv: Use gpr_{src,dst} for RVB
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d31;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd31.google.com
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
X-List-Received-Date: Thu, 15 Jul 2021 04:53:24 -0000

On Fri, Jul 9, 2021 at 2:37 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn_trans/trans_rvb.c.inc | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
> index 9e81f6e3de..58921f3224 100644
> --- a/target/riscv/insn_trans/trans_rvb.c.inc
> +++ b/target/riscv/insn_trans/trans_rvb.c.inc
> @@ -423,16 +423,13 @@ static bool trans_slli_uw(DisasContext *ctx, arg_slli_uw *a)
>      REQUIRE_64BIT(ctx);
>      REQUIRE_EXT(ctx, RVB);
>
> -    TCGv source1 = tcg_temp_new();
> -    gen_get_gpr(source1, a->rs1);
> +    TCGv dest = gpr_dst(ctx, a->rd);
> +    TCGv src1 = gpr_src(ctx, a->rs1);
>
>      if (a->shamt < 32) {
> -        tcg_gen_deposit_z_tl(source1, source1, a->shamt, 32);
> +        tcg_gen_deposit_z_tl(dest, src1, a->shamt, 32);
>      } else {
> -        tcg_gen_shli_tl(source1, source1, a->shamt);
> +        tcg_gen_shli_tl(dest, src1, a->shamt);
>      }
> -
> -    gen_set_gpr(a->rd, source1);
> -    tcg_temp_free(source1);
>      return true;
>  }
> --
> 2.25.1
>
>

