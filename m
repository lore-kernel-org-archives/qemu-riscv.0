Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o1oUQ-0006Jc-1a
	for mharc-qemu-riscv@gnu.org; Thu, 16 Jun 2022 08:20:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nico@fluxnic.net>)
 id 1o1oUJ-0006HS-LL; Thu, 16 Jun 2022 08:20:41 -0400
Received: from pb-smtp1.pobox.com ([64.147.108.70]:55832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nico@fluxnic.net>)
 id 1o1oUG-0008GC-W3; Thu, 16 Jun 2022 08:20:39 -0400
Received: from pb-smtp1.pobox.com (unknown [127.0.0.1])
 by pb-smtp1.pobox.com (Postfix) with ESMTP id BA25112B635;
 Thu, 16 Jun 2022 08:20:33 -0400 (EDT)
 (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=date:from
 :to:cc:subject:in-reply-to:message-id:references:mime-version
 :content-type; s=sasl; bh=W0PCqn+zOysWs6yMKPn42p/J02BEro1xmorR0s
 tQz74=; b=hak9apV9arXViTrYW8x/4dda8K4VZyIiFDHl8vfG8Pf0LMU8hKEQ5q
 eECcMPtga9yAnh4Z+AFvNbmepNH3SviZTOlqRDenRZ7DYYjvGOUnXl8aKl8ot+0y
 P1Myt5kUILckzQm+C+MkNUDAmmzUPw6GRZ7i9Oy2UCnZ1sG4y00aI=
Received: from pb-smtp1.nyi.icgroup.com (unknown [127.0.0.1])
 by pb-smtp1.pobox.com (Postfix) with ESMTP id B080C12B634;
 Thu, 16 Jun 2022 08:20:33 -0400 (EDT)
 (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=fluxnic.net;
 h=date:from:to:cc:subject:in-reply-to:message-id:references:mime-version:content-type;
 s=2016-12.pbsmtp; bh=W0PCqn+zOysWs6yMKPn42p/J02BEro1xmorR0stQz74=;
 b=EnOxHa8gSNJPK8WjkvEkqixwNnvSuQ2fcYqfPFPDYkboKl3g/+DsXuq5KjyCmPeYX+NGd0j+AhkuPpPtk+GWdLTqVD0vw5AOtAeGPqnk4HvIziIP9bpg3QTxVjugBadCd4PV3dswMA54HaAECmsVMHgnn4fMBLefMyhDrPCHKjw=
Received: from yoda.home (unknown [96.21.170.108])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp1.pobox.com (Postfix) with ESMTPSA id 1FEC612B632;
 Thu, 16 Jun 2022 08:20:33 -0400 (EDT)
 (envelope-from nico@fluxnic.net)
Received: from xanadu.home (xanadu.home [192.168.2.2])
 by yoda.home (Postfix) with ESMTPSA id 0054B2E2030;
 Thu, 16 Jun 2022 08:20:31 -0400 (EDT)
Date: Thu, 16 Jun 2022 08:20:31 -0400 (EDT)
From: Nicolas Pitre <nico@fluxnic.net>
To: Alistair Francis <alistair23@gmail.com>
cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>
Subject: Re: [PATCH] target/riscv/pmp: guard against PMP ranges with a negative
 size
In-Reply-To: <CAKmqyKPJ2Pxn8nG3Lwu2rLGuTZyTmGvjWOqbty8C6ayhtd0wqw@mail.gmail.com>
Message-ID: <o8p9829n-58n8-o38o-r533-p2q056pq65p@syhkavp.arg>
References: <3oq0sqs1-67o0-145-5n1s-453o118804q@syhkavp.arg>
 <CAKmqyKPJ2Pxn8nG3Lwu2rLGuTZyTmGvjWOqbty8C6ayhtd0wqw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Pobox-Relay-ID: B80A032C-ED6E-11EC-9402-5E84C8D8090B-78420484!pb-smtp1.pobox.com
Received-SPF: pass client-ip=64.147.108.70; envelope-from=nico@fluxnic.net;
 helo=pb-smtp1.pobox.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 16 Jun 2022 12:20:44 -0000

On Thu, 16 Jun 2022, Alistair Francis wrote:

> On Thu, Jun 16, 2022 at 7:12 AM Nicolas Pitre <nico@fluxnic.net> wrote:
> >
> > For a TOR entry to match, the stard address must be lower than the end
> > address. Normally this is always the case, but correct code might still
> > run into the following scenario:
> >
> > Initial state:
> >
> >         pmpaddr3 = 0x2000       pmp3cfg = OFF
> >         pmpaddr4 = 0x3000       pmp4cfg = TOR
> >
> > Execution:
> >
> >         1. write 0x40ff to pmpaddr3
> >         2. write 0x32ff to pmpaddr4
> 
> Hey, thanks for that patch!
> 
> So, at this point we have a PMP region enforcing
> 
> 0x40ff <= addr < 0x32ff
> 
> which is going to be wrong as that isn't valid. But this is also
> partially a guest bug. If a guest sets invalid PMP regions we should
> be throwing exceptions (if the PMP region is enabled and enforced in
> the current mode)

The guest cannot change all the relevant PMP registers for a single PMP 
entry atomically. This is why you normally update the PMP configuration 
in m-mode with MPRV unset for invalid but transient PMP states to have 
no adverse effects.

> >         3. set pmp3cfg to NAPOT with a read-modify-write on pmpcfg0
> >         4. set pmp4cfg to NAPOT with a read-modify-write on pmpcfg1
> >
> > When (2) is emulated, a call to pmp_update_rule() creates a negative
> > range for pmp4 as pmp4cfg is still set to TOR. And when (3) is emulated,
> 
> I don't see where the negative comes from. From what I can tell we
> should just set `sa` and `ea` to the values specified by the guest.

Eventually that is the case i.e. when the type is changed from TOR to 
NAPOT in (4), at which point everything is well and sane. But that can't 
happen atomically as I said. Yet QEMU does interpret the intermediate 
state although it shouldn't.

> > a call to tlb_flush() is performed, causing pmp_get_tlb_size() to return
> > a very creatively large TLB size for pmp4. This, in turn, may result in
> 
> Hmm.. pmp_get_tlb_size() assumes pmp_ea > pmp_sa. Maybe we should add
> a check in there?

It is more efficient to prevent sa > ea in the first place as 
pmp_get_tlb_size() is called way more often than pmp_update_rule_addr().

Let's not forget that those sa/ea are simplified representations of the 
hardware and not what the guest can see. The original register content 
written by the guest is preserved.

> > accesses to non-existent/unitialized memory regions and a fault, so that
> > (4) ends up never being executed.
> >
> > This is in m-mode with MPRV unset, meaning that unlocked PMP entries
> > should have no effect. Therefore such a behavior based on PMP content
> > is very unexpected.
> 
> Ok, this part is a QEMU bug. If we aren't enforcing PMP regions we
> should not be throwing PMP errors.

Right. But this is not a PMP error. It is QEMU screwing up its internal 
state. It does even segfault when this condition occur if -d cpu is 
provided.

> get_physical_address_pmp() should give us full permissions though in
> this case, so I don't see where the failure is.

And it does. That's not where the problem is.

> Can you include some more details?

As I said, in the middle of updating the pmpcfg registers in (3), 
tlb_flush() is invoked which causes the core to revalidate its memory 
TLB cache down through pmp_get_tlb_size() where bad answers are 
returned. This causes the core to assume a different memory area which 
doesn't exist and the next memory access ends up calling 
unassigned_mem_accepts() where false is unconditionally returned. And I 
suspect this is also the result of a buffer overflow as the address 
logged in memory_region_access_valid() is sometimes complete garbage 
too, and the occasional QEMU segfault.

> > Make sure no negative PMP range can be created, whether explicitly by
> > the emulated code or implicitly like the above.
> >
> > Signed-off-by: Nicolas Pitre <nico@fluxnic.net>
> >
> > diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> > index 151da3fa08..ea2b67d947 100644
> > --- a/target/riscv/pmp.c
> > +++ b/target/riscv/pmp.c
> > @@ -167,6 +167,9 @@ void pmp_update_rule_addr(CPURISCVState *env, uint32_t pmp_index)
> >      case PMP_AMATCH_TOR:
> >          sa = prev_addr << 2; /* shift up from [xx:0] to [xx+2:2] */
> >          ea = (this_addr << 2) - 1u;
> > +        if (sa > ea) {
> > +            sa = ea = 0u;
> > +        }
> 
> This doesn't seem right though.
> 
> Image if a guest sets the values you have above, then jumps to user
> mode. The spec doesn't seem to say what should happen with invalid PMP
> ranges, but I feel like we should throw exceptions instead of just
> ignoring the config.

The spec says that a given memory access has to be >= the bottom 
boundary and < the top boundary for a PMP entry to match. So an invalid 
PMP entry should simply not match. That's what a hardware comparator 
would do: it would just not match. Furthermore, you cannot tell if the 
guest is in the middle of updating its PMP configuration which are split 
across several registers as illustrated above, therefore transient 
invalid states are unavoidable.


Nicolas

