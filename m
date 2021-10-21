Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mdSUf-0002na-QP
	for mharc-qemu-riscv@gnu.org; Thu, 21 Oct 2021 03:28:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mdSUd-0002k1-1c; Thu, 21 Oct 2021 03:28:03 -0400
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730]:39633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mdSUa-0005UN-UC; Thu, 21 Oct 2021 03:28:02 -0400
Received: by mail-qk1-x730.google.com with SMTP id 77so6265113qkh.6;
 Thu, 21 Oct 2021 00:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mK1R5IxAvdubBkBcHpBStEBJivI3NuDkOjL00/73J9g=;
 b=kjJ2a+y5N2pwu+0ycuTuxvgxXJQ4RGq7w6t57Tzmkbc0LOjbribHCMp8zPFS0FGGQy
 VQV6IMNJuhN8NkNwQWUdTf7vQjZc6hmXxCdJ4ZgGTHuJGg7WWvouHnlz6UgTrl0RtSH2
 A/BKd33jEmGZl6Sk8wOxYLj1ZNc/kT+EaDg3MTyHOPq3+pEpUYhSP9t4TNYNPMLNYzmy
 CLuJ2vQqLGcvj2L4q0r3DuzeKFDgI10GsbJAQrK/D/ujBE9v1RFs+3U4Tsh2gpbKr/Jx
 iLXtPheY1/j6lHN6HqtKPdZnHLQ+2im6R5/JwXfB/WWwjZiJd2I9aJlWmUWXmAqHrtSs
 YORw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mK1R5IxAvdubBkBcHpBStEBJivI3NuDkOjL00/73J9g=;
 b=DUZwjkahr4UeNzkAoy3Mt3umlPJbuRQ3794lKbHKg4uzt2G79B7oKM4BKvzwDBbVAf
 CvqQEaGP5PnxAafpbX+5SM9Tu34qny64hbn1O6n7RLVCuAIcoBDlz6yvl6lRQzOIT8ab
 62rNN559q2wwAQWgKsizQKEkEJgaXlDb5dhkphr50YP99wgVLS6mtEoLLFL8ETIduXmL
 XynMl9MCrJfh3tTsoqd83Ei9nW+MIa0k5hySgIVSE7kq1uhr5uSYZlHTkNGQ4k8de9Xc
 aqxcfYB86bTQ+eXDGXR0bLJDP3wbB/y1bal95FSCXr8zqnaB1foNkMiZYP8BkU61qA5G
 NaKQ==
X-Gm-Message-State: AOAM532aTww0k4k96kIH7GGpb1aNs/x53ukjTZ6Box8HOFtx+YK4BLGH
 W4fsWRCR2yzVl9XIeOy9+4eSHEwuSvy1p3LRUe0=
X-Google-Smtp-Source: ABdhPJzEc3osOuXa7gOp9eQMsjty6OO4G60UfLcTP8x5JxzW+KzHXs/WGHPlEnpFGuU/PDI7Qnwq45L7lL2/NFn2dVk=
X-Received: by 2002:a25:346:: with SMTP id 67mr3947602ybd.345.1634801279698;
 Thu, 21 Oct 2021 00:27:59 -0700 (PDT)
MIME-Version: 1.0
References: <18b1b681b0f8dd2461e819d1217bf0b530812680.1634524691.git.alistair.francis@wdc.com>
 <5557935c2660c5e6281b6d21e6514e019593662e.1634524691.git.alistair.francis@wdc.com>
In-Reply-To: <5557935c2660c5e6281b6d21e6514e019593662e.1634524691.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 21 Oct 2021 15:27:48 +0800
Message-ID: <CAEUhbmX4kB-aJYqkkrdN=7Yoj+hQSLn0TECkxKGv9W3+N6_HqA@mail.gmail.com>
Subject: Re: [PATCH v1 2/9] hw/intc: Remove the Ibex PLIC
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::730;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qk1-x730.google.com
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
X-List-Received-Date: Thu, 21 Oct 2021 07:28:04 -0000

On Mon, Oct 18, 2021 at 10:39 AM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> The Ibex PLIC is now spec complient. Let's remove the Ibex PLIC and

typo: compliant

> instead use the SiFive PLIC.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  hw/intc/ibex_plic.c | 307 --------------------------------------------
>  hw/intc/meson.build |   1 -
>  2 files changed, 308 deletions(-)
>  delete mode 100644 hw/intc/ibex_plic.c
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

