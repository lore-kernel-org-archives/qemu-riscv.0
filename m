Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kUiA6-0007hZ-AI
	for mharc-qemu-riscv@gnu.org; Mon, 19 Oct 2020 23:18:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kUiA4-0007dI-Iz; Mon, 19 Oct 2020 23:18:08 -0400
Received: from mail-yb1-xb43.google.com ([2607:f8b0:4864:20::b43]:41102)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kUiA2-0007Gz-T0; Mon, 19 Oct 2020 23:18:08 -0400
Received: by mail-yb1-xb43.google.com with SMTP id c129so580369yba.8;
 Mon, 19 Oct 2020 20:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pAdvqtK9ueQKd8glBBVJRZ+m+KLadQP09UA9XItfMBo=;
 b=Ad0T7tQhB34HvKc9kbjKUvMq6Iimcb2GdAdpybtFZsC+s8mAKws7V9Bqx7KXWE3/i6
 Tf9i9vMiyhPc/zDmoT0i0a4Ny7mMG0+2lDSGaTlGMmFcQqnUTPPfiJ6dFj/SRkjiXh5s
 5TTaJ9xpJSqm40bLOQ7+pk4AmZWJJEQ2u62CfciK5FElhlc+hUlChXiu1BPDos592TqH
 FUwzHNgbQ6VHrMPl5G9TuGVDfGX3nYkDpZTJKGQeKzUd4bQez3tGi41M1YVbzks+zyEA
 XNXxUaQcJY/tLSCTqAGTNfT/AzO86F2PucLajM6prKepa9dyWva2fMPNz+KiQfW1fmNm
 itAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pAdvqtK9ueQKd8glBBVJRZ+m+KLadQP09UA9XItfMBo=;
 b=lY76s0zVBwPD5Suv269NPB4JkYFrC+lWMC2bHDTt/l2PwK7QXcp8Q0i2FejEl3aWFx
 ae7EHVdA0uNDtC5d01j2lHOHJ7u27l+2Pnwx4a00y+y/kYx7fr8DbiwjyoYxHPRHxm/+
 LerhQqq4R/HYzQ+EFbWfsodjSMQlf2SuKtekGJM1RPJmgYQ/0b1mS/IX755OFksPVQuX
 +VmxdPBDk0bEigMvPosQU4NjBDYUZqaqznIv1wwT8BiyDeZRbWVO+xkEfPdiGr1fepOF
 M2/sWL4RXG9jx7TPGEoYuac2+61XVaYf3dG9/8UH/SrTlOQAtbORZD2L5IPKsmREiGlF
 95uw==
X-Gm-Message-State: AOAM533UFMjN9j1ZtYtOJ+NpelMfl7Oi7xhSw5qFq6ClZcClleEh0hV3
 ZE092BZnbeHR9YQxOo+7PozQCA2W+UARCnc045Y=
X-Google-Smtp-Source: ABdhPJy/yw/531XU2lIRwytUTL0GxeoPyCHijKRL2f8Pu+3mArrg01lEdv/T6djbeKwZJvcf++tbWhIlA8Jhnk2taws=
X-Received: by 2002:a25:705:: with SMTP id 5mr1291726ybh.239.1603163885646;
 Mon, 19 Oct 2020 20:18:05 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1602634524.git.alistair.francis@wdc.com>
 <46c00c4f15b42feb792090e3d74359e180a6d954.1602634524.git.alistair.francis@wdc.com>
In-Reply-To: <46c00c4f15b42feb792090e3d74359e180a6d954.1602634524.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 20 Oct 2020 11:17:53 +0800
Message-ID: <CAEUhbmVFFABiR-kde_OGxJp9=fPwvvBnNcbOA8hXpS_-vSqpUQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] hw/riscv: Load the kernel after the firmware
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b43;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb43.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
X-List-Received-Date: Tue, 20 Oct 2020 03:18:09 -0000

On Wed, Oct 14, 2020 at 8:28 AM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> Instead of loading the kernel at a hardcoded start address, let's load
> the kernel at the next alligned address after the end of the firmware.

typo of "aligned"

>
> This should have no impact for current users of OpenSBI, but will
> allow loading a noMMU kernel at the start of memory.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  include/hw/riscv/boot.h |  3 +++
>  hw/riscv/boot.c         | 19 ++++++++++++++-----
>  hw/riscv/opentitan.c    |  3 ++-
>  hw/riscv/sifive_e.c     |  3 ++-
>  hw/riscv/sifive_u.c     | 10 ++++++++--
>  hw/riscv/spike.c        | 11 ++++++++---
>  hw/riscv/virt.c         | 11 ++++++++---
>  7 files changed, 45 insertions(+), 15 deletions(-)
>

Reviewed-by: Bin Meng <bin.meng@windriver.com>
Tested-by: Bin Meng <bin.meng@windriver.com>

