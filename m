Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22D1FC9830E
	for <qemu-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 06:55:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xBoDZ-0006kl-R1; Wed, 30 Sep 2026 02:55:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1xBoDW-0006ib-Dh
 for qemu-riscv@nongnu.org; Wed, 30 Sep 2026 02:55:02 -0400
Received: from mail-yx2-x2a.google.com ([2607:f8b0:4864:41::2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1xBoDT-0005P7-HJ
 for qemu-riscv@nongnu.org; Wed, 30 Sep 2026 02:55:02 -0400
Received: by mail-yx2-x2a.google.com with SMTP id
 956f58d0204a3-6768033d654so247139d50.0
 for <qemu-riscv@nongnu.org>; Tue, 29 Sep 2026 23:54:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790751298; cv=none;
 d=google.com; s=arc-20260327;
 b=n1K3aSJtwzo6n6ZX3wguSi6Z0Jj989qQ1MbDv79bn6mKKVHmxynuppuoD4/U4nTkqZ
 OKgYPJGxnbcpsARlnFAGqJ4Z83NmAMbHaMcskY/oFPq5sRPW4nQWRChAiWPx7ZDLxgao
 vWjy9D/PqXFWtTdAwho2KvwM55RPtAkWZ6K7HqgEe/A0f0QOfK0fZbkFiQog7okiAcQw
 OpwCnhpcn5q4fGwhseXDYMf5/00nSkH2x9SJzsf+6tc+DEizi1OcX5teTQXHl4j34NF4
 xs/+xs35DPUEP1bai2XTScHbGH+DgtIP9wZon2NiiHheKYJVAUHjPOP7uv4ekctlsLUo
 KjXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=blhB68vkNBGEEUHWQ/OhcTHQiwO2airpb0N7R54VSjs=;
 fh=4eZmpWN5aNfRfIaukh4FDb5mX3S5ekTzOoegE6TnGzs=;
 b=ExSMM8iVS57nHvyI+XjV4Fv6Jib6Bku1fJgTV89oZLoO0+rZqsX7nwWgN6oha0CARq
 TqqNtkeV9xAfWG6EW8308G5AUzHuYkcJSjlVQTONlKeUC0enWE8prjD0Z/+EVuDD4c6R
 mk12jV0QCU2uRTBH89zAbZawir9YtViYSAnvUXmZo6Yt4IPZZ1PAqabTg12iWEcBvQZr
 vkmU9t5iuEG2wVUpozbj9EF4pgDo09gC1AZGE/MpjH2XvtDUl6/7hP+BlDeETjXMJi5c
 rTPmCapknhxXZusPbH6TsgycrOU2rabCgFzbPAQiKmRDvW6f91gHVCL3ziGlEJnCrAzU
 LytA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jms.id.au; s=google; t=1790751298; x=1791356098; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=blhB68vkNBGEEUHWQ/OhcTHQiwO2airpb0N7R54VSjs=;
 b=jXNqCnYsRlTu/b2J0rRHN7Krzz3lZqzbzfUoDc0fm1tIxbM7wRsweiJFpMbINHBGtP
 kQi6NGoovY+/owhAWA4/faartrl3Tej/rStD26AsglKX+uISazfg/aIaAySXyEZ1KPUn
 nyTWU7Nv+Z5SvdYp/HHo7v9xUg5FKMtG2Z+Dc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790751298; x=1791356098;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=blhB68vkNBGEEUHWQ/OhcTHQiwO2airpb0N7R54VSjs=;
 b=acAz+HfEQ9XajOLkA3wJybKEzPzulTIWKlsYwDspITM1b7M4TMb4hcBNVMURj0dLLB
 3ofwp/Ctr0SNazLhjhvAq9dxPZi/bwLJZJQ81HjMW7hzAtQDDV9oxjrmPd7uPnjvEBOq
 jWtylARtJMjU0S/B/hd7rH8RKO6oUDEgKZO71en/NWOurHbkwqwizx46Mkt+Gow0jlAY
 OvCmc/L8iJJZG5e6NVUSRXtZadKBFZnXLz8+Uwy3b4X7sODIcg5frGYYlrI37hrAdl8g
 XQ/+wiQgp8CUlyrlib6yrKkIJ/HXyw49hen2C4nJkxSSvJYIrS5LajHomJz2NuU+xkcl
 jnJg==
X-Forwarded-Encrypted: i=1;
 AKwUvBzmK46QwamAdpzMQ2p0hj2rgngsQFXHd0D44CoQu0Mbc/Pvpzz7+PUMQIOGYSOiUppauAXBPMzxVXaR@nongnu.org
X-Gm-Message-State: AFq9FYJndtNVjE4GKZWMRn5cbZkDKz6gC/l0BIZyOS8+dOmaFhCO0es6
 FpKORvA4fJ6+uT4jgPXUas8duj4SfERqHe3k/hNe/sUIiUcl7qhWBTjFhvdUVH4jIJR16QSrcKA
 xyHK4zMf5DuA33+efaaRpS/WZ2h3HEUc=
X-Gm-Gg: AYBFou1tdFxxFROc7l/AmxIt8O8uLAVDGuIO0YYa+I9M7g5iGc78ZgpIQk6Bqh1KDpn
 HiZAGhQ6Mc3fzpPoFyEudayBYvkKUtDrmIoJhtKh3ozDlSbvru7XNYCwN6p1H+qrhHU7Ruq9kJj
 CUDqF0Kme80Mn6oGV0E9WSj9FfAhFryI5RT8l8h/tj7euVFNpZNlMsYRUhwxjI/ZotbJYNvofgK
 VjubIuPbh/TbmyqAbZ8uCLP6beTHhMyww7ZrRy/08MZGPgCGMx3Gxm+IdN+2PMizYoOVx+XO/sN
 ohflHARyNVTq9Q7OkouQ94YzFkNgPnoLyS6eH64acgH7eNLBssM9t63otWEGLFS/pLa2b1vESFq
 owuLQXdDmq4hh6wsUxNskGyrV0ZrvIhIK43Dr7N2ArsdVqevRuZQzlgEtFDmzslnUP8Ofoh7ZrG
 f6lsW4vFUFHvUdS3k+yWG1kMaoAsM8
X-Received: by 2002:a53:e941:0:b0:672:a068:8e43 with SMTP id
 956f58d0204a3-67683586fdfmr151428d50.100.1790751297896; Tue, 29 Sep 2026
 23:54:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260904-atlantis_prcm-v3-0-8bf20795a381@oss.tenstorrent.com>
 <20260904-atlantis_prcm-v3-2-8bf20795a381@oss.tenstorrent.com>
In-Reply-To: <20260904-atlantis_prcm-v3-2-8bf20795a381@oss.tenstorrent.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 30 Sep 2026 16:24:46 +0930
X-Gm-Features: AclHuK9Ds3xCc0oM-ADDX9JNSJlG-aAWTUcec6SkgoE_xy664Gc_16-xqO-EbR4
Message-ID: <CACPK8Xf2vW4MLPgNEzbL3YGSgQQmnBM6NyujwgQ8K+sF5aW9qA@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] hw/riscv/tt-atlantis: Add PRCMs to tt-atlantis
 model
To: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Cc: qemu-devel@nongnu.org, Nicholas Piggin <npiggin@gmail.com>, 
 Michael Ellerman <mpe@kernel.org>,
 Portia Stephens <portias@oss.tenstorrent.com>, qemu-riscv@nongnu.org, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Chao Liu <chao.liu@processmission.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:41::2a;
 envelope-from=joel.stan@gmail.com; helo=mail-yx2-x2a.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Sat, 5 Sept 2026 at 00:18, Anirudh Srinivasan
<asrinivasan@oss.tenstorrent.com> wrote:
>
> Atlantis has 4 PRCMs that are visible from S mode by the Ascalon Core
> (RCPU, HSIO, PCIe and MM). The remaining 2 are only accessed by the
> boot cpu which isn't modelled yet.

Bonus points for adding them if you have a model ready.

> This commit adds these 4 PRCM blocks to the tt-atlantis model, along
> with necessary device tree nodes for them.
>
> Reviewed-by: Chao Liu <chao.liu@processmission.com>
> Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>

Happy with this once the the sysbus_realize return code checked. A
bunch of other minor things in here I found from checking the
generated device tree with the linux tools, which I don't think is
necessary but does neaten things up a bit.

Reviewed-by: Joel Stanley <joel@jms.id.au>

>
> diff --git a/docs/system/riscv/tt_atlantis.rst b/docs/system/riscv/tt_atlantis.rst
> index 1f2880d617..539c22354f 100644

>  };
> @@ -327,11 +332,36 @@ static void create_fdt_i2c_device(void *fdt, TTAtlantisSoCState *s, int bus,
>      qemu_fdt_setprop_cell(fdt, name, "reg", addr);
>  }
>
> +static char *create_fdt_prcm(void *fdt, const MemMapEntry *mem,
> +                             const char *prcm_name)
> +{
> +    hwaddr base = mem->base;
> +    hwaddr size = mem->size;
> +    char *name = g_strdup_printf("/soc/prcm_%s@%" PRIx64,

clock-controller@ instead of prcm_foo to match the binding, and save
ourselves the string formatting.

> +                                 prcm_name, base);
> +    g_autofree char *compatible =
> +        g_strdup_printf("tenstorrent,atlantis-prcm-%s", prcm_name);
> +
> +    qemu_fdt_add_subnode(fdt, name);
> +    qemu_fdt_setprop_string(fdt, name, "compatible", compatible);
> +    qemu_fdt_setprop_sized_cells(fdt, name, "reg", 2, base, 2, size);
> +    qemu_fdt_setprop_cell(fdt, name, "#address-cells", 1);
> +    qemu_fdt_setprop_cell(fdt, name, "#size-cells", 0);

No children, so we don't need size and address cells.

> +    qemu_fdt_setprop_cell(fdt, name, "#clock-cells", 1);
> +    qemu_fdt_setprop_cell(fdt, name, "#reset-cells", 1);
> +    qemu_fdt_setprop_cell(fdt, name, "phandle", next_phandle());
> +
> +    return name;
> +}
> +
>  static void finalize_fdt(void *fdt, TTAtlantisSoCState *s)
>  {
>      uint32_t aplic_s_phandle = next_phandle();
>      uint32_t imsic_s_phandle = next_phandle();
>      uint32_t periph_clk_phandle = next_phandle();
> +    uint32_t osc_24m_phandle = next_phandle();
> +    uint32_t prcm_rcpu_phandle;
> +    g_autofree char *rcpu_name, *hsio_name, *pcie_name, *mm_name;
>
>      create_fdt_cpu(fdt, s, aplic_s_phandle, imsic_s_phandle);
>
> @@ -348,6 +378,30 @@ static void finalize_fdt(void *fdt, TTAtlantisSoCState *s)
>                      aplic_s_phandle);
>
>      create_fdt_clk(fdt, "periph-clk", 100000000, periph_clk_phandle);

