Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j2huo-0001qx-DF
	for mharc-qemu-riscv@gnu.org; Fri, 14 Feb 2020 15:50:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57791)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1j2hul-0001pM-W9
 for qemu-riscv@nongnu.org; Fri, 14 Feb 2020 15:50:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1j2hul-0006Ap-0o
 for qemu-riscv@nongnu.org; Fri, 14 Feb 2020 15:50:19 -0500
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144]:37742)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1j2huk-000696-M3; Fri, 14 Feb 2020 15:50:18 -0500
Received: by mail-lf1-x144.google.com with SMTP id b15so7645973lfc.4;
 Fri, 14 Feb 2020 12:50:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RmyzcXzOCcpRLlvjuy8XpxY+v6FkiKTjR/2DdMPfI8E=;
 b=tjepgCWxn4DrC0hh4DrLAPPaRFEkQX4GSM7wCKSyFVeFX/Ut7f901sXB4SEv3OlHNq
 kSKLI7Teo/l5Mepxdmce1z6iELnzbTMOASmh9k1nrcKrK1iLK8xhZnRxx56Cv86P4w4w
 /Cg0YkxZ7tgpd6m0bWE95FCOoCkZVuS/CQgXamayRLx6mwhh3wrvIWy5m8sqsTVd9/nD
 s/nZF5ER2NPRArGvNOFJ7TEVOOAHcnbo7EqQgiS3wezfvgSvl1xIM/Z631OtH/E43qQn
 7yHG0JHsXisv1YsL7XhEqrGBcBy++AGX87nO+BYgFDAiN57YxDoTsxMp+SXi109YB7ej
 g8Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RmyzcXzOCcpRLlvjuy8XpxY+v6FkiKTjR/2DdMPfI8E=;
 b=oFI3dyDg19xt4r71EB9pKyXFTD5XBav3hSm9rOs3zY5lLLS9hc9RNnnmwZZtz2vBBP
 bZFbIgqRw6kcJu+Ue8CZjnwjS0eTx6NYY3bdMYpnuycBYVXy0LiczFoiwuvpQ2/G2eiZ
 GnO8IeC98/7l3FCsiQqorszshNmRgDKRmgUZkQysI7EPxk84Q9o/pPLRF66qF8FG25Re
 IR/o8ybPEQ0JTOGrp48lLL4ISR6s15JjZBEm4p+twWWG4/YH+NH4hNF01jqwNp8DxUH1
 uRMMUlzSyNVphdrwrQEKc2YMZKcnwbl65iARiSAZ5QOl8VNDkEr3+XuOhyQqRdG94iZ4
 z2WQ==
X-Gm-Message-State: APjAAAX+T9/D+yXvrh9U+CCADubpTGDxkGIb77837yG6UjPHuG44MQxT
 WgPMjGl3EX+xTi1SKQfn77wYeI0wTu5GmPUKrIU=
X-Google-Smtp-Source: APXvYqylCa0S4bCmTFDM4y9UtJ/WPqL+Kq/fDYbcXf+HcKUayYVgwZgw80pk/o7Eyrr/sbwJyVvVs5tuRBjH1G8jks0=
X-Received: by 2002:ac2:5310:: with SMTP id c16mr2538689lfh.102.1581713417077; 
 Fri, 14 Feb 2020 12:50:17 -0800 (PST)
MIME-Version: 1.0
References: <20200214072127.64330-1-anup.patel@wdc.com>
 <20200214072127.64330-4-anup.patel@wdc.com>
In-Reply-To: <20200214072127.64330-4-anup.patel@wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 14 Feb 2020 12:42:55 -0800
Message-ID: <CAKmqyKNGEp7vzihmG6m3uTsWL2sL+eD6UaTaO8iro3PDvmwMTQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] hw/riscv/spike: Allow more than one CPUs
To: Anup Patel <anup.patel@wdc.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Atish Patra <atish.patra@wdc.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Anup Patel <anup@brainfault.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::144
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
X-List-Received-Date: Fri, 14 Feb 2020 20:50:21 -0000

On Thu, Feb 13, 2020 at 11:24 PM Anup Patel <anup.patel@wdc.com> wrote:
>
> Currently, the upstream Spike ISA simulator allows more than
> one CPUs so we update QEMU Spike machine on similar lines to
> allow more than one CPUs.
>
> The maximum number of CPUs for QEMU Spike machine is kept
> same as QEMU Virt machine.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/spike.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
> index 060a86f922..1eac0d9a83 100644
> --- a/hw/riscv/spike.c
> +++ b/hw/riscv/spike.c
> @@ -469,7 +469,7 @@ static void spike_machine_init(MachineClass *mc)
>  {
>      mc->desc = "RISC-V Spike Board";
>      mc->init = spike_board_init;
> -    mc->max_cpus = 1;
> +    mc->max_cpus = 8;
>      mc->is_default = 1;
>      mc->default_cpu_type = SPIKE_V1_10_0_CPU;
>  }
> --
> 2.17.1
>
>

