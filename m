Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oKpDO-0004cQ-Gp
	for mharc-qemu-riscv@gnu.org; Sun, 07 Aug 2022 18:57:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oKpDM-0004Vg-KE; Sun, 07 Aug 2022 18:57:44 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:53949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oKpDL-0002gi-5J; Sun, 07 Aug 2022 18:57:44 -0400
Received: by mail-pj1-x102c.google.com with SMTP id pm17so7267260pjb.3;
 Sun, 07 Aug 2022 15:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=BMTC+DwXoz+zkXquQeRYDcoGv3cu7wN4+LhltZtMJeA=;
 b=Dpsn7TpMHiZJHB69YFWtt1X9ZOAYMem6tdASVybB0ucUfIciTrCsPvMlpLtkjW/3kS
 gZE1yw2ek86JaO8tZnw4ZKMwAraiLvJqc2ku0Q07tix6Kw3ZhOoVzF5JDYzJFWn3ncHN
 jyfgTblbTb8Nk8SWTl/auuTU7sFvHvJWm5oGzMCI0oZftTge47gNm4nJuSCgKE4b7NoC
 wYW3s1doMg6O2LC6Q2btGNzweEyzwrqwFyDV7/n4P+o5gVLFMZN4x01uJULSp/fsetVo
 rxwE0fq7VSa4/rVA9ng9u3vXnTT6Fbhtyup8LY5NZct3cWp7CFhqojucyOAdtqAyXyFw
 gHOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=BMTC+DwXoz+zkXquQeRYDcoGv3cu7wN4+LhltZtMJeA=;
 b=XLudFxXoVw+S6YGqaCMnn4OvnIZUeYGyxlCXC7KzX9V04tncn7UTOadOT1Sy3RirPY
 QiAx4P84WuDCsWsULWx8h18PQhNwQHHSCxhEzkQaHVu7E92VOAmsMam1cwtP+GiI0ao3
 UZiT3+taZrLWjjyEaHB68cS6KWXeOQkldOsMecWGVwdmMUZHBNNjOl2GFqeBRi2ULbgn
 WKXp4fveFnUnop01VPCTwDj6DMZed10UCgF1c2r7/Y7R8J7DUoADwiM63gRacnFz/xLt
 Q4hz1bTBVWWogFwHfuUHhdsM5qTcXcFSsYUhAUVIXQbFL0BRLiXu+TAAOA7ZAaXuBKJp
 5LuQ==
X-Gm-Message-State: ACgBeo07IIybEWDXs5Pkm+4cFrMbOOBLTxs3U2MSY3Akyrm8A1SyHfP4
 32MoZOvnZWMqASX4zIe2rxgxar5aArEDZKoM/Vk=
X-Google-Smtp-Source: AA6agR6xoAS6Kjto5qys7Bhma0ux+UmuU+jZ6yGBvIQ/DRXyLznEjcQQpr0tVst26RQpRmZupfAMyo/Ej5t7f5RGHcc=
X-Received: by 2002:a17:90b:3b49:b0:1f4:df09:d671 with SMTP id
 ot9-20020a17090b3b4900b001f4df09d671mr18013298pjb.129.1659913061562; Sun, 07
 Aug 2022 15:57:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220805155405.1504081-1-mail@conchuod.ie>
 <20220805155405.1504081-6-mail@conchuod.ie>
In-Reply-To: <20220805155405.1504081-6-mail@conchuod.ie>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 8 Aug 2022 08:57:15 +1000
Message-ID: <CAKmqyKO02Wx5XOcNUrX-+at+BTLgCLNo_7zqi4i_HM6ZcBLN6w@mail.gmail.com>
Subject: Re: [PATCH 5/5] hw/core: fix platform bus node name
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
X-List-Received-Date: Sun, 07 Aug 2022 22:57:44 -0000

On Sat, Aug 6, 2022 at 2:02 AM Conor Dooley <mail@conchuod.ie> wrote:
>
> From: Conor Dooley <conor.dooley@microchip.com>
>
> "platform" is not a valid name for a bus node in dt-schema, so warnings
> can be see in dt-validate on a dump of the riscv virt dtb:
>
> /stuff/qemu/qemu.dtb: platform@4000000: $nodename:0: 'platform@4000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|soc|axi|ahb|apb)(@[0-9a-f]+)?$'
>         From schema: /home/conor/.local/lib/python3.9/site-packages/dtschema/schemas/simple-bus.yaml
> "platform-bus" is a valid name, so use that instead.
>
> CC: Rob Herring <robh@kernel.org>
> Fixes: 11d306b9df ("hw/arm/sysbus-fdt: helpers for platform bus nodes addition")
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/core/sysbus-fdt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/core/sysbus-fdt.c b/hw/core/sysbus-fdt.c
> index 19d22cbe73..edb0c49b19 100644
> --- a/hw/core/sysbus-fdt.c
> +++ b/hw/core/sysbus-fdt.c
> @@ -539,7 +539,7 @@ void platform_bus_add_all_fdt_nodes(void *fdt, const char *intc, hwaddr addr,
>
>      assert(fdt);
>
> -    node = g_strdup_printf("/platform@%"PRIx64, addr);
> +    node = g_strdup_printf("/platform-bus@%"PRIx64, addr);
>
>      /* Create a /platform node that we can put all devices into */
>      qemu_fdt_add_subnode(fdt, node);
> --
> 2.37.1
>
>

