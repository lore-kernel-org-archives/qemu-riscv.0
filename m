Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l4Irg-0003I4-JI
	for mharc-qemu-riscv@gnu.org; Tue, 26 Jan 2021 02:34:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l4Ire-0003GO-6y; Tue, 26 Jan 2021 02:34:14 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:45404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l4Irc-0007Ae-Fw; Tue, 26 Jan 2021 02:34:13 -0500
Received: by mail-ej1-x62e.google.com with SMTP id ke15so21553445ejc.12;
 Mon, 25 Jan 2021 23:34:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JM4WyamiZGOLoC9ug2LKWVfkz3NrcNmYH1UCwLB6VFA=;
 b=trwX7w8ExaVcPA8IZ4ITUSmbTXevfhLMVUBUjaEvN/Dw9PApe7jOqY71SDJnH6EYgZ
 5N+XByqcScj3wJqvQ5latm3k3PVRo/62TQagwtkf6YK82gGTeQHZc+lthoYCF5KJx+Rx
 Ip7mUmDJ71yB2UwJP40NIub5H/SUzAlZfNiUAzp9d9YFWRIfUPhzLxdI2EI9zqOeF3d3
 PiCKfsNI253oY9NkbH5wzZ+SrXahKbEhe34+/io4Poq4fvF9gRtZvAJDSsg3GRxPK59i
 BN7Y8c7c43r7LozcS4CnTMnvcv1ZZfYCgX4ss5eu/l5O72G4/JCvidzmuIICTopyN+EU
 WfcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JM4WyamiZGOLoC9ug2LKWVfkz3NrcNmYH1UCwLB6VFA=;
 b=mw098Ch9Vo1fy+V9wZNt40Ws6HMEN6kqblwIoUUTCMx3a1ba7/b4xDgQNnfffnnaqV
 OBTGykYGvG2MsvUScFPZj/YOH2oFbGqMvbUKYXNVJBx2mLwTJg00DHNhC0fi8ihcribh
 j+LlXZUWR33uVQ8yAdCv/6ncq3UdVGgfR7KkW0LzhKnDpQv+Q/m6w1a5a5Mmo82AAbDO
 QDIaGNOwHJsx6fT7OdZuvQQCm9ueb/ItTGuEOWmq8RmJ0bQ80tmlOKI4NGUXdaYwfjeO
 m8k7LS10Oh/hJyPJeeHlvhsnbudT8R+Ql98qPo4CUTHFhebY/279crD1zMbgTmf0pZCY
 CZ4A==
X-Gm-Message-State: AOAM531oxpIv49NdhR8fziJ6ul7vtZnwh0n96NDBlB6zVFgMInVpvzus
 VGlYBcxS8Z1MnKvM84OSqB8=
X-Google-Smtp-Source: ABdhPJyRpCJVEQOuXP4LAWZnpDA1W4r7Brkc4f+6qzwVo/IV5KpbcvqfXWpe8Cr9SWHsKDVmRtP36w==
X-Received: by 2002:a17:906:dbe3:: with SMTP id
 yd3mr2798574ejb.192.1611646447668; 
 Mon, 25 Jan 2021 23:34:07 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id p27sm9337916ejd.72.2021.01.25.23.34.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jan 2021 23:34:06 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v3 3/9] hw/ssi: Add SiFive SPI controller support
To: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
References: <20210126060007.12904-1-bmeng.cn@gmail.com>
 <20210126060007.12904-4-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <64f493fb-25cb-d3c9-11fe-ca61fca75f50@amsat.org>
Date: Tue, 26 Jan 2021 08:34:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210126060007.12904-4-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
X-List-Received-Date: Tue, 26 Jan 2021 07:34:14 -0000

On 1/26/21 7:00 AM, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> This adds the SiFive SPI controller model for the FU540 SoC.
> The direct memory-mapped SPI flash mode is unsupported.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> 
> ---
> 
> Changes in v3:
> - Simplify flush txfifo logic
> 
> Changes in v2:
> - Log guest error when trying to write reserved registers
> - Log guest error when trying to access out-of-bounds registers
> - log guest error when writing to reserved bits for chip select
>   registers and watermark registers
> - Log unimplemented warning when trying to write direct-map flash
>   interface registers
> - Add test tx fifo full logic in sifive_spi_read(), hence remove
>   setting the tx fifo full flag in sifive_spi_write().
> - Populate register with their default value
> 
>  include/hw/ssi/sifive_spi.h |  47 +++++
>  hw/ssi/sifive_spi.c         | 358 ++++++++++++++++++++++++++++++++++++
>  hw/ssi/Kconfig              |   4 +
>  hw/ssi/meson.build          |   1 +
>  4 files changed, 410 insertions(+)
>  create mode 100644 include/hw/ssi/sifive_spi.h
>  create mode 100644 hw/ssi/sifive_spi.c

Missing MAINTAINERS entry (if there are no other comments on
this series, maybe the maintainer can directly add one).

