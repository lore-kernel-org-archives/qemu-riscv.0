Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hqXks-00025h-8c
	for mharc-qemu-riscv@gnu.org; Thu, 25 Jul 2019 03:01:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50448)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <tony.nguyen@bt.com>) id 1hqXko-00025W-Ix
 for qemu-riscv@nongnu.org; Thu, 25 Jul 2019 03:01:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1hqXkl-000289-W5
 for qemu-riscv@nongnu.org; Thu, 25 Jul 2019 03:01:30 -0400
Received: from smtpe1.intersmtp.com ([213.121.35.74]:58897)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>)
 id 1hqXkb-0001yR-41; Thu, 25 Jul 2019 03:01:17 -0400
Received: from tpw09926dag18f.domain1.systemhost.net (10.9.212.26) by
 BWP09926079.bt.com (10.36.82.110) with Microsoft SMTP Server (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.1713.5; Thu, 25
 Jul 2019 08:01:14 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18f.domain1.systemhost.net (10.9.212.26) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Thu, 25 Jul 2019 08:01:14 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Thu, 25 Jul
 2019 08:01:14 +0100
From: <tony.nguyen@bt.com>
To: <qemu-devel@nongnu.org>
CC: <peter.maydell@linaro.org>, <walling@linux.ibm.com>, <david@redhat.com>,
 <palmer@sifive.com>, <mark.cave-ayland@ilande.co.uk>,
 <Alistair.Francis@wdc.com>, <arikalo@wavecomp.com>, <mst@redhat.com>,
 <pasic@linux.ibm.com>, <borntraeger@de.ibm.com>, <rth@twiddle.net>,
 <atar4qemu@gmail.com>, <ehabkost@redhat.com>, <sw@weilnetz.de>,
 <alex.williamson@redhat.com>, <qemu-arm@nongnu.org>,
 <david@gibson.dropbear.id.au>, <qemu-riscv@nongnu.org>, <cohuck@redhat.com>,
 <qemu-s390x@nongnu.org>, <qemu-ppc@nongnu.org>, <amarkovic@wavecomp.com>,
 <pbonzini@redhat.com>, <aurelien@aurel32.net>
Thread-Topic: [Qemu-devel] [PATCH v3 00/15] Invert Endian bit in SPARCv9 MMU
 TTE
Thread-Index: AQHVQrP3RrTfmfnvbEOFfW6KFJKHhQ==
Date: Thu, 25 Jul 2019 07:01:14 +0000
Message-ID: <1564038073754.91133@bt.com>
References: <e9c6e5310b1a4863be45d45bf087fc3d@tpw09926dag18e.domain1.systemhost.net>,
 <1563810716254.18886@bt.com>
In-Reply-To: <1563810716254.18886@bt.com>
Accept-Language: en-AU, en-GB, en-US
Content-Language: en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.187.101.42]
Content-Type: multipart/alternative; boundary="_000_156403807375491133btcom_"
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 213.121.35.74
Subject: [Qemu-riscv] [Qemu-devel] [PATCH v3 00/15] Invert Endian bit in
 SPARCv9 MMU TTE
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
X-List-Received-Date: Thu, 25 Jul 2019 07:01:33 -0000

--_000_156403807375491133btcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

This patchset implements the IE (Invert Endian) bit in SPARCv9 MMU TTE.

It is an attempt of the instructions outlined by Richard Henderson to Mark
Cave-Ayland.

Tested with OpenBSD on sun4u. Solaris 10 is my actual goal, but unfortunate=
ly a
separate keyboard issue remains in the way.

On 01/11/17 19:15, Mark Cave-Ayland wrote:

