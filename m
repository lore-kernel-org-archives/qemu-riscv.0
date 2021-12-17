Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1my1G6-0003gK-Dg
	for mharc-qemu-riscv@gnu.org; Thu, 16 Dec 2021 19:38:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1my1Fw-0003fL-RS; Thu, 16 Dec 2021 19:37:54 -0500
Received: from [2607:f8b0:4864:20::d2a] (port=35499
 helo=mail-io1-xd2a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1my1Fv-00074M-Dx; Thu, 16 Dec 2021 19:37:52 -0500
Received: by mail-io1-xd2a.google.com with SMTP id 14so810830ioe.2;
 Thu, 16 Dec 2021 16:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+hOz8IxXG4sIt5jxiS7v3+2MQSrZNOG0/+ISRJ3HY2s=;
 b=L/6d66ZEJcvf7mWM8oOorzY3RFWCehwBsGAAdecWpwyrJKgv4vCoUEbPZnGK87Cj8T
 c/GxAPHT7sZQGDUD/Y3j/nXPs3YZk4yYRIuDM45oK4WWQ8y8p+L2oEmcY4IJC5IvvQuf
 8RbUvpvOv601jBOePHkMvd0uZwKVo2rPQgvK68kO1HORNAyiM5PLY/UDIZe8hKtdOUfm
 p2k+H9J7ROnEiwaVAz3vgKzB0WOVkZlgRVSeHdCLjJo9MY5VfWJlPx1MS9YdPoDA9UaZ
 VTkRrP9JXjHabVPJgoPk3+b7vc8f5FTgcj7BdJxV/TWWaIN4Wrvn/32A8iMwFjwTSKtd
 ZShg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+hOz8IxXG4sIt5jxiS7v3+2MQSrZNOG0/+ISRJ3HY2s=;
 b=rkIQsoMMaMNnm2qc4u7cZE88lYOmclCSCnJ/1gyT5hUI77Clwhd1BJaFc/3IqRy1Ck
 qV3gd2mBCT8Fc7DeKEEcpFR4RVGPBOKO7TMM3lLRJJwuNp0ELlAYzBT186WQvK/fv7s3
 1+r6/VTQpCP/rROvXcXnM3SYVUT7n/WJf+OAUfZMGFFNHI9NxKvLGa0hlrS/AFzh4J61
 w6/yJkG+BeEYp20g3xVupdih3nuU066MkpjRUVa5Zyqpem6RxIKneTnSv74jsTWvXLSg
 eHo5ntjN0FrYmyGhnqpuqDCYPgdfmudbmxqPTU6ib2SA8dCfJ4iKRvKEsr+AlHv2quyl
 8X0A==
X-Gm-Message-State: AOAM530hzueghLd0WyKmo3wG2MXX7ZVLeMcA8mO2Um0lVXf8CcpM6e9h
 6HCBLsII9XttR0JectEBAEH9fw2UrTFtQ8psl/Q=
X-Google-Smtp-Source: ABdhPJzATcSKSIS4Ge+fgztL1BNeytuPggajHqg/aWy4RjP8alzh+w/GqEiINydI+lAG8mAALuitNblhsSEtQQ2FC4A=
X-Received: by 2002:a6b:f212:: with SMTP id q18mr434473ioh.16.1639701469586;
 Thu, 16 Dec 2021 16:37:49 -0800 (PST)
MIME-Version: 1.0
References: <20211123090902.23321-1-zhiwei_liu@c-sky.com>
 <CAKmqyKOD0JSY3FFBOt6L3=JwRVOsf35eCkpHrB4GvzsTUsOypw@mail.gmail.com>
In-Reply-To: <CAKmqyKOD0JSY3FFBOt6L3=JwRVOsf35eCkpHrB4GvzsTUsOypw@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 17 Dec 2021 10:37:23 +1000
Message-ID: <CAKmqyKPiqLhw0zZK_f-8-WYdc4NYDgqrLTTE9_3k8YgX54F3LA@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] target/riscv: Fix PMP propagation for tlb
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2a.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 17 Dec 2021 00:37:56 -0000

On Wed, Dec 8, 2021 at 1:23 PM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Tue, Nov 23, 2021 at 7:09 PM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
> >
> > Only the pmp index that be checked by pmp_hart_has_privs can be used
> > by pmp_get_tlb_size to avoid an error pmp index.
> >
> > Before modification, we may use an error pmp index. For example,
> > we check address 0x4fc, and the size 0x4 in pmp_hart_has_privs. If there
> > is an pmp rule, valid range is [0x4fc, 0x500), then pmp_hart_has_privs
> > will return true;
> >
> > However, this checked pmp index is discarded as pmp_hart_has_privs
> > return bool value. In pmp_is_range_in_tlb, it will traverse all pmp
> > rules. The tlb_sa will be 0x0, and tlb_ea will be 0x4fff. If there is
> > a pmp rule [0x10, 0x4]. It will be misused as it is legal in
> > pmp_get_tlb_size.
> >
> > Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
>
> Thanks!
>
> Applied to riscv-to-apply.next

This patch causes lots of Linux boot failures. I see messages like this:

Invalid write at addr 0x22048, size 8, region '(null)', reason: rejected

from QEMU and the guest fails to start.

Alistair

