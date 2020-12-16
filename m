Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kpb3M-00017m-NB
	for mharc-qemu-riscv@gnu.org; Wed, 16 Dec 2020 12:57:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1kpb3L-00016K-F0
 for qemu-riscv@nongnu.org; Wed, 16 Dec 2020 12:57:31 -0500
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e]:37338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1kpb3J-0005m4-E6
 for qemu-riscv@nongnu.org; Wed, 16 Dec 2020 12:57:31 -0500
Received: by mail-io1-xd2e.google.com with SMTP id p187so24814786iod.4
 for <qemu-riscv@nongnu.org>; Wed, 16 Dec 2020 09:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xS1MHac8SoJoe4GKos3v2gJOMGVNlLuzMfcAf2FRQIs=;
 b=sEwNSuIZ7s/T4LGRR6MfEePQmUcQGjyD0fxkoVuGW/xO1kDsqam6918Gy+JiCREtD/
 g0Qmuiing3vW+cXQsWyBHm8dqr3/clhwxxxPFIFNW4RQqUzDkexAcDz1Ee72MHcgzAGp
 BrwYVQnS4hh5JEdjYSp/w5HCD1hL07tT8KHk0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xS1MHac8SoJoe4GKos3v2gJOMGVNlLuzMfcAf2FRQIs=;
 b=V5o1CcQSep2PQ6zsFQNj5p0QbJVgqJ5lIvSuOsTiTWCz5WkvbdaB8UfZEKko36jGQx
 JA+IsfEa/65hlmsOLijrbuTetI3X7wdP7I5jkH2fDGvreNMzN3OHmcXYh6zhvxdV3wb7
 xtUpY5B897S8bz+UjzV9jhgAkIcAtAb3hyWLe8YILiSDMhNQyM0W1NFeVMR0YvJq/xIH
 gkGT/yTJpkZr4C8ocdp9PakSiqFOhwmWVa4ussqiTg+zTnK8qpQVzptvdwwCiVIhZSt/
 OPHjkUdEjcW6bK79Yn9Gw8v994xHK3IMDK4euvUmZXvb+rbMT9ECbE3PGcJJw7JAfLaS
 pdMg==
X-Gm-Message-State: AOAM533voxlfsyfc2bwWyo1Jp+qzE1C1d4wHirBIzn+uN4Lh2eZQCIkq
 zjkXKbhwF+ucLb3Iyd9Py5DSUDhEMo/DOp8JreBl
X-Google-Smtp-Source: ABdhPJxgDSnunJuCjFLW5COV4Z15Lqr9IEKN27KtMvQ3VmKeWBDym1vi5nD17t/6IzOuCYIvu0oV6Xx7hgKQ6XSSjSM=
X-Received: by 2002:a02:6a0e:: with SMTP id l14mr44761195jac.58.1608141446997; 
 Wed, 16 Dec 2020 09:57:26 -0800 (PST)
MIME-Version: 1.0
References: <CAEUhbmX1_3FTO4LwSN37p8itHhsLfUHaJF9qauESEx1E3B1UfA@mail.gmail.com>
In-Reply-To: <CAEUhbmX1_3FTO4LwSN37p8itHhsLfUHaJF9qauESEx1E3B1UfA@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Wed, 16 Dec 2020 09:57:16 -0800
Message-ID: <CAOnJCUL-BxTBfMaECVP6+A-m9YyE_371gBUfhVBbddeJybPjNw@mail.gmail.com>
Subject: Re: OpenSBI fw_dynamic firmware does not boot 32-bit kernel on QEMU
 'virt'
To: Bin Meng <bmeng.cn@gmail.com>
Cc: OpenSBI <opensbi@lists.infradead.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, Anup Patel <anup.patel@wdc.com>,
 Atish Patra <atish.patra@wdc.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=atishp@atishpatra.org; helo=mail-io1-xd2e.google.com
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
X-List-Received-Date: Wed, 16 Dec 2020 17:57:31 -0000

On Wed, Dec 16, 2020 at 1:15 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> Hi,
>
> With latest QEMU HEAD, 32-bit kernel with the following kernel commit
> reverted [1]
>
> 1bd14a66ee5200d6a24419cbd2e0a0fccd4da36f ("RISC-V: Remove any memblock
> representing unusable memory area")
>
> still does not boot on QEMU 'virt'. However explicitly specifying
> -bios to use the fw_jump firmware will allow the kernel to boot.
>
> When QEMU switched OpenSBI from fw_jump to fw_dynamic during the 5.2.0
> development cycle, I remember at that time I tested this on 32-bit
> machine for both 'virt' and 'sifive_u'. See the following commit
> message as it indicated 32-bit testing.
>
> 2cacd8414daf6a0643926392f05fd397ed1e9b66 "hw/riscv: Use pre-built bios
> image of generic platform for virt & sifive_u"
>
> I don't have too much time to do the debugging. I hope someone could
> pick this up and identify where the problem is.
>
> [1] http://lists.infradead.org/pipermail/linux-riscv/2020-December/003925.html
>

Thanks for reporting the issue. I am going to take a look.

> Regards,
> Bin
>
> --
> opensbi mailing list
> opensbi@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi



-- 
Regards,
Atish

