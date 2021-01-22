Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l33xe-00064L-6G
	for mharc-qemu-riscv@gnu.org; Fri, 22 Jan 2021 16:27:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l33xd-00063C-0x; Fri, 22 Jan 2021 16:27:17 -0500
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:41675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l33xb-0004JL-HR; Fri, 22 Jan 2021 16:27:16 -0500
Received: by mail-io1-xd36.google.com with SMTP id q1so14129916ion.8;
 Fri, 22 Jan 2021 13:27:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cNtSqKBYYVPkgE3c4O1QNMMPvggSHuOmLIGJfDGvmX0=;
 b=ViVQdNGafF+VcpUKoB36rE0w1aiXEAT/wXey2VrGEYcG4ARz/Z+5dp3Iui5O/+4G/i
 Jfra3zUE8LmntnZYu3cE0phVSEz47Zg/WnR4hkONPGsqxpJdhLIsfjKo5v99SD2NFmyP
 P/Z88ggEw3aAOoG8yFWcUojC3rHQDMu+ak65Qlfuqc0lCn65wPuj1AnrceOhmDLEGvIJ
 OTDG2Crd58u77YS9iFCpZ9vwpW4lG58jq1NqeEm7cP1gprRnSXw+Z31pnaAp1nv1/T3M
 X6qjugE2qjtxTYVuaMo7QwIekMOY/6B2iKfrqVkQFx+ZHRbC/r99nSrXi0yJF5AxktkZ
 p/mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cNtSqKBYYVPkgE3c4O1QNMMPvggSHuOmLIGJfDGvmX0=;
 b=fi5lyww8ubk/RSkIGzMznHoUXX+WYr47SDXH5p1kaAXUe9rVlRbYyWr+vls46c6VWL
 lawuP7pIttAPWzW4RnRrz+ZLllxk6Gdti2zi2svVLtJpiN6NPIcMLcjE8mT6BwAIzQQd
 NmFhaJyZ5FKuB1rhFJdg3Ti8hfQKPK9oliuBiztdivnGJzFEJQA+xcYfjHK/fMB3Tbjm
 si1SAfeTsDhMnKMZyD9sntTxodfbwUNC87rKZ8cyCXAF+MsfAyD9csW1Pctv1VS0dw+q
 HBjdHscGTf7cbWOtznWAMMFXyj6bDUaoZkcCvgXcjzL6kfwggGmRwKz+WeF/wzKQvOSH
 AC+Q==
X-Gm-Message-State: AOAM531XifRcIsEYw22Kil9LbdC5Rsu7MWiNSHrM00kRdivJsxsCA6YB
 eKF/owI1xnWGp9godd1MQ572QkYWHVmOIn3gJ5I=
X-Google-Smtp-Source: ABdhPJy4rvTlnuRwGEw/o6PoBNh7loL0yx/zuOgs3GgFcdp1k2870EqZVzOjQGhRo9GOTCOpMAHQDLD+NylMmLQFn28=
X-Received: by 2002:a02:2544:: with SMTP id g65mr1373263jag.91.1611350834083; 
 Fri, 22 Jan 2021 13:27:14 -0800 (PST)
MIME-Version: 1.0
References: <20210122122958.12311-1-bmeng.cn@gmail.com>
 <20210122122958.12311-4-bmeng.cn@gmail.com>
In-Reply-To: <20210122122958.12311-4-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 22 Jan 2021 13:26:47 -0800
Message-ID: <CAKmqyKO3gG9E2n4cBV1KjLEzGs3Cn9eR3S5S21=uXUeWrUwneQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] hw/riscv: virt: Limit RAM size in a 32-bit system
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d36;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd36.google.com
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
X-List-Received-Date: Fri, 22 Jan 2021 21:27:17 -0000

On Fri, Jan 22, 2021 at 4:34 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> RV32 supports 34-bit physical address hence the maximum RAM size
> should be limitted. Limit the RAM size to 10 GiB, which leaves
> some room for PCIe high mmio space.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  hw/riscv/virt.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 1d05bb3ef9..4f44509360 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -590,6 +590,19 @@ static void virt_machine_init(MachineState *machine)
>          }
>      }
>
> +    /* limit RAM size in a 32-bit system */
> +    if (riscv_is_32bit(&s->soc[0])) {
> +        /*
> +         * Cast machine->ram_size to 64-bit for 32-bit host,
> +         * to make the build on 32-bit host happy.
> +         */
> +        if ((uint64_t)(machine->ram_size) > 10 * GiB) {
> +            /* 32-bit host won't have a chance to execute here */
> +            machine->ram_size = 10 * GiB;
> +            error_report("Limitting RAM size to 10 GiB");
> +        }
> +    }
> +
>      /* register system main memory (actual RAM) */
>      memory_region_init_ram(main_mem, NULL, "riscv_virt_board.ram",
>                             machine->ram_size, &error_fatal);
> --
> 2.25.1
>
>

