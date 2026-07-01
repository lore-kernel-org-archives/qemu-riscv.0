Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A5B4C43458
	for <qemu-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 04:20:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wemQX-0003GD-JA; Wed, 01 Jul 2026 00:19:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wemQV-0003FT-2X
 for qemu-riscv@nongnu.org; Wed, 01 Jul 2026 00:19:55 -0400
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wemQT-0000lM-3X
 for qemu-riscv@nongnu.org; Wed, 01 Jul 2026 00:19:54 -0400
Received: by mail-yx1-xb12e.google.com with SMTP id
 956f58d0204a3-664d35b4777so219723d50.3
 for <qemu-riscv@nongnu.org>; Tue, 30 Jun 2026 21:19:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782879592; cv=none;
 d=google.com; s=arc-20260327;
 b=L4O18RGKaCHAsoy4pj7ravEWImmTfVkvFjA3MZdVu8dVl8Oqt1hUWq9anvnZ933682
 7t6RtFe2nLXu24FOp3v/l61xylKMSO/VJvJkchrWf6W3Z9NbBGteWvp9tL/1+PuweFEj
 evJukofz1rdgqhhZhM0KE/gKVOKbqOECtHlAuN1khbpMUnLegNCuhs8fkB84oGGG46+H
 Ja679KwfF0O6BYPZVsaQ6PMGpQYkHZOmRPVttfXrx6IqJzdj5Y4HhebOUOji3rcFr+7w
 yQ9ekJ6FO4kltb9verw6fjNf32q0dfNc/BxdsPL5UMQvigeLVi7lm3d6dRllG5aSZ236
 Tc4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=CvgvBLihmNPjprZvfpqDIX5qq/Rjw5o8gsVoLpnBKA8=;
 fh=xe8hYMYkmpj9hu2LCNnxJ4MjilxWY2DzcoqXdXRcIBg=;
 b=D5tjhyH+x16dZFdLfg2aVKFsAF0ZFAISD+WS0w4E6A4I7P+4IGbw2SPo14h5vUgZFV
 Jjy8rA7W1/ZgQw/mKseN5LVKdpdZSm5V4bO+WizFk403/SMi+a1bRda4aG/ZJEQMlFbc
 uAyqOye74+gfyJUVRuFTmC2fvH89AWO5+jfJLJbmInng+i049FDxZrh71rrvsTfiB3xf
 O/6D+e+a3Zeu4MJIfhxEAR6/iHGm8nhKUUFQ2wPQ3xFB2e+cgv9QuBjhRGd2B2FL4bv1
 GMXIuRckmL1O1JmhRavFt6Owybiic6HV5fgtqeYmSxflafCWRtUE0BE5ZRbK36/FX15p
 KO3w==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jms.id.au; s=google; t=1782879592; x=1783484392; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=CvgvBLihmNPjprZvfpqDIX5qq/Rjw5o8gsVoLpnBKA8=;
 b=fq3x21xTz7rlr9XCaL7T2Bmr2wxxk4n0qDoW8OPMh3/7ZLQcxFn3bhHX1zmw1KfwBE
 dvtwuzLBdAmFvSQKQxcL+IcpQOE1+4GeJKcVtCOY/jGdqJCcnYQf3kUGoEPAfaCSrUnf
 P+oeQpDmseVqL0405NSpPN3wKCDaxVn/tvS3Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782879592; x=1783484392;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CvgvBLihmNPjprZvfpqDIX5qq/Rjw5o8gsVoLpnBKA8=;
 b=bRwlbyIho6erXJO6EnOm+4ffTMBAc0Zc07bRR3EjCq4YfAQapOKCpsHJ8ZuYlQu1TT
 Tfs9BLDBQFkO1f5gWR7FYGKVqOhbAMtQ2meWJOxAgpQc1JCz4Ye0h9+q0bCS/FlLOI0p
 ufA/s6NUGBenFP+EiLsy5p8/BW+36hCe4M2DmLlh6IThKdpoo251e+CzX/gWDCGiAgTb
 J6S+yJSzFudREGaF0IbFMRLAxkb7BpLsglUw9xAaTya/anF4fjy85HCB++dOZj9yDhxX
 Op3QMXWG8ph4/i3szE6/ha2CuX/Iz70KCsTMDUw5uK0OLqHHJc2zCfsK9PtrzTSYo9xq
 DzPA==
X-Forwarded-Encrypted: i=1;
 AHgh+RqmOYllQsUIpZjagnKp+1xHU02fBmk9y6kEioRKXD8R1RrlR3c8wroI0r+HXNA7UV/zt60F6RY9DBO8@nongnu.org
X-Gm-Message-State: AOJu0YzFB0fg8gcddWQ4bntNoq2g/6bwN3vUnz2f9GXDt191mH6xPPha
 YUxZ0F15x9tIyq6dru6fPpIh02LgY8rQUOgzPW2q/f+RlVFANrKWBKtU8fXsb0KLm1W/fAPd7SU
 6RG+oLi+s/Dw1Aivwc9kvw28HoPwTsUw=
