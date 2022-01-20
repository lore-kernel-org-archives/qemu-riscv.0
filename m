Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nAeuU-0003Cb-Bs
	for mharc-qemu-riscv@gnu.org; Thu, 20 Jan 2022 16:23:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nAeuR-00038p-0L; Thu, 20 Jan 2022 16:23:55 -0500
Received: from [2607:f8b0:4864:20::12b] (port=41720
 helo=mail-il1-x12b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nAeuO-0000nv-5o; Thu, 20 Jan 2022 16:23:53 -0500
Received: by mail-il1-x12b.google.com with SMTP id r16so6087056ile.8;
 Thu, 20 Jan 2022 13:23:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0yY9Ms85FnCer+TFD7DPR4PQr2HVTopQEf0ra0clUmo=;
 b=TyxdBYrzNcgW9mjrqxjk3v6ySKL1UwWHeD4y3dE4vWA99c8tSIerMLlk8baqrqc7fG
 BMhtcvAGGO2RWEhPZ4o4J0iTkCZBv6OfoEixDe2uQtot+kdAK9Uy/MbfvK7T4ipg4dKo
 XruD9Z48CB1MmzBkfsqxnFZjyv/opvix0krK14qKAbRpCIx1bO5v7IWgt1HJqQj9kp8E
 gyAgQE4LMRg8y5B3V5N9Ny9YHIgFBzrTCwXxeCFnzXiEIHW8PdbRXLN1TLU/+VuZ1ME+
 7Qsz5CtGGferUXGakKylwtxH6IFfoOjKSpTYwmYK4McIxGDYEVqoLqmwu55kZjwoVF1r
 Fzqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0yY9Ms85FnCer+TFD7DPR4PQr2HVTopQEf0ra0clUmo=;
 b=xu75dYMVJrzZaVC4E+NqDNylZmcdt61nFfCb6U5ww7Do42dyF1Rk55D9IPyPGdOJmX
 VBrkXQOboeOh9C3c/hJaPWEDS2YOCNQaJizfRQMYbJWsRZ5mTpyJuYy4abQ3QgKiaBPi
 kQ0Czl++gI+DoIbZqHV4a0JKpRAQfxKXQXcY1b/G4ZO2CZbqjX++CrA4yRLBsB53K4a1
 wVOUZKk8zb9WKrH6Pzs6DUhzPRQv2ZRe7tLhnxinCE8UAD2OjoxlOrOWyGnXi2NRZRJk
 dwSxcye42oNO+6E6J8wgC94fV7FcnylCxuww8kiYeTlHBsyhJsqVjVosQjIg/hrWX0KP
 vpVg==
X-Gm-Message-State: AOAM531cQ/seM4LpLbRn9/dPfFPxz15MjXgZohKxEmNC3axpFoGHTvV8
 b31XWOC0VL0fnjdPbYVuqjvXDJHnjc/sZAwfpyw=
X-Google-Smtp-Source: ABdhPJysMT293vxSPNxan66Fxwm7ikipzudgarOjAvdDogZTq4u8dcs2j6ZbIGD96Y7yv7GMbjih0TSip4eyAEC97Ag=
X-Received: by 2002:a05:6e02:6d1:: with SMTP id
 p17mr474606ils.74.1642713829859; 
 Thu, 20 Jan 2022 13:23:49 -0800 (PST)
MIME-Version: 1.0
References: <20220120115656.31686-1-apatel@ventanamicro.com>
In-Reply-To: <20220120115656.31686-1-apatel@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 21 Jan 2022 07:23:23 +1000
Message-ID: <CAKmqyKN+4cpJuh=Pxv6uXQZu2xtZjPp8cf2Rgc2VP4io8mmcTw@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Improve RISC-V spike machine bios support
To: Anup Patel <apatel@ventanamicro.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, Anup Patel <anup@brainfault.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Atish Patra <atishp@atishpatra.org>, Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::12b;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12b.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
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
X-List-Received-Date: Thu, 20 Jan 2022 21:23:55 -0000

On Fri, Jan 21, 2022 at 1:49 AM Anup Patel <apatel@ventanamicro.com> wrote:
>
> This series aims at improving RISC-V spike machine BIOS support by allowing
> use of binary firmware as bios. Further, this also allows us to totally
> remove the ELF bios images shipped with QEMU RISC-V.
>
> These patches can also be found in riscv_spike_imp_v3 branch at:
> https://github.com/avpatel/qemu.git
>
> Changes since v2:
>  - Remove ELF file names from .gitlab-ci.d/opensbi.yml in PATCH3
>
> Changes since v1:
>  - Use htif_uses_elf_symbols() in htif_mm_init() for PATCH1
>  - Added PATCH2 and PATCH3 to remove ELF bios images
>
> Anup Patel (3):
>   hw/riscv: spike: Allow using binary firmware as bios
>   hw/riscv: Remove macros for ELF BIOS image names
>   roms/opensbi: Remove ELF images

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  .gitlab-ci.d/opensbi.yml                      |   2 -
>  hw/char/riscv_htif.c                          |  33 ++++++++-----
>  hw/riscv/spike.c                              |  45 +++++++++++-------
>  include/hw/char/riscv_htif.h                  |   5 +-
>  include/hw/riscv/boot.h                       |   2 -
>  include/hw/riscv/spike.h                      |   1 +
>  pc-bios/meson.build                           |   2 -
>  .../opensbi-riscv32-generic-fw_dynamic.elf    | Bin 838904 -> 0 bytes
>  .../opensbi-riscv64-generic-fw_dynamic.elf    | Bin 934696 -> 0 bytes
>  roms/Makefile                                 |   2 -
>  10 files changed, 54 insertions(+), 38 deletions(-)
>  delete mode 100644 pc-bios/opensbi-riscv32-generic-fw_dynamic.elf
>  delete mode 100644 pc-bios/opensbi-riscv64-generic-fw_dynamic.elf
>
> --
> 2.25.1
>
>

