Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iKR9t-0005ft-Vh
	for mharc-qemu-riscv@gnu.org; Tue, 15 Oct 2019 14:02:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56724)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <diodesign@tuta.io>) id 1iKR9q-0005eG-RT
 for qemu-riscv@nongnu.org; Tue, 15 Oct 2019 14:02:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <diodesign@tuta.io>) id 1iKR9p-0000RB-Gi
 for qemu-riscv@nongnu.org; Tue, 15 Oct 2019 14:02:54 -0400
Received: from w4.tutanota.de ([81.3.6.165]:48380)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <diodesign@tuta.io>)
 id 1iKR9k-0000MW-Bd; Tue, 15 Oct 2019 14:02:49 -0400
Received: from w2.tutanota.de (unknown [192.168.1.163])
 by w4.tutanota.de (Postfix) with ESMTP id 7313810601FE;
 Tue, 15 Oct 2019 18:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1571162565; 
 s=s1; d=tuta.io;
 h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding;
 bh=xTj0MPvOyNRMecjZAXuRAVBZspGbCA3DG/mtcIiviv4=;
 b=t5Xl+OUlebsBVyTHMT77bD2+wK1ewWUZrK5RyJHf7yg1UYq1NmwE77iN6Nwjk9Aj
 R0KwpETmWg48AjEaxCsnGb4tFyxeF2/nszYdLwcAct1OhdoO8rA6HKY8ZIoE1VoTU+q
 JIAYgh2OCrH/N51KrAoA7H46Uk+42wOJvhgL+1X6dg9Vf3J19Tb7SJFqtgcwsCzNHPX
 bERO1YJln7o2/8KlwCjEmfH46dKOwsap2eyCgHgddQiKWNw0YxlDMTI1LT23DjrdufB
 AlLJkq3pSTahTZmZUH4+6XDfYuv9CkbYeL5Lgf2Slys1UcqICt0G4oXkmauaKzDfzku
 ZcoHaTpBUA==
Date: Tue, 15 Oct 2019 20:02:45 +0200 (CEST)
From: Chris Williams <diodesign@tuta.io>
To: Alistair Francis <alistair23@gmail.com>
Cc: Palmer Dabbelt <palmer@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Qemu Riscv <qemu-riscv@nongnu.org>,
 Qemu Devel <qemu-devel@nongnu.org>,  <dayeol@berkeley.edu>
Message-ID: <LrF_XLH--3-1@tuta.io>
In-Reply-To: <CAKmqyKNh-jgg-LWHp4RMM9vaaMNr7qHtNSVYs9OFXhvJ-+7RXA@mail.gmail.com>
References: <LqVBb_I--3-1@tuta.io>
 <CAKmqyKNh-jgg-LWHp4RMM9vaaMNr7qHtNSVYs9OFXhvJ-+7RXA@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] target/riscv/pmp: Fix bug preventing
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 81.3.6.165
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
X-List-Received-Date: Tue, 15 Oct 2019 18:02:57 -0000

Hi,
Oct 11, 2019, 15:18 by alistair23@gmail.com:

> On Sun, Oct 6, 2019 at 1:32 AM Chris Williams <diodesign@tuta.io> wrote:
>
> Also please use `git format-patch` to format the patch and then `git
> send-email` to send the patch. There is a whole heap of detail here:
> https://wiki.qemu.org/Contribute/SubmitAPatch <https://wiki.qemu.org/Cont=
ribute/SubmitAPatch>
>
OK, I will do in future. I read the page but failed to get it right. Thanks=
 for spotting my patch, and the advice, though.

>> This fixes an issue that prevents a RISC-V CPU from executing instructio=
ns
>> immediately from the base address of a PMP TOR region.
>>
>> When jumping to an instruction in a PMP TOR region, pmp_hart_has_privs()=
 is
>> called to validate the access. If this instruction is the very first wor=
d of a
>> PMP TOR region, at address 0 relative to the start address of the region=
, then
>> the access will fail. This is because pmp_hart_has_privs() is called wit=
h size
>> 0 to perform this validation, causing this check...
>>
>> e =3D pmp_is_in_range(env, i, addr + size - 1);
>>
>> ... to fail, as (addr + size - 1) falls below the base address of the PM=
P
>> region. Really, the access should succeed. For example, if I have a regi=
on
>> spanning 0x80d96000 to 0x88d95fff and the CPU jumps to 0x80d96000, then:
>>
>> s =3D 0x80d96000
>> e =3D 0x80d95fff
>>
>> And the validation fails. The size check proposed below catches these ze=
ro-size
>> instruction fetch access probes. The word alignment in pmpaddr{0-15} and
>> earlier instruction alignment checks should prevent the execution of
>> instructions over the upper boundary of the PMP region, though I'm happy=
 to give
>> this more attention if this is a concern.
>>
>
> This seems like a similar issue to this patch as well:
> https://lore.kernel.org/qemu-devel/20191007052813.25814-1-dayeol@berkeley=
.edu/ <https://lore.kernel.org/qemu-devel/20191007052813.25814-1-dayeol@ber=
keley.edu/>
>
Yes, it appears Dayeol and I have encountered the same issue.

> From that discussion:
>
> "In general, size 0 means "unknown size".  In this case, the one tlb look=
up is
> going to be used by lots of instructions -- everything that fits on the p=
age."
>
> Richard's last comment seems like a better fix:
>
> "You certainly could do
>
>  if (size =3D=3D 0) {
>  size =3D -(addr | TARGET_PAGE_MASK);
>  }
>
> to assume that all bytes from addr to the end of the page are accessed.  =
That
> would avoid changing too much of the rest of the logic.
>
> That said, this code will continue to not work for mis-aligned boundaries=
."
>
> So I don't think this is the correct solution. I'm not sure if Dayeol
> is planning on sending a follow up version. If not feel free to send
> it.
>
I'm happy for Dayeol to submit a better patch, if necessary.=C2=A0
>> Signed-off-by: Chris Williams <diodesign@tuta.io <mailto:diodesign@tuta.=
io>>
>>
>
> It looks like this is a HTML patch, also ensure all patches are just
> plain text, `git send-email` will do this.
>
Yes, you're right: my webmail client isn't particularly neighborly with res=
pect to Qemu's submission process.

C.

