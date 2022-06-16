Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o1hgH-00042U-Vu
	for mharc-qemu-riscv@gnu.org; Thu, 16 Jun 2022 01:04:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1o1hgF-0003xB-Ca; Thu, 16 Jun 2022 01:04:31 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:33395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1o1hgD-0003hd-Q6; Thu, 16 Jun 2022 01:04:31 -0400
Received: by mail-pf1-x434.google.com with SMTP id w21so527341pfc.0;
 Wed, 15 Jun 2022 22:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wlp6jPt5Y1RhTSG2IoEIG63BFmtkMFVpKd7JJfTnRTc=;
 b=XJON5N4ZhLS1ItYabiZNPvYfwzXAeRUXEJuVWHe76tLELCP+uYZX78x94XFTqpEFXW
 oG3eBAVmp6UZY9ekp2Mmp/Szv/IMvpguZ1MgMWbr30fng1fJu8sIpSHV/2bHwgr07paE
 huJg9srIC2/EGgYjDFVj55J6CsDwoGaVKYH7s/7wWA7uEv4fPgBqTpOR3Evjt0PE+T4j
 ecAclA6vBKWeoZnXgvxUTNXTRPOPwVuoXkE4TbeqRkiRhUZvll8FvMBQ7lIetsDspJMZ
 yEJ+AFUriycaamqxHYkxnAlvGBYuORK+ICaCNL9hEACDKKozcfx1cSBdqMVKDCy3D7mT
 Y0MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wlp6jPt5Y1RhTSG2IoEIG63BFmtkMFVpKd7JJfTnRTc=;
 b=Bc+dQFXtwhiLJ2ALq3duhM2xMbYmHi1lOvqGs5qS6xwWWqXejvH9/wT3QLiThtTBuo
 6L/3+js8f0usUFO/88jSggWKhHZpRsLTwa4PXwAy+2nQW6NE86Xiw4aRnyTveVXqyiYs
 Ksecm/xZ6GyOLpbX5bexem8jcCAjizIdTsEcP2qiHrqBFaPouRG4VRZNl2kxm7bBTujp
 hmB3K8b4e7PXKjsdBKekztoa0cN6DSaygZ99n2RPbzMIvAmhpOVIYLmba6RoaE+GB69J
 5gHpAcRTtPjLim5pt7fSdZD+3HTf+KgoZSsrOVN1vEklAuUj0IUBrlKM4CQf7g1q6H0m
 o9wQ==
X-Gm-Message-State: AJIora9x0+qHo0IMqT3G8Ykt7IR/qoZv259gUlOtTsyJHWruKX2h6JYV
 ctf3arluIAPxyCxwMkeeRKJqBo0smcZ9SoZbgnU=
X-Google-Smtp-Source: AGRyM1tZ19HhpqliQOF8PDi3ibQH0OOvPTu9W+wEKQ52Gx9nmFKhnl/b1GFVYmar5Jenfx78skoaHhE/F1wx8eCjAiE=
X-Received: by 2002:a65:5385:0:b0:3fa:52e3:6468 with SMTP id
 x5-20020a655385000000b003fa52e36468mr2904601pgq.366.1655355867969; Wed, 15
 Jun 2022 22:04:27 -0700 (PDT)
MIME-Version: 1.0
References: <3oq0sqs1-67o0-145-5n1s-453o118804q@syhkavp.arg>
In-Reply-To: <3oq0sqs1-67o0-145-5n1s-453o118804q@syhkavp.arg>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 16 Jun 2022 15:04:00 +1000
Message-ID: <CAKmqyKPJ2Pxn8nG3Lwu2rLGuTZyTmGvjWOqbty8C6ayhtd0wqw@mail.gmail.com>
Subject: Re: [PATCH] target/riscv/pmp: guard against PMP ranges with a
 negative size
To: Nicolas Pitre <nico@fluxnic.net>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=alistair23@gmail.com; helo=mail-pf1-x434.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 16 Jun 2022 05:04:31 -0000

On Thu, Jun 16, 2022 at 7:12 AM Nicolas Pitre <nico@fluxnic.net> wrote:
>
> For a TOR entry to match, the stard address must be lower than the end
> address. Normally this is always the case, but correct code might still
> run into the following scenario:
>
> Initial state:
>
>         pmpaddr3 = 0x2000       pmp3cfg = OFF
>         pmpaddr4 = 0x3000       pmp4cfg = TOR
>
> Execution:
>
>         1. write 0x40ff to pmpaddr3
>         2. write 0x32ff to pmpaddr4

Hey, thanks for that patch!

So, at this point we have a PMP region enforcing

0x40ff <= addr < 0x32ff

which is going to be wrong as that isn't valid. But this is also
partially a guest bug. If a guest sets invalid PMP regions we should
be throwing exceptions (if the PMP region is enabled and enforced in
the current mode)

>         3. set pmp3cfg to NAPOT with a read-modify-write on pmpcfg0
>         4. set pmp4cfg to NAPOT with a read-modify-write on pmpcfg1
>
> When (2) is emulated, a call to pmp_update_rule() creates a negative
> range for pmp4 as pmp4cfg is still set to TOR. And when (3) is emulated,

I don't see where the negative comes from. From what I can tell we
should just set `sa` and `ea` to the values specified by the guest.

> a call to tlb_flush() is performed, causing pmp_get_tlb_size() to return
> a very creatively large TLB size for pmp4. This, in turn, may result in

Hmm.. pmp_get_tlb_size() assumes pmp_ea > pmp_sa. Maybe we should add
a check in there?

> accesses to non-existent/unitialized memory regions and a fault, so that
> (4) ends up never being executed.
>
> This is in m-mode with MPRV unset, meaning that unlocked PMP entries
> should have no effect. Therefore such a behavior based on PMP content
> is very unexpected.

Ok, this part is a QEMU bug. If we aren't enforcing PMP regions we
should not be throwing PMP errors.

get_physical_address_pmp() should give us full permissions though in
this case, so I don't see where the failure is. Can you include some
more details?

>
> Make sure no negative PMP range can be created, whether explicitly by
> the emulated code or implicitly like the above.
>
> Signed-off-by: Nicolas Pitre <nico@fluxnic.net>
>
> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> index 151da3fa08..ea2b67d947 100644
> --- a/target/riscv/pmp.c
> +++ b/target/riscv/pmp.c
> @@ -167,6 +167,9 @@ void pmp_update_rule_addr(CPURISCVState *env, uint32_t pmp_index)
>      case PMP_AMATCH_TOR:
>          sa = prev_addr << 2; /* shift up from [xx:0] to [xx+2:2] */
>          ea = (this_addr << 2) - 1u;
> +        if (sa > ea) {
> +            sa = ea = 0u;
> +        }

This doesn't seem right though.

Image if a guest sets the values you have above, then jumps to user
mode. The spec doesn't seem to say what should happen with invalid PMP
ranges, but I feel like we should throw exceptions instead of just
ignoring the config.

Alistair

>          break;
>
>      case PMP_AMATCH_NA4:
>

