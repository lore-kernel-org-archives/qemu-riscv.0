Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oM971-0003vB-D5
	for mharc-qemu-riscv@gnu.org; Thu, 11 Aug 2022 10:24:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1oM96z-0003ta-IW
 for qemu-riscv@nongnu.org; Thu, 11 Aug 2022 10:24:37 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:41559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1oM96y-00064d-0S
 for qemu-riscv@nongnu.org; Thu, 11 Aug 2022 10:24:37 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 az6-20020a05600c600600b003a530cebbe3so2766517wmb.0
 for <qemu-riscv@nongnu.org>; Thu, 11 Aug 2022 07:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=GIcHkvQVyf94dhEEk0HFuPwk/rwKl+xWHhYwOdFaSJM=;
 b=cZIc3y+x+tXPoHH/J5Aly+wbSZHa4o/KbmnDP7m1yvTMg4dm63Lh2m0AUOpUIb9gJp
 J+2Nb/ZyO4agOcWY3J7HRqivyTlP78/Pe6tbUUWh+aROyUlhL6m61JMEO1SY8XJgzfAU
 N57luWR+JdXBMPGbwARrN+DF8nJV5aV/yFUPvDP2UZ9h4bEVAZemCBCzfBPlvNBvUgjM
 NEYgvEn6z0b6jUuM4FKPUzkCZeDJeZXZ5IwTrF2q51vmo1SuOzZRGz3/VUerbbaYDdKd
 IZDmiTyZ+4D1btkTpeaBfGmcy/tzpYFn9wOnlT3Cbx3g11yBTl+yogXhaWvaUcbnbSjF
 jZ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=GIcHkvQVyf94dhEEk0HFuPwk/rwKl+xWHhYwOdFaSJM=;
 b=iRu1sakKyuG958kOT5hNdn61nj3Gi73Aup1MDTL9hNMXZckQ4MsJNR7zwTP3yRHE+m
 C0a674RwrwNsLqz5vmXnqNXXWl548BQ4HDuLFpyO/zUb7PuVVNlyY0lQEz/yGz2HQJ8k
 NGvJRMvHZ0QqEgwXxCpCobduUcpM7eVe8bHpT0enA6IoQrwDOh+/FmKB+wfV+SkoJdeI
 SlghyZtlxCcx9Q76RsCBrPXrDJ1eLGt/l5sRExAyidna4ymgOmmTALQD7Gyfb8qE/CLS
 xb03K6R3MIHy0huVq1Ussd2ynU+F6z3C0CgLwnG5vMNfixPjFJh63Kcorvm65YxsN0aJ
 wuzg==
X-Gm-Message-State: ACgBeo022xLlb9ef6W+4KjMpk5dipUCaEIbQnoCwiHNrfyjsTsAPoC+X
 Xt++UIuKWGn1sbdxYQGTrut0ig==
X-Google-Smtp-Source: AA6agR4MuXSq2PBnFCubNlufSnh0LCi5uoSIuQA7rmm9GYQ1HLOi28zmvkpAOW+o4gJBKYccSvcchg==
X-Received: by 2002:a05:600c:204a:b0:3a5:c272:c113 with SMTP id
 p10-20020a05600c204a00b003a5c272c113mr1152017wmg.13.1660227874742; 
 Thu, 11 Aug 2022 07:24:34 -0700 (PDT)
Received: from localhost (cst2-173-67.cust.vodafone.cz. [31.30.173.67])
 by smtp.gmail.com with ESMTPSA id
 m3-20020a05600c4f4300b003a3200bc788sm6989786wmq.33.2022.08.11.07.24.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Aug 2022 07:24:34 -0700 (PDT)
Date: Thu, 11 Aug 2022 16:24:33 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Wilfred Mallawa <wilfred.mallawa@opensource.wdc.com>
Cc: Alistair.Francis@wdc.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Wilfred Mallawa <wilfred.mallawa@wdc.com>
Subject: Re: [PATCH 1/3] hw/ssi: fixup typos in ibex_spi_host
Message-ID: <20220811142433.6mecilgt4qpaetua@kamzik>
References: <20220810230200.149398-1-wilfred.mallawa@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220810230200.149398-1-wilfred.mallawa@opensource.wdc.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=ajones@ventanamicro.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Thu, 11 Aug 2022 14:24:37 -0000

On Thu, Aug 11, 2022 at 09:01:58AM +1000, Wilfred Mallawa wrote:
> From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
> 
> This patch fixes up minor typos in ibex_spi_host
> 
> Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
> ---
>  hw/ssi/ibex_spi_host.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/ssi/ibex_spi_host.c b/hw/ssi/ibex_spi_host.c
> index d14580b409..601041d719 100644
> --- a/hw/ssi/ibex_spi_host.c
> +++ b/hw/ssi/ibex_spi_host.c
> @@ -172,7 +172,7 @@ static void ibex_spi_host_irq(IbexSPIHostState *s)
>                          & R_INTR_STATE_SPI_EVENT_MASK;
>      int err_irq = 0, event_irq = 0;
>  
> -    /* Error IRQ enabled and Error IRQ Cleared*/
> +    /* Error IRQ enabled and Error IRQ Cleared */
>      if (error_en && !err_pending) {
>          /* Event enabled, Interrupt Test Error */
>          if (s->regs[IBEX_SPI_HOST_INTR_TEST] & R_INTR_TEST_ERROR_MASK) {
> @@ -434,7 +434,7 @@ static void ibex_spi_host_write(void *opaque, hwaddr addr,
>      case IBEX_SPI_HOST_TXDATA:
>          /*
>           * This is a hardware `feature` where
> -         * the first word written TXDATA after init is omitted entirely
> +         * the first word written to TXDATA after init is omitted entirely
>           */
>          if (s->init_status) {
>              s->init_status = false;
> @@ -487,7 +487,7 @@ static void ibex_spi_host_write(void *opaque, hwaddr addr,
>          break;
>      case IBEX_SPI_HOST_ERROR_STATUS:
>      /*
> -     *  Indicates that any errors that have occurred.
> +     *  Indicates any errors that have occurred.
>       *  When an error occurs, the corresponding bit must be cleared
>       *  here before issuing any further commands
>       */
> -- 
> 2.37.1
> 
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

