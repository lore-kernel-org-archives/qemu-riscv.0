Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 731A5C5DF81
	for <qemu-riscv@archiver.kernel.org>; Mon, 24 Aug 2026 22:12:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wyctg-0003Oe-3r; Mon, 24 Aug 2026 18:12:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <portias@tenstorrent.com>)
 id 1wycte-0003OH-NQ
 for qemu-riscv@nongnu.org; Mon, 24 Aug 2026 18:12:02 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <portias@tenstorrent.com>)
 id 1wyctc-00088T-HM
 for qemu-riscv@nongnu.org; Mon, 24 Aug 2026 18:12:02 -0400
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-84862aaa8bfso125239b3a.2
 for <qemu-riscv@nongnu.org>; Mon, 24 Aug 2026 15:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tenstorrent.com; s=google; t=1787609508; x=1788214308; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=YfPAJrzh23k5bf6NYHNz6je6+xhKQtygq0qvA9+KJck=;
 b=DVq6FEF81+1sYAh0vlmoYOCxcNVwXkgdlGrexjLGcz/8xFwCLCE1qZtNsHspQtUye4
 l4PvKx2JKi6xODAv6b9bpjUZf1LAKdtoXrNkJ5deUcEhNXrMwfT3AfDuO0aVKlEJDe7F
 6P1KkZCaH0Rzd1MoLuEeYKJHUBcmRdPlz026eCsNNQUO8bLhv9rLX5if1TXoCBQ0Mogd
 3zpuDMtiQlOELwJgsErsSMN+xf0zFIQ6ftsXgeBiS7nlG9PirKfPEoTrjYj0K4VXiuTk
 imzERjpArrbxLdeFOFEaTHVPGHLXJdBZx471ccD0Z4+1Y647RYo/J4WqdAxlXmfzSwxv
 MIUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787609508; x=1788214308;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=YfPAJrzh23k5bf6NYHNz6je6+xhKQtygq0qvA9+KJck=;
 b=P/TeDEQSZE2cc5Uu1MFJ7otk5mGO14vyaYOhhnnzCZ3L3oSpZTxTQ34CpuzbhF/pGJ
 p8Uk5hschIYUbe4oVS5vkf19BYv6ntXbRsxE3UdOkU4YHCV+yh8mKVt4Ih9zsFb1NkDf
 t5Jl53ziF4iq2fauNkzsGJcUZR9cNEJRPa0FA7DapbitmZj9/7DaN66zR2OVUm+w5sCK
 X0SBYAchKqtWgU+U4sdhIhom4ybIYMVI8MaJkSYGqaJVG3B5yi2iJ/C8H2qxXPrnNrp0
 KEAa5k7xKDPdsjF5/nzOZR0PRf7RItH1kCE2aQehJxqsR/Jhu/QSI+v9gqZQonlTD68/
 yTpw==
X-Forwarded-Encrypted: i=1;
 AHgh+RpZ52FzTGc5mM+TGyIPNO435gBzskAX+syc6pJr9m6ssm5XzVSWw85MZz85YyUPyeQhmsGXWk/+Z1Ur@nongnu.org
X-Gm-Message-State: AFuF++mE0DquFz0HxYfcEoeSfF92dQ8MHJGm1Nm1TGppdfKUZ45cjAEK
 OMe/55obLgAfg7+rUEtN1sQLHN6heBdtOwRz8BCJm7n+ONm8+Aiz/BkWTmpdErXlfNA=
X-Gm-Gg: AR+sD13rXh1DxBrJzQRwKo18wo9/kBn55cpVEcc75BOOAt01XscVb+z237b5y+vOtGW
 021l3x3FQDz1SK7JfWA0RizgxylWTr/N/cjZHjwK9cZiUPuFLUqMrRJfljGxOcR5nQeSTwUKCs6
 xL/5Q3uqWCG0eJPkJBVJYPf63n4lRmq6HQOA2Bj1d9Kpp1SIx4Rrnlg+KLR6/ALiTcRX4XopqIH
 TkZwXlM96bGkWm1JWZF2xRJRUXej2r38zd0slC/62mc0TNVobqcCIo6ADgwNni0j3jJASFP/6VY
 iMB8qP9Px7+JqIW8Q6yN6hBVV2ZAz5SQmkqUYWpTOWpGOMgzfO7Y+wjD0T9CH6snA+gs9iaHH3v
 CxT0Kv/w/1T+pjIrO9DC3j89yMd+Wyoh8/+cFuhw4+oZcI0pwzu358rGXIzrOC5DgnFbf7UX6Tp
 u85mqgXnAlNb2EautfOGBvSGhIH/AGYXNk7d7JWM9Sot09q6ybMQOgS0O3kEf8i4PhV/vYo2epl
 ceIyUoMOLtncOmv
