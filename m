Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1liTJz-0006II-UG
	for mharc-qemu-riscv@gnu.org; Sun, 16 May 2021 22:49:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1liTJx-0006HR-6x; Sun, 16 May 2021 22:49:29 -0400
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a]:35815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1liTJs-0007zR-G3; Sun, 16 May 2021 22:49:28 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id i4so6607240ybe.2;
 Sun, 16 May 2021 19:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=beEKj4Gd8dt7XOEuyd5L1UnEL/PkIrpiS0HLpBQE1Ok=;
 b=cVhA4ptRlwxQpQhBxC69o9WojK+CXgQOcuaXz+xFt8ZLnQFYwXMh+cNZbURYU6Zoyq
 Ia04/9XHWogGUWPtyaAi56kuYTkZbct+eZV2M7qiOYvJxp4x/09IxL1Zc3ApcYbTHXbR
 j1aNiL3UcviQ1UKgJDR2xugU6QIyXMPOlJ986fA51h+bL8Sr89DRk/bki1BCEeaYDxwl
 5udV1OGRaS918h67OswSg0yfxOU4oY//AzXsXI0BsfPZa9hc9TplE/wv8q7tL8dS4/sa
 ySTbNRUjwLAx08BK6PzE1nDgRQrxx1UIzaIow8Lpr7KwRetj4wzmGKMI0sbK0fwa/pzn
 iV1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=beEKj4Gd8dt7XOEuyd5L1UnEL/PkIrpiS0HLpBQE1Ok=;
 b=RAltFpeGghEnJlAW1s0YGEX4DeP8VNUpu1mwX6yKxPSEzApebipn+mKNWBnOXilSOg
 gvDUlCQYljo8EkdtUvVseao046CPlg4x1vSIAsCrNIWSISKXKaMzhvvfTZ5GQnk8Xaan
 egStPKIn9xm4WDmcarpCSR9KTbhPYWKzxjfJYVnE66zJH7fkzhzVZ0RHOg/FSvi7Duvw
 cn28Gyp8R/wlkE7swKpSyPy1xgE4pjxAIM3W7XF9Y5brpGYmTFV1wpZSMIwhg9frKKFB
 SzXQPed+xOcMnldwIdCMadQqywlsfpmdVpN5PwmGlEI90smF7TNrJrG1Z4G9PKLpq6tP
 9GPQ==
X-Gm-Message-State: AOAM530gS9gBIN6oyjX0UTNRFmSKzfJl0CJtNa4Hi8ZDag+xPyjBl4to
 rbhAzxcbhyTBxCJPeTGFpVw0RyPF2eXnfnfHGNA=
X-Google-Smtp-Source: ABdhPJwOilBb4ZeBDPWS91RTJdjSWGLh9fZ7Q0GSNmiROaVsaSzCrDHHOn0z/Or4p2CC6DTL7baP+ZpRpyOHW38u/O4=
X-Received: by 2002:a05:6902:1543:: with SMTP id
 r3mr46651926ybu.332.1621219762423; 
 Sun, 16 May 2021 19:49:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210515173716.358295-1-philmd@redhat.com>
 <20210515173716.358295-10-philmd@redhat.com>
In-Reply-To: <20210515173716.358295-10-philmd@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 17 May 2021 10:49:10 +0800
Message-ID: <CAEUhbmV3XiE1P-+K7Aa10n8udZrh+WRG4tCipRXbYUyd_1PVAA@mail.gmail.com>
Subject: Re: [PATCH v2 09/12] hw/pci-host/Kconfig: Add missing dependency
 MV64361 -> I8259
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, Bin Meng <bin.meng@windriver.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 qemu-arm <qemu-arm@nongnu.org>, qemu-ppc <qemu-ppc@nongnu.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2a.google.com
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
X-List-Received-Date: Mon, 17 May 2021 02:49:29 -0000

On Sun, May 16, 2021 at 1:52 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
> Looking at the MV64340 model source, there is a dependency on the
> 8259 interrupt controller:
>
>   523     case MV64340_PCI_1_INTERRUPT_ACKNOWLEDGE_VIRTUAL_REG:
>   524         /* FIXME: Should this be sent via the PCI bus somehow? */
>   525         if (s->gpp_int_level && (s->gpp_value & BIT(31))) {
>   526             ret =3D pic_read_irq(isa_pic);
>   527         }
>   528         break;
>
> Add it to Kconfig to avoid the following build failure:
>
>   /usr/bin/ld: libcommon.fa.p/hw_pci-host_mv64361.c.o: in function `mv643=
61_read':
>   hw/pci-host/mv64361.c:526: undefined reference to `isa_pic'
>   /usr/bin/ld: hw/pci-host/mv64361.c:526: undefined reference to `pic_rea=
d_irq'
>
> Fixes: dcdf98a9015 ("hw/pci-host: Add emulation of Marvell MV64361 PPC sy=
stem controller")
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/pci-host/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

There are some more codes that contain isa_pic. Maybe worth an additional c=
heck.

./hw/i386/x86.c:573:    intno =3D pic_read_irq(isa_pic);
./hw/intc/i8259.c:58:DeviceState *isa_pic;
./hw/intc/i8259.c:429:    isa_pic =3D dev;
./hw/intc/apic.c:387:    } else if (!apic_accept_pic_intr(dev) ||
!pic_get_output(isa_pic)) {
./hw/intc/apic.c:562:    if (!apic_accept_pic_intr(dev) ||
!pic_get_output(isa_pic)) {
./hw/intc/apic.c:615:        return isa_pic !=3D NULL;
./hw/intc/ioapic.c:78:        info->vector =3D pic_read_irq(isa_pic);
./hw/hppa/pci.c:67:    return pic_read_irq(isa_pic);
./hw/mips/gt64xxx_pci.c:777:        val =3D pic_read_irq(isa_pic);
./hw/alpha/pci.c:70:    return pic_read_irq(isa_pic);
./hw/pci-host/mv64361.c:526:            ret =3D pic_read_irq(isa_pic);
./hw/pci-host/prep.c:121:    return pic_read_irq(isa_pic);
./include/hw/intc/i8259.h:6:extern DeviceState *isa_pic;

Regards,
Bin

