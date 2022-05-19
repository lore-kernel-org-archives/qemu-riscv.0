Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nrhhS-0008DV-Gz
	for mharc-qemu-riscv@gnu.org; Thu, 19 May 2022 11:04:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nrhhQ-0008Ar-RU
 for qemu-riscv@nongnu.org; Thu, 19 May 2022 11:04:24 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:35433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nrhhN-0003DT-N0
 for qemu-riscv@nongnu.org; Thu, 19 May 2022 11:04:24 -0400
Received: by mail-wr1-x432.google.com with SMTP id r23so7610568wrr.2
 for <qemu-riscv@nongnu.org>; Thu, 19 May 2022 08:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KlvwgvqbiOPgFVlSZr1McGF6iFf+1iPX/E1nY7fN3JA=;
 b=fx4J9tOM12kLZH2iZmmLIYFHo7mqTtJnByVyrpSjUviAuV2nH2AGGl52gNZABmljAn
 /bs/LgeuVUkiQFtbiLLvqcDgbx8NTVYfR4D5WeYx6UEXuSP4hOnzOG+cbU8o7Ju+cDDk
 T+uiJ0bvuVC+siqOyoJSszCuZg+RXvHqh5+SCErrypmFEpYEz32oTMgh6kvX5d8UGMWM
 +QCXLV7rTg7GBe4lpmOyQZs32BiKIyzW0kIoanyrIWX5gWZmOJ+Uh1wv4c27M5QaUC93
 nn9nfRq4h+EmIFUAnhvEh/Q+tcAbO8kD5g3n2tnWaHJCmiYH8PTMkYqjBMBMzS/seYAA
 URAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KlvwgvqbiOPgFVlSZr1McGF6iFf+1iPX/E1nY7fN3JA=;
 b=Qk03dA1mf3a512n6OvhTGMrNUmCDGkwOHLz/OZNH5j1txQzxi4bnTnO2pvyph0hUOb
 ZXI6HK8gtW8bm7XjZjNthocpLOmy74hwkLe0RRnDBeMaI9TUtkfj+WhhWJGmeMw7KaNK
 QHvppqLVaiyASSgB6iUU2Hzikr11+jFq53JvSWmt/bLlcsHwXwEQJ6DoA8Vqbwme5xQR
 Q6HNf6XoaIE7xkWeIagSYv5rnHwIPJotCBHgNNbZIMhOQiBxMtqNpJvfmmbUx4YuLIyO
 5vZeKwY4poRKQZF/1RGCduGeqcQX/nL+cDCKiS/ZNb6NFHj1kUGHNoMipYrgirZr39NE
 +ivQ==
X-Gm-Message-State: AOAM532fZMDRuEnGcQZIUe3Eeh6VLRSi+2p57aL1eJCULhwl8TZCAQ0V
 jzEzQU/lGlYLLQ3Q4f3fmkJhuCbIcor5VPKjGrLKFg==
X-Google-Smtp-Source: ABdhPJySIdo/9tb0MmhXZrlc10WbV6TJzfQdxmEWHvNxGxIccKNXZSQH1bAgzgrJFks81oP6IPjZECL0dtrs0JaKuNw=
X-Received: by 2002:a5d:6d0d:0:b0:20c:530c:1681 with SMTP id
 e13-20020a5d6d0d000000b0020c530c1681mr4578651wrq.214.1652972657906; Thu, 19
 May 2022 08:04:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220512182103.408627-1-dgreid@rivosinc.com>
In-Reply-To: <20220512182103.408627-1-dgreid@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 19 May 2022 20:34:06 +0530
Message-ID: <CAAhSdy2Uoj0jGXJn1W_Vhewi9BLSN+9zd003qUf_ugKpDd2ihg@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv: virt: Avoid double FDT platform node
To: Dylan Reid <dylan@rivosinc.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Dylan Reid <dgreid@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::432;
 envelope-from=anup@brainfault.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001,
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
X-List-Received-Date: Thu, 19 May 2022 15:04:25 -0000

On Fri, May 13, 2022 at 1:34 AM Dylan Reid <dylan@rivosinc.com> wrote:
>
> When starting the virt machine with `-machine virt,aia=aplic-imsic`,
> both the imsic and aplic init code will add platform fdt nodes by
> calling `platform_bus_add_all_fdt_nodes`. This leads to an error at
> startup:
> ```
> qemu_fdt_add_subnode: Failed to create subnode /platform@4000000: FDT_ERR_EXISTS
> ```
>
> The call from `create_fdt_imsic` is not needed as an imsic is currently
> always combined with an aplic that will create the nodes.
>
> Fixes: 3029fab64309 ("hw/riscv: virt: Add support for generating platform FDT entries")
> Signed-off-by: Dylan Reid <dgreid@rivosinc.com>
> ---
>  hw/riscv/virt.c | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 3326f4db96..d625f776a6 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -561,11 +561,6 @@ static void create_fdt_imsic(RISCVVirtState *s, const MemMapEntry *memmap,
>      }
>      qemu_fdt_setprop_cell(mc->fdt, imsic_name, "phandle", *msi_m_phandle);
>
> -    platform_bus_add_all_fdt_nodes(mc->fdt, imsic_name,
> -                                   memmap[VIRT_PLATFORM_BUS].base,
> -                                   memmap[VIRT_PLATFORM_BUS].size,
> -                                   VIRT_PLATFORM_BUS_IRQ);
> -

This patch only fixes for the case where there is only one socket.

I had send-out a similar fix which also handles multi-socket case.
https://lore.kernel.org/all/20220511144528.393530-9-apatel@ventanamicro.com/

Regards,
Anup


>      g_free(imsic_name);
>
>      /* S-level IMSIC node */
> --
> 2.30.2
>
>

