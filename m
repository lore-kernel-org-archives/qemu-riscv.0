Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oKpCo-000412-Kg
	for mharc-qemu-riscv@gnu.org; Sun, 07 Aug 2022 18:57:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oKpCj-0003zT-SW; Sun, 07 Aug 2022 18:57:06 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:39800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oKpCe-0002Yw-NG; Sun, 07 Aug 2022 18:57:05 -0400
Received: by mail-pf1-x42b.google.com with SMTP id b133so6707816pfb.6;
 Sun, 07 Aug 2022 15:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=m6mp7lo6yuezAIF/o/AFEZq8cosxJpR5uX3sLTCul3c=;
 b=dbsCt/bpEragvjxy3VsKqM1MOZVTx/S27Ecr6MV4DzyPscuWnd4Gn/x/U2TYwZnWCb
 58pGEx5fa1uirisZSBP3VE8Gbpbh86aIQcNDgEsamGpI3bsxL4tE6mkyLKclK0O45IcZ
 X4x9RuthG1+Otx3zU9Vfq9T9+8pLbL+E5/g2XzJJfd99XuuwEReyYCIY6yieA63zlcFV
 +SSVB9yvkn0qOLoH4R/Gf0am+cVcjO3I2V4Zq8etglKa/ygMj7nmR4gAnN0C+zx5tv/B
 tXM6TBZB0WMyBKeokUQHE0xd1DHIMQ9KONFNp3sLhcL9EDmTA9R65gFuM9pMpXpyZfoV
 5WNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=m6mp7lo6yuezAIF/o/AFEZq8cosxJpR5uX3sLTCul3c=;
 b=8MuNjL2OjRSLjJvtIDHPjqtJroCW9Sl7n+OWrBDR9dorVSUWIgPbCVa6NQeM3DS9uW
 WipcRGFlMOKI2edGcYgGxNEGXlXCgjA+kGV9Jh/sQFyPBJuR69VMIeSCynZX2zSeThz2
 vuFwa/OddCG0Gui03erLYJzqZcec7KLU3YA+jJCULXJpTs9sRJ9trKmyCe2+QnL+VFqe
 pfH8YvfWcQmzJj/juehCoM/bx+gISoJDz/xOEboonVPtEeDqImxoUtvjsBUXd82UgyO4
 a9IK85I8DoNW8BVF8gWIX9m6TjRue31WqatVB9IxY44EnOeQYrooCsZLX1aM9fllyEbm
 qIhw==
X-Gm-Message-State: ACgBeo2EUtq3dG4TWW0gVFnfYgGdjPhVy+6cz8Hndt25/GvpiJ4+vn53
 LmcO6X7j2U+hvhdTcRtq2aJ+7vD5KKS7CoexAgU=
X-Google-Smtp-Source: AA6agR4/zm3uU4TtEdDqN1yGCg2kBlKZTWXny5+xTeKCQIFhWINjiGWbF0nA4f6gTPfylqGo85QJuVG5aHs8RfiNl74=
X-Received: by 2002:a63:f14c:0:b0:41a:b83d:a636 with SMTP id
 o12-20020a63f14c000000b0041ab83da636mr13455804pgk.361.1659913018847; Sun, 07
 Aug 2022 15:56:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220805155405.1504081-1-mail@conchuod.ie>
 <20220805155405.1504081-5-mail@conchuod.ie>
In-Reply-To: <20220805155405.1504081-5-mail@conchuod.ie>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 8 Aug 2022 08:56:32 +1000
Message-ID: <CAKmqyKPkSi9A074tK3AhCsaxkXaE71UO=OW5PSh4bYbVjVHRmQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] hw/riscv: virt: fix syscon subnode paths
To: Conor Dooley <mail@conchuod.ie>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=alistair23@gmail.com; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sun, 07 Aug 2022 22:57:06 -0000

On Sat, Aug 6, 2022 at 2:10 AM Conor Dooley <mail@conchuod.ie> wrote:
>
> From: Conor Dooley <conor.dooley@microchip.com>
>
> The subnodes of the syscon have been added to the incorrect paths.
> Rather than add them as subnodes, they were originally added to "/foo"
> and a later patch moved them to "/soc/foo". Both are incorrect & they
> should have been added as "/soc/test@###/foo" as "/soc/test" is the
> syscon node. Fix both the reboot and poweroff subnodes to avoid errors
> such as:
>
> /stuff/qemu/qemu.dtb: soc: poweroff: {'value': [[21845]], 'offset': [[0]], 'regmap': [[4]], 'compatible': ['syscon-poweroff']} should not be valid under {'type': 'object'}
>         From schema: /home/conor/.local/lib/python3.9/site-packages/dtschema/schemas/simple-bus.yaml
> /stuff/qemu/qemu.dtb: soc: reboot: {'value': [[30583]], 'offset': [[0]], 'regmap': [[4]], 'compatible': ['syscon-reboot']} should not be valid under {'type': 'object'}
>         From schema: /home/conor/.local/lib/python3.9/site-packages/dtschema/schemas/simple-bus.yaml
>
> Reported-by: Rob Herring <robh@kernel.org>
> Link: https://lore.kernel.org/linux-riscv/20220803170552.GA2250266-robh@kernel.org/
> Fixes: 18df0b4695 ("hw/riscv: virt: Allow creating multiple NUMA sockets")
> Fixes: 0e404da007 ("riscv/virt: Add syscon reboot and poweroff DT nodes")
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/virt.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 8b2978076e..a98b054545 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -896,7 +896,8 @@ static void create_fdt_reset(RISCVVirtState *s, const MemMapEntry *memmap,
>      test_phandle = qemu_fdt_get_phandle(mc->fdt, name);
>      g_free(name);
>
> -    name = g_strdup_printf("/soc/reboot");
> +    name = g_strdup_printf("/soc/test@%lx/reboot",
> +        (long)memmap[VIRT_TEST].base);
>      qemu_fdt_add_subnode(mc->fdt, name);
>      qemu_fdt_setprop_string(mc->fdt, name, "compatible", "syscon-reboot");
>      qemu_fdt_setprop_cell(mc->fdt, name, "regmap", test_phandle);
> @@ -904,7 +905,8 @@ static void create_fdt_reset(RISCVVirtState *s, const MemMapEntry *memmap,
>      qemu_fdt_setprop_cell(mc->fdt, name, "value", FINISHER_RESET);
>      g_free(name);
>
> -    name = g_strdup_printf("/soc/poweroff");
> +    name = g_strdup_printf("/soc/test@%lx/poweroff",
> +        (long)memmap[VIRT_TEST].base);
>      qemu_fdt_add_subnode(mc->fdt, name);
>      qemu_fdt_setprop_string(mc->fdt, name, "compatible", "syscon-poweroff");
>      qemu_fdt_setprop_cell(mc->fdt, name, "regmap", test_phandle);
> --
> 2.37.1
>
>

