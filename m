Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lnd35-0005eU-EH
	for mharc-qemu-riscv@gnu.org; Mon, 31 May 2021 04:13:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lnd2z-0005aA-RQ; Mon, 31 May 2021 04:13:18 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:38673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lnd2t-0004at-1n; Mon, 31 May 2021 04:13:17 -0400
Received: by mail-wr1-x42d.google.com with SMTP id j14so9960713wrq.5;
 Mon, 31 May 2021 01:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1f7INFBrd6VvKBWlfKNXOGTBZ2MUgo0lKPAw+Ssq46k=;
 b=C+89ES5wBAqisf5ay1GwlcvkvtUDk/tjkhwMV3xvtEpHNvAu8Y+jX21xHYe2UAt5k+
 zZqbA+hfb369xSwLdTJWvvPMKB2+DRApmoPun4Q1d0CziqFjup5MY8+BlteCHTWwqbX9
 mjNv14/nBnHNMxXqHg1aR/V3wDOyfGTlAoo6bmYA7bNknS28Z3x74GICSxBJo8sU5Ivn
 vpL2FP6TjetswE4yK/DUUECy+nMnO4K2uUkEosu4qMN2Or3FenaLqz8Ld60MrXuL4Ov+
 SGoUVKeVvZbp16CTmqAhx5gjITu32NKSO6aqt8P6U/HpDpfh3gGHo18+y7ma/HNQLCVk
 wsvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1f7INFBrd6VvKBWlfKNXOGTBZ2MUgo0lKPAw+Ssq46k=;
 b=Mq7LMYwUKuRlbF29FwIqulpiwwsbc++to6tq/fDM9K5b18URaSDsRQGy9Z5GigRubM
 4MvOo9yg8ya/ZZnHkcRWWfWnMyXUOZWYybuUtxWT3TEeI2NcZr9YxpDslVK2Rys4CMiG
 8FYmkPDhMbPaWKfposNztSrWvQI+Ei3tfzkIQ9Zv1Ns/Gbak9QKuwaiqF3Xa5ScIFGDx
 V0MZVbhjhaIo0IJJVOaAH4xJIkZlqCldQHOntXCmUiutm4t3Ly8h5pTG5vGoOWOM2nc/
 tiSo6k+vyNa0Oy9c0l7RgV0nrx2fmzfbWSDyoQXF61QVO/WJqcbx44hipmDFJEtPfbhf
 fPtg==
X-Gm-Message-State: AOAM532lPRscLCgmeDlCf28bm3nHf+0HfKjwGSqQitIdBL0D6/wesNl2
 bWG2AKVjROxgjCxTZ+Zpcoo=
X-Google-Smtp-Source: ABdhPJzf4AE6Cmf7zvR5b/fpI0HdW+kmupGKJeMH8AGEhr3HqKSUNGTF3fD+0Y+GPN22Fgrs5KAXnw==
X-Received: by 2002:a5d:5549:: with SMTP id g9mr14413298wrw.204.1622448787878; 
 Mon, 31 May 2021 01:13:07 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id j1sm2294304wmi.44.2021.05.31.01.13.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 May 2021 01:13:07 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v2 1/2] hw/char: sifive_uart
To: =?UTF-8?Q?Lukas_J=c3=bcnger?= <lukas.juenger@greensocs.com>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, bin.meng@windriver.com, mark.burton@greensocs.com, 
 marcandre.lureau@redhat.com, palmer@dabbelt.com, pbonzini@redhat.com,
 alistair.francis@wdc.com, luc.michel@greensocs.com
References: <20210530104922.466175-1-lukas.juenger@greensocs.com>
 <20210530104922.466175-2-lukas.juenger@greensocs.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <da4f7177-2057-96ab-71bb-5744ac4e7217@amsat.org>
Date: Mon, 31 May 2021 10:13:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210530104922.466175-2-lukas.juenger@greensocs.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.618,
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
X-List-Received-Date: Mon, 31 May 2021 08:13:19 -0000

On 5/30/21 12:49 PM, Lukas Jünger wrote:
> Make function names consistent
> 
> Signed-off-by: Lukas Jünger <lukas.juenger@greensocs.com>
> ---
>  hw/char/sifive_uart.c | 44 +++++++++++++++++++++----------------------
>  1 file changed, 22 insertions(+), 22 deletions(-)

> @@ -183,9 +183,9 @@ SiFiveUARTState *sifive_uart_create(MemoryRegion *address_space, hwaddr base,
>      SiFiveUARTState *s = g_malloc0(sizeof(SiFiveUARTState));
>      s->irq = irq;
>      qemu_chr_fe_init(&s->chr, chr, &error_abort);
> -    qemu_chr_fe_set_handlers(&s->chr, uart_can_rx, uart_rx, uart_event,
> -        uart_be_change, s, NULL, true);
> -    memory_region_init_io(&s->mmio, NULL, &uart_ops, s,
> +    qemu_chr_fe_set_handlers(&s->chr, sifive_uart_can_rx, sifive_uart_rx,
> +            sifive_uart_event, sifive_uart_be_change, s, NULL, true);

Incorrect indentation, otherwise:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> +    memory_region_init_io(&s->mmio, NULL, &sifive_uart_ops, s,
>                            TYPE_SIFIVE_UART, SIFIVE_UART_MAX);
>      memory_region_add_subregion(address_space, base, &s->mmio);
>      return s;
> 


