Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lgRTf-0003Pl-65
	for mharc-qemu-riscv@gnu.org; Tue, 11 May 2021 08:27:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lgRTd-0003OJ-AR; Tue, 11 May 2021 08:27:05 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:42904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lgRTb-0004wX-3P; Tue, 11 May 2021 08:27:04 -0400
Received: by mail-wr1-x432.google.com with SMTP id l2so19934358wrm.9;
 Tue, 11 May 2021 05:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cUab8/BPpicqjRWLRsSe2OUGEVDu2PtuhV0srzfQJoA=;
 b=rM7SfMRrIXYGqH6UUlb9XxODJ2UkmuD/RnTwBLil0TEadQTkjrDQrX4AehRV9KGdev
 C2ZiIkQZJpRjVdf+JZRJzSL15x9n8dhBo4SBd8+exvSYDTzaEdYzokptdmuNJYU3Zcq+
 zKnqeltOkQt6pexIxBvqkMB8qyqOdpe1St0ddGrTPjxpmy5C6DTkTKt9kP/RzXia6zHw
 0lsyqNwFS122CbjiUXXiCy6t9KKmmLj3O/OMuwowLEs11lhtHikWvkQTapASgkqrDpw+
 qJXe5yDYKqbUoNG4y3+hXSZU98okQg0RFZAAMenK6nVtnhdjKERLoX7gmlMGaHvbDGeL
 FSCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cUab8/BPpicqjRWLRsSe2OUGEVDu2PtuhV0srzfQJoA=;
 b=iOcyUwLgx4p8N3IioZ+iV+bIXiqDxrI8tGJNa4nkasfTaUrE85YEY7DNDdW4/NUUZ1
 SNOINM9LBKzsfp/mLG14qk+Jrm09bWktXbH5dQ1zy47X1C6DYszWi3g4vEo6LG8RPlxV
 sKEZE5ByClphad6poJoAEA05q56TKQ1ab1IT5dbikWDZU9U6p+so5doKJu98ScWyHNU6
 uCskF44rUIIyihLpvVELROhbwuWWj6PMqUI9p4ecVldROftX4/Dimfr3EXoSJdq6rf3B
 7QP9up/kdEm738aXv0/3t81Nx1VTaqzAzLU773iT1/WMyNDZTHNzeAHWblMqJw9juSRr
 IJGQ==
X-Gm-Message-State: AOAM531MEXZz3YNgyDx5R4uQdJOFLOI/hrdOXmlqazED4wiZQ8JGmlnY
 GFQoNZErZtM3PAg+32u42Aw=
X-Google-Smtp-Source: ABdhPJyiW+VmhLoClMBahbYmznlP6XZp8fpSfVeavugeDsV7ILN89H9ICmv3J5Y3cDgrBB5BiFGSSQ==
X-Received: by 2002:adf:fc46:: with SMTP id e6mr37230603wrs.169.1620736020961; 
 Tue, 11 May 2021 05:27:00 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id f25sm27703375wrd.67.2021.05.11.05.26.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 05:27:00 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH 2/2] QOMify sifive_uart model
To: =?UTF-8?Q?Lukas_J=c3=bcnger?= <lukas.juenger@greensocs.com>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, bin.meng@windriver.com, mark.burton@greensocs.com, 
 marcandre.lureau@redhat.com, palmer@dabbelt.com, pbonzini@redhat.com,
 alistair.francis@wdc.com, luc.michel@greensocs.com
References: <20210504153456.927083-1-lukas.juenger@greensocs.com>
 <20210504153456.927083-3-lukas.juenger@greensocs.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <8471d630-72c1-aef0-a0cf-9f0417334c08@amsat.org>
Date: Tue, 11 May 2021 14:26:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210504153456.927083-3-lukas.juenger@greensocs.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 11 May 2021 12:27:05 -0000

Hi Lukas,

On 5/4/21 5:34 PM, Lukas Jünger wrote:
> Signed-off-by: Lukas Jünger <lukas.juenger@greensocs.com>
> ---
>  include/hw/char/sifive_uart.h |  6 +--
>  hw/char/sifive_uart.c         | 72 ++++++++++++++++++++++++++++++-----
>  2 files changed, 65 insertions(+), 13 deletions(-)

> +static void sifive_uart_realize(DeviceState *dev, Error **errp)
> +{
> +    SiFiveUARTState *s = SIFIVE_UART(dev);
> +
> +    qemu_chr_fe_set_handlers(&s->chr, uart_can_rx, uart_rx, uart_event,
> +                             uart_be_change, s, NULL, true);
> +
> +}
> +
> +static void sifive_uart_class_init(ObjectClass *oc, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(oc);
> +
> +    dc->realize = sifive_uart_realize;
> +    device_class_set_props(dc, sifive_uart_properties);
> +}

You forgot to add the migration fields (VMState) of the SiFiveUARTState
structure. You might want to convert to the Fifo8 API (like the
SiFiveSPIState does) previous to this patch.

Regards,

Phil.

