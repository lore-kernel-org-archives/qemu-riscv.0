Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jsrmt-00004w-H7
	for mharc-qemu-riscv@gnu.org; Tue, 07 Jul 2020 13:53:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jsrmr-0008W0-Et; Tue, 07 Jul 2020 13:53:45 -0400
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44]:44733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jsrmp-0007hk-Sk; Tue, 07 Jul 2020 13:53:45 -0400
Received: by mail-io1-xd44.google.com with SMTP id i4so44060502iov.11;
 Tue, 07 Jul 2020 10:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EHyMZ3wqlL652ip4NBYS9C55+jMGdjRPt+ZQVypflGE=;
 b=XHrRcZIXjDSvyFWyETR+STdpU4onQe5gcpKSzAY6dqyvs+tX55pwbSmudEvsaCHhjb
 +nv6aI/5fOfm22tkH9iJlimgBbZLo0IQeGvzPP9awuGUn1lk+Nt4c6dDCMzEDXNEujp+
 NMMBMOw7XiAfqj5SAQ6dgELGBeM1fz4DhIZz4Z1tTLT45B/kS3LlrBtGQAuYhOrjZHdJ
 b8u0WnGh96lLt6VfTzfn1shWG1xzYNYEiJIiQH0KNzwJM8Qn+eldJqyibkgih9Oxk81J
 0Aa7GCaOLkSiSoq2f6q5Y5pBRU8e7UsMWXU+hRJ9gcXRrA/JAnlyPMDAkoNVbF+G1oS2
 p+Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EHyMZ3wqlL652ip4NBYS9C55+jMGdjRPt+ZQVypflGE=;
 b=dXg3L1nphuKvjWVXqYb9Fsg+OO2/+kVNXQZ5E6zK2jU9rsJ+9MYJLuMxRn27YCGF3I
 JEteXDSzzYsZetJhVwp+Qzyno38XzDsMoxRT09wiyMdwFK987F+ezEcEtxQ+mvoaKbRf
 3/8nMSz5IVtrdWdBmY9OTau2wZUNxUZ5KlHVzWz8r/nYPjScTA8R3I7eyQ8rqUdPay2d
 F+xYq7+syyetud2MXMZBJEiwA6IGDUd0BOWxPGom763ZM3GeGUXnJnOb0FKcMUtUIzEd
 t1NJSXkYUl6F2oXCIvfiyxfKKJOZAg8nfTZUjskp6s4Zey6VoyxmMOwiluj+Ff47oleR
 G9FQ==
X-Gm-Message-State: AOAM533DfdNq9sk71xHv80ENSLWCiR9ia9nTtSrPvSOpv8d7dFrcOtVF
 Et5QgR45FOSXjAymisOwNhCD/WeQ7NwjRk/Y+Ek=
X-Google-Smtp-Source: ABdhPJx6KpoxFqJunopKg0aZx1eVD0xiLaBeT20RCtO0JBZj3ylcyLWZ02KUNO6RMByWlE7o7bUCn71bWOq8vGUaeeM=
X-Received: by 2002:a02:1a06:: with SMTP id 6mr62592045jai.8.1594144422339;
 Tue, 07 Jul 2020 10:53:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200701183949.398134-1-atish.patra@wdc.com>
In-Reply-To: <20200701183949.398134-1-atish.patra@wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 7 Jul 2020 10:43:54 -0700
Message-ID: <CAKmqyKP_n9dcHcapZrnS=xHAKJ=9cU-n9n_xdaBi2c3UCc_jxA@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] Add OpenSBI dynamic firmware support
To: Atish Patra <atish.patra@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Alexander Richardson <Alexander.Richardson@cl.cam.ac.uk>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d44;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd44.google.com
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
X-List-Received-Date: Tue, 07 Jul 2020 17:53:45 -0000

On Wed, Jul 1, 2020 at 11:40 AM Atish Patra <atish.patra@wdc.com> wrote:
>
> This series adds support OpenSBI dynamic firmware support to Qemu.
> Qemu loader passes the information about the DT and next stage (i.e. kernel
> or U-boot) via "a2" register. It allows the user to build bigger OS images
> without worrying about overwriting DT. It also unifies the reset vector code
> in rom and dt placement. Now, the DT is copied directly in DRAM instead of ROM.
>
> The changes have been verified on following qemu machines.
>
> 64bit:
>  - spike, sifive_u, virt
> 32bit:
>  - virt
>
> I have also verified fw_jump on all the above platforms to ensure that this
> series doesn't break the existing setup.
>
> Changes from v3->v4:
> 1. Addressed all review comments.
> 2. Added another patch that allows to boot a qemu machine from 64bit
>    start address for RV64.
>
> Changes from v2->v3:
> 1. Removed redundant header includes.
>
> Changes from v1->v2:
> 1. Rebased on top of latest upstream Qemu (with MSEL changes for sifive_u).
> 2. Improved the code organization
>
> Atish Patra (4):
> riscv: Unify Qemu's reset vector code path
> RISC-V: Copy the fdt in dram instead of ROM
> riscv: Add opensbi firmware dynamic support
> RISC-V: Support 64 bit start address

Thanks!

Applied to riscv-to-apply.next

Alistair

>
> hw/riscv/boot.c                 | 107 ++++++++++++++++++++++++++++++++
> hw/riscv/sifive_u.c             |  51 +++++++++------
> hw/riscv/spike.c                |  57 +++++------------
> hw/riscv/virt.c                 |  55 +++++-----------
> include/hw/riscv/boot.h         |   7 +++
> include/hw/riscv/boot_opensbi.h |  58 +++++++++++++++++
> 6 files changed, 236 insertions(+), 99 deletions(-)
> create mode 100644 include/hw/riscv/boot_opensbi.h
>
> --
> 2.26.2
>
>

