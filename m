Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iL4aM-0007vi-Od
	for mharc-qemu-riscv@gnu.org; Thu, 17 Oct 2019 08:08:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52560)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iL4aK-0007tj-Pl
 for qemu-riscv@nongnu.org; Thu, 17 Oct 2019 08:08:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iL4aJ-0002CQ-NV
 for qemu-riscv@nongnu.org; Thu, 17 Oct 2019 08:08:52 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:36314)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iL4aJ-0002CD-JG
 for qemu-riscv@nongnu.org; Thu, 17 Oct 2019 08:08:51 -0400
Received: by mail-oi1-x242.google.com with SMTP id k20so1931437oih.3
 for <qemu-riscv@nongnu.org>; Thu, 17 Oct 2019 05:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Kvz+9MVpfKERSKaM+4J6RmraJtKLQBXbMl09w0KPDTU=;
 b=xQbbOJh6xvgdMpoE27wv2kVjUjT+Y5rlgKjytOAqsI2A817WCyBZ9IQg6+v+UOmlM6
 DcqZkij3waOeQmFdWHFnkVHZtbkNY6WQ+WWD6jdKz4W2WQojiqNcC0T93iq1WRhnovLo
 GV5F4KrMqQXfobfsYO8t7at9fpsj87NJNyThVKvJzSZR+vvUe5wdkp8wO90/CgXw3ApT
 LcdINWS4p/yMm29iRrgBdBphdxdhq65XyY60oUmRx7O/a5zoQrYtMk/uc7qPEMIx6PjG
 eLkR4fS7mLAUpta+V7L3E/ZqqUUTPNSKUmSYZVutTqE/uBt7TtOOugDKsWs5dtyhM9cl
 kgpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Kvz+9MVpfKERSKaM+4J6RmraJtKLQBXbMl09w0KPDTU=;
 b=TuS8o5vkahGwPlzXTCTnAlDpjBXmqFdgWXyMz8NBoziRAEw6Ckbj/62JhAAjWO0TeI
 7uTzyBStbTD6fkXFDhLmhDuK6P7Vq27QrMx2K/4jYB3Ej8i8n0yRZTbF7EkYTSMf6dca
 eljc7wq+L0pc6hcNblUiARUdb2/ixmQY+tm6VSMiu1RF3p+zw81CmzuFbZbZm8X3ILiH
 p0+7+CAiQ4ce4kAckF7YN+muhWUFVbyc/zCzSH9V5eCtsj5nVK+ev09Bc1R7DKi2LR1l
 vLOl7UWA33Uggx1k6+xA/9vPWtiQPD7MkXMYe/gIWhytDR+6xOoIqaJSWSNAAXIPPnwM
 CuUA==
X-Gm-Message-State: APjAAAXGQt9StAa3+PHuvYSYoDZK1k6nYEoYWT0u3qQwYHY+6vn2/0lR
 NUbMaPz7p3sYpzfGpWBLtAoQ79iyELJu4KlGQzgOhw==
X-Google-Smtp-Source: APXvYqy1lKWqn51y5cSlCxIoQ7xEJnScUnQwveT+GoXiLh0slojCIfAQLzvRyi5Tx1HC+4afschr0VJeOj3WAeJFbNA=
X-Received: by 2002:a05:6808:9:: with SMTP id u9mr2923634oic.98.1571314130588; 
 Thu, 17 Oct 2019 05:08:50 -0700 (PDT)
MIME-Version: 1.0
References: <07ef5d368b4bbada15eaae0d23378a323969026b.1570121723.git.alistair.francis@wdc.com>
In-Reply-To: <07ef5d368b4bbada15eaae0d23378a323969026b.1570121723.git.alistair.francis@wdc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Oct 2019 13:08:39 +0100
Message-ID: <CAFEAcA_Sk2VFxxHV92RpaaRt3MLY2n_xYYM7CSwTTcxLDVtsgg@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] riscv/boot: Fix possible memory leak
To: Alistair Francis <alistair.francis@wdc.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <alistair23@gmail.com>, Palmer Dabbelt <palmer@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
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
X-List-Received-Date: Thu, 17 Oct 2019 12:08:54 -0000

Ping? It would be nice to see this patch get into master
to silence the coverity errors.

thanks
-- PMM

On Thu, 3 Oct 2019 at 18:05, Alistair Francis <alistair.francis@wdc.com> wr=
ote:
>
> Coverity (CID 1405786) thinks that there is a possible memory leak as
> we don't guarantee that the memory allocated from riscv_find_firmware()
> is freed. This is a false positive, but let's tidy up the code to fix
> the warning.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> v2:
>  - Fix commit typos
>
>  hw/riscv/boot.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
>
> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> index 2e92fb0680..7fee98d2f8 100644
> --- a/hw/riscv/boot.c
> +++ b/hw/riscv/boot.c
> @@ -38,7 +38,7 @@ void riscv_find_and_load_firmware(MachineState *machine=
,
>                                    const char *default_machine_firmware,
>                                    hwaddr firmware_load_addr)
>  {
> -    char *firmware_filename;
> +    char *firmware_filename =3D NULL;
>
>      if (!machine->firmware) {
>          /*
> @@ -70,14 +70,11 @@ void riscv_find_and_load_firmware(MachineState *machi=
ne,
>           * if no -bios option is set without breaking anything.
>           */
>          firmware_filename =3D riscv_find_firmware(default_machine_firmwa=
re);
> -    } else {
> -        firmware_filename =3D machine->firmware;
> -        if (strcmp(firmware_filename, "none")) {
> -            firmware_filename =3D riscv_find_firmware(firmware_filename)=
;
> -        }
> +    } else if (strcmp(machine->firmware, "none")) {
> +        firmware_filename =3D riscv_find_firmware(machine->firmware);
>      }
>
> -    if (strcmp(firmware_filename, "none")) {
> +    if (firmware_filename) {
>          /* If not "none" load the firmware */
>          riscv_load_firmware(firmware_filename, firmware_load_addr);
>          g_free(firmware_filename);
> --
> 2.23.0

