Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pJmxq-0007CH-2Z
	for mharc-qemu-riscv@gnu.org; Sun, 22 Jan 2023 21:53:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pJmxo-0007By-Gd; Sun, 22 Jan 2023 21:53:40 -0500
Received: from mail-vk1-xa33.google.com ([2607:f8b0:4864:20::a33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pJmxn-0000lg-27; Sun, 22 Jan 2023 21:53:40 -0500
Received: by mail-vk1-xa33.google.com with SMTP id 12so5331291vkj.12;
 Sun, 22 Jan 2023 18:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2WYC5rBPFTXtPGGGbMHyimbWYUNxJhLQ33nmRBOsDqw=;
 b=XcYWzpivIgQzCDPkk2mVIvfR9M8/q+M/klChO83hy13/WEgly28MMrDE2lwiKG5eX4
 sf5tmpVWDjF/dA5zlvgMU6jgWDe4CcrlVASAGMK65EJQu4UeR/sv//FuB5ZTVIMedXY9
 KVBsgyLj/tX/1UXje9tXVZdrpFSKB3StLmaxxvHbq2nElhsPH+b7ZZJffGp60h65fBjO
 tuXBBNDJbOj3hEUGJEvJ94Qb+GZxX05X7bad5GJydfwWmOcltLwn90e3+u4LmajetkB8
 aVU/m6nsh60hNNrIoCSm+ZuclM94/JqnHtpJLjXssnEEVYvK+pc9qizCMF1e2BH5Ietm
 QIlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2WYC5rBPFTXtPGGGbMHyimbWYUNxJhLQ33nmRBOsDqw=;
 b=vaZUphF2kRoYxjUwcsFByNKMDGsuy5+i7eDin6i1s1FnwAhLo3GNycGasSoIAe0R9X
 IhTBTsWJb+b4SN2rYda2PPQbWCpI8+XKuQGifacmw92vP0mqRI2R7RfPDduT6iksxPkH
 tP1Wt3YwmVFu9v77smsezbdWKgfGoqG+tYEAe/+ofaMpU3X1EfHVNdzeCLbmr+0WWqdC
 5fQa/zG4wGDWtT/qnoIRYFtFJHh5c4BWg6L3W8X9OTy+uFfZkN4tqDDW1xkodiizsfyL
 b7JO+LcOTQ4y4qgn6yBhhDDeVF2EAyOsOeOq7X/MihhhGBWALIvcM4bDQ/p8UboW+6Oq
 znjQ==
X-Gm-Message-State: AFqh2krfqSxW5jb9meIVhg8JboQIuVC8jkIBreTmr4F7WBkQC3/RkjFV
 +KVY/PJMPeGxlrqh30PlbupYCTFwuBZVAADsHIs=
X-Google-Smtp-Source: AMrXdXuc9+N6IpcHh0KVLW4q6WJS3HiatGBxnYY1vGm7k+8Y8p4znQey0urVP8tn3YWJAuGkop7iuJnajzCmRIA6sS0=
X-Received: by 2002:a1f:45cb:0:b0:3e2:3d0:929c with SMTP id
 s194-20020a1f45cb000000b003e203d0929cmr1241498vka.30.1674442417306; Sun, 22
 Jan 2023 18:53:37 -0800 (PST)
MIME-Version: 1.0
References: <20230123000540.58351-1-wilfred.mallawa@opensource.wdc.com>
In-Reply-To: <20230123000540.58351-1-wilfred.mallawa@opensource.wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 23 Jan 2023 12:53:11 +1000
Message-ID: <CAKmqyKOnXPPcHMXe81KTxt9mLz0VjE+QxGybGmKZNzSFhP7KmQ@mail.gmail.com>
Subject: Re: [PATCH] include/hw/riscv/opentitan: update opentitan IRQs
To: Wilfred Mallawa <wilfred.mallawa@opensource.wdc.com>
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com, 
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 Wilfred Mallawa <wilfred.mallawa@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::a33;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa33.google.com
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
X-List-Received-Date: Mon, 23 Jan 2023 02:53:40 -0000

On Mon, Jan 23, 2023 at 10:06 AM Wilfred Mallawa
<wilfred.mallawa@opensource.wdc.com> wrote:
>
> From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
>
> Updates the opentitan IRQs to match the latest supported commit of
> Opentitan from TockOS.
>
> OPENTITAN_SUPPORTED_SHA := 565e4af39760a123c59a184aa2f5812a961fde47
>
> Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  include/hw/riscv/opentitan.h | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/include/hw/riscv/opentitan.h b/include/hw/riscv/opentitan.h
> index 7659d1bc5b..235728b9cc 100644
> --- a/include/hw/riscv/opentitan.h
> +++ b/include/hw/riscv/opentitan.h
> @@ -108,11 +108,11 @@ enum {
>      IBEX_UART0_RX_BREAK_ERR_IRQ   = 6,
>      IBEX_UART0_RX_TIMEOUT_IRQ     = 7,
>      IBEX_UART0_RX_PARITY_ERR_IRQ  = 8,
> -    IBEX_TIMER_TIMEREXPIRED0_0    = 127,
> -    IBEX_SPI_HOST0_ERR_IRQ        = 134,
> -    IBEX_SPI_HOST0_SPI_EVENT_IRQ  = 135,
> -    IBEX_SPI_HOST1_ERR_IRQ        = 136,
> -    IBEX_SPI_HOST1_SPI_EVENT_IRQ  = 137,
> +    IBEX_TIMER_TIMEREXPIRED0_0    = 124,
> +    IBEX_SPI_HOST0_ERR_IRQ        = 131,
> +    IBEX_SPI_HOST0_SPI_EVENT_IRQ  = 132,
> +    IBEX_SPI_HOST1_ERR_IRQ        = 133,
> +    IBEX_SPI_HOST1_SPI_EVENT_IRQ  = 134,
>  };
>
>  #endif
> --
> 2.39.0
>
>

