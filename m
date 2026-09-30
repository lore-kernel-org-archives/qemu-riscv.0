Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEF73CA5FB1
	for <qemu-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 07:08:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xBoQ5-0004Su-Ib; Wed, 30 Sep 2026 03:08:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1xBoQ1-0004Rg-Ti
 for qemu-riscv@nongnu.org; Wed, 30 Sep 2026 03:07:58 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1xBoQ0-0007o3-4p
 for qemu-riscv@nongnu.org; Wed, 30 Sep 2026 03:07:57 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-2caced6038eso9995835ad.0
 for <qemu-riscv@nongnu.org>; Wed, 30 Sep 2026 00:07:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790752074; cv=none;
 d=google.com; s=arc-20260327;
 b=P+WzUyPd0GRi8npLirh4fdYoj3MZ7y+ecp6HJ919vi9fOiQJT1iY8/qZli/Vk/4aHG
 wseRue4aoHdJqe2UPRY6Nghk2KhSjdue9lisXBoZtLjzR7KfLLm/BosQkhIDJifQdVUy
 GiluAFAGphMxCXa1IEb3dPdlLOGFA3j9szu2a7xb3Niq1t3cu+zE3q6wMKxuG2XV3eSN
 n7fL3YddJb1aHbJoPTdDZAqteKIvGQmE1ElC4AgrFAhx6e+kl64CaNvv60m3oQ4MfoeH
 iuJJ0LvTNp7ky2sP+zyOfpAhaCC/uCwmEgkrYPhjWkZOOIyDm7X1cfPoaSTR2rp3UjqE
 8+Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=ukO4CFAglzrAB8cj2AtxF/LB6a6g0sWqPUGZ9/MwH7U=;
 fh=dCZG/8TR4bHcY/H9CKfTHDPfaOhjDjagiru7NDFx7v0=;
 b=dO1talRnUxgjibpwyQrP/knGeOhbGqwIvK8wIJxCVsNeR3OXSfN82R722wbHSBEQ/j
 GHAI5QpMyz3e5Ajj9XkCgtH6We2RdCiKkZUIcfJYy8ItZPrC+CiJQfgt0PawVFs2otMz
 7rihMvTu0icZuascBl+0HxI8B+LA9+itx+PA41BFfmOjv9lWtovBAFFThEquLGE5mXz7
 C9dUXJD8oQYtEw+ruTr57tfq4lFfnrLIrsxvdznt9qOKGyxtYGxMk1DkBlDBUPcKgyhQ
 d7qAMMr8MaYSuS6GWFMDYCTJ5x3VX/BnjAgMi8/SKI5RDc7JbLjYvOy42KlMKmEDXhTJ
 tTbA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jms.id.au; s=google; t=1790752074; x=1791356874; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=ukO4CFAglzrAB8cj2AtxF/LB6a6g0sWqPUGZ9/MwH7U=;
 b=ZeA/+g1EGNirPbLX8ATMtFIgGSpe1c+fES6WfQk/MEEUmHC+/7W496iirWru0EzFJB
 gB5DONBZX0Q30CDqC2ZcxPvFPEEIoszu/rX65jt2FLW6VFXR+rkv9gBjsGqsPAJj8hSb
 +T9tk5lT9MTkpQyVytrxQey/+WzjGeHF8Mdsk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790752074; x=1791356874;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=ukO4CFAglzrAB8cj2AtxF/LB6a6g0sWqPUGZ9/MwH7U=;
 b=ECH6yPePc8nt7et5aBauXHZ24xdCBZb6m4PLEc11n029OAUnlX5NqvlvUg2WHmZm6b
 Ss5l5f6BZqH06zSwW/B46J9AMD/eZA6jbz8TydM5YB51ICGZsgZvfo7cS3EDFOF8r1VW
 t3vD0va2pcLKbvIjiWJYX5shm0jFHeIbbV5EVjoKIyca75gbbp3fkbGyQUMQyDquqi9R
 yNNk6JBxs+XEMON2NtFo4Nz1xRr2QWoE8PexrbgKSlw37HumYVa9jmpQHs7hoMXCqMHH
 hW1soEbwB3y8E6GNKz3mDxfPD/B/lY3wEmBE/2f/gQo2gTuAMpnVlAenvw6fnmMsD+R2
 DcFQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxVpZnh5XR/J7yn3dO0o9pWn52jtyCo1p+qw9QaW4lleXzw6VDAhIPUkaTNAJzPr3sNXJOBBcWRjfyO@nongnu.org
X-Gm-Message-State: AFq9FYLgzQAdw9lgACPf5F0dtEIfJLgHS6JTp0icfSudPXy23xCX/3pm
 Z9AYGbLlO6LR8KqwY/CHKQU48p0i8vhmu5SseskxuRAcQ2pPtjcl8CfbE4I7IYSuJtJCDwH8xJ1
 x/BOBrpHgMpI9ArZ/dc13AmBs6hZcbz4=
