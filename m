Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kpDRW-0007mY-2T
	for mharc-qemu-riscv@gnu.org; Tue, 15 Dec 2020 11:44:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kpDRT-0007mF-7R; Tue, 15 Dec 2020 11:44:51 -0500
Received: from mail-il1-x142.google.com ([2607:f8b0:4864:20::142]:39612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kpDRQ-0006ZS-7b; Tue, 15 Dec 2020 11:44:51 -0500
Received: by mail-il1-x142.google.com with SMTP id q1so19836902ilt.6;
 Tue, 15 Dec 2020 08:44:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6IAP6rCWec5dFdxHSTkj+ozklEm95y9M9ff50kQggU4=;
 b=T1lPPBa5kC+nfaL1/Wve5/Ik18M2seTtQ4VLVZp7pr6BaRabpOBYsJvuC/C9k5RiGo
 XD6WzBvl7XjMJrtYRrTnhN7018b+Bx1hF/4+7RSDfjwr2VHvVxa2h1VdBJOHhITTds6X
 fv/WZgK40/hsMxzTd0dnSv0s6Qls2KEX0dd8jiRcpYYbgheok+LSZmTRqUEn/GTangTc
 px4zCNjZSNit1/9442RGBH84IoavabCnm0IicdsQaM8A2x94ccmkthAr8y9arriO2OvP
 GGoUsqhTtODemPjhEM+ylvjx9kzZd92cVP6s0m1KMUjRzCvfT50jo38l8Svt6HRZZq+H
 Pf5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6IAP6rCWec5dFdxHSTkj+ozklEm95y9M9ff50kQggU4=;
 b=uLIKWDMc05ACu3nbMj41QkNaM1X+7EPx3Ogm7Juv7H+2Y2f9c8iognJQ7ZNrR1juEP
 JB5qhkM0E4gmntvT4cik5Z4Z9tJ4+0nGnofS55WaFiVLq2UaSiZLFRxktmKZsYvMQ3ts
 +lxFqeMvyfVjnoFE/iDqQ4qRpzJF7qXMXplTUJzNSVDz6USVeJo3CvTxfJ6R/WqDwqB6
 85ocVFI5g5LACpQxeHd47xD2mpJzEQF/6S3MZkpCe8zyUG4m7szz5m4ivOoXvMi5M476
 U3sCxt8pMLSSmaxY0NrPLItpkNxNNtRXgGsd7fp2iO9LHxjS554PohgxQFWcR4/fIk+Z
 YfZQ==
X-Gm-Message-State: AOAM532Onoa6XfJnZOuh3HZzE0sj6qU8jAbphNSccUDDZHNqAmywZGFP
 UmFHNTxKbQ7DM1xhZXVumOVszy9KiG7SsanQq6w=
X-Google-Smtp-Source: ABdhPJzuHfMI7/ooJ5xBLggiE2GYHgKgcQWKisgDxISBOIvmGAQ8R0FSmdZZSKl4sHp0vp2E/zWLA2RHbhBTQvF9KfQ=
X-Received: by 2002:a92:dc0f:: with SMTP id t15mr42105125iln.267.1608050686251; 
 Tue, 15 Dec 2020 08:44:46 -0800 (PST)
MIME-Version: 1.0
References: <cover.1607967113.git.alistair.francis@wdc.com>
 <3b6338af937d0d3aa0858ba1a4ad0fd9e759be66.1607967113.git.alistair.francis@wdc.com>
 <CAEUhbmUHE3vSvsz3JCSmgApCpJfs598FJkXsZBYVuP09u8x9tA@mail.gmail.com>
In-Reply-To: <CAEUhbmUHE3vSvsz3JCSmgApCpJfs598FJkXsZBYVuP09u8x9tA@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 15 Dec 2020 08:44:20 -0800
Message-ID: <CAKmqyKPoe-DLkLik60xW3D3DyuxPetQ=e8ecLUr5AEAV8WBENw@mail.gmail.com>
Subject: Re: [PATCH v3 01/15] hw/riscv: Expand the is 32-bit check to support
 more CPUs
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::142;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x142.google.com
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
X-List-Received-Date: Tue, 15 Dec 2020 16:44:52 -0000

On Tue, Dec 15, 2020 at 1:26 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Tue, Dec 15, 2020 at 4:34 AM Alistair Francis
> <alistair.francis@wdc.com> wrote:
> >
> > Currently the riscv_is_32_bit() function only supports the generic rv32
> > CPUs. Extend the function to support the SiFive and LowRISC CPUs as
> > well.
> >
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >  hw/riscv/boot.c | 12 +++++++++++-
> >  1 file changed, 11 insertions(+), 1 deletion(-)
> >
> > diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> > index d62f3dc758..3c70ac75d7 100644
> > --- a/hw/riscv/boot.c
> > +++ b/hw/riscv/boot.c
> > @@ -41,7 +41,17 @@
> >
> >  bool riscv_is_32_bit(MachineState *machine)
> >  {
> > -    if (!strncmp(machine->cpu_type, "rv32", 4)) {
> > +    /*
> > +     * To determine if the CPU is 32-bit we need to check a few different CPUs.
> > +     *
> > +     * If the CPU starts with rv32
> > +     * If the CPU is a sifive 3 seriries CPU (E31, U34)
> > +     * If it's the Ibex CPU
> > +     */
> > +    if (!strncmp(machine->cpu_type, "rv32", 4) ||
> > +        (!strncmp(machine->cpu_type, "sifive", 6) &&
> > +            machine->cpu_type[8] == '3') ||
> > +        !strncmp(machine->cpu_type, "lowrisc-ibex", 12)) {
>
> This does not look like a scalable way. With more and more CPU added
> in the future, this may end up with a huge list of strncmps..

Any better ideas?

It should handle all SiFive CPUs, besides that we don't have that many CPUs.

Alistair

>
> >          return true;
> >      } else {
> >          return false;
>
> Regards,
> Bin

