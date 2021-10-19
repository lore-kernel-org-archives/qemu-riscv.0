Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcoga-0003VP-Di
	for mharc-qemu-riscv@gnu.org; Tue, 19 Oct 2021 08:57:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mcogZ-0003V2-81; Tue, 19 Oct 2021 08:57:43 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31]:41718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mcogX-0001Dw-IP; Tue, 19 Oct 2021 08:57:42 -0400
Received: by mail-yb1-xb31.google.com with SMTP id s4so5682002ybs.8;
 Tue, 19 Oct 2021 05:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Z1mftcwV205o0CNT78dWKBXbDsq9LuRnp/8NUY69cPc=;
 b=nG3ayim8qMQtAPFCNybd++HwCp8mMoyJQHLBrAzWunH+kqeKOAEtDK4Y0xteLYT6a0
 YB1QDFEtbEc2V+vK4LXtIby4Od2VlM4XUDO558ZzP2LCjj1//KRV1yF86I2LRXARVfzo
 0+tDoS8ABrAZgXDW79tIyUkmmW78vvceqqozKsIx6NDxUnWpFKsQ11krU30GlSGHYooy
 rxUYK14+YY0DqtONA4+NNvg+pPjDZZEaJFssXcCKvvO+gjcIZNv1qeR7UMl572g+xiqZ
 KT/Jg3pHsikmwuqn3Da/UUzNeh9T6N4vLM9vbCBS6kKiBCVlNlj+sa6aEY0fjfkUE8Tm
 65EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Z1mftcwV205o0CNT78dWKBXbDsq9LuRnp/8NUY69cPc=;
 b=vGUzvu2JdN8/WT3ROIifOoHUOGfdKzA/7oVqQZKLvrhet5Svi3ld3xwEYDJ7mdxnlm
 suUlfXpUOD9YYCN9Ifs9w9XIFe0nwIdTZynYG8D9n6xBmlVHNFx3pW2dSnPWXffSbl8z
 rnnznC4T1TCXIHiwa9VAgggKU9RODE8bVZfy1FODjIXfcfxrlL6F+Zjc1cZ/HDPmVYJa
 8bETCWMk3GbRREn99niuaIdo6BNbstXsHdhzwWginh//hQS8eLUtSA529KvCHo/nJScN
 1/y94DQxFkCrOBgYyIouUjQYdJOpyHHDODZHaE7F3ERbXRUrmexv7GnQcihmMDojda5o
 nBkQ==
X-Gm-Message-State: AOAM532PGKhZOdfFSbraKJfpoFv7pBy01roFjETJhgbrV1zRFdg3L2AH
 nzkxL9IQ+p1Y6kS8t2gYf8ezOuidphnjoW+zfW8=
X-Google-Smtp-Source: ABdhPJzKs2YM6V7x8FyWbBNH5somzqJR2dj4WNO61OvRGkdIOxWuraidxTNEpRZxLkwVSpUwBmR484/f09T/lHhsCqo=
X-Received: by 2002:a25:df84:: with SMTP id
 w126mr34695285ybg.109.1634648259903; 
 Tue, 19 Oct 2021 05:57:39 -0700 (PDT)
MIME-Version: 1.0
References: <20211018153829.24382-1-bmeng.cn@gmail.com>
 <20211018153829.24382-2-bmeng.cn@gmail.com>
 <20211019091103.68908df5@redhat.com>
In-Reply-To: <20211019091103.68908df5@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 19 Oct 2021 20:57:28 +0800
Message-ID: <CAEUhbmWGSnJKaNVnDaVnACf_ynkPx6oBdfD89isf-epaA1t68w@mail.gmail.com>
Subject: Re: [PATCH 2/6] hw/riscv: opentitan: Use MachineState::ram and
 MachineClass::default_ram_id
To: Igor Mammedov <imammedo@redhat.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb31.google.com
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
X-List-Received-Date: Tue, 19 Oct 2021 12:57:43 -0000

Hi Igor,

On Tue, Oct 19, 2021 at 3:11 PM Igor Mammedov <imammedo@redhat.com> wrote:
>
> On Mon, 18 Oct 2021 23:38:25 +0800
> Bin Meng <bmeng.cn@gmail.com> wrote:
>
> > Using memory_region_init_ram(), which can't possibly handle vhost-user,
> > and can't work as expected with '-numa node,memdev' options.
> >
> > Use MachineState::ram instead of manually initializing RAM memory
> > region, as well as by providing MachineClass::default_ram_id to
> > opt in to memdev scheme.
> >
> > Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> > ---
> >
> >  hw/riscv/opentitan.c | 6 ++----
> >  1 file changed, 2 insertions(+), 4 deletions(-)
> >
> > diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
> > index 9803ae6d70..c356293d29 100644
> > --- a/hw/riscv/opentitan.c
> > +++ b/hw/riscv/opentitan.c
> > @@ -67,17 +67,14 @@ static void opentitan_board_init(MachineState *machine)
> >      const MemMapEntry *memmap = ibex_memmap;
> >      OpenTitanState *s = g_new0(OpenTitanState, 1);
> >      MemoryRegion *sys_mem = get_system_memory();
> > -    MemoryRegion *main_mem = g_new(MemoryRegion, 1);
>
> It is likely that you are missing fixed size check here
> (looking at code it seems to me that board doesn't support variable RAM size)
> See commit 00b9829f83c for example.

Yep

>
> >      /* Initialize SoC */
> >      object_initialize_child(OBJECT(machine), "soc", &s->soc,
> >                              TYPE_RISCV_IBEX_SOC);
> >      qdev_realize(DEVICE(&s->soc), NULL, &error_abort);
> >
> > -    memory_region_init_ram(main_mem, NULL, "riscv.lowrisc.ibex.ram",
> > -        memmap[IBEX_DEV_RAM].size, &error_fatal);
> >      memory_region_add_subregion(sys_mem,
> > -        memmap[IBEX_DEV_RAM].base, main_mem);
> > +        memmap[IBEX_DEV_RAM].base, machine->ram);
> >
> >      if (machine->firmware) {
> >          riscv_load_firmware(machine->firmware, memmap[IBEX_DEV_RAM].base, NULL);
> > @@ -95,6 +92,7 @@ static void opentitan_machine_init(MachineClass *mc)
> >      mc->init = opentitan_board_init;
> >      mc->max_cpus = 1;
> >      mc->default_cpu_type = TYPE_RISCV_CPU_IBEX;
> > +    mc->default_ram_id = "riscv.lowrisc.ibex.ram";
>
> Are you missing "mc->default_ram_size = memmap[IBEX_DEV_RAM].size" here?

Indeed, thanks for the review!

>
> otherwise it will default to generic:
>   hw/core/machine.c:    mc->default_ram_size = 128 * MiB;
>
> >  }
> >
> >  DEFINE_MACHINE("opentitan", opentitan_machine_init)
>

Regards,
Bin

