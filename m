Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42DFCEB64D9
	for <qemu-riscv@archiver.kernel.org>; Mon, 19 Jun 2023 20:32:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qBLYG-0003Kh-Vk; Mon, 19 Jun 2023 16:32:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1qBLYF-0003K2-6K; Mon, 19 Jun 2023 16:32:39 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1qBLYD-0007zc-4o; Mon, 19 Jun 2023 16:32:38 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1b51414b080so22054905ad.0; 
 Mon, 19 Jun 2023 13:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687206754; x=1689798754;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=RjJrcIhD0vmAc9aYgLK8eIYtfoBKpUYS32QCLF8XIX4=;
 b=qgFhgnJ3dgJcCTPOmFZUR/JjX41doynGe0Q7WLtverwdPk5XVLBAkeBO2XF95u+Peb
 vCVgbpo5oenMDTIMi1Z4EMo+o8Z3jNNxNtw+mxmwRmn9wVZIskAfSWT7TzPQ3ZeDZc6y
 5q0zKzzUsV3Q3XI2TYpNnD8OxzI5qquj9Cg35j8hEG81is9nYk7L7iMmt9BqUKkRa93l
 fq6WK5DiWy2TYmOkcGyE9leyMXVWOnadfvfm5+cjkZ8Y17T/M2fJA9Q4YNV2UHBDKp0H
 Z6pOFoq+TCh4d8Bu95d2ITWn3Q7DffG8G71qrHNGohz9zbiY79RLusjLXWSpJ+ceyJce
 OP3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687206754; x=1689798754;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RjJrcIhD0vmAc9aYgLK8eIYtfoBKpUYS32QCLF8XIX4=;
 b=GUPt59Z+cQ28MHtecgRAz7RP3XRy8k5GDU132K+UF6lxrLbE1Iy/1m1wTP6sAUoqH8
 twkEb41l+prZNFscevb+Uc67SvBWEpv3790TWeXoMs+7LmbXb2eIHGE53h6JXjmD9S8Q
 6q0JoyhNduGCI71HKvkCy4eud53QFI5ZaUKpYJWrG/eB4/0H4BcNHv8z+1cJw21fPXyh
 G4H9ZF+gg+cOQd5Kfd6L4hbYRYs+yQrN3/6sClsZCwtdK9y15mUMce3dEj/AAxx6Sx0G
 ld5rlr4hj6Zpp8za+s2JxgoWv7HJAPsK1v0y23hAWSgasr3fwXwUzp9OsUpcfvSIQJ/G
 z4dA==
X-Gm-Message-State: AC+VfDz6SFsdj90PTrxmfIgknSadIPr+cxyRL2tVtp1D2QFcgc++Oe46
 bNUNVtkl1zyUqIQg4pBWq24=
X-Google-Smtp-Source: ACHHUZ7L60R4MknY3/dFctkeXx4NB931ZtIjL3bgJvauXQkrXgMnbslRESwtBd9SfqyX1VB+xDHY1g==
X-Received: by 2002:a17:902:ea01:b0:1b2:1ee9:682 with SMTP id
 s1-20020a170902ea0100b001b21ee90682mr11169367plg.23.1687206754399; 
 Mon, 19 Jun 2023 13:32:34 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 iz3-20020a170902ef8300b001b3e84240b4sm242603plb.67.2023.06.19.13.32.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jun 2023 13:32:33 -0700 (PDT)
Date: Mon, 19 Jun 2023 13:32:31 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair@alistair23.me>, alistair23@gmail.com,
 Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, bmeng.cn@gmail.com,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: Re: [PATCH v4 6/6] hw/riscv: Enable TPM backends
Message-ID: <3c07be7c-4af2-4a2b-8b0a-236e2f6a4a62@roeck-us.net>
References: <20220420055248.960491-1-alistair.francis@opensource.wdc.com>
 <20220420055248.960491-7-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220420055248.960491-7-alistair.francis@opensource.wdc.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=groeck7@gmail.com; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Hi Alistair,

On Wed, Apr 20, 2022 at 03:52:48PM +1000, Alistair Francis wrote:
> From: Alistair Francis <alistair.francis@wdc.com>
> 
> Imply the TPM sysbus devices. This allows users to add TPM devices to
> the RISC-V virt board.
> 
> This was tested by first creating an emulated TPM device:
> 
>     swtpm socket --tpm2 -t -d --tpmstate dir=/tmp/tpm \
>         --ctrl type=unixio,path=swtpm-sock
> 
> Then launching QEMU with:
> 
>     -chardev socket,id=chrtpm,path=swtpm-sock \
>     -tpmdev emulator,id=tpm0,chardev=chrtpm \
>     -device tpm-tis-device,tpmdev=tpm0
> 
> The TPM device can be seen in the memory tree and the generated device
> tree.
> 
I tried to get this working with qemu 8.0, but I did not have any success.
I am quite sure I have the above command line correctly, and it does work
with arm64. Any idea what I might be missing ?

Thanks,
Guenter

> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/942
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> ---
>  hw/riscv/virt.c  | 4 ++++
>  hw/riscv/Kconfig | 1 +
>  2 files changed, 5 insertions(+)
> 
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 6eed1f4d70..b62fd66a49 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -43,6 +43,7 @@
>  #include "sysemu/device_tree.h"
>  #include "sysemu/sysemu.h"
>  #include "sysemu/kvm.h"
> +#include "sysemu/tpm.h"
>  #include "hw/pci/pci.h"
>  #include "hw/pci-host/gpex.h"
>  #include "hw/display/ramfb.h"
> @@ -1612,6 +1613,9 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>      hc->plug = virt_machine_device_plug_cb;
>  
>      machine_class_allow_dynamic_sysbus_dev(mc, TYPE_RAMFB_DEVICE);
> +#ifdef CONFIG_TPM
> +    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_TPM_TIS_SYSBUS);
> +#endif
>  
>      object_class_property_add_bool(oc, "aclint", virt_get_aclint,
>                                     virt_set_aclint);
> diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
> index da790f5936..79ff61c464 100644
> --- a/hw/riscv/Kconfig
> +++ b/hw/riscv/Kconfig
> @@ -34,6 +34,7 @@ config RISCV_VIRT
>      imply PCI_DEVICES
>      imply VIRTIO_VGA
>      imply TEST_DEVICES
> +    imply TPM_TIS_SYSBUS
>      select RISCV_NUMA
>      select GOLDFISH_RTC
>      select MSI_NONBROKEN
> -- 
> 2.35.1
> 
> 