>On 15/08/17 19:10, Richard Henderson wrote:
>
>> [CC Peter re MemTxAttrs below]
>>
>> On 08/15/2017 09:38 AM, Mark Cave-Ayland wrote:
>>> Working through an incorrect endian issue on qemu-system-sparc64, it ha=
s
>>> become apparent that at least one OS makes use of the IE (Invert Endian=
)
>>> bit in the SPARCv9 MMU TTE to map PCI memory space without the
>>> programmer having to manually endian-swap accesses.
>>>
>>> In other words, to quote the UltraSPARC specification: "if this bit is
>>> set, accesses to the associated page are processed with inverse
>>> endianness from what is specified by the instruction (big-for-little an=
d
>>> little-for-big)".

A good explanation by Mark why the IE bit is required.

>>>
>>> Looking through various bits of code, I'm trying to get a feel for the
>>> best way to implement this in an efficient manner. From what I can see
>>> this could be solved using an additional MMU index, however I'm not
>>> overly familiar with the memory and softmmu subsystems.
>>
>> No, it can't be solved with an MMU index.
>>
>>> Can anyone point me in the right direction as to what would be the best
>>> way to implement this feature within QEMU?
>>
>> It's definitely tricky.
>>
>> We definitely need some TLB_FLAGS_MASK bit set so that we're forced thro=
ugh
>> the
>> memory slow path.  There is no other way to bypass the endianness that w=
e've
>> already encoded from the target instruction.
>>
>> Given the tlb_set_page_with_attrs interface, I would think that we need =
a new
>> bit in MemTxAttrs, so that the target/sparc tlb_fill (and subroutines) c=
an
>> pass
>> along the TTE bit for the given page.
>>
>> We have an existing problem in softmmu_template.h,
>>
>>     /* ??? Note that the io helpers always read data in the target
>>        byte ordering.  We should push the LE/BE request down into io.  *=
/
>>     res =3D glue(io_read, SUFFIX)(env, mmu_idx, index, addr, retaddr);
>>     res =3D TGT_BE(res);
>>
>> We do not want to add a third(!) byte swap along the i/o path.  We need =
to
>> collapse the two that we have already before considering this one.
>>
>> This probably takes the form of:
>>
>> (1) Replacing the "int size" argument with "TCGMemOp memop" for
>>       a) io_{read,write}x in accel/tcg/cputlb.c,
>>       b) memory_region_dispatch_{read,write} in memory.c,
>>       c) adjust_endianness in memory.c.
>>     This carries size+sign+endianness down to the next level.
>>
>> (2) In memory.c, adjust_endianness,
>>
>>      if (memory_region_wrong_endianness(mr)) {
>> -        switch (size) {
>> +        memop ^=3D MO_BSWAP;
>> +    }
>> +    if (memop & MO_BSWAP) {
>>
>>     For extra credit, re-arrange memory_region_wrong_endianness
>>     to something more explicit -- "wrong" isn't helpful.
>
>Finally I've had a bit of spare time to experiment with this approach,
>and from what I can see there are currently 2 issues:
>
>
>1) Using TCGMemOp in memory.c means it is no longer accelerator agnostic
>
>For the moment I've defined a separate MemOp in memory.h and provided a
>mapping function in io_{read,write}x to map from TCGMemOp to MemOp and
>then pass that into memory_region_dispatch_{read,write}.
>
>Other than not referencing TCGMemOp in the memory API, another reason
>for doing this was that I wasn't convinced that all the MO_ attributes
>were valid outside of TCG. I do, of course, strongly defer to other
>people's knowledge in this area though.
>
>
>2) The above changes to adjust_endianness() fail when
>memory_region_dispatch_{read,write} are called recursively
>
>Whilst booting qemu-system-sparc64 I see that
>memory_region_dispatch_{read,write} get called recursively - once via
>io_{read,write}x and then again via flatview_read_continue() in exec.c.
>
>The net effect of this is that we perform the bswap correctly at the
>tail of the recursion, but then as we travel back up the stack we hit
>memory_region_dispatch_{read,write} once again causing a second bswap
>which means the value is returned with the incorrect endian again.
>
>
>My understanding from your softmmu_template.h comment above is that the
>memory API should do the endian swapping internally allowing the removal
>of the final TGT_BE/TGT_LE applied to the result, or did I get this wrong?
>
>> (3) In tlb_set_page_with_attrs, notice attrs.byte_swap and set
>>     a new TLB_FORCE_SLOW bit within TLB_FLAGS_MASK.
>>
>> (4) In io_{read,write}x, if iotlbentry->attrs.byte_swap is set,
>>     then memop ^=3D MO_BSWAP.

Thanks all for the v1 and v2 feedback.

v2:
- Moved size+sign+endianness attributes from TCGMemOp into MemOp.
  In v1 TCGMemOp was re-purposed entirely into MemOp.
- Replaced MemOp MO_{8|16|32|64} with TCGMemOp MO_{UB|UW|UL|UQ} alias.
  This is to avoid warnings on comparing and coercing different enums.
- Renamed get_memop to get_tcgmemop for clarity.
- MEMOP is now SIZE_MEMOP, which is just ctzl(size).
- Split patch 3/4 so one memory_region_dispatch_{read|write} interface
  is converted per patch.
- Do not reuse TLB_RECHECK, use new TLB_FORCE_SLOW instead.
- Split patch 4/4 so adding the MemTxAddrs parameters and converting
  tlb_set_page() to tlb_set_page_with_attrs() is separate from usage.
- CC'd maintainers.

v3:
- Like v1, the entire TCGMemOp enum is now MemOp.
- MemOp target dependant attributes are conditional upon NEED_CPU_H

Tony Nguyen (15):
  tcg: TCGMemOp is now accelerator independent MemOp
  memory: Access MemoryRegion with MemOp
  target/mips: Access MemoryRegion with MemOp
  hw/s390x: Access MemoryRegion with MemOp
  hw/intc/armv7m_nic: Access MemoryRegion with MemOp
  hw/virtio: Access MemoryRegion with MemOp
  hw/vfio: Access MemoryRegion with MemOp
  exec: Access MemoryRegion with MemOp
  cputlb: Access MemoryRegion with MemOp
  memory: Access MemoryRegion with MemOp semantics
  memory: Single byte swap along the I/O path
  cpu: TLB_FLAGS_MASK bit to force memory slow path
  cputlb: Byte swap memory transaction attribute
  target/sparc: Add TLB entry with attributes
  target/sparc: sun4u Invert Endian TTE bit

 accel/tcg/cputlb.c                      |  71 +++++++++--------
 exec.c                                  |   6 +-
 hw/intc/armv7m_nvic.c                   |  12 ++-
 hw/s390x/s390-pci-inst.c                |   8 +-
 hw/vfio/pci-quirks.c                    |   5 +-
 hw/virtio/virtio-pci.c                  |   7 +-
 include/exec/cpu-all.h                  |  10 ++-
 include/exec/memattrs.h                 |   2 +
 include/exec/memop.h                    | 112 +++++++++++++++++++++++++++
 include/exec/memory.h                   |   9 ++-
 memory.c                                |  37 +++++----
 memory_ldst.inc.c                       |  18 ++---
 target/alpha/translate.c                |   2 +-
 target/arm/translate-a64.c              |  48 ++++++------
 target/arm/translate-a64.h              |   2 +-
 target/arm/translate-sve.c              |   2 +-
 target/arm/translate.c                  |  32 ++++----
 target/arm/translate.h                  |   2 +-
 target/hppa/translate.c                 |  14 ++--
 target/i386/translate.c                 | 132 ++++++++++++++++------------=
----
 target/m68k/translate.c                 |   2 +-
 target/microblaze/translate.c           |   4 +-
 target/mips/op_helper.c                 |   5 +-
 target/mips/translate.c                 |   8 +-
 target/openrisc/translate.c             |   4 +-
 target/ppc/translate.c                  |  12 +--
 target/riscv/insn_trans/trans_rva.inc.c |   8 +-
 target/riscv/insn_trans/trans_rvi.inc.c |   4 +-
 target/s390x/translate.c                |   6 +-
 target/s390x/translate_vx.inc.c         |  10 +--
 target/sparc/cpu.h                      |   2 +
 target/sparc/mmu_helper.c               |  40 ++++++----
 target/sparc/translate.c                |  14 ++--
 target/tilegx/translate.c               |  10 +--
 target/tricore/translate.c              |   8 +-
 tcg/README                              |   2 +-
 tcg/aarch64/tcg-target.inc.c            |  26 +++----
 tcg/arm/tcg-target.inc.c                |  26 +++----
 tcg/i386/tcg-target.inc.c               |  24 +++---
 tcg/mips/tcg-target.inc.c               |  16 ++--
 tcg/optimize.c                          |   2 +-
 tcg/ppc/tcg-target.inc.c                |  12 +--
 tcg/riscv/tcg-target.inc.c              |  20 ++---
 tcg/s390/tcg-target.inc.c               |  14 ++--
 tcg/sparc/tcg-target.inc.c              |   6 +-
 tcg/tcg-op.c                            |  38 ++++-----
 tcg/tcg-op.h                            |  86 ++++++++++-----------
 tcg/tcg.c                               |   2 +-
 tcg/tcg.h                               |  99 ++----------------------
 trace/mem-internal.h                    |   4 +-
 trace/mem.h                             |   4 +-
 51 files changed, 561 insertions(+), 488 deletions(-)
 create mode 100644 include/exec/memop.h

--
1.8.3.1




--_000_156403807375491133btcom_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none"><!-- P { margin-top: 0px; m=
argin-bottom: 0px; } p { margin-top: 0px; margin-bottom: 0px; } .EmailQuote=
 { margin-left: 1pt; padding-left: 4pt; border-left-width: 2px; border-left=
-style: solid; border-left-color: rgb(128, 0, 0); }--></style>
</head>
<body dir=3D"ltr" style=3D"font-size:12pt;color:#000000;background-color:#F=
FFFFF;font-family:Calibri,Arial,Helvetica,sans-serif;">
<p></p>
<div><span style=3D"font-size: 12pt;">This patchset implements the IE (Inve=
rt Endian) bit in SPARCv9 MMU TTE.</span><br>
</div>
<div><br>
</div>
<div>It is an attempt of the instructions outlined by Richard Henderson to =
Mark</div>
<div>Cave-Ayland.</div>
<div><br>
</div>
<div>Tested with OpenBSD on sun4u. Solaris 10 is my actual goal, but unfort=
unately a</div>
<div>separate keyboard issue remains in the way.</div>
<div><br>
</div>
<div>On 01/11/17 19:15, Mark Cave-Ayland wrote:</div>
<div><br>
</div>
<div>&gt;On 15/08/17 19:10, Richard Henderson wrote:</div>
<div>&gt;</div>
<div>&gt;&gt; [CC Peter re MemTxAttrs below]</div>
<div>&gt;&gt;</div>
<div>&gt;&gt; On 08/15/2017 09:38 AM, Mark Cave-Ayland wrote:</div>
<div>&gt;&gt;&gt; Working through an incorrect endian issue on qemu-system-=
sparc64, it has</div>
<div>&gt;&gt;&gt; become apparent that at least one OS makes use of the IE =
(Invert Endian)</div>
<div>&gt;&gt;&gt; bit in the SPARCv9 MMU TTE to map PCI memory space withou=
t the</div>
<div>&gt;&gt;&gt; programmer having to manually endian-swap accesses.</div>
<div>&gt;&gt;&gt;</div>
<div>&gt;&gt;&gt; In other words, to quote the UltraSPARC specification: &q=
uot;if this bit is</div>
<div>&gt;&gt;&gt; set, accesses to the associated page are processed with i=
nverse</div>
<div>&gt;&gt;&gt; endianness from what is specified by the instruction (big=
-for-little and</div>
<div>&gt;&gt;&gt; little-for-big)&quot;.</div>
<div><br>
</div>
<div>A good explanation by Mark why the IE bit is required.</div>
<div><br>
</div>
<div>&gt;&gt;&gt;</div>
<div>&gt;&gt;&gt; Looking through various bits of code, I'm trying to get a=
 feel for the</div>
<div>&gt;&gt;&gt; best way to implement this in an efficient manner. From w=
hat I can see</div>
<div>&gt;&gt;&gt; this could be solved using an additional MMU index, howev=
er I'm not</div>
<div>&gt;&gt;&gt; overly familiar with the memory and softmmu subsystems.</=
div>
<div>&gt;&gt;</div>
<div>&gt;&gt; No, it can't be solved with an MMU index.</div>
<div>&gt;&gt;</div>
<div>&gt;&gt;&gt; Can anyone point me in the right direction as to what wou=
ld be the best</div>
<div>&gt;&gt;&gt; way to implement this feature within QEMU?</div>
<div>&gt;&gt;</div>
<div>&gt;&gt; It's definitely tricky.</div>
<div>&gt;&gt;</div>
<div>&gt;&gt; We definitely need some TLB_FLAGS_MASK bit set so that we're =
forced through</div>
<div>&gt;&gt; the</div>
<div>&gt;&gt; memory slow path. &nbsp;There is no other way to bypass the e=
ndianness that we've</div>
<div>&gt;&gt; already encoded from the target instruction.</div>
<div>&gt;&gt;</div>
<div>&gt;&gt; Given the tlb_set_page_with_attrs interface, I would think th=
at we need a new</div>
<div>&gt;&gt; bit in MemTxAttrs, so that the target/sparc tlb_fill (and sub=
routines) can</div>
<div>&gt;&gt; pass</div>
<div>&gt;&gt; along the TTE bit for the given page.</div>
<div>&gt;&gt;</div>
<div>&gt;&gt; We have an existing problem in softmmu_template.h,</div>
<div>&gt;&gt;</div>
<div>&gt;&gt; &nbsp; &nbsp; /* ??? Note that the io helpers always read dat=
a in the target</div>
<div>&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;byte ordering. &nbsp;We should pus=
h the LE/BE request down into io. &nbsp;*/</div>
<div>&gt;&gt; &nbsp; &nbsp; res =3D glue(io_read, SUFFIX)(env, mmu_idx, ind=
ex, addr, retaddr);</div>
<div>&gt;&gt; &nbsp; &nbsp; res =3D TGT_BE(res);</div>
<div>&gt;&gt;</div>
<div>&gt;&gt; We do not want to add a third(!) byte swap along the i/o path=
. &nbsp;We need to</div>
<div>&gt;&gt; collapse the two that we have already before considering this=
 one.</div>
