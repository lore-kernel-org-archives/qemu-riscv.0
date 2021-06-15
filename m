Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lt52n-0001mQ-8o
	for mharc-qemu-riscv@gnu.org; Tue, 15 Jun 2021 05:07:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lt52m-0001mB-0g; Tue, 15 Jun 2021 05:07:36 -0400
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:43726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lt52k-000085-8W; Tue, 15 Jun 2021 05:07:35 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id b9so19455374ybg.10;
 Tue, 15 Jun 2021 02:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gXZsMiMZ4AGwJCJIGNMks2yY6Z8ZtVYbxqpvn5EK1wg=;
 b=cwVxBSBx4U25q22JeABAiym3ucvQIuG2P/rim0xaeq7ul1hjx3HsTUO5EO3v1S6G41
 VlOzhDpnffkaiyTcSqPoNnFMpBp1BYzIYNjwSfi1l0XJ5gMpNgPRniRJakJckXkz3tAe
 eR0TV89eFUX1kbgBFeiJrlnibUioNSgvkvKy/Z9nztMwzBAEis9p6h+tCt+osnghl3CD
 FDVan7V2K0twEM1DD4ozsoVXylTUGgR0X9POwtiC9iwENYJCoWNe2y7jIpNyDcAkcXgE
 hMky8YATNID05KMpHc6rJyhLJK5CmpGPnlaa9THbNpicNmNUUT1qaHJ8Qbt7hsrJ3ZYi
 pWsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gXZsMiMZ4AGwJCJIGNMks2yY6Z8ZtVYbxqpvn5EK1wg=;
 b=LtU0oEN1SEQk6P9Qgvx5V8FplDFPxRy4OZad3SydcxS2DpE05AGIRxbPN5D/+4bp8H
 Cjhhx2GU8pO94Dih+RobLBp1s/U9+xP63tyqfWsrmw0lJYuaucM1Ob6i7qqr5aqcchp/
 ate876mKWVFehR6DA/fIiT9Ky5Pbhtgn0XoM8Cj5SL4vGWpARmkTynoa4v6zwoCHChbU
 PpvRhgB2nQSrFO5speP6Qps38YhUguMtWM+O+kIkSyQ7dMqb/LDO8XB9Sw/wy1DXQwof
 DIq224roW9pPIQG+7+pHtCIsrC2Le1Z+w1XGHyx15Qr6kTAOV3pUimGHeWN75HUlPWRs
 Vvug==
X-Gm-Message-State: AOAM533oP7EPyA5bPB9KYhe6MaGVnzYFncZK/zlKP5JQX4tSxOKxPdZ2
 FSFTqNAGVnic/yr6HRkq16AwFttgv7KZHMBSOlg=
X-Google-Smtp-Source: ABdhPJxsXtb9JZSbQYmNXVbrNfm1PaI+pww3e06b2SR5lkpjxBniW+vnaRMHEJIz8gVS29BKXHcacw1cMSmAB9p84YY=
X-Received: by 2002:a25:be09:: with SMTP id h9mr31871121ybk.239.1623748053023; 
 Tue, 15 Jun 2021 02:07:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210331021825.537484-1-bmeng.cn@gmail.com>
 <20210331021825.537484-2-bmeng.cn@gmail.com>
 <CAKmqyKMCTFVs9dhFza+GnTM-EqRngPmTEfWbuX=BaVMGAEpbCg@mail.gmail.com>
In-Reply-To: <CAKmqyKMCTFVs9dhFza+GnTM-EqRngPmTEfWbuX=BaVMGAEpbCg@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 15 Jun 2021 17:07:20 +0800
Message-ID: <CAEUhbmWmAU=eEKDSGR4fSp0-9b3GbVkfisgbOgT-A9wV9f=3cQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] target/riscv: csr: Remove redundant check in fp csr
 read/write routines
To: Alistair Francis <alistair23@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2e.google.com
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
X-List-Received-Date: Tue, 15 Jun 2021 09:07:36 -0000

Hi Alistair,

On Wed, Mar 31, 2021 at 11:53 PM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Tue, Mar 30, 2021 at 10:18 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > The following check:
> >
> >     if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
> >         return -RISCV_EXCP_ILLEGAL_INST;
> >     }
> >
> > is redundant in fflags/frm/fcsr read/write routines, as the check was
> > already done in fs().
> >
> > Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>

It looks like this patch was not applied anywhere?

Regards,
Bin

