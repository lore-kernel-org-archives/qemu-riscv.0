Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m39n2-0000jB-3V
	for mharc-qemu-riscv@gnu.org; Tue, 13 Jul 2021 00:13:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1m39n0-0000gi-JW; Tue, 13 Jul 2021 00:12:58 -0400
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31]:45835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1m39mz-00063O-5v; Tue, 13 Jul 2021 00:12:58 -0400
Received: by mail-io1-xd31.google.com with SMTP id y16so2394259iol.12;
 Mon, 12 Jul 2021 21:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7vdYc4tf9PcvX7mOuqreAjiDow7e68GNclILojHrdBA=;
 b=k0DPzBm0NyxnDXduX2BoGbouFyfaD++9gqpz1lWXYWo7jgAnRHkyn6TKlbPOD0k7X5
 MBPtrnKngxcds6Yv87XbVNPDH40NJj+7lB6gLYyCZJohNEjYBVaJDBXJ59ll1FM8njHS
 TrLZ/dUCB8e78cfc4RuELNpEf0VKo0wIcBgp/KqPmLLHU44mmiK/VoUP4EW3yUcHCttp
 kYkQgDHM38jkYhwJVmAgnzXS29JKxjKh95FkVYZN0u3ollx1q31Ef/9gXEmQeWUX9XT8
 1WKU7IKXhaG+oEyW78c1zfHFh+GUeLDltaXmvFVWVDumvyPV6iau73Mu2IhMIfGgzCW2
 GTZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7vdYc4tf9PcvX7mOuqreAjiDow7e68GNclILojHrdBA=;
 b=Iz8lpGlsABYSGqVRCZrCVI+vBAqqIgTb8eCh5f1WVGItmvJSi6I0nQjC0fptzYj1oi
 Wgrf/TwSUD2/Sh75Mx5xTeYpjaGTZNq4P/8uE6jFMryGMq4Ca3/GZrfgG2+GCZmEDbKr
 twYQcdXJcC419QG4On+p/WVVicR6x2/L6rpYJGHgWojWEchQpytVXSyDy5xkurKqKGiF
 IQXo2PQ1IPZ+wDjvf2yszeGrs2EkBNw/87p9Wa+oo/qQGJe2ZqN+QpNt6rRnSJsSG03R
 MVnG4YtHmtpK9s5z+bhguoxdqhegA2zrwejscuH8DI/pdqhXYfLjvi2pXMz9orG1U+LQ
 qqbg==
X-Gm-Message-State: AOAM5322uUXZxdqz/Kh83QaEhac/AyvPBs+cpF+bgxdOcq7Lc4OebE1Y
 MVZcHfxSj+4c6lKAaBOf3ptHdQxeGA9JZN7pqS0=
X-Google-Smtp-Source: ABdhPJxGquZKdTVcqBi7x6dGE478gcIpiE4Td4qZy+q3uVh/Ee+Em7d1YQqAMtGj3Ee6UKJzmJvZydcj8mfOPX78Zu8=
X-Received: by 2002:a5e:9703:: with SMTP id w3mr1719128ioj.118.1626149575790; 
 Mon, 12 Jul 2021 21:12:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210709042608.883256-1-richard.henderson@linaro.org>
 <20210709042608.883256-6-richard.henderson@linaro.org>
In-Reply-To: <20210709042608.883256-6-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 13 Jul 2021 14:12:29 +1000
Message-ID: <CAKmqyKMCZLoHJChM4NXSpcNLjvWVJUvfxR8BdEMiPEQaS2SgMQ@mail.gmail.com>
Subject: Re: [PATCH 05/17] target/riscv: Use gpr_{src, dst} and
 tcg_constant_tl in gen_grevi
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
X-List-Received-Date: Tue, 13 Jul 2021 04:12:59 -0000

On Fri, Jul 9, 2021 at 2:47 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/translate.c | 17 +++++------------
>  1 file changed, 5 insertions(+), 12 deletions(-)
>
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 7dedfd548b..6ad40e43b0 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -620,23 +620,16 @@ static void gen_sro(TCGv ret, TCGv arg1, TCGv arg2)
>
>  static bool gen_grevi(DisasContext *ctx, arg_grevi *a)
>  {
> -    TCGv source1 = tcg_temp_new();
> -    TCGv source2;
> -
> -    gen_get_gpr(source1, a->rs1);
> +    TCGv dest = gpr_dst(ctx, a->rd);
> +    TCGv src1 = gpr_src(ctx, a->rs1);
>
>      if (a->shamt == (TARGET_LONG_BITS - 8)) {
>          /* rev8, byte swaps */
> -        tcg_gen_bswap_tl(source1, source1);
> +        tcg_gen_bswap_tl(dest, src1);
>      } else {
> -        source2 = tcg_temp_new();
> -        tcg_gen_movi_tl(source2, a->shamt);
> -        gen_helper_grev(source1, source1, source2);
> -        tcg_temp_free(source2);
> +        TCGv src2 = tcg_constant_tl(a->shamt);
> +        gen_helper_grev(dest, src1, src2);
>      }
> -
> -    gen_set_gpr(a->rd, source1);
> -    tcg_temp_free(source1);
>      return true;
>  }
>
> --
> 2.25.1
>
>

