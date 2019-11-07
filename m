Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iSl7Y-0005hu-Lr
	for mharc-qemu-riscv@gnu.org; Thu, 07 Nov 2019 11:58:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46015)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1iSl7V-0005fC-OR
 for qemu-riscv@nongnu.org; Thu, 07 Nov 2019 11:58:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1iSl7U-00057H-It
 for qemu-riscv@nongnu.org; Thu, 07 Nov 2019 11:58:53 -0500
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:44199)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1iSl7U-000571-8Q
 for qemu-riscv@nongnu.org; Thu, 07 Nov 2019 11:58:52 -0500
Received: by mail-pl1-x642.google.com with SMTP id az9so1048931plb.11
 for <qemu-riscv@nongnu.org>; Thu, 07 Nov 2019 08:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=SSF77W5ljtz4X2exwpOWBcNAR43MQ7/J9pvWQCD7wlk=;
 b=2Gv2vFQWvQsANsfINRgtnmGpO1lkxftxi+r6wmMYuc6+T1wdjtbI0I+3AtSprDYvM1
 udGPzzaIlgpMZLrzhGsbUfvDXSB492G9hRqQWcvfLrMZagJ6Sq6NkomIxkgRWgvMA7t6
 W42/RE4c9G66cDQTrNDEVcjg7QJ1LRrNvvPHVR7d/PwWCp5mq7H9YtBMXiyaLlgPIrrW
 PQqWLNjqp4aDQXukEOtdb2L3CynPCdPY2VaL73rDYeeakHrsA8Vfa53Pmp4dE7vQ0ffl
 HkhyUTiFv5SmQWBl+bnf3nRPTIcsbK7iczZq2EjjiVCZAJLjzvCGjiuQtYyZ+0NOamFv
 zqug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=SSF77W5ljtz4X2exwpOWBcNAR43MQ7/J9pvWQCD7wlk=;
 b=fFYxREHfvQxjtBHOW4DrO2t2Sn7GxoEG83gJCxfbgPmwPmVZrYy+TO1RmIxKOcFqVp
 S/2IHJ0fU2FfF8cozErKkW9C7yU7Uj1C1AQmF9GJw2cVf/RNX6fSclwIv9/X9hxK5UqQ
 aLk5lBMY9zBLtL2+hvUQFlBsoGeAe8Et1Z4nk9yVmgYQ3l9Hym7HAktFEd9G0atV96ow
 rW2+ElStT+7sVYQI4rgLRSAGDARu0MtE8EUcO8+Lh0UoU4W/pumFTzjH0RFei7OrQcGA
 fdhZKwqrtz9+AeVOBG41Isreu+Ozfv8L7HG6tuK2tNzuEiQKAbXpICVAIk8xmKwMmIZW
 +UjQ==
X-Gm-Message-State: APjAAAUwqMFrfd7qPNw0ukuyG5p7LAig+QebRGoplCEhhNI9Is6dmlZH
 HXOzioFWMMnEGru2JOEWkMojSA==
X-Google-Smtp-Source: APXvYqxNDctI8BHXtYSYLrp0u2wqFzxx4+bAKNHtuef9ncnjI+kYTELDshtcJuv3kMJtavZPM7WkXg==
X-Received: by 2002:a17:90a:98d:: with SMTP id 13mr6383221pjo.98.1573145930748; 
 Thu, 07 Nov 2019 08:58:50 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id 26sm2497779pjg.21.2019.11.07.08.58.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Nov 2019 08:58:50 -0800 (PST)
Date: Thu, 07 Nov 2019 08:58:50 -0800 (PST)
X-Google-Original-Date: Thu, 07 Nov 2019 08:58:24 PST (-0800)
Subject: Re: [PATCH for 4.2 v1 1/1] riscv/virt: Increase flash size
In-Reply-To: <03c2f42b32fb4e304319c241122ae83584f085e0.1573087610.git.alistair.francis@wdc.com>
CC: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair23@gmail.com,
 palmer@sifive.com, Alistair Francis <Alistair.Francis@wdc.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Alistair Francis <Alistair.Francis@wdc.com>
Message-ID: <mhng-35530489-a164-4825-90da-e550083fef9d@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::642
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
X-List-Received-Date: Thu, 07 Nov 2019 16:58:55 -0000

On Wed, 06 Nov 2019 16:47:20 PST (-0800), Alistair Francis wrote:
> Coreboot developers have requested that they have at least 32MB of flash
> to load binaries. We currently have 32MB of flash, but it is split in
> two to allow loading two flash binaries. Let's increase the flash size
> from 32MB to 64MB to ensure we have a single region that is 32MB.
>
> No QEMU release has include flash in the RISC-V virt machine, so this
> isn't a breaking change.

Even if we had, I wouldn't consider it a breaking change because it adds to 
the memory map so existing programs will continue to run fine.

>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  hw/riscv/virt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index cc8f311e6b..23f340df19 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -62,7 +62,7 @@ static const struct MemmapEntry {
>      [VIRT_PLIC] =        {  0xc000000,     0x4000000 },
>      [VIRT_UART0] =       { 0x10000000,         0x100 },
>      [VIRT_VIRTIO] =      { 0x10001000,        0x1000 },
> -    [VIRT_FLASH] =       { 0x20000000,     0x2000000 },
> +    [VIRT_FLASH] =       { 0x20000000,     0x4000000 },
>      [VIRT_DRAM] =        { 0x80000000,           0x0 },
>      [VIRT_PCIE_MMIO] =   { 0x40000000,    0x40000000 },
>      [VIRT_PCIE_PIO] =    { 0x03000000,    0x00010000 },

Reviewed-by: Palmer Dabbelt <palmer@dabbelt.com>

I'll include this in my next PR, which should be soon -- I was about to send 
it, but figure I should look at my email first :)

