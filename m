Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m3vKT-0005Ai-U1
	for mharc-qemu-riscv@gnu.org; Thu, 15 Jul 2021 02:58:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1m3vKO-000575-2G; Thu, 15 Jul 2021 02:58:37 -0400
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:45741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1m3vKL-0004OW-Ey; Thu, 15 Jul 2021 02:58:35 -0400
Received: by mail-io1-xd36.google.com with SMTP id y16so5221780iol.12;
 Wed, 14 Jul 2021 23:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iozm6Ae4WhtdytYPYEKOzDS5HC59b10acjNWZctkhSQ=;
 b=s3s/MlGvqx0oox7Xhh/XDH8dW6r0FFr+kEmMyVlNbRKgkzq0V3omTCaemaGLEk6l72
 rgQWHGPrHpsKVYmBRlc3NJ3+TOoJyhkV2hnztHek4o7nyDdlgXnDe/YBCQpaNLIGjmgA
 aJGcGboFldFeJp/sWgdXKtKdFa9xWHBEbjpBw4GNGMeiFnmaM5M71yIsUM8FWPgY4aBA
 3sOVXViLjvXJEUUQ7wL/gp4bbOmxspw2du7f7lONWPz9dfogFcdSxjuY8HLb8u46lDCy
 Y2io333DklY1Go8ss+CUQWEQ19WwJV17zkGK588+NrhKxinU+YJacmxvFVIe295vTCpU
 E4jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iozm6Ae4WhtdytYPYEKOzDS5HC59b10acjNWZctkhSQ=;
 b=diDNzRILu5rKM5yi4rAYcDFDmez5hgsPOjsu0t/5fAwWbyuzl5Ju8wz5z0/ovabkak
 uio2eq5Dzk/f/Xsoa0jc5PlXRuRrQM0E6pLp0YGWUvW+shvhea6cM8sYP2CP9/jTvWQo
 XzGKPIh/84r9e809brxXIbHulFShwINcvIKX9AVmxBR3ejtpV24ayTCsGdcZKCTKCS2H
 u6kwLKUYtxEQC1GsRxfAAY21WX7Oks7T6X6CoDM/YlUQ197vD85bb4i7JEIRKfZ3m8NE
 75V12Dtqoq8ZGieUWVNwIB7QP7cX2SOJp1x7QZ0Chm6eTDLAcKi+oSsT8KPFhm57adid
 q7pw==
X-Gm-Message-State: AOAM531AqvWiARxz41XXipiOaduF42fLin/uqfGUFse/0o8tTNMAZxYs
 ogrJnv9sCtDWcq9Ilpf9/Te0DrZqPJM1P3PFHNU=
X-Google-Smtp-Source: ABdhPJyLIIKL4iwMw7oxfndu4Y+NfnhOUoQcQvjG2os4K3H8C5Od675zdmMYGs1qnQPXji1loSXo34vvV71NRo5ptzw=
X-Received: by 2002:a6b:7905:: with SMTP id i5mr2051290iop.175.1626332312117; 
 Wed, 14 Jul 2021 23:58:32 -0700 (PDT)
MIME-Version: 1.0
References: <07325315b49d5555269f76094e4bc5296e0643b9.1626303527.git.alistair.francis@wdc.com>
In-Reply-To: <07325315b49d5555269f76094e4bc5296e0643b9.1626303527.git.alistair.francis@wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 15 Jul 2021 16:58:06 +1000
Message-ID: <CAKmqyKP2qy9q2-KJvepiRCdr_6_=eGqKEqKCOC_ciQYTT+ntpQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] hw/riscv/boot: Check the error of fdt_pack()
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bmeng.cn@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d36;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd36.google.com
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
X-List-Received-Date: Thu, 15 Jul 2021 06:58:37 -0000

On Thu, Jul 15, 2021 at 9:01 AM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> Coverity reports that we don't check the error result of fdt_pack(), so
> let's save the result and assert that it is 0.
>
> Fixes: Coverity CID 1458136
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  hw/riscv/boot.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> index 0d38bb7426..993bf89064 100644
> --- a/hw/riscv/boot.c
> +++ b/hw/riscv/boot.c
> @@ -182,7 +182,7 @@ uint32_t riscv_load_fdt(hwaddr dram_base, uint64_t mem_size, void *fdt)
>  {
>      uint32_t temp, fdt_addr;
>      hwaddr dram_end = dram_base + mem_size;
> -    int fdtsize = fdt_totalsize(fdt);
> +    int ret, fdtsize = fdt_totalsize(fdt);
>
>      if (fdtsize <= 0) {
>          error_report("invalid device-tree");
> @@ -198,7 +198,9 @@ uint32_t riscv_load_fdt(hwaddr dram_base, uint64_t mem_size, void *fdt)
>      temp = MIN(dram_end, 3072 * MiB);
>      fdt_addr = QEMU_ALIGN_DOWN(temp - fdtsize, 16 * MiB);
>
> -    fdt_pack(fdt);
> +    ret = fdt_pack(fdt);
> +    /* Should only fail if we've built a corrupted tree */
> +    g_assert(ret == 0);
>      /* copy in the device tree */
>      qemu_fdt_dumpdtb(fdt, fdtsize);
>
> --
> 2.31.1
>

