Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lHa22-0003fP-U0
	for mharc-qemu-riscv@gnu.org; Wed, 03 Mar 2021 17:31:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lHa20-0003dL-P8; Wed, 03 Mar 2021 17:31:48 -0500
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f]:35758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lHa1y-0006ah-U0; Wed, 03 Mar 2021 17:31:48 -0500
Received: by mail-io1-xd2f.google.com with SMTP id g27so26212181iox.2;
 Wed, 03 Mar 2021 14:31:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Qv6ePLspdjDvpkr5vJihauZ24z4dtnS/re8vrMsqG/s=;
 b=VfOnUsMCDQJBOm1FRnxdl8Jhcvbg+o8OQSO2b+2yDB/QLdF6RJu+8xRAd9RdFaVWNi
 7oIJFGpd/DiycZMx/7qAgvSGgPngke+Fye0VitSViyu37uEgjxxlD0obArAS9z0VrW9P
 yyh/So8yQHAeLiHJ/jMyeFeyQLA77qPJDOwI9d4sNglT1c3hcUizLUyI/zao0WSGmr3z
 ZAFVs/qnpLnyOnJBjnEYl0BvJbrJT0EqL/6mB487qppp3Luc+VagIbZimc6BxxpLgpsD
 nFyJdFywDokSDKebmHm/el25uCU30u27dadr8N/4ajgxH+qWcDg1hH9obTAR3AxJEEeQ
 NIsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Qv6ePLspdjDvpkr5vJihauZ24z4dtnS/re8vrMsqG/s=;
 b=a/KNrpGCjb36+i6Y2/YHJWtEM8qWPfoltiW1AiBJ0bGOyJsbAKnV/6uI0cWqAF1t49
 TTM5t//qSUw6NLvqPj1Ey+p3xHNSSCLW+7xdWRGcyCeT/idAL2WReJVR0EyQ13ASNiqC
 cevV1xmODG0RbV9VLvG6AJCobv+qHDf51Zu5uahYKmcSlFtmk7rUaZk+Ppc2FVnp8DiB
 Bamocu6xo82StGLIuzj+JaGp2AI/sKBbcEWGgPDebnQS320uEHYFd8bKgt0NRiFSGtvU
 HOz8rnb11o8vWdX9FYTpzmZpk+1AEj45HJcticgWyfNfOxacw2ZQ2VbxUyqqkwoUZo3Y
 jFTg==
X-Gm-Message-State: AOAM53229jxYI6KwP/0oeS438j5WAAPGhjLuMg6Of64m71zoYX7OPxVT
 yeOfOmiKAYRxf6AZvd7PnMmk8JaFb4UakmF4pLs=
X-Google-Smtp-Source: ABdhPJzlxpYLrtnmGhmtG1pUxTXYKewnZHCKw+aTiG/jZsfnCIyyfG/tGkgHNRYfezYfbT0t4wRjKvUGY3YQA7uRibw=
X-Received: by 2002:a02:cc1b:: with SMTP id n27mr1156775jap.106.1614810702424; 
 Wed, 03 Mar 2021 14:31:42 -0800 (PST)
MIME-Version: 1.0
References: <20210228111657.23240-1-ashe@kivikakk.ee>
 <20210228111657.23240-3-ashe@kivikakk.ee>
In-Reply-To: <20210228111657.23240-3-ashe@kivikakk.ee>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 3 Mar 2021 17:30:26 -0500
Message-ID: <CAKmqyKOOR=Vhy5EZ6L-T+6fd7_bF0W3ik1djHg2oGz9gQLUtbA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] hw/riscv: allow ramfb on virt
To: Asherah Connor <ashe@kivikakk.ee>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2f.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Mar 2021 22:31:49 -0000

On Sun, Feb 28, 2021 at 6:20 AM Asherah Connor <ashe@kivikakk.ee> wrote:
>
> Allow ramfb on virt.  This lets `-device ramfb' work.
>
> Signed-off-by: Asherah Connor <ashe@kivikakk.ee>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

>
> ---
>
> (no changes since v2)
>
> Changes in v2:
> * Add ramfb as allowed on riscv virt machine class.
>
>  hw/riscv/virt.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 82eff42c37..700b481fa2 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -42,6 +42,7 @@
>  #include "sysemu/sysemu.h"
>  #include "hw/pci/pci.h"
>  #include "hw/pci-host/gpex.h"
> +#include "hw/display/ramfb.h"
>
>  static const struct MemmapEntry {
>      hwaddr base;
> @@ -743,6 +744,8 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>      mc->cpu_index_to_instance_props = riscv_numa_cpu_index_to_props;
>      mc->get_default_cpu_node_id = riscv_numa_get_default_cpu_node_id;
>      mc->numa_mem_supported = true;
> +
> +    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_RAMFB_DEVICE);
>  }
>
>  static const TypeInfo virt_machine_typeinfo = {
> --
> 2.20.1
>
>

