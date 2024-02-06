Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6182C48297
	for <qemu-riscv@archiver.kernel.org>; Tue,  6 Feb 2024 20:39:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rXSEF-0002US-Ut; Tue, 06 Feb 2024 15:39:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rXSEE-0002UE-AP
 for qemu-riscv@nongnu.org; Tue, 06 Feb 2024 15:39:38 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rXSEC-00006U-Jm
 for qemu-riscv@nongnu.org; Tue, 06 Feb 2024 15:39:38 -0500
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-5cdbc4334edso4782753a12.3
 for <qemu-riscv@nongnu.org>; Tue, 06 Feb 2024 12:39:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1707251974; x=1707856774; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3ArV/Gr5QDyfv+upyNqCWqRxvsU7ykcJKNSQH7JGZY8=;
 b=oNQXiF8EznifiTthpYZ77K9zBiH2tWi2UD86g+lcqV2ObOpkLa6Jrh0yG4LXaXAHHK
 871KhAQCNaduRDHaYLKc41oAKjOTNzSu6CCwJOx/tQAI+hqH7P+a5iM/oqcWjCKUlznI
 JYtCM9KmI77ZoZElrbPdDaUwl5sksVn8nu+ZTqHW8P17qXT+zfpWQrCdocu3cbLTzQJt
 EIeenTR/rA98jBpTZ/gk8DGX8UlrkMy/wAhMGIJNkeqNQ+egghYAK0c0lg8yEGO439Ol
 chKdeVoHGPV/pMhn5x7I45zQvJNPj6OA2fPqaWZbbNKQfZ08NbYkmzv4kCTIz2omxkB+
 /jpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707251974; x=1707856774;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3ArV/Gr5QDyfv+upyNqCWqRxvsU7ykcJKNSQH7JGZY8=;
 b=ptEDJ3tdNJXqqWZ1E/piLrl0Xo4vKTtQm9o/ZDhqm35eli0KoHXs7ml77d+bDXYPu1
 1yF+peB1QfG5rOq7GPiV+VlM3fVGa6HoRIE2yAJINLtJgS0AFAz005X07Lcln36NazBH
 0YTNJgdjrAj65J8Izbyimx5u/3VJAHx/LDrW7aYiA/OHNdiDDvalA9rI2d4CdexVE/1Y
 Og72cKaBojp6amlrnsTIVVkbCxeNbXbid2gMZV+zjdnPP8KYvxUnKwmTf7fq7TdQtsUO
 NIKNU09O7tJjeawQqHYaLPL3Lb2CyYAWV2UptYQCkSs0QwkBHip8ZKgza0rMZLXiiejg
 hS1Q==
X-Gm-Message-State: AOJu0YxklNchGBprCMD1vGihi3WEeSfErRaTyT4eH8RaSTk24RYb2USW
 /fDCGP59D6GY5Gog4qqr2UEoOmLfAmS8HTodz2C2wRG2GK8Xz+2nZSU8J26nokU=
X-Google-Smtp-Source: AGHT+IGeNjdrZrSwQRsy3xK8PXv4h04LW2rrPrrsLhbz3vjcgwFoRPhSSlVIY0IglEGZYsS+OTXKlg==
X-Received: by 2002:a05:6a20:e607:b0:19c:7560:e7d6 with SMTP id
 my7-20020a056a20e60700b0019c7560e7d6mr2650971pzb.1.1707251974441; 
 Tue, 06 Feb 2024 12:39:34 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCUEi9yk5EZVpQt9s+z9RuaO943/oXoZ/b58Qcgr7g54ayKjpwIt8YKitAGWmJirElGn1GY+MP9VVGOUDSANJn3L90CoqOuK4EGyg7mzG4DOE1BItAEPOo7U8h8v04BQvC560b3wciVyXzetSRUXer07V7j6PgR0OCxmv2o/A16Z/73jZgG/FNhL78y0pWelcgpCr/UicdwJ30fKxFldMBxSeaQ4SHE8XKybbWcNtfa1YsAiEBOvftWa/VkjRh2K9Co0AXM+hOTgitw5UfLgH4kgzc00WhE=
Received: from [192.168.68.110] ([177.94.15.159])
 by smtp.gmail.com with ESMTPSA id
 27-20020a63115b000000b005cd821a01d4sm2625230pgr.28.2024.02.06.12.39.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Feb 2024 12:39:33 -0800 (PST)
Message-ID: <c8817977-a8ad-4f94-9847-a43d08c5b4df@ventanamicro.com>
Date: Tue, 6 Feb 2024 17:39:27 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hw: riscv: Allow large kernels to boot by moving the
 initrd further away in RAM
Content-Language: en-US
To: Alexandre Ghiti <alexghiti@rivosinc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
References: <20240206154042.514698-1-alexghiti@rivosinc.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20240206154042.514698-1-alexghiti@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pg1-x531.google.com
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



On 2/6/24 12:40, Alexandre Ghiti wrote:
> Currently, the initrd is placed at 128MB, which overlaps with the kernel
> when it is large (for example syzbot kernels are). From the kernel side,
> there is no reason we could not push the initrd further away in memory
> to accommodate large kernels, so move the initrd at 512MB when possible.
> 
> The ideal solution would have been to place the initrd based on the
> kernel size but we actually can't since the bss size is not known when
> the image is loaded by load_image_targphys_as() and the initrd would
> then overlap with this section.
> 
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

> 
> Changes in v2:
> - Fix typos in commit log (Daniel) and title
> - Added to the commit log why using the kernel size does not work
>    (Daniel)
> 
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

