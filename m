Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l9IDV-0006B8-Ib
	for mharc-qemu-riscv@gnu.org; Mon, 08 Feb 2021 20:53:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1l9IDT-0006As-P1
 for qemu-riscv@nongnu.org; Mon, 08 Feb 2021 20:53:23 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:44047)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1l9IDR-0005Pi-Tf
 for qemu-riscv@nongnu.org; Mon, 08 Feb 2021 20:53:23 -0500
Received: by mail-pg1-x52a.google.com with SMTP id j5so2664781pgb.11
 for <qemu-riscv@nongnu.org>; Mon, 08 Feb 2021 17:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=RGlJfA27u+RSP+vd++7LkVLUb7mLTpuBsCm9oFz0W7A=;
 b=Hbowu6eGj2zd0n4kj/o9YMWItXbrgid7LQ8JRxFDa/uI8swD4mJsZbJJsC74asURuj
 OIzbz1c7nQu3otyRhuO76PLTSoKHRhPA4Zkh6SIOJUYrfl5cStf52Mcj37W4xYAvx0x8
 YxMKazr6lXtokOWNGABUKZLJc5I94eA1+tA8JDeG+ex7TZ1w5/206juoJe0w3ZdpLj/K
 qbpmwbk2s1uikRQFO2kof0o2AGiPO7sln42hLUQA31E51PnSUM17aFrk03DZm0yd/ysq
 9ex3cPfr8G+qNH7XojuBVa220IfWT2aDbewrcCMP5NvuKiDXhqifLD5EqdLLwiad0C6a
 vlhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=RGlJfA27u+RSP+vd++7LkVLUb7mLTpuBsCm9oFz0W7A=;
 b=M9Ht9J6dHC6BbSQDxmcGVhubFUQz4eaKLcR+YpY+Ps6cEU2J4j2QXRxAmdvo0aGeXp
 ECUf6S5QgrJU0QFG5qdbT4V0an5TCg/+W18Q+L2AjaA75EcRFoFuf7fDHNgDlUuxDapw
 aM866Gs784ZJCTgSCWJ3L2tHV+6QHq2YbfLbGhBMM7sgrzxKDEBAqxsZUstSnshnvGHE
 T+HCGw0DdCgI6vEkC/0UmP7wN19pEVoMUoKnhifBtTzbFZ6FQyFK4mWugsR8UJ3/rKc+
 PwY9gBDsslzMorWYEhe56V+VHWM4VPs+P49DrtRzY/FFFlbxwHiIvKPuwNd9oXpwOcD6
 AvfA==
X-Gm-Message-State: AOAM53151rBCVIA/GqrdoUzjQQoFs1sUE12Gzv1yWV3ANdSPX/nbSkB5
 UxT4+q6mxHj7dVGlqfBZOlSZYA==
X-Google-Smtp-Source: ABdhPJy20XdxJXFvP23g6Qavg6GENxIx5pZiHZqceisloEz8/9BmnSFuZjtvlMGsVi5YQxzYqfS6rg==
X-Received: by 2002:a63:e101:: with SMTP id z1mr19539754pgh.190.1612835599745; 
 Mon, 08 Feb 2021 17:53:19 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id d13sm518676pjz.3.2021.02.08.17.53.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 17:53:19 -0800 (PST)
Date: Mon, 08 Feb 2021 17:53:19 -0800 (PST)
X-Google-Original-Date: Mon, 08 Feb 2021 17:53:05 PST (-0800)
Subject: Re: [PATCH v3 3/9] hw/ssi: Add SiFive SPI controller support
In-Reply-To: <CAKmqyKM4XSQuAvvUYLa+j_je61-e-OHj_AJP1Q54o1V+bPs9og@mail.gmail.com>
CC: f4bug@amsat.org, bmeng.cn@gmail.com,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org, bin.meng@windriver.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alistair23@gmail.com
Message-ID: <mhng-aeec82c4-8c0b-4056-9c74-5353203767b2@penguin>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=palmer@dabbelt.com; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Tue, 09 Feb 2021 01:53:24 -0000

On Mon, 08 Feb 2021 17:44:17 PST (-0800), alistair23@gmail.com wrote:
> On Mon, Jan 25, 2021 at 11:34 PM Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> On 1/26/21 7:00 AM, Bin Meng wrote:
>> > From: Bin Meng <bin.meng@windriver.com>
>> >
>> > This adds the SiFive SPI controller model for the FU540 SoC.
>> > The direct memory-mapped SPI flash mode is unsupported.
>> >
>> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
>> >
>> > ---
>> >
>> > Changes in v3:
>> > - Simplify flush txfifo logic
>> >
>> > Changes in v2:
>> > - Log guest error when trying to write reserved registers
>> > - Log guest error when trying to access out-of-bounds registers
>> > - log guest error when writing to reserved bits for chip select
>> >   registers and watermark registers
>> > - Log unimplemented warning when trying to write direct-map flash
>> >   interface registers
>> > - Add test tx fifo full logic in sifive_spi_read(), hence remove
>> >   setting the tx fifo full flag in sifive_spi_write().
>> > - Populate register with their default value
>> >
>> >  include/hw/ssi/sifive_spi.h |  47 +++++
>> >  hw/ssi/sifive_spi.c         | 358 ++++++++++++++++++++++++++++++++++++
>> >  hw/ssi/Kconfig              |   4 +
>> >  hw/ssi/meson.build          |   1 +
>> >  4 files changed, 410 insertions(+)
>> >  create mode 100644 include/hw/ssi/sifive_spi.h
>> >  create mode 100644 hw/ssi/sifive_spi.c
>>
>> Missing MAINTAINERS entry (if there are no other comments on
>> this series, maybe the maintainer can directly add one).
>
> Yep, I'm adding this section to the RISC-V machines:
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8d8b0bf966..c347d49bd2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1359,6 +1359,15 @@ F: include/hw/misc/mchp_pfsoc_dmc.h
> F: include/hw/misc/mchp_pfsoc_ioscb.h
> F: include/hw/misc/mchp_pfsoc_sysreg.h
>
> +SiFive Machines
> +M: Alistair Francis <Alistair.Francis@wdc.com>
> +M: Bin Meng <bin.meng@windriver.com>
> +M: Palmer Dabbelt <palmer@dabbelt.com>
> +L: qemu-riscv@nongnu.org
> +S: Supported
> +F: hw/*/*sifive*.c
> +F: include/hw/*/*sifive*.h
> +
> RX Machines
> -----------
> rx-gdbsim
>
>
> Can I get an Ack from you Bin that you are ok with that?
>
> @Palmer Dabbelt let me know if you would prefer something else.

Sorry, I hadn't seen this go by.

Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>

Thanks!

>
> Alistair
>
>>

