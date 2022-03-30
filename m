Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nZSyt-0006qr-3F
	for mharc-qemu-riscv@gnu.org; Wed, 30 Mar 2022 03:43:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <idan.horowitz@gmail.com>)
 id 1nZSyq-0006pq-VI; Wed, 30 Mar 2022 03:43:00 -0400
Received: from [2607:f8b0:4864:20::229] (port=36746
 helo=mail-oi1-x229.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <idan.horowitz@gmail.com>)
 id 1nZSyp-0003VI-Dp; Wed, 30 Mar 2022 03:43:00 -0400
Received: by mail-oi1-x229.google.com with SMTP id z8so21312836oix.3;
 Wed, 30 Mar 2022 00:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MiGdZ2mCnyDnlrLj4ZK6BUtMuBk74tUbc0mv4CBESrg=;
 b=pWnDK3C2B+OMi/LyLXJuiMlvdZULYUP60ZadcL7izCLj2vn2m7bXDAQpVSSqW67lt3
 CzJHSjojdtaBZJrGZeAHDvyqxZEFLUMnrq37WxUjA1EutMPgeNr8XlC9mJPgjvAFNHWT
 uDLmGfTWJDZy5e6aavtcJeW/jY4ne2q/VPHKkTmwihGjYRNMonTa713VLDaoxDzW219n
 qEt7NglhYSMn3pkMYgOZjBM7jQHa2hLZO5XZuNxCyMBrw6RMW/vEqfGc0s8SOIpfg2rt
 xD7NeYsMevsQVMPM0tqIuYk4Tiz0IkogGjuzaHngdgpMC0gIgME8hVCR6TRbIXojQ04W
 rQXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MiGdZ2mCnyDnlrLj4ZK6BUtMuBk74tUbc0mv4CBESrg=;
 b=74JNcS0QhZ8sW2jhTm0FHLYS9IHSQ2m9TFWbqVQpVbiTsRa19jjlEWfRG3kHXBbHhI
 DnGEq3XvXPEHX25wLr3c7bjFDyloFkeBFDZC7s7ECp9lMQgtdAEawk8nuFu0L2eA6n31
 Lge9bKktaQ+G76MOmeWzGygdMQy48GEu2XhPfmhC2LXFOs9bfLP9+4haWNvxy/7TKkTn
 3dNXiBzR1UJ33poEljvW0Y603QGk0hcu7hBwETwf4NC/2mQZ85cy/lzMoB6128SScHM4
 JbMcHNmIf4UxwBGiRA7c4hBEfO89IyWt7hIQb6lc46O2geOrDao7wuLI22BJ0hLdPoKQ
 7ChQ==
X-Gm-Message-State: AOAM531Od/Iyl9T6L9yi9W14fnp0GAd1y2H+ZqnSOv0nByJzwZ7j3G6S
 Wu/ff/GHpIBQ7LO3lpAOuHa8oSF+5Y5JwNTCGH30IPx6/eowwkyx
X-Google-Smtp-Source: ABdhPJxV10IC4uRZbPsH2xroeVi1fa9qZLnrcSEa1fh9WJVGTkEMNLrWSUMdF06kFq9i0IsAQsw4SD0Se6lQm04NH7E=
X-Received: by 2002:a05:6870:148c:b0:dd:b260:ad54 with SMTP id
 k12-20020a056870148c00b000ddb260ad54mr1549907oab.216.1648625730248; Wed, 30
 Mar 2022 00:35:30 -0700 (PDT)
MIME-Version: 1.0
References: <7f383fc2.81a2.17f93c0dad7.Coremail.phantom@zju.edu.cn>
 <CAOnJCUJck5o_-cayf-=mccenoZH048+2zhGDGOoWKiVMUFWWmQ@mail.gmail.com>
 <CA+4MfE+hFQhRYEgEXy-u10=MBhnmA5f7MdRFjW7Xc0dLPSiLXw@mail.gmail.com>
 <CAOnJCU+ZMnLoi2GNDdKz24KJbHpEBQT1=Qo5LbSE1xz=WvwbrA@mail.gmail.com>
In-Reply-To: <CAOnJCU+ZMnLoi2GNDdKz24KJbHpEBQT1=Qo5LbSE1xz=WvwbrA@mail.gmail.com>
From: Idan Horowitz <idan.horowitz@gmail.com>
Date: Wed, 30 Mar 2022 10:35:19 +0300
Message-ID: <CA+4MfEKzZStKBx3-FVm8uiyh=LhiWAXPvChxGyVD20sHkcQRSg@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Exit current TB after an sfence.vma
To: Atish Patra <atishp@atishpatra.org>
Cc: phantom@zju.edu.cn, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <Alistair.Francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::229
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=idan.horowitz@gmail.com; helo=mail-oi1-x229.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Wed, 30 Mar 2022 07:43:01 -0000

On Wed, 30 Mar 2022 at 10:28, Atish Patra <atishp@atishpatra.org> wrote:
>
> I tested on v5.17 built from defconfig for rv64.
>
> Here is the kernel code executing sfence.vma
> https://elixir.bootlin.com/linux/v5.17/source/arch/riscv/kernel/head.S#L122
>

I believe this is a kernel bug and not a QEMU one. They perform a
write to the SATP with the same ASID as the one used before (0) and
then expect it to be used, without performing an sfence.vma following
it.
This was exposed by my change, as previously the write to the satp was
performed in the same TB block as the sfence.vma *before it*, which
meant the TLB was not filled in between the previous sfence and the
write to SATP following it.
I was able to reproduce the issue with the Fedora Rawhide image in the
wiki, and I was able to resolve it by artificially forcing a TLB flush
following all writes to SATP.
I think the correct course of action here is to:
1. Report the issue to the linux kernel mailing list and/or contribute
a patch that adds said missing sfence.vma following the SATP write.
(Atish: Are you able to test if adding an sfence.vma in your kernel
build fixes the issue?)
2. Restore the patch

>
> --
> Regards,
> Atish

Idan Horowitz

