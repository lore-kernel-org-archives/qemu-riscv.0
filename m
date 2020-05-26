Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jdcuy-0007Yu-Jd
	for mharc-qemu-riscv@gnu.org; Tue, 26 May 2020 12:59:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jdcuw-0007WY-8P; Tue, 26 May 2020 12:59:06 -0400
Received: from mail-il1-x143.google.com ([2607:f8b0:4864:20::143]:33707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jdcut-0005FF-JQ; Tue, 26 May 2020 12:59:05 -0400
Received: by mail-il1-x143.google.com with SMTP id y17so18971262ilg.0;
 Tue, 26 May 2020 09:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4KcvRCTJBZ1bnes7UmDOjJu5yTIQC/Pznn9vGduLt18=;
 b=M6cN7P2YV39c5/vdkW5tKQ5Nr1j4jI4/rSEDKMeCxIvc+fgvJR775GBYVRkdbr8RQm
 oII0iYiwGLLRy8atxtwq9b7nh9T4593qER+1i2vmNtHp2D4qaOxAIa5FalHiwxTWhVJt
 dxRHDWaZSEM+WfkNkwLgaointBusOeqSceQRAy/qoniu7gmhDMMUqiTH9/JwFLuGm2ks
 tpZk4uFKdmLzOObkUI/ssI0fPxD7VeWw+2dfqcavZtYGs0HxYfgKOwpggSmnshyeEyhi
 1xchI6y5/RrdBOWyB3s2IUzB6sGdf2APoLUGRuS8N4pMqVfLwbhmd0iI7zH1ZjyMywPQ
 Z15w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4KcvRCTJBZ1bnes7UmDOjJu5yTIQC/Pznn9vGduLt18=;
 b=HnyeHCe9nB7cAIpNfTZJ3wIjJ3VSo0GhCErcrGb1UeZlrpuNjGOC9ZHhloN+DPQ6GE
 BQ4limtdovxZ1K7ZOE2kQeJv2xprP7dg7trG/EXC0EBDsky8oRoWiWDKewpwfwU1pWcc
 CNorJ0FzqJgfgFZbECrJ+TUAIUx5gQvxbJ1aAoFL/hfZ4WG+TCYBa9PrtkjLiuXoiyXA
 N5I5Pesaqz/FddF7QefA9ZiDCPVhienqWu88qkqR1zNJtZjqH8FEKWdVEitUN2mn2hyk
 53Pv84jVhugdnIzZ6l79/ZXLGqQRuJJ1eyH8sMfZ8jit69Tg9xzzyvpqCRMINKtCs+yD
 w30g==
X-Gm-Message-State: AOAM530hM5tvBnQOXMkfk034BOr05mbS5Fy1Qw3u92PM8X9EB29mjTv9
 nwTIjMfLVPjiSzZOpTeoQnWeA0H+q9JUFgRDEJE=
X-Google-Smtp-Source: ABdhPJyrEAeXglCooAotgLWpPz9BfAJCdoBvhNKqQSuZCoQtC4ktsAU70+WeU5N9/m0e20NVAVku95oh+Cl9Yhyow9E=
X-Received: by 2002:a92:d087:: with SMTP id h7mr2171135ilh.227.1590512341154; 
 Tue, 26 May 2020 09:59:01 -0700 (PDT)
MIME-Version: 1.0
References: <1590072147-13035-1-git-send-email-bmeng.cn@gmail.com>
 <1590072147-13035-2-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1590072147-13035-2-git-send-email-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 26 May 2020 09:50:01 -0700
Message-ID: <CAKmqyKPvWsFRWZ=J0egmzJUCZ9e2O-yKJk3sgd196CuOey=OnQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] hw/riscv: virt: Remove the riscv_ prefix of the
 machine* functions
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmerdabbelt@google.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::143;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x143.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Tue, 26 May 2020 16:59:07 -0000

On Thu, May 21, 2020 at 7:42 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> Remove the riscv_ prefix of the machine* functions.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  hw/riscv/virt.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index c695a44..f1d6b61 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -471,7 +471,7 @@ static inline DeviceState *gpex_pcie_init(MemoryRegion *sys_mem,
>      return dev;
>  }
>
> -static void riscv_virt_board_init(MachineState *machine)
> +static void virt_machine_init(MachineState *machine)
>  {
>      const struct MemmapEntry *memmap = virt_memmap;
>      RISCVVirtState *s = RISCV_VIRT_MACHINE(machine);
> @@ -632,32 +632,32 @@ static void riscv_virt_board_init(MachineState *machine)
>      g_free(plic_hart_config);
>  }
>
> -static void riscv_virt_machine_instance_init(Object *obj)
> +static void virt_machine_instance_init(Object *obj)
>  {
>  }
>
> -static void riscv_virt_machine_class_init(ObjectClass *oc, void *data)
> +static void virt_machine_class_init(ObjectClass *oc, void *data)
>  {
>      MachineClass *mc = MACHINE_CLASS(oc);
>
>      mc->desc = "RISC-V VirtIO board";
> -    mc->init = riscv_virt_board_init;
> +    mc->init = virt_machine_init;
>      mc->max_cpus = 8;
>      mc->default_cpu_type = VIRT_CPU;
>      mc->pci_allow_0_address = true;
>  }
>
> -static const TypeInfo riscv_virt_machine_typeinfo = {
> +static const TypeInfo virt_machine_typeinfo = {
>      .name       = MACHINE_TYPE_NAME("virt"),
>      .parent     = TYPE_MACHINE,
> -    .class_init = riscv_virt_machine_class_init,
> -    .instance_init = riscv_virt_machine_instance_init,
> +    .class_init = virt_machine_class_init,
> +    .instance_init = virt_machine_instance_init,
>      .instance_size = sizeof(RISCVVirtState),
>  };
>
> -static void riscv_virt_machine_init_register_types(void)
> +static void virt_machine_init_register_types(void)
>  {
> -    type_register_static(&riscv_virt_machine_typeinfo);
> +    type_register_static(&virt_machine_typeinfo);
>  }
>
> -type_init(riscv_virt_machine_init_register_types)
> +type_init(virt_machine_init_register_types)
> --
> 2.7.4
>
>

