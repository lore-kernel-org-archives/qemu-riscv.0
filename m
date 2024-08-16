Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5267FC3DA4A
	for <qemu-riscv@archiver.kernel.org>; Fri, 16 Aug 2024 11:39:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sevIX-0002I6-EH; Fri, 16 Aug 2024 07:39:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1sevIR-0002FD-FR
 for qemu-riscv@nongnu.org; Fri, 16 Aug 2024 07:39:09 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1sevIP-0007O5-JS
 for qemu-riscv@nongnu.org; Fri, 16 Aug 2024 07:39:07 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-2d3c05dc63eso1394189a91.0
 for <qemu-riscv@nongnu.org>; Fri, 16 Aug 2024 04:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1723808343; x=1724413143; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YrXmJP0T5PuESmfzLa5Jje7GuulXuQ6qTfUpaeTPhEw=;
 b=OyYZ8hdO8kQJN3ioN6kst0x3P5xKi7KV1b4y+KLvOzO+LhVaRtH0rq0ok792Iwfkmx
 6qJczN0aUtwEmwlHkwGu5hVpm85oXFI0HWtt6aZ07R6hYvprFSeb8pQiYDtsGkZBc1BB
 NHvuzYBkMyPxJ1xd+wk8PP82Wq0E2YZ72Q0dPpr9HTD/INqr+tjNi1nQHc9wEtA9Y+ra
 9xDcRWOivSKpyDw5pf/bGz+jrB2G3j7frUPvXr0UEATW8IlJP2jIxiF8IuEE3QEtwRKN
 pmA8wXqpgK/XLFtNZdLrTX1SL+HkHv8LYoj7Z9BThRFViEHUOe7oIdeWjakFbFfD+ZXB
 0VcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723808343; x=1724413143;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YrXmJP0T5PuESmfzLa5Jje7GuulXuQ6qTfUpaeTPhEw=;
 b=C5XSDaoNOucGaB7OySgTOCNP2kPCNmrw2mhAKzRoxDeWzPzdoAmImaCFiiOObfpFWC
 QMqVe7m3UpXG3XG4UMyiWzw532W1RFts7N/RrdRa43f/WdK8NKFteLdi9YqY/C98tQQj
 EvVDc4I3fDeHepSwLrJlcyAKw2g6LOGRhEOOWMI4hoJ+a5wqYPlmv4d6htJQaZmR6x6v
 xvDcSbJTSRmaf3ETVrKM8sJZp/UVS4YNO5UP+Wuw12KKD3zLiXvj/uTGxlUJd2kb1G6g
 pM4lGOw/CmYRMhCaHNBzAOwVSXCaJFA9AC/CW+TuHFKSRnq2ab+ptmGTFD/Jsi7ZsVXL
 Iq8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWONoH2CxA8nDrwcUbtNkk2kLUNee8PJl3yucW+CoikSBSX9LaIMNwaKS/DdjfIrw4FcpjgbyQV43JKtIY4NZiEaaQDUVg=
X-Gm-Message-State: AOJu0Yx7U5SUjNeYcXOt6vBPj5AgpC63J3x2k11kq3BjhCWFeOaYwgz6
 5dyGgCoPJOSFFJRdJoXmjs9XGUZrRCc7/U21WC17UeJOZD6a/9rttT+nDoIWutw=
X-Google-Smtp-Source: AGHT+IGoEWFbK4DaiR5SLzSvh6BYAuT554CckHIIY7IeAqQZp7JNcMDbLahsTYmbzRXCtW4exqiNvQ==
X-Received: by 2002:a17:90b:802:b0:2c7:ab00:f605 with SMTP id
 98e67ed59e1d1-2d3dfc7d183mr2799374a91.20.1723808343513; 
 Fri, 16 Aug 2024 04:39:03 -0700 (PDT)
Received: from [192.168.68.110] ([179.133.97.250])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2d3ac7f2276sm5416711a91.29.2024.08.16.04.38.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Aug 2024 04:39:03 -0700 (PDT)
Message-ID: <986253df-1102-4625-9fa5-264f3a4e0c6b@ventanamicro.com>
Date: Fri, 16 Aug 2024 08:38:56 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] hw/char: riscv_htif: Use blocking
 qemu_chr_fe_write_all
To: Alistair Francis <alistair23@gmail.com>, alex.bennee@linaro.org,
 qemu-devel@nongnu.org, peter.maydell@linaro.org
Cc: palmer@dabbelt.com, qemu-riscv@nongnu.org,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 zhiwei_liu@linux.alibaba.com, atishp@rivosinc.com,
 Bin Meng <bmeng.cn@gmail.com>, liwei1518@gmail.com,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20240815015410.369925-1-alistair.francis@wdc.com>
 <20240815015410.369925-2-alistair.francis@wdc.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20240815015410.369925-2-alistair.francis@wdc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pj1-x1031.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org



On 8/14/24 10:54 PM, Alistair Francis wrote:
> The current approach of using qemu_chr_fe_write() and ignoring the
> return values results in dropped charecters [1]. Ideally we want to
> report FIFO status to the guest, but the HTIF isn't a real UART, so we
> don't really have a way to do that.
> 
> Instead let's just use qemu_chr_fe_write_all() so at least we don't drop
> charecters.
> 
> 1: https://gitlab.com/qemu-project/qemu/-/issues/2114
> 
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   hw/char/riscv_htif.c | 12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/char/riscv_htif.c b/hw/char/riscv_htif.c
> index 9bef60def1..d40b542948 100644
> --- a/hw/char/riscv_htif.c
> +++ b/hw/char/riscv_htif.c
> @@ -218,7 +218,11 @@ static void htif_handle_tohost_write(HTIFState *s, uint64_t val_written)
>                       tswap64(syscall[3]) == HTIF_CONSOLE_CMD_PUTC) {
>                       uint8_t ch;
>                       cpu_physical_memory_read(tswap64(syscall[2]), &ch, 1);
> -                    qemu_chr_fe_write(&s->chr, &ch, 1);
> +                    /*
> +                     * XXX this blocks entire thread. Rewrite to use
> +                     * qemu_chr_fe_write and background I/O callbacks
> +                     */
> +                    qemu_chr_fe_write_all(&s->chr, &ch, 1);
>                       resp = 0x100 | (uint8_t)payload;
>                   } else {
>                       qemu_log_mask(LOG_UNIMP,
> @@ -237,7 +241,11 @@ static void htif_handle_tohost_write(HTIFState *s, uint64_t val_written)
>               return;
>           } else if (cmd == HTIF_CONSOLE_CMD_PUTC) {
>               uint8_t ch = (uint8_t)payload;
> -            qemu_chr_fe_write(&s->chr, &ch, 1);
> +            /*
> +             * XXX this blocks entire thread. Rewrite to use
> +             * qemu_chr_fe_write and background I/O callbacks
> +             */
> +            qemu_chr_fe_write_all(&s->chr, &ch, 1);
>               resp = 0x100 | (uint8_t)payload;
>           } else {
>               qemu_log("HTIF device %d: unknown command\n", device);

