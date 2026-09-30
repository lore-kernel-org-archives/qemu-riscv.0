Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F22ACA5FB1
	for <qemu-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 07:00:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xBoIy-0000aD-00; Wed, 30 Sep 2026 03:00:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1xBoIA-0000Nl-2B
 for qemu-riscv@nongnu.org; Wed, 30 Sep 2026 02:59:56 -0400
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1xBoI5-0006Bn-AL
 for qemu-riscv@nongnu.org; Wed, 30 Sep 2026 02:59:49 -0400
Received: by mail-pj2-x10.google.com with SMTP id
 d9443c01a7336-2d747ee1f9bso23355795ad.3
 for <qemu-riscv@nongnu.org>; Tue, 29 Sep 2026 23:59:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790751584; cv=none;
 d=google.com; s=arc-20260327;
 b=Og4GwrgF1L+ZX9Zhj7Prs5CaWkOBluoZ9jH3zUH4zog/VU5tf791m+vJOjIsHvqXQN
 2oFCvl9X1KbFKKeumFe9pj5rPcCpjvWKKWMqXkiHbzIBZ6knSTZdo80leO4UFPK1lIhe
 Fo1Hy7s45RQuUqFJlEmdx6k2VZXvPe4QIOs/lmMOuLBItUDRJx51XElE98calyJBgC4q
 0/4DI42DM/9v/fXmhchoLL5S11Co1rfuYB9h75GQBf1Ys5w17yFiyq/dTqLbeEXV4yZi
 zMW5Z9GyWG0LSujlyO/phdKqIlALx7Iw3IWqW50EoTxXr3Y48N2aLL+1b/GmWzwzIhzv
 vv0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=nIM2U5tDbXICcE4Xo+Y/po2Qr6rt7OaAGo/K6r1Ga1g=;
 fh=nf6fqoDNnRHh3jL//OIiaNe6Azjtrx66z8Jow4OzYZU=;
 b=kQ0wNJVv/hpTNJHzQqq2nvsKcemR+jyHi5xJcLHQMxeZGERB6xuV8jSiHQPOrh4xfa
 l+RV10nDfojuzStr8TnLG+Fo4xmEdLcygSP7zgWY7mgJwzdlytGRAHv0ifKVmi3oHqDO
 uiWYXgx54Mol7DISly/9LLu15mlrYwBWJLW772uxX5N/3UbyYcq5WgQcSksiElEtPPeB
 /OuHuvWZXTBM4crbdHyFSK67pn3Bf0Ex/tRCsWEumPWTPFRWu904+8BNgU/lbZFxIoQz
 yjgdNeIt/aaKmJVb49+q7N+yuG6JMggx9Bc5z32FE8tkQkTn3wnUXQkdpEFjDyCYxTZa
 IhDw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jms.id.au; s=google; t=1790751584; x=1791356384; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=nIM2U5tDbXICcE4Xo+Y/po2Qr6rt7OaAGo/K6r1Ga1g=;
 b=DZZU0dJwWXyyl3LEadOFhbvZU6h4/uxXr7wuJg6eyg7WjzLg8IZfCAh5nVhWm9KyQz
 VrVlzKr4y+97s+Usouz+5zO1YNQl4KXU83XKiG2V1hWE0Mp3g4qNVMquwIfpK4gRWD8D
 83Yb+kEZ9sH8IVVVZ00DHUaEXvAdsuQpLZNzY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790751584; x=1791356384;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=nIM2U5tDbXICcE4Xo+Y/po2Qr6rt7OaAGo/K6r1Ga1g=;
 b=FCHOcTvvkCaBzs6WX6PO5TYDafEpETn3fk5E/17TPhBnzP0zhsbGTf6evAmQk7jT3q
 r35wzx+xDMguUNaEbqcSHygBNIe+OA5sNW6XR9MpBnYtY4hds1Ym74mHGyyK8vPG3kpH
 vt+ggZ+iOHqMDt6rDZfTbzi0swTZe9vMtF9JyLvDkmhBX3lHZOApmsu2Dx1guEnhPq2N
 E5AG/L2qfLhyBOcr75DJicaaV6KseNzDZQd191KPheMTox0x/9mmajXdJAqm5WgApUIc
 D8xAS2xVd/TuWSBrH402t+zsIMFsY8GE8ibt/4zNsbHwxC7uYAg4a51vYfaL+njPjEDd
 qhPQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxWQYDOo8+xS5jrs8jeq3HT4wNcTYMVAgpRnVNRe3SMBYLl2B01/Yg4/ncDPeG2LoepTHlacjRDK2mV@nongnu.org