Nothing uses this now, so it can be dropped?

> +    create_fdt_clk(fdt, "osc_24m", 24000000, osc_24m_phandle);

We're not Linux, but the Linux device tree checker will complain if
you use _ instead of -.

> +
> +    rcpu_name = create_fdt_prcm(fdt, &s->memmap[TT_ATL_PRCM_RCPU], "rcpu");
> +    prcm_rcpu_phandle = qemu_fdt_get_phandle(fdt, rcpu_name);

I made a mistake the past review, as Daniel pointed out, confusing
qemu_fdt_get_phandle for qemu_fdt_alloc_phandle. Sorry for the
confusion.

> @@ -587,6 +650,28 @@ static void tt_atlantis_soc_realize(DeviceState *dev, Error **errp)
>      serial_mm_init(s->memory, s->memmap[TT_ATL_UART1].base, 2,
>                     qdev_get_gpio_in(s->irqchip, TT_ATL_UART1_IRQ),
>                     115200, serial_hd(0), DEVICE_LITTLE_ENDIAN);
> +
> +    /* 4 PRCM blocks */
> +    sysbus_realize(SYS_BUS_DEVICE(&s->prcm[PRCM_DOMAIN_RCPU]), errp);
> +    memory_region_add_subregion(
> +        s->memory, s->memmap[TT_ATL_PRCM_RCPU].base,
> +        sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->prcm[PRCM_DOMAIN_RCPU]), 0));
> +
> +    sysbus_realize(SYS_BUS_DEVICE(&s->prcm[PRCM_DOMAIN_HSIO]), errp);
> +    memory_region_add_subregion(
> +        s->memory, s->memmap[TT_ATL_PRCM_HSIO].base,
> +        sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->prcm[PRCM_DOMAIN_HSIO]), 0));
> +
> +    sysbus_realize(SYS_BUS_DEVICE(&s->prcm[PRCM_DOMAIN_PCIE]), errp);
> +    memory_region_add_subregion(
> +        s->memory, s->memmap[TT_ATL_PRCM_PCIE].base,
> +        sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->prcm[PRCM_DOMAIN_PCIE]), 0));
> +
> +    sysbus_realize(SYS_BUS_DEVICE(&s->prcm[PRCM_DOMAIN_MM]), errp);

Check for success and return, for all the sysbus_realize calls we pass errp to.

You could make these a loop with a {type, map} table, but no biggie.

