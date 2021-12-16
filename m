Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mxjgk-00088D-HM
	for mharc-qemu-riscv@gnu.org; Thu, 16 Dec 2021 00:52:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1mxjgi-00086C-Ct
 for qemu-riscv@nongnu.org; Thu, 16 Dec 2021 00:52:20 -0500
Received: from [2a00:1450:4864:20::32a] (port=50974
 helo=mail-wm1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1mxjgf-0000AM-BP
 for qemu-riscv@nongnu.org; Thu, 16 Dec 2021 00:52:20 -0500
Received: by mail-wm1-x32a.google.com with SMTP id b73so2716016wmd.0
 for <qemu-riscv@nongnu.org>; Wed, 15 Dec 2021 21:52:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tMPSN2ANwa090WgYIMxJe5NVOEMqce7qNPskw7/FOCI=;
 b=72wRnxxco19XRDiOBn1f6i43OG8zB2OJk/fDr7P7tnKmDdjQyFgtipLBAbuOAshFHE
 QDHtr3DC81FN/28ipeodZ1W9gNocJuTJQPmC7nj72yN/SUQ2cM+Fafy8a79EdI5HPzBT
 56gWCCQKFj7rjdwdfBl1Y9qw4jQvZ1scC9isqI45fmdeaUPimflXJSMKq2xpPQCqw1Qu
 rsjtBsZgikJMzYkokxO64YUj09ge2opOTdWJblgUhEiAmsV/P232U+iOwM2QCE5TckO2
 VBakgXBQyEdhjpypACaoZGXK4WWC2i0cu51PwwgwPsJLA8XD06RlVKAfH77moIHRuTny
 W80A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tMPSN2ANwa090WgYIMxJe5NVOEMqce7qNPskw7/FOCI=;
 b=JLPedyVZLu143g+UdhqZQJDzxmoxekr87SnzS4QKojxr6qd4bZ4wCzbvh278eMD63V
 W/b01WW/zYYvNondiYdJXSkgWfvjrkaFysdtw1oWtuHI5UDMQM4UPGFvMXN16vn1lUwL
 U8XnofzDKYc/pa4nmmay8npdv+DIXsp61X/xhD94W87M9Qc27Z/xadNfArGi2LGU2eme
 Lqs2BxLQtka1FWyS+T33pbB+Apnk/Bh+DcOLF6YKfuzKAKqv6OP3+4k16++anGZ+KWSn
 MjkS0oh9C+g8PLAW2sKW7Hqc2FGNdEODFzIlvBxNSpSg4kHwEB6TwwnPTR5L+oh/kKAf
 VDuQ==
X-Gm-Message-State: AOAM533ActIhKTvkKKFY83o5+wVV8RxSU2ClZOqHcrbcbZaqLshtz2eO
 DOcrZJgGIHWGzUqY7H3nt/x+z8dErmDyrNClFUs40A==
X-Google-Smtp-Source: ABdhPJwCkTKV63kPtFI7EPfEq8dOp7mvT5s5vkxG6D5tM9O+YTGESbORx/0mAD9rVMTnVZ7FgT/V/bSSJ9YPwfJLlYc=
X-Received: by 2002:a7b:c194:: with SMTP id y20mr3361474wmi.61.1639633935667; 
 Wed, 15 Dec 2021 21:52:15 -0800 (PST)
MIME-Version: 1.0
References: <20211216045427.757779-1-alistair.francis@opensource.wdc.com>
 <20211216045427.757779-10-alistair.francis@opensource.wdc.com>
In-Reply-To: <20211216045427.757779-10-alistair.francis@opensource.wdc.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 16 Dec 2021 11:22:04 +0530
Message-ID: <CAAhSdy1vuOPJxykzM7C3csvJPbMK9dOAskbQkMLQMQ289hDyEg@mail.gmail.com>
Subject: Re: [PATCH v2 9/9] hw/riscv: virt: Set the clock-frequency
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <alistair23@gmail.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32a
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::32a;
 envelope-from=anup@brainfault.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Thu, 16 Dec 2021 05:52:20 -0000

On Thu, Dec 16, 2021 at 10:31 AM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> As per the device tree specification let's set the clock-frequency for
> the virt CPUs.
>
> QEMU doesn't really have an exact clock, so let's just 1000000 as it's a
> nice round number and matches the sifive_u CLINT_TIMEBASE_FREQ.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/472 (RISC-V virt)
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  hw/riscv/virt.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 3af074148e..41a85cfc60 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -202,6 +202,7 @@ static void create_fdt_socket_cpus(RISCVVirtState *s, int socket,
>          qemu_fdt_setprop_cell(mc->fdt, cpu_name, "reg",
>              s->soc[socket].hartid_base + cpu);
>          qemu_fdt_setprop_string(mc->fdt, cpu_name, "device_type", "cpu");
> +        qemu_fdt_setprop_cell(mc->fdt, cpu_name, "clock-frequency", 1000000);

Instead of hard-coding, please use the same define used for timebase-frequency
(i.e. RISCV_ACLINT_DEFAULT_TIMEBASE_FREQ)

Regards,
Anup

>          riscv_socket_fdt_write_id(mc, mc->fdt, cpu_name, socket);
>          qemu_fdt_setprop_cell(mc->fdt, cpu_name, "phandle", cpu_phandle);
>
> --
> 2.31.1
>
>

