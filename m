Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1D78EB64DC
	for <qemu-riscv@archiver.kernel.org>; Fri, 21 Jul 2023 10:20:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qMnFL-0001Q0-Km; Fri, 21 Jul 2023 06:20:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qMnFE-0001Om-OO
 for qemu-riscv@nongnu.org; Fri, 21 Jul 2023 06:20:20 -0400
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qMnFC-00065I-J5
 for qemu-riscv@nongnu.org; Fri, 21 Jul 2023 06:20:20 -0400
Received: by mail-oi1-x231.google.com with SMTP id
 5614622812f47-3a1ebb85f99so1284529b6e.2
 for <qemu-riscv@nongnu.org>; Fri, 21 Jul 2023 03:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1689934817; x=1690539617;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jFWkYtetezdFc9lzRYqCl1YXATFrTSOxidKcr8+pxdc=;
 b=YNW7Ks/ffotHrYR+ZxNKV/zI6keGZVTXcVjc2C+tz/8ug7xzsxnlrXpqbxAXAJRtUg
 wBfeLGt2gNwQy2+WQgUqco59vmU0gFj3ghkUOOjNmwQURgreGd3CvRCj+ZFRRi4rSzSC
 CnAVfIALyU+eZSJ9FpTCfxFgIPFMqzVczyKLhsbJhEB1XoEqADg6gm4ohkf9QYzysu4j
 a9r2Gs2B4zAbWQSLDVmgSwxQTdHYwB3LnKrZ4eY/Kt2k3IPEVfq00pA1ru6v6JWfB4OX
 ueIC42EWYs3ZyCZ/CP2vo9+ah5KLj63lKyDG6owPb8aQn6LIjQ8zMYNmrsljGCG2YYpE
 uPgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689934817; x=1690539617;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jFWkYtetezdFc9lzRYqCl1YXATFrTSOxidKcr8+pxdc=;
 b=OqyYo70cqhV3Qlr6/sRNU6rw3pQJn78Azb48GfIbbeIptw/pX4ZOadGJTvWrrAOr8o
 x/K5Fps7N/cli75GpSmX7O4CnWQqCC0giNxHYWr0OY1/sqShH4JQ7tTlD/SQ/TNgg153
 vFzzZflvZsJAmRU2Z0UzOA5CLB1qm6WPon1Z4vqimk/lkKEbb409l1G5pezTuqov8ydK
 3ZwLDsTLZTzI/Asnekv/c1bxHuphDW2vCtSZ2BHYbxdcpLgszLpEN9zTH/G/OfWy/xZ3
 3/TP7U8KnstIZVnHOXx5JlR39/xsh/1eefwdDTBBB6LyRQ5iOrCX0BiHP0hZi2R/uDu0
 6Ddw==
X-Gm-Message-State: ABy/qLZd3fgE0i2eu6Hce8Zv4AoGsksByacPQRzWzY4l2hQFn63vMebn
 0qEX5Y92KGVCAkRVIx5UqCK1Ng==
X-Google-Smtp-Source: APBJJlET86qVPQf5ZPywJzj0wrqZMa+BwUjyPhvNHsKk5zD0WS1/jqw47GGWs5UOHXttid2Z4jywrQ==
X-Received: by 2002:a05:6808:bc1:b0:3a1:eb47:a943 with SMTP id
 o1-20020a0568080bc100b003a1eb47a943mr1996240oik.10.1689934817277; 
 Fri, 21 Jul 2023 03:20:17 -0700 (PDT)
Received: from [192.168.68.108] (201-69-66-211.dial-up.telesp.net.br.
 [201.69.66.211]) by smtp.gmail.com with ESMTPSA id
 d5-20020a05680813c500b003a1e38362b7sm1254585oiw.25.2023.07.21.03.20.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Jul 2023 03:20:16 -0700 (PDT)
Message-ID: <fcee58c0-0e25-32dc-e6b2-6fda3464a088@ventanamicro.com>
Date: Fri, 21 Jul 2023 07:20:13 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/2] hw/char/riscv_htif: Fix the console syscall on big
 endian hosts
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: qemu-stable@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-riscv@nongnu.org, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
References: <20230721094720.902454-1-thuth@redhat.com>
 <20230721094720.902454-3-thuth@redhat.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230721094720.902454-3-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x231.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.096,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org



On 7/21/23 06:47, Thomas Huth wrote:
> Values that have been read via cpu_physical_memory_read() from the
> guest's memory have to be swapped in case the host endianess differs
> from the guest.
> 
> Fixes: a6e13e31d5 ("riscv_htif: Support console output via proxy syscall")
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   hw/char/riscv_htif.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/char/riscv_htif.c b/hw/char/riscv_htif.c
> index f96df40124..40de6b8b77 100644
> --- a/hw/char/riscv_htif.c
> +++ b/hw/char/riscv_htif.c
> @@ -30,6 +30,7 @@
>   #include "qemu/timer.h"
>   #include "qemu/error-report.h"
>   #include "exec/address-spaces.h"
> +#include "exec/tswap.h"
>   #include "sysemu/dma.h"
>   
>   #define RISCV_DEBUG_HTIF 0
> @@ -209,11 +210,11 @@ static void htif_handle_tohost_write(HTIFState *s, uint64_t val_written)
>               } else {
>                   uint64_t syscall[8];
>                   cpu_physical_memory_read(payload, syscall, sizeof(syscall));
> -                if (syscall[0] == PK_SYS_WRITE &&
> -                    syscall[1] == HTIF_DEV_CONSOLE &&
> -                    syscall[3] == HTIF_CONSOLE_CMD_PUTC) {
> +                if (tswap64(syscall[0]) == PK_SYS_WRITE &&
> +                    tswap64(syscall[1]) == HTIF_DEV_CONSOLE &&
> +                    tswap64(syscall[3]) == HTIF_CONSOLE_CMD_PUTC) {
>                       uint8_t ch;
> -                    cpu_physical_memory_read(syscall[2], &ch, 1);
> +                    cpu_physical_memory_read(tswap64(syscall[2]), &ch, 1);
>                       qemu_chr_fe_write(&s->chr, &ch, 1);
>                       resp = 0x100 | (uint8_t)payload;
>                   } else {

