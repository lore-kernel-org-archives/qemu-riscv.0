Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jb9no-0003rH-6p
	for mharc-qemu-riscv@gnu.org; Tue, 19 May 2020 17:29:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jb9ng-0003qS-AX; Tue, 19 May 2020 17:29:24 -0400
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43]:35331)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jb9nd-0006Yc-Vn; Tue, 19 May 2020 17:29:23 -0400
Received: by mail-io1-xd43.google.com with SMTP id 79so858450iou.2;
 Tue, 19 May 2020 14:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Sg2Byur8LzSL26ul6iIVScrYoMeX9tc554+GgjyqIO0=;
 b=qmS4t413tDGch2kVOyvj7zrPijeX9173J5Lz0kj72T5DhmSUqWoNuPLF/ChZAMPFvz
 ZTWwNNYzzf52tgrNVh1xnsWIDGKrYFkQrPg7lp7f4Sf6Dc8aY7pNKi89XK41nkUUSC/O
 drXg/R4gDwQh5aXI9hTQLyhrGKz2HzJVDTWeYiNr7FVdl+W5qYk9HFpWh1WDA+ph0UAs
 /MR6qgYtSrHZCT3fzKDV14H1H2svHoB2hAWNZj+pV36YXmERCVjG4hDSCxIZyxBB4Zln
 ex/GchWBybAgvWtTA6AeoSEulNS9CptYNwR2bIKonS0V2uvsSxOqxj3qiBOBgn++HD1R
 nMdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Sg2Byur8LzSL26ul6iIVScrYoMeX9tc554+GgjyqIO0=;
 b=g8jxk5JGVZBGiRn/Vrjk/oDBBhvVbJtyIeDfVwq0QVJaZTHht0qpn6A3E1V4peWFhD
 M8bt7Y55kXGtu2UnwD4nbcW4MbQLDkcSHUm8z0aHxubrH5vS2sMVbY5syY/0h3cLBmAP
 EnOhOOr/+Tul/1PQpjqD2XtCKwHq0YFKa6GAJ/xrZXQc5JF4EcIOrkKIoom8xpKTVSxN
 QtOHMvUx1z3M7lx45a1CAsooP250xp+5zoHBxekLbJFrXvl8OQMvvxLJCH25FCPr4iFq
 p7ZP3grQ/KGhZtwq73nwI15MLz5TM1jVe9Oa+RZmCAPnWtdaa3a/BvXajsbjeffU4RGU
 wKDQ==
X-Gm-Message-State: AOAM5339DBB2vJQOwZOlCm1KTBopfNjiitQwdvweNFYFYp+EqCNubRg1
 YYVJTFJrS+hWYlwY8fVuQoYIM4AKnGA1adXubW0=
X-Google-Smtp-Source: ABdhPJyWE7KVhpentQMS6wcIOnLCO28yiBC8EyfgsmRsgTyMwDbmfs9ZYWTSBImZjFoURIrO9SJfo+Aqu6ijp+p8E1Q=
X-Received: by 2002:a6b:5c14:: with SMTP id z20mr910688ioh.176.1589923758581; 
 Tue, 19 May 2020 14:29:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200516063746.18296-1-anup.patel@wdc.com>
In-Reply-To: <20200516063746.18296-1-anup.patel@wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 19 May 2020 14:20:25 -0700
Message-ID: <CAKmqyKNURMfx+ONV02DLiJxkMaX7_FCdoNjnUhtqnsvKpty8PA@mail.gmail.com>
Subject: Re: [PATCH 0/4] RISC-V multi-socket support
To: Anup Patel <anup.patel@wdc.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Atish Patra <atish.patra@wdc.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Anup Patel <anup@brainfault.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d43;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd43.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
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
X-List-Received-Date: Tue, 19 May 2020 21:29:26 -0000

On Fri, May 15, 2020 at 11:40 PM Anup Patel <anup.patel@wdc.com> wrote:
>
> This series adds multi-socket support for RISC-V virt machine and
> RISC-V spike machine. The multi-socket support will help us improve
> various RISC-V operating systems, firmwares, and bootloader to
> support RISC-V NUMA systems.
>
> These patch can be found in riscv_multi_socket_v1 branch at:
> https://github.com/avpatel/qemu.git
>
> To try this patches, we will need:
> 1. OpenSBI multi-PLIC and multi-CLINT support which can be found in
>    multi_plic_clint_v1 branch at:
>    https://github.com/avpatel/opensbi.git
> 2. Linux multi-PLIC improvements support which can be found in
>    plic_imp_v1 branch at:
>    https://github.com/avpatel/linux.git
>
> Anup Patel (4):
>   hw/riscv: Allow creating multiple instances of CLINT
>   hw/riscv: spike: Allow creating multiple sockets
>   hw/riscv: Allow creating multiple instances of PLIC
>   hw/riscv: virt: Allow creating multiple sockets

Can you make sure all the patches pass checkpatch?

Alistair

>
>  hw/riscv/sifive_clint.c         |  20 +-
>  hw/riscv/sifive_e.c             |   4 +-
>  hw/riscv/sifive_plic.c          |  24 +-
>  hw/riscv/sifive_u.c             |   4 +-
>  hw/riscv/spike.c                | 210 ++++++++------
>  hw/riscv/virt.c                 | 495 ++++++++++++++++++--------------
>  include/hw/riscv/sifive_clint.h |   7 +-
>  include/hw/riscv/sifive_plic.h  |  12 +-
>  include/hw/riscv/spike.h        |   8 +-
>  include/hw/riscv/virt.h         |  12 +-
>  10 files changed, 458 insertions(+), 338 deletions(-)
>
> --
> 2.25.1
>
>

