Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ncSEA-00027w-9h
	for mharc-qemu-riscv@gnu.org; Thu, 07 Apr 2022 09:31:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1ncSE8-00023y-Af; Thu, 07 Apr 2022 09:31:08 -0400
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129]:36801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1ncSE4-0000FW-0u; Thu, 07 Apr 2022 09:31:06 -0400
Received: by mail-lf1-x129.google.com with SMTP id i38so1337845lfv.3;
 Thu, 07 Apr 2022 06:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=/+wXORUvr5hRqH1WCu2NimZjlyaZzvEeKmaflldHyPY=;
 b=MtNZ5Zh4n3Sv9cie+VJ1eGEU4XYXA7n/nZpzqdqvMUjrITNWLOQ9cHHnlywOOgLEQL
 ZctWHMJd+sr0h1b5W1tok82cEP9xLRi6lGH/tWCYKi2x7TqLNewgj9uDvAbs1OVBu5pQ
 aWlT64dzlsPcq0OOUetE7rNua3ikhblmf4JgI1dcba1U3exXs6VHiyqtcSLWMJAoDWSh
 Vk9IDWR9ftWFVMmAmAaEXR9xNGEzI0eCqvJW5bhJgPNcNoeideMT9DUJZAbIElJOWS/d
 S//crrJWSuVIB521tKFiz6EQzrHQf8JZBu7t61V2A5Lw000hyjgqEgQohOAJS46kk/31
 cm5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/+wXORUvr5hRqH1WCu2NimZjlyaZzvEeKmaflldHyPY=;
 b=hoJFhFXEZ0bKbfperq5Iy98+7uZ947IGyCLrMaDMjcGTsGnjMPfEN7gBQy21OJPI7a
 mePpe46vB39hV8x/1RbC+dLSZfjOlCgJtbBkEQhjzPOuwTa+SYZNjJ+fdS4GJMdFoxxT
 vnvSi4HnIjZGHN0m0bGa3nNi+j+9EoMU0hMiTO+SlYj6nipuNBvhF2p3I/GplcdMXH0Q
 eNLjXgr3nA/7CDZb2/rpoXHc13Jdk55ykks2+NUtFRNhSVrm0QbAjpzxmzpXHSRCYHsC
 drvSXAlCXjpxeRTR8Tec2wFuQDf5HKn/uHE+JhB2o2cv7ZxjaBmWDZAdyLL2+hb9aBCr
 mzFA==
X-Gm-Message-State: AOAM530uI0SraU5T947+Mk9daVbCwsnDGVhBq5SxUaZ6pgES5tcKl7XT
 2lA8/v4TDcZRoBjcOBiLzHI=
X-Google-Smtp-Source: ABdhPJzMcwvElcXTq/HdHMeXsTCHwoXHAmMIDfvFRMAV19OkG+I8mGq9s8w5NtjEeGFA4OUYRT6OQw==
X-Received: by 2002:a05:6512:3b0a:b0:44a:2e21:ef25 with SMTP id
 f10-20020a0565123b0a00b0044a2e21ef25mr9442173lfv.333.1649338261316; 
 Thu, 07 Apr 2022 06:31:01 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id
 w15-20020a2e9bcf000000b0024b0b623685sm1732852ljj.136.2022.04.07.06.31.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 06:31:00 -0700 (PDT)
Date: Thu, 7 Apr 2022 15:30:59 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, peter.maydell@linaro.org,
 qemu-arm@nongnu.org, richard.henderson@linaro.org,
 Alistair Francis <alistair@alistair23.me>, alistair23@gmail.com,
 Palmer Dabbelt <palmer@dabbelt.com>, bmeng.cn@gmail.com,
 Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: Re: [PATCH v2 0/6] hw/riscv: Add TPM support to the virt board
Message-ID: <20220407133059.GG3143488@toto>
References: <20220407020432.4062829-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220407020432.4062829-1-alistair.francis@opensource.wdc.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x129.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Thu, 07 Apr 2022 13:31:08 -0000

On Thu, Apr 07, 2022 at 12:04:26PM +1000, Alistair Francis wrote:
> From: Alistair Francis <alistair.francis@wdc.com>
> 
> This series adds support for connecting TPM devices to the RISC-V virt
> board. This is similar to how it works for the ARM virt board.
> 
> This was tested by first creating an emulated TPM device:
> 
>     swtpm socket --tpm2 -t -d --tpmstate dir=/tmp/tpm \
>         --ctrl type=unixio,path=swtpm-sock
> 
> Then launching QEMU with:
> 
>     -chardev socket,id=chrtpm,path=swtpm-sock \
>     -tpmdev emulator,id=tpm0,chardev=chrtpm \
>     -device tpm-tis-device,tpmdev=tpm0
> 
> The TPM device can be seen in the memory tree and the generated device
> tree.

Hi Alistair!

You've got a typo in the subject of patch 4/6 "generating".

On the series:
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>

Cheers,
Edgar


> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/942
> 
> Alistair Francis (6):
>   hw/riscv: virt: Add a machine done notifier
>   hw/core: Move the ARM sysbus-fdt to core
>   hw/riscv: virt: Create a platform bus
>   hw/riscv: virt: Add support for generateing platform FDT entries
>   hw/riscv: virt: Add device plug support
>   hw/riscv: Enable TPM backends
> 
>  include/hw/{arm => core}/sysbus-fdt.h |   0
>  include/hw/riscv/virt.h               |   8 +-
>  hw/arm/virt.c                         |   2 +-
>  hw/arm/xlnx-versal-virt.c             |   1 -
>  hw/{arm => core}/sysbus-fdt.c         |   2 +-
>  hw/riscv/virt.c                       | 312 +++++++++++++++++---------
>  hw/arm/meson.build                    |   1 -
>  hw/core/meson.build                   |   1 +
>  hw/riscv/Kconfig                      |   2 +
>  9 files changed, 221 insertions(+), 108 deletions(-)
>  rename include/hw/{arm => core}/sysbus-fdt.h (100%)
>  rename hw/{arm => core}/sysbus-fdt.c (99%)
> 
> -- 
> 2.35.1
> 

