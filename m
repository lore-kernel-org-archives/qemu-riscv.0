Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lgSvm-0004ey-Ut
	for mharc-qemu-riscv@gnu.org; Tue, 11 May 2021 10:00:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc.michel@greensocs.com>)
 id 1lgQhp-0004rW-TU; Tue, 11 May 2021 07:37:41 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:60652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc.michel@greensocs.com>)
 id 1lgQhn-0001dy-Do; Tue, 11 May 2021 07:37:41 -0400
Received: from [172.17.10.10] (unknown [172.17.10.10])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 3E04320776;
 Tue, 11 May 2021 11:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1620733055;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9zi3vyPoMCCd3SeM6Y38hVc1crKqCrWYmhyXBYjkYDQ=;
 b=B3vpv5VbM6rpuLIVb8lyijBuKD4N7O9yapRZffYwPo6OeGzgYQNcVXMiVLrNdL6rEpE2uK
 W3zQaT6hIsBmBOoHUQKxNp7RNQ0g76TUpkPOmTig04Kgma13UTl0r6NCofRkqppztGWrY/
 EPwiKEGRj1axjx1Bo7nmtBucxwIRyZk=
Subject: Re: [PATCH 1/2] Consistent function names for sifive uart read and
 write function
To: =?UTF-8?Q?Lukas_J=c3=bcnger?= <lukas.juenger@greensocs.com>,
 qemu-devel@nongnu.org
Cc: alistair.francis@wdc.com, bin.meng@windriver.com, palmer@dabbelt.com,
 qemu-riscv@nongnu.org, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 mark.burton@greensocs.com
References: <20210504153456.927083-1-lukas.juenger@greensocs.com>
 <20210504153456.927083-2-lukas.juenger@greensocs.com>
From: Luc Michel <luc.michel@greensocs.com>
Message-ID: <55618060-76e7-1276-1698-c01eea721b43@greensocs.com>
Date: Tue, 11 May 2021 13:38:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210504153456.927083-2-lukas.juenger@greensocs.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=luc.michel@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 11 May 2021 10:00:07 -0400
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
X-List-Received-Date: Tue, 11 May 2021 11:37:42 -0000

On 5/4/21 5:34 PM, Lukas Jünger wrote:
> Signed-off-by: Lukas Jünger <lukas.juenger@greensocs.com>

Reviewed-by: Luc Michel <luc.michel@greensocs.com>

> ---
>   hw/char/sifive_uart.c | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/char/sifive_uart.c b/hw/char/sifive_uart.c
> index 3a00ba7f00..cb70374ead 100644
> --- a/hw/char/sifive_uart.c
> +++ b/hw/char/sifive_uart.c
> @@ -65,7 +65,7 @@ static void update_irq(SiFiveUARTState *s)
>   }
>   
>   static uint64_t
> -uart_read(void *opaque, hwaddr addr, unsigned int size)
> +sifive_uart_read(void *opaque, hwaddr addr, unsigned int size)
>   {
>       SiFiveUARTState *s = opaque;
>       unsigned char r;
> @@ -101,8 +101,8 @@ uart_read(void *opaque, hwaddr addr, unsigned int size)
>   }
>   
>   static void
> -uart_write(void *opaque, hwaddr addr,
> -           uint64_t val64, unsigned int size)
> +sifive_uart_write(void *opaque, hwaddr addr,
> +                  uint64_t val64, unsigned int size)
>   {
>       SiFiveUARTState *s = opaque;
>       uint32_t value = val64;
> @@ -131,9 +131,9 @@ uart_write(void *opaque, hwaddr addr,
>                     __func__, (int)addr, (int)value);
>   }
>   
> -static const MemoryRegionOps uart_ops = {
> -    .read = uart_read,
> -    .write = uart_write,
> +static const MemoryRegionOps sifive_uart_ops = {
> +    .read = sifive_uart_read,
> +    .write = sifive_uart_write,
>       .endianness = DEVICE_NATIVE_ENDIAN,
>       .valid = {
>           .min_access_size = 4,
> @@ -187,7 +187,7 @@ SiFiveUARTState *sifive_uart_create(MemoryRegion *address_space, hwaddr base,
>       qemu_chr_fe_init(&s->chr, chr, &error_abort);
>       qemu_chr_fe_set_handlers(&s->chr, uart_can_rx, uart_rx, uart_event,
>           uart_be_change, s, NULL, true);
> -    memory_region_init_io(&s->mmio, NULL, &uart_ops, s,
> +    memory_region_init_io(&s->mmio, NULL, &sifive_uart_ops, s,
>                             TYPE_SIFIVE_UART, SIFIVE_UART_MAX);
>       memory_region_add_subregion(address_space, base, &s->mmio);
>       return s;
> 

