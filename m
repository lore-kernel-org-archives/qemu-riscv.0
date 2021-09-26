Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mUPZT-0004QT-KR
	for mharc-qemu-riscv@gnu.org; Sun, 26 Sep 2021 04:31:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mUPZR-0004Lv-Mx; Sun, 26 Sep 2021 04:31:37 -0400
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d]:44908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mUPZQ-0007gy-Bu; Sun, 26 Sep 2021 04:31:37 -0400
Received: by mail-yb1-xb2d.google.com with SMTP id f133so16309901yba.11;
 Sun, 26 Sep 2021 01:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5Qu0DOKd5rNRnL1fYAGoi0Rzzu/vdXZUwph/4Sm9V9U=;
 b=WP+0ck6xRRMcC4iznASLF9JjRqBR/uCnWOAikf9l/XcKXu/gJkD7UbzzVwWx1ywRVZ
 Eru5VdA/l3Oq2d/f6rFqPyOimUHsyg2bLIYxOag2j7rBNrT6E5iP+HkVBx3s4XakqSJH
 8K6A+QS3MkT2tM9PtpeAanGjDWE4PttAuIv9bHr763IACgWLRJXc63ee7I9R8KcgO4t6
 jYDCrR8OhmDSF11vRRcGz48r6w86H4UE6no9USFRK58oA3okeXsxHHt/kV8RxttfX6EJ
 X7OfGFA+34+gDM93dzlgQW9NVxpT7ve2YmLILDRO3QnETeklukg5mWBnkrM1UomOzuv0
 E4xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5Qu0DOKd5rNRnL1fYAGoi0Rzzu/vdXZUwph/4Sm9V9U=;
 b=GFkg+UAhyD71Xl6Fm8beK+2SDipq9I5NltKBLaXQrJEsbygzfCEypFKpFMrU0aZjFP
 WmVd2KzrIES4CcvsNw29SaJ6awJG4BHBzPlM+tX+018JkvH1ruPQUK0NkoFr0VBbZxPQ
 o7uBoOmbuc67Fm5/m8HnEP3iOR7Tan21oFp/puPBYeG9A3aW4xkwpR4Yqn+vbuc+fHzZ
 97MvTEBFPLQe7hIEM+TiqgcTjJi0qlo73EmO9Jo1dpa4X6NMW9oS8AoZ1yIpDEyA4wG9
 U9Ud0+XddcaUB3aLuIA4JWn73KDMtj9HhW2qXxkZ++vR/Y5sVrVEfiL0VQnQu/bPBAl8
 DbTQ==
X-Gm-Message-State: AOAM530qYc/ER9FQac8knQl99CjoikYFt+MGm2tAuxpUYEnoSlwiTst+
 TRIhdkJJ5hWNkGoTf0y1UR4YxYr6E5I+JK8IgjM=
X-Google-Smtp-Source: ABdhPJywgaHddOhsTqbdUrjhVwlJfUHt3IFCF1sZ+jns8GWdPvIgYrQjW2b9aWTY9P0k0VQdzehOORZ/Jf+/eh3xmZ0=
X-Received: by 2002:a05:6902:70b:: with SMTP id
 k11mr24057834ybt.313.1632645095300; 
 Sun, 26 Sep 2021 01:31:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210925133407.1259392-1-f4bug@amsat.org>
 <20210925133407.1259392-3-f4bug@amsat.org>
In-Reply-To: <20210925133407.1259392-3-f4bug@amsat.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 26 Sep 2021 16:31:24 +0800
Message-ID: <CAEUhbmXRbX8mXAKaThqic8wV_ia2wo_yQA8Og-uYhEfazrvueQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] hw/char/mchp_pfsoc_mmuart: Use a MemoryRegion
 container
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <alistair23@gmail.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Sun, 26 Sep 2021 08:31:38 -0000

On Sat, Sep 25, 2021 at 9:37 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> Our device have 2 different I/O regions:
> - a 16550 UART mapped for 32-bit accesses
> - 13 extra registers
>
> Instead of mapping each region on the main bus, introduce
> a container, map the 2 devices regions on the container,
> and map the container on the main bus.
>
> Before:
>
>   (qemu) info mtree
>     ...
>     0000000020100000-000000002010001f (prio 0, i/o): serial
>     0000000020100020-000000002010101f (prio 0, i/o): mchp.pfsoc.mmuart
>     0000000020102000-000000002010201f (prio 0, i/o): serial
>     0000000020102020-000000002010301f (prio 0, i/o): mchp.pfsoc.mmuart
>     0000000020104000-000000002010401f (prio 0, i/o): serial
>     0000000020104020-000000002010501f (prio 0, i/o): mchp.pfsoc.mmuart
>     0000000020106000-000000002010601f (prio 0, i/o): serial
>     0000000020106020-000000002010701f (prio 0, i/o): mchp.pfsoc.mmuart
>
> After:
>
>   (qemu) info mtree
>     ...
>     0000000020100000-0000000020100fff (prio 0, i/o): mchp.pfsoc.mmuart
>       0000000020100000-000000002010001f (prio 0, i/o): serial
>       0000000020100020-0000000020100fff (prio 0, i/o): mchp.pfsoc.mmuart.=
regs
>     0000000020102000-0000000020102fff (prio 0, i/o): mchp.pfsoc.mmuart
>       0000000020102000-000000002010201f (prio 0, i/o): serial
>       0000000020102020-0000000020102fff (prio 0, i/o): mchp.pfsoc.mmuart.=
regs
>     0000000020104000-0000000020104fff (prio 0, i/o): mchp.pfsoc.mmuart
>       0000000020104000-000000002010401f (prio 0, i/o): serial
>       0000000020104020-0000000020104fff (prio 0, i/o): mchp.pfsoc.mmuart.=
regs
>     0000000020106000-0000000020106fff (prio 0, i/o): mchp.pfsoc.mmuart
>       0000000020106000-000000002010601f (prio 0, i/o): serial
>       0000000020106020-0000000020106fff (prio 0, i/o): mchp.pfsoc.mmuart.=
regs
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  include/hw/char/mchp_pfsoc_mmuart.h |  1 +
>  hw/char/mchp_pfsoc_mmuart.c         | 11 ++++++++---
>  2 files changed, 9 insertions(+), 3 deletions(-)
>

Reviewed-by: Bin Meng <bin.meng@windriver.com>
Tested-by: Bin Meng <bin.meng@windriver.com>

