Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l3lfI-0007Nw-1C
	for mharc-qemu-riscv@gnu.org; Sun, 24 Jan 2021 15:07:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l3lfB-0007KY-Hn; Sun, 24 Jan 2021 15:07:09 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:52999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l3lf9-0006DM-RF; Sun, 24 Jan 2021 15:07:09 -0500
Received: by mail-wm1-x331.google.com with SMTP id m187so8794711wme.2;
 Sun, 24 Jan 2021 12:07:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5pmRgR/GVMkD/P3IqRwyWz/LdV/RwijdnKJwXTmcNq8=;
 b=R44tqqPyyJkiFJdhjVWIYsJKH784XjYeLJh9MZHMp1pa1Wq/3gX++K/tJjULm6CeT7
 rV6BTyZq/5Jt205ETcQc6TCON2YUHazUWfdIzILwUswl+oHT4Dae8FSQOC02DZ6yt7I8
 PL/Pr+wqxKdbXq0CfHC6y7DXNvoYVMTYe5wPnV74tdt0DNnuTG9M5TDDJ7NaHte8SViU
 8+QLA+5WWvvYxk64Q9FilxeANC2tAQ5w+0nJF19DuJWrbrmjUX0b3N9vwAfi2VRr7UAu
 glGJoflP6+96sCKsMdDviVyHdZEdwTRAcRI2OJ/+aHAagl5XqcD6yVFxnNFm1C9+c5+w
 GkGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5pmRgR/GVMkD/P3IqRwyWz/LdV/RwijdnKJwXTmcNq8=;
 b=UMTILS/1tCywRajA7WE0UBJKPoTftml2DFQRr9eh1haFvNXvCJRFda/DZYk/QWXdAn
 ckzof2uKRna2vJSs64ERKymZAX+zpzqAa1W8XdxnKzR7fnOoEmrERcvM4UEkFA/SD0wI
 V4sf0xoUGPP4L03crNhVoKgwQZdfxfqRZsFIx/7sP43AlFBUO0COXqBDhY/kQH7Pu6Pb
 wVNSE9QBBtb84AJm+e9CKxRdEuSE1PgD1Hyxvr3CFBI7zsrDcI55O5MQgXEcC8bvLMbp
 3RKGm16R7yLYv9WXg3r92PzpyBwifiAM/zmpSq5qjgoA1YEghSK+lDb3b2Ld3XN8C0pO
 XpWQ==
X-Gm-Message-State: AOAM530h18HOXKHmx8PRgUlpEnLcaHSQo/2sL3C0ii+89gO6fC5chVIi
 w0jUesUVj4yvk9prhlqWdao=
X-Google-Smtp-Source: ABdhPJzFyM0AiHpO3K8SElTIMhhFwfPjHD1FXjbQEs6y0RGNo3A6wIUWssFL7tpox+0o7/BN+QPGhQ==
X-Received: by 2002:a1c:ddd4:: with SMTP id u203mr2960466wmg.83.1611518824004; 
 Sun, 24 Jan 2021 12:07:04 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id s25sm14278338wmj.24.2021.01.24.12.07.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Jan 2021 12:07:03 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v2 00/25] hw/riscv: sifive_u: Add missing SPI support
To: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, qemu-block@nongnu.org, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
References: <20210123104016.17485-1-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <630add30-eb2c-401d-1d79-c87486cf04b4@amsat.org>
Date: Sun, 24 Jan 2021 21:07:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210123104016.17485-1-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Sun, 24 Jan 2021 20:07:12 -0000

Hi Bin,

On 1/23/21 11:39 AM, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> This adds the missing SPI support to the `sifive_u` machine in the QEMU
> mainline. With this series, upstream U-Boot for the SiFive HiFive Unleashed
> board can boot on QEMU `sifive_u` out of the box. This allows users to
> develop and test the recommended RISC-V boot flow with a real world use
> case: ZSBL (in QEMU) loads U-Boot SPL from SD card or SPI flash to L2LIM,
> then U-Boot SPL loads the payload from SD card or SPI flash that is a
> combination of OpenSBI fw_dynamic firmware and U-Boot proper.
> 
> The m25p80 model is updated to support ISSI flash series. A bunch of
> ssi-sd issues are fixed, and writing to SD card in SPI mode is supported.
> 
> reST documentation for RISC-V is added. Currently only `sifive_u`
> machine is documented, but more to come.
> 
> Changes in v2:
> - Mention QPI (Quad Peripheral Interface) mode is not supported
> - Add a debug printf in the state handling codes
> - Fix several typos in the commit message
> - new patch: add a state representing Nac
> - Make this fix a separate patch from the CMD18 support
> - Fix 2 typos in the commit message
> - Add a comment block to explain the CMD12 timing
> - Catch CMD12 in all of the data read states per the timing requirement
> - Move multiple write token definitions out of this patch
> - Correct the "coding" typo in the commit message
> - Correct the "token" typo in the commit message
> - Add 'write_bytes' in vmstate_ssi_sd
> - Correct the "token" typo in the commit message
> - Introduce multiple write token definitions in this patch
> - new patch: bump up version ids of VMStateDescription
> - Log guest error when trying to write reserved registers
> - Log guest error when trying to access out-of-bounds registers
> - log guest error when writing to reserved bits for chip select
>   registers and watermark registers
> - Log unimplemented warning when trying to write direct-map flash
>   interface registers
> - Add test tx fifo full logic in sifive_spi_read(), hence remove
>   setting the tx fifo full flag in sifive_spi_write().
> - Populate register with their default value
> - Correct the "connects" typo in the commit message
> - Mention in the commit message that <reg> property does not populate
>   the second group which represents the memory mapped address of the
>   SPI flash
> - Correct the "connects" typo in the commit message
> - Correct several typos in sifive_u.rst
> - Update doc to mention U-Boot v2021.01
> 
> Bin Meng (25):
>   hw/block: m25p80: Add ISSI SPI flash support
>   hw/block: m25p80: Add various ISSI flash information
>   hw/sd: ssi-sd: Fix incorrect card response sequence
>   hw/sd: sd: Support CMD59 for SPI mode
>   hw/sd: sd: Drop sd_crc16()
>   util: Add CRC16 (CCITT) calculation routines
>   hw/sd: ssi-sd: Suffix a data block with CRC16
>   hw/sd: ssi-sd: Add a state representing Nac
>   hw/sd: ssi-sd: Fix the wrong command index for STOP_TRANSMISSION
>   hw/sd: ssi-sd: Support multiple block read
>   hw/sd: ssi-sd: Use macros for the dummy value and tokens in the
>     transfer
>   hw/sd: sd: Remove duplicated codes in single/multiple block read/write
>   hw/sd: sd: Allow single/multiple block write for SPI mode
>   hw/sd: sd.h: Cosmetic change of using spaces
>   hw/sd: Introduce receive_ready() callback
>   hw/sd: ssi-sd: Support single block write
>   hw/sd: ssi-sd: Support multiple block write
>   hw/sd: ssi-sd: Bump up version ids of VMStateDescription
>   hw/ssi: Add SiFive SPI controller support
>   hw/riscv: sifive_u: Add QSPI0 controller and connect a flash
>   hw/riscv: sifive_u: Add QSPI2 controller and connect an SD card
>   hw/riscv: sifive_u: Change SIFIVE_U_GEM_IRQ to decimal value
>   docs/system: Sort targets in alphabetical order
>   docs/system: Add RISC-V documentation
>   docs/system: riscv: Add documentation for sifive_u machine

I'm queuing patches 3-9,11,14 to sd-next, and will repost
your 10,12,13,15-18 based on it.

Regards,

Phil.