<div>&gt;&gt;</div>
<div>&gt;&gt; This probably takes the form of:</div>
<div>&gt;&gt;</div>
<div>&gt;&gt; (1) Replacing the &quot;int size&quot; argument with &quot;TC=
GMemOp memop&quot; for</div>
<div>&gt;&gt; &nbsp; &nbsp; &nbsp; a) io_{read,write}x in accel/tcg/cputlb.=
c,</div>
<div>&gt;&gt; &nbsp; &nbsp; &nbsp; b) memory_region_dispatch_{read,write} i=
n memory.c,</div>
<div>&gt;&gt; &nbsp; &nbsp; &nbsp; c) adjust_endianness in memory.c.</div>
<div>&gt;&gt; &nbsp; &nbsp; This carries size&#43;sign&#43;endianness down =
to the next level.</div>
<div>&gt;&gt;</div>
<div>&gt;&gt; (2) In memory.c, adjust_endianness,</div>
<div>&gt;&gt;</div>
<div>&gt;&gt; &nbsp; &nbsp; &nbsp;if (memory_region_wrong_endianness(mr)) {=
</div>
<div>&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp;switch (size) {</div>
<div>&gt;&gt; &#43; &nbsp; &nbsp; &nbsp; &nbsp;memop ^=3D MO_BSWAP;</div>
<div>&gt;&gt; &#43; &nbsp; &nbsp;}</div>
<div>&gt;&gt; &#43; &nbsp; &nbsp;if (memop &amp; MO_BSWAP) {</div>
<div>&gt;&gt;</div>
<div>&gt;&gt; &nbsp; &nbsp; For extra credit, re-arrange memory_region_wron=
g_endianness</div>
<div>&gt;&gt; &nbsp; &nbsp; to something more explicit -- &quot;wrong&quot;=
 isn't helpful.</div>
<div>&gt;</div>
<div>&gt;Finally I've had a bit of spare time to experiment with this appro=
ach,</div>
<div>&gt;and from what I can see there are currently 2 issues:</div>
<div>&gt;</div>
<div>&gt;</div>
<div>&gt;1) Using TCGMemOp in memory.c means it is no longer accelerator ag=
nostic</div>
<div>&gt;</div>
<div>&gt;For the moment I've defined a separate MemOp in memory.h and provi=
ded a</div>
<div>&gt;mapping function in io_{read,write}x to map from TCGMemOp to MemOp=
 and</div>
<div>&gt;then pass that into memory_region_dispatch_{read,write}.</div>
<div>&gt;</div>
<div>&gt;Other than not referencing TCGMemOp in the memory API, another rea=
son</div>
<div>&gt;for doing this was that I wasn't convinced that all the MO_ attrib=
utes</div>
<div>&gt;were valid outside of TCG. I do, of course, strongly defer to othe=
r</div>
<div>&gt;people's knowledge in this area though.</div>
<div>&gt;</div>
<div>&gt;</div>
<div>&gt;2) The above changes to adjust_endianness() fail when</div>
<div>&gt;memory_region_dispatch_{read,write} are called recursively</div>
<div>&gt;</div>
<div>&gt;Whilst booting qemu-system-sparc64 I see that</div>
<div>&gt;memory_region_dispatch_{read,write} get called recursively - once =
via</div>
<div>&gt;io_{read,write}x and then again via flatview_read_continue() in ex=
ec.c.</div>
<div>&gt;</div>
<div>&gt;The net effect of this is that we perform the bswap correctly at t=
he</div>
<div>&gt;tail of the recursion, but then as we travel back up the stack we =
hit</div>
<div>&gt;memory_region_dispatch_{read,write} once again causing a second bs=
wap</div>
<div>&gt;which means the value is returned with the incorrect endian again.=
</div>
<div>&gt;</div>
<div>&gt;</div>
<div>&gt;My understanding from your softmmu_template.h comment above is tha=
t the</div>
<div>&gt;memory API should do the endian swapping internally allowing the r=
emoval</div>
<div>&gt;of the final TGT_BE/TGT_LE applied to the result, or did I get thi=
s wrong?</div>
<div>&gt;</div>
<div>&gt;&gt; (3) In tlb_set_page_with_attrs, notice attrs.byte_swap and se=
t</div>
<div>&gt;&gt; &nbsp; &nbsp; a new TLB_FORCE_SLOW bit within TLB_FLAGS_MASK.=
</div>
<div>&gt;&gt;</div>
<div>&gt;&gt; (4) In io_{read,write}x, if iotlbentry-&gt;attrs.byte_swap is=
 set,</div>
