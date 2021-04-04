Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lT1AQ-00040P-NU
	for mharc-qemu-riscv@gnu.org; Sun, 04 Apr 2021 07:43:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vijai@behindbytes.com>)
 id 1lT1AM-0003zK-MN; Sun, 04 Apr 2021 07:43:42 -0400
Received: from sender-of-o51.zoho.in ([103.117.158.51]:2306)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vijai@behindbytes.com>)
 id 1lT1AG-000601-JA; Sun, 04 Apr 2021 07:43:42 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1617536600; cv=none; d=zohomail.in; s=zohoarc; 
 b=TA1Oiwgks8qiMGl8s25o/JEGjVoWrPeBeG7f/MX/N9KyB97RJN0B7ski/jm729cnNA1U9fTvcR4xIDB2n+7+FeYsvIlUVFg2xpVASM3DOD8aT94dII2Tl0IrmJQGkjx7Zt4SMuye3KmpHW9OYLdMHinPcmA3l3e8aXgvHODLukY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1617536600;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=4LyU6Pl4ZOGliMNrJGZ1/mWx40MxjWCWlEtl3s9SEMs=; 
 b=I59y76TCbqdfbSxS1RMvrQGwnLyKxaqLPPHgCR7ivsWLUmz9XwieTombFxqY7+J0pBU4XWtfMFnDLd7ANJ37bbqffDH6MFZ/YLmo4j92NhycwE2d1gvRIR/cjVrCvWaN02gDCRxEzSzBnDRVWOcKtV8CZkQsPpK56E7lXCeNLwY=
ARC-Authentication-Results: i=1; mx.zohomail.in;
 dkim=pass  header.i=behindbytes.com;
 spf=pass  smtp.mailfrom=vijai@behindbytes.com;
 dmarc=pass header.from=<vijai@behindbytes.com>
 header.from=<vijai@behindbytes.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1617536600; 
 s=yrk; d=behindbytes.com; i=vijai@behindbytes.com;
 h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding;
 bh=4LyU6Pl4ZOGliMNrJGZ1/mWx40MxjWCWlEtl3s9SEMs=;
 b=Y/x0wyB9X92Lk1pxcCSyOhtUAJqA/Tcfc4zgl2yGKedWsnUg1Ywayi1LOnywGaNm
 z/JOfP1TxVVOKFBqxTfBhJGP8cbda3Mm08TTbyRvVeaTw9HNjhQAG48LeMYa+xpbuo9
 /2J/xt27V85VGQm0qAyy8EJja85p1wYQUB3ABH5w=
Received: from mail.zoho.in by mx.zoho.in
 with SMTP id 1617536596949430.3402440724858;
 Sun, 4 Apr 2021 17:13:16 +0530 (IST)
Date: Sun, 04 Apr 2021 17:13:16 +0530
From: Vijai Kumar K <vijai@behindbytes.com>
To: "Alistair Francis" <alistair23@gmail.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Message-ID: <1789cb1bbd3.19e101ba39087.7536957519746809796@behindbytes.com>
In-Reply-To: <CAKmqyKPAXLHPi_anf_Xbe6=9j-nkBP-b6QRqC4xDUT3u-7riUA@mail.gmail.com>
References: <20210401181457.73039-1-vijai@behindbytes.com>
 <CAKmqyKPAXLHPi_anf_Xbe6=9j-nkBP-b6QRqC4xDUT3u-7riUA@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] Add support for Shakti SoC from IIT-M
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
Received-SPF: pass client-ip=103.117.158.51;
 envelope-from=vijai@behindbytes.com; helo=sender-of-o51.zoho.in
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Sun, 04 Apr 2021 11:43:43 -0000




---- On Sat, 03 Apr 2021 01:35:25 +0530 Alistair Francis <alistair23@gmail.com> wrote ----

 > On Thu, Apr 1, 2021 at 2:15 PM Vijai Kumar K <vijai@behindbytes.com> wrote: 
 > > 
 > > Changes in v3: 
 > >  - Drop SHAKTI_C_DEBUG register 
 > > 
 > > Changes in v2: 
 > >  - Moved CPU addition to a separate patch(P1) 
 > >  - Use riscv_setup_rom_resetvec API to setup reset vector 
 > >  - Dropped unused DPRINTF and unwanted break statements 
 > >  - Fixed uart_can_receive logic 
 > >  - Reused sifive_u_cpu_init routine for shakti 
 > >  - Error out when an unsupported CPU is specified 
 > >  - Addressed formatting changes pointed out in review 
 >  
 > Thanks, I have reviewed these patches and applied them. 
 >  
 > Can you add details to the docs on how to build images and run this machine? 
 >  
 > This is an example for a different board: 
 > https://gitlab.com/qemu-project/qemu/-/blob/master/docs/system/riscv/microchip-icicle-kit.rst 

Sure. I will send that as a separate patch.

Thanks,
Vijai Kumar K

 >  
 > That way others can use this machine and I can generate tests for it. 
 >  
 > Alistair 
 >  
 > > 
 > > Vijai Kumar K (4): 
 > >   target/riscv: Add Shakti C class CPU 
 > >   riscv: Add initial support for Shakti C machine 
 > >   hw/char: Add Shakti UART emulation 
 > >   hw/riscv: Connect Shakti UART to Shakti platform 
 > > 
 > >  MAINTAINERS                                 |   9 + 
 > >  default-configs/devices/riscv64-softmmu.mak |   1 + 
 > >  hw/char/meson.build                         |   1 + 
 > >  hw/char/shakti_uart.c                       | 185 ++++++++++++++++++++ 
 > >  hw/char/trace-events                        |   4 + 
 > >  hw/riscv/Kconfig                            |  10 ++ 
 > >  hw/riscv/meson.build                        |   1 + 
 > >  hw/riscv/shakti_c.c                         | 178 +++++++++++++++++++ 
 > >  include/hw/char/shakti_uart.h               |  74 ++++++++ 
 > >  include/hw/riscv/shakti_c.h                 |  75 ++++++++ 
 > >  target/riscv/cpu.c                          |   1 + 
 > >  target/riscv/cpu.h                          |   1 + 
 > >  12 files changed, 540 insertions(+) 
 > >  create mode 100644 hw/char/shakti_uart.c 
 > >  create mode 100644 hw/riscv/shakti_c.c 
 > >  create mode 100644 include/hw/char/shakti_uart.h 
 > >  create mode 100644 include/hw/riscv/shakti_c.h 
 > > 
 > > -- 
 > > 2.25.1 
 > > 
 > > 
 > 

