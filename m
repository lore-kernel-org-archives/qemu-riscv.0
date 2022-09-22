Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1obTzB-0005AC-No
	for mharc-qemu-riscv@gnu.org; Thu, 22 Sep 2022 17:43:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1obTzA-00059x-2z; Thu, 22 Sep 2022 17:43:56 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:40959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1obTz8-0005v7-0m; Thu, 22 Sep 2022 17:43:55 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 q9-20020a17090a178900b0020265d92ae3so3778270pja.5; 
 Thu, 22 Sep 2022 14:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=k02a6Lo3wuit00bVjKHDmvwY5JdtCyOYdMTc3iDxfTY=;
 b=fzAUmSqR48QFKVjbQh8PEHyaqrCQW6MYur7bnyo+7UBxqFRf50I/LWzzjWEB7GPdfS
 OVzOKY1VZD4ukY6M0ECPIpo73Xcksmp/4q5R9MnqaO3BnylDjSYasZU6j12GdXIb6wxf
 vG4D7PLl+iAa6BSBc+hZLIfX5oCsUxEGx/KCP+uPDoNgnOMnHGSoqh+ImzvGbJbKn6Ya
 rtGikv271XpA2t0LO5d4aw9h1IbtfVa136UAttZ3E3bn6UB6jy4FaE4F6TeLcuFBRpPv
 oNJrZGfadi7TTZQtS8iqFGh0AD3TiLhVZ9EcOw6kz2z4IZCithL3m0tDz0q6Yn4W8STC
 Wpwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=k02a6Lo3wuit00bVjKHDmvwY5JdtCyOYdMTc3iDxfTY=;
 b=08uhRap9ub4/aLeyZP0kT47+yUAI3iHfp1N29qEft9KOC6WF1d8iK0JYiCcr4OPgZY
 BCG7DOYbB5K4afKgEnkKWCdNPQ/D509zAXUxAByQeYQdPOtQ7LJOGq3vEGPj4vwiHicR
 F4M7eLztw2OvEapgNV8NXXW6RacSXs/O0Lu0y+roazPt34ylYkbO2EofPda3nEhar0MO
 Ncjo7UhobeQhpnFZOUX/03r47bGUrvTnXGxi8mtnThRaFIFweZnifeNElNa8ZaS87uS0
 z9bHH0MS0In1v2hTalGRlGLZYmYIe0Z43bmSiZp4kMuVPdoLlt6Fotbor1HVpeGLcF+l
 w0aw==
X-Gm-Message-State: ACrzQf3T9OWiHgkNIWhUoZZCWm90GkjptHcPvksoRJlDeb8/SgtJcJju
 RRbHmJixejDo+fKidmYbBak=
X-Google-Smtp-Source: AMsMyM55TzL0060qs9UXHeZCPuErVpHrwXjCVgMqriASU8KUkQ07YVq1yrVn/uDAlA5Pe7F7WDpMXw==
X-Received: by 2002:a17:902:d143:b0:178:456b:8444 with SMTP id
 t3-20020a170902d14300b00178456b8444mr5352655plt.137.1663883031081; 
 Thu, 22 Sep 2022 14:43:51 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 q12-20020a170902dacc00b0016c50179b1esm4640156plx.152.2022.09.22.14.43.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Sep 2022 14:43:50 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Message-ID: <94d79c16-3777-b80e-3e4f-70bf256d3707@amsat.org>
Date: Thu, 22 Sep 2022 23:43:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
Subject: Re: [PATCH v2 2/3] hw/intc: sifive_plic.c: Fix interrupt priority
 index.
Content-Language: en-US
To: Tyler Ng <tkng@rivosinc.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Laurent Vivier <lvivier@redhat.com>
References: <CAB88-qNFw_xOA0KB9rrr0pD30xFjFd6TRGX6M3TEEbZjVEEAwA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <CAB88-qNFw_xOA0KB9rrr0pD30xFjFd6TRGX6M3TEEbZjVEEAwA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.893,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 22 Sep 2022 21:43:56 -0000

On 22/9/22 17:58, Tyler Ng wrote:
> Fixes a bug in which the index of the interrupt priority is off by 1.
> 
> For example, using an IRQ number of 3 with a priority of 1 is supposed to set
> plic->source_priority[2] = 1, but instead it sets
> plic->source_priority[3] = 1. When an interrupt is claimed to be
> serviced, it checks the index 2 instead of 3.
> 
> Found when testing the OpenTitan Always-On watchdog bark interrupt on ZephyrOS.
> 
> Fixes: 0feb4a7129eb4f120c75849ddc9e50495c50cb63
> 
> Signed-off-by: Tyler Ng <tkng@rivosinc.com>
> ---
>   hw/intc/sifive_plic.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
> index af4ae3630e..1734e76aef 100644
> --- a/hw/intc/sifive_plic.c
> +++ b/hw/intc/sifive_plic.c
> @@ -131,7 +131,7 @@ static uint64_t sifive_plic_read(void *opaque,
> hwaddr addr, unsigned size)
>       SiFivePLICState *plic = opaque;
> 
>       if (addr_between(addr, plic->priority_base, plic->num_sources << 2)) {
> -        uint32_t irq = ((addr - plic->priority_base) >> 2) + 1;
> +        uint32_t irq = ((addr - plic->priority_base) >> 2) + 0;
> 
>           return plic->source_priority[irq];
>       } else if (addr_between(addr, plic->pending_base,
> plic->num_sources >> 3)) {
> @@ -178,7 +178,7 @@ static void sifive_plic_write(void *opaque, hwaddr
> addr, uint64_t value,
>       SiFivePLICState *plic = opaque;
> 
>       if (addr_between(addr, plic->priority_base, plic->num_sources << 2)) {
> -        uint32_t irq = ((addr - plic->priority_base) >> 2) + 1;
> +        uint32_t irq = ((addr - plic->priority_base) >> 2) + 0;

Maybe we can remove the ( ... ) + 0;