X-Gm-Gg: AfdE7cmJVpaTBFs3EpcVBOLCcZ8nXf/oHrddPASsHpyMNRnGYh9Azr2ygYe+Plaivdl
 skidKCJlFzxaCgrsr3n+wZbzOs4g/BmgElZ09FZTk8VTvkV3FhWKwovxyfEJdx3J7Dpn4a/lUaR
 mVpWyVC+xl6s17nFmxqDJI7LhJvujRnDgAR+tg3b6CgQeCL6SkfO6RXAayAAjAk0a3zqswt9L0N
 vim7ie7lsSAYE52AyP+TGYuqWhA89RIeQkCDgT+7FO9PTUhB6lZ4DePb+saSu+zgKauTw4eUyrT
 Y1kkbuNrbV2QJpookGP5tnxeJrN0ukkNTtI/MSKc7ew8pyaeehB/iAuZyWqctEzRpsrYxs7h4Lj
 3sdh696hN3pGxKA==
X-Received: by 2002:a05:690e:190d:b0:664:b514:a06f with SMTP id
 956f58d0204a3-66521958471mr37504d50.15.1782879591794; Tue, 30 Jun 2026
 21:19:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260616190147.1286316-1-visitorckw@gmail.com>
 <20260616190147.1286316-4-visitorckw@gmail.com>
In-Reply-To: <20260616190147.1286316-4-visitorckw@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 1 Jul 2026 13:49:40 +0930
X-Gm-Features: AVVi8Cd48M5qRjkGNLjxwKG1Gr3rOgK6CT4OdqS_FmrqEQlT4LaGWZSMTfJP-c4
Message-ID: <CACPK8Xe5DUNiBn1PLvDD3tBWFqaCzD0TUEGcK8UmV14gsRvWTg@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] hw/riscv: Add Sophgo CV1800B SoC support
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: pbonzini@redhat.com, marcandre.lureau@redhat.com, alistair.francis@wdc.com,
 farosas@suse.de, lvivier@redhat.com, liwei1518@gmail.com, 
 daniel.barboza@oss.qualcomm.com, zhiwei_liu@linux.alibaba.com, 
 chao.liu.zevorn@gmail.com, jserv@ccns.ncku.edu.tw, eleanor15x@gmail.com, 
 marscheng@google.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12e;
 envelope-from=joel.stan@gmail.com; helo=mail-yx1-xb12e.google.com
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

On Wed, 17 Jun 2026 at 04:31, Kuan-Wei Chiu <visitorckw@gmail.com> wrote:

> diff --git a/hw/riscv/cv1800b.c b/hw/riscv/cv1800b.c
> new file mode 100644
> index 0000000000..c6749e1202
> --- /dev/null
> +++ b/hw/riscv/cv1800b.c
> @@ -0,0 +1,168 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Sophgo CV1800B SoC
> + *
> + * Copyright (c) 2026 Kuan-Wei Chiu <visitorckw@gmail.com>
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qapi/error.h"
> +#include "hw/riscv/cv1800b.h"
> +#include "hw/core/qdev-properties.h"
> +#include "target/riscv/cpu-qom.h"
> +#include "system/system.h"
> +#include "hw/char/serial.h"

Unused?

> +#include "hw/intc/riscv_aclint.h"
> +#include "system/address-spaces.h"
> +#include "hw/intc/sifive_plic.h"
> +#include "target/riscv/cpu.h"
> +#include "hw/riscv/boot.h"
> +#include "hw/sd/sdhci.h"
> +#include "hw/misc/unimp.h"

> +
> +static void cv1800b_soc_instance_init(Object *obj)
> +{
> +    CV1800BSoCState *s = CV1800B_SOC(obj);
> +
> +    object_initialize_child(obj, "cpus", &s->cpus, TYPE_RISCV_HART_ARRAY);
> +    object_initialize_child(obj, "clk", &s->clk, TYPE_CV1800B_CLK);
> +}
> +
> +static void cv1800b_soc_realize(DeviceState *dev, Error **errp)
> +{
> +    CV1800BSoCState *s = CV1800B_SOC(dev);
> +    MachineState *ms = MACHINE(qdev_get_machine());
> +    uint32_t num_harts = ms->smp.cpus;
> +    MemoryRegion *system_memory = get_system_memory();
> +    char *plic_hart_config;
> +    DeviceState *uart, *sdhci;
> +
> +    qdev_prop_set_uint32(DEVICE(&s->cpus), "num-harts", num_harts);
> +    qdev_prop_set_uint32(DEVICE(&s->cpus), "hartid-base", 0);
> +    qdev_prop_set_string(DEVICE(&s->cpus), "cpu-type", TYPE_RISCV_CPU_THEAD_C906);
> +
> +    qdev_prop_set_uint64(DEVICE(&s->cpus), "resetvec",
> +                         cv1800b_memmap[CV1800B_DEV_ROM].base);

These could go in cv1800b_soc_instance_init. I think num-harts can
stay here, as it relies on the machine details.

> +
> +    sysbus_realize(SYS_BUS_DEVICE(&s->cpus), &error_fatal);
> +

