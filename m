Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lOoc4-0002HA-49
	for mharc-qemu-riscv@gnu.org; Tue, 23 Mar 2021 17:30:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lOoc2-0002Fn-4S; Tue, 23 Mar 2021 17:30:54 -0400
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31]:46653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lOobz-0007aL-N5; Tue, 23 Mar 2021 17:30:53 -0400
Received: by mail-io1-xd31.google.com with SMTP id j26so19285917iog.13;
 Tue, 23 Mar 2021 14:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=xe3JOktpaNTlPIIAnEXAvLpj22VrS6wQuLVseOhqj6s=;
 b=hsLPnnNOotEEIEZ3MdU0h6b3vkwGN6TlRTA8Tvi+8P4s9g25xHStTf+N6mMzmVPeoq
 cGNtlnJIbA3qR/+w3wMtHtbx0PzbI0TJjWwfqEkRZ15IHhd+OxoDEUwnqo5DLK8A6qzp
 usVVxp0PCCzGO5pZwZ34qlm2hcCpfjp1CopRb0gw03v6ulaxfVCMCvndnUOeinOhyI6F
 ggbwi0KTzSLHFV/l71+J2Dd06LTtsFD3UhZGOEaa11Y90xOrnhaqUdQUxsRlDu7FdvYT
 c9tOJNzcJhCAB6qsgwoX0IbdamDwYe5QDpM+BDzZfh6uNxGpdvhjfEsvRBes3ptRfOyq
 aF/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xe3JOktpaNTlPIIAnEXAvLpj22VrS6wQuLVseOhqj6s=;
 b=oV1p4Pau5pe3zyQeOrcfZSXx7p73tjKGL1dK3JrH5Nyt0c/nmtYkAVlUBmGlG7EVPa
 S2N70Sy105tximTihJl6MzHdTil6Rw0yj8TF4htP5u4kP4ODoJjFDG5x8H8qryIOjndr
 8RxHQjOzzrMPFz6xjQh2DlXOmCXpNNt+7DXlhOuQU863jcpVjS/NJCiaUByzWyI+leta
 8UqZDW9gNpYvq6h5bU6j6C4Y+mReOZVulsbQ92toDQxQnQVu43hN9z/5LkagEIqvRdG2
 GiT8YGfiaMDwJXKhDyfPOvStCAlsjmQkCg8unzt0FFizlwu+e/cKH56s8E1CwdqGnwe0
 NfCw==
X-Gm-Message-State: AOAM530QkmfY8aKkqg/XmRLpgLAVzCllxd8QFralStz7wf5epzfIwWzj
 5vZzB7UCF3dP8CCcrFLoGVgDIVGCjeBwiHcTw8c=
X-Google-Smtp-Source: ABdhPJyAYcHtgdWQRrTOiH3/NdLc3xFNdSxzAc4vwrgHWJyV0O2c2Zw377FL9Bqm4rtZJl0xgZfLbnpixQXuLn5ZAD0=
X-Received: by 2002:a02:cad9:: with SMTP id f25mr81529jap.26.1616535049448;
 Tue, 23 Mar 2021 14:30:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210323155132.238193-1-f4bug@amsat.org>
 <20210323155132.238193-10-f4bug@amsat.org>
In-Reply-To: <20210323155132.238193-10-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 23 Mar 2021 17:28:49 -0400
Message-ID: <CAKmqyKNCJTbRfRD-YdR=AQx9=oE=VFeaMSJauhu+eh-xsgkzng@mail.gmail.com>
Subject: Re: [RFC PATCH 09/13] blobs: Only install firmware blobs if riscv
 system targets are built
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Thomas Huth <thuth@redhat.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d31;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd31.google.com
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
X-List-Received-Date: Tue, 23 Mar 2021 21:30:54 -0000

On Tue, Mar 23, 2021 at 12:41 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Alistair Francis <Alistair.Francis@wdc.com>
> Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>
> Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
> Cc: qemu-riscv@nongnu.org
> ---
>  meson.build         |  2 ++
>  pc-bios/meson.build | 13 +++++++++----
>  2 files changed, 11 insertions(+), 4 deletions(-)
>
> diff --git a/meson.build b/meson.build
> index 6f5561c2212..4b614b30ed9 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -98,6 +98,7 @@
>  install_blobs_hppa =3D false
>  install_blobs_microblaze =3D false
>  install_blobs_ppc =3D false
> +install_blobs_riscv =3D false
>  if get_option('install_blobs')
>    foreach target : target_dirs
>      install_edk2_blobs =3D install_edk2_blobs or target in edk2_targets
> @@ -106,6 +107,7 @@
>      install_blobs_hppa =3D install_blobs_hppa or target in ['hppa-softmm=
u']
>      install_blobs_microblaze =3D install_blobs_microblaze or target in [=
'microblaze-softmmu', 'microblazeel-softmmu']
>      install_blobs_ppc =3D install_blobs_ppc or (target.startswith('ppc')=
 and target.endswith('softmmu'))
> +    install_blobs_riscv =3D install_blobs_riscv or target in ['riscv32-s=
oftmmu', 'riscv64-softmmu']
>    endforeach
>  endif
>
> diff --git a/pc-bios/meson.build b/pc-bios/meson.build
> index 73d02a57628..504f03ec925 100644
> --- a/pc-bios/meson.build
> +++ b/pc-bios/meson.build
> @@ -66,10 +66,6 @@
>    'pvh.bin',
>    's390-ccw.img',
>    's390-netboot.img',
> -  'opensbi-riscv32-generic-fw_dynamic.bin',
> -  'opensbi-riscv64-generic-fw_dynamic.bin',
> -  'opensbi-riscv32-generic-fw_dynamic.elf',
> -  'opensbi-riscv64-generic-fw_dynamic.elf',
>  ))
>
>  if host_machine.system() =3D=3D 'windows'
> @@ -116,6 +112,15 @@
>    ))
>  endif
>
> +if install_blobs_riscv
> +  blobs_ss.add(files(
> +    'opensbi-riscv32-generic-fw_dynamic.bin',
> +    'opensbi-riscv64-generic-fw_dynamic.bin',
> +    'opensbi-riscv32-generic-fw_dynamic.elf',
> +    'opensbi-riscv64-generic-fw_dynamic.elf',
> +  ))
> +endif
> +
>  blobs_ss =3D blobs_ss.apply(config_host, strict: false)
>
>  if get_option('install_blobs')
> --
> 2.26.2
>
>

