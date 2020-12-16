Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kpSuU-0001Lc-Gv
	for mharc-qemu-riscv@gnu.org; Wed, 16 Dec 2020 04:15:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kpSuS-0001Ht-Ez
 for qemu-riscv@nongnu.org; Wed, 16 Dec 2020 04:15:48 -0500
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:42833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kpSuP-0000Uz-TQ
 for qemu-riscv@nongnu.org; Wed, 16 Dec 2020 04:15:48 -0500
Received: by mail-yb1-xb2c.google.com with SMTP id j17so21732975ybt.9
 for <qemu-riscv@nongnu.org>; Wed, 16 Dec 2020 01:15:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=W0LXqv5YrqIShnAJ3j/zRhwKpy8jwb9vaREIG/ChG9c=;
 b=EDmnCHdeeslnwFBXDnjQxisodSQ+2tet7hb2eI+g/TS8FWeN3D95bm5k4ALUksfAqI
 zkHdeewnuq01Yw5Ib/Ogk8Qf710QFMt+ET18cJ2+zqsE9OZevPqYXxeT/jjHWm7s4Ct+
 K2+dXZHEI0QzIlb/szTqkBh6ST7IfMdrwvdO0YD0xE3DLNpfYngIU6d92AbxfjWjpbdP
 G3TIETT0c3ZtgoE0tPV6CYK/Fppg0Svutr+H9SHAvlMtpy8TSi/O46bn07UymQoUISCn
 nxC1LCj7XSmn4BKSAGpQYxSQCvX9HbA0m+xyo/dO5u16jrEsaYxjV0PHeElVo+cFQJ1v
 dmcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=W0LXqv5YrqIShnAJ3j/zRhwKpy8jwb9vaREIG/ChG9c=;
 b=SOyGL2V95qgXwkD+UpwgA8zd3zojVGFlEfZcz/PSYFLWbnutkWWs/CawdJn5q9GlVE
 xAiXY6EWeWzSccOJPPn0mQvPhoIBkxtrLRXFA0bkdSv+hEAoH6Idoo9rNPcsH+ZP12mS
 RJ7g8d1T91K54mf/YirVmBSIhTSOSCkYYV5A8a+M27xs++C2o3TeB+5GQnU4DT1Y57TN
 NCBAUzzBusQSeaXzjKz0+BYkfvO7vceU9QnMmMoxCfU2k/y1KEqSDhKjs5SmrUi/cA4N
 /Q9E+W41Tc/RtGqLl6r+AO284edrrKW0dxfpgcD0XHuAW6fF6igrQuIQVpzgmxEqHSOv
 q5iA==
X-Gm-Message-State: AOAM530eVdtRIyHpmAN73MlZaOE7FICmb/khMB1+B6rVKglIH4xbG15G
 tEnINH5Up9btceaeUSihz6vKw7YHNX18reHudPc=
X-Google-Smtp-Source: ABdhPJx414pazVSH07VBlqNumnWChCa1Vi8stoWiNcygFiqEWZfvi1aoz/+uMUVoDLw68KofbEM3X1P9V8KP6PTHxQQ=
X-Received: by 2002:a25:ec5:: with SMTP id 188mr52665046ybo.387.1608110144920; 
 Wed, 16 Dec 2020 01:15:44 -0800 (PST)
MIME-Version: 1.0
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 16 Dec 2020 17:15:33 +0800
Message-ID: <CAEUhbmX1_3FTO4LwSN37p8itHhsLfUHaJF9qauESEx1E3B1UfA@mail.gmail.com>
Subject: OpenSBI fw_dynamic firmware does not boot 32-bit kernel on QEMU 'virt'
To: OpenSBI <opensbi@lists.infradead.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, Anup Patel <anup.patel@wdc.com>,
 Atish Patra <atish.patra@wdc.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2c.google.com
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
X-List-Received-Date: Wed, 16 Dec 2020 09:15:48 -0000

Hi,

With latest QEMU HEAD, 32-bit kernel with the following kernel commit
reverted [1]

1bd14a66ee5200d6a24419cbd2e0a0fccd4da36f ("RISC-V: Remove any memblock
representing unusable memory area")

still does not boot on QEMU 'virt'. However explicitly specifying
-bios to use the fw_jump firmware will allow the kernel to boot.

When QEMU switched OpenSBI from fw_jump to fw_dynamic during the 5.2.0
development cycle, I remember at that time I tested this on 32-bit
machine for both 'virt' and 'sifive_u'. See the following commit
message as it indicated 32-bit testing.

2cacd8414daf6a0643926392f05fd397ed1e9b66 "hw/riscv: Use pre-built bios
image of generic platform for virt & sifive_u"

I don't have too much time to do the debugging. I hope someone could
pick this up and identify where the problem is.

[1] http://lists.infradead.org/pipermail/linux-riscv/2020-December/003925.html

Regards,
Bin

