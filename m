Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oT0RC-0008JF-B7
	for mharc-qemu-riscv@gnu.org; Tue, 30 Aug 2022 08:33:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oT0R7-0008Ge-Ex; Tue, 30 Aug 2022 08:33:46 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:35429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oT0R3-00033B-6z; Tue, 30 Aug 2022 08:33:44 -0400
Received: by mail-pf1-x435.google.com with SMTP id 199so11136133pfz.2;
 Tue, 30 Aug 2022 05:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc;
 bh=BYDUII48l3fkYA6nmC6NC8nAXW4LMgb1Efjaf6tUmIM=;
 b=fAYOniFzdLJXZptWPHNLyDUfUfqCx91ZmrgW3lawRrQAdaujSS4DfynsOGvWdMHBLM
 AdKXsYdO8i3LrRaVEDBQ2G0S6yMRrU6bUbBR9FjrAG6JspgBPS1D98paw3ZHvmkeZY92
 HXVg20kxmPKq4X/GYJTpxzTgv7VHyJCixUx8pBiefKZPS5Dg3b48c295rAi9KjBGQMeX
 Dr1/UbpRL6ATyr8ngaQe4Xleg7b5h29Qav/GZEDWKuR9XaLD0MZ2D9ZC/3IDIzoA3k81
 tu9zx7l1WWYUp+E2toDBig4pvdShunt3Kl4A0m7mTowhDgcUbWZcROf28ss6ftGlT/rX
 5QXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc;
 bh=BYDUII48l3fkYA6nmC6NC8nAXW4LMgb1Efjaf6tUmIM=;
 b=4zuS3fz5h20ssBr9a5gSLgTxkKPGQR5gIoefsfRjALGDsaWOA+eA6jYzJQS9Fux95X
 RBtxhufnB3EnDdM6EYUYNN5zeZYwIPhCv8aop6wrQorzMrTGkMcGow2bO3Hi0pnnz73M
 hl4R8d3lHZWl++8AjfVAK0R9AyGJK2VULBeOTCaiVW8Ku8tW58tIMBUP56vMYuSEq97B
 11IDDCXYgwHDSQsM6DuDWJaqz/c+tzebteQFv+21WgiTfX4vC3uE4FyWvs200t0jBr4D
 wME4R7vwL+M2PBJIP9Uk28XLG19Afj/jRAqMk/qnxf8iiwXwu8NcjLSy8ngZ6khJyNLm
 H7Qw==
X-Gm-Message-State: ACgBeo05Im8aIbk55EQdP5fqTInZcFd12XilfNOeQlHS8Yj1d5BLJY8Y
 0W5sVv4cs97wPo0AAFaZm2Ci/AKwE5k=
X-Google-Smtp-Source: AA6agR5riJqDZJcezG3xRi5teB0ua3eSWbLieafu08rfhJ9IDF0+R+9xOCmcJdmsvMSzF1g/YooGnw==
X-Received: by 2002:a63:485:0:b0:42b:1d81:8619 with SMTP id
 127-20020a630485000000b0042b1d818619mr17267136pge.343.1661862818780; 
 Tue, 30 Aug 2022 05:33:38 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 n5-20020a63a505000000b0042c0ffa0e62sm1539387pgf.47.2022.08.30.05.33.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Aug 2022 05:33:38 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Message-ID: <c33257a3-645f-9386-52e5-21a15ef0ebe5@amsat.org>
Date: Tue, 30 Aug 2022 14:33:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v4 3/4] hw/ssi: ibex_spi: fixup/add rw1c functionality
Content-Language: en-US
To: Wilfred Mallawa <wilfred.mallawa@opensource.wdc.com>,
 Alistair.Francis@wdc.com, qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org, Wilfred Mallawa <wilfred.mallawa@wdc.com>
References: <20220823061201.132342-1-wilfred.mallawa@opensource.wdc.com>
 <20220823061201.132342-4-wilfred.mallawa@opensource.wdc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20220823061201.132342-4-wilfred.mallawa@opensource.wdc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 30 Aug 2022 12:33:46 -0000

On 23/8/22 08:12, Wilfred Mallawa wrote:
> From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
> 
> This patch adds the `rw1c` functionality to the respective
> registers. The status fields are cleared when the respective
> field is set.
> 
> Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>   hw/ssi/ibex_spi_host.c         | 34 ++++++++++++++++++++++++++++++++--
>   include/hw/ssi/ibex_spi_host.h |  4 ++--
>   2 files changed, 34 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/ssi/ibex_spi_host.c b/hw/ssi/ibex_spi_host.c
> index d52b193a1a..40d401ad47 100644
> --- a/hw/ssi/ibex_spi_host.c
> +++ b/hw/ssi/ibex_spi_host.c
> @@ -352,7 +352,17 @@ static void ibex_spi_host_write(void *opaque, hwaddr addr,
>   
>       switch (addr) {
>       /* Skipping any R/O registers */
> -    case IBEX_SPI_HOST_INTR_STATE...IBEX_SPI_HOST_INTR_ENABLE:
> +    case IBEX_SPI_HOST_INTR_STATE:
> +        /* rw1c status register */
> +        if (FIELD_EX32(val32, INTR_STATE, ERROR)) {
> +            data = FIELD_DP32(data, INTR_STATE, ERROR, 0);
> +        }
> +        if (FIELD_EX32(val32, INTR_STATE, SPI_EVENT)) {
> +            data = FIELD_DP32(data, INTR_STATE, SPI_EVENT, 0);
> +        }
> +        s->regs[addr] = data;
> +        break;
> +    case IBEX_SPI_HOST_INTR_ENABLE:
>           s->regs[addr] = val32;
>           break;
>       case IBEX_SPI_HOST_INTR_TEST:
> @@ -495,7 +505,27 @@ static void ibex_spi_host_write(void *opaque, hwaddr addr,
>        *  When an error occurs, the corresponding bit must be cleared
>        *  here before issuing any further commands
>        */
> -        s->regs[addr] = val32;
> +        status = s->regs[addr];
> +        /* rw1c status register */
> +        if (FIELD_EX32(val32, ERROR_STATUS, CMDBUSY)) {
> +            status = FIELD_DP32(status, ERROR_STATUS, CMDBUSY, 0);
> +        }
> +        if (FIELD_EX32(val32, ERROR_STATUS, OVERFLOW)) {
> +            status = FIELD_DP32(status, ERROR_STATUS, OVERFLOW, 0);
> +        }
> +        if (FIELD_EX32(val32, ERROR_STATUS, UNDERFLOW)) {
> +            status = FIELD_DP32(status, ERROR_STATUS, UNDERFLOW, 0);
> +        }
> +        if (FIELD_EX32(val32, ERROR_STATUS, CMDINVAL)) {
> +            status = FIELD_DP32(status, ERROR_STATUS, CMDINVAL, 0);
> +        }
> +        if (FIELD_EX32(val32, ERROR_STATUS, CSIDINVAL)) {
> +            status = FIELD_DP32(status, ERROR_STATUS, CSIDINVAL, 0);
> +        }
> +        if (FIELD_EX32(val32, ERROR_STATUS, ACCESSINVAL)) {
> +            status = FIELD_DP32(status, ERROR_STATUS, ACCESSINVAL, 0);
> +        }

Alistair, does this call to add some FIELD_1CLEAR() API?

