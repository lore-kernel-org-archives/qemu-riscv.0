Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oWGhG-0000b2-A2
	for mharc-qemu-riscv@gnu.org; Thu, 08 Sep 2022 08:32:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oWGgm-0000YH-1J; Thu, 08 Sep 2022 08:31:34 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:56085)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oWGgj-0000Kb-B8; Thu, 08 Sep 2022 08:31:23 -0400
Received: by mail-pj1-x1034.google.com with SMTP id fs14so12823092pjb.5;
 Thu, 08 Sep 2022 05:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=yEQm1a1GDUKF0EOYrw8XdUIuuEQzQPVcdB3MT/vDkVw=;
 b=jy/vtKytKfIf5N6wuyAuzOeYKsHutFvGXAdm1bn04t6NWrD0tOTKz/9H3PaFISyFKp
 dRGJp2Vza9j91ZdOEFv/tosfVE2dRxB5WmEHULga6GjgA4iLpBetsp+Kg2VNkiDtanP+
 WmvAeZG3tygSBYjdhDsFGhwguYk0TDcPTrhqu8loWm2vS+ta095n5B0OeA4fVrp79hM0
 J/pfoCA1MUjkp3lQ8JnhGMw8KqfbCFgzHl/yO7hnJgZM8Umt6zjcEMz2g9btHjC8F0tM
 lmAFtNIVlhU/k7jdwEnDOmi+zEbOyEMeygYqkV3g+VHzuhwJkSJo5+omvKwU7+4UHjq9
 LyWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=yEQm1a1GDUKF0EOYrw8XdUIuuEQzQPVcdB3MT/vDkVw=;
 b=JHdJf7a7wf0dgSWKEh8KHD8ZLmVHSfuk4FrEildfpncP54cEHDYhAR0Qsd53f+1kiE
 CmnbduH4aG9UXkevPnYUKUjhb/6mpxqVqiHfncuhsHcm4EUQ78u9xZJ32FwpwqhVIGPQ
 8jbGb5xJpXmWI0xf/jW4Y9Li5VV3YGH3pLHc9GvqKC5EirrDEtAvn999rxM2XzLJ3Ysh
 Ko+WwJ/N/UJuhYDmJoE/VAwElrVM37oyHS462gkHY+hI6uSAFFLLSIam+7wTR2r47lmc
 LMkmlSFi+g/1h7wiNxzX8U0VLF7ibQ48vlhy/YgsPPIj8N+dDbqz6WPPl7ljqptd933P
 Gb0g==
X-Gm-Message-State: ACgBeo3r4v3/+dV1i0guiwithmjfaWFpY9U9tG+RzjACd1S4+nBMxvlE
 0Uc+c93VGqp3DrjDbJO5OOmGeNMdcrZAKuk2A4M=
X-Google-Smtp-Source: AA6agR6LEs1lclmtt88FTUg7+dup38ifE/TklKycpM4LWWlCr3Cz8/eKab5N4jz88rH9TA9kX8jgxXgX89wxFOLmlvM=
X-Received: by 2002:a17:902:f64f:b0:172:a790:320a with SMTP id
 m15-20020a170902f64f00b00172a790320amr8827471plg.149.1662640278514; Thu, 08
 Sep 2022 05:31:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220824145255.400040-1-rpathak@ventanamicro.com>
In-Reply-To: <20220824145255.400040-1-rpathak@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 8 Sep 2022 14:30:52 +0200
Message-ID: <CAKmqyKPzMAugK+Q0y9CkZQwnt6h8UYXjtMU7xUBKpt119w-tNA@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Remove sideleg and sedeleg
To: Rahul Pathak <rpathak@ventanamicro.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Rahul Pathak <rpathakmailbox@gmail.com>, 
 Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=alistair23@gmail.com; helo=mail-pj1-x1034.google.com
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
X-List-Received-Date: Thu, 08 Sep 2022 12:31:42 -0000

On Wed, Aug 24, 2022 at 4:54 PM Rahul Pathak <rpathak@ventanamicro.com> wrote:
>
> sideleg and sedeleg csrs are not part of riscv isa spec
> anymore, these csrs were part of N extension which
> is removed from the riscv isa specification.
>
> These commits removed all traces of these csrs from
> riscv spec (https://github.com/riscv/riscv-isa-manual) -
>
> commit f8d27f805b65 ("Remove or downgrade more references to N extension (#674)")
> commit b6cade07034d ("Remove N extension chapter for now")
>
> Signed-off-by: Rahul Pathak <rpathak@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  disas/riscv.c           | 2 --
>  target/riscv/cpu_bits.h | 2 --
>  2 files changed, 4 deletions(-)
>
> diff --git a/disas/riscv.c b/disas/riscv.c
> index 7af6afc8fa..a709d66167 100644
> --- a/disas/riscv.c
> +++ b/disas/riscv.c
> @@ -1304,8 +1304,6 @@ static const char *csr_name(int csrno)
>      case 0x0043: return "utval";
>      case 0x0044: return "uip";
>      case 0x0100: return "sstatus";
> -    case 0x0102: return "sedeleg";
> -    case 0x0103: return "sideleg";
>      case 0x0104: return "sie";
>      case 0x0105: return "stvec";
>      case 0x0106: return "scounteren";
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index 6be5a9e9f0..7251121218 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -190,8 +190,6 @@
>
>  /* Supervisor Trap Setup */
>  #define CSR_SSTATUS         0x100
> -#define CSR_SEDELEG         0x102
> -#define CSR_SIDELEG         0x103
>  #define CSR_SIE             0x104
>  #define CSR_STVEC           0x105
>  #define CSR_SCOUNTEREN      0x106
> --
> 2.34.1
>
>

