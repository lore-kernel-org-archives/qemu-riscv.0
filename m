Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hZ1lQ-0004aM-Cd
	for mharc-qemu-riscv@gnu.org; Thu, 06 Jun 2019 19:25:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44616)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alistair23@gmail.com>) id 1hZ1lO-0004XC-3P
 for qemu-riscv@nongnu.org; Thu, 06 Jun 2019 19:25:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1hZ1lK-0004WL-6z
 for qemu-riscv@nongnu.org; Thu, 06 Jun 2019 19:25:42 -0400
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243]:45099)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1hZ1l6-00049P-Vn; Thu, 06 Jun 2019 19:25:26 -0400
Received: by mail-lj1-x243.google.com with SMTP id m23so93910lje.12;
 Thu, 06 Jun 2019 16:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=KNTvLFD7w+9/xP9677N4cwlkAJIGtf1kYYMVISpb9vM=;
 b=dgephw/6QcFQKoYLWqQ5W48KeyHxELsJKsvKUuGERI2P/ZEW/mzKkf12nJ6wOaooOC
 JRmQukj2DYP+BiobflwbEYIYBs+i8noo/kRen5bwVAZgh9+HDltjuRACrPc2JmcR5Es0
 qmmiifPdbLccZVmL9jKRpuw2o/z/70yAY5qNrZJLisI6MlQYC0BBl/4Dfl7oI17ADXP7
 gJWrnKWd+7pg50YHaIZKE23I/jtDOti98MgcE7Vh74RC33tRI2hhGxgF4M4oA+qiXYYT
 SDbfXMdAHACfHMcjanofyIe1M3T1uv6/gSwd47NrotU3h0Wm/8QrqdYtcv6EYPGkUnLZ
 IFhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=KNTvLFD7w+9/xP9677N4cwlkAJIGtf1kYYMVISpb9vM=;
 b=tESJZoHT2rjWShQYHm3PLwFjJM0TIeSLQkpu5bvENwVe8yvsK/G8/ZY/Ht6B6PJaWB
 SKR+8f6DvCqdHh6T+hJO72THENyATDceyRy4s4cIL0E9c+jhSjZsaHWSijxBQs6AxRXc
 yTP7rV5Hc8ggi3Wns/D9dnpoYAuKgnu8M0gxrmlLuo2Rv1YgINvIDgr8tzHwkzPj0vlP
 bRyjnqHPUyM6WZBcClv+3qvzMeRZQAzOqeMiOAMQWJaW0zs0iXFCSfyHFmoY48xs0fYF
 s7yczEZke4OVdAMAvLxcX1bMyjfP+XOtLWwimNAama94RraXq4XriLNefsujoQjnatzU
 SMlw==
X-Gm-Message-State: APjAAAXJKbwCw9Epmt/V/yK627Zul+47L8DGVPZVedN9fbhxQhzueCmk
 SEErjDyRXfcB7mihOJC+e9+R00yAGAqvn1he1coJCsJy
X-Google-Smtp-Source: APXvYqxp9KGYIBhXJzqaXJCOM+vImhdlM27WpIjsNdAeRbZmK/vfdbk+ch1jr5RphL2S9dhqOA2hxuBfpR2lUS/W9Nc=
X-Received: by 2002:a2e:8988:: with SMTP id c8mr23515805lji.99.1559863521316; 
 Thu, 06 Jun 2019 16:25:21 -0700 (PDT)
MIME-Version: 1.0
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 6 Jun 2019 16:22:47 -0700
Message-ID: <CAKmqyKMs4nt0eddFkXHG9vOdxnj=yB8jx8s9NivNiwvVg8TObA@mail.gmail.com>
To: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@sifive.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>, onathan@fintelia.io
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::243
Subject: [Qemu-riscv] RISC-V: Include ROM in QEMU
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
X-List-Received-Date: Thu, 06 Jun 2019 23:25:43 -0000

Hello,

As a test of the waters, how would the QEMU community feel about
including the RISC-V OpenSBI project as a ROM submodule?

The idea would be to have OpenSBI (similar to ATF for ARM and a BIOS
for x86) included by default to simplify the QEMU RISC-V boot process
for users. This would remove the requirement for users/developers to
build a RISC-V firmware. The goal here is to allow people to just
download and run their kernel as easily as they currently do for x86.

We would make sure that it can be disabled! That is users/developers
can use their own (or none) if they want to. The idea here is just to
simplify the boot process, not lock anyone out.

Alistair

