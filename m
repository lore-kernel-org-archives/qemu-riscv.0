Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oNUQZ-0004tc-Uo
	for mharc-qemu-riscv@gnu.org; Mon, 15 Aug 2022 03:22:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oNUQY-0004tI-MZ; Mon, 15 Aug 2022 03:22:22 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:36843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oNUQO-0007lu-7f; Mon, 15 Aug 2022 03:22:22 -0400
Received: by mail-pl1-x636.google.com with SMTP id x10so5713486plb.3;
 Mon, 15 Aug 2022 00:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=dmfbuDLJ6Q3FvOkoWKlh63QYIsWXLm8WDQ+AhB6NsrQ=;
 b=cMuwGcwhBVkD7jiwPs0lu8UY11f5FsKBfHCAJ85X0tb25uBqr/0Qr5q7h6/ZsaVgCa
 +tOVPWXd+F8Igeuej4AVDFrH6Uwm5mTfwu28RAI0Ng1un5ddLHyxqKJgrmBZifcZ99WK
 4nRJmwEozvBFDXMsABXD1+S8TwvadTGtRdSPKFn7dFrVGvHqaHNrO0hmSXa9WOZY9ii9
 npaDth7wzMcFeiiG8P42fl4KG+ALyxN9aKgboJnrMUseRfzj9mImg9nONamvBktQo/G5
 IPxX6bjLah/7Iu0Q6a+RDt1zd3Hv/ljTd3jd72qVrC7S7CQMCPgJ3N5LiiwY342t25oz
 ItRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=dmfbuDLJ6Q3FvOkoWKlh63QYIsWXLm8WDQ+AhB6NsrQ=;
 b=GycMrYhIWjcWwUAE5gEUYW9WNQdY3anACSeCYtXq+OLaufX/ZgvM25qW4O0fgDVDsc
 B7OCHOvWMbqlII652zAeqLEUoJCiCFIjt4FyIU0A2Fxb6ExwL7tulLg2YpuP5OKAkVVM
 3rB/tu11bRvJ8223WR6bSbperx0ZZLsgE7wq2hvT4fyr5oGZ4IHsqv3/mcwqw/ydWtDR
 zk2t+Tl07/bVn63eoE7alkGZ64LSxb4ufUCTBbQCEeRE0BCymuhChvDmE+OqzkKQn8KB
 K4l4YWTMizzlPIScfzIOcJlC/5afyyfjm1P2jpzIKtT/VAYASML28pQxEhGDvNUuPIm0
 ZJ5A==
X-Gm-Message-State: ACgBeo0YezXloI3tnpCeg7SbUV9l7zFvudZk/6gSxSelcsBlBdIUSk9/
 aBdvrpOIVHqMxndZ19h/a+ffR9Z1+kEkQebZxTI=
X-Google-Smtp-Source: AA6agR4Ng0YzjKGItUdauZt4/kPTeKA5G4yyjhvWij5sLy2wpNO+iQpyN5jfG7tu+pDHYAAmiu2V/GxMDzo08MgkIQo=
X-Received: by 2002:a17:90b:100e:b0:1f3:a4a:2620 with SMTP id
 gm14-20020a17090b100e00b001f30a4a2620mr16767338pjb.120.1660548130332; Mon, 15
 Aug 2022 00:22:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220815031624.170857-1-wilfred.mallawa@opensource.wdc.com>
 <20220815031624.170857-5-wilfred.mallawa@opensource.wdc.com>
In-Reply-To: <20220815031624.170857-5-wilfred.mallawa@opensource.wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 15 Aug 2022 17:21:44 +1000
Message-ID: <CAKmqyKNn9p7z=1590Uwz0Tr64J-HVW+_6Pq4jkcHuedY7etOuA@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] hw/ssi: ibex_spi: update reg addr
To: Wilfred Mallawa <wilfred.mallawa@opensource.wdc.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Wilfred Mallawa <wilfred.mallawa@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=alistair23@gmail.com; helo=mail-pl1-x636.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 15 Aug 2022 07:22:22 -0000

On Mon, Aug 15, 2022 at 1:20 PM Wilfred Mallawa
<wilfred.mallawa@opensource.wdc.com> wrote:
>
> From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
>
> Updates the `EVENT_ENABLE` register to offset `0x34` as per
> OpenTitan spec [1].
>
> [1] https://docs.opentitan.org/hw/ip/spi_host/doc/#Reg_event_enable
>
> Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/ssi/ibex_spi_host.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/ssi/ibex_spi_host.c b/hw/ssi/ibex_spi_host.c
> index 19dd094d76..3b8dcbce05 100644
> --- a/hw/ssi/ibex_spi_host.c
> +++ b/hw/ssi/ibex_spi_host.c
> @@ -93,7 +93,7 @@ REG32(ERROR_STATUS, 0x30)
>      FIELD(ERROR_STATUS, CMDINVAL, 3, 1)
>      FIELD(ERROR_STATUS, CSIDINVAL, 4, 1)
>      FIELD(ERROR_STATUS, ACCESSINVAL, 5, 1)
> -REG32(EVENT_ENABLE, 0x30)
> +REG32(EVENT_ENABLE, 0x34)
>      FIELD(EVENT_ENABLE, RXFULL, 0, 1)
>      FIELD(EVENT_ENABLE, TXEMPTY, 1, 1)
>      FIELD(EVENT_ENABLE, RXWM, 2, 1)
> --
> 2.37.1
>
>

