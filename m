Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mbFfX-0005iM-7y
	for mharc-qemu-riscv@gnu.org; Fri, 15 Oct 2021 01:22:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mbFfV-0005eI-1Y; Fri, 15 Oct 2021 01:22:09 -0400
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31]:34443)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mbFfJ-00044U-FR; Fri, 15 Oct 2021 01:22:08 -0400
Received: by mail-io1-xd31.google.com with SMTP id i189so6465463ioa.1;
 Thu, 14 Oct 2021 22:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ie3IhZXo4z/psLfvHFcCyfum7v5EtDUFMAlXTVQJ1pU=;
 b=jnNuHSebadgLAuEE2Dz9cdrei+zMsGgY3cg/5b7/r1H3tEDElPcuMSzJ9QyiPgf+dd
 VTanX/8Bk1R0xMjMxvJIheWA1S/1avNXGzOZwfMBf1VXJEo4EtCpwF4JiNdITUYzMbG3
 VPhWq08uvmDZIdNjyLiUdZfZy3FtBIntCOj4oUNVqmT4zZiNe++v3v0HJbcNWWs5PeRh
 mw31uRanEH3Q/RWJmlxLLaQYohqhcPzbCYlp31yW8MGZvtgPkyY2+NPTzPMHpHLb1ek+
 2PxJVtAIwClzqiidKe3DSsQrZEpXa9dOOKRZTa6EPhPSxG4vDGp1RkOfefed/0OhAC16
 AA2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ie3IhZXo4z/psLfvHFcCyfum7v5EtDUFMAlXTVQJ1pU=;
 b=4IuJZWh+QSHG2+z5/vkqCbAiabD4fiAMhX5CRLmKdExbYZv9GRUfNL/S/D6XVFX1cM
 Qhhz9jeUymhcKSNmPblG4ygjDbn+sjv72dUImTONWgGS+zZoOvGp4AUjI7yzV06N5e7b
 mzkmnNjmZoIrqq2KVpFHSKvgQWSc0DrpFDWLYWZn2mbu6mAFo18K4nofuChmDvBpHoTn
 gRLIABgCJqnaK027CLnfJbsRuKk4AIxDZH0ofPiYF2ZriwKpQZR8jjHMMFIIOUaR57PX
 bDCYfPcVUUbEyLOK5rU7AbWeIgI5kuJEjngt/yIR/RkLp3//SEtIVjggWv42b21Heo84
 jq8A==
X-Gm-Message-State: AOAM5311zLq6Wt2pQiGW0PXdYW5sjo3xwoQE2crXpRjbwc0F87DoFw2Z
 co61gB0R+QdFl4rKxRLEkhXSeqmjvi16i2hpBjY=
X-Google-Smtp-Source: ABdhPJyo+0ckTtzldKOGTmq4rHwm/TJgE/+xOFmFjPFBxRr/0gDEBaJ5d5MvLp/i4OUSBz06P77wtL7/jWEUPggFMr4=
X-Received: by 2002:a05:6602:2599:: with SMTP id
 p25mr2385979ioo.90.1634275315598; 
 Thu, 14 Oct 2021 22:21:55 -0700 (PDT)
MIME-Version: 1.0
References: <20211013205104.1031679-1-richard.henderson@linaro.org>
 <20211013205104.1031679-12-richard.henderson@linaro.org>
In-Reply-To: <20211013205104.1031679-12-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 15 Oct 2021 15:21:29 +1000
Message-ID: <CAKmqyKOPcqMb00pxUCSfPY9vyfACcGg43tdtwOnaT5kHVZZ9iA@mail.gmail.com>
Subject: Re: [PATCH v2 11/13] target/riscv: Adjust trans_rev8_32 for riscv64
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?= <frederic.petrot@univ-grenoble-alpes.fr>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, liuzhiwei <zhiwei_liu@c-sky.com>, 
 Fabien Portas <fabien.portas@grenoble-inp.org>
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
X-List-Received-Date: Fri, 15 Oct 2021 05:22:09 -0000

On Thu, Oct 14, 2021 at 7:08 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> When target_long is 64-bit, we still want a 32-bit bswap for rev8.
> Since this opcode is specific to RV32, we need not conditionalize.
>
> Reviewed-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn_trans/trans_rvb.c.inc | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
> index 66dd51de49..c62eea433a 100644
> --- a/target/riscv/insn_trans/trans_rvb.c.inc
> +++ b/target/riscv/insn_trans/trans_rvb.c.inc
> @@ -232,11 +232,16 @@ static bool trans_rol(DisasContext *ctx, arg_rol *a)
>      return gen_shift(ctx, a, EXT_NONE, tcg_gen_rotl_tl);
>  }
>
> +static void gen_rev8_32(TCGv ret, TCGv src1)
> +{
> +    tcg_gen_bswap32_tl(ret, src1, TCG_BSWAP_OS);
> +}
> +
>  static bool trans_rev8_32(DisasContext *ctx, arg_rev8_32 *a)
>  {
>      REQUIRE_32BIT(ctx);
>      REQUIRE_ZBB(ctx);
> -    return gen_unary(ctx, a, EXT_NONE, tcg_gen_bswap_tl);
> +    return gen_unary(ctx, a, EXT_NONE, gen_rev8_32);
>  }
>
>  static bool trans_rev8_64(DisasContext *ctx, arg_rev8_64 *a)
> --
> 2.25.1
>
>

