Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nwZHk-00060T-Cp
	for mharc-qemu-riscv@gnu.org; Wed, 01 Jun 2022 21:06:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nwZHg-0005rR-JP; Wed, 01 Jun 2022 21:05:58 -0400
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a]:34647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nwZHd-00052y-Ur; Wed, 01 Jun 2022 21:05:55 -0400
Received: by mail-oi1-x22a.google.com with SMTP id k187so4860939oif.1;
 Wed, 01 Jun 2022 18:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8/0w2SktY8tfUNS6+DRb9v0kq0umzuoEBb0FsALn/BY=;
 b=jxLXz2FEoPwl97aBmqHbG7b3P3Zk5mgyeH3hQUEDH85SEJmncYCA2nEn8TjikAF6Dc
 8ohdAqknooRhrdWbIhAU+2czdYqf4E4HBrqr8VliPqb6josWwmGdOyMJTXeF41uovhHL
 dgKwhg9y3XEiZVULYmSG4MaXYsNTVuhy9svSE85L2rBsolnro9u4SZPILHcGash6IHnd
 ILyaQOqzRAK20FODMuFxyyShUaMRXOZ0TMi3/e918qhk5Sc5kO9/1ab9gPGZ1+fi56by
 t+jtpgelcfkoeKYkj//DnvgJhdE7m+0OFzLo0zQ0bq7byfzYsznYwvcQ4gys1MA63oA8
 eg6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8/0w2SktY8tfUNS6+DRb9v0kq0umzuoEBb0FsALn/BY=;
 b=RpvyA3jT2G4Yc46lL6Yet9i8LghOgX5faihuPm3R+ayL5qBGp626vXE/ftE2WP02k1
 zKRSAYMQ8W98Vn5+qIA0eImWnYxBkl8CqHV+lPy2pp64g862NCkK0fBlDWDtdsdPbS+B
 B1hC/RjrHS09b1sOvkf6vBasW5mMDBz82sr+nM5aGVG5brj+YrWjOe8yKzmT0CQVfQ3T
 PCFzDvzM3l8gjpOQIYA/+xu/veFATJZV7Yt2cp8zZSe0CmYToTlWBSY5Lc0kcUw8HVrS
 LlduWYeKQ1+ZvyrQapozxtY4quJZpYUUIdI0GBITJdD+/5XhBXhu8czgVG9yFp9NW+1L
 vYWA==
X-Gm-Message-State: AOAM531Dd9BaJHwOWKwxWZMeaUKTmXdHzwhX8VyDhyfkW9aKu17yODWH
 ZxPU9nW2a9qD4uFGeYMvwoepcFOHNPa/C4fU03M=
X-Google-Smtp-Source: ABdhPJyTbWAGIS/4G1r5LaCQpG7jyhDNCfuMo0uEoH7Wm5CjQp2EnNRhRTMrcYa3ntz58QsxRQ0WkFw6clAYDiwzNig=
X-Received: by 2002:a05:6808:1817:b0:32b:6b00:e9a8 with SMTP id
 bh23-20020a056808181700b0032b6b00e9a8mr1280057oib.278.1654131952247; Wed, 01
 Jun 2022 18:05:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220601013631.196854-1-alistair.francis@opensource.wdc.com>
In-Reply-To: <20220601013631.196854-1-alistair.francis@opensource.wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 2 Jun 2022 11:05:26 +1000
Message-ID: <CAKmqyKN81LZDM6foB3_v742imQEHvkqk83AS4rUzvVTxo1BDBA@mail.gmail.com>
Subject: Re: [PATCH] hw/intc: sifive_plic: Avoid overflowing the addr_config
 buffer
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: Jiangyifei <jiangyifei@huawei.com>,
 "limingwang (A)" <limingwang@huawei.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Thomas Huth <thuth@redhat.com>, 
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=alistair23@gmail.com; helo=mail-oi1-x22a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Thu, 02 Jun 2022 01:05:58 -0000

On Wed, Jun 1, 2022 at 11:36 AM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
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

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  hw/intc/sifive_plic.c | 19 +++++++++----------
>  1 file changed, 9 insertions(+), 10 deletions(-)
>
> diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
> index eebbcf33d4..56d60e9ac9 100644
> --- a/hw/intc/sifive_plic.c
> +++ b/hw/intc/sifive_plic.c
> @@ -431,7 +431,7 @@ DeviceState *sifive_plic_create(hwaddr addr, char *hart_config,
>      uint32_t context_stride, uint32_t aperture_size)
>  {
>      DeviceState *dev = qdev_new(TYPE_SIFIVE_PLIC);
> -    int i, j = 0;
> +    int i;
>      SiFivePLICState *plic;
>
>      assert(enable_stride == (enable_stride & -enable_stride));
> @@ -451,18 +451,17 @@ DeviceState *sifive_plic_create(hwaddr addr, char *hart_config,
>      sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, addr);
>
>      plic = SIFIVE_PLIC(dev);
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
>                                    qdev_get_gpio_in(DEVICE(cpu), IRQ_M_EXT));
>          }
> -
> -        if (plic->addr_config[j].mode == PLICMode_S) {
> -            j++;
> -            qdev_connect_gpio_out(dev, i,
> +        if (plic->addr_config[i].mode == PLICMode_S) {
> +            qdev_connect_gpio_out(dev, cpu_num,
>                                    qdev_get_gpio_in(DEVICE(cpu), IRQ_S_EXT));
>          }
>      }
> --
> 2.35.3
>

