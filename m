Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jyRms-0008TI-0F
	for mharc-qemu-riscv@gnu.org; Wed, 22 Jul 2020 23:20:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zong.li@sifive.com>)
 id 1jyRmq-0008Ry-UK
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 23:20:48 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:34309)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zong.li@sifive.com>)
 id 1jyRmp-0008SY-7Y
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 23:20:48 -0400
Received: by mail-ot1-x342.google.com with SMTP id e90so3414418ote.1
 for <qemu-riscv@nongnu.org>; Wed, 22 Jul 2020 20:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BNXpHc2EtQBwYYXOJAAWmqMrbRXKhB/87zHefCPJioY=;
 b=lo4TvUutv+35DdpdN30nF7xhB6x+7l/4n2BGuldG2nxulVskezugQ9EO7hpgeITEfw
 SMVauKqc84Y3PQCm7WrdZuB9uiZ+H4ZBuj4bxmtn2opBjC9qblrbXIMLLNQRtiGZx8OE
 JS2KkWoxKEg8owk0656dWLMOTlvszrY+B0jH97e1jNqTZOHettG8Xf9x6jZ91sDNWxEr
 DrbuaaMnNx9m0weF+qzzsz+lcr8B0OcQTAhHXs1RU4p/LPktaqnFIoncYNk/Aobjrmis
 wF8S7q+3Nm2Jhn8WQSxlHBD8nA2I0P2R8x9vFN7PE4xX/NMRaFiigZyIyiALKQaSZhTL
 VfgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BNXpHc2EtQBwYYXOJAAWmqMrbRXKhB/87zHefCPJioY=;
 b=HdcJprtCV47OdzEecRauFpKDzLGvKKxKtY8E0e1QfqtnClICzOgpczWUvRpksItWt8
 v9ZHcBVD3BCL0WB1aLkXR3FXIGflDsHBZNNhLyporAYy54zHsMsaiu3eHCRanppw4f4+
 VnOv/MixKv9BTHTsFouOTl3tXBmKoWxO3PBtx9mVq8v19AGCNuM7k9XYDJa2hObZuSCe
 zlHb1i+vMMyoWuQmc8VKapBK1YGfyzDz5/5wdZhWqqwjn7PgS/XgcaknwdA/p6f9Vkqh
 ifGl4toaVCFPaV8FCvpldd5cP2rf45Dyp7sVgmjnp5qI1PBD6L7URe0swyJ32UWNimYM
 tGIw==
X-Gm-Message-State: AOAM530OGL1jrIEEEl1NDEXJkMZf59P8/ZR7q1hppkOMwLAmWXr+d9KD
 x5yyLTl2AI2NbsmDuuOme2p/hgMtS9YAU1mOCyfmCA==
X-Google-Smtp-Source: ABdhPJxCHHc/iiTwaXKA24SHwdPiZhCnb+jU0OcvgO+hNPaSBihuX8AsPvCCvWl6Cnhf7yOLteDakkBbLIuEWM3E7zs=
X-Received: by 2002:a9d:708e:: with SMTP id l14mr2771277otj.127.1595474446040; 
 Wed, 22 Jul 2020 20:20:46 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1595335112.git.zong.li@sifive.com>
 <26ac4734d2079d5ec782adef3a5a40e82082b51f.1595335112.git.zong.li@sifive.com>
 <CAEeofchMe3H35zmuyzbVMOWOKrYZwfEGT9UVRb4k8L18WwW8PQ@mail.gmail.com>
In-Reply-To: <CAEeofchMe3H35zmuyzbVMOWOKrYZwfEGT9UVRb4k8L18WwW8PQ@mail.gmail.com>
From: Zong Li <zong.li@sifive.com>
Date: Thu, 23 Jul 2020 11:20:36 +0800
Message-ID: <CANXhq0rcvhGX95JkX08OpRWWZBNZyDgeShD35BvbcQax10PBOA@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] target/riscv: Fix the translation of physical
 address
To: Alexander Richardson <Alexander.Richardson@cl.cam.ac.uk>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Bin Meng <bmeng.cn@gmail.com>, Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=zong.li@sifive.com; helo=mail-ot1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 23 Jul 2020 03:20:49 -0000

On Wed, Jul 22, 2020 at 5:08 PM Alexander Richardson
<Alexander.Richardson@cl.cam.ac.uk> wrote:
>
> On Tue, 21 Jul 2020 at 13:43, Zong Li <zong.li@sifive.com> wrote:
> >
> > The real physical address should add the 12 bits page offset. It also
> > causes the PMP wrong checking due to the minimum granularity of PMP is
> > 4 byte, but we always get the physical address which is 4KB alignment,
> > that means, we always use the start address of the page to check PMP for
> > all addresses which in the same page.
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
>
> I made the same change for our CHERI fork a few months ago but forgot
> to send the patch upstream (despite marking the commit as a candidate
> for upstreaming). Sorry about the duplicated debugging work!
> (https://github.com/CTSRD-CHERI/qemu/commit/61c8e3f2c0fd4965ec3f316146d1751fae673c12)

No, problem.