X-Gm-Gg: AYBFou1rxAhLHnZL2J5FxN4JLeok0W/pu3ELVfq4j7CoqW6LpO5V1WbOhfonT2XscJE
 BHlsJF1GvRtAKeLYvX65/8uHyiFESJrKG9iAtA9ZD5rGIbD+o2UE8w/vflvra36o2JAKhprv6pK
 DSegv4X01DHCy8gowRokxcFsVZx+ncfgV2lgUf+P67VaFBJaDLOCB1jIrsUVx7pnHHz66MikjAT
 IdHmNCI/Wmsorv8HLrTUgrPal5quUsIZ5D47+Imlv65N3vLmrFkmawFC0IxXhwcahiF9BW5xBTd
 hhhNEvLTqHmvzpcTApXRi6ccj+KPkxKZEiip2XDC1pLvRitqF/vQcl4EXl25/19ABUb0HHGh/xv
 +b/qR6CUyLscS+PVUVf/NsNWT1mP7D9OYTDtHXWPWKGTfwVGRjEHdx3AYj8HTdPwW3YsqvMjmq/
 y7CLcUEP4No39PQ52NyPkNQmRyLGfj2cYUJmUzmw==
X-Received: by 2002:a17:903:384d:b0:2d7:1cbd:9ceb with SMTP id
 d9443c01a7336-2e2e4b30efcmr3613865ad.12.1790752074534; Wed, 30 Sep 2026
 00:07:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260904-atlantis_prcm-v3-0-8bf20795a381@oss.tenstorrent.com>
 <20260904-atlantis_prcm-v3-3-8bf20795a381@oss.tenstorrent.com>
In-Reply-To: <20260904-atlantis_prcm-v3-3-8bf20795a381@oss.tenstorrent.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 30 Sep 2026 16:37:41 +0930
X-Gm-Features: AclHuK9chH5waVJqh_hz7nXatLen0x7bQ7ExXdRTsbxvPF7s54vTRXxSQjWdGKc
Message-ID: <CACPK8Xdyg7ZsXzDTAGz6u2wSDPRSsW8mE5yu3+ze_X-Zqiju7g@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] hw/riscv/tt-atlantis: Update UART and I2C to use
 clk from PRCM
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=joel.stan@gmail.com; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
> @@ -265,7 +265,8 @@ static void create_fdt_cpu(void *fdt, TTAtlantisSoCState *s,
>  }
>
>  static void create_fdt_uart(void *fdt, const MemMapEntry *mem, int irq,
> -                            int irqchip_phandle)
> +                            int irqchip_phandle, uint32_t clk_parent_phandle,
> +                            uint32_t clk_phandle)
>  {
>      g_autofree char *name = g_strdup_printf("/soc/serial@%"HWADDR_PRIX,
>                                              mem->base);
> @@ -275,7 +276,8 @@ static void create_fdt_uart(void *fdt, const MemMapEntry *mem, int irq,
>      qemu_fdt_setprop_sized_cells(fdt, name, "reg", 2, mem->base, 2, mem->size);
>      qemu_fdt_setprop_cell(fdt, name, "reg-shift", 2);
>      qemu_fdt_setprop_cell(fdt, name, "reg-io-width", 4);
> -    qemu_fdt_setprop_cell(fdt, name, "clock-frequency", 3686400);

The downside of this is we no longer boot with a Linux build that
lacks the PRCM driver, like the old build that is used for functional
testing in the tree.

I suggest we keep clock-frequency along side the clocks node. New
kernels with the PRCM driver use the clock phandle and calculate the
clock. Old kernels keep booting.

The other option is to drop this patch entirely for now, and revisit
later. I'd prefer keeping clock-frequency along side.

> +    qemu_fdt_setprop_cells(fdt, name, "clocks", clk_parent_phandle,
> +                           clk_phandle);
>      qemu_fdt_setprop_cell(fdt, name, "interrupt-parent", irqchip_phandle);
>      qemu_fdt_setprop_cells(fdt, name, "interrupts", irq, 0x4);

> @@ -314,8 +318,8 @@ static void create_fdt_i2c(void *fdt, const MemMapEntry *mem, uint32_t irq,
>      qemu_fdt_setprop_sized_cells(fdt, name, "reg", 2, mem->base, 2, mem->size);
>      qemu_fdt_setprop_cell(fdt, name, "interrupt-parent", irqchip_phandle);
>      qemu_fdt_setprop_cells(fdt, name, "interrupts", irq, 0x4);
> -    qemu_fdt_setprop_cell(fdt, name, "clocks", clk_phandle);
> -    qemu_fdt_setprop_cell(fdt, name, "clock-frequency", 100000);

This should stay, it's the bus frequency.


  clock-frequency:
    description: Desired I2C bus clock frequency in Hz
    enum: [100000, 400000, 1000000, 3400000]
    default: 400000

(or we omit it, and default to 400kHz. Your call).

> +    qemu_fdt_setprop_cells(fdt, name, "clocks", clk_parent_phandle,
> +                           clk_phandle);

This looks good.

>      qemu_fdt_setprop_cell(fdt, name, "#address-cells", 1);
>      qemu_fdt_setprop_cell(fdt, name, "#size-cells", 0);
>  }

