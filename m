Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iCuOO-0001BC-Dd
	for mharc-qemu-riscv@gnu.org; Tue, 24 Sep 2019 19:38:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53798)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1iCuOK-00019h-6D
 for qemu-riscv@nongnu.org; Tue, 24 Sep 2019 19:38:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1iCuOJ-0005qb-2l
 for qemu-riscv@nongnu.org; Tue, 24 Sep 2019 19:38:44 -0400
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142]:35522)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1iCuOB-0005q0-2Y; Tue, 24 Sep 2019 19:38:35 -0400
Received: by mail-lf1-x142.google.com with SMTP id w6so2718440lfl.2;
 Tue, 24 Sep 2019 16:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=O7OXBq3GJHcDeHuw8Xe56ZoJpLWvGCzQo3fbzFjvtXM=;
 b=tdJ7qQQ10bApF4NoCrXARm99Fw+HEejqLe0V8MPc1czCxOimyu4TWHK+ZKE5m1rd6n
 0x3PtGMUIDzWS8tdw5pjCa2+Oj2Z+Rm0bqkGV+VPCR6gjCxDXuNnQDBimhsxI1GecevN
 svoVjSMXFr5wGALDEJLuUZN3rq9arE8DhHrh55fsmhfXzal86zaI8wDOQATQ7hcMGn1K
 xNACxAc0ubTUWjDt6tppclnIRJH0Fk7sCVfg13FXrqtPEEFEkSts3fZQNsubGhUs6s/O
 xUO2ZIw04eEh3c5JUrxCP/2k8PrbebVhO7kYl5Xz+8l1pVXgww54oTLpvJVsRssGNbIv
 Jvwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O7OXBq3GJHcDeHuw8Xe56ZoJpLWvGCzQo3fbzFjvtXM=;
 b=IKNS/xbXB1gF1Eq0s1y6p2L0nrlYzp4Gud5jHi67TZAWTeY7jx2dtxdHNexw/o6OEt
 msGG0Bp+lwY2mrG7WzmI03d5QyF3D8uR4NE/Icu9Wvmwh6u0aaugwUA9hyDQvzt1OxDA
 itDUSKnGX3GpkQT62TTrO6IBTTQ8u4Utg5rV0G97Q+DZsSCTqhC8vl53ScNY6gJ6kO8N
 +GLyAKyZBS4zz7rTifz8PZWFAGMejcQpgJVvcnzevmj7YtXxESYmNsK9Ub4Ny9FoCvdS
 pm09W615RzgZvIA9w7wJY7p+IOLbLAQgdaVnBEkJ20pqGckLJO3yvhpd0Li5WeGkQKmd
 wi7g==
X-Gm-Message-State: APjAAAUmBvbS7/7uMM2VtKZR3lnxF4UejSvyWSVmTajrl+BpwW/s9F7l
 7T3iwawtQPXAXTLVMZmeJQ4syGKtpKp3c4S0mGA=
X-Google-Smtp-Source: APXvYqyDljoD0U1sOS6WaHxuZ/kFsrDEa1FjerIWlcF6xcj9ml/pQg2ItCpR5PwppBX6qzIOAH8x0ioGSH75vElurpY=
X-Received: by 2002:ac2:5e9e:: with SMTP id b30mr3512334lfq.5.1569368313639;
 Tue, 24 Sep 2019 16:38:33 -0700 (PDT)
MIME-Version: 1.0
References: <1569311902-12173-1-git-send-email-guoren@kernel.org>
In-Reply-To: <1569311902-12173-1-git-send-email-guoren@kernel.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 24 Sep 2019 16:33:51 -0700
Message-ID: <CAKmqyKMzpTKBT+urX_7qFASqcAd4kkfJmf6LUk-0V=0LOuHLxw@mail.gmail.com>
Subject: Re: [PATCH V2] target/riscv: Bugfix reserved bits in PTE for RV64
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
X-List-Received-Date: Tue, 24 Sep 2019 23:38:45 -0000

On Tue, Sep 24, 2019 at 12:58 AM <guoren@kernel.org> wrote:
>
> From: Guo Ren <ren_guo@c-sky.com>
>
> Highest 10 bits of PTE are reserved in riscv-privileged, ref: [1], so we
> need to ignore them. They can not be a part of ppn.
>
> 1: The RISC-V Instruction Set Manual, Volume II: Privileged Architecture
>    4.4 Sv39: Page-Based 39-bit Virtual-Memory System
>    4.5 Sv48: Page-Based 48-bit Virtual-Memory System

Thanks for the patch!

The spec says "must be zeroed by software for forward compatibility"
so I don't think it's correct for QEMU to zero out the bits.

Does this fix a bug you are seeing?

>
> Changelog V2:
>  - Bugfix pte destroyed cause boot fail
>  - Change to AND with a mask instead of shifting both directions

The changelog shouldn't be in the commit, it should be kept under the
line line below.

>
> Signed-off-by: Guo Ren <ren_guo@c-sky.com>
> Reviewed-by: Liu Zhiwei <zhiwei_liu@c-sky.com>
> ---

The change log should go here.

>  target/riscv/cpu_bits.h   | 3 +++
>  target/riscv/cpu_helper.c | 3 ++-
>  2 files changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index e998348..ae8aa0f 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -470,6 +470,9 @@
>  #define PTE_D               0x080 /* Dirty */
>  #define PTE_SOFT            0x300 /* Reserved for Software */
>
> +/* Reserved highest 10 bits in PTE */
> +#define PTE_RESERVED        ((target_ulong)0x3ff << 54)

I think it's just easier to define this as 0xFFC0000000000000ULL and
remove the cast.

> +
>  /* Page table PPN shift amount */
>  #define PTE_PPN_SHIFT       10
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 87dd6a6..7a540cc 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -258,10 +258,11 @@ restart:
>          }
>  #if defined(TARGET_RISCV32)
>          target_ulong pte = ldl_phys(cs->as, pte_addr);
> +        hwaddr ppn = pte >> PTE_PPN_SHIFT;
>  #elif defined(TARGET_RISCV64)
>          target_ulong pte = ldq_phys(cs->as, pte_addr);
> +        hwaddr ppn = (pte & ~PTE_RESERVED) >> PTE_PPN_SHIFT;
>  #endif
> -        hwaddr ppn = pte >> PTE_PPN_SHIFT;

You don't have to move this shift

>
>          if (!(pte & PTE_V)) {
>              /* Invalid PTE */
> --
> 2.7.4
>

