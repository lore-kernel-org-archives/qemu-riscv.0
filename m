Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n5EmS-0002qA-GF
	for mharc-qemu-riscv@gnu.org; Wed, 05 Jan 2022 17:29:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n5EmO-0002lp-LT; Wed, 05 Jan 2022 17:29:12 -0500
Received: from [2607:f8b0:4864:20::132] (port=46697
 helo=mail-il1-x132.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n5EmN-0006rb-Aw; Wed, 05 Jan 2022 17:29:12 -0500
Received: by mail-il1-x132.google.com with SMTP id e8so627232ilm.13;
 Wed, 05 Jan 2022 14:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rNX8e77a1rUPOsPapCeAOGTou0XCxCiBvZsFYQ7B+HQ=;
 b=oG3ngLwTI1O+XLUmyybHOLrqP3mb1BXeuSUkFj1JZLOMqLpwBBIAuHzJ1Ykgx3VK2V
 ZZAwRwh7o+l7+0cD8XWKvnpBDP033PdAjGSLycfUYH/CXPNph1vJ+xhHJ6UnPTU/i0oK
 B+RYYqa305KC50Rh7qrjFfuujll0L16I4N1/Q1cuUA55MMb7+XdzXAv8EQn+z7HD26yK
 B2wBulb6Ij5DUyiPNKkSbCtMCp+OzAPejaguu3OvHCqEAU5mK7vJ1q3EQM2odkLWwBax
 3MU/Rq4CxDuf8DWRnciU0vID8TjWzN3+gv6t9qymdAABlocWnPcJPqIM9IjBU7hZouDh
 KmkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rNX8e77a1rUPOsPapCeAOGTou0XCxCiBvZsFYQ7B+HQ=;
 b=oAAI06km/wEwaqXqor5DdXWDAB+cp2+zLdQq3UZxj8AClLe6WUECwhuJi19pSJU9Rr
 rX0dE2vkIAyRq7DhOD2gz74DX78GG41rgq4R9JxNdKBTxZQ8pONZJr073/20ex2UrgQF
 fYKezw3n7xjoF8SpEfJnRPUgcVewBiah65Ri8hQ4lauJGf1TnXRZL6/q5RZh1lJYIakp
 9gRk2zg66F6b4x7j9WxAEihTDx4n1GQModZFMMhBMF20jcxav9Clu9zqA/XejAXfUpXS
 YYnPhhj91IhHL11M2RdNA7ANgegUzxjgBDYrh9i+X7Wh/fuCwSGhLkb1TVbb3WEexF8R
 ulcg==
X-Gm-Message-State: AOAM53280qnjvD4frFkYExS9goDpb4VMSIXKs+fkhfgwftlO0Wfxe0RA
 VgcufFMUYpd5N2+W8gs+xlTMgsBvMmc0fudynL7PySL1xu+cZIxc
X-Google-Smtp-Source: ABdhPJyg2+Z+5ED9czEkUDNxrbpwP2kCb7Xhq0OLjPYpZ7sON35LW1/tc/2QHAFe+ZFe3N4ppgzHDtnN1WOQuZ/691s=
X-Received: by 2002:a92:c510:: with SMTP id r16mr1502524ilg.74.1641421750071; 
 Wed, 05 Jan 2022 14:29:10 -0800 (PST)
MIME-Version: 1.0
References: <20220105213937.1113508-1-alistair.francis@opensource.wdc.com>
In-Reply-To: <20220105213937.1113508-1-alistair.francis@opensource.wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 6 Jan 2022 08:28:44 +1000
Message-ID: <CAKmqyKMB6NmgdA9+kQaxPUBF=zT3TSOm3yjCN7_+Gqw0nw2mWA@mail.gmail.com>
Subject: Re: [PATCH v4 0/8] A collection of RISC-V cleanups and improvements
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bmeng.cn@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::132
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::132;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x132.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Wed, 05 Jan 2022 22:29:13 -0000

On Thu, Jan 6, 2022 at 7:55 AM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> This is a few patches to cleanup some RISC-V hardware and mark the
> Hyperisor extension as non experimental.
>
> v4:
>  - Resend
> v3:
>  - Drop some patches
>  - Few small fixes from reviews
> v2:
>  - Add some more fixes
>  - Address review comments
>
> Alistair Francis (8):
>   hw/intc: sifive_plic: Add a reset function
>   hw/intc: sifive_plic: Cleanup the write function
>   hw/intc: sifive_plic: Cleanup the read function
>   hw/intc: sifive_plic: Cleanup remaining functions
>   target/riscv: Mark the Hypervisor extension as non experimental
>   target/riscv: Enable the Hypervisor extension by default
>   hw/riscv: Use error_fatal for SoC realisation
>   hw/riscv: virt: Allow support for 32 cores

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  include/hw/riscv/virt.h    |   2 +-
>  hw/intc/sifive_plic.c      | 254 +++++++++++--------------------------
>  hw/riscv/microchip_pfsoc.c |   2 +-
>  hw/riscv/opentitan.c       |   2 +-
>  hw/riscv/sifive_e.c        |   2 +-
>  hw/riscv/sifive_u.c        |   2 +-
>  target/riscv/cpu.c         |   2 +-
>  7 files changed, 82 insertions(+), 184 deletions(-)
>
> --
> 2.31.1
>
>