X-Gm-Message-State: AFq9FYKxEJTTg7fR/1wX7i4i2DA+rXOzY/aZf7Gb7cFXI0/rmMm/iJkB
 S6A6HLjKjYREynV4jnR2DVPtoizocC5uXmTF1R8hBGHQi5UaPG1znxReQ9Om0yGA1vaTRYBkkc8
 dvWhvht9eK7IImsTpD+QC9kGrJ4Kg/kE=
X-Gm-Gg: AYBFou3Fd3WiS6pOiTvqMVbkmT3Pz3OnXK+/qkPEevjVRYJ6sYr2AUlSNYT8D5zpPo6
 zJ04Iu+iTF3yDv58yh1ne2d2UP+wCXIigL9k7p3qtOoCqkQAhGMggvbtjQWGZzK7i5xyo9cU8R8
 ooHVXtJN7JEYaQ0jMiu4LgXGpNkOlzYno6H06x+oKiIwOgb1nyzWkuaN9MS0b6xKUGT7vGYyNZG
 n905ht4FQFhn3wyLIcE3vy/Mdl6dVwK/+xPFcCdjhi+rlOEU5cPRO4hhxEgZ5EkgS3kBK0IrJSq
 VkALuprnLoRWknp38C80IzXTAZbO+bObrZlEN6pYtL86K8vhCoMxsJIUamnw4+T1cdop74mvlQp
 K2QycFQdkoCukiQrC9CBfF7PAjyKPwYIp9WHtkaBC2MHXdVKX9Gd0YG0hQAPLaT1cS75+4rQepq
 cRUsbh73r7/Qt3exjXSJFxk9chof4=
X-Received: by 2002:a17:903:2410:b0:2e2:cf7a:2dc8 with SMTP id
 d9443c01a7336-2e2e49e0e61mr4173985ad.39.1790751583706; Tue, 29 Sep 2026
 23:59:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260904-atlantis_prcm-v3-0-8bf20795a381@oss.tenstorrent.com>
 <20260904-atlantis_prcm-v3-1-8bf20795a381@oss.tenstorrent.com>
