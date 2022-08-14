Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oNLaS-0006g7-RZ
	for mharc-qemu-riscv@gnu.org; Sun, 14 Aug 2022 17:56:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oNLaN-0006fo-LX; Sun, 14 Aug 2022 17:55:56 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:35452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oNLaM-0005yu-1J; Sun, 14 Aug 2022 17:55:55 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 o3-20020a17090a0a0300b001f7649cd317so12974504pjo.0; 
 Sun, 14 Aug 2022 14:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=GBxN+sPBU9Sl/lscOMy1MjZne9FQGdwFrSHvq8m8+nI=;
 b=oBjLax2Hb1iTZPLfIi6JtGAJb3V4i6Nmq7wzQOfrLjsD+q6Mzj1wTHKEIkXx6/bfGw
 xXtYOh0qMRjjXRJOMFSvDWydVdoTBPBMOHs9meNINibjj1ITFQPa8Kgelm5wuldYYr+o
 3/cjBDEhOdY5Hs6ayChQ9USXPc6ve4g8U4Lo/p9ZvjmMHmCm4tOBJPq+uW4byCgwE6PO
 SCrhgjq4JVHtpN+qk9WMRfZ3S6IROjdoHsoM/dkyByPnrHj2isRvLT5JXu867nG+RYZ9
 mJPyaud49gPuX7pfk0gaev37694oe0W9oKlHqwQL/r+v4G/hXvgnN6t4TFhq6do8kWuQ
 8ayw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=GBxN+sPBU9Sl/lscOMy1MjZne9FQGdwFrSHvq8m8+nI=;
 b=t/B20ymJl6OsEiEjNUqeAdeqpFzzaONbDZISDstLygH5k/pSNxyU+RRA512fRZW8fS
 Mq5iXDj+QJ4j8qAcZAPgCJW8QHo8hzVccCE4eLSkJ04M3m8hqNRg2bNN0C8o4fWvcnzM
 1hsnyTeMzXEiG55SYFXDdVddEXTTN0YOEnIylNezxKpK/uk9sIEA0KNpCeqVq1aK9Cr/
 JrneLl2pVWKNBZGkRnRC9p1ehtyRccotrE+vEsY3trXO5pjF+JCz4Z3mPSA6H9bVkERC
 kHMGErOEg5xdf8Qd4Vov9cTpSH6+9n5SvfbOw60rVos1cEubUqtrPwFXPY4dMiV4oLWH
 EPzg==
X-Gm-Message-State: ACgBeo0OQxRRn6eFEjtObC3SOb/3u0r3Cm5WNY0mNxRMNVtjS0niNixM
 tg5ZT4N1auiHgkDx4PMm8qiMG7okh84EWNBNmfg=
X-Google-Smtp-Source: AA6agR5gG7rPAnxy+e9v42mucMt3OdSKehsj7JfSJQua93wDgp2dXsWTI7YBZmeXcc2Pm1Ol8QQ/bP6gC+xAJWmpUvU=
X-Received: by 2002:a17:902:d4c1:b0:16f:8311:54bc with SMTP id
 o1-20020a170902d4c100b0016f831154bcmr13270201plg.25.1660514151794; Sun, 14
 Aug 2022 14:55:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220810184612.157317-1-mail@conchuod.ie>
 <20220810184612.157317-4-mail@conchuod.ie>
In-Reply-To: <20220810184612.157317-4-mail@conchuod.ie>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 15 Aug 2022 07:55:25 +1000
Message-ID: <CAKmqyKMUZQ-XXxED=2-QQcQsbh270=Q4ODwfZn4qNuiUj15AWw@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] hw/riscv: virt: fix syscon subnode paths
To: Conor Dooley <mail@conchuod.ie>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>, Jessica Clarke <jrtc27@jrtc27.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=alistair23@gmail.com; helo=mail-pj1-x1035.google.com
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
X-List-Received-Date: Sun, 14 Aug 2022 21:55:57 -0000

