Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hmV6F-0006zi-V8
	for mharc-qemu-riscv@gnu.org; Sat, 13 Jul 2019 23:22:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49043)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bmeng.cn@gmail.com>) id 1hmV6E-0006zc-AQ
 for qemu-riscv@nongnu.org; Sat, 13 Jul 2019 23:22:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1hmV6D-0002HD-AG
 for qemu-riscv@nongnu.org; Sat, 13 Jul 2019 23:22:54 -0400
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541]:38030)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1hmV6D-0002EZ-34; Sat, 13 Jul 2019 23:22:53 -0400
Received: by mail-ed1-x541.google.com with SMTP id r12so12366817edo.5;
 Sat, 13 Jul 2019 20:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Q08jYk21ViY8XgmFrkgiDweXa0UOtGJGIiHOB+F8ez4=;
 b=SOx4d1RtgKGlPEYklSi415+eZcmTCC3oyPfUiCbHPwW5OF9XnycOYHw/1JNkYkl7Y2
 42cYqRf89fxWrWgFYTDTSzhNDx/dO+AfzlnoO2sCJAwncXKd/sX3YNl4BUvg8JZ1344F
 z4Bj23NQ/qvyEQX18KtC9Rxw7RXLt1ki++m8jhFeqaZjetYZbDRm/ouYLSFwNC63SSNp
 phJZVH4rHbYuqKXxK+W6xUHDy1DFZ/9+MfMJK+LQm5D3qJHt0KIdS8CYv7QJdWSCSJgx
 HLJ3wxpmtNy3EAUmgmqcMc6arVnIWreRh/dwh+ENPnXg61vXvP4+36/7rESeoAv6MutA
 FifA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q08jYk21ViY8XgmFrkgiDweXa0UOtGJGIiHOB+F8ez4=;
 b=hIimuGw/LzM2q2QOYG099xdymGi5lch6xlGxmlncTezbdSLJWI9PPMImiDpK0kzpc0
 MswAeRyGyYM0EpiWH1vmjuXyWmdhHG9kA5c3u9aBUU76kKhcagZn1oKg+x5OJcRtuKR/
 PBoIuw+9VVdkjBiazh3OeeROIFDIykOhYpzmBKvYwOP9g5l9J1AKWmecXz1g11H/rk3d
 KHEQdEvgflKJX6w8tdApraotzK3mUvh502hsRBm2M+b9xGRtQMjxRW8uMTGaoX+w+H+X
 2h2SdjqwIOE+BoM1QSQtVHSdWSiOe/fIMeREPfWMpdq94pEkzVC0x23nEW0sIhoCQyp4
 fg9A==
X-Gm-Message-State: APjAAAVJWU+fhxgwij2VN6KhlHDVRm/6WzwH3Q+J/NOBJ+Y1a264bOk+
 VW2FQI+wnXadq3P0hVOMtZqlF7/j/w4Wl0rDEY2i+Jrq
X-Google-Smtp-Source: APXvYqz6F+JrDB6jRL9xZXNKfnMAlN7NdSQmHKNA12/Ah74h99EDSKIBq4pyx64Nmpzkvx7PAq9X9a+LJZ1dGy5JiAc=
X-Received: by 2002:aa7:d6d3:: with SMTP id x19mr16587926edr.119.1563074571668; 
 Sat, 13 Jul 2019 20:22:51 -0700 (PDT)
MIME-Version: 1.0
References: <1558108285-19571-1-git-send-email-bmeng.cn@gmail.com>
 <1558108285-19571-2-git-send-email-bmeng.cn@gmail.com>
 <9338c7b4-6a05-2189-b93d-25cb2bd4dd54@adacore.com>
In-Reply-To: <9338c7b4-6a05-2189-b93d-25cb2bd4dd54@adacore.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 14 Jul 2019 11:22:41 +0800
Message-ID: <CAEUhbmUtdvkYPm4DZL4MSeV5imaj82x2xtPkQ0yLKF599N=vXw@mail.gmail.com>
To: Fabien Chouteau <chouteau@adacore.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Palmer Dabbelt <palmer@sifive.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::541
Subject: Re: [Qemu-riscv] [PATCH 2/2] riscv: sifive_u: Update the plic hart
 config to support multicore
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
X-List-Received-Date: Sun, 14 Jul 2019 03:22:55 -0000

Hi Fabien,

On Tue, Jul 9, 2019 at 12:31 AM Fabien Chouteau <chouteau@adacore.com> wrote:
>
> Hi Bin,
>
> Thanks for this patch.
>
> I know I am very late to the game but I have a comment here.
>
> On 17/05/2019 17:51, Bin Meng wrote:
> > +    /* create PLIC hart topology configuration string */
> > +    plic_hart_config_len = (strlen(SIFIVE_U_PLIC_HART_CONFIG) + 1) * smp_cpus;
> > +    plic_hart_config = g_malloc0(plic_hart_config_len);
> > +    for (i = 0; i < smp_cpus; i++) {
> > +        if (i != 0) {
> > +            strncat(plic_hart_config, ",", plic_hart_config_len);
> > +        }
> > +        strncat(plic_hart_config, SIFIVE_U_PLIC_HART_CONFIG,
> > +                plic_hart_config_len);
> > +        plic_hart_config_len -= (strlen(SIFIVE_U_PLIC_HART_CONFIG) + 1);
> > +    }
> > +
>
> This will create up to 4 MS PLIC devices. However on the Unleashed FU540 the PLICs are M,MS,MS,MS,MS because of the monitor hart #0.
>
> This means a different memory layout than the real hardware.
>
> For instance address 0x0C00_2080 will be hart #0 S-Mode interrupt enables in QEMU, instead of #1 M-Mode interrupt enables for the real hardware.

Thanks for the notes! I agree to better match the real hardware, it
should be modeled like that. However I am not sure what the original
intention was when creating the "sifive_u" machine. Both OpenSBI and
U-Boot list sifive_u as a special target, instead of the real
Unleashed board hence I assume this is a hypothetical target too, like
the "virt", but was created to best match the real Unleashed board
though.

>
> To fix this I suggest to change this loop to:
>
>     for (i = 0; i < smp_cpus; i++) {
>         if (i != 0) {
>             strncat(plic_hart_config, "," SIFIVE_U_PLIC_HART_CONFIG,
>                     plic_hart_config_len);
>         } else {
>             strncat(plic_hart_config, "M", plic_hart_config_len);
>         }
>         plic_hart_config_len -= (strlen(SIFIVE_U_PLIC_HART_CONFIG) + 1);
>     }
>
> This will make hart #0 PLIC in M mode and the others in MS.
>
> What do you think?


Regards,
Bin

