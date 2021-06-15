Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lt6XG-0003Oz-QG
	for mharc-qemu-riscv@gnu.org; Tue, 15 Jun 2021 06:43:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lt6XF-0003Mc-BU; Tue, 15 Jun 2021 06:43:09 -0400
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33]:44619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lt6XD-0008Eq-LP; Tue, 15 Jun 2021 06:43:09 -0400
Received: by mail-io1-xd33.google.com with SMTP id q3so19644338iop.11;
 Tue, 15 Jun 2021 03:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QBt8utu2whH+v8ynW6WDTGNBJgczEeqDYRsD5x/AQuQ=;
 b=lkIuRIddrGvle5lgT+u3yn+HOq0ryppEI4mpSIxOxAaeQ9SF1pSFQvM5e5XkEXc582
 8ZdZ1PxbjdQYH5e+QFCMOxHZKD7pCvqMFBq48f2T2m1rCmsklg2HJ2y+Jb3gP85bU52l
 lnViU4KC4gFMEnADrxmrN1J/2qE4XLo6BBItfZC4JzTh8xtjXHTcv2m7myvc5InixxBz
 ntBr0Urf4xASEWVu12cTeZX/NiVL+dSw8xaffn+O0Nxc6xX6CBf5hR8UOltX0z3bBzT8
 JkN4idNijqxoLb0aXFY+QIia/7Hoa14C8bv74hfpfGSzgzwH5rBwQjj0gBySqgMeuDXd
 OHgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QBt8utu2whH+v8ynW6WDTGNBJgczEeqDYRsD5x/AQuQ=;
 b=omBMmhpFQOOCfCOkFoKGuceH9xW96S/Z0bHspxV0oF0jwZLA707MgyoKYlBSepPinJ
 m7n8FCkne1Q5CvsFwYs1oez04E8Q1mxl3i2FySi+IxzBXPxI+gQHqY22Plq94MjfmQCF
 3D2YOu6+0MsixLTEuQnB+E1FLEhJmP2co5uSDtvvQzmFXm4ex7NAP0tVBBPRx0I1yjTx
 SzN9uP0gRcUC7InoHtX8i9POpHJawX979bDgD/C5r59ExlcoxgsmWsndzIRg2ZgpnZj5
 LGldqKXRN5lANOmqpv5J63vTJacZhx5X4fDGamJBGUK1ANRL3+n1gWXWIKk0zV6Tm7a6
 OzHg==
X-Gm-Message-State: AOAM530aODajHbLbPGEN9bl/oRw6AgiWyG2nxOxzimsPxf3KLegWGCek
 i0M34YuvrvP0yEsvhqmpIRk38AX80ce8cpcj+23i30Rskg9A4g==
X-Google-Smtp-Source: ABdhPJxYNhryV8BIpt3/ca/x6AOjZpPN4A5Gb11YZeYMCBhcQJEeCab+/tVr/5d7xSAGwJSfeEq6wDfrhM7gbYrZ6BY=
X-Received: by 2002:a05:6638:2b7:: with SMTP id
 d23mr1236501jaq.8.1623753786130; 
 Tue, 15 Jun 2021 03:43:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210331021825.537484-1-bmeng.cn@gmail.com>
 <20210331021825.537484-2-bmeng.cn@gmail.com>
 <CAKmqyKMCTFVs9dhFza+GnTM-EqRngPmTEfWbuX=BaVMGAEpbCg@mail.gmail.com>
 <CAEUhbmWmAU=eEKDSGR4fSp0-9b3GbVkfisgbOgT-A9wV9f=3cQ@mail.gmail.com>
In-Reply-To: <CAEUhbmWmAU=eEKDSGR4fSp0-9b3GbVkfisgbOgT-A9wV9f=3cQ@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 15 Jun 2021 20:42:40 +1000
Message-ID: <CAKmqyKOzuk+0P+bBtrbenVa3mdKcPuc0jqAN9gniRTVh3dP3dw@mail.gmail.com>
Subject: Re: [PATCH 2/2] target/riscv: csr: Remove redundant check in fp csr
 read/write routines
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d33;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd33.google.com
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
X-List-Received-Date: Tue, 15 Jun 2021 10:43:09 -0000

On Tue, Jun 15, 2021 at 7:07 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> Hi Alistair,
>
> On Wed, Mar 31, 2021 at 11:53 PM Alistair Francis <alistair23@gmail.com> wrote:
> >
> > On Tue, Mar 30, 2021 at 10:18 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> > >
> > > The following check:
> > >
> > >     if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
> > >         return -RISCV_EXCP_ILLEGAL_INST;
> > >     }
> > >
> > > is redundant in fflags/frm/fcsr read/write routines, as the check was
> > > already done in fs().
> > >
> > > Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> >
> > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> >
>
> It looks like this patch was not applied anywhere?

Nope, it doesn't appear to have been. Do you mind re-sending it?

Alistair

>
> Regards,
> Bin

