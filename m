Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lWtw3-0004xo-F2
	for mharc-qemu-riscv@gnu.org; Thu, 15 Apr 2021 00:48:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lWtw1-0004w0-5E; Thu, 15 Apr 2021 00:48:57 -0400
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d]:43917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lWtvz-0006c1-93; Thu, 15 Apr 2021 00:48:56 -0400
Received: by mail-il1-x12d.google.com with SMTP id d2so19078484ilm.10;
 Wed, 14 Apr 2021 21:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WDKqbg1uqLbbmHcYJVFnNdUNlvGknY6GmPoa7Um9/rE=;
 b=ax+gL6UQcb26rO/d8iut1Wz4y/1CBd0SnXv03SE1cw4CNi0FrtY3+mD13ofjO7/M4W
 vnIFSruoJujJ4EX46p7WbkptxBnl9bLHGfHHr1VrNNgkVNwnEJKTzmLQYy+DrqTDYEax
 AwXjsb/t3HBI+7iUvuWoz0EOzenF4M1TvtRu/RYRR02OPKPvSLTw45Rw1Q7MxaYtRDcu
 7DhqWA4U7j2qngnjeC17JsVqWleJz7WiQG+/gaXWrFHfejG7FjpBtAzbijyYMPTAwiA1
 6pObo34iHUlV/zV8q2qYSr8u6jQ8pwlutZ7/LJiP6Zo9PtliMJgk+51KoZiWzAEjeJ/S
 PI5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WDKqbg1uqLbbmHcYJVFnNdUNlvGknY6GmPoa7Um9/rE=;
 b=Mn29L9U+lQ1o8cin5CbWiXmzFnViG/xMft5WN+XZyi6afbJrleu1Q5cE5op1te2wF+
 fZTx0wZgN05fmrpWN4Zf9XG81cziT81KUKvaby7RV1egDAadSN0eOWZluRW3Qc8mKP93
 2VfdIThNEq3XeH1m85zdxwUNvxESDXhbIaBFUCKMR7/Y7ECJfiRJ8b1rMRMrn8hVFwxV
 jiin6iY2WYMXsugUIrNmPrprm/lMtsVVkaYWrAVDruUse4u0btapEN0Rr957k2AH+N09
 7LN5YLJYOnXJ6KH6RVNl+ARPbivArIsggcydZ7TcpUfGkAIasNpzqMQN8iPedWQvcA48
 IHHA==
X-Gm-Message-State: AOAM531o0drZdSQJlQzxDAh6u4BMTdLAD/K5tPEmxJ4wV3bSRn7qRf4Z
 nuDRj0Ot0LHXoGkiWmImaCabOEZ7E1lcVrI/zAo=
X-Google-Smtp-Source: ABdhPJyZk4fLUxB5BCySudays9jIzIBnAYZczyOujYfPIkLflV9RFnqpFrMtGt4gw4sL4CTv3q/xXXC8bZ9pras1LnQ=
X-Received: by 2002:a05:6e02:671:: with SMTP id
 l17mr1323101ilt.267.1618462133253; 
 Wed, 14 Apr 2021 21:48:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210412174248.8668-1-vijai@behindbytes.com>
In-Reply-To: <20210412174248.8668-1-vijai@behindbytes.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 15 Apr 2021 14:48:27 +1000
Message-ID: <CAKmqyKP=rX01hbZRqdiKACgoasHotkN93pwCb3o_o0mpHN5tSw@mail.gmail.com>
Subject: Re: [PATCH] docs: Add documentation for shakti_c machine
To: Vijai Kumar K <vijai@behindbytes.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12d;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12d.google.com
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
X-List-Received-Date: Thu, 15 Apr 2021 04:48:57 -0000

On Tue, Apr 13, 2021 at 3:44 AM Vijai Kumar K <vijai@behindbytes.com> wrote:
>
> Add documentation for Shakti C reference platform.
>
> Signed-off-by: Vijai Kumar K <vijai@behindbytes.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

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

