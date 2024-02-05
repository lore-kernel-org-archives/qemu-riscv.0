Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFFB0C48295
	for <qemu-riscv@archiver.kernel.org>; Mon,  5 Feb 2024 12:17:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rWxuY-0004Fk-Nj; Mon, 05 Feb 2024 07:17:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rWxuX-0004FS-9S
 for qemu-riscv@nongnu.org; Mon, 05 Feb 2024 07:17:17 -0500
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rWxuV-0002KL-Jj
 for qemu-riscv@nongnu.org; Mon, 05 Feb 2024 07:17:17 -0500
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-5cddc5455aeso3684909a12.1
 for <qemu-riscv@nongnu.org>; Mon, 05 Feb 2024 04:17:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1707135434; x=1707740234; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=VwssBm2shd9cdtHdK/g3snDbXeummB+FvaBW8tNM+Ko=;
 b=TrJOAYilo8eg0pYtlw8q1nRS+GzfOwXQnd/b2N8wF/Oe6LLFBw7aQy6Q0QddKIHu9d
 OAuj1C4p0YMNhM3Rv++VZVHZpt/GMFqHf8C/PC+qUDy3WcWEbABBOYYDKbQwHpTsEoVs
 SWuWYMM6n+y7VerhQMEg5IL0q/NJKtHhBfTCr5NZEqLPvdUqdsKbTRCBLdNtBxm6OUC5
 dH0QRDclwx0YqlL0mSPP1BU7o9eP2lSl8O2YhmiAZZt/MoK5qGQeO5WPJAFaVimsXyCt
 BtIyR8IPm2i8VTVfPmaksE7PCEu/l4hAeDISvG1cvNLr5tTqCl2nVKPoSzMo0SZ9d7RM
 jUbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707135434; x=1707740234;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VwssBm2shd9cdtHdK/g3snDbXeummB+FvaBW8tNM+Ko=;
 b=IzIihqzxLG6RdSUN/Vasy4mcJTf7z2aLWdDj+V3/jI3q1aPz6veY0Nc4xRrrs0pTiF
 z7rSnwbPYaqqorHVkwS6PD1NCV/oHLFcgns0kqR9uNJl+yYj05fe/TQZJwr0O3Qq5uZx
 s55OgXPdIQhoL6c9TbzdYRlpVBcE16acrDQVIRWo1S31tHHFSdzURk+BkXE5yJdT3NDm
 773Z/smYdPT7x54SzzeTrs/Oz0l7HQ6WsAN8JGJYuj7q2JJXLaoVfwCDp4FWIzSHwD9Y
 BixbY8yokOy1EV5EMClmH53ByS91hwA76ptC/Sg/XS7S3TCWphfiGWI5Ytn8EicaNNVt
 Sqhg==
X-Gm-Message-State: AOJu0YwRnnwGMBUhnDb4uNGBrXyZtgom2GnsCH1Nrw4B0+Ia2jjaedYf
 MEPXOHT94ZBiRUu1VUxWhlhKH/4a00okNYCwRIeI112kMIUtTBajQc/xOCmwMsM=
X-Google-Smtp-Source: AGHT+IHaZ+Kt6V1c6fsfRR1Hz5IL3jac8YgpOr51+nyg9gTjNkzpl80Iuhu3Cv0iczZIRBsgXCfLIw==
X-Received: by 2002:a05:6a20:d39a:b0:19e:2688:f483 with SMTP id
 iq26-20020a056a20d39a00b0019e2688f483mr9382623pzb.43.1707135433645; 
 Mon, 05 Feb 2024 04:17:13 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCXV3PsOgk8rdwKB6KkbgwVbIY6dZr/ewrNohW3t1FMbB5n1rF5kongMBPHzCXKULN228QRvaI68+xnXcvQ8EtRJYt99oR26jAmDs9jURSGV/bb8F1nPs9+xilwSZ3ESj73rxWpnMav4Kfj8SpXp1Fm9BBGSnpbgtx8XNBSSySmZrge1D/ZPBp9MlogkY5pHdYb7hV+TVTvikZcvH7uXDBOeqlxoY2wYxklSvEBIVygPgi6Aez6oE+oetEVLdwCPtpskoShinlACniGk8F1+Wq6HxUsLY8Q=
Received: from [192.168.68.110] ([177.94.15.159])
 by smtp.gmail.com with ESMTPSA id
 s16-20020a056a00179000b006dd8a07696csm6499154pfg.106.2024.02.05.04.17.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 04:17:13 -0800 (PST)
Message-ID: <624964b1-d0e7-42b2-b4c2-690107882d01@ventanamicro.com>
Date: Mon, 5 Feb 2024 09:17:09 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw: riscv: Allow large kernels to boot by moving the
 initrd further way in RAM
To: Alexandre Ghiti <alexghiti@rivosinc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
References: <20240205070040.367541-1-alexghiti@rivosinc.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20240205070040.367541-1-alexghiti@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pg1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



On 2/5/24 04:00, Alexandre Ghiti wrote:
> Currently, the initrd is placed at 128MB, which overlaps with the kernel
> when it is large (for example syzbot kernels are). From the kernel side,
> there is no reason we could not push the initrd further away in memory
> to accomodate large kernels, so move the initrd at 512MB when possible.

typo: accommodate

> 
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---

Patch looks good - just tested with an Ubuntu guest and nothing bad happened.

But I wonder ... what if there's an even bigger kernel we have to deal with?
Move initrd even further away to fit it in?

Instead of making assumptions about where initrd starts, we could grab the kernel
size loaded in the board and use it as a reference. This would be done by storing
the return of load_elf_ram_sym/load_uimage_as/load_image_targphys_as from
riscv_load_kernel() an passing as argument to riscv_load_initrd().

initrd start would then be:

     start = kernel_entry + MIN(mem_size / 2, kernel_size);

However, I believe we would like to keep the existing 128Mb minimum initrd start,
even if the kernel is smaller than 128Mb, to avoid breaking existing configs that
might be making this assumption. initrd start would then become:


     start = kernel_entry + MIN(mem_size / 2, MAX(kernel_size, 128 * MiB));



Thanks,



Daniel


>   hw/riscv/boot.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> index 0ffca05189..9a367af2fa 100644
> --- a/hw/riscv/boot.c
> +++ b/hw/riscv/boot.c
> @@ -188,13 +188,13 @@ static void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry)
>        * kernel is uncompressed it will not clobber the initrd. However
>        * on boards without much RAM we must ensure that we still leave
>        * enough room for a decent sized initrd, and on boards with large
> -     * amounts of RAM we must avoid the initrd being so far up in RAM
> -     * that it is outside lowmem and inaccessible to the kernel.
> -     * So for boards with less  than 256MB of RAM we put the initrd
> -     * halfway into RAM, and for boards with 256MB of RAM or more we put
> -     * the initrd at 128MB.
> +     * amounts of RAM, we put the initrd at 512MB to allow large kernels
> +     * to boot.
> +     * So for boards with less than 1GB of RAM we put the initrd
> +     * halfway into RAM, and for boards with 1GB of RAM or more we put
> +     * the initrd at 512MB.
>        */
> -    start = kernel_entry + MIN(mem_size / 2, 128 * MiB);
> +    start = kernel_entry + MIN(mem_size / 2, 512 * MiB);
>   
>       size = load_ramdisk(filename, start, mem_size - start);
>       if (size == -1) {

