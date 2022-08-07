Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oKpBj-0002Fn-1w
	for mharc-qemu-riscv@gnu.org; Sun, 07 Aug 2022 18:56:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oKpBh-0002Cf-0Y; Sun, 07 Aug 2022 18:56:01 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:46842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oKpBf-0002Tr-C3; Sun, 07 Aug 2022 18:56:00 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 q7-20020a17090a7a8700b001f300db8677so7510020pjf.5; 
 Sun, 07 Aug 2022 15:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=J35VYfb/k+UHn3LPA5cvyRwQTefgVmN3WoLJbDt7REk=;
 b=X7HrpkbtFlnom2BYDhOHN1/hcm5nT8vTY9GfQkTFJ6w1muRYq5d6B7NHusUJL7HALl
 oN5DhwJ+p1vg1/hdLhzym/7R0sUOG1L3wNcqxGx6HaG6nQ7SmMMbcp/pNRDBil2Pb+qO
 My6fxbo4SsnC5MMUZMPB9bM/DsrxCVh4ktVP7ToiWlluVg0ZxCmAb0prkGevw1ua4/ET
 4BpOwxdjKfNtW9QK/mYAmHuZz2ST5OLSwbNAx+yu6jHGwx7IwHoQrGcUG3IpBt2x0r6+
 T/w6nv2ObzbL06Ko+oMUjkvGsyyILXL7K/sRAlx/Y2zPLC3koFKUnpVPoarOzhAL7jXn
 aR5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=J35VYfb/k+UHn3LPA5cvyRwQTefgVmN3WoLJbDt7REk=;
 b=K02yV+8xvX/vqcQZHZKe79vsHVbiIlc2OZxx3unXoCWhdl3fkO5AlJJRgrrVwira+7
 wlBNsBesile2+77ZTG0EVQC3kz7rrf7gL3OFsV48WZGIF7oLAuEMiixLknySkgVWG1KJ
 URDbF6fpzNalZ+gJo8dbN0l8NjWAz2cgxw1YdobnJTKTjgpO14V5ICgKuoI3868qR/hg
 dT37p6xurE5Z9qMMxv7L4paaJ5OGZA/gKevF5l1XngBdLDHJKHGz3N7w6vhV3K8j9fzJ
 /8rho2rZZE7FgKz1XTK3mOrlrfkGC8ndNQYRHSqTG7XJEpMY0TbtDLMpHGOpy3I61LaE
 d7og==
X-Gm-Message-State: ACgBeo1hLpi3ybQYeTVlHwFsdTesZ0vr82MCx3tKk+XTLHf65/2hv4Gp
 9F8MqE3H0FibwIBnyOxVO3S/E4f4FciwnBg6Omo=
X-Google-Smtp-Source: AA6agR5vRb9tdgQsI3Fu1w/08lyVQregHr4zyKnVRFkyDEFtxF1wZXMQ5+F/Emzi2XElDWvHoW82YDNkH5B3UtZktuQ=
X-Received: by 2002:a17:902:e5c8:b0:16f:1511:7575 with SMTP id
 u8-20020a170902e5c800b0016f15117575mr16374823plf.83.1659912957399; Sun, 07
 Aug 2022 15:55:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220805155405.1504081-1-mail@conchuod.ie>
 <20220805155405.1504081-3-mail@conchuod.ie>
In-Reply-To: <20220805155405.1504081-3-mail@conchuod.ie>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 8 Aug 2022 08:55:31 +1000
Message-ID: <CAKmqyKOipk6L56xFYO52JXrW2DFjbfrtXvdm+6=Wjh2H5rxx-Q@mail.gmail.com>
Subject: Re: [PATCH 2/5] hw/riscv: virt: fix uart node name
To: Conor Dooley <mail@conchuod.ie>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=alistair23@gmail.com; helo=mail-pj1-x102c.google.com
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
X-List-Received-Date: Sun, 07 Aug 2022 22:56:01 -0000

On Sat, Aug 6, 2022 at 2:01 AM Conor Dooley <mail@conchuod.ie> wrote:
>
> From: Conor Dooley <conor.dooley@microchip.com>
>
> "uart" is not a node name that complies with the dt-schema.
> Change the node name to "serial" to ix warnings seen during
> dt-validate on a dtbdump of the virt machine such as:
> /stuff/qemu/qemu.dtb: uart@10000000: $nodename:0: 'uart@10000000' does not match '^serial(@.*)?$'
>         From schema: /stuff/linux/Documentation/devicetree/bindings/serial/8250.yaml
>
> Reported-by: Rob Herring <robh@kernel.org>
> Link: https://lore.kernel.org/linux-riscv/20220803170552.GA2250266-robh@kernel.org/
> Fixes: 04331d0b56 ("RISC-V VirtIO Machine")
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/virt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index bc424dd2f5..6c61a406c4 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -917,7 +917,7 @@ static void create_fdt_uart(RISCVVirtState *s, const MemMapEntry *memmap,
>      char *name;
>      MachineState *mc = MACHINE(s);
>
> -    name = g_strdup_printf("/soc/uart@%lx", (long)memmap[VIRT_UART0].base);
> +    name = g_strdup_printf("/soc/serial@%lx", (long)memmap[VIRT_UART0].base);
>      qemu_fdt_add_subnode(mc->fdt, name);
>      qemu_fdt_setprop_string(mc->fdt, name, "compatible", "ns16550a");
>      qemu_fdt_setprop_cells(mc->fdt, name, "reg",
> --
> 2.37.1
>
>

