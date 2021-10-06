Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mYEa5-0006Ft-Od
	for mharc-qemu-riscv@gnu.org; Wed, 06 Oct 2021 17:36:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mYEa3-00069R-9m; Wed, 06 Oct 2021 17:36:03 -0400
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33]:35482)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mYEa1-00025b-FN; Wed, 06 Oct 2021 17:36:03 -0400
Received: by mail-io1-xd33.google.com with SMTP id b78so4469131iof.2;
 Wed, 06 Oct 2021 14:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c7zwKsivambI366QT9b/qdzD1leoB0jH/pqXys4M4EI=;
 b=M+UUwRDhgNo2u/oyFePh/0K05M5XR3eGBQhPmA2AtydsPqW0DiKpMxSZIkGzpUyxQC
 XHaqQsO2aknzKmZ544o4VYEKhD+W3B0WaoNm8gULmISN+RP2qPEikQXiTgN9mT//GyA6
 aUdo9fn2Tfi7BK+LtqF9ajDDTuokQBjvhMMMYV8I/9PYXshowg6IVzzR6vtoofzA9Cmv
 CHAQG1ywbdPqN5ps+j7RKVUhcis8C2hiCNOmSV0NoWy9kTRDdoJ4vRNH7N6woK3LIQLJ
 nw+0uOYgljvvE/y5Lp3rwWxU4QUQZ7PmBo1/p9Pt9k0+ZXMXp4jg/obLHlsQZ34GNDS/
 8/6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c7zwKsivambI366QT9b/qdzD1leoB0jH/pqXys4M4EI=;
 b=vYNyo3FV88yv925qrUCQ03WzV8rYwA9PZaImwBOo4/u5IDNvpbHtfJBH5wYwhPJvVX
 BbAEKui61nCz/98Dw/BR24cq4zE6iPKwth8xFiseehHVcXGqIgbneTttY8+GE6nS7NiE
 vszGHy2DfT9zZz+AvfnH6BCNQVaHYz4rJBGHwnNsRy1/j7c+OOnnmTVT1sa0GOtXCC/w
 PZb950qelyqpDoazSlcSoRxx2guWTQc88Le4JMg0MxSvd16nZ4x0BmCTjeUKxqrJ2XJq
 +/bsE/R3VvgaLRk8xvCssgFn2UdrHvv+VIkwY51UDDwP6iGkt5QW/7LT3ZmPiWxV3rfI
 MYrA==
X-Gm-Message-State: AOAM533CoNCD9CptXr+TF3tgBWxzM7FbQbbNFixIjT1+g05s39E9hWTJ
 GpEVXT4cBR3667/iaBWmqnVHKW6fQOXC4gRbTaE4HvKOTjzvUQ==
X-Google-Smtp-Source: ABdhPJxiXUdb3jpKrL7yUtcQrBrM2JLP1ykyuybwgJn6Gw3CRu1McsY165+GcOCd0jJY6ZTDxarFdScWUGf/ubT9APo=
X-Received: by 2002:a02:ab94:: with SMTP id t20mr45074jan.117.1633556159886;
 Wed, 06 Oct 2021 14:35:59 -0700 (PDT)
MIME-Version: 1.0
References: <20211006172307.780893-1-richard.henderson@linaro.org>
 <20211006172307.780893-18-richard.henderson@linaro.org>
In-Reply-To: <20211006172307.780893-18-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 7 Oct 2021 07:35:34 +1000
Message-ID: <CAKmqyKMfYgP4c=yLwy4zbEWT9t1ekgE8HoiTugaKTacKDgbrPw@mail.gmail.com>
Subject: Re: [PATCH v4 17/41] linux-user/host/riscv: Improve host_signal_write
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d33;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd33.google.com
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
X-List-Received-Date: Wed, 06 Oct 2021 21:36:04 -0000

On Thu, Oct 7, 2021 at 3:37 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Do not read 4 bytes before we determine the size of the insn.
> Simplify triple switches in favor of checking major opcodes.
> Include the missing cases of compact fsd and fsdsp.
>
> Cc: qemu-riscv@nongnu.org
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  linux-user/host/riscv/host-signal.h | 83 ++++++++++-------------------
>  1 file changed, 28 insertions(+), 55 deletions(-)
>
> diff --git a/linux-user/host/riscv/host-signal.h b/linux-user/host/riscv/host-signal.h
> index 5860dce7d7..ab06d70964 100644
> --- a/linux-user/host/riscv/host-signal.h
> +++ b/linux-user/host/riscv/host-signal.h
> @@ -17,65 +17,38 @@ static inline uintptr_t host_signal_pc(ucontext_t *uc)
>
>  static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)
>  {
> -    uint32_t insn = *(uint32_t *)host_signal_pc(uc);
> -
>      /*
> -     * Detect store by reading the instruction at the program
> -     * counter. Note: we currently only generate 32-bit
> -     * instructions so we thus only detect 32-bit stores
> +     * Detect store by reading the instruction at the program counter.
> +     * Do not read more than 16 bits, because we have not yet determined
> +     * the size of the instruction.
>       */
> -    switch (((insn >> 0) & 0b11)) {
> -    case 3:
> -        switch (((insn >> 2) & 0b11111)) {
> -        case 8:
> -            switch (((insn >> 12) & 0b111)) {
> -            case 0: /* sb */
> -            case 1: /* sh */
> -            case 2: /* sw */
> -            case 3: /* sd */
> -            case 4: /* sq */
> -                return true;
> -            default:
> -                break;
> -            }
> -            break;
> -        case 9:
> -            switch (((insn >> 12) & 0b111)) {
> -            case 2: /* fsw */
> -            case 3: /* fsd */
> -            case 4: /* fsq */
> -                return true;
> -            default:
> -                break;
> -            }
> -            break;
> -        default:
> -            break;
> -        }
> +    const uint16_t *pinsn = (const uint16_t *)host_signal_pc(uc);
> +    uint16_t insn = pinsn[0];
> +
> +    /* 16-bit instructions */
> +    switch (insn & 0xe003) {
> +    case 0xa000: /* c.fsd */
> +    case 0xc000: /* c.sw */
> +    case 0xe000: /* c.sd (rv64) / c.fsw (rv32) */
> +    case 0xa002: /* c.fsdsp */
> +    case 0xc002: /* c.swsp */
> +    case 0xe002: /* c.sdsp (rv64) / c.fswsp (rv32) */
> +        return true;
>      }
>
> -    /* Check for compressed instructions */
> -    switch (((insn >> 13) & 0b111)) {
> -    case 7:
> -        switch (insn & 0b11) {
> -        case 0: /*c.sd */
> -        case 2: /* c.sdsp */
> -            return true;
> -        default:
> -            break;
> -        }
> -        break;
> -    case 6:
> -        switch (insn & 0b11) {
> -        case 0: /* c.sw */
> -        case 3: /* c.swsp */
> -            return true;
> -        default:
> -            break;
> -        }
> -        break;
> -    default:
> -        break;
> +    /* 32-bit instructions, major opcodes */
> +    switch (insn & 0x7f) {
> +    case 0x23: /* store */
> +    case 0x27: /* store-fp */
> +        return true;
> +    case 0x2f: /* amo */
> +        /*
> +         * The AMO function code is in bits 25-31, unread as yet.
> +         * The AMO functions are LR (read), SC (write), and the
> +         * rest are all read-modify-write.
> +         */
> +        insn = pinsn[1];
> +        return (insn >> 11) != 2; /* LR */
>      }
>
>      return false;
> --
> 2.25.1
>
>

