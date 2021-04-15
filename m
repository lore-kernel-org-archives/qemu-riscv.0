Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lXAYq-0003dL-CK
	for mharc-qemu-riscv@gnu.org; Thu, 15 Apr 2021 18:34:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lXAYo-0003aM-PM; Thu, 15 Apr 2021 18:34:06 -0400
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32]:44871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lXAYm-0002JY-O2; Thu, 15 Apr 2021 18:34:06 -0400
Received: by mail-io1-xd32.google.com with SMTP id p8so4451540iol.11;
 Thu, 15 Apr 2021 15:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=f4zD4sRXt/BaKHUrk72b5CYeq5O7E4rSDkxxZRR9nwk=;
 b=aeqK/dNBmwTlE1wchd7yO+bAdIV/ThJLDHqAQcl0tYuBu9hUKvQZA6o6xMGprYMX4M
 Q9mihPOmblUCWhtt1syMbMpZi1RS70nn5f7Kxf5meCyoY3U0IbrOV7msXKfwDcrRxyDe
 SIJRalSmlXneBMmkoPS0FKhu2jqEwK7bEq8kEcyqC2fLWxH4joauDAztW2wNZMcR2Q8r
 lSHFxJzUlzZQGLRjZ/VeJAfA4sfB/leCLozMHT3vQnuiDHhsXf1I1sEh5Xit0Za4GiTg
 G4wQsH9Ba1tqWNW3tck8uu/7akP/74IdA5x/HdvZ5glQ1GKndTdZmWf6vSgm2tiSEsyo
 RXNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=f4zD4sRXt/BaKHUrk72b5CYeq5O7E4rSDkxxZRR9nwk=;
 b=ThTj73qDaiIZV0Ub0jC8uF6I+hZ7HngxR93FcXkBTe6i0VwsjJc53ETAI80XQodlD1
 gIxnDCLwINk9QIOl/zdVGcvzoThWDnHVRSjlHQ8JTgACSaedkxYQpNwx3RExE8SjWZzy
 GphlZb5esd6mbpR+jbORfKfs+MuUPVDzCuRs/Kmyz8sWcF5GUsy66FlPQ2498ZzfjZAL
 mWyyMV9ZgKkg1ysyX5y6iktg8KzLhmFmGQaMfw5w2P/za5KY8PfqA2XROX5fQhUnGYTd
 1vOeIed3JL2ly7+dCCvJzxgGPPe42P3DUZ6CfwLd97i2Y+BKNdKr+oRoq2LRV5M4kSeH
 garg==
X-Gm-Message-State: AOAM533qhsQ7B0Td8VXKCxehZXkguH1LzTcK40qvoDRYCay3CFjzrRkT
 HUJcMxV7v5otj0edPQO+WHO6VarUU4WoUJsMI3A=
X-Google-Smtp-Source: ABdhPJz1qxEK2X7d17/xd/zoRtK1Cb8snrpNKs/Dd02NFP+LwQN+jqq1so76N0WaodsgOFRgd+dfPnv4xttiOWZ9OMU=
X-Received: by 2002:a05:6638:1211:: with SMTP id
 n17mr1368941jas.26.1618526042339; 
 Thu, 15 Apr 2021 15:34:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210412174248.8668-1-vijai@behindbytes.com>
In-Reply-To: <20210412174248.8668-1-vijai@behindbytes.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 16 Apr 2021 08:33:35 +1000
Message-ID: <CAKmqyKPt9gi8sE0=9-tiNxoeFfmrDb_3JFq8aR_R6PSfAH_5OQ@mail.gmail.com>
Subject: Re: [PATCH] docs: Add documentation for shakti_c machine
To: Vijai Kumar K <vijai@behindbytes.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d32;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd32.google.com
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
X-List-Received-Date: Thu, 15 Apr 2021 22:34:07 -0000

On Tue, Apr 13, 2021 at 3:44 AM Vijai Kumar K <vijai@behindbytes.com> wrote:
>
> Add documentation for Shakti C reference platform.
>
> Signed-off-by: Vijai Kumar K <vijai@behindbytes.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  docs/system/riscv/shakti-c.rst | 82 ++++++++++++++++++++++++++++++++++
>  1 file changed, 82 insertions(+)
>  create mode 100644 docs/system/riscv/shakti-c.rst
>
> diff --git a/docs/system/riscv/shakti-c.rst b/docs/system/riscv/shakti-c.rst
> new file mode 100644
> index 0000000000..a6035d42b0
> --- /dev/null
> +++ b/docs/system/riscv/shakti-c.rst
> @@ -0,0 +1,82 @@
> +Shakti C Reference Platform (``shakti_c``)
> +==========================================
> +
> +Shakti C Reference Platform is a reference platform based on arty a7 100t
> +for the Shakti SoC.
> +
> +Shakti SoC is a SoC based on the Shakti C-class processor core. Shakti C
> +is a 64bit RV64GCSUN processor core.
> +
> +For more details on Shakti SoC, please see:
> +https://gitlab.com/shaktiproject/cores/shakti-soc/-/blob/master/fpga/boards/artya7-100t/c-class/README.rst
> +
> +For more info on the Shakti C-class core, please see:
> +https://c-class.readthedocs.io/en/latest/
> +
> +Supported devices
> +-----------------
> +
> +The ``shakti_c`` machine supports the following devices:
> +
> + * 1 C-class core
> + * Core Level Interruptor (CLINT)
> + * Platform-Level Interrupt Controller (PLIC)
> + * 1 UART
> +
> +Boot options
> +------------
> +
> +The ``shakti_c`` machine can start using the standard -bios
> +functionality for loading the baremetal application or opensbi.
> +
> +Boot the machine
> +----------------
> +
> +Shakti SDK
> +~~~~~~~~~~
> +Shakti SDK can be used to generate the baremetal example UART applications.
> +
> +.. code-block:: bash
> +
> +   $ git clone https://gitlab.com/behindbytes/shakti-sdk.git
> +   $ cd shakti-sdk
> +   $ make software PROGRAM=loopback TARGET=artix7_100t
> +
> +Binary would be generated in:
> +  software/examples/uart_applns/loopback/output/loopback.shakti
> +
> +You could also download the precompiled example applicatons using below
> +commands.
> +
> +.. code-block:: bash
> +
> +   $ wget -c https://gitlab.com/behindbytes/shakti-binaries/-/raw/master/sdk/shakti_sdk_qemu.zip
> +   $ unzip shakti_sdk_qemu.zip
> +
> +Then we can run the UART example using:
> +
> +.. code-block:: bash
> +
> +   $ qemu-system-riscv64 -M shakti_c -nographic \
> +      -bios path/to/shakti_sdk_qemu/loopback.shakti
> +
> +OpenSBI
> +~~~~~~~
> +We can also run OpenSBI with Test Payload.
> +
> +.. code-block:: bash
> +
> +   $ git clone https://github.com/riscv/opensbi.git -b v0.9
> +   $ cd opensbi
> +   $ wget -c https://gitlab.com/behindbytes/shakti-binaries/-/raw/master/dts/shakti.dtb
> +   $ export CROSS_COMPILE=riscv64-unknown-elf-
> +   $ export FW_FDT_PATH=./shakti.dtb
> +   $ make PLATFORM=generic
> +
> +fw_payload.elf would be generated in build/platform/generic/firmware/fw_payload.elf.
> +Boot it using the below qemu command.
> +
> +.. code-block:: bash
> +
> +   $ qemu-system-riscv64 -M shakti_c -nographic \
> +      -bios path/to/fw_payload.elf
> --
> 2.25.1
>
>
>

