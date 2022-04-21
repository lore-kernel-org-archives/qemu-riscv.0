Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nhMPk-0006x9-Mh
	for mharc-qemu-riscv@gnu.org; Wed, 20 Apr 2022 22:19:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nhMPi-0006uV-Hm; Wed, 20 Apr 2022 22:19:22 -0400
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:42591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nhMPg-0005Xh-Sd; Wed, 20 Apr 2022 22:19:22 -0400
Received: by mail-yb1-xb2c.google.com with SMTP id p65so6205941ybp.9;
 Wed, 20 Apr 2022 19:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/jDftP+xe+9OnkdBEuxvo6HXn+Khvm1C3VJUpuN6/TY=;
 b=fbxZE85w/o0YAtKSJU6Kmqj/yWhtyee4WFKUyPDvYMvECE1pLZ1QY6F4OxUCn8jGJj
 yPxo+h/xyP/Cyaz0gUSqjzfW29XRVwPzcq0vbX0EvKlKhpqXDenV8Bp3g0AWBUMksuI4
 I0GsaWcPwsyHVk+pJGJz2GVsw1GPjqNXN3K/tQDVfr+jyboS+ywsS7opppzXqlpcfJvM
 4jL/6jktYuRzfBa6EsN8m6peWMb09D7fsnUnU14N+okEKfdkCN3DzjTIXuMBPu3HsFk8
 +T7rA0rc5VEA487+RPCcNFJYspSLzf+PZUxwcATjO7OYpjaeSNPaoWiNSPq4T33lCA70
 hUkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/jDftP+xe+9OnkdBEuxvo6HXn+Khvm1C3VJUpuN6/TY=;
 b=03VFVe33wPFlpmNsYdVIz3BybeJOO0dOgcsrxicQGu2r1DjBGrSHNGEPEUh8Ejasnf
 VcnOYgrgG6sHAoMGz54vASJWqRkUcw+Y7b4w8AKEslmov6JH8tcIulbYMBSsGUC+YdRS
 ZioSsx1xF4ifL29KRPlnJ487zdHebHsqMKCuEXcjnT3emG7vIgo7DTSro0RFLa8hiAPo
 x8+U38Ox8Zc4Vp8RnYs1oEAKyq0xJh8f3T/DwIDdFhq4e1r+KvGD/2o6Fmk3Y9ETuPD/
 oSaLQ68sdei3xXbO1nz7vdE/8mXF5TAfB4Vwkd38AHJIiCEuiwa7YCnhXOpFKH4tuy5r
 7DYw==
X-Gm-Message-State: AOAM530i085/3OSvOh/pgAkJinXD4VyL9Y5owpC5zbGs2lQyudxUnKBR
 HyV3YL+Dx1wH6wyaFQah7l9BLqBaqSc2ZOrzeso=
X-Google-Smtp-Source: ABdhPJxxio5Ls/wq/6tTkL2MBtmtjhzrcoLI9XMnASckMXygr94FTeNs6ZnnS0dpQKuE342o6jVH9ZMCAqq3Rc+FFS8=
X-Received: by 2002:a05:6902:10c1:b0:63c:d3bf:59d2 with SMTP id
 w1-20020a05690210c100b0063cd3bf59d2mr22451288ybu.99.1650507559277; Wed, 20
 Apr 2022 19:19:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220420055248.960491-1-alistair.francis@opensource.wdc.com>
In-Reply-To: <20220420055248.960491-1-alistair.francis@opensource.wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 21 Apr 2022 10:19:07 +0800
Message-ID: <CAEUhbmUGQ8Jo5zQkCo-4VMfFw6oO+6AUDROEk1H4WHJ-e9Dz+w@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] hw/riscv: Add TPM support to the virt board
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair@alistair23.me>,
 Alistair Francis <alistair23@gmail.com>, 
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <alistair.francis@wdc.com>,
 qemu-arm <qemu-arm@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Thu, 21 Apr 2022 02:19:22 -0000

On Wed, Apr 20, 2022 at 1:52 PM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> This series adds support for connecting TPM devices to the RISC-V virt
> board. This is similar to how it works for the ARM virt board.
>
> This was tested by first creating an emulated TPM device:
>
>     swtpm socket --tpm2 -t -d --tpmstate dir=/tmp/tpm \
>         --ctrl type=unixio,path=swtpm-sock
>
> Then launching QEMU with:
>
>     -chardev socket,id=chrtpm,path=swtpm-sock \
>     -tpmdev emulator,id=tpm0,chardev=chrtpm \
>     -device tpm-tis-device,tpmdev=tpm0
>
> The TPM device can be seen in the memory tree and the generated device
> tree.

Please include a 'virt' board documentation update patch to mention
above usage for TPM, or dynamically instantiated devices with TPM as
an example.

>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/942
>
> Alistair Francis (6):
>   hw/riscv: virt: Add a machine done notifier
>   hw/core: Move the ARM sysbus-fdt to core
>   hw/riscv: virt: Create a platform bus
>   hw/riscv: virt: Add support for generating platform FDT entries
>   hw/riscv: virt: Add device plug support
>   hw/riscv: Enable TPM backends
>
>  include/hw/{arm => core}/sysbus-fdt.h |   0
>  include/hw/riscv/virt.h               |   8 +-
>  hw/arm/virt.c                         |   2 +-
>  hw/arm/xlnx-versal-virt.c             |   1 -
>  hw/{arm => core}/sysbus-fdt.c         |   2 +-
>  hw/riscv/virt.c                       | 312 +++++++++++++++++---------
>  hw/arm/meson.build                    |   1 -
>  hw/core/meson.build                   |   1 +
>  hw/riscv/Kconfig                      |   2 +
>  9 files changed, 221 insertions(+), 108 deletions(-)
>  rename include/hw/{arm => core}/sysbus-fdt.h (100%)
>  rename hw/{arm => core}/sysbus-fdt.c (99%)
>

Regards,
Bin

