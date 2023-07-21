Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B5F1EB64DC
	for <qemu-riscv@archiver.kernel.org>; Fri, 21 Jul 2023 10:21:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qMnFD-0001OM-Fu; Fri, 21 Jul 2023 06:20:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qMnFB-0001Nc-T6
 for qemu-riscv@nongnu.org; Fri, 21 Jul 2023 06:20:17 -0400
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qMnF9-0005rJ-7v
 for qemu-riscv@nongnu.org; Fri, 21 Jul 2023 06:20:17 -0400
Received: by mail-oo1-xc36.google.com with SMTP id
 006d021491bc7-565a8d9d832so1171607eaf.1
 for <qemu-riscv@nongnu.org>; Fri, 21 Jul 2023 03:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1689934809; x=1690539609;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rfUC5HuPj86tZ06Bu45DA3Hlsmr9WK4+5lOu3mhk+tw=;
 b=MsjcDa3gmvBh0LuBy+fByrVkSKoChQhOHS2J6TDQkFyrpMdPa63XskOyCSRxxCMbXr
 6jG9PTQ7Z/M+x6fyXD9GzDv5oQUqwRdZvGBGlszFgkr58ABvzfa6uUsuz9yeTcErB8zb
 hlmdmc9Z9AA9Jewfcaet4bbQgMGhArYNOK9Pj9SHwWeuGSQpE9Wmr/qCEM0ntcv1JzGN
 HVzR+tIYXTAoc21iAcqc6tlDfITFhnSI4HOStDXAYCNSMRbGLCTLyTV+BmTnliZF65Lx
 4VgthupDPKv+Sy6KYNkvUlCBuDE/KZl88wuvXSzp1w1D3cAcHMMVOeNJEKZ5c69/pTkl
 vE2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689934809; x=1690539609;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rfUC5HuPj86tZ06Bu45DA3Hlsmr9WK4+5lOu3mhk+tw=;
 b=HmxkaHkZfAp1+JzS6FaSLQOTuHzlqNjcsyQMljsWWwklwKSTHbBjHcyDeAjUOsIHBS
 eGRewpMtjlO0UfjPRTJaf3j0ZUhWSOaE6gv6ASrX9e05VUQPBhDuM5FnXRtloNfIwq2w
 sJFpbd3LAUiC+k3nsTKBw440/ffbSa91YeCSnoSKp3q8F3YBbhEB57TPpvrXF76v2JnM
 fvDeWw0YVCtEcumLamLAn8eVGomoqsjABERPUzGNyh7H+36ztt2JbQgKVGow8Ts5dX32
 uY3v3o6IZI0DWQ41pIA3/CctRJjGpPRC7COHGrf4hhco1Sh/bnsKGpv4vrytpE9f6f+/
 Yegg==
X-Gm-Message-State: ABy/qLaD4wScWRCorHfEnOPl3N4tSobnfXr8AWpcdrXkFdoUPZFwz+4W
 9gVKXw2CP9PBCvqUe4x4H0a5Ig==
X-Google-Smtp-Source: APBJJlE1YUXnJUEUanyo2C6tg7zNUcCQMt1gSmGmwv5Quhed5AFyXvilgKsLiZYPPOypytF63mYswA==
X-Received: by 2002:a4a:3c5c:0:b0:566:fcc8:5b6e with SMTP id
 p28-20020a4a3c5c000000b00566fcc85b6emr1502210oof.6.1689934808926; 
 Fri, 21 Jul 2023 03:20:08 -0700 (PDT)
Received: from [192.168.68.108] (201-69-66-211.dial-up.telesp.net.br.
 [201.69.66.211]) by smtp.gmail.com with ESMTPSA id
 w1-20020a4a5d01000000b00565fcfabab8sm1396589ooa.21.2023.07.21.03.20.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Jul 2023 03:20:08 -0700 (PDT)
Message-ID: <35d454dd-babf-bc59-b8bb-b430e7f7103a@ventanamicro.com>
Date: Fri, 21 Jul 2023 07:20:03 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/2] hw/char/riscv_htif: Fix printing of console
 characters on big endian hosts
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: qemu-stable@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-riscv@nongnu.org, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
References: <20230721094720.902454-1-thuth@redhat.com>
 <20230721094720.902454-2-thuth@redhat.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230721094720.902454-2-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c36;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc36.google.com
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
> The character that should be printed is stored in the 64 bit "payload"
> variable. The code currently tries to print it by taking the address
> of the variable and passing this pointer to qemu_chr_fe_write(). However,
> this only works on little endian hosts where the least significant bits
> are stored on the lowest address. To do this in a portable way, we have
> to store the value in an uint8_t variable instead.
> 
> Fixes: 5033606780 ("RISC-V HTIF Console")
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   hw/char/riscv_htif.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/char/riscv_htif.c b/hw/char/riscv_htif.c
> index 37d3ccc76b..f96df40124 100644
> --- a/hw/char/riscv_htif.c
> +++ b/hw/char/riscv_htif.c
> @@ -232,7 +232,8 @@ static void htif_handle_tohost_write(HTIFState *s, uint64_t val_written)
>               s->tohost = 0; /* clear to indicate we read */
>               return;
>           } else if (cmd == HTIF_CONSOLE_CMD_PUTC) {
> -            qemu_chr_fe_write(&s->chr, (uint8_t *)&payload, 1);
> +            uint8_t ch = (uint8_t)payload;
> +            qemu_chr_fe_write(&s->chr, &ch, 1);
>               resp = 0x100 | (uint8_t)payload;
>           } else {
>               qemu_log("HTIF device %d: unknown command\n", device);