<div>&gt;&gt; &nbsp; &nbsp; then memop ^=3D MO_BSWAP.</div>
<div><br>
</div>
<div>Thanks all for the v1 and v2 feedback.</div>
<div><br>
</div>
<div>v2:</div>
<div>- Moved size&#43;sign&#43;endianness attributes from TCGMemOp into Mem=
Op.</div>
<div>&nbsp; In v1 TCGMemOp was re-purposed entirely into MemOp.</div>
<div>- Replaced MemOp MO_{8|16|32|64} with TCGMemOp MO_{UB|UW|UL|UQ} alias.=
</div>
<div>&nbsp; This is to avoid warnings on comparing and coercing different e=
nums.</div>
<div>- Renamed get_memop to get_tcgmemop for clarity.</div>
<div>- MEMOP is now SIZE_MEMOP, which is just ctzl(size).</div>
<div>- Split patch 3/4 so one memory_region_dispatch_{read|write} interface=
</div>
<div>&nbsp; is converted per patch.</div>
<div>- Do not reuse TLB_RECHECK, use new TLB_FORCE_SLOW instead.</div>
<div>- Split patch 4/4 so adding the MemTxAddrs parameters and converting</=
div>
<div>&nbsp; tlb_set_page() to tlb_set_page_with_attrs() is separate from us=
age.</div>
<div>- CC'd maintainers.</div>
<div><br>
</div>
<div>v3:</div>
<div>- Like v1, the entire TCGMemOp enum is now MemOp.</div>
<div>- MemOp target dependant attributes are&nbsp;conditional&nbsp;upon NEE=
D_CPU_H&nbsp;<br>
</div>
<div><br>
</div>
<div>Tony Nguyen (15):</div>
<div>&nbsp; tcg: TCGMemOp is now accelerator independent MemOp</div>
<div>&nbsp; memory: Access MemoryRegion with MemOp</div>
<div>&nbsp; target/mips: Access MemoryRegion with MemOp</div>
<div>&nbsp; hw/s390x: Access MemoryRegion with MemOp</div>
<div>&nbsp; hw/intc/armv7m_nic: Access MemoryRegion with MemOp</div>
<div>&nbsp; hw/virtio: Access MemoryRegion with MemOp</div>
<div>&nbsp; hw/vfio: Access MemoryRegion with MemOp</div>
<div>&nbsp; exec: Access MemoryRegion with MemOp</div>
<div>&nbsp; cputlb: Access MemoryRegion with MemOp</div>
<div>&nbsp; memory: Access MemoryRegion with MemOp semantics</div>
<div>&nbsp; memory: Single byte swap along the I/O path</div>
<div>&nbsp; cpu: TLB_FLAGS_MASK bit to force memory slow path</div>
<div>&nbsp; cputlb: Byte swap memory transaction attribute</div>
<div>&nbsp; target/sparc: Add TLB entry with attributes</div>
<div>&nbsp; target/sparc: sun4u Invert Endian TTE bit</div>
<div><br>
</div>
<div>&nbsp;accel/tcg/cputlb.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp;| &nbsp;71 &#43;&#43;&#43;&#43;&#43;&#43;&#4=
3;&#43;&#43;--------</div>
<div>&nbsp;exec.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| &nbsp; 6 &#4=
3;-</div>
<div>&nbsp;hw/intc/armv7m_nvic.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; | &nbsp;12 &#43;&#43;-</div>
<div>&nbsp;hw/s390x/s390-pci-inst.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;| &nbsp; 8 &#43;-</div>
<div>&nbsp;hw/vfio/pci-quirks.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;| &nbsp; 5 &#43;-</div>
<div>&nbsp;hw/virtio/virtio-pci.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;| &nbsp; 7 &#43;-</div>
<div>&nbsp;include/exec/cpu-all.h &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;| &nbsp;10 &#43;&#43;-</div>
<div>&nbsp;include/exec/memattrs.h &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; | &nbsp; 2 &#43;</div>
<div>&nbsp;include/exec/memop.h &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;| 112 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#4=
3;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#4=
3;&#43;&#43;&#43;</div>
<div>&nbsp;include/exec/memory.h &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; | &nbsp; 9 &#43;&#43;-</div>
<div>&nbsp;memory.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| &nbsp;37 &#43;&#4=
3;&#43;&#43;&#43;----</div>
<div>&nbsp;memory_ldst.inc.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; | &nbsp;18 &#43;&#43;---</div>
<div>&nbsp;target/alpha/translate.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;target/arm/translate-a64.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;| &nbsp;48 &#43;&#43;&#43;&#43;&#43;&#43;------</div>
<div>&nbsp;target/arm/translate-a64.h &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;target/arm/translate-sve.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;target/arm/translate.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;| &nbsp;32 &#43;&#43;&#43;&#43;----</div>
<div>&nbsp;target/arm/translate.h &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;target/hppa/translate.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; | &nbsp;14 &#43;&#43;--</div>
<div>&nbsp;target/i386/translate.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; | 132 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#4=
3;&#43;&#43;&#43;&#43;&#43;----------------</div>
<div>&nbsp;target/m68k/translate.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;target/microblaze/translate.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 | &nbsp; 4 &#43;-</div>
<div>&nbsp;target/mips/op_helper.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; | &nbsp; 5 &#43;-</div>
<div>&nbsp;target/mips/translate.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; | &nbsp; 8 &#43;-</div>
<div>&nbsp;target/openrisc/translate.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; | &nbsp; 4 &#43;-</div>
<div>&nbsp;target/ppc/translate.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;| &nbsp;12 &#43;--</div>
<div>&nbsp;target/riscv/insn_trans/trans_rva.inc.c | &nbsp; 8 &#43;-</div>
<div>&nbsp;target/riscv/insn_trans/trans_rvi.inc.c | &nbsp; 4 &#43;-</div>
<div>&nbsp;target/s390x/translate.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;| &nbsp; 6 &#43;-</div>
<div>&nbsp;target/s390x/translate_vx.inc.c &nbsp; &nbsp; &nbsp; &nbsp; | &n=
bsp;10 &#43;--</div>
<div>&nbsp;target/sparc/cpu.h &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp;| &nbsp; 2 &#43;</div>
<div>&nbsp;target/sparc/mmu_helper.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; | &nbsp;40 &#43;&#43;&#43;&#43;&#43;&#43;----</div>
<div>&nbsp;target/sparc/translate.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;| &nbsp;14 &#43;&#43;--</div>
<div>&nbsp;target/tilegx/translate.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; | &nbsp;10 &#43;--</div>
<div>&nbsp;target/tricore/translate.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;| &nbsp; 8 &#43;-</div>
<div>&nbsp;tcg/README &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;tcg/aarch64/tcg-target.inc.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;| &nbsp;26 &#43;&#43;&#43;----</div>
<div>&nbsp;tcg/arm/tcg-target.inc.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;| &nbsp;26 &#43;&#43;&#43;----</div>
<div>&nbsp;tcg/i386/tcg-target.inc.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; | &nbsp;24 &#43;&#43;&#43;---</div>
<div>&nbsp;tcg/mips/tcg-target.inc.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; | &nbsp;16 &#43;&#43;--</div>
<div>&nbsp;tcg/optimize.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;tcg/ppc/tcg-target.inc.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;| &nbsp;12 &#43;--</div>
<div>&nbsp;tcg/riscv/tcg-target.inc.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;| &nbsp;20 &#43;&#43;---</div>
<div>&nbsp;tcg/s390/tcg-target.inc.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; | &nbsp;14 &#43;&#43;--</div>
<div>&nbsp;tcg/sparc/tcg-target.inc.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;| &nbsp; 6 &#43;-</div>
<div>&nbsp;tcg/tcg-op.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| &nbsp;38 &#43;&#43;&#43;&#4=
3;-----</div>
<div>&nbsp;tcg/tcg-op.h &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| &nbsp;86 &#43;&#43;&#43;&#4=
3;&#43;&#43;&#43;&#43;&#43;&#43;-----------</div>
<div>&nbsp;tcg/tcg.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;tcg/tcg.h &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | &nbsp;99 &#43;&#43;---=
-------------------</div>
<div>&nbsp;trace/mem-internal.h &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;| &nbsp; 4 &#43;-</div>
<div>&nbsp;trace/mem.h &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | &nbsp; 4 &#43;-</div>
<div>&nbsp;51 files changed, 561 insertions(&#43;), 488 deletions(-)</div>
<div>&nbsp;create mode 100644 include/exec/memop.h</div>
<div><br>
</div>
<div>--&nbsp;</div>
<div>1.8.3.1</div>
<div><br>
<br>
</div>
<p><br>
</p>
</body>
</html>

--_000_156403807375491133btcom_--