On Thu, Aug 11, 2022 at 5:06 AM Conor Dooley <mail@conchuod.ie> wrote:
>
> From: Conor Dooley <conor.dooley@microchip.com>
>
> The reset and poweroff features of the syscon were originally added to
> top level, which is a valid path for a syscon subnode. Subsequently a
> reorganisation was carried out while implementing NUMA in which the
> subnodes were moved into the /soc node. As /soc is a "simple-bus", this
> path is invalid, and so dt-validate produces the following warnings:
>
> /stuff/qemu/qemu.dtb: soc: poweroff: {'value': [[21845]], 'offset': [[0]], 'regmap': [[4]], 'compatible': ['syscon-poweroff']} should not be valid under {'type': 'object'}
>         From schema: /home/conor/.local/lib/python3.9/site-packages/dtschema/schemas/simple-bus.yaml
> /stuff/qemu/qemu.dtb: soc: reboot: {'value': [[30583]], 'offset': [[0]], 'regmap': [[4]], 'compatible': ['syscon-reboot']} should not be valid under {'type': 'object'}
>         From schema: /home/conor/.local/lib/python3.9/site-packages/dtschema/schemas/simple-bus.yaml
>
> Move the syscon subnodes back to the top level and silence the warnings.
>
> Reported-by: Rob Herring <robh@kernel.org>
> Link: https://lore.kernel.org/linux-riscv/20220803170552.GA2250266-robh@kernel.org/
> Fixes: 18df0b4695 ("hw/riscv: virt: Allow creating multiple NUMA sockets")
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> I dropped your R-b Alistair intentionally.
> Tested both Linux and FreeBSD:
> [    0.073406] device: 'poweroff': device_add
> [    0.073441] bus: 'platform': add device poweroff
> [    0.502347] bus: 'platform': add driver syscon-poweroff
> [    0.502379] bus: 'platform': __driver_probe_device: matched device poweroff with driver syscon-poweroff
> [    0.502397] bus: 'platform': really_probe: probing driver syscon-poweroff with device poweroff
> [    0.502423] syscon-poweroff poweroff: no pinctrl handle
> [    0.502681] syscon-poweroff poweroff: pm_power_off already claimed for sbi_srst_power_off
> [    0.503333] syscon-poweroff: probe of poweroff failed with error -16
> [    0.073629] device: 'reboot': device_add
> [    0.073664] bus: 'platform': add device reboot
> [    0.500640] bus: 'platform': add driver syscon-reboot
> [    0.500673] bus: 'platform': __driver_probe_device: matched device reboot with driver syscon-reboot
> [    0.500694] bus: 'platform': really_probe: probing driver syscon-reboot with device reboot
> [    0.500725] syscon-reboot reboot: no pinctrl handle
> [    0.502168] driver: 'syscon-reboot': driver_bound: bound to device 'reboot'
> [    0.502242] bus: 'platform': really_probe: bound device reboot to driver syscon-reboot
>
> syscon_power0: <Syscon poweroff> on ofwbus0
> syscon_power1: <Syscon reboot> on ofwbus0
> ---
>  hw/riscv/virt.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 8b2978076e..6f0fd1541b 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -896,7 +896,7 @@ static void create_fdt_reset(RISCVVirtState *s, const MemMapEntry *memmap,
>      test_phandle = qemu_fdt_get_phandle(mc->fdt, name);
>      g_free(name);
>
> -    name = g_strdup_printf("/soc/reboot");
> +    name = g_strdup_printf("/reboot");
>      qemu_fdt_add_subnode(mc->fdt, name);
>      qemu_fdt_setprop_string(mc->fdt, name, "compatible", "syscon-reboot");
>      qemu_fdt_setprop_cell(mc->fdt, name, "regmap", test_phandle);
> @@ -904,7 +904,7 @@ static void create_fdt_reset(RISCVVirtState *s, const MemMapEntry *memmap,
>      qemu_fdt_setprop_cell(mc->fdt, name, "value", FINISHER_RESET);
>      g_free(name);
>
> -    name = g_strdup_printf("/soc/poweroff");
> +    name = g_strdup_printf("/poweroff");
>      qemu_fdt_add_subnode(mc->fdt, name);
>      qemu_fdt_setprop_string(mc->fdt, name, "compatible", "syscon-poweroff");
>      qemu_fdt_setprop_cell(mc->fdt, name, "regmap", test_phandle);
> --
> 2.37.1
>
>

