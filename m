Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iphRl-0006fu-A3
	for mharc-qemu-riscv@gnu.org; Thu, 09 Jan 2020 18:42:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36341)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmerdabbelt@google.com>) id 1iphRi-0006fL-KB
 for qemu-riscv@nongnu.org; Thu, 09 Jan 2020 18:42:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmerdabbelt@google.com>) id 1iphRh-0006QC-Fw
 for qemu-riscv@nongnu.org; Thu, 09 Jan 2020 18:42:34 -0500
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:43872)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmerdabbelt@google.com>)
 id 1iphRh-00067x-6d
 for qemu-riscv@nongnu.org; Thu, 09 Jan 2020 18:42:33 -0500
Received: by mail-pg1-x544.google.com with SMTP id k197so58883pga.10
 for <qemu-riscv@nongnu.org>; Thu, 09 Jan 2020 15:42:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:subject:cc:to:in-reply-to:references:message-id
 :mime-version:content-transfer-encoding;
 bh=mefVIwlrKKDip3XVpDDxb1wot7pwoE9ZiAmCZtDHxak=;
 b=Kv06fIbEbumpO+4n9WTcgZqd9BjBPpldJ8BUGkRYqhynEqf+r9ewN3C5cgPWhKI7oJ
 AbJgzE4P/zIrX0znwqTx4nhL4QkUHBfdjwDvWiwN/krVZnR9F1pQQ5p1Pr0rzq/zLMx2
 Bcwj7rilVIJnXGgMG4jWcsZt3/y8AGd4/OU7uc7f2IyM/R3nxd9OTlbUJichFvK3H5eZ
 Ew37uOgV0c0OPTccm8shyxXLPSWvZjeUPkA2K3L8i2r+1pQeYjKTTaoEkIoFk2zwjNyy
 PKV9tBlPHWrx+Ak8cjoxHz0p3sfNvUW6K9Vr+HxLmcJiqAlyTkEWgx701eWhGvoDi9tM
 4+sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:cc:to:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=mefVIwlrKKDip3XVpDDxb1wot7pwoE9ZiAmCZtDHxak=;
 b=h0+LY6rxUQk2OUXAhcjxyl5iU/yVGqgXyWMH+EbLmFRd7GXefFsrR6l7txc9AQoiKl
 OwZtKleblPs1Tz4WoM1EU0pObtsPp9Hld3/WUGMGKbGxJvbTWe47hfvKSxuWcv1RWV7X
 yFov9quLPOAAew1luL2yaMCbax873AY3QYjgPM5cfCK/2HB1c3yyiY0Cbb8AnFCoGTJy
 0MgeNMrA3KxJYjh19seU10rbEeqjVS+23PTF/68ywJXs3z+FCgyxkBQCYunqpsyc3PSE
 LlJfbwB12g0RiWzBAm3MX5Kz3LtjHy0JbC53eDwS3Q6TE25sTJbHIkwxF2T5iddBkufJ
 erVA==
X-Gm-Message-State: APjAAAW0DyjcO66ArmJXWeE4Xvo2Pg6SBLdn/3Ftdr9hoLSl9BT/+wTx
 NV7UFHg2eyQfXBQ0LCITcdkf7g==
X-Google-Smtp-Source: APXvYqzThfhawpHp3qkzVWCcDVR5G+UIrqQ5Xl+luqRP15w8dF/AL3uXejLQJlQYkfqM7Jk2v+lqHA==
X-Received: by 2002:a62:18f:: with SMTP id 137mr504226pfb.84.1578613348899;
 Thu, 09 Jan 2020 15:42:28 -0800 (PST)
Received: from localhost ([2620:0:1000:2514:7f69:cd98:a2a2:a03d])
 by smtp.gmail.com with ESMTPSA id q12sm131706pfh.158.2020.01.09.15.42.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2020 15:42:28 -0800 (PST)
Date: Thu, 09 Jan 2020 15:42:28 -0800 (PST)
X-Google-Original-Date: Thu, 09 Jan 2020 15:38:32 PST (-0800)
From: Palmer Dabbelt <palmerdabbelt@google.com>
X-Google-Original-From: Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH] riscv/sifive_u: fix a memory leak in soc_realize()
CC: pannengyuan@huawei.com, Alistair Francis <Alistair.Francis@wdc.com>,
 sagark@eecs.berkeley.edu, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 qemu-riscv@nongnu.org, 
 qemu-devel@nongnu.org, zhang.zhanghailiang@huawei.com
To: alistair23@gmail.com
In-Reply-To: <CAKmqyKNH0NdhksX35C7Cm1e51in-iRBrmH8TJWGYregCgLgO6w@mail.gmail.com>
References: <CAKmqyKNH0NdhksX35C7Cm1e51in-iRBrmH8TJWGYregCgLgO6w@mail.gmail.com>
 <1575962077-28800-1-git-send-email-pannengyuan@huawei.com>
Message-ID: <mhng-8d4724ea-7312-45f2-8f14-fb3175ca9b6a@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::544
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
X-List-Received-Date: Thu, 09 Jan 2020 23:42:35 -0000

On Tue, 10 Dec 2019 10:38:29 PST (-0800), alistair23@gmail.com wrote:
> On Mon, Dec 9, 2019 at 11:15 PM <pannengyuan@huawei.com> wrote:
>>
>> From: Pan Nengyuan <pannengyuan@huawei.com>
>>
>> Fix a minor memory leak in riscv_sifive_u_soc_realize()
>>
>> Reported-by: Euler Robot <euler.robot@huawei.com>
>> Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Thanks.  This is in the queue, I'm hoping to submit a PR after the H patch set
is ready to go.

>
> Alistair
>
>> ---
>>  hw/riscv/sifive_u.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
>> index 0140e95..0e12b3c 100644
>> --- a/hw/riscv/sifive_u.c
>> +++ b/hw/riscv/sifive_u.c
>> @@ -542,6 +542,7 @@ static void riscv_sifive_u_soc_realize(DeviceState *dev, Error **errp)
>>          SIFIVE_U_PLIC_CONTEXT_BASE,
>>          SIFIVE_U_PLIC_CONTEXT_STRIDE,
>>          memmap[SIFIVE_U_PLIC].size);
>> +    g_free(plic_hart_config);
>>      sifive_uart_create(system_memory, memmap[SIFIVE_U_UART0].base,
>>          serial_hd(0), qdev_get_gpio_in(DEVICE(s->plic), SIFIVE_U_UART0_IRQ));
>>      sifive_uart_create(system_memory, memmap[SIFIVE_U_UART1].base,
>> --
>> 2.7.2.windows.1
>>
>>
>>

