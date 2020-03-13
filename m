Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jClWe-0006Ep-19
	for mharc-qemu-riscv@gnu.org; Fri, 13 Mar 2020 10:43:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37602)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bmeng.cn@gmail.com>) id 1jClWb-000690-Av
 for qemu-riscv@nongnu.org; Fri, 13 Mar 2020 10:42:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1jClWa-0004IU-CF
 for qemu-riscv@nongnu.org; Fri, 13 Mar 2020 10:42:57 -0400
Received: from mail-qk1-x741.google.com ([2607:f8b0:4864:20::741]:34107)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1jClWY-0004EB-42; Fri, 13 Mar 2020 10:42:54 -0400
Received: by mail-qk1-x741.google.com with SMTP id f3so12861446qkh.1;
 Fri, 13 Mar 2020 07:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Lhs5M5RF6Irfg5/8Tr2QKI3TibURWqz0tQXtnJQFmiQ=;
 b=P+bB1Up9lLBMBTbnwhXno66SDsfTzpDUn1gvrFWiPfLHMhPB42LpqgqKT0paOXcnpD
 9yS5kcAJDeon/NTOrr5Ef8UXDA9VfTohtpC7UWX7uT1+otYZWCbr35JWyObceqhstJkD
 Y1wEW/paatMM+BjW73iEkoHCsrObA7NiOgyt69HLdG9foIRFjP2yp9PQ/S6F4tQaf8m1
 iFC27SEGOXAYGBOA2cPETUP/c8aJHmmVY7VyP4ub4RIZdOYMjaLBjQpZd4VuAwU2kC3D
 kyDMSFa9q1LhUvx7bOzF7LKMUnb9RiER2s1FuhB71eBfcRYTLizrhehZCTWJ3Mhh47Y4
 6oBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Lhs5M5RF6Irfg5/8Tr2QKI3TibURWqz0tQXtnJQFmiQ=;
 b=Jt0XgCCLJlg6Zn0x4s+Vr7DeYp+8Dvcpr01QHBRNP1Ya1yZ6TrXYkAnLIHgXy8aE/M
 4qpsZiDZ8Of2qoxR9hACvWQ5ElREetOT+aPTYQdN9oePNCjJujfVvkiJdjVHLEt8wpAU
 UW3pezZZpAz0WaGu2A25PCMOiPXxWJ8Uvc+PmJ90NF3chEeKobEa+Sc05lHFqoGQ05md
 cySp0rCTuNb7HBWBC/QzsgwDevn1XdLfMsyiXKmAP+BqAcYw0XNtNuw4AKafZ7hHTWkK
 12CEkr9qnyEaTCWtb3/f4EC5x4uBgV0jXlNn1myXvytirw8F9JqXN5wd+ZvZ2UKau/a3
 7bQg==
X-Gm-Message-State: ANhLgQ1a7ygbPAG4rtQf4tEhx6wDr1V68Rn1ucJ2bdym63T4ibOwLo6U
 tKQinykwfvlDAOIJS3wrO/r9F6Tx2TXWFhG3b+4=
X-Google-Smtp-Source: ADFU+vuKC5EMT5QTHxKxYuKJKIgoBVW37c0lpgzbJLCbZUWztjLJ5NGGpG/jn6Ew7BMrptaNL/rWwkvbNkF6sJUCzMs=
X-Received: by 2002:a25:e7c5:: with SMTP id e188mr15706035ybh.65.1584110573124; 
 Fri, 13 Mar 2020 07:42:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200313005508.1906-1-coreyw7@fb.com>
 <20200313005508.1906-3-coreyw7@fb.com>
In-Reply-To: <20200313005508.1906-3-coreyw7@fb.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 13 Mar 2020 22:42:42 +0800
Message-ID: <CAEUhbmVwSgXMUM9kwby5quRfye-N4aPkB=wOA75m9fwmuKE4HA@mail.gmail.com>
Subject: Re: [PATCH 2/2] target/riscv: Add a sifive-e34 cpu type
To: Corey Wharton <coreyw7@fb.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::741
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
X-List-Received-Date: Fri, 13 Mar 2020 14:42:58 -0000

On Fri, Mar 13, 2020 at 9:00 AM Corey Wharton <coreyw7@fb.com> wrote:
>
> The sifive-e34 cpu type is the same as the sifive-e31 with the
> single precision floating-point extension enabled.
>
> Signed-off-by: Corey Wharton <coreyw7@fb.com>
> ---
>  target/riscv/cpu.c | 10 ++++++++++
>  target/riscv/cpu.h |  1 +
>  2 files changed, 11 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index c0b7023100..d415cd06eb 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -164,6 +164,15 @@ static void rv32imacu_nommu_cpu_init(Object *obj)
>      set_feature(env, RISCV_FEATURE_PMP);
>  }
>
> +static void rv32imafcu_nommu_cpu_init(Object *obj)
> +{
> +    CPURISCVState *env = &RISCV_CPU(obj)->env;
> +    set_misa(env, RV32 | RVI | RVM | RVA | RVF | RVC);

This is missing RVU.

> +    set_priv_version(env, PRIV_VERSION_1_10_0);
> +    set_resetvec(env, DEFAULT_RSTVEC);
> +    set_feature(env, RISCV_FEATURE_PMP);
> +}
> +
>  #elif defined(TARGET_RISCV64)
>

[snip]

Regards,
Bin

