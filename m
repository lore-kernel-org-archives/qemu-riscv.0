Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p8YVA-0005Xy-Ke
	for mharc-qemu-riscv@gnu.org; Thu, 22 Dec 2022 22:13:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1p8YV9-0005WS-3Q; Thu, 22 Dec 2022 22:13:39 -0500
Received: from mail-vs1-xe2d.google.com ([2607:f8b0:4864:20::e2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1p8YV7-0007oY-Eb; Thu, 22 Dec 2022 22:13:38 -0500
Received: by mail-vs1-xe2d.google.com with SMTP id k11so3488396vsr.4;
 Thu, 22 Dec 2022 19:13:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LWuFGZ6ZvsWYaPluiF6ieS2aYuSHfr46g5GHMG2bXJ8=;
 b=CVJZVmgt9ZUKkPs/VDKkIRtA5UIwQ2ucNGUqz2/qYm3hkLs9+e3aMzTyvikDeomK61
 JiF1RhL3p6t7RbKoFcjVtkFtqAu9BADrVZahRjWxhLqcSy3xoU7ImNSzL7HdLWUVz9fz
 Idx1dbC8+Yu8ErI98eaTLhWUtvFurhNkp5DYiQsj7qk8P8lnZzwz2GHJ1F/Iyv1loqlc
 lxzQuB3DjNzfIYuyBSt/LMKbuljGeSdUpUjyijZp5cL/ZWetasbInUTpnP/qP0tsWNPv
 Opsm6NL1doBKH/oQCPErfm6/EYqyq6l6Ly8g4US217MY7jKBuN+Xlc6k9tyt8e0VaJ4h
 C/nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LWuFGZ6ZvsWYaPluiF6ieS2aYuSHfr46g5GHMG2bXJ8=;
 b=jVFTz7+OJxXqDSKt7K7bQGExs64MV4adlYICAY4CSfor2QGPNfJCEM1gronopj44yn
 g3S+B/Zjw1zMefsx/xzUzy923lILzJZC8jmshRv80RQ/QDwfzIf7sKpON+jhB6sb7Oo4
 w2XN7qsJrqnQBorKuzy1/9LmPdi/S7ScVGfdCb02a/dMbwZYhQ0J6ZIYMI1sle9gujyO
 Q71C9JfF81OS8rjN2I/tAvm3D+sEhSr/8m3s/nEpelnhFNvpNyAOUkSJI9xBq6/DrG/Y
 obtBam7/09tg2je9fdxIjfb/T3koAuYmC9mtrAopvCXxo2zX3iZ4sO1zwqlWaCOqf+R1
 kXpg==
X-Gm-Message-State: AFqh2kp+XjXK1ZLPXdFjYYa6Ew0als5iLBGoqdtf+OBUvFSsZcD5zPO/
 y9uX39UUF5KquFLZTwc8VXJU3Mlihy+ekkQRn0dJ7/9WTb2Zpw==
X-Google-Smtp-Source: AMrXdXsjSLWLMUY58EsY0EqxUQs0/kRuXkIdJa60tbZV1Qb3GqJBrXu6b8F+MmnfZUx/PDOkvWMF2eb4U+N1eagNg2s=
X-Received: by 2002:a05:6102:105:b0:3b1:4aad:9c47 with SMTP id
 z5-20020a056102010500b003b14aad9c47mr986151vsq.73.1671765215784; Thu, 22 Dec
 2022 19:13:35 -0800 (PST)
MIME-Version: 1.0
References: <20221221182300.307900-1-dbarboza@ventanamicro.com>
 <20221221182300.307900-5-dbarboza@ventanamicro.com>
In-Reply-To: <20221221182300.307900-5-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 23 Dec 2022 13:13:08 +1000
Message-ID: <CAKmqyKMdQFefTHdtKRbTMih8OVq5kHkeYNsGW-iHJCSpkjBX8g@mail.gmail.com>
Subject: Re: [PATCH 04/15] hw/riscv/boot.c: make riscv_find_firmware() static
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2d;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2d.google.com
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
X-List-Received-Date: Fri, 23 Dec 2022 03:13:39 -0000

On Thu, Dec 22, 2022 at 4:26 AM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> The only caller is riscv_find_and_load_firmware(), which is in the same
> file.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/boot.c         | 44 ++++++++++++++++++++---------------------
>  include/hw/riscv/boot.h |  1 -
>  2 files changed, 22 insertions(+), 23 deletions(-)
>
> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> index ebd351c840..7361d5c0d8 100644
> --- a/hw/riscv/boot.c
> +++ b/hw/riscv/boot.c
> @@ -75,6 +75,28 @@ target_ulong riscv_calc_kernel_start_addr(RISCVHartArrayState *harts,
>      }
>  }
>
> +static char *riscv_find_firmware(const char *firmware_filename)
> +{
> +    char *filename;
> +
> +    filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, firmware_filename);
> +    if (filename == NULL) {
> +        if (!qtest_enabled()) {
> +            /*
> +             * We only ship OpenSBI binary bios images in the QEMU source.
> +             * For machines that use images other than the default bios,
> +             * running QEMU test will complain hence let's suppress the error
> +             * report for QEMU testing.
> +             */
> +            error_report("Unable to load the RISC-V firmware \"%s\"",
> +                         firmware_filename);
> +            exit(1);
> +        }
> +    }
> +
> +    return filename;
> +}
> +
>  target_ulong riscv_find_and_load_firmware(MachineState *machine,
>                                            const char *default_machine_firmware,
>                                            hwaddr firmware_load_addr,
> @@ -104,28 +126,6 @@ target_ulong riscv_find_and_load_firmware(MachineState *machine,
>      return firmware_end_addr;
>  }
>
> -char *riscv_find_firmware(const char *firmware_filename)
> -{
> -    char *filename;
> -
> -    filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, firmware_filename);
> -    if (filename == NULL) {
> -        if (!qtest_enabled()) {
> -            /*
> -             * We only ship OpenSBI binary bios images in the QEMU source.
> -             * For machines that use images other than the default bios,
> -             * running QEMU test will complain hence let's suppress the error
> -             * report for QEMU testing.
> -             */
> -            error_report("Unable to load the RISC-V firmware \"%s\"",
> -                         firmware_filename);
> -            exit(1);
> -        }
> -    }
> -
> -    return filename;
> -}
> -
>  target_ulong riscv_load_firmware(const char *firmware_filename,
>                                   hwaddr firmware_load_addr,
>                                   symbol_fn_t sym_cb)
> diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
> index 93e5f8760d..c03e4e74c5 100644
> --- a/include/hw/riscv/boot.h
> +++ b/include/hw/riscv/boot.h
> @@ -37,7 +37,6 @@ target_ulong riscv_find_and_load_firmware(MachineState *machine,
>                                            const char *default_machine_firmware,
>                                            hwaddr firmware_load_addr,
>                                            symbol_fn_t sym_cb);
> -char *riscv_find_firmware(const char *firmware_filename);
>  target_ulong riscv_load_firmware(const char *firmware_filename,
>                                   hwaddr firmware_load_addr,
>                                   symbol_fn_t sym_cb);
> --
> 2.38.1
>
>

