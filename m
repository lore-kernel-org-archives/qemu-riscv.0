Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kzkyL-000357-Vy
	for mharc-qemu-riscv@gnu.org; Wed, 13 Jan 2021 13:34:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kzkyI-00033H-8c; Wed, 13 Jan 2021 13:34:18 -0500
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32]:34434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kzkyC-00054o-Al; Wed, 13 Jan 2021 13:34:15 -0500
Received: by mail-io1-xd32.google.com with SMTP id u17so6188065iow.1;
 Wed, 13 Jan 2021 10:34:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nFiHzUGdOnxgADp/IprQYlmXs2eCeT10BNnUJxKlJxU=;
 b=XpTiVZrZzc/CtHD3o6ZDgiQl1ciVlyZ8c/k6NdwqPUIk+Oq632eE2AAHd0rJVHk35L
 bkpP+muAczGZgOeH2nfvEHMKrRHFOP9q+QBNz/Bx4oMbMBLn7Oq2wpuUoEvotEi5sZMS
 YezgANjsIgKLY/db2F+QQjAEzcFVC+QbnQ8PQv3MPwF7IjkeVdj7nagM+QUEo6w1Ni8g
 INEpm1vGDzPi2ZiDpUCLfuIxhcGnDfbZLKovGiDP5lry9vSwaGDwCO89a7Pvis56FMCl
 gM5RtOfH1gVC496UDNm8hKONejDZSnx4nnkrl/7xzjl/cwjJR5M0OSEwav2FdYuGJMcM
 gf4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nFiHzUGdOnxgADp/IprQYlmXs2eCeT10BNnUJxKlJxU=;
 b=gqsyAvkKcnW103KgyI2twwZZlp9hyeOEDpwNdpqEFCx3TCGbNB9wIdnWZrwtYoBG1P
 U94g11X/j9CI7RlrZUCJy/mclpGIcWBCYkLMtTFCdX/CO72xXE+cm8J63ffpm/W4k1BZ
 g3ZYutFiVy2aowLgR96rJUNW4VPhjKo/RgrIDV9QH0+yKpyIPxmpRtneXtzqoTBN52Yf
 whodxdsh0HdvcaEXYPyxEorFs8AEBQn8GrWfaFO0aOg8Imt4x1b8x2SchyuIyE354gMa
 zYE0JUVJDsg9vpv36E3R6CTkQxeP9qktZ7rUFaB9ar5z00SMW2+DwT11xdGl1icc8aZF
 pJIA==
X-Gm-Message-State: AOAM531topY14xARzpttgH/Y5YSH1s/oaiEbRhEAgWSFLessyN/yrQWV
 Y80ABX5UQil/rqTvmHu0wJ85g+s2WLW2XM2BkTw=
X-Google-Smtp-Source: ABdhPJx8t1rDlP1taoV1py/GZDB2TkxOVd4uv3QTx4Bp7t3tTm7ngm1ror7J0OKG20CJuQr+rw6U0e1n6qUgSLDxiok=
X-Received: by 2002:a05:6638:83:: with SMTP id
 v3mr3500406jao.106.1610562848867; 
 Wed, 13 Jan 2021 10:34:08 -0800 (PST)
MIME-Version: 1.0
References: <20201231113010.27108-1-bmeng.cn@gmail.com>
 <20201231113010.27108-21-bmeng.cn@gmail.com>
In-Reply-To: <20201231113010.27108-21-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 13 Jan 2021 10:33:42 -0800
Message-ID: <CAKmqyKMqTR2Ju4fWWU+BQi0yNjYSmOLXyC1CcwXGaZv04KzAvg@mail.gmail.com>
Subject: Re: [PATCH 20/22] docs/system: Sort targets in alphabetical order
To: Bin Meng <bmeng.cn@gmail.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Alistair Francis <alistair.francis@wdc.com>, Qemu-block <qemu-block@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d32;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd32.google.com
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
X-List-Received-Date: Wed, 13 Jan 2021 18:34:20 -0000

On Thu, Dec 31, 2020 at 3:50 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  docs/system/targets.rst | 19 ++++++++++++-------
>  1 file changed, 12 insertions(+), 7 deletions(-)
>
> diff --git a/docs/system/targets.rst b/docs/system/targets.rst
> index 560783644d..564cea9a9b 100644
> --- a/docs/system/targets.rst
> +++ b/docs/system/targets.rst
> @@ -7,16 +7,21 @@ various targets are mentioned in the following sections.
>
>  Contents:
>
> +..
> +   This table of contents should be kept sorted alphabetically
> +   by the title text of each file, which isn't the same ordering
> +   as an alphabetical sort by filename.
> +
>  .. toctree::
>
> -   target-i386
> +   target-arm
> +   target-avr
> +   target-m68k
> +   target-mips
>     target-ppc
> +   target-rx
> +   target-s390x
>     target-sparc
>     target-sparc64
> -   target-mips
> -   target-arm
> -   target-m68k
> +   target-i386
>     target-xtensa
> -   target-s390x
> -   target-rx
> -   target-avr
> --
> 2.25.1
>
>

