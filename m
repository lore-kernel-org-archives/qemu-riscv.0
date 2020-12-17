Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kq1oI-0008FT-32
	for mharc-qemu-riscv@gnu.org; Thu, 17 Dec 2020 17:31:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1kq1oC-0008Ew-2c
 for qemu-riscv@nongnu.org; Thu, 17 Dec 2020 17:31:41 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:45327)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1kq1o8-0004dZ-28
 for qemu-riscv@nongnu.org; Thu, 17 Dec 2020 17:31:39 -0500
Received: by mail-pl1-x62b.google.com with SMTP id e2so299995plt.12
 for <qemu-riscv@nongnu.org>; Thu, 17 Dec 2020 14:31:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=d+wPOtIhDirfL8ATFPP4hrcwCB+1OSP2geV3SP38/xU=;
 b=MntMcFMjSMyiPN9R7L2lgx+V3Cwg+zLGTPlkn+I9GQfrZYUdbCJBVoip72VlAUXsXm
 C2FPsxd8HANaqVt75kcG7x4a9Lv0yrKFMUCgyO3P4BtByN4JEAoB2nmThydpyYz+hFKC
 gp78MG0AX9BbSRiZ8hxjpMQy54MoHCaggtBJuhe6MZ9sVo3G/V1whmvcBjW4Fr3M6POf
 2pLn64+GpMJJIAnZqvXahHjVlV0KlboOZrOZH4ONisoawXrL8rZQdTjYWgBDa8fO8LR6
 NXPC7as6Zd+kD+91orcDfWWIxN8rwCRXBe5inBxqkhgQTpVuYgFSgk3G58ick7Nf4eNt
 nPDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=d+wPOtIhDirfL8ATFPP4hrcwCB+1OSP2geV3SP38/xU=;
 b=jdfaWXXg33lBkaYU370Oept313619M4rZr6YNFvv5xbKfcnXZ+K/R1UFOHyYk3rrnE
 67dE+HzXM//4UIwTh2WWVD1uKyo4aOHNlOrd4vcF3aTcczqk4zvKekao/aLmiqLOAWYC
 MKnTwRtXgVytXQz5Jx5IxfFVWndcbJ3UHKZIfybAzHhK2YtKlnSKk5NlRwHMhc0p0dlh
 5Rf8g9ipCM8Tb7OcB4D81KK+GeWGidTCWkz1sU9PH9PmCrpgSSYt1SvyMRMwvpyfh35a
 rt9eDh0nNHc0BgHqJ3420A1Cp65laKLid7lHlnBy0Lm8In/9nl8aOQ4XMCwq1kkFTh3V
 7Mhw==
X-Gm-Message-State: AOAM533uQrSpJgFOKjREL27zFowAnBHsxk/Bm77Qc7HRyNcCo2dANCi8
 RodVK1bYZqtsMVKjB6PQds473Q==
X-Google-Smtp-Source: ABdhPJx06QhgEFj1OSDKXo44+3bAu/FY6dJMvAwmx5vF2KAE48W69Z3BrPkjHGotWG3LoOYyN9XL6g==
X-Received: by 2002:a17:902:7b84:b029:da:60e0:9d38 with SMTP id
 w4-20020a1709027b84b02900da60e09d38mr1221357pll.55.1608244293343; 
 Thu, 17 Dec 2020 14:31:33 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id 77sm6921922pfx.156.2020.12.17.14.31.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 14:31:32 -0800 (PST)
Date: Thu, 17 Dec 2020 14:31:32 -0800 (PST)
X-Google-Original-Date: Thu, 17 Dec 2020 14:31:31 PST (-0800)
Subject: Re: [PATCH] RISC-V: Place DTB at 3GB boundary instead of 4GB
In-Reply-To: <20201217214826.2094617-1-atish.patra@wdc.com>
CC: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Atish Patra <Atish.Patra@wdc.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, sagark@eecs.berkeley.edu,
 Anup Patel <Anup.Patel@wdc.com>, bmeng.cn@gmail.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Atish Patra <Atish.Patra@wdc.com>
Message-ID: <mhng-b0271174-4849-4bcd-a63d-b53fafb1ab89@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=palmer@dabbelt.com; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 17 Dec 2020 22:31:42 -0000

On Thu, 17 Dec 2020 13:48:26 PST (-0800), Atish Patra wrote:
> Currently, we place the DTB at 2MB from 4GB or end of DRAM which ever is
> lesser. However, Linux kernel can address only 1GB of memory for RV32.
> Thus, it can not map anything beyond 3GB (assuming 2GB is the starting address).
> As a result, it can not process DT and panic if opensbi dynamic firmware
> is used.
>
> Fix this by placing the DTB at 2MB from 3GB or end of DRAM whichever is lower.
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  hw/riscv/boot.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> index d62f3dc7581e..9e77b22e4d56 100644
> --- a/hw/riscv/boot.c
> +++ b/hw/riscv/boot.c
> @@ -203,9 +203,9 @@ uint32_t riscv_load_fdt(hwaddr dram_base, uint64_t mem_size, void *fdt)
>       * We should put fdt as far as possible to avoid kernel/initrd overwriting
>       * its content. But it should be addressable by 32 bit system as well.
>       * Thus, put it at an aligned address that less than fdt size from end of
> -     * dram or 4GB whichever is lesser.
> +     * dram or 3GB whichever is lesser.
>       */
> -    temp = MIN(dram_end, 4096 * MiB);
> +    temp = MIN(dram_end, 3072 * MiB);
>      fdt_addr = QEMU_ALIGN_DOWN(temp - fdtsize, 2 * MiB);
>
>      fdt_pack(fdt);

Presumably this was the cause of that 32-bit boot issue?

