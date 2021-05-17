Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1liTN0-0001Pv-Gf
	for mharc-qemu-riscv@gnu.org; Sun, 16 May 2021 22:52:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1liTMw-0001OW-B6; Sun, 16 May 2021 22:52:36 -0400
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36]:36467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1liTMt-0001gk-IN; Sun, 16 May 2021 22:52:34 -0400
Received: by mail-yb1-xb36.google.com with SMTP id m9so6595009ybm.3;
 Sun, 16 May 2021 19:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=yuG0lKhKVaXDK5gD/3lNWmSgzpwAlgg/q+RSd8dj0jM=;
 b=YJOYeMgBWfiBei1gzM5FU5sbauALpWBxmo00sNxOZI4UXyGeUi7tcSW2XqJR45kQ8E
 KevgCiy7b2/C7ZCFE64yjAOz9FuePX1nzuX/S9esi3qjU5AJAMKPqjFVc8QIJoNl7yYL
 zDEmCIaY3BqxB6WFAFhicFlm5ctzcJVilH7yw+CKDJwM+PZGPswA28utzBKoD3cgv6S0
 uyyiDy0O3f858TDy1AsMpW5KE8lgJidpM9smJLujTb7XAf/hvMbo0SHk61GXabSZjhBy
 TtC/KLmXiPloHbSFHWKD+2lqcUWlh2uLPWCHuVMBXfVvHVr+pn757VDhv0MdHjoKVOBT
 BtWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=yuG0lKhKVaXDK5gD/3lNWmSgzpwAlgg/q+RSd8dj0jM=;
 b=B6pG1I4cVvRm9oNBzPcJnPa/aPTz/X6ihFbRGOTRkqh+uOCZFDXuvAh72qInuFQGAQ
 Qg/9ZSJNBI8V5NaKsHL6it4G+bVgTJtyeSasiCfDBzP+NibXtKHG58C6pBFr7pVFrYRy
 6x1prv5DAcD1B/OZSU2fGTxBgmh4q/jlYMDoDw16sgq0YADCb/g1zoBbzUadlEmjr19D
 oOLszIOr4Zm1ddBNducHkO5315HQGaVwbYRw6vmK54Y9L8LZPzmzGXQKMtkEMWCZXUAm
 YJJoA/qkEnX/Ega66hBS++HfuhkWPjks8nAQ9O6E/+Z4S0kB0f/DKTSZGwpvBektbeLf
 zfTw==
X-Gm-Message-State: AOAM53262SX34+0FpamDn6wkIt+3YkLSyU06Xm7rmteMjyDN86Yc72Sr
 gyUaIoHKALEUEzSfRYHJC9KgfgzjfnS4a77TJuw=
X-Google-Smtp-Source: ABdhPJy6g4nrzP/CSNl3mzFrWdd0N6TZVSxlnc2ficb7LVIyqYkyJtES+wHXJH8nAG9NkbNsAh8NQa2zTe6XRr1RS8Q=
X-Received: by 2002:a05:6902:1543:: with SMTP id
 r3mr46664668ybu.332.1621219949662; 
 Sun, 16 May 2021 19:52:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210515173716.358295-1-philmd@redhat.com>
 <20210515173716.358295-12-philmd@redhat.com>
In-Reply-To: <20210515173716.358295-12-philmd@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 17 May 2021 10:52:18 +0800
Message-ID: <CAEUhbmUTkX_zAO5VdMjxrFj+PF1Vp9y2ffW6mkrrNLWEKFvHAA@mail.gmail.com>
Subject: Re: [PATCH v2 11/12] hw/isa/vt82c686: Add missing Kconfig dependency
 (runtime error)
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, Bin Meng <bin.meng@windriver.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 qemu-arm <qemu-arm@nongnu.org>, qemu-ppc <qemu-ppc@nongnu.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Mon, 17 May 2021 02:52:36 -0000

