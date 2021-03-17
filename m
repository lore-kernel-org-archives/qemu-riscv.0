Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lMaIK-00076z-ID
	for mharc-qemu-riscv@gnu.org; Wed, 17 Mar 2021 13:49:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lMaII-00076A-EN; Wed, 17 Mar 2021 13:49:18 -0400
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134]:41583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lMaIF-0001Gl-1L; Wed, 17 Mar 2021 13:49:18 -0400
Received: by mail-il1-x134.google.com with SMTP id r8so2335677ilo.8;
 Wed, 17 Mar 2021 10:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bKlnpXwOWcFxC9r1hrPSScu5PBUHd30iL2YWISgKJ+I=;
 b=THlUzPb+Uo0tS6V+bXvFtf/lWi4+FLxaLhzPv3zN1UqlHk6CgFGAMrV2TylzGNIbfQ
 5IFUQw/Zrqr5ae46cx9peaqkTf/NF1GMSLp36P+ztMzAiLptuPYX0ctzIitF3+xE75yu
 W+655VVMtxn+D6nF9qJhe0Q3NMjpoYM8LHGodTeNbtOu2cNNkyDppZrPPRMrrXjJY+xy
 u0cEZdVDhLW/3w2BCmIgzoUyM+rRbWqfNdfyJoWjqIdt3Mv+V3dAfOhXhj3ZKl4vqdaw
 txo5EcKFVtxqWpNSAh7rTJLAvPUqH6xybd+7XHwyqJ/tR5i6cCClY3H0IyEBiqlFS8Xq
 vpeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bKlnpXwOWcFxC9r1hrPSScu5PBUHd30iL2YWISgKJ+I=;
 b=CEBs0SMXIMHVDDJ5s7ACwTKPvc1bhpzoVlfTTpyrSBvAK3fHocwbQCAlQfT6rEP+Cv
 J/nNO6eU2UPrltTrM2CmIXg3Hf4dYyJ466LAuB1MGchpOw43bLkG0XrF0G+b3ZJANutu
 5x+8sIHf5q1vqbnYzoOqyeuAjC+kDDWBJDzlJOx0cwus/moFaG2U932g3cF7GJM2xImH
 IAPRSceKu+caUHQgh9BWVpSAhCRYvqv44YDN0Y33RYk4VtdYXyfG8AHhdVsKfznY6kty
 agZm4GEqq1yZu0TwzPILpUS5TcqiCWqlDL2BVvEsAlyCxHN9qmJnq6lJ0iILYEhBD+VA
 e6og==
X-Gm-Message-State: AOAM53002NUjxoChXGGcIw4hLDSP++2PbC6ZTEe1ZBWXbOFm9Y/V4xp2
 yLPy8e/CHqP8wGTKqbTc0RIPRSSAxAu/6Qh9DKI=
X-Google-Smtp-Source: ABdhPJwdtO3UMouRsAXSWdSmRA6vgxnoFVQbRXq54ngUDZuo4yTU5Qe9VnZ8wz+LFeVGFKCCTlQRK7H/DI8kBOcM02U=
X-Received: by 2002:a92:c102:: with SMTP id p2mr8145808ile.227.1616003350813; 
 Wed, 17 Mar 2021 10:49:10 -0700 (PDT)
MIME-Version: 1.0
References: <1613916082-19528-1-git-send-email-cwshu@andestech.com>
In-Reply-To: <1613916082-19528-1-git-send-email-cwshu@andestech.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 17 Mar 2021 13:47:33 -0400
Message-ID: <CAKmqyKMPZqEsBhqf0aUzsyV9qFeerRAKtZyUH1fqNoAvf7wpPQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] target/riscv: fix PMP permission checking when
 softmmu's TLB hits
To: Jim Shu <cwshu@andestech.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 listair.Francis@wdc.com, Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::134;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x134.google.com
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
X-List-Received-Date: Wed, 17 Mar 2021 17:49:18 -0000

On Sun, Feb 21, 2021 at 10:33 AM Jim Shu <cwshu@andestech.com> wrote:
>
> Sorry for sending this patch set again.
> The cover letter of my previous mail doesn't add cc list.
> ---
>
> Current implementation of PMP permission checking only has effect when
> softmmu's TLB miss. PMP checking is bypassed when TLB hits because TLB page
> permission isn't affected by PMP permission.
>
> To fix this issue, this patch set addes the feature to propagate PMP
> permission to the TLB page and flush TLB pages if PMP permission has
> been changed.
>
> The patch set is tested on Zephyr RTOS userspace testsuite on QEMU riscv32
> virt machine.
>
> Jim Shu (3):
>   target/riscv: propagate PMP permission to TLB page
>   target/riscv: add log of PMP permission checking
>   target/riscv: flush TLB pages if PMP permission has been changed

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  target/riscv/cpu_helper.c | 96 ++++++++++++++++++++++++++++++---------
>  target/riscv/pmp.c        | 84 +++++++++++++++++++++++++---------
>  target/riscv/pmp.h        |  4 +-
>  3 files changed, 141 insertions(+), 43 deletions(-)
>
> --
> 2.30.1
>
>