X-Received: by 2002:a05:6a00:7183:b0:848:4d4f:d481 with SMTP id
 d2e1a72fcca58-851f9fa9f18mr16205259b3a.2.1787609508252; 
 Mon, 24 Aug 2026 15:11:48 -0700 (PDT)
Received: from [172.16.1.33] ([159.196.41.205])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8520eed2293sm2262821b3a.2.2026.08.24.15.11.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Aug 2026 15:11:47 -0700 (PDT)
Message-ID: <6dd03d71-b0e5-4039-bce9-37c1cff4b108@oss.tenstorrent.com>
Date: Tue, 25 Aug 2026 08:11:40 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] hw/riscv/boot: Make RISCVBootInfo const where possible
To: Joel Stanley <joel@jms.id.au>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei
 <zhiwei_liu@linux.alibaba.com>, Chao Liu <chao.liu@processmission.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Michael Ellerman <mpe@kernel.org>, Niek Linnenbank
 <nieklinnenbank@gmail.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
References: <20260824055642.41098-1-joel@jms.id.au>
 <20260824055642.41098-2-joel@jms.id.au>
Content-Language: en-US
From: Portia Stephens <portias@oss.tenstorrent.com>
In-Reply-To: <20260824055642.41098-2-joel@jms.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=portias@tenstorrent.com; helo=mail-pf1-x436.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


On 24/8/2026 3:56 PM, Joel Stanley wrote:
> As with riscv_load_firmware, take a const pointer in functions that
> reads the structure without writing.
>
> Suggested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>   include/hw/riscv/boot.h | 6 +++---
>   hw/riscv/boot.c         | 6 +++---
>   2 files changed, 6 insertions(+), 6 deletions(-)


Reviewed-by: Portia Stephens <portias@oss.tenstorrent.com>


>
> diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
> index 4e7bd9a225ef..d23f45d78077 100644
> --- a/include/hw/riscv/boot.h
> +++ b/include/hw/riscv/boot.h
> @@ -50,10 +50,10 @@ void riscv_boot_info_init(RISCVBootInfo *info, RISCVHartArrayState *harts);
>   void riscv_boot_info_init_discontig_mem(RISCVBootInfo *info,
>                                           RISCVHartArrayState *harts,
>                                           hwaddr low_start, hwaddr low_size);
> -vaddr riscv_calc_kernel_start_addr(RISCVBootInfo *info,
> +vaddr riscv_calc_kernel_start_addr(const RISCVBootInfo *info,
>                                      hwaddr firmware_end_addr);
>   hwaddr riscv_find_and_load_firmware(MachineState *machine,
> -                                    RISCVBootInfo *info,
> +                                    const RISCVBootInfo *info,
>                                       const char *default_machine_firmware,
>                                       hwaddr *firmware_load_addr,
>                                       symbol_fn_t sym_cb);
> @@ -71,7 +71,7 @@ void riscv_load_kernel(MachineState *machine,
>                          bool load_initrd,
>                          symbol_fn_t sym_cb);
>   uint64_t riscv_compute_fdt_addr(hwaddr dram_base, hwaddr dram_size,
> -                                MachineState *ms, RISCVBootInfo *info);
> +                                MachineState *ms, const RISCVBootInfo *info);
>   void riscv_load_fdt(hwaddr fdt_addr, void *fdt);
>   void riscv_setup_rom_reset_vec(MachineState *machine, RISCVHartArrayState *harts,
>                                  hwaddr saddr,
> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> index 5e2dfa091a13..4ac0b8ef6581 100644
> --- a/hw/riscv/boot.c
> +++ b/hw/riscv/boot.c
> @@ -91,7 +91,7 @@ void riscv_boot_info_init_discontig_mem(RISCVBootInfo *info,
>       info->ram_low_size = low_size;
>   }
>   
> -vaddr riscv_calc_kernel_start_addr(RISCVBootInfo *info,
> +vaddr riscv_calc_kernel_start_addr(const RISCVBootInfo *info,
>                                      hwaddr firmware_end_addr) {
>       if (info->is_32bit) {
>           return QEMU_ALIGN_UP(firmware_end_addr, 4 * MiB);
> @@ -151,7 +151,7 @@ char *riscv_find_firmware(const char *firmware_filename,
>   }
>   
>   hwaddr riscv_find_and_load_firmware(MachineState *machine,
> -                                    RISCVBootInfo *info,
> +                                    const RISCVBootInfo *info,
>                                       const char *default_machine_firmware,
>                                       hwaddr *firmware_load_addr,
>                                       symbol_fn_t sym_cb)
> @@ -348,7 +348,7 @@ out:
>    * The FDT is fdt_packed() during the calculation.
>    */
>   uint64_t riscv_compute_fdt_addr(hwaddr dram_base, hwaddr dram_size,
> -                                MachineState *ms, RISCVBootInfo *info)
> +                                MachineState *ms, const RISCVBootInfo *info)
>   {
>       int ret = fdt_pack(ms->fdt);
>       hwaddr dram_end, temp;

