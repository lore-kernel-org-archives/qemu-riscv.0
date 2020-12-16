Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kpbLt-0001RC-Br
	for mharc-qemu-riscv@gnu.org; Wed, 16 Dec 2020 13:16:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kpbLq-0001Po-PO; Wed, 16 Dec 2020 13:16:38 -0500
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33]:39882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kpbLo-00084o-Ef; Wed, 16 Dec 2020 13:16:38 -0500
Received: by mail-io1-xd33.google.com with SMTP id d9so24877932iob.6;
 Wed, 16 Dec 2020 10:16:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CRBUyLb8Agb+QunL7mI7okp0lotUw7TNLBpq8jRLqdU=;
 b=CkyORpyf8rFG6pNukT0JgDoQWbNg3uQBaxRgrJ39ytLCQZkn5a1pZbJqamUUidHlp3
 EbUarsy0tRub2XOwyac3EG9CSYx0k/3jcVY85c7GWcyGpACVXJDSvyPRFxHa+awRGES2
 oyKVy2hYvOd1+i3oTbiZxm5Cb3FTYY8ZrzPJ2dauPIpPuNf0EKrdBv/HIYTm9yYvk0Pb
 3/iglJtfNROKxB5e4ugLJWIe82+t4RWt0TwRKhz8l9BYNAlBNo15kq9RpqM/S9ya3TCV
 76/5YAbdcXypTA3d/ccqAU3Tj/cKCB4jDjsWV4ujFUwVuhju/do0OQiPvQkVRDkko962
 7oQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CRBUyLb8Agb+QunL7mI7okp0lotUw7TNLBpq8jRLqdU=;
 b=UL6GEgufRx5RMplcQsSHOZMaWJer/t/Jk5qe+Y2jo+E4Ag0evFbbhF3jSaIaUASNhr
 gaWxbeZ5RVBT3apUanMcCwy4O+sgSOCJlV3pGgZJhmTc53lTWvm9qieeC2B5dBq5F7Cx
 EXLN3z1N1x26xj+EhkGFpDaBRgZHv/7bMczd3QChsK3G68MXxwjFbZrKK2ba+THcD4yu
 TisUbRYB6J2IicusKDG3B7sU5fDy2IlxhGd1xLiczhE0r2F/t35A6ziGADVWfE7wv6LB
 feQ14+lSqMnFH0CY/fQd0Ahw4tip7KV+UBSs4jBETMyQ4lYWUEnR7o711J1i38x9/Ya8
 44rw==
X-Gm-Message-State: AOAM530blo2QHT9IXwKXTTv7wXr3iZjWSVN0IoCivu9XsbInTd4xTwfm
 BZnzyaOytygjqHxrLIxle6xDHOmah9gDTjWTo3w=
X-Google-Smtp-Source: ABdhPJxzYfyEQ8qiRZCYcL/g6M4pODcJPJmjLLSSm3jG9JGkrDaCcGi7VMFfoxdzIZ+PLT1U2gXa36bTiiI51KYPY7M=
X-Received: by 2002:a6b:7206:: with SMTP id n6mr43328622ioc.118.1608142593814; 
 Wed, 16 Dec 2020 10:16:33 -0800 (PST)
MIME-Version: 1.0
References: <cover.1607967113.git.alistair.francis@wdc.com>
 <3b6338af937d0d3aa0858ba1a4ad0fd9e759be66.1607967113.git.alistair.francis@wdc.com>
 <CAEUhbmUHE3vSvsz3JCSmgApCpJfs598FJkXsZBYVuP09u8x9tA@mail.gmail.com>
 <CAKmqyKPoe-DLkLik60xW3D3DyuxPetQ=e8ecLUr5AEAV8WBENw@mail.gmail.com>
 <759b5711-6b07-819f-4d11-0acf7b6ceed5@linaro.org>
In-Reply-To: <759b5711-6b07-819f-4d11-0acf7b6ceed5@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 16 Dec 2020 10:16:07 -0800
Message-ID: <CAKmqyKO-Wk4fVHzq2Gta3AZ+-gg3__-1qS1N9meFKJgxpbV2kw@mail.gmail.com>
Subject: Re: [PATCH v3 01/15] hw/riscv: Expand the is 32-bit check to support
 more CPUs
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Bin Meng <bmeng.cn@gmail.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d33;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd33.google.com
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
X-List-Received-Date: Wed, 16 Dec 2020 18:16:39 -0000

On Tue, Dec 15, 2020 at 1:25 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 12/15/20 10:44 AM, Alistair Francis wrote:
> > On Tue, Dec 15, 2020 at 1:26 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> >>
> >> On Tue, Dec 15, 2020 at 4:34 AM Alistair Francis
> >> <alistair.francis@wdc.com> wrote:
> >>>
> >>> Currently the riscv_is_32_bit() function only supports the generic rv32
> >>> CPUs. Extend the function to support the SiFive and LowRISC CPUs as
> >>> well.
> >>>
> >>> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> >>> ---
> >>>  hw/riscv/boot.c | 12 +++++++++++-
> >>>  1 file changed, 11 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> >>> index d62f3dc758..3c70ac75d7 100644
> >>> --- a/hw/riscv/boot.c
> >>> +++ b/hw/riscv/boot.c
> >>> @@ -41,7 +41,17 @@
> >>>
> >>>  bool riscv_is_32_bit(MachineState *machine)
> >>>  {
> >>> -    if (!strncmp(machine->cpu_type, "rv32", 4)) {
> >>> +    /*
> >>> +     * To determine if the CPU is 32-bit we need to check a few different CPUs.
> >>> +     *
> >>> +     * If the CPU starts with rv32
> >>> +     * If the CPU is a sifive 3 seriries CPU (E31, U34)
> >>> +     * If it's the Ibex CPU
> >>> +     */
> >>> +    if (!strncmp(machine->cpu_type, "rv32", 4) ||
> >>> +        (!strncmp(machine->cpu_type, "sifive", 6) &&
> >>> +            machine->cpu_type[8] == '3') ||
> >>> +        !strncmp(machine->cpu_type, "lowrisc-ibex", 12)) {
> >>
> >> This does not look like a scalable way. With more and more CPU added
> >> in the future, this may end up with a huge list of strncmps..
> >
> > Any better ideas?
>
> It doesn't appear as if you need to query this before you've instantiated the
> cpu.  The first dynamic use that I see is create_fdt, which happens after that
> point.
>
> Verified like so:
>
> $ gdb --args ./qemu-system-riscv64 -M virt
> (gdb) b rv64_base_cpu_init
> Breakpoint 1 at 0x548390: file ../qemu/target/riscv/cpu.c, line 156.
> (gdb) b riscv_is_32_bit
> Breakpoint 2 at 0x490dd0: file ../qemu/hw/riscv/boot.c, line 37.
> (gdb) run
> ...
> Thread 1 "qemu-system-ris" hit Breakpoint 1, rv64_base_cpu_init
>
> >From the machine, you can find the boot cpu, and use the riscv_cpu_is_32bit
> helper on that.
>
> Also, just noticed that the two functions spell "32bit" differently.  :-)

Thanks for the help Richard.

I have added a commit in v4 that changes the function like you
mention. The rebased ended up being a little tricky so I added the
commit to the end instead.

Alistair

>
>
> r~

