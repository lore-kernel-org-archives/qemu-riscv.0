Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jT5QS-0004XQ-6h
	for mharc-qemu-riscv@gnu.org; Mon, 27 Apr 2020 11:12:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34934)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1jT5QP-0004Vj-TJ
 for qemu-riscv@nongnu.org; Mon, 27 Apr 2020 11:12:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1jT5QO-00032v-MW
 for qemu-riscv@nongnu.org; Mon, 27 Apr 2020 11:12:01 -0400
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43]:38523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jT5QO-00032g-9Y; Mon, 27 Apr 2020 11:12:00 -0400
Received: by mail-io1-xd43.google.com with SMTP id k23so3930575ios.5;
 Mon, 27 Apr 2020 08:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bQC9YrZwNZd+ktPJ54JuZ1nVS3UC6gm5Yi5AwrSK9nc=;
 b=cEIc0kzANU3cjt6QCyr+69CboKjB+/CubIU7ePIBaaGSas4MV4vBLrCZOnypXWoZ/8
 350BgdKvHURfuz6BDaKklunqzxQ5aPE+60tM5DCa+KsgEOOnFMgHBZrH91guYrtZXFJW
 co9OoGtJHdcdc7fb7FI3lJJETyrisatzMRhNQip1NQpJD9sIANnE6qKGBuc+EXBoZ6q1
 fANl6PJwvqSGye1gzS+j4PX8ldVLhxF16Y1fu3O5m16sRZbGq1LPhdtPS3w0MfuqpVz1
 7XHLHhX7ki1XGZLHieD0OF4OO2P2QvUTY4FGCpPtVqeXxwG8LRxoHZ8p2Ji8W/gcYsPz
 JTHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bQC9YrZwNZd+ktPJ54JuZ1nVS3UC6gm5Yi5AwrSK9nc=;
 b=EUZNFWHxDkgC4kiTIFQSuAgmwlyRDSdky6N11mRo1L40mkJHhhuluyhq2b7wNfcp1E
 mv55ivScfmN4f0Fuj70CpfRt/xFrlEbICsAsVirpsRjZF88v0R8NK7Fh5kpuV5Lv78I2
 LlHxaxcmhbxeCvJSsC2V8Bpti4B0Bx+Z8cev/J0yMAdZ8PzJcc5nHPHS4X0vmlLfLG8H
 wEdU+wRgOs8NH8s9r5MOM4v5wngT9hVZM5mVGMMJ6zEn/i3UM0/0cmCilDNJxDxaiDgr
 86/TMfHq/VG6F9fU/fZyd3OtUsYHqaGTADN2KRnOQys0H5L53KjTpep7KSsKQkJwfvzF
 2B9w==
X-Gm-Message-State: AGi0Pub4TflM1YKpSUbIAabshDO/G3C7I6HCMegSDiyorhUdjtOKo6bo
 IR0ASxF9JW7N/0A4yJPhCVcsKVaH0x24Rk454BfV/Rbt
X-Google-Smtp-Source: APiQypIa99jfA4ePJku8625JMpF1edDWgd4m803mUOCvQjK3tpxGtvhv5tbWn2drFccRaN/UkqVdnGCXKpUUOamtmlI=
X-Received: by 2002:a02:1a01:: with SMTP id 1mr21207977jai.26.1588000317488;
 Mon, 27 Apr 2020 08:11:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200427080644.168461-1-anup.patel@wdc.com>
 <20200427080644.168461-3-anup.patel@wdc.com>
In-Reply-To: <20200427080644.168461-3-anup.patel@wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 27 Apr 2020 08:03:20 -0700
Message-ID: <CAKmqyKMPxjBheXAV_kMpyv_8d-CBfowV+3gP+uz26bQiCPhRJg@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] hw/riscv/spike: Allow loading firmware separately
 using -bios option
To: Anup Patel <anup.patel@wdc.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Atish Patra <atish.patra@wdc.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Anup Patel <anup@brainfault.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d43;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd43.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::d43
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
X-List-Received-Date: Mon, 27 Apr 2020 15:12:02 -0000

On Mon, Apr 27, 2020 at 1:08 AM Anup Patel <anup.patel@wdc.com> wrote:
>
> This patch extends Spike machine support to allow loading OpenSBI
> firmware (fw_jump.elf) separately using -bios option.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/spike.c | 24 +++++++++++++++++++++++-
>  1 file changed, 23 insertions(+), 1 deletion(-)
>
> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
> index 5053fe4590..b0395e227c 100644
> --- a/hw/riscv/spike.c
> +++ b/hw/riscv/spike.c
> @@ -45,6 +45,12 @@
>
>  #include <libfdt.h>
>
> +#if defined(TARGET_RISCV32)
> +# define BIOS_FILENAME "opensbi-riscv32-spike-fw_jump.elf"
> +#else
> +# define BIOS_FILENAME "opensbi-riscv64-spike-fw_jump.elf"
> +#endif
> +
>  static const struct MemmapEntry {
>      hwaddr base;
>      hwaddr size;
> @@ -183,8 +189,24 @@ static void spike_board_init(MachineState *machine)
>      memory_region_add_subregion(system_memory, memmap[SPIKE_MROM].base,
>                                  mask_rom);
>
> +    riscv_find_and_load_firmware(machine, BIOS_FILENAME,
> +                                 memmap[SPIKE_DRAM].base,
> +                                 htif_symbol_callback);
> +
>      if (machine->kernel_filename) {
> -        riscv_load_kernel(machine->kernel_filename, htif_symbol_callback);
> +        uint64_t kernel_entry = riscv_load_kernel(machine->kernel_filename,
> +                                                  htif_symbol_callback);
> +
> +        if (machine->initrd_filename) {
> +            hwaddr start;
> +            hwaddr end = riscv_load_initrd(machine->initrd_filename,
> +                                           machine->ram_size, kernel_entry,
> +                                           &start);
> +            qemu_fdt_setprop_cell(s->fdt, "/chosen",
> +                                  "linux,initrd-start", start);
> +            qemu_fdt_setprop_cell(s->fdt, "/chosen", "linux,initrd-end",
> +                                  end);
> +        }
>      }
>
>      /* reset vector */
> --
> 2.25.1
>
>

