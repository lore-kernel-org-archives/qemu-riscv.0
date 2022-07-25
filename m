Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oFmgE-00085V-ES
	for mharc-qemu-riscv@gnu.org; Sun, 24 Jul 2022 21:14:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oFmgB-000856-BT; Sun, 24 Jul 2022 21:14:39 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:37614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oFmg9-0000g2-Md; Sun, 24 Jul 2022 21:14:39 -0400
Received: by mail-pg1-x52d.google.com with SMTP id bh13so9017668pgb.4;
 Sun, 24 Jul 2022 18:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rpUztao9v4w21QPSh70Cfo4TBSWijTdTp3bElPebtP0=;
 b=A1yRpjaLSNHGCnIXM0LQJntJ14BVQvlNdbL0Qde0YOB8eE5eVMkr02aqzZL+D+VTl5
 e/ix4342GO/yuKHiqDxtL7LYo9dk8OW1CrKfhQaxlA7lpA8kd2P3kTdTjSs5egPy/okw
 iwKvZ6aJBavo4OhdEItU/NNrvSZmOVdX/ZthkYgecOIDrz/srWHAEMUCRCWlmhWBK7x+
 xyaei6yJBQSAnjLcaB04dgUER4a/tY0coq1Urn4FJhhvIdc5H/vUSA+tPVA1bF/f+EEb
 ETZJYG1D08ul/7pMdrDCkoiC4Z5PxK7a5Zpm2GtJIeixXwrmcMjd1DQ58U911hhG+G49
 hQ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rpUztao9v4w21QPSh70Cfo4TBSWijTdTp3bElPebtP0=;
 b=u9480QpeBhEBDKURIsrj5eiXO2HqwfGmpJulZ/xsj7YtYg4uRgPXvg9vda99dmAr3z
 Vl7ouu5iptQ54eoJXQJHQ5LZGIJvP7oLkysHMKdlj4MWLTRWEI9wPfoOShKs1z7hwAp/
 +TPvhdMzgfJEa0nfmKQqhUN8Q3OEOJ3QFnqhVWw+5Pwuj1SOt+S2TzhNOZwAmQbQiWQx
 tfBzY/E3+ilaOMG9hH6tFNQnP121QoG22Ih/vEaEJ3xyvi/bg/Dl5BlvqyZg0Fg30xbs
 wz4pylgAf7oa2Rpe65QfQwou1dvnv+7v9kG0cHbxHj9ZRqiylFZGRtHhR87N/x0M7b1Z
 dbJQ==
X-Gm-Message-State: AJIora+JJjCdOh2vKMJs2Xm+C0S7JJT0A5dPdVIC+pI4tLewmU2PyxqH
 IhmK1cW+YmE+IH0jha8yG3CzY+4fT++HlOV2MGs=
X-Google-Smtp-Source: AGRyM1t2ScHZoMVVzY1lE7S9ze1SxkzqqRMju2IS/DOwKaAmNAeLrnvUIrr/u2HDpnps4RrSaj4bJxdwwRvJLP3oK2M=
X-Received: by 2002:aa7:9e9b:0:b0:528:2948:e974 with SMTP id
 p27-20020aa79e9b000000b005282948e974mr10335909pfq.79.1658711674935; Sun, 24
 Jul 2022 18:14:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220723090335.671105-1-atishp@rivosinc.com>
In-Reply-To: <20220723090335.671105-1-atishp@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 25 Jul 2022 11:14:08 +1000
Message-ID: <CAKmqyKODh+im_v2NJhRcYgeaYmvDS9BXW++RaOzEb9oQD53zKw@mail.gmail.com>
Subject: Re: [PATCH] hw/intc: sifive_plic: Fix multi-socket plic configuraiton
To: Atish Patra <atishp@rivosinc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=alistair23@gmail.com; helo=mail-pg1-x52d.google.com
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
X-List-Received-Date: Mon, 25 Jul 2022 01:14:39 -0000

On Sat, Jul 23, 2022 at 7:22 PM Atish Patra <atishp@rivosinc.com> wrote:
>
> Since commit 40244040a7ac, multi-socket configuration with plic is
> broken as the hartid for second socket is calculated incorrectly.
> The hartid stored in addr_config already includes the offset
> for the base hartid for that socket. Adding it again would lead
> to segfault while creating the plic device for the virt machine.
> qdev_connect_gpio_out was also invoked with incorrect number of gpio
> lines.
>
> Fixes: 40244040a7ac (hw/intc: sifive_plic: Avoid overflowing the addr_config buffer)
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

Can you share the -cpu options that causes the segfault? I'll add it
to my test case

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/intc/sifive_plic.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
> index 56d60e9ac935..fdac028a521f 100644
> --- a/hw/intc/sifive_plic.c
> +++ b/hw/intc/sifive_plic.c
> @@ -454,10 +454,10 @@ DeviceState *sifive_plic_create(hwaddr addr, char *hart_config,
>
>      for (i = 0; i < plic->num_addrs; i++) {
>          int cpu_num = plic->addr_config[i].hartid;
> -        CPUState *cpu = qemu_get_cpu(hartid_base + cpu_num);
> +        CPUState *cpu = qemu_get_cpu(cpu_num);
>
>          if (plic->addr_config[i].mode == PLICMode_M) {
> -            qdev_connect_gpio_out(dev, num_harts + cpu_num,
> +            qdev_connect_gpio_out(dev, cpu_num,
>                                    qdev_get_gpio_in(DEVICE(cpu), IRQ_M_EXT));
>          }
>          if (plic->addr_config[i].mode == PLICMode_S) {
> --
> 2.25.1
>
>

