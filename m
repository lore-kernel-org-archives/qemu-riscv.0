Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1izg7Y-0001Cn-Ie
	for mharc-qemu-riscv@gnu.org; Thu, 06 Feb 2020 07:19:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36304)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <arei@altlinux.org>) id 1izg7W-00019l-VU
 for qemu-riscv@nongnu.org; Thu, 06 Feb 2020 07:18:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <arei@altlinux.org>) id 1izg7V-0004te-Ro
 for qemu-riscv@nongnu.org; Thu, 06 Feb 2020 07:18:58 -0500
Received: from air.basealt.ru ([194.107.17.39]:37786)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <arei@altlinux.org>) id 1izg7V-0004lo-JL
 for qemu-riscv@nongnu.org; Thu, 06 Feb 2020 07:18:57 -0500
Received: by air.basealt.ru (Postfix, from userid 490)
 id 3FCA1589597; Thu,  6 Feb 2020 12:18:54 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by air.basealt.ru (Postfix) with ESMTPSA id 55A2F5894E9
 for <qemu-riscv@nongnu.org>; Thu,  6 Feb 2020 12:18:52 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id c9so6896178wrw.8
 for <qemu-riscv@nongnu.org>; Thu, 06 Feb 2020 04:18:52 -0800 (PST)
X-Gm-Message-State: APjAAAUi7OdcB6wEnZKVVyqD73lCJ6Ta8TAV5FYUhrBooqzplroetC4F
 GVo2o9gi6OIP97xd+4PxN/SRwrHppBnbKoFcoS0=
X-Google-Smtp-Source: APXvYqw2XqgJ7/NNRZrcm9lm6hwrM9sFxy1jpeKWgK+hnxgqTxGV5LGRPyEvVVQwLRLrq/L/hQwClNiGzeEmhf26YkE=
X-Received: by 2002:adf:f10b:: with SMTP id r11mr3533701wro.307.1580991531783; 
 Thu, 06 Feb 2020 04:18:51 -0800 (PST)
MIME-Version: 1.0
From: Nikita Ermakov <arei@altlinux.org>
Date: Thu, 6 Feb 2020 15:18:16 +0300
X-Gmail-Original-Message-ID: <CANA1cB+D-Uth0C-6qNE5HcAJkQeDsCbKqmYG7uHsLqbbofSsZQ@mail.gmail.com>
Message-ID: <CANA1cB+D-Uth0C-6qNE5HcAJkQeDsCbKqmYG7uHsLqbbofSsZQ@mail.gmail.com>
Subject: SiFive U SPI and SD
To: qemu-riscv@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000a51995059de746ac"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
 timestamps) [generic] [fuzzy]
X-Received-From: 194.107.17.39
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
X-List-Received-Date: Thu, 06 Feb 2020 12:19:00 -0000

--000000000000a51995059de746ac
Content-Type: text/plain; charset="UTF-8"

Hello!

I am trying to make an SD card working on the sifive_u SoC machine.
As far as I understand there is no way to connect an SD card to the SoC
with cmdline for now. So, I started to dig in to the QEMU internals and
especially sifive_u SoC implementation to try to understand how I could
connect SD card to this SoC.

From what I understood I need to:
1) Implement SiFive U SPI controller.
2) Implement spi-sd adapter in a way like the hw/sd/ssi-sd.c

Probably I should merge 1) and 2) into one hw/riscv/sifive_u_spi.c source
file.

Could somebody correct me please if I am wrong at some point?
I am newbie in the QEMU internals :)

The purpose is why I want to implement this is to boot up the Linux kernel
on '-machine sifive_u' and load rootfs from SD.

-- 
Thanks,
Nikita
B8 00 4C CD 21

--000000000000a51995059de746ac
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Hello!<br><br>I am trying to make an SD card wor=
king on the sifive_u SoC machine.<br>As far as I understand there is no way=
 to connect an SD card to the SoC with cmdline for now. So, I started to di=
g in to the QEMU internals and especially sifive_u SoC implementation to tr=
y to understand=C2=A0how I could connect SD card to this SoC.<br><br>From w=
hat I understood I need to:<br>1) Implement SiFive U SPI controller.<br>2) =
Implement spi-sd adapter in a way like the hw/sd/ssi-sd.c<br><br>Probably I=
 should merge 1) and 2) into one hw/riscv/sifive_u_spi.c source file.<br><b=
r>Could somebody=C2=A0correct me please if I am wrong at some=C2=A0point?<b=
r>I am newbie in the QEMU internals :)<br><br>The purpose is why I want to =
implement this is to boot up the Linux kernel on &#39;-machine sifive_u&#39=
; and load rootfs from SD.<br></div><div><br></div>-- <br><div dir=3D"ltr" =
data-smartmail=3D"gmail_signature"><div dir=3D"ltr">Thanks,<br>Nikita<br>B8=
 00 4C CD 21<br></div></div></div></div>

--000000000000a51995059de746ac--

