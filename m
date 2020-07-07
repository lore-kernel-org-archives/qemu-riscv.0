Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jswzy-0006um-Jn
	for mharc-qemu-riscv@gnu.org; Tue, 07 Jul 2020 19:27:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jswzw-0006u2-NF; Tue, 07 Jul 2020 19:27:36 -0400
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43]:35287)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jswzv-0003Fc-5U; Tue, 07 Jul 2020 19:27:36 -0400
Received: by mail-io1-xd43.google.com with SMTP id v8so44970532iox.2;
 Tue, 07 Jul 2020 16:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OtUhTQztt/ScSfWZTz1D2W9tNwBIULiYZ2mDiLic5WU=;
 b=XI9E4O+KA8f6vANEqLit2EKyQfd6woZNsTP+6IWnyOWmzrdc+elh5MD12xWId6md/e
 1GnYd3WGgNCy2JelM5DAWC9mRvYUFpRdXKtuZ3JtFelfM7Aal6mspzXbhKb0rPwalX+V
 7igxgvGGIEmN3mOYqF3hYlmZ4EUrJszIBnndJGdCofYyEXfUOfHesdhLd60FXStTb3VB
 dOX1R/xRXJUZ3Wkft961FbAVkwBoFQD/azetbSggcNDiBgfKZ6o7rco+cqUyK4PAEtj7
 MiQb1jkJhpjeW+rHTAJ8ouvuzbMlbqQrYl8QIbIlmYgSLlUO2VCwu/SiO838I4Asaf05
 marg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OtUhTQztt/ScSfWZTz1D2W9tNwBIULiYZ2mDiLic5WU=;
 b=nXQi3jAuAb6ucCVl7N2+weKt6Fo2RnnbLDGi1TK6FehfvYx9H3X6EMftz09SaYydAA
 yA0NKKCNEbWbq7usLLrhDzipavuL/p4+Ehq2Q/f5Kay/qKTIpBQ4A8Gvae0gclCJ/+ff
 gMXHdyd/mLn252WrPW9yqFOYWRa+d0o5BIgUjYw7RVfG4f5KoystvxG4/lDe8sqeJY14
 4sF1EWDTP9M5GlQxP6HwTyxxCS08ldl6KbS+43y+C3GnJ4WLIf1Ma+2JmAOhv25AynwQ
 eB1s5xiZ9xLo45PybktkMEgYzaBXTVdVYRCzb40bRWZfVCt4riMvFasCqmUkr4EYqq3z
 l8ZQ==
X-Gm-Message-State: AOAM530+pzD92q9lYT+urJXgr3NzRGN5LMvXJi0UlG12zJ4kGmRGDNaq
 kXTz5UpKh2X83TXw2gq/c41CzKRPpTA6H9hE4ad5VxzEE0o=
X-Google-Smtp-Source: ABdhPJyfpMjBu02f+T1pRK0vIA4k7kqb3WSyTyY25dXbS6zblZUVJknP6ZuyHMGntPWnNmFwbeuKuJ2fYsK1jsEJO8Q=
X-Received: by 2002:a92:d186:: with SMTP id z6mr40419537ilz.227.1594157537032; 
 Tue, 07 Jul 2020 14:32:17 -0700 (PDT)
MIME-Version: 1.0
References: <1593746287-19251-1-git-send-email-bmeng.cn@gmail.com>
 <1593746287-19251-8-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1593746287-19251-8-git-send-email-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 7 Jul 2020 14:22:27 -0700
Message-ID: <CAKmqyKPRPdz=3_QRM8+ct2TYLO8rY_kFqrHkX0qn78rEpSAgag@mail.gmail.com>
Subject: Re: [PATCH v3 7/7] Makefile: Ship the generic platform bios images
 for RISC-V
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmerdabbelt@google.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Anup Patel <anup@brainfault.org>, Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d43;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd43.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
X-List-Received-Date: Tue, 07 Jul 2020 23:27:37 -0000

On Thu, Jul 2, 2020 at 8:20 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> Update the install blob list to include the generic platform
> fw_dynamic bios images.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Shouldn't this patch be included in an earlier patch?

Otherwise won't this break `make install` bisection?

Alistair

>
> ---
>
> Changes in v3:
> - change fw_jump to fw_dynamic in the Makefile
>
> Changes in v2:
> - new patch: Makefile: Ship the generic platform bios images for RISC-V
>
>  Makefile | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index b1b8a5a..05e05bb 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -841,8 +841,8 @@ u-boot.e500 u-boot-sam460-20100605.bin \
>  qemu_vga.ndrv \
>  edk2-licenses.txt \
>  hppa-firmware.img \
> -opensbi-riscv32-sifive_u-fw_jump.bin opensbi-riscv32-virt-fw_jump.bin \
> -opensbi-riscv64-sifive_u-fw_jump.bin opensbi-riscv64-virt-fw_jump.bin
> +opensbi-riscv32-generic-fw_dynamic.bin opensbi-riscv32-generic-fw_dynamic.elf \
> +opensbi-riscv64-generic-fw_dynamic.bin opensbi-riscv64-generic-fw_dynamic.elf
>
>
>  DESCS=50-edk2-i386-secure.json 50-edk2-x86_64-secure.json \
> --
> 2.7.4
>
>

