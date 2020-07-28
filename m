Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k0FPs-0005of-VK
	for mharc-qemu-riscv@gnu.org; Mon, 27 Jul 2020 22:32:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zong.li@sifive.com>)
 id 1k0FPr-0005oS-Lt
 for qemu-riscv@nongnu.org; Mon, 27 Jul 2020 22:32:31 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:43958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zong.li@sifive.com>)
 id 1k0FPp-00030p-LE
 for qemu-riscv@nongnu.org; Mon, 27 Jul 2020 22:32:30 -0400
Received: by mail-ot1-x341.google.com with SMTP id r21so3325054ota.10
 for <qemu-riscv@nongnu.org>; Mon, 27 Jul 2020 19:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WtTALDH/d9S5LHHZhOVxU2ix+WMJrL3ncx6MiARJYpY=;
 b=Zqp2MBI63r1PajxTcqSYO2ydkY2GVIX045zE1aulYiim2J5ayB3d9EsDgkOUDzDk/d
 BeAWFdalTUlQrbsiyIyYvuFrWWyNBf724n1X6tI+P70nWm+zp7wMNsdc3pT30KOZEFsR
 PXUXdxi1zRkKl7dYk1sOKH3hMKMj7WqycN6NBhrIb6JJNE7oMgaStsqmDd2CZfwZHWEw
 H2+MQayK0VAh/Y/wYUbkj2kqRAC77F0LUfzpzrTo2IrlUCMTLmMKKX5w6z4/S1Q8renj
 s5bDYrGT6GiCcak8PpqsFmDC9sigadsxHrz1/NDlfJnC4s7CWT7KIG9KAe9E8IE0dB1T
 t5pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WtTALDH/d9S5LHHZhOVxU2ix+WMJrL3ncx6MiARJYpY=;
 b=uoPyy+zHQfHQL4MEcS7NVeYwe2RTg1OwVXmmB0stZjAbNvz0lQUHjHWNREFyEE2rQn
 FJRsew4pJeYZDVH3IUq1qqnH3ryNCtErKlsMUIx/He3rptIwOUEOpY7HXQA2nOqKtI9O
 J3I+RpDFhlu2NRpvjq5zOwclMdXIz1UKTdHouEwv7/PQ8avkRhoWm/zAM3tSNBom5Eqi
 +jNQxm/43Cl0KSrX7tyuxqu2ELiE45IjoRiwpgnq8JPOhab33g/n4QxrrENwIEqIV6ik
 0+vRQmZGSVQcCiukeripXvmFjuli2XMxW/2QspXY19I3HxgrCA8O1wmqX9FXa5GXTxlC
 Dg2Q==
X-Gm-Message-State: AOAM531R+fSGfSvRyJVfwlJO6foWZ2+ysJaqgxJAGTqZh6rPVWWPBOaW
 vfGXD1c1d4KVPBcCSw3PugGUXQ/KzmOFsI5b/Z/Okg==
X-Google-Smtp-Source: ABdhPJyQO95g7T/t+Z24Wzdz7REQUPEV5mjFwKnqnnQIDxSZ6bwbIc9FKoPtsQ5Ly+gwkR05dF4o+gueidw9CXgA6zU=
X-Received: by 2002:a9d:708e:: with SMTP id l14mr24130053otj.127.1595903547534; 
 Mon, 27 Jul 2020 19:32:27 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1595689201.git.zong.li@sifive.com>
 <a3b3b05f429a50b5ea061f4e8385d4f8d6d77d58.1595689201.git.zong.li@sifive.com>
 <CAKmqyKNgVD2sb4GEdmFwgHtpbooV=dNkxHHN+mNWDzC1e1S1DQ@mail.gmail.com>
In-Reply-To: <CAKmqyKNgVD2sb4GEdmFwgHtpbooV=dNkxHHN+mNWDzC1e1S1DQ@mail.gmail.com>
From: Zong Li <zong.li@sifive.com>
Date: Tue, 28 Jul 2020 10:32:18 +0800
Message-ID: <CANXhq0oR2CRMe37qzuCmi31RgtzhYDWeLRKX0W1XKPGHAmE6ZQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/4] target/riscv: Fix the translation of physical
 address
To: Alistair Francis <alistair23@gmail.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Bin Meng <bmeng.cn@gmail.com>, Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::341;
 envelope-from=zong.li@sifive.com; helo=mail-ot1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 28 Jul 2020 02:32:31 -0000

On Tue, Jul 28, 2020 at 6:49 AM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Sat, Jul 25, 2020 at 8:05 AM Zong Li <zong.li@sifive.com> wrote:
> >
> > The real physical address should add the 12 bits page offset. It also
> > causes the PMP wrong checking due to the minimum granularity of PMP is
> > 4 byte, but we always get the physical address which is 4KB alignment,
> > that means, we always use the start address of the page to check PMP for
> > all addresses which in the same page.
>
> So riscv_cpu_tlb_fill() will clear these bits when calling
> tlb_set_page(), so this won't have an impact on actual translation
> (although it will change in input address for 2-stage translation, but
> that seems fine).
>
> Your point about PMP seems correct as we allow a smaller then page
> granularity this seems like the right approach.
>
> Can you edit riscv_cpu_get_phys_page_debug() to mask these bits out at
> the end? Otherwise we will break what callers to
> cpu_get_phys_page_attrs_debug() expect.
>

OK, I checked that already, the callers would add these bits again,
because they expect to get the address for the page. Thanks for your
reviewing, modify it in the next version.

> Alistair
>
> >
> > Signed-off-by: Zong Li <zong.li@sifive.com>
> > ---
> >  target/riscv/cpu_helper.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> > index 75d2ae3434..08b069f0c9 100644
> > --- a/target/riscv/cpu_helper.c
> > +++ b/target/riscv/cpu_helper.c
> > @@ -543,7 +543,8 @@ restart:
> >              /* for superpage mappings, make a fake leaf PTE for the TLB's
> >                 benefit. */
> >              target_ulong vpn = addr >> PGSHIFT;
> > -            *physical = (ppn | (vpn & ((1L << ptshift) - 1))) << PGSHIFT;
> > +            *physical = ((ppn | (vpn & ((1L << ptshift) - 1))) << PGSHIFT) |
> > +                        (addr & ~TARGET_PAGE_MASK);
> >
> >              /* set permissions on the TLB entry */
> >              if ((pte & PTE_R) || ((pte & PTE_X) && mxr)) {
> > --
> > 2.27.0
> >
> >

