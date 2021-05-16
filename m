Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1liPWG-0006Xi-6P
	for mharc-qemu-riscv@gnu.org; Sun, 16 May 2021 18:45:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1liPWE-0006XK-VA; Sun, 16 May 2021 18:45:54 -0400
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e]:47023)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1liPWC-00029K-3D; Sun, 16 May 2021 18:45:54 -0400
Received: by mail-il1-x12e.google.com with SMTP id o10so3476175ilm.13;
 Sun, 16 May 2021 15:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=hrXTXWPZhn9oIB3MzeEglY9dwQ0r4L02q/8ExvhFZbw=;
 b=qxxaG+ehJ9icUOcoV71MVH6cFtuY1fTqf+musbrd5cmQ9Ug4BeHZiaQ5OQ8I2yd/ok
 S3fteqHpedh8xiWTmoZhmUtZD0DuaLeCFowjgGlAAq5ymvsiPgWk/EHl+8VrsnO/1LbN
 wCrSr6aQE/wRPLL+91hQ+rqo3U2VjqZnffCGX0dkvXdPc+RIbiZMPYRUTNo7rKTILc5Q
 eKeXHtpQj3f5ZDBa40JcIE/Mvxgp6IfrGBX1Qo8BEhQip0TuwCncv4ZkOk8C2HoKKyf/
 OVfP4ce4E4ZL1M/BcxlqscmaBSa0OglV98HxlzQWcLXo3oLPwindDQOZdP7CvLpKoeux
 Awhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hrXTXWPZhn9oIB3MzeEglY9dwQ0r4L02q/8ExvhFZbw=;
 b=ZtGLKObQ4P7Y7J/9qQiAzsFRb0dLm+/4IVYBrkcYwZZmMsZW55OF1+x9Nnz/9cTaMz
 Khx6ooeYMbgoHfKtV/ks2esUUVfKbBBwNZjrfdd8yu3Jc7YTljlNcC2M7qxjoZ2x2h1Q
 eDnmAEXePIo3kTOh+4oqQ43D4GavuX24YaZu4nHkqX+s0E4tNm9cX4hDNksI9dZ4tYWk
 PNkg/9sMAuIX9YgsWeUwQWVCDNsLL1B0Cda73GT/GcO6QWAiJfxFDKhSYPBPjqgT/H+L
 T9HZgtt5zGIgXqRn5M23h+gBJP/lMBZXvgSHcOt48cpCfzO2cx4OuT/Mkpy02rtrJ1Ev
 7tXQ==
X-Gm-Message-State: AOAM530DOj3LR6dObRwGicmPmjJx/Xq3RV5rJsIzKjzyZDnojxosPGuz
 T6XGQS1/TZ6N28YZIe5bPBBC4vql8If04i1r9EA=
X-Google-Smtp-Source: ABdhPJyChSVEi0cRmMRA0GrMvYIzvlnEUAF3o9sGjsGNyJ/vsKUyc5Hzxv803d1qh2J6p/FPPUzcVvH7CEA2rTz4oz8=
X-Received: by 2002:a92:c26d:: with SMTP id h13mr21674973ild.131.1621205149495; 
 Sun, 16 May 2021 15:45:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210515173716.358295-1-philmd@redhat.com>
 <20210515173716.358295-7-philmd@redhat.com>
In-Reply-To: <20210515173716.358295-7-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 17 May 2021 08:45:23 +1000
Message-ID: <CAKmqyKMDXfDEKVE+5DLJ7SoTw5p9V4E3BCD5xFvFGQsgmaJrjA@mail.gmail.com>
Subject: Re: [PATCH v2 06/12] hw/riscv/Kconfig: Add missing dependency
 MICROCHIP_PFSOC -> SERIAL
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, Bin Meng <bin.meng@windriver.com>, 
 qemu-arm <qemu-arm@nongnu.org>, "open list:New World" <qemu-ppc@nongnu.org>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::12e;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12e.google.com
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
X-List-Received-Date: Sun, 16 May 2021 22:45:55 -0000

On Sun, May 16, 2021 at 3:44 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Commit a8fb0a500a6 ("hw/char: Add Microchip PolarFire SoC MMUART
> emulation") added a dependency on the SERIAL model, but forgot to
> add the Kconfig selector.
> Add the dependency to the MCHP_PFSOC_MMUART symbol to fix when
> building the MICROCHIP_PFSOC machine stand-alone:
>
>   /usr/bin/ld: libcommon.fa.p/hw_char_mchp_pfsoc_mmuart.c.o: in function =
`mchp_pfsoc_mmuart_create':
>   hw/char/mchp_pfsoc_mmuart.c:79: undefined reference to `serial_mm_init'
>
> Fixes: a8fb0a500a6 ("hw/char: Add Microchip PolarFire SoC MMUART emulatio=
n")
> Acked-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> Cc: Bin Meng <bin.meng@windriver.com>
> Cc: Alistair Francis <alistair.francis@wdc.com>
> ---
>  hw/char/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/char/Kconfig b/hw/char/Kconfig
> index 4cf36ac637b..2e4f620b13e 100644
> --- a/hw/char/Kconfig
> +++ b/hw/char/Kconfig
> @@ -61,6 +61,7 @@ config AVR_USART
>
>  config MCHP_PFSOC_MMUART
>      bool
> +    select SERIAL
>
>  config SIFIVE_UART
>      bool
> --
> 2.26.3
>
>

