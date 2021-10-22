Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mdw0F-0006NN-70
	for mharc-qemu-riscv@gnu.org; Fri, 22 Oct 2021 10:58:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mdw0B-0006MK-Jp; Fri, 22 Oct 2021 10:58:36 -0400
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a]:45807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mdw07-0002NC-5z; Fri, 22 Oct 2021 10:58:33 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id i84so7505717ybc.12;
 Fri, 22 Oct 2021 07:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=km/pk7jmSYnQExpfCc66NiMnMWyjFfJvFrVN2IAVDow=;
 b=B/JuWYbgt1bRpufDPfHpjP8jifkpAXxn7zkUvnkosfHKjn+2uEjsplDRjpbMpiDEtw
 TxhDO69ZnlM+lOKPexOTGCdrAbanxy8gSH1bAxp5flqafXtQj9R3KQw1pT/d3onjKZTW
 YK3cuQW+roAGzArWC5h4ivgKaHSDPSgms3D0yTXdVl0mriE/UqiAJl1q430+yMdTborc
 BRbFqWuiyTsR/0UhEXJCMrPrjAx9HPEG8zlnP+kXX7ShUUQWxQ1C/oSAovhXRZOaqfpv
 jmGkCjUk8iARj7H0Y9+zsS4eZ1lQbq8lX0KheD97sAH+bZTDn0k1qE16YUP14uBuBuc0
 HtPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=km/pk7jmSYnQExpfCc66NiMnMWyjFfJvFrVN2IAVDow=;
 b=urwq1R4YMeCgKyg6JAiyG552Uk2XGLdg2h8+e3fLKZISuzLOLZfocBfOHsBZJNDCAC
 6DwJVubNsRT84xGHuinX8/R4sDWkn8YnlqoRO0eE25IGVL9xit680ACYB5J3i7fRpFKA
 NyulEoH8yJx4vtOdRT9IGrUvg9YUX9qEYcizJtzR7k90Ypcx3cAaH/ng+KOua6Lbv7Ut
 QCHmGpRf9UW+pNHdh/VN3xVsdqdagO/H1DwfhGtAR58CGEB2cT+WsSZGk/9055zN3PlJ
 D5elktO7KartqcSOmfDzN4QLPDQEmFaY92kNSvGYTKrm7wryIW9F1JaXiqKw8I3ouwuy
 3jqg==
X-Gm-Message-State: AOAM531HQ9y+lntKtslci0I45r0h4MipK/XTleCkG3azFhiF+ClbloR7
 FbNgtrSaC2uFBjjTi40MhSMGo1tEr/rYRBujMvI=
X-Google-Smtp-Source: ABdhPJy0qi6HH4VwFS3itf9jZv5Pp6bMRay2JdeOaiAT7AAAC3FSdsuk7VsH3gwMl//EtqW7tBdcNXrN27twHO+GB8k=
X-Received: by 2002:a05:6902:120a:: with SMTP id
 s10mr199702ybu.453.1634914709835; 
 Fri, 22 Oct 2021 07:58:29 -0700 (PDT)
MIME-Version: 1.0
References: <20211022060133.3045020-1-alistair.francis@opensource.wdc.com>
 <20211022060133.3045020-3-alistair.francis@opensource.wdc.com>
In-Reply-To: <20211022060133.3045020-3-alistair.francis@opensource.wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 22 Oct 2021 22:58:18 +0800
Message-ID: <CAEUhbmWxHb-YAtzcCRUjicKVMnpSqeGrGi6ypRnpWvWt8a3+3g@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] hw/riscv: sifive_u: Use the PLIC config helper
 function
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair23@gmail.com>, Bin Meng <bin.meng@windriver.com>, 
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Fri, 22 Oct 2021 14:58:37 -0000

On Fri, Oct 22, 2021 at 2:02 PM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  hw/riscv/sifive_u.c | 14 +-------------
>  1 file changed, 1 insertion(+), 13 deletions(-)
>
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index fc5790b8ce..0010b404ee 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -813,7 +813,6 @@ static void sifive_u_soc_realize(DeviceState *dev, Error **errp)
>      MemoryRegion *mask_rom = g_new(MemoryRegion, 1);
>      MemoryRegion *l2lim_mem = g_new(MemoryRegion, 1);
>      char *plic_hart_config;
> -    size_t plic_hart_config_len;
>      int i, j;
>      NICInfo *nd = &nd_table[0];
>
> @@ -854,18 +853,7 @@ static void sifive_u_soc_realize(DeviceState *dev, Error **errp)
>                                  l2lim_mem);
>
>      /* create PLIC hart topology configuration string */
> -    plic_hart_config_len = (strlen(SIFIVE_U_PLIC_HART_CONFIG) + 1) *

SIFIVE_U_PLIC_HART_CONFIG should be removed from sifive_u.h

> -                           ms->smp.cpus;
> -    plic_hart_config = g_malloc0(plic_hart_config_len);
> -    for (i = 0; i < ms->smp.cpus; i++) {
> -        if (i != 0) {
> -            strncat(plic_hart_config, "," SIFIVE_U_PLIC_HART_CONFIG,
> -                    plic_hart_config_len);
> -        } else {
> -            strncat(plic_hart_config, "M", plic_hart_config_len);
> -        }
> -        plic_hart_config_len -= (strlen(SIFIVE_U_PLIC_HART_CONFIG) + 1);
> -    }
> +    plic_hart_config = riscv_plic_hart_config_string(ms->smp.cpus);
>
>      /* MMIO */
>      s->plic = sifive_plic_create(memmap[SIFIVE_U_DEV_PLIC].base,
> --

Otherwise,
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Tested-by: Bin Meng <bmeng.cn@gmail.com>