In-Reply-To: <20260904-atlantis_prcm-v3-1-8bf20795a381@oss.tenstorrent.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 30 Sep 2026 16:29:30 +0930
X-Gm-Features: AclHuK_Y08pPn7ISbFpwTuKhrLBPZ8VhYWJumG9prdZMNa__OM1ptbsbn47xcsE
Message-ID: <CACPK8Xdfq5_tTqCfQfwi3tLimbG5YNO8_H39TY67TArPV1Ls1w@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] hw/misc: Add Tenstorrent Atlantis PRCM model
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
Received-SPF: pass client-ip=2607:f8b0:4864:39::10;
 envelope-from=joel.stan@gmail.com; helo=mail-pj2-x10.google.com
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
>
> This device present in Tenstorrent Atlantis has registers that control
> clocks, reset and other misc functionality in the SoC. This commit adds
> models for the RCPU, HSIO, PCIE, MM and 2 DDR PRCMs.
>
> Co-developed-by: Portia Stephens <portias@oss.tenstorrent.com>
> Signed-off-by: Portia Stephens <portias@oss.tenstorrent.com>
> Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  MAINTAINERS                        |   2 +
>  hw/misc/meson.build                |   1 +
>  hw/misc/trace-events               |   4 +
>  hw/misc/tt_atlantis_prcm.c         | 446 +++++++++++++++++++++++++++++++++++++
>  include/hw/misc/tt_atlantis_prcm.h |  51 +++++
>  5 files changed, 504 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f524d90523..b6cc077602 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1830,7 +1830,9 @@ R: Portia Stephens <portias@oss.tenstorrent.com>
>  L: qemu-riscv@nongnu.org
>  S: Supported
>  F: docs/system/riscv/tt_*.rst
> +F: hw/misc/tt_*.c
>  F: hw/riscv/tt_*.c
> +F: include/hw/misc/tt_*.h
>  F: include/hw/riscv/tt_*.h
>  F: tests/functional/riscv64/test_tt_*.py
>
> diff --git a/hw/misc/meson.build b/hw/misc/meson.build
> index 54e07aacda..11b9593e03 100644
> --- a/hw/misc/meson.build
> +++ b/hw/misc/meson.build
> @@ -39,6 +39,7 @@ system_ss.add(when: 'CONFIG_SIFIVE_E_AON', if_true: files('sifive_e_aon.c'))
>  system_ss.add(when: 'CONFIG_SIFIVE_U_OTP', if_true: files('sifive_u_otp.c'))
>  system_ss.add(when: 'CONFIG_SIFIVE_U_PRCI', if_true: files('sifive_u_prci.c'))
>  system_ss.add(when: 'CONFIG_K230_DECOMP_GZIP', if_true: files('k230_decomp_gzip.c'))
> +system_ss.add(when: 'CONFIG_TENSTORRENT', if_true: files('tt_atlantis_prcm.c'))
>
>  subdir('macio')
>
> diff --git a/hw/misc/trace-events b/hw/misc/trace-events
> index 0b8be3d0f2..8b80b71107 100644
> --- a/hw/misc/trace-events
> +++ b/hw/misc/trace-events
> @@ -452,3 +452,7 @@ launch_update_write(void) ""
>  vmlaunch_reset_enter(void) ""
>  vm_launchupdate_finalize(void) ""
>  restore_host_x86_igvm(void) ""
> +
> +# tt_atlantis_prcm.c
> +tt_atlantis_prcm_read(uint32_t domain, uint64_t offset, uint64_t data) "domain 0x%02x offset 0x%" PRIx64 " data 0x%" PRIx64
> +tt_atlantis_prcm_write(uint32_t domain, uint64_t offset, uint64_t data) "domain 0x%02x offset 0x%" PRIx64 " data 0x%" PRIx64
> diff --git a/hw/misc/tt_atlantis_prcm.c b/hw/misc/tt_atlantis_prcm.c
> new file mode 100644
> index 0000000000..392d7da7f4
> --- /dev/null
> +++ b/hw/misc/tt_atlantis_prcm.c
> @@ -0,0 +1,446 @@
> +/*
> + * PRCM (Clock and Reset Controller) in Tenstorrent Atlantis SoC
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + *
> + * Copyright 2026 Tenstorrent
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/bitops.h"
> +#include "qapi/error.h"
> +#include "qemu/log.h"
> +#include "hw/misc/tt_atlantis_prcm.h"
> +#include "hw/core/qdev-properties.h"
> +#include "hw/core/registerfields.h"
> +#include "hw/core/irq.h"

The three above are unused.

> +#include "trace.h"
> +
> +#define TO_REG(offset) ((offset) >> 2)
> +
> +#define PLL_LOCK_BIT        31
> +#define PLL_FBDIV_LSB       14
> +#define PLL_POSTDIV2_LSB    11
> +#define PLL_POSTDIV1_LSB    8
> +#define PLL_REFDIV_LSB      2
> +#define PLL_BYPASS_BIT      1
> +
> +#define PLL_RESET_VAL(BYPASS, REFDIV, POSTDIV1, POSTDIV2, FBDIV, LOCK)         \
> +  ((LOCK << PLL_LOCK_BIT) | (FBDIV << PLL_FBDIV_LSB) |                         \
> +   (POSTDIV2 << PLL_POSTDIV2_LSB) | (POSTDIV1 << PLL_POSTDIV1_LSB) |           \
> +   (REFDIV << PLL_REFDIV_LSB) | (BYPASS << PLL_BYPASS_BIT))
> +
> +#define RCPU_PLL_RCPU_CFG   TO_REG(0)
> +#define RCPU_PLL_NOCC_CFG   TO_REG(0x4)
> +#define RCPU_NOCC_CLK_CFG   TO_REG(0x8)
> +#define RCPU_RCPU_DIV_CFG   TO_REG(0xc)
> +#define RCPU_RCPU_BLK_CG    TO_REG(0x14)
> +#define RCPU_LSIO_BLK_CG    TO_REG(0x18)
> +#define RCPU_RCPU_BLK_RST   TO_REG(0x1c)
> +#define RCPU_LSIO_BLK_RST   TO_REG(0x20)
> +#define RCPU_PLL_RCPU_EN    TO_REG(0x11c)
> +#define RCPU_PLL_NOCC_EN    TO_REG(0x120)
> +#define RCPU_PLL_MM_EN      TO_REG(0x0124)
> +#define RCPU_PLL1_MM_EN     TO_REG(0x0128)
> +#define RCPU_PLL_HSIO_EN    TO_REG(0x12c)
> +#define RCPU_PLL_PCIE_EN    TO_REG(0x138)
> +#define RCPU_PLL_I2S_EN     TO_REG(0x13C)

Nit: make the 0x case and leading zeros uniform.

> +#define RCPU_PLL_MM_CFG     TO_REG(0x19c)
> +#define RCPU_PLL_HSIO_CFG   TO_REG(0x1a0)
> +#define RCPU_PLL_PCIE_CFG   TO_REG(0x1ac)
> +#define RCPU_BOOT_MODE_CFG  TO_REG(0x1b0)
> +#define RCPU_PLL_I2S_CFG    TO_REG(0x1f4)
> +#define RCPU_I2S_DIV_CFG    TO_REG(0x1f8)
> +#define RCPU_BUS_CFG        TO_REG(0x1fc)
> +#define RCPU_PLL1_MM_CFG    TO_REG(0x2a4)

> +
> +static void tt_atlantis_prcm_write(void *opaque, hwaddr offset,
> +                                   uint64_t data, unsigned size)
> +{
> +    TTAtlantisPRCMState *s = TT_ATLANTIS_PRCM(opaque);
> +    TTAtlantisPRCMClass *c = TT_ATLANTIS_PRCM_GET_CLASS(s);
> +
> +    if (offset >= c->regs_size) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: Out-of-bounds write at offset 0x%" HWADDR_PRIx "\n",
> +                      __func__, offset);
> +        return;
> +    }
> +
> +    trace_tt_atlantis_prcm_write(c->domain, offset, data);
> +
> +    s->regs[TO_REG(offset)] = data;

Are there any fields that should be read only? The PLL lock bits?

>
> +    }
> +
> +    if (data & PLL_EN) {
> +        s->regs[pll_reg_offset] |= BIT(PLL_LOCK_BIT);
> +    } else {
> +        s->regs[pll_reg_offset] &= ~BIT(PLL_LOCK_BIT);
> +    }
> +}
> +
> +static const MemoryRegionOps tt_atlantis_prcm_ops = {
> +    .read = tt_atlantis_prcm_read,
> +    .write = tt_atlantis_prcm_write,
> +    .endianness = DEVICE_LITTLE_ENDIAN,
> +    .valid.min_access_size = 4,
> +    .valid.max_access_size = 4,
> +};
> +
> +static const MemoryRegionOps tt_atlantis_prcm_rcpu_ops = {
> +    .read = tt_atlantis_prcm_read,
> +    .write = tt_atlantis_prcm_rcpu_write,
> +    .endianness = DEVICE_LITTLE_ENDIAN,
> +    .valid.min_access_size = 4,

Are we sure? Do byte accesses trap on hardware?

> +    .valid.max_access_size = 4,
> +};
> +
> +static void tt_atlantis_prcm_realize(DeviceState *dev, Error **errp)
> +{
> +    TTAtlantisPRCMState *s = TT_ATLANTIS_PRCM(dev);
> +    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
> +    TTAtlantisPRCMClass *c = TT_ATLANTIS_PRCM_GET_CLASS(s);
> +
> +    if (c->domain >= PRCM_DOMAIN_COUNT) {

This is set in this file, so it's not going to change at runtime. Do
we make it an assert?

> +        error_setg(errp,
> +                   "domain %d is larger than max number of possible domains %d",
> +                   c->domain, PRCM_DOMAIN_COUNT);
> +        return;
> +    }
> +    s->regs = g_new0(uint32_t, TO_REG(c->regs_size));
> +
> +    memory_region_init_io(&s->mmio, OBJECT(s), c->ops, s,
> +                          TYPE_TT_ATLANTIS_PRCM, c->regs_size);
> +    sysbus_init_mmio(sbd, &s->mmio);
> +}
> +
> +static void tt_atlantis_prcm_reset_hold(Object *obj, ResetType type)
> +{
> +    TTAtlantisPRCMState *s = TT_ATLANTIS_PRCM(obj);
> +    TTAtlantisPRCMClass *c = TT_ATLANTIS_PRCM_GET_CLASS(s);
> +
> +    memset(s->regs, 0, c->regs_size);
> +}

> +static void tt_atlantis_prcm_class_init(ObjectClass *klass,
> +                                        const void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    ResettableClass *rc = RESETTABLE_CLASS(klass);
> +    TTAtlantisPRCMClass *c = TT_ATLANTIS_PRCM_CLASS(klass);
> +
> +    dc->realize = tt_atlantis_prcm_realize;
> +    dc->unrealize = tt_atlantis_prcm_unrealize;
> +    dc->desc = "Tenstorrent Atlantis PRCM Controller";
> +    rc->phases.hold = tt_atlantis_prcm_reset_hold;
> +    c->ops = &tt_atlantis_prcm_ops;
> +}
> +
> +static void tt_atlantis_prcm_rcpu_class_init(ObjectClass *klass,
> +                                             const void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    ResettableClass *rc = RESETTABLE_CLASS(klass);
> +    TTAtlantisPRCMClass *c = TT_ATLANTIS_PRCM_CLASS(klass);
> +
> +    dc->realize = tt_atlantis_prcm_realize;

The parent has already set this, so I think you can drop it from all
of the tt_atlantis_prcm_*_class_init

> +    dc->desc = "Tenstorrent Atlantis RCPU PRCM Controller";
> +    rc->phases.hold = tt_atlantis_prcm_rcpu_reset_hold;
> +    c->domain = PRCM_DOMAIN_RCPU;
> +    c->regs_size = RCPU_DOMAIN_SIZE;
> +    c->ops = &tt_atlantis_prcm_rcpu_ops;
> +}
> +
> +static void tt_atlantis_prcm_hsio_class_init(ObjectClass *klass,
> +                                             const void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    ResettableClass *rc = RESETTABLE_CLASS(klass);
> +    TTAtlantisPRCMClass *c = TT_ATLANTIS_PRCM_CLASS(klass);
> +
> +    dc->realize = tt_atlantis_prcm_realize;

Same.

> +    dc->desc = "Tenstorrent Atlantis HSIO PRCM Controller";
> +    rc->phases.hold = tt_atlantis_prcm_hsio_reset_hold;
> +    c->domain = PRCM_DOMAIN_HSIO;
> +    c->regs_size = HSIO_DOMAIN_SIZE;
> +    c->ops = &tt_atlantis_prcm_ops;

These are the same for all but the rpcu too. I wonder if we should set
it in tt_atlantis_prcm_class_init and only override in
tt_atlantis_prcm_rcpu_class_init?

> +}
> +
> +static void tt_atlantis_prcm_pcie_class_init(ObjectClass *klass,
> +                                             const void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    ResettableClass *rc = RESETTABLE_CLASS(klass);
> +    TTAtlantisPRCMClass *c = TT_ATLANTIS_PRCM_CLASS(klass);
> +
> +    dc->realize = tt_atlantis_prcm_realize;

Same.

> +    dc->desc = "Tenstorrent Atlantis PCIE PRCM Controller";
> +    rc->phases.hold = tt_atlantis_prcm_pcie_reset_hold;
> +    c->domain = PRCM_DOMAIN_PCIE;
> +    c->regs_size = PCIE_DOMAIN_SIZE;
> +    c->ops = &tt_atlantis_prcm_ops;
> +}
> +
> +static void tt_atlantis_prcm_mm_class_init(ObjectClass *klass,
> +                                           const void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    ResettableClass *rc = RESETTABLE_CLASS(klass);
> +    TTAtlantisPRCMClass *c = TT_ATLANTIS_PRCM_CLASS(klass);
> +
> +    dc->realize = tt_atlantis_prcm_realize;

Same.

> +    dc->desc = "Tenstorrent Atlantis MM PRCM Controller";
> +    rc->phases.hold = tt_atlantis_prcm_mm_reset_hold;
> +    c->domain = PRCM_DOMAIN_MM;
> +    c->regs_size = MM_DOMAIN_SIZE;
> +    c->ops = &tt_atlantis_prcm_ops;
> +}
> +
> +static void tt_atlantis_prcm_ddrc0_class_init(ObjectClass *klass,
> +                                              const void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    ResettableClass *rc = RESETTABLE_CLASS(klass);
> +    TTAtlantisPRCMClass *c = TT_ATLANTIS_PRCM_CLASS(klass);
> +
> +    dc->realize = tt_atlantis_prcm_realize;

Same.

> +    dc->desc = "Tenstorrent Atlantis DDR Memory Controller 0 PRCM";
> +    rc->phases.hold = tt_atlantis_prcm_ddrc_reset_hold;
> +    c->domain = PRCM_DOMAIN_DDRC0;
> +    c->regs_size = DDRC0_DOMAIN_SIZE;
> +    c->ops = &tt_atlantis_prcm_ops;
> +}
> +
> +static void tt_atlantis_prcm_ddrc1_class_init(ObjectClass *klass,
> +                                              const void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    ResettableClass *rc = RESETTABLE_CLASS(klass);
> +    TTAtlantisPRCMClass *c = TT_ATLANTIS_PRCM_CLASS(klass);
> +
> +    dc->realize = tt_atlantis_prcm_realize;

Same.

> +    dc->desc = "Tenstorrent Atlantis DDR Memory Controller 1 PRCM";
> +    rc->phases.hold = tt_atlantis_prcm_ddrc_reset_hold;
> +    c->domain = PRCM_DOMAIN_DDRC1;
> +    c->regs_size = DDRC1_DOMAIN_SIZE;
> +    c->ops = &tt_atlantis_prcm_ops;
> +}

> diff --git a/include/hw/misc/tt_atlantis_prcm.h b/include/hw/misc/tt_atlantis_prcm.h
> new file mode 100644
> index 0000000000..dc7938433a
> --- /dev/null
> +++ b/include/hw/misc/tt_atlantis_prcm.h

> +
> +enum {
> +    PRCM_DOMAIN_RCPU = 0,
> +    PRCM_DOMAIN_HSIO = 1,
> +    PRCM_DOMAIN_PCIE = 2,
> +    PRCM_DOMAIN_MM = 3,
> +    PRCM_DOMAIN_DDRC0 = 4,
> +    PRCM_DOMAIN_DDRC1 = 5,
> +    PRCM_DOMAIN_COUNT = 6
> +};

Given these are in the "public" header, give them a prefix. TT_,
TT_ATLANTIS_PRCM_, whatever you think is sensible.

Or move them out. I think they are only used by the machine to index
into it's array of devices, so they're not really part of the model,
and could live in tt_atlantis.c.



> +
> +struct TTAtlantisPRCMState {
> +    SysBusDevice parent;
> +
> +    MemoryRegion mmio;
> +
> +    uint32_t *regs;
> +};
> +
> +struct TTAtlantisPRCMClass {
> +    SysBusDeviceClass parent_class;
> +
> +    uint32_t domain;
> +    uint32_t regs_size;
> +    const MemoryRegionOps *ops;
> +};
> +
> +#endif
>
> --
> 2.43.0
>

