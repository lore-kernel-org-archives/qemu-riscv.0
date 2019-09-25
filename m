Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iCziY-0004gF-JZ
	for mharc-qemu-riscv@gnu.org; Wed, 25 Sep 2019 01:19:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55893)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1iCziV-0004du-QZ
 for qemu-riscv@nongnu.org; Wed, 25 Sep 2019 01:19:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1iCziU-0008Ll-N3
 for qemu-riscv@nongnu.org; Wed, 25 Sep 2019 01:19:55 -0400
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142]:34405)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1iCziS-0008Jt-4w; Wed, 25 Sep 2019 01:19:52 -0400
Received: by mail-lf1-x142.google.com with SMTP id r22so3172574lfm.1;
 Tue, 24 Sep 2019 22:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BIYJBh4uKBWAer1BpanL2/Vp1Xwx34pKzBKoZIfIZMQ=;
 b=AglN4vr6OdasRujoBOYVR59BkfKmaky0dnUzI+/u/9EZkxBHaORVi2kGeormxHEUTs
 GSYNoyZakBFW37gxhqnt+vOwFdgmd3jflmsKzJ5J8AJ2wSXz7wetXPtAagSS/OIvhZQN
 XLjP83OU18WfRknTjFw9XJjoHYyOspweiGy77dmsJB+Rd5RT6x6Nko6dchdzwFbmnddx
 esWRSOtQVF3jkkzSHtgbJiysDAb04YsePlWQRZ75GXD14BytZvnMG8Qzgux4d7y+UpRP
 dgoE+BGB4POJgRQ1EoQkTyRfj3IK4Q+pzii1hQtaKxk4n7sbDxODmRkaM7zAogN8gDNg
 RlgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BIYJBh4uKBWAer1BpanL2/Vp1Xwx34pKzBKoZIfIZMQ=;
 b=bLkGgw9Y6d4MW8ufT4y5qI/ZaddbWknu8djAwNdU4X9B+Jjy5GH9E3/4WyKwqwA0cN
 wuuOPh6IcCJU7BiCG61s/cDL9J9FZdv8KgsZ7Y5oO/LJARvajUViZvoglfQDytq2mlMS
 Vuzas6KBvt4qqLD3wr6J20pVsJTpDxlQf/VeOnRiq4PxEqjXyG9+TRSpRvF7qYruRMEp
 QygBqbQUWWHj2lXWgPC4fD0rhrDJU8O6TtmleyPDM88r3CKMsfY5pAYHGN8wxWrGmejr
 umS66M1sVQnJuEqtAk4AkZSRLG8PGgN/Jqohu8P1lK9phgweTcb8PMroGChhPBq6mBU0
 CChw==
X-Gm-Message-State: APjAAAXZW4yjJ8ld1ko1Flru4QV/Uhi28OQD3+ZWI2wA25hBn59Akccu
 R5JR5VooDQb2SfCEVnO6nIjJHiag9gQ9RdtLQPI=
X-Google-Smtp-Source: APXvYqzj+rCiIFjdgK1x37RxQHIZ7Kq1M0AlHQlJq04/0f4oQEBk/ahaOo+fgrzjRat1beiZgHrsgpPDDM1y+hRaCIE=
X-Received: by 2002:a19:48c3:: with SMTP id v186mr4266385lfa.141.1569388790816; 
 Tue, 24 Sep 2019 22:19:50 -0700 (PDT)
MIME-Version: 1.0
References: <1569386895-8726-1-git-send-email-guoren@kernel.org>
In-Reply-To: <1569386895-8726-1-git-send-email-guoren@kernel.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 24 Sep 2019 22:19:21 -0700
Message-ID: <CAKmqyKMraotFmqMg7MrJC5C4SogGqSaVtHkVYTEgGWK9UnWb5g@mail.gmail.com>
Subject: Re: [PATCH V3] target/riscv: Bugfix reserved bits in PTE for RV64
To: guoren@kernel.org
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <alistair.francis@wdc.com>, Palmer Dabbelt <palmer@sifive.com>,
 Guo Ren <ren_guo@c-sky.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::142
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
X-List-Received-Date: Wed, 25 Sep 2019 05:19:57 -0000

On Tue, Sep 24, 2019 at 9:48 PM <guoren@kernel.org> wrote:
>
> From: Guo Ren <ren_guo@c-sky.com>
>
> Highest 10 bits of PTE are reserved in riscv-privileged, ref: [1], so we
> need to ignore them. They can not be a part of ppn.
>
> 1: The RISC-V Instruction Set Manual, Volume II: Privileged Architecture
>    4.4 Sv39: Page-Based 39-bit Virtual-Memory System
>    4.5 Sv48: Page-Based 48-bit Virtual-Memory System

Hey,

As I mentioned on patch 2 I don't think this is right. It isn't up to
HW to clear these bits, software should keep them clear.

Alistair

>
> Signed-off-by: Guo Ren <ren_guo@c-sky.com>
> Reviewed-by: Liu Zhiwei <zhiwei_liu@c-sky.com>
> ---
>  target/riscv/cpu_bits.h   | 3 +++
>  target/riscv/cpu_helper.c | 4 +++-
>  2 files changed, 6 insertions(+), 1 deletion(-)
> ---
> Changelog V3:
>  - Use UUL define for PTE_RESERVED.
>  - Keep ppn >> PTE_PPN_SHIFT
>
> Changelog V2:
>  - Bugfix pte destroyed cause boot fail
>  - Change to AND with a mask instead of shifting both directions
>
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index e998348..cdc62a8 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -470,6 +470,9 @@
>  #define PTE_D               0x080 /* Dirty */
>  #define PTE_SOFT            0x300 /* Reserved for Software */
>
> +/* Reserved highest 10 bits in PTE */
> +#define PTE_RESERVED        0xFFC0000000000000ULL
> +
>  /* Page table PPN shift amount */
>  #define PTE_PPN_SHIFT       10
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 87dd6a6..7e04ff5 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -258,10 +258,12 @@ restart:
>          }
>  #if defined(TARGET_RISCV32)
>          target_ulong pte = ldl_phys(cs->as, pte_addr);
> +        hwaddr ppn = pte;
>  #elif defined(TARGET_RISCV64)
>          target_ulong pte = ldq_phys(cs->as, pte_addr);
> +        hwaddr ppn = pte & ~PTE_RESERVED;
>  #endif
> -        hwaddr ppn = pte >> PTE_PPN_SHIFT;
> +        ppn = ppn >> PTE_PPN_SHIFT;
>
>          if (!(pte & PTE_V)) {
>              /* Invalid PTE */
> --
> 2.7.4
>

