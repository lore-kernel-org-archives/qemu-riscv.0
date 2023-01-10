Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pFNNa-0006Mr-WD
	for mharc-qemu-riscv@gnu.org; Tue, 10 Jan 2023 17:46:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pFNNO-0006KD-Of; Tue, 10 Jan 2023 17:45:54 -0500
Received: from mail-ua1-x92b.google.com ([2607:f8b0:4864:20::92b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pFNNM-0003EL-Pb; Tue, 10 Jan 2023 17:45:50 -0500
Received: by mail-ua1-x92b.google.com with SMTP id z3so3221575uao.9;
 Tue, 10 Jan 2023 14:45:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2S4szICChH5NVreMnM7NLvAxGh2KYylkEgv2UlEf/OE=;
 b=qsXUulaArwG0MK2Yvs5p9dKUJhHk8Yv0k2wJ31vv3forM/vsuKnX0YY8KIncdPUgWI
 eHoVu09g0fHGJnOL3V3frM2Y1pSyPbaQA8/bUd//24gZdrojVOEVn4NWL4opCDqJ80DH
 Y1GJmilupWzQp7FfNAqpfqY/uae1i0tXWviMwLBvdy11pVQNt+xv0IroGlSBJrfcjsUV
 hRURPsFV/q2t9pVpFa+0HeeQnl7MLSDtqjFZyaOdlPHqpGVpI9OoIEk+Chu+iEyR71CY
 U/1gH9jtCyoIi1mIP6OmXOwcPjm2ylDyLDyLGmc/sLBF8Ekkq7af8uhjWxjOJBPu6gmO
 h9XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2S4szICChH5NVreMnM7NLvAxGh2KYylkEgv2UlEf/OE=;
 b=0PHxT0pBa1UPc557O0cbZpHh8zD8suePzr+hcwipJtOVmFVbNchgZZ2N0Clxr9+sDO
 DviVXiqowLafB93w93OP/pQoi5+If0Z6rVMLSvb+WvHr8oTu7FZ1fBsuckW0QeLHH0d4
 1hGlOrLTLoh89IbFmxVx4FI99dvxlNcA5iTkp6GLZlJzmomWo1Mcadb1X2KOHTz5WDrR
 zgN8QQWYkOB1YoZAoI163DlkmjgDxsLCxWEUcv74h2AJvil6I3xCNNeMyqCflx/7BPWU
 wevQWciRnZ4E3BamzQE26riYpZMzzniqu0u8+JxZZxYjbPNif8AzFfH4Vy7ldcgT0siK
 MbNQ==
X-Gm-Message-State: AFqh2kqfbRQV+ad/AMPKxPDQqUtYpEvkZzTmfxc+o8W4NhqTaahF+WyA
 PvBBP8kRKJ1tqgmSdUDE2C+VzggMrxCLANCSucFBXPg8osesOg==
X-Google-Smtp-Source: AMrXdXsJmjsHhxBZxbibQ0t8O9NSrIan/vKWNp2HOnmtmAJ7vzJIpO8g1VkA05UM+qenPNPpoq7W3zSQKHgP8knOv4Q=
X-Received: by 2002:a9f:3191:0:b0:419:1fa3:9618 with SMTP id
 v17-20020a9f3191000000b004191fa39618mr8647370uad.11.1673390747277; Tue, 10
 Jan 2023 14:45:47 -0800 (PST)
MIME-Version: 1.0
References: <20230102115241.25733-1-dbarboza@ventanamicro.com>
 <20230102115241.25733-11-dbarboza@ventanamicro.com>
 <CAEUhbmUfWbssTO1w8q_VdrWDHE4JLdJvZGkkt_w+KChsR5P32g@mail.gmail.com>
 <1adba771-6632-4f68-d72f-4389f9ce7012@ventanamicro.com>
 <842056c4-4f77-0db7-fa89-e3973b81bd23@ventanamicro.com>
In-Reply-To: <842056c4-4f77-0db7-fa89-e3973b81bd23@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 11 Jan 2023 08:45:21 +1000
Message-ID: <CAKmqyKObbNM9mdxH1O5XxmchFUYrCi9YAGV=Tb3THnqn6p2TSA@mail.gmail.com>
Subject: Re: [PATCH v5 10/11] hw/riscv/boot.c: consolidate all kernel init in
 riscv_load_kernel()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 alistair.francis@wdc.com, Bin Meng <bin.meng@windriver.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::92b;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92b.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 10 Jan 2023 22:46:00 -0000

On Wed, Jan 11, 2023 at 6:21 AM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
>
>
> On 1/10/23 08:43, Daniel Henrique Barboza wrote:
> >
> >
> > On 1/8/23 00:33, Bin Meng wrote:
> >> On Mon, Jan 2, 2023 at 7:55 PM Daniel Henrique Barboza
> >> <dbarboza@ventanamicro.com> wrote:
> >>> The microchip_icicle_kit, sifive_u, spike and virt boards are now doing
> >>> the same steps when '-kernel' is used:
> >>>
> >>> - execute load_kernel()
> >>> - load init_rd()
> >>> - write kernel_cmdline
> >>>
> >>> Let's fold everything inside riscv_load_kernel() to avoid code
> >>> repetition. To not change the behavior of boards that aren't calling
> >>> riscv_load_init(), add an 'load_initrd' flag to riscv_load_kernel() and
> >> typo: should be riscv_load_initrd()
> >>
> >>> allow these boards to opt out from initrd loading.
> >>>
> >>> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> >>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> >>> ---
> >>>   hw/riscv/boot.c            | 22 +++++++++++++++++++---
> >>>   hw/riscv/microchip_pfsoc.c | 12 ++----------
> >>>   hw/riscv/opentitan.c       |  2 +-
> >>>   hw/riscv/sifive_e.c        |  3 ++-
> >>>   hw/riscv/sifive_u.c        | 12 ++----------
> >>>   hw/riscv/spike.c           | 11 +----------
> >>>   hw/riscv/virt.c            | 12 ++----------
> >>>   include/hw/riscv/boot.h    |  1 +
> >>>   8 files changed, 30 insertions(+), 45 deletions(-)
> >>>
> >> Otherwise,
> >> Reviewed-by: Bin Meng <bmeng@tinylab.org>
> >
> > Thanks!
> >
> > Alistair, let me know if you want me to send another version with the commit
> > message typo fixed. I might as well take the change to rebase it with
> > riscv-to-apply.next.
>
> While rebasing these patches on top of riscv-to-apply.next, the avocado tests
> I've introduced here started to fail both sifive_u tests:
>
> tests/avocado/riscv_opensbi.py:RiscvOpenSBI.test_riscv32_sifive_u: INTERRUPTED:
> Test interrupted by SIGTERM\nRunner error occurred: ... (5.07 s)
>   (09/18) tests/avocado/riscv_opensbi.py:RiscvOpenSBI.test_riscv64_sifive_u: INTERRUPTED:
> Test interrupted by SIGTERM\nRunner error occurred: ... (5.05 s)
>
>
> I proposed a fix here:
>
> https://lists.gnu.org/archive/html/qemu-devel/2023-01/msg02035.html

Thanks!

I generally push riscv-to-apply.next before running tests, so it's
possible to break. I'm seeing similar failures.

Generally when I see failures from a series I just drop the series,
but if you have a fix that's even better :)

Alistair

>
> I can re-send this series after we get that problem figure out. Otherwise we're
> going to add 2 avocado tests that are failing right from the start hehe.
>
> Thanks,
>
> Daniel
>
>
> >
> >
> > Daniel
> >
>
>

