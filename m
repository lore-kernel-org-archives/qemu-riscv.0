Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oGg4p-0005DH-O0
	for mharc-qemu-riscv@gnu.org; Wed, 27 Jul 2022 08:23:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oGg4n-0005Ax-Un; Wed, 27 Jul 2022 08:23:45 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:36680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oGg4m-0007iK-BA; Wed, 27 Jul 2022 08:23:45 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 15-20020a17090a098f00b001f305b453feso2034531pjo.1; 
 Wed, 27 Jul 2022 05:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+ruz5ZV7m2FQZQa4g1aL3tUmblQr1UHvdV8mU5Q5wC8=;
 b=kBbNWheBlEyzHEdeeOl+eXpOYLfeJXqeO9TQg/pGPx3jl15g/StYESse7iQQvGWhvG
 GqclGYaZDv7TvJs0Svr4WUHWbdjm0KdmgQhPVGkvYzgnO7Tsk5Aewl+iuappR0G47jME
 QU4dvKyfJoytYhhyN0gYhEilXOCA6z/3RcX8cDkGtFhr+N7uxJDW06K1xo8otMO2Fscp
 XpGMI/9cfdX/SrE0TjVSOrIe4NFQk+tsMscodemz4fWx5iCG91i6csWIOefv4Cun9STu
 rNIlGMf4+QmtHELvxkZxARzDZaU9NhhTVPjkNe5yMcbL+zbOKRK0cILLrdQW8T3U3Gp3
 ktqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+ruz5ZV7m2FQZQa4g1aL3tUmblQr1UHvdV8mU5Q5wC8=;
 b=03uZSn6ABZk9jLUWTZ4QrzR/M0KtXvnUFIBu9f0uekXeJfrb0cnhAktmW9GZv3FyV1
 Bfq5ecRrKvVnaOKa2Aw0hLD7Cyi8+rDKSNnTBVf9K9XtJCl3sKEy1t6q27ryu0guAsD8
 NX8BGofwVIeV4pU9+XjW4AQ9WXDN7OYa3doDXn3jYjV4x1Vzx85g9iFu3ssUUj5aJMJS
 xDCqKZbhkidH5R7Fi8Dn+RVaM8N4LILgM6L8d82rdepJbK5obV9NB95LdMgGZlzF3s2T
 sCuyi6rXdEp6g8dk6qvnI0VLUcRtNJ5d8Q9Nqquwed0Lw5wBpt7ICKKH5hV3KeboeKLw
 yI2Q==
X-Gm-Message-State: AJIora+u5VIq3cirorrImVGPCuiVtv12e9W8K+5LPPwvS/w8teLt/GC2
 onQXj/PecTo8yO/GjIHMTMBuN6jFqMUZAzAOHro=
X-Google-Smtp-Source: AGRyM1sFBPvdAUv5lBcFDZp7LUbLdH/0AVtMRQs1VMAiIKa4hSkkdZDxGxVwlO928KhMOVSSKI9pg1w2C8jPvj8hAZs=
X-Received: by 2002:a17:90b:100e:b0:1f3:a4a:2620 with SMTP id
 gm14-20020a17090b100e00b001f30a4a2620mr3227304pjb.120.1658924622442; Wed, 27
 Jul 2022 05:23:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220723090335.671105-1-atishp@rivosinc.com>
In-Reply-To: <20220723090335.671105-1-atishp@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 27 Jul 2022 22:23:16 +1000
Message-ID: <CAKmqyKP4jg5yoTfQX_=CcL9y5F9FtKBQ4OHH31KoD14T1H4mVA@mail.gmail.com>
Subject: Re: [PATCH] hw/intc: sifive_plic: Fix multi-socket plic configuraiton
To: Atish Patra <atishp@rivosinc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=alistair23@gmail.com; helo=mail-pj1-x1032.google.com
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
X-List-Received-Date: Wed, 27 Jul 2022 12:23:46 -0000

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

Argh!

I was trying to get this ready to go into 7.1. I have been working on
updating my tests to catch this failure in the future as well.

While testing this change I noticed that it breaks the noMMU test case.

I think the correct fix is actually this (on top of your patch):

diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
index fdac028a52..af4ae3630e 100644
--- a/hw/intc/sifive_plic.c
+++ b/hw/intc/sifive_plic.c
@@ -457,7 +457,7 @@ DeviceState *sifive_plic_create(hwaddr addr, char
*hart_config,
        CPUState *cpu = qemu_get_cpu(cpu_num);

        if (plic->addr_config[i].mode == PLICMode_M) {
-            qdev_connect_gpio_out(dev, cpu_num,
+            qdev_connect_gpio_out(dev, num_harts - plic->hartid_base + cpu_num,
                                  qdev_get_gpio_in(DEVICE(cpu), IRQ_M_EXT));
        }
        if (plic->addr_config[i].mode == PLICMode_S) {

The idea is that we need to increment the second argument to
qdev_connect_gpio_out() for the PLICMode_M compared to the PLICMode_S
case.

This ensures that we do that correctly without breaking anything.

How does that look to you?

Alistair

>                                    qdev_get_gpio_in(DEVICE(cpu), IRQ_M_EXT));
>          }
>          if (plic->addr_config[i].mode == PLICMode_S) {
> --
> 2.25.1
>
>

