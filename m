Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nwOsG-0001zl-69
	for mharc-qemu-riscv@gnu.org; Wed, 01 Jun 2022 09:59:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nwOsF-0001xW-3A; Wed, 01 Jun 2022 09:58:59 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:46986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nwOsD-0005gH-8I; Wed, 01 Jun 2022 09:58:58 -0400
Received: by mail-wr1-x431.google.com with SMTP id d26so2463662wrb.13;
 Wed, 01 Jun 2022 06:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0jZy12IUXwWtor+oG1IlIHHVauVqeLvUb8eW0vlezeM=;
 b=Eg3uamI0qjnQ74GQBcQfSVU/dxtbV5o56AyQOCwV7klormy+qIM0FkvgHcIq3GuUM0
 oJVXA1SMyEm8Q+fdAOXq80Ok/CL92NCLxGYPLcxfXFT8FSHoX7n1w7WpwYMEZ4Fll6YZ
 KfUPdbX2P09yqof+1rBF8AjkOcwW27p3VC9Sb6fETaGDPQXi+D0S4mB3yzRl5lpk8UBB
 gXl60FQ/WVdTW+g6OGw6Ehq3phrcqB3KXq1wHqk7quGbuGI5lrcj63h5csPOV3cptBZr
 eyRNuRQ22DaHCLqDkIFn/WmYx1MFf6ym6qHBdElSrOuHbBHZHbfexloKn/rI07iZMQUN
 YoSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0jZy12IUXwWtor+oG1IlIHHVauVqeLvUb8eW0vlezeM=;
 b=WDFGYYSKNqEqCuVmKdICtuBo2y7x2VWRegirMQrNmi4wer8kfPQXcQh9nq6yZMOkGG
 eIpfhZAmUTgLavAdz1j3WJHDhvBj/pkqXWZSbOZS35rQPoe2dx6DI+Fnd8n0VAS3AP14
 H5CEx7NLW7CMSIdhE/rRiI0sBK3pmCKnbc84ClGsMg6GCgAm2hgugQuas9alnmbRAd3m
 oOH9Ye8P8B6ZSMWSHEbcHENMz4bMDQxAA6mzHgpN9aojWkgNTAp7EwIfOENNL/10sRe1
 +R+Zv6IxyIbc+AtTIYmATL7lTCWc2PDMWgav9IUoXfPfWBywRIey6Xm5dkzgnHzjgkU8
 Ax0Q==
X-Gm-Message-State: AOAM533fsHOI+5dnTa9vRCOUcwyJ4T1Dr8sf3GMHefHbUFR1UDPSZ7CB
 OtcvIp3TCO2mdVafxqZZBWI=
X-Google-Smtp-Source: ABdhPJzGazLZcO8Uv+Y6J1xULASF2wm5QTJf7TRJLt8fp5ZMIXT+eKLMKHPyTr6IxbOgBRMs/3Aq9Q==
X-Received: by 2002:a05:6000:388:b0:20e:7a31:8f5e with SMTP id
 u8-20020a056000038800b0020e7a318f5emr50025179wrf.201.1654091933023; 
 Wed, 01 Jun 2022 06:58:53 -0700 (PDT)
Received: from [192.168.1.82] (26.red-83-50-226.dynamicip.rima-tde.net.
 [83.50.226.26]) by smtp.gmail.com with ESMTPSA id
 g20-20020a05600c4c9400b0039749b01ea7sm2439661wmp.32.2022.06.01.06.58.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jun 2022 06:58:52 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Message-ID: <c8454b04-fbea-3750-3819-6f292b20de7b@amsat.org>
Date: Wed, 1 Jun 2022 15:58:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [PATCH] hw/intc: sifive_plic: Avoid overflowing the addr_config
 buffer
Content-Language: en-US
To: Alistair Francis <alistair.francis@opensource.wdc.com>,
 jiangyifei@huawei.com, limingwang@huawei.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: thuth@redhat.com, Bin Meng <bin.meng@windriver.com>,
 alistair23@gmail.com, Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, bmeng.cn@gmail.com
References: <20220601013631.196854-1-alistair.francis@opensource.wdc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20220601013631.196854-1-alistair.francis@opensource.wdc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Wed, 01 Jun 2022 13:58:59 -0000

On 1/6/22 03:36, Alistair Francis wrote:
> From: Alistair Francis <alistair.francis@wdc.com>
> 
> Since commit ad40be27 "target/riscv: Support start kernel directly by
> KVM" we have been overflowing the addr_config on "M,MS..."
> configurations, as reported https://gitlab.com/qemu-project/qemu/-/issues/1050.
> 
> This commit changes the loop in sifive_plic_create() from iterating over
> the number of harts to just iterating over the addr_config. The
> addr_config is based on the hart_config, and will contain interrup details
> for all harts. This way we can't iterate past the end of addr_config.
> 
> Fixes: ad40be27084536 ("target/riscv: Support start kernel directly by KVM")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1050
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>   hw/intc/sifive_plic.c | 19 +++++++++----------
>   1 file changed, 9 insertions(+), 10 deletions(-)
> 
> diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
> index eebbcf33d4..56d60e9ac9 100644
> --- a/hw/intc/sifive_plic.c
> +++ b/hw/intc/sifive_plic.c
> @@ -431,7 +431,7 @@ DeviceState *sifive_plic_create(hwaddr addr, char *hart_config,
>       uint32_t context_stride, uint32_t aperture_size)
>   {
>       DeviceState *dev = qdev_new(TYPE_SIFIVE_PLIC);
> -    int i, j = 0;
> +    int i;
>       SiFivePLICState *plic;
>   
>       assert(enable_stride == (enable_stride & -enable_stride));
> @@ -451,18 +451,17 @@ DeviceState *sifive_plic_create(hwaddr addr, char *hart_config,
>       sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, addr);
>   
>       plic = SIFIVE_PLIC(dev);
> -    for (i = 0; i < num_harts; i++) {
> -        CPUState *cpu = qemu_get_cpu(hartid_base + i);
>   
> -        if (plic->addr_config[j].mode == PLICMode_M) {
> -            j++;
> -            qdev_connect_gpio_out(dev, num_harts + i,
> +    for (i = 0; i < plic->num_addrs; i++) {
> +        int cpu_num = plic->addr_config[i].hartid;
> +        CPUState *cpu = qemu_get_cpu(hartid_base + cpu_num);
> +
> +        if (plic->addr_config[i].mode == PLICMode_M) {
> +            qdev_connect_gpio_out(dev, num_harts + cpu_num,
>                                     qdev_get_gpio_in(DEVICE(cpu), IRQ_M_EXT));
>           }
> -
> -        if (plic->addr_config[j].mode == PLICMode_S) {
> -            j++;
> -            qdev_connect_gpio_out(dev, i,
> +        if (plic->addr_config[i].mode == PLICMode_S) {
> +            qdev_connect_gpio_out(dev, cpu_num,
>                                     qdev_get_gpio_in(DEVICE(cpu), IRQ_S_EXT));
>           }
>       }

The logic is much easier to follow now, thanks.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