On Sun, May 16, 2021 at 1:46 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
> When building the Pegasos2 machine stand-alone we get:
>
>   $ qemu-system-ppc -M pegasos2 -bios pegasos2.rom
>   ERROR:qom/object.c:714:object_new_with_type: assertion failed: (type !=
=3D NULL)
>   Bail out! ERROR:qom/object.c:714:object_new_with_type: assertion failed=
: (type !=3D NULL)
>
> Looking at the backtrace:
>
>   Thread 1 "qemu-system-ppc" received signal SIGABRT, Aborted.
>   (gdb) bt
>   #0  0x00007ffff53877d5 in raise () at /lib64/libc.so.6
>   #1  0x00007ffff5370895 in abort () at /lib64/libc.so.6
>   #2  0x00007ffff6dc4b6c in g_assertion_message_expr.cold () at /lib64/li=
bglib-2.0.so.0
>   #3  0x00007ffff6e229ff in g_assertion_message_expr () at /lib64/libglib=
-2.0.so.0
>   #4  0x0000555555a0c8f4 in object_new_with_type (type=3D0x0) at qom/obje=
ct.c:714
>   #5  0x0000555555a0c9d5 in object_new (typename=3D0x555555c7afe4 "isa-pi=
t") at qom/object.c:747
>   #6  0x0000555555a053b8 in qdev_new (name=3D0x555555c7afe4 "isa-pit") at=
 hw/core/qdev.c:153
>   #7  0x00005555557cdd05 in isa_new (name=3D0x555555c7afe4 "isa-pit") at =
hw/isa/isa-bus.c:160
>   #8  0x00005555557cf518 in i8254_pit_init (bus=3D0x55555603d140, base=3D=
64, isa_irq=3D0, alt_irq=3D0x0) at include/hw/timer/i8254.h:54
>   #9  0x00005555557d12f9 in vt8231_realize (d=3D0x5555563d9770, errp=3D0x=
7fffffffcc28) at hw/isa/vt82c686.c:704
>   #10 0x00005555557e1340 in pci_qdev_realize (qdev=3D0x5555563d9770, errp=
=3D0x7fffffffcca0) at hw/pci/pci.c:2116
>   #11 0x0000555555a06a84 in device_set_realized (obj=3D0x5555563d9770, va=
lue=3Dtrue, errp=3D0x7fffffffcda8) at hw/core/qdev.c:761
>   #12 0x0000555555a0ff9e in property_set_bool (obj=3D0x5555563d9770, v=3D=
0x5555563da090, name=3D0x555555cd7881 "realized", opaque=3D0x5555560acf80, =
errp=3D0x7fffffffcda8) at qom/object.c:2257
>   #13 0x0000555555a0e098 in object_property_set (obj=3D0x5555563d9770, na=
me=3D0x555555cd7881 "realized", v=3D0x5555563da090, errp=3D0x555555fc3fa0 <=
error_fatal>) at qom/object.c:1402
>   #14 0x0000555555a12271 in object_property_set_qobject (obj=3D0x5555563d=
9770, name=3D0x555555cd7881 "realized", value=3D0x5555563cf0a0, errp=3D0x55=
5555fc3fa0 <error_fatal>) at qom/qom-qobject.c:28
>   #15 0x0000555555a0e3fb in object_property_set_bool (obj=3D0x5555563d977=
0, name=3D0x555555cd7881 "realized", value=3Dtrue, errp=3D0x555555fc3fa0 <e=
rror_fatal>) at qom/object.c:1472
>   #16 0x0000555555a05b15 in qdev_realize (dev=3D0x5555563d9770, bus=3D0x5=
555563d32b0, errp=3D0x555555fc3fa0 <error_fatal>) at hw/core/qdev.c:389
>   #17 0x0000555555a05b42 in qdev_realize_and_unref (dev=3D0x5555563d9770,=
 bus=3D0x5555563d32b0, errp=3D0x555555fc3fa0 <error_fatal>) at hw/core/qdev=
.c:396
>   #18 0x00005555557e160f in pci_realize_and_unref (dev=3D0x5555563d9770, =
bus=3D0x5555563d32b0, errp=3D0x555555fc3fa0 <error_fatal>) at hw/pci/pci.c:=
2181
>   #19 0x00005555557e165b in pci_create_simple_multifunction (bus=3D0x5555=
563d32b0, devfn=3D96, multifunction=3Dtrue, name=3D0x555555c9b63b "vt8231-i=
sa") at hw/pci/pci.c:2189
>   #20 0x0000555555867730 in pegasos2_init (machine=3D0x5555560427a0) at h=
w/ppc/pegasos2.c:105
>
> The "isa-pit" type (TYPE_I8254) is missing. Add it.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/isa/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

