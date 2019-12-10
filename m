Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ieaE7-0000aM-Jo
	for mharc-qemu-riscv@gnu.org; Tue, 10 Dec 2019 02:46:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50660)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1ieaE4-0000WC-Kp
 for qemu-riscv@nongnu.org; Tue, 10 Dec 2019 02:46:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1ieaE3-0004MY-LF
 for qemu-riscv@nongnu.org; Tue, 10 Dec 2019 02:46:32 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:31118
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1ieaE3-0004MG-I9
 for qemu-riscv@nongnu.org; Tue, 10 Dec 2019 02:46:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575963991;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QQ25A+0pF6nBtpKg+xD9aL/MQYr2cTEedC/jGQsZ8+s=;
 b=EDBhvH8hsRodn/P9O82o/D287nrpv5YPPZWUqGAsqwhZO4IiLyR3rURYfghkyjf07eCEbN
 fV0sKpHd4feRuSyQcRHGCWrY1x+9NKmJ0fYtIV5uKRAwq7IvB3Yi8K2HZvQU5nGqOdQFOf
 SeWsfpwEpxhgLhL8ohJOhrDM+GmajKY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-293-XPCRUPapO3-KWPMgBAiwDA-1; Tue, 10 Dec 2019 02:46:25 -0500
Received: by mail-wm1-f70.google.com with SMTP id n4so312329wmd.7
 for <qemu-riscv@nongnu.org>; Mon, 09 Dec 2019 23:46:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uGM1ba9buYPlDv6UNhIOch/jwXPlXBPyZOgkBtSLCUc=;
 b=VdVsljFOETN+S7G30ea8nUXqOMIPqur9tOYNSF4iaQglIw9pX7vlF8KN5C2lNS2PPi
 /Lzc35nsFUO5DSc/m0MIkwBrqwzgU8m5EwEjNAnOdKH44mtFfY4YvLQroKYdT+w5mUsZ
 HuaUvlY7fr7TFVLrI32/zNym4Tv0rBYKQ7EYM8uywqtyzQexCq//XQDmEaAimgAdd6O2
 9AG8EFDtpRYiJCxkhjA3TE1Y34aK9q2X8BEScGw8JlI/oEJ/FNg9xNdJ6RZC1/3yW6hx
 SxZU4BYExQ7uu4QEDZwPOMwXiJsO5EV5MaIdUYQpSX8RB4fAFWYw3wA56uReuxT41gkI
 tBNw==
X-Gm-Message-State: APjAAAWNL6w8fObdNhG6ssG28N1Sfp3SBMuKVk0AMsYDfjMqZxwadkW0
 LWJ0U89Q4+gEFEhQ6CHBZbvJvBFdJ7xLp2N1lxM5oBy92UDYzv+wtODIW6Or32KvjyrEXfE/ogQ
 9FlSsXbWfhJY7qOI=
X-Received: by 2002:adf:fe90:: with SMTP id l16mr1573614wrr.265.1575963983997; 
 Mon, 09 Dec 2019 23:46:23 -0800 (PST)
X-Google-Smtp-Source: APXvYqyPqb4pu90PhO5DPn7WRh8fYb9z0Xkfu9+f6MI0m2F8V0HAHpepGctWm9QUthFMsSE4Y16dnA==
X-Received: by 2002:adf:fe90:: with SMTP id l16mr1573584wrr.265.1575963983687; 
 Mon, 09 Dec 2019 23:46:23 -0800 (PST)
Received: from [192.168.1.35] (182.red-88-21-103.staticip.rima-tde.net.
 [88.21.103.182])
 by smtp.gmail.com with ESMTPSA id a16sm2286767wrt.37.2019.12.09.23.46.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Dec 2019 23:46:23 -0800 (PST)
Subject: Re: [PATCH] riscv/sifive_u: fix a memory leak in soc_realize()
To: pannengyuan@huawei.com, palmer@dabbelt.com, Alistair.Francis@wdc.com,
 sagark@eecs.berkeley.edu, kbastian@mail.uni-paderborn.de
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 zhang.zhanghailiang@huawei.com
References: <1575962077-28800-1-git-send-email-pannengyuan@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <eed2a144-0253-8435-6e81-991f71acc602@redhat.com>
Date: Tue, 10 Dec 2019 08:46:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <1575962077-28800-1-git-send-email-pannengyuan@huawei.com>
Content-Language: en-US
X-MC-Unique: XPCRUPapO3-KWPMgBAiwDA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
X-List-Received-Date: Tue, 10 Dec 2019 07:46:34 -0000

On 12/10/19 8:14 AM, pannengyuan@huawei.com wrote:
> From: Pan Nengyuan <pannengyuan@huawei.com>
>=20
> Fix a minor memory leak in riscv_sifive_u_soc_realize()
>=20
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
> ---
>   hw/riscv/sifive_u.c | 1 +
>   1 file changed, 1 insertion(+)
>=20
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index 0140e95..0e12b3c 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -542,6 +542,7 @@ static void riscv_sifive_u_soc_realize(DeviceState *d=
ev, Error **errp)
>           SIFIVE_U_PLIC_CONTEXT_BASE,
>           SIFIVE_U_PLIC_CONTEXT_STRIDE,
>           memmap[SIFIVE_U_PLIC].size);
> +    g_free(plic_hart_config);
>       sifive_uart_create(system_memory, memmap[SIFIVE_U_UART0].base,
>           serial_hd(0), qdev_get_gpio_in(DEVICE(s->plic), SIFIVE_U_UART0_=
IRQ));
>       sifive_uart_create(system_memory, memmap[SIFIVE_U_UART1].base,
>=20

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>


