Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lRd0r-0006a1-Hd
	for mharc-qemu-riscv@gnu.org; Wed, 31 Mar 2021 11:44:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lRd0n-0006Vo-SX; Wed, 31 Mar 2021 11:44:05 -0400
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31]:33530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lRd0j-0000nA-11; Wed, 31 Mar 2021 11:44:05 -0400
Received: by mail-io1-xd31.google.com with SMTP id n198so20642176iod.0;
 Wed, 31 Mar 2021 08:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QvpEuxy11yOp6SBnJ92FTB2cTWsKwU1lf9zMKApbwa8=;
 b=KGGuzsLyMfSXXKNTKBvH362wUQs/Vu5jP2Yoc3kDi57wwE1F2Dr7IsGlfH/e85ayDN
 CEG1SYCkXEJIgIC9QT+WFUEBBRcKgL4mJqG4t5+G67YaSfaT1cwfSW3/7nELfaz3l+m3
 zLyL5qIy4CX6Avk5EBQGiShmXq6SjaLLbGXEuYgCFp/eMvoUOo8FjraFeKTC+KlRv7nC
 H2rJ3/25uhMWXqKhmSVR5Ch+WYPjDrzsH+vZDnCY/yAEd9fV96c1TgZDPp9nxT3ulgkd
 OyvB/RsTLZLNM1wHCDxjuVfezFKUoOJuNTHD/Qb/AodQwQUJlV4DNw9btOMFQq/lKMo1
 JM2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QvpEuxy11yOp6SBnJ92FTB2cTWsKwU1lf9zMKApbwa8=;
 b=SWemE/RumExQz6wn9MUQnY4xOTrl7I5njq8kPJPDaNBLn82pcx7IRRosX4Ld3wx+2l
 javeUikmH7Kg5QjyD8ZAV04JLGVFd38VNKN3L4qsbjIv/N1DwtM4H2KCw56YbNuotygD
 le4wIudUE42Q/sE/rXcYZMSelXzZ00BNug1YJQkZSZMwOIcVkLIRNEfCcmeoIEsiw0xy
 bGG3hhP5WV4UXbwv8v9zmdf/UOEm4j3sENtn34YyUjJNWj+CZYc1cMs3qx4DP80LuvqW
 Bx97h3nNoygdmLsex2uywRbBi+NIVzBpwINRqE1j/IVlVn9SYmDxA/NzDiS2SFDcUiMF
 oJ0Q==
X-Gm-Message-State: AOAM531sMr+cxoC4UEZjHP0WiXPftCmRKiRg4bvYepcBLaWb/x44zi9K
 /w0QyxIMasVGqeKbql3sCylCbeicb0FKMif6v12gtkfkkjg=
X-Google-Smtp-Source: ABdhPJzmZIaxr6aF/mfsbWEY82thrrkbp/8CwW+oemlr/g+e959c+WCt3mFsiGFt7vpcWkqcoK5A13uscdS+gqdenF8=
X-Received: by 2002:a05:6638:3791:: with SMTP id
 w17mr3501183jal.91.1617205439600; 
 Wed, 31 Mar 2021 08:43:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210329170818.23139-1-bmeng.cn@gmail.com>
 <20210329170818.23139-2-bmeng.cn@gmail.com>
In-Reply-To: <20210329170818.23139-2-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 31 Mar 2021 11:41:50 -0400
Message-ID: <CAKmqyKO-PEXM1D=WCT8=zq+cp9A_k0-Lrp7_oCKwg22iMQz3Pg@mail.gmail.com>
Subject: Re: [PATCH 2/8] hw/riscv: virt: Switch to use
 qemu_fdt_setprop_string_array() helper
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d31;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd31.google.com
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
X-List-Received-Date: Wed, 31 Mar 2021 15:44:07 -0000

On Mon, Mar 29, 2021 at 1:17 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> Since commit 78da6a1bca22 ("device_tree: add qemu_fdt_setprop_string_array helper"),
> we can use the new helper to set the compatible strings for the
> SiFive test device node.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  hw/riscv/virt.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index c0dc69ff33..5d0c1e5903 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -395,8 +395,9 @@ static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
>          (long)memmap[VIRT_TEST].base);
>      qemu_fdt_add_subnode(fdt, name);
>      {
> -        const char compat[] = "sifive,test1\0sifive,test0\0syscon";
> -        qemu_fdt_setprop(fdt, name, "compatible", compat, sizeof(compat));
> +        const char *compat[3] = { "sifive,test1", "sifive,test0", "syscon" };
> +        qemu_fdt_setprop_string_array(fdt, name, "compatible", (char **)&compat,
> +                                      ARRAY_SIZE(compat));
>      }
>      qemu_fdt_setprop_cells(fdt, name, "reg",
>          0x0, memmap[VIRT_TEST].base,
> --
> 2.25.1
>
>

