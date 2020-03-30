Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jIxME-00082o-Kd
	for mharc-qemu-riscv@gnu.org; Mon, 30 Mar 2020 12:33:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50442)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1jIxMC-0007yj-Dj
 for qemu-riscv@nongnu.org; Mon, 30 Mar 2020 12:33:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1jIxMB-0003nF-7N
 for qemu-riscv@nongnu.org; Mon, 30 Mar 2020 12:33:48 -0400
Received: from mail-vs1-xe44.google.com ([2607:f8b0:4864:20::e44]:44313)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1jIxMB-0003mQ-1K; Mon, 30 Mar 2020 12:33:47 -0400
Received: by mail-vs1-xe44.google.com with SMTP id e138so11395671vsc.11;
 Mon, 30 Mar 2020 09:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rDH/q2GpPZxjL8l3Amg8ZAoZYm6+vI648wqMKokJJFg=;
 b=r/q7JgTQmNyPD06a384M5qxfFGk2tt9KzDvtC1YSWWtzR4XQev6ayWeO6e0p1oT4MO
 nREmp7J3/r+GYGwVAgv715sNwMAxp4+RO7X5OocKFHw/fEzFjrLgptOIz/BrddFIqXPe
 myz0Zf1MrOPG5EfM8vNdjhaywaJPQVqxA0aCTuVtiKz43SARQ4DedxfkhUiEtj32HNW8
 A6n3jIpCDpSrrIDC+hQZriPX2Ic9JKz+9Bbr8AN5DN1s7LrFsfPIuY+4vJJ4au0Yvom4
 99Ws1HIRDZyqhkHvoHNVn0V4s9QboPyrzaQjIbFq1Oofjs6ynoK851dF9rWlg88mkbLv
 Oe3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rDH/q2GpPZxjL8l3Amg8ZAoZYm6+vI648wqMKokJJFg=;
 b=jFMNlTMJtLe8vG/84pdejQNbSfwP2aEoPeadgOpczW6vDBWFvJU9/Y95n0pQALUnHL
 aaO/xdGKD58OALTgivY8lJxPh1JhiU1QW+tIuLsosPPsW8DzLxxuaWlkPNO1e/cd08II
 u6JPhetzjruqXaXiiM0y1jp2ub8JnoKuC0N9GG16AFxv0Zs4MkQGagQm2dcObdCGu5Sz
 DEIyXdeoeTGxEiiBfKf6W2npfOYvXc3xLens4wny2VgDOIvsu8BaaLvujZvnHPakG31g
 vzUhGLvpTD4yrT3dHudvGNd6X0h9skOwfHLO9+oQNOueOJVrIhqmSsitxXgfKCSPFr9/
 qrgA==
X-Gm-Message-State: AGi0PuY8SoS/x80JMPT9G11OAs6RYUcR22tfwZuAlLkwffLQB9uwZa9I
 dFybPPYlBhzCKC0T/zQU4dZB9hQ7E4h7/FSVmU0=
X-Google-Smtp-Source: APiQypLiIa5AVHmRz+e8Dme7+u8bT0kZDsMioNK0dq3p281EOcak8sWZGhT2CTUqHv1craNa+Fs1OINKLU+9lp7MYR4=
X-Received: by 2002:a05:6102:730:: with SMTP id
 u16mr1893152vsg.70.1585586026088; 
 Mon, 30 Mar 2020 09:33:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200330082724.120444-1-anup.patel@wdc.com>
In-Reply-To: <20200330082724.120444-1-anup.patel@wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 30 Mar 2020 09:25:38 -0700
Message-ID: <CAKmqyKMwso5-O3kZVt2oBA9y1BAGNYttzKqWkoU2V5VXi63uHg@mail.gmail.com>
Subject: Re: [PATCH] riscv: Fix Stage2 SV32 page table walk
To: Anup Patel <anup.patel@wdc.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Atish Patra <atish.patra@wdc.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Anup Patel <anup@brainfault.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::e44
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
X-List-Received-Date: Mon, 30 Mar 2020 16:33:50 -0000

On Mon, Mar 30, 2020 at 1:28 AM Anup Patel <anup.patel@wdc.com> wrote:
>
> As-per RISC-V H-Extension v0.5 draft, the Stage2 SV32 page table has
> 12bits of VPN[1] and 10bits of VPN[0]. The additional 2bits in VPN[1]
> is required to handle the 34bit intermediate physical address coming
> from Stage1 SV32 page table. The 12bits of VPN[1] implies that Stage2
> SV32 level-0 page table will be 16KB in size with total 4096 enteries
> where each entry maps 4MB of memory (same as Stage1 SV32 page table).
>
> The get_physical_address() function is broken for Stage2 SV32 level-0
> page table because it incorrectly computes output physical address for
> Stage2 SV32 level-0 page table entry.
>
> The root cause of the issue is that get_physical_address() uses the
> "widened" variable to compute level-0 physical address mapping which
> changes level-0 mapping size (instead of 4MB). We should use the
> "widened" variable only for computing index of Stage2 SV32 level-0
> page table.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu_helper.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 50e13a064f..bc80aa87cf 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -559,12 +559,7 @@ restart:
>              /* for superpage mappings, make a fake leaf PTE for the TLB's
>                 benefit. */
>              target_ulong vpn = addr >> PGSHIFT;
> -            if (i == 0) {
> -                *physical = (ppn | (vpn & ((1L << (ptshift + widened)) - 1))) <<
> -                             PGSHIFT;
> -            } else {
> -                *physical = (ppn | (vpn & ((1L << ptshift) - 1))) << PGSHIFT;
> -            }
> +            *physical = (ppn | (vpn & ((1L << ptshift) - 1))) << PGSHIFT;
>
>              /* set permissions on the TLB entry */
>              if ((pte & PTE_R) || ((pte & PTE_X) && mxr)) {
> --
> 2.17.1
>
>

