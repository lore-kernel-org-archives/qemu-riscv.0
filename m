Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oVJWa-0003C7-R7
	for mharc-qemu-riscv@gnu.org; Mon, 05 Sep 2022 17:20:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oVJWY-0003Ab-UM
 for qemu-riscv@nongnu.org; Mon, 05 Sep 2022 17:20:55 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:46666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oVJWX-0004Q5-23
 for qemu-riscv@nongnu.org; Mon, 05 Sep 2022 17:20:54 -0400
Received: by mail-yb1-xb35.google.com with SMTP id 202so9600204ybe.13
 for <qemu-riscv@nongnu.org>; Mon, 05 Sep 2022 14:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=xnTM6EdMzbw4HntlBgQD6qYDXKhS5T/ojEbT+aURGjI=;
 b=zlnZDzzQmiME7XXYM/AZdU546fEhC6jwi2sxJTksaIwgrshXsUnBx4+0P0/thWvINz
 MPDrsdAkxSOQONaSLWVfxU2tWdk+BnLIO1idmQKqh2E9Sea+/nOgdZxAfa+3baFj5kGG
 G5b1MTVWe6fxIs4JPYTVutFbQQxV097KKsYCPIdQgIzeZ8jUNcZcSm7AngBuJ9LEr9SK
 LQ8SNfJ8KbCiCyvFMy1q4XpaX4S2b3rcBr20Z4HO6GV/fw7kKeZpt2tbHcembY+SPbAS
 BNls2Aub769UlftrzTwzImDZdcIZVFrgA9F4gYvt/5U/Ae5Hkglyl4hLZfbNQpSC3K3H
 BtCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=xnTM6EdMzbw4HntlBgQD6qYDXKhS5T/ojEbT+aURGjI=;
 b=XDYjdrekt+rtawDZ+qeWOHYNWXg6SMsdNAODfS9JGEE22gF+LvvrY4y4IIaOi0Y8GW
 2p9SUC995bzt+337ytLTSh+2NNyHDYcpmOMcNXof1xzn6GB5yAE/vxHQ7UYVNSSE/nNl
 Wo/uWBWPLiCVWh/ouClncCEZrnpwvHYlXGmqWvyTag4ag+wFA3lGMg66ncLZlreJ7Trk
 PDAfSLksABO/Y8OHuDryaoibJAQZlmpbdWetJSkdp9UZi6Bs6TcKK3fFM6goVVRfLYQh
 cyVRxSjXCGtOV3izpw84Rvr5cSpo3cNOztsy+jUXs90anu47Hnvdf14FyVGALv7eNvUf
 HNSQ==
X-Gm-Message-State: ACgBeo3Wbm7crUwIapU0Wfby/csZV8UOpHiW67pR3dRO5wkwGBid4Nb4
 743v0muNuXHHHGHrgqyJPdVFRklHFF2UeKTB3WwPzA==
X-Google-Smtp-Source: AA6agR5UNnvx8OYvUou9qKCI846CV+yPxzDI66CcGV5NJYYkbNPv8NBlHwMmeCcfszFJqrEZdyG23tE6499t8mKGeFk=
X-Received: by 2002:a05:6902:1612:b0:6a8:e6b3:36e1 with SMTP id
 bw18-20020a056902161200b006a8e6b336e1mr8238414ybb.39.1662412851314; Mon, 05
 Sep 2022 14:20:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220905182238.374545-1-sunilvl@ventanamicro.com>
 <20220905182238.374545-2-sunilvl@ventanamicro.com>
In-Reply-To: <20220905182238.374545-2-sunilvl@ventanamicro.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Sep 2022 22:20:40 +0100
Message-ID: <CAFEAcA8QKs7foPWyf_OgEQog=zhfPNnz5dyevDXjPSXrVkh9sw@mail.gmail.com>
Subject: Re: [PATCH V2 1/3] hw/arm,loongarch: Move load_image_to_fw_cfg() to
 common location
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Song Gao <gaosong@loongson.cn>, 
 Gerd Hoffmann <kraxel@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Andrew Jones <ajones@ventanamicro.com>, Anup Patel <apatel@ventanamicro.com>, 
 Atish Kumar Patra <atishp@rivosinc.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 05 Sep 2022 21:20:56 -0000

On Mon, 5 Sept 2022 at 19:23, Sunil V L <sunilvl@ventanamicro.com> wrote:
>
> load_image_to_fw_cfg() is duplicated by both arm and loongarch. The same
> function will be required by riscv too. So, it's time to refactor and
> move this function to a common path.
>
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---
>  hw/arm/boot.c             | 49 ---------------------------------------
>  hw/loongarch/virt.c       | 33 --------------------------
>  hw/nvram/fw_cfg.c         | 49 +++++++++++++++++++++++++++++++++++++++
>  include/hw/nvram/fw_cfg.h |  3 +++
>  4 files changed, 52 insertions(+), 82 deletions(-)


> diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
> index d605f3f45a..3f68dae5d2 100644
> --- a/hw/nvram/fw_cfg.c
> +++ b/hw/nvram/fw_cfg.c
> @@ -41,6 +41,7 @@
>  #include "qapi/error.h"
>  #include "hw/acpi/aml-build.h"
>  #include "hw/pci/pci_bus.h"
> +#include "hw/loader.h"
>
>  #define FW_CFG_FILE_SLOTS_DFLT 0x20
>
> @@ -1221,6 +1222,54 @@ FWCfgState *fw_cfg_find(void)
>      return FW_CFG(object_resolve_path_type("", TYPE_FW_CFG, NULL));
>  }
>
> +/**
> + * load_image_to_fw_cfg() - Load an image file into an fw_cfg entry identified
> + *                          by key.

For functions declared in public header files, put the doc comment
in the .h file, not the .c file, please.

thanks
-- PMM

