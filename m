Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n4a09-0001AZ-8S
	for mharc-qemu-riscv@gnu.org; Mon, 03 Jan 2022 21:56:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1n4a05-00019N-Kw; Mon, 03 Jan 2022 21:56:37 -0500
Received: from [2607:f8b0:4864:20::b33] (port=39686
 helo=mail-yb1-xb33.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1n4a04-00025r-5H; Mon, 03 Jan 2022 21:56:37 -0500
Received: by mail-yb1-xb33.google.com with SMTP id d1so83455833ybh.6;
 Mon, 03 Jan 2022 18:56:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=i8Lddyv040IziEPjcOcJtFxp9lsXabJEGaUK/eKyFVo=;
 b=bSq5iryxWmiotP04ecPYRVymVnOkY55gKN0QWXc5Er1NGX6peRLM322dJO2cWfF1Jn
 MLWe678tZI/VCIS+f9SitXAPlDJ/vkngdAdHKLGoPDcbONWYfFKo2mBy1WMQteoZvuqd
 LEBdBJKT6Ihdz5y/6/86e8DMfRhQEzTIjXHZsJ3SbXPMLaeL/ahTMe6/zUw68sljlLhT
 Z625+EedNzrepXyyvXv4i5rzKBFEGjx0lgJrFHggULmIMdK7Zsd8qz7ruIeUtRDmk5sY
 B03PNu55SggNupDWvugB5nFKKJ6uMLif9ynadnRLMj7QaaNILf9eujd7m/7nmdC6Jb3C
 pMbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=i8Lddyv040IziEPjcOcJtFxp9lsXabJEGaUK/eKyFVo=;
 b=eCXZ0SoyRfpbabd3DL/aWuackf1U8e2kCivuj7JFpjQDybHogJqNzsaeCKY06m5y1Z
 HpngwU7s+yaabYK5FR94aqSLT5YdiiFNGRjtGOIU1fJoeWPkgmrqMFKOkMnN5+/dBK4+
 qSjumbM7f507/RWOKN9m1jkcXOqbS1/+9z9Tlh8etGM1mm9q0UFCcESokRxms9ViEqGB
 P1HRl7yFhhdDQQSNVzdcgT06QVfqhVr6hPmMbIvoH/11ybN0jAe3UJU5sZFSnRa1wScs
 K8rVuo0536nR3uP8nnVGw284TKR8RpD5/Go61uz5ATBrjtPU9PUtMZTVFtwXPrIfNeS6
 Tvmw==
X-Gm-Message-State: AOAM533EFmzWqVlhQczAa5KIi9LtiulMNiKX1SAcuuGgNFwulVw+bbvt
 p9A7os7yhntWBMc+TVT1K32i506Q2khMUkLnfUM=
X-Google-Smtp-Source: ABdhPJyzgCcYtNERRQS8t6v21BgrrcU0boDfFbrDcPVitJFQDV4kZUwXc7aqAHaOafqtTuENyKPoDsh8Wib8WwhsCRM=
X-Received: by 2002:a05:6902:681:: with SMTP id
 i1mr50366751ybt.526.1641264995040; 
 Mon, 03 Jan 2022 18:56:35 -0800 (PST)
MIME-Version: 1.0
References: <20211228005236.415583-1-jim.shu@sifive.com>
 <20211228005236.415583-3-jim.shu@sifive.com>
In-Reply-To: <20211228005236.415583-3-jim.shu@sifive.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 4 Jan 2022 10:56:23 +0800
Message-ID: <CAEUhbmWoXcR0vdV82v7Y+zEpvFtyM7FrKV38v4wrmKCBSEWDKg@mail.gmail.com>
Subject: Re: [PATCH 2/2] hw/dma: sifive_pdma: permit 4/8-byte access size of
 PDMA registers
To: Jim Shu <jim.shu@sifive.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Frank Chang <frank.chang@sifive.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b33
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb33.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 04 Jan 2022 02:56:38 -0000

On Tue, Dec 28, 2021 at 8:53 AM Jim Shu <jim.shu@sifive.com> wrote:
>
> It's obvious that PDMA support 64-bit access of 64-bit registers, and

%s/support/supports

> in previous commit, we confirm that PDMA support 32-bit access of both

%s/support/supports

> 32/64-bit registers. Thus, we configure 32/64-bit memory access of
> PDMA registers as valid in general.
>
> Signed-off-by: Jim Shu <jim.shu@sifive.com>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>
> ---
>  hw/dma/sifive_pdma.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/hw/dma/sifive_pdma.c b/hw/dma/sifive_pdma.c
> index b8b198ab4e..731fcdcf89 100644
> --- a/hw/dma/sifive_pdma.c
> +++ b/hw/dma/sifive_pdma.c
> @@ -441,6 +441,10 @@ static const MemoryRegionOps sifive_pdma_ops = {
>      .impl = {
>          .min_access_size = 4,
>          .max_access_size = 8,
> +    },
> +    .valid = {
> +        .min_access_size = 4,
> +        .max_access_size = 8,
>      }
>  };
>

Otherwise,

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Tested-by: Bin Meng <bmeng.cn@gmail.com>

