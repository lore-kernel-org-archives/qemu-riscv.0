Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1819EB64DA
	for <qemu-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 03:11:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qG9xz-00004q-F8; Sun, 02 Jul 2023 23:11:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qG9xy-0008W3-Go; Sun, 02 Jul 2023 23:11:06 -0400
Received: from mail-ua1-x935.google.com ([2607:f8b0:4864:20::935])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qG9xw-0001aN-UI; Sun, 02 Jul 2023 23:11:06 -0400
Received: by mail-ua1-x935.google.com with SMTP id
 a1e0cc1a2514c-783f17f0a00so1092138241.2; 
 Sun, 02 Jul 2023 20:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688353863; x=1690945863;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ykgI1ofWRr111JVHkpLtE1AyjguNIBIofNVn2Tu8VPw=;
 b=SdvXsqp59e9q9OTHh6rNKsdUDJwKLmhNSMvasGIZSRhnFP62Fa/hFsE6RrvKffKSi6
 LRqnD2Hk35zBckmMIKoQFGcMTaCMvqB58cusc66Zyp/7ewpG82g8SHlqnyxCytyIh81S
 S6tjC58/VVvuXDU+0QUyE3cKiFQqeoZGGIf0hxI94RR92IAzIOaT5ZJbjzeCKvbasU2q
 Oy/lD/kUtIEPOaD+oiGAARn4mSB+5OfYHC0mxY3rDckKKNZaIUnQVsudP4yhFc28d75U
 0CsfozqG52CTFE5xEvM7UxsHC8pqtEgrAnq6TUccAT7mUvx6WWEg0RA2eiJnof4+PG7G
 /EZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688353863; x=1690945863;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ykgI1ofWRr111JVHkpLtE1AyjguNIBIofNVn2Tu8VPw=;
 b=apT/O5YuDzkCi+K4VF10jGeT2f54Z7MqkXAjVZpgmb+PrgXHbntQubhUTAVMJu1rqW
 opnqCf0/8WVmhG/ukeyI58KjRA6eW9CGKqk4QO0NfB3WQJt71mFwaI65/b/0Z1hMZPpI
 up6fQhvx5CMW74NT7ZuuwphplprV63SAyJ0hYztLcC2MVcYTZV8wyg9mT8qkQHLOLLna
 TSFtlNbGWbFKg0mrO6C73A7CsYmsYLD16bQA0v3SvYirysgtuw3Nav6UMjPfh8znZz3Z
 3JH+Z8qTJLoY4NGELpur4secA36v51iMlQqInHKK9lNxlly5/c6PTs4Cn5BWEcXws2P7
 dHbA==
X-Gm-Message-State: ABy/qLZmwOYKGyCHeLkCQKj7QMFDcs3ojJ63qkSSJhHNoE2P7rPzqYIv
 W9AHs2lImWmmHON3lAvvA9AiHqbBULByn19fp2k=
X-Google-Smtp-Source: APBJJlHAzzWpYmbDHBcjaOipqHLKiRQfWZ6WmitaW0eOIQshKQ3O9gT8ZKF5LvHkC6VeWtJdN6FDFJf29TwLBLIQXZc=
X-Received: by 2002:a05:6102:50d:b0:443:6e00:d32 with SMTP id
 l13-20020a056102050d00b004436e000d32mr3611697vsa.8.1688353863038; Sun, 02 Jul
 2023 20:11:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220420055248.960491-1-alistair.francis@opensource.wdc.com>
 <20220420055248.960491-7-alistair.francis@opensource.wdc.com>
 <3c07be7c-4af2-4a2b-8b0a-236e2f6a4a62@roeck-us.net>
 <d9007e92-c2d2-4ce6-aaf8-9d8d37b2d119@roeck-us.net>
In-Reply-To: <d9007e92-c2d2-4ce6-aaf8-9d8d37b2d119@roeck-us.net>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 3 Jul 2023 13:10:37 +1000
Message-ID: <CAKmqyKN5e4vf7ZupS5oo0k8YB9yoivMuHs+fsmROBBZabXcOzQ@mail.gmail.com>
Subject: Re: [PATCH v4 6/6] hw/riscv: Enable TPM backends
To: Guenter Roeck <linux@roeck-us.net>
Cc: Alistair Francis <alistair.francis@opensource.wdc.com>,
 qemu-riscv@nongnu.org, 
 qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair@alistair23.me>, Bin Meng <bin.meng@windriver.com>, 
 Alistair Francis <alistair.francis@wdc.com>, qemu-arm@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>, bmeng.cn@gmail.com, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::935;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x935.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Wed, Jun 21, 2023 at 4:34=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> On Mon, Jun 19, 2023 at 01:32:34PM -0700, Guenter Roeck wrote:
> > Hi Alistair,
> >
> > On Wed, Apr 20, 2022 at 03:52:48PM +1000, Alistair Francis wrote:
> > > From: Alistair Francis <alistair.francis@wdc.com>
> > >
> > > Imply the TPM sysbus devices. This allows users to add TPM devices to
> > > the RISC-V virt board.
> > >
> > > This was tested by first creating an emulated TPM device:
> > >
> > >     swtpm socket --tpm2 -t -d --tpmstate dir=3D/tmp/tpm \
> > >         --ctrl type=3Dunixio,path=3Dswtpm-sock
> > >
> > > Then launching QEMU with:
> > >
> > >     -chardev socket,id=3Dchrtpm,path=3Dswtpm-sock \
> > >     -tpmdev emulator,id=3Dtpm0,chardev=3Dchrtpm \
> > >     -device tpm-tis-device,tpmdev=3Dtpm0
> > >
> > > The TPM device can be seen in the memory tree and the generated devic=
e
> > > tree.
> > >
> > I tried to get this working with qemu 8.0, but I did not have any succe=
ss.
> > I am quite sure I have the above command line correctly, and it does wo=
rk
> > with arm64. Any idea what I might be missing ?
> >
>
> Answering my own question: Nothing. The problem is that the devicetree
> is created too early, before the tpm device is instantiated/realized in
> qemu. The tpm device therefore does not show up in devicetree, and the
> tom device does not instantiate in Linux. The patch below fixes the probl=
em
> for me.

Thanks for looking into this!

>
> Any comments / thoughts ? Is that change acceptable, or should it be
> implemented differently ?

The diff below looks fine to me. Do you mind sending a patch?

Alistair

>
> Thanks,
> Guenter
>
> ---
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 4e3efbee16..ea259d7ade 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -1247,6 +1247,11 @@ static void virt_machine_done(Notifier *notifier, =
void *data)
>      uint32_t fdt_load_addr;
>      uint64_t kernel_entry;
>
> +    /* create devicetree if not provided */
> +    if (!machine->dtb) {
> +        create_fdt(s, memmap);
> +    }
> +
>      /*
>       * Only direct boot kernel is currently supported for KVM VM,
>       * so the "-bios" parameter is not supported when KVM is enabled.
> @@ -1519,15 +1524,13 @@ static void virt_machine_init(MachineState *machi=
ne)
>      }
>      virt_flash_map(s, system_memory);
>
> -    /* load/create device tree */
> +    /* load device tree */
>      if (machine->dtb) {
>          machine->fdt =3D load_device_tree(machine->dtb, &s->fdt_size);
>          if (!machine->fdt) {
>              error_report("load_device_tree() failed");
>              exit(1);
>          }
> -    } else {
> -        create_fdt(s, memmap);
>      }
>
>      s->machine_done.notify =3D virt_machine_done;

