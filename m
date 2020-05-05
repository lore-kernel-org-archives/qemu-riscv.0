Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jW4Ux-0003vp-Nw
	for mharc-qemu-riscv@gnu.org; Tue, 05 May 2020 16:49:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jW4Uw-0003vI-Bv; Tue, 05 May 2020 16:49:02 -0400
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43]:45880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jW4Uv-0003Un-9c; Tue, 05 May 2020 16:49:02 -0400
Received: by mail-io1-xd43.google.com with SMTP id i19so3454313ioh.12;
 Tue, 05 May 2020 13:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=406+i9PL1ZVKL0dmCOj9r81iVcvZ1bsf/5hn7k5deQQ=;
 b=bAMU5Jx1lV95o3TBKOJdqgY6orV29t6D74TCUnB8aNkUrfFUOnZENjmd+24udXJQ2m
 snqf+FI4hfQg9KcpHXamxOT88aKC4K4mIc6xaeFQ6nhkNMC/T4Kxb5VhZlDOvyp4xDfw
 +sk2Ptl+ERKpsFTnWL7sx+mTRTM7jpdUy9WupuURJPmBBQjGOupCwf+KlngPIB+mvyhe
 IKa4PGyG6ok+jImx5sW6GMLpd28g3topNXR7ls46zdi1GIIJxzC3Zdjep+QbFCC5pqXb
 Em+Eb/1banerwjv0pFcfApAiF2rcXCEpNCKHZLoyRtN/GJ/xouc73lnl7H2NoTaKy0r3
 v6wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=406+i9PL1ZVKL0dmCOj9r81iVcvZ1bsf/5hn7k5deQQ=;
 b=UXnfpBty7x3FPYUMjyMKQWvKSlbuCmAYjHELwMMbSiVzQ367WzfJin5Nc/k7aM/iea
 zW3Jg93a15sOxlmWX+lmDV8nheVnHOF1bEUB25N2vV3D/0UkCiPDeLuY/xMWgBYW5S0l
 r4R/JQSqfyugHYO2/aGvWR/V+pIJr7GratO7sDyF5Zqoe0gxMFhiY6wnUmxl6xBefPpZ
 R0LwtTyIQXCIBE1zxktoyGmPXN3QSR03ZZZs0XC00C/gUjFTDHyAGu9Y9WWRjf4ZMzoC
 F6XYh7yyHK8+Q/An+yggZE6GlQHhjL4KCLLAACBknirQEW5bmuX8zqaySu5B9zNOXqQk
 YivA==
X-Gm-Message-State: AGi0PuaNJc7Qry+k0UtdEIeyTy1/YKDzebuiwHVzBysxi3iilHWxFYkJ
 pN2XWV3X1gllPJ6Pnsyx4wJiLRAwZmKgZCGpprA=
X-Google-Smtp-Source: APiQypJ1VWmWo26yAvxS0jJSbsg9zTq3xtqqXsWQd/wySmM6ZJdreXv2lIrWscA0GZ5UEmDoadV8Q20kOdElyHmh+R0=
X-Received: by 2002:a02:6243:: with SMTP id d64mr5249560jac.135.1588711739887; 
 Tue, 05 May 2020 13:48:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200501185106.88767-1-josemartins90@gmail.com>
In-Reply-To: <20200501185106.88767-1-josemartins90@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 5 May 2020 13:40:14 -0700
Message-ID: <CAKmqyKPwcUWor2jn_fED8o8+aNOqVm11-q0ijAVWFakwp1CfkQ@mail.gmail.com>
Subject: Re: [PATCH v2] target/riscv: fix check of guest pa top bits
To: Jose Martins <josemartins90@gmail.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d43;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd43.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Tue, 05 May 2020 20:49:02 -0000

On Fri, May 1, 2020 at 11:51 AM Jose Martins <josemartins90@gmail.com> wrote:
>
> The spec states that on sv39x4 guest physical  "address bits 63:41 must
> all be zeros, or else a guest-page-fault exception occurs.".  However,
> the check performed for these top bits of the virtual address on the
> second stage is the same as the one performed for virtual addresses on
> the first stage except with the 2-bit extension, effectively creating
> the same kind of "hole" in the guest's physical address space. I believe
> the following patch fixes this issue:
>
> Signed-off-by: Jose Martins <josemartins90@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Applied to RISC-V tree.

Alistair

> ---
>  target/riscv/cpu_helper.c | 20 +++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 247304d850..ae22c30bdd 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -426,15 +426,21 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
>      int va_bits = PGSHIFT + levels * ptidxbits + widened;
>      target_ulong mask, masked_msbs;
>
> -    if (TARGET_LONG_BITS > (va_bits - 1)) {
> -        mask = (1L << (TARGET_LONG_BITS - (va_bits - 1))) - 1;
> +    if (!first_stage) {
> +        if ((addr >> va_bits) != 0) {
> +            return TRANSLATE_FAIL;
> +        }
>      } else {
> -        mask = 0;
> -    }
> -    masked_msbs = (addr >> (va_bits - 1)) & mask;
> +        if (TARGET_LONG_BITS > (va_bits - 1)) {
> +            mask = (1L << (TARGET_LONG_BITS - (va_bits - 1))) - 1;
> +        } else {
> +            mask = 0;
> +        }
> +        masked_msbs = (addr >> (va_bits - 1)) & mask;
>
> -    if (masked_msbs != 0 && masked_msbs != mask) {
> -        return TRANSLATE_FAIL;
> +        if (masked_msbs != 0 && masked_msbs != mask) {
> +            return TRANSLATE_FAIL;
> +        }
>      }
>
>      int ptshift = (levels - 1) * ptidxbits;
> --
> 2.25.1
>
>

