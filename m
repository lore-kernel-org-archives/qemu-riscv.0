Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lHWpZ-0005WY-4l
	for mharc-qemu-riscv@gnu.org; Wed, 03 Mar 2021 14:06:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lHWpW-0005Uc-6X; Wed, 03 Mar 2021 14:06:42 -0500
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129]:45849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lHWpU-00057M-Em; Wed, 03 Mar 2021 14:06:41 -0500
Received: by mail-il1-x129.google.com with SMTP id v8so18774650ilh.12;
 Wed, 03 Mar 2021 11:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=huawIfv5HVBTz4uGeG8LvUGBBH/OA9LdQbt0ooD0fEI=;
 b=FAEqIsgOOx6zsZX4qpBzDTliWwcvACBgDAyW+6mnFCcCcbPZlbQnvgjotHloxp2iA4
 G1rz++F9xEgogbU6ANyg2YgbFp9NgeSvQSHLbCMRQdiyHlonOBKDjKb4V0dEx/z3Td8X
 Zs+HyRhNVlYyI2fgNRiGZkTY/2mUMbEhxoyfUkCmxZeQocI4MBe/lLOIOkIgV0X1vQO7
 SNdBKgurq9g7fT+x9MlF6fjXu5JmW+EoXajI6UfSKqRdoSZKTbiMjMSXMYJj9UZ3VdzG
 1Do0GJZvx+E9hotzyos9eiqa2YPGFNnhwQ/2Jdah7t0rnHnoi6/GWjpg5jPHCnx4K55R
 A5ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=huawIfv5HVBTz4uGeG8LvUGBBH/OA9LdQbt0ooD0fEI=;
 b=nbitxBuOc1h9qnkHlRU3Nkcm4CNYiZa34O7c/DjvxTocAnxYYJYnXMPrYr9PbcQEcm
 ori2GnLv62UK9sAsf8IqqRz3IaOs0FaslbwcWL6s4DyW/jccfoe5viPkko3YuF+Aq2JK
 t5vTs+yJ2FPmMPhK7FiAJhdzUcMXgO3vWOph9EWDXxsP87/1rJKoINTNjV6CbXISR0K8
 We7EKtp9TZbcn2ggCRnIBRgeBjotiqh/94K1NVhxiQBRI25EifYRJGNGwTBFxxm2jQau
 q+kN+elMptnPwmfWPu3tbW8VtdwPSGT32E2n0SSHwzCI5FTU6hhiBvchsNB/HuFFdvRF
 k/Fg==
X-Gm-Message-State: AOAM530X18PFvIZblBzezDtHY6G1JEnw/4K11QRM30fqfqHhXe9zTmNY
 sC04S0Q69E4UVcQ7gZcZZuexDzkMyUlzmyHyoTI=
X-Google-Smtp-Source: ABdhPJxgk7RAcFykTEoUe+Oodl/qGpubdPAKLFs7ctG4HbQXLEYzx1ZolupZo6keZp1b2Xy00lf4Dv24SEEwlm90zV0=
X-Received: by 2002:a92:c102:: with SMTP id p2mr672329ile.227.1614798398470;
 Wed, 03 Mar 2021 11:06:38 -0800 (PST)
MIME-Version: 1.0
References: <20210220144807.819-1-bmeng.cn@gmail.com>
 <20210220144807.819-4-bmeng.cn@gmail.com>
In-Reply-To: <20210220144807.819-4-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 3 Mar 2021 14:05:22 -0500
Message-ID: <CAKmqyKOPR0Nb+vkmMzLW0C-seJ_z0sgp4f1tbKNs=e8J-HnWFQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] hw/riscv: virt: Limit RAM size in a 32-bit system
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::129;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x129.google.com
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
X-List-Received-Date: Wed, 03 Mar 2021 19:06:42 -0000

On Sat, Feb 20, 2021 at 9:52 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> RV32 supports 34-bit physical address hence the maximum RAM size
> should be limited. Limit the RAM size to 10 GiB, which leaves
> some room for PCIe high mmio space.
>
> For 32-bit host, this is not needed as machine->ram_size cannot
> represent a RAM size that big. Use a #if size test to only do
> the size limitation for the 64-bit host.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

>
> ---
>
> Changes in v3:
> - Fix the typo (limit) in the commit message and codes
>
> Changes in v2:
> - Use a #if size test to only do the size limitation for the 64-bit host
>
>  hw/riscv/virt.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 1d05bb3ef9..c4b8f455f8 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -590,6 +590,16 @@ static void virt_machine_init(MachineState *machine)
>          }
>      }
>
> +    if (riscv_is_32bit(&s->soc[0])) {
> +#if HOST_LONG_BITS == 64
> +        /* limit RAM size in a 32-bit system */
> +        if (machine->ram_size > 10 * GiB) {
> +            machine->ram_size = 10 * GiB;
> +            error_report("Limiting RAM size to 10 GiB");
> +        }
> +#endif
> +    }
> +
>      /* register system main memory (actual RAM) */
>      memory_region_init_ram(main_mem, NULL, "riscv_virt_board.ram",
>                             machine->ram_size, &error_fatal);
> --
> 2.25.1
>
>

