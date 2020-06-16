Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jlIGN-0002sq-H1
	for mharc-qemu-riscv@gnu.org; Tue, 16 Jun 2020 16:32:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jlIGM-0002rl-Jv; Tue, 16 Jun 2020 16:32:54 -0400
Received: from mail-il1-x144.google.com ([2607:f8b0:4864:20::144]:46956)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jlIGK-00082A-SG; Tue, 16 Jun 2020 16:32:54 -0400
Received: by mail-il1-x144.google.com with SMTP id h3so20365190ilh.13;
 Tue, 16 Jun 2020 13:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pUnxIEqa1zdLzD5rj+wmujAdnw3Eg0LvhncfBAHsJXo=;
 b=sq85ojGGp1+ZQ6fUPK8nl/p0ODqwZz9QSmEtpXhht6R4MbSbQotBDnBSr6/h1uToyG
 yBF0Xn2KUBQRqPBzJswI1i/g45EN+Yl3a9bMO9MIUTAPz8qQSLYoUW4C9JuYiGUOe5DK
 6B9aHB++lKUJVa4OGG2BDq26OrVB6MsI4b3+EAkAWaSSUIQxmNCXPv6xxqMQ8dnl3ODX
 wSFvviRHMG2CoIfoA2ZHcdfoCvJu+BlUxgpxg27htrhEBbRiNB5W0TZJCUk+Y8n3GcMe
 CiBHKZ0w3Dc+RSIqjwIKH9la/V1QmilqzoJtUwFUwRNrcmBw1Rvf3FhlSNfqXt4yrLIP
 jZUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pUnxIEqa1zdLzD5rj+wmujAdnw3Eg0LvhncfBAHsJXo=;
 b=rn1cpeUtwANeXQhp1BIEzXspiR1Vtywl3w8GgUXs79F2G/24iIsxbtch7XmWzqQVTP
 goaUWhOBHOOW3dDh8vffgpXJ7JPAPnsbD/z39XQOk4cFi3nJF7bGr4rc1Si5m+YD+KG3
 iMYW6xYdDZqF/CVtdB69VfT18u4Lwm3iUtzbGrQ7HS+Dkhdq5W2hvzxdhaVvbWK6XVtb
 uAV5y0VvEawScAbDZ0j67LkOLZVEDfGeyKDbps2+L/uKOt7Dp2hhiKyPOlqIpfrYSaWK
 H8gLxi9mMUIQvqPpEMTHzps+CbyUDsZuqUzCaOpC67sOoodetLA1w+KffRTlWdPhKmm/
 EjOA==
X-Gm-Message-State: AOAM533Imeb4OBPIs6OVEUCVgqzwvF0bzrWwm8PSJxvZeJtI1lgC7dLe
 KFWXQUkLBubc7/NLZKZPbcVjkpEOsGVv4CAgIac=
X-Google-Smtp-Source: ABdhPJwhvqHOZGnegSDXtG1bMoJ/G82Of9FIR8Vp5Hnjmdhjq2HggJKx/9MYMMof0hoM9dI0Po8s4p3y+VaU03UeMNQ=
X-Received: by 2002:a92:d647:: with SMTP id x7mr5095614ilp.267.1592339571494; 
 Tue, 16 Jun 2020 13:32:51 -0700 (PDT)
MIME-Version: 1.0
References: <1592268641-7478-1-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1592268641-7478-1-git-send-email-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 16 Jun 2020 13:23:28 -0700
Message-ID: <CAKmqyKOJAWAwAnA5iA95RRCSTxbnFiqQ79EM9O3hGXJW=NGsew@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] hw/riscv: sifive_u: Add Mode Select (MSEL[3:0])
 support
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmerdabbelt@google.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::144;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x144.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Tue, 16 Jun 2020 20:32:55 -0000

On Mon, Jun 15, 2020 at 5:51 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> This series updates the 'sifive_u' machine support:
>
> - Change SiFive E/U series CPU reset vector to 0x1004
> - Support Mode Select (MSEL[3:0]) settings at 0x1000 via a new
>   "msel" machine property
> - Add a dummy DDR memory controller device
>
> With this series, QEMU can boot U-Boot SPL built for SiFive FU540
> all the way up to loading U-Boot proper from MMC:
>
> $ qemu-system-riscv64 -nographic -M sifive_u,msel=6 -m 8G -bios u-boot-spl.bin
>
> U-Boot SPL 2020.07-rc3-00208-g88bd5b1 (Jun 08 2020 - 20:16:10 +0800)
> Trying to boot from MMC1
> Unhandled exception: Load access fault
> EPC: 0000000008009be6 TVAL: 0000000010050014
>
> The last big gap for the 'sifive_u' machine is the QSPI modeling.
>
> Changes in v2:
> - Drop the already applied patch 01 to 11 in v1
> - new patch: Rename IBEX CPU init routine
> - rebase on https://github.com/alistair23/qemu riscv-to-apply.next branch
> - rename SiFive E/U CPU init routine names
>
> Bin Meng (5):
>   target/riscv: Rename IBEX CPU init routine
>   hw/riscv: sifive: Change SiFive E/U CPU reset vector to 0x1004
>   hw/riscv: sifive_u: Support different boot source per MSEL pin state
>   hw/riscv: sifive_u: Sort the SoC memmap table entries
>   hw/riscv: sifive_u: Add a dummy DDR memory controller device

Applied to the RISC-V tree

Alistair

>
>  hw/riscv/sifive_e.c         | 10 +++++----
>  hw/riscv/sifive_u.c         | 51 ++++++++++++++++++++++++++++++++++-----------
>  include/hw/riscv/sifive_u.h |  7 +++++++
>  target/riscv/cpu.c          | 20 +++++++++---------
>  4 files changed, 62 insertions(+), 26 deletions(-)
>
> --
> 2.7.4
>
>

