Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1muvdB-0005jy-Jn
	for mharc-qemu-riscv@gnu.org; Wed, 08 Dec 2021 07:01:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1muvd9-0005hj-9v; Wed, 08 Dec 2021 07:01:03 -0500
Received: from [2a00:1450:4864:20::42f] (port=39554
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1muvd7-00033O-0o; Wed, 08 Dec 2021 07:01:03 -0500
Received: by mail-wr1-x42f.google.com with SMTP id a18so3660667wrn.6;
 Wed, 08 Dec 2021 04:01:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=d2uxao4J6vj7yL1GkkirFwd0bmuzDCf8Pq6/ClMpfpQ=;
 b=DoenAuyNBwt2NAsFQv3RewE3O4IPkVb5KUy20A5715d1y9qVQxWcugb4MV+NJrX1Wt
 mHfxd5NaIOK7GqyOQV/n7txSeG0F15gDMzMr4ycQ30pUmpQzEa5EPqx4fbLt7Pio+4oc
 +rOLekaLsRtu9HFnekd5d1D7cB/d5CIunmTrnUPvnJkEc/IpxkIWI19yQOVu9C70tIai
 oIozIZgW+BgmrmRMCCefh6yZVOfs+8OW2FHE2GFmnr5idNiEVVOjwHxzhgX/gSwobq0g
 3fnvjFoPIsih0SPf/wkS9JqvH3DZI7ZA7AbVbtMoqONiGHyca+d5ecxe2XfLVhDOk5qt
 DAPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=d2uxao4J6vj7yL1GkkirFwd0bmuzDCf8Pq6/ClMpfpQ=;
 b=GNbrrOSocG5SvZcE9Ppz57ZclCGn7RFTt9lDO4Cn7vXv1FfOD5DbgfNHNw2hYiIUtS
 Yx7we+tqjEaiXDaq3LIlplrpxGhpeiHgkldwBFEOt9GF8WsBf7UfTRPhydQjyhc94HeI
 +vjtMEXBdtPZHPvVjbQmNNyXB8V1/zNqkO6GgYhePFKlRpX8kOgwvkOtHtSV80l1zf3i
 SMZl1MPnxv1XBegIP6qpgsXYA8m8+2HZSYTyS5mCn2Maoq7NuWcvUDoXHeMWanF0Z/3F
 +5YORH3DYdzJRwFWssE47kXJpVsCXsgCH4aKLTElLpr8uJ0GMAzyrl9dr23fc5hOr++H
 Fw7g==
X-Gm-Message-State: AOAM533llJZP/1dJHlk5M1eFLIkwwXcah6qM4GQ9OLiX9QE0ZblQc8aV
 8UZWeHkPALqWKde9eI8+lXQ=
X-Google-Smtp-Source: ABdhPJyuLd7XHDkcbJmQinLIL7i9ZRoPZ3lIXTwwOXYDzhYFFdmyRx1vBVzYUesA/py4cdIicT7LsA==
X-Received: by 2002:adf:8b8a:: with SMTP id o10mr52984683wra.569.1638964859288; 
 Wed, 08 Dec 2021 04:00:59 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id b15sm3370263wri.62.2021.12.08.04.00.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Dec 2021 04:00:58 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Message-ID: <d4fb2710-a03c-0c33-fa7a-9279e63507ac@amsat.org>
Date: Wed, 8 Dec 2021 13:00:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 1/7] hw/intc: sifive_plic: Add a reset function
Content-Language: en-US
To: Alistair Francis <alistair.francis@opensource.wdc.com>,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>, alistair23@gmail.com,
 bmeng.cn@gmail.com
References: <20211208064252.375360-1-alistair.francis@opensource.wdc.com>
 <20211208064252.375360-2-alistair.francis@opensource.wdc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211208064252.375360-2-alistair.francis@opensource.wdc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.44,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 08 Dec 2021 12:01:03 -0000

Hi Alistair,

On 12/8/21 07:42, Alistair Francis wrote:
> From: Alistair Francis <alistair.francis@wdc.com>
> 
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  hw/intc/sifive_plic.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
> index 877e76877c..35f097799a 100644
> --- a/hw/intc/sifive_plic.c
> +++ b/hw/intc/sifive_plic.c
> @@ -355,6 +355,17 @@ static const MemoryRegionOps sifive_plic_ops = {
>      }
>  };
>  
> +static void sifive_plic_reset(DeviceState *dev)
> +{
> +    SiFivePLICState *s = SIFIVE_PLIC(dev);
> +
> +    memset(s->source_priority, 0, sizeof(uint32_t) * s->num_sources);
> +    memset(s->target_priority, 0, sizeof(uint32_t) * s->num_addrs);
> +    memset(s->pending, 0, sizeof(uint32_t) * s->bitfield_words);
> +    memset(s->claimed, 0, sizeof(uint32_t) * s->bitfield_words);
> +    memset(s->enable, 0, sizeof(uint32_t) * s->num_enables);

Looking at sifive_plic_realize():

- Should we reset the external IRQs in a default state?
- Shouldn't riscv_cpu_claim_interrupts() be called at reset?

Note: parse_hart_config() name is slightly confusing since
beside parsing, it also allocates addr_config. Maybe consider
renaming?

