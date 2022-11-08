Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1osR2V-0005Z3-M9
	for mharc-qemu-riscv@gnu.org; Tue, 08 Nov 2022 11:01:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1osR2R-0005XM-7R
 for qemu-riscv@nongnu.org; Tue, 08 Nov 2022 11:01:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1osR2P-00009x-5f
 for qemu-riscv@nongnu.org; Tue, 08 Nov 2022 11:01:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667923279;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=en6scsxl1Eh3dQCJGQHarbFsO16HbysKIN+t5ajiUSQ=;
 b=SQtPK1IJimW870LrfMEfk6EUmu6LryGtJpqT/Hxyev3IVP/wDRLLcco/GKKdVw0X253G97
 eGs6BvaU75AV2bj6ucegbAYaZfvJv/tSTkq8aX8Qvv6jMKebnaLiVxyIoKb7hOYOdYRBfu
 0JUr5QEmmvW9QmV0oWwmLpI+cqNtChA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-0UuHnuniM5KlnDMTNsVNJg-1; Tue, 08 Nov 2022 11:01:14 -0500
X-MC-Unique: 0UuHnuniM5KlnDMTNsVNJg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 867613C1E730;
 Tue,  8 Nov 2022 16:01:13 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BD3ECC15BB5;
 Tue,  8 Nov 2022 16:01:11 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 144A821E6921; Tue,  8 Nov 2022 17:01:08 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Sunil V L <sunilvl@ventanamicro.com>,  Palmer Dabbelt
 <palmer@dabbelt.com>,  Alistair Francis <alistair.francis@wdc.com>,  Bin
 Meng <bin.meng@windriver.com>,  Gerd Hoffmann <kraxel@redhat.com>,
 qemu-riscv@nongnu.org,  qemu-devel@nongnu.org
Subject: Re: [PATCH V2] hw/riscv: virt: Remove size restriction for pflash
References: <20221107130217.2243815-1-sunilvl@ventanamicro.com>
 <CAFEAcA8X3Q7s6qZ=ojE9fTLG464rrZw+FX=4hmMOhwR-Q4n2sA@mail.gmail.com>
 <Y2kRWNnk7wDxPnBK@sunil-laptop>
 <CAFEAcA-121P8gwOHRsbp4swP9ah1CZO8rVP75+WyvgF1pou8Aw@mail.gmail.com>
Date: Tue, 08 Nov 2022 17:01:08 +0100
In-Reply-To: <CAFEAcA-121P8gwOHRsbp4swP9ah1CZO8rVP75+WyvgF1pou8Aw@mail.gmail.com>
 (Peter Maydell's message of "Mon, 7 Nov 2022 16:08:27 +0000")
Message-ID: <87tu395tbv.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 08 Nov 2022 16:01:23 -0000

Peter Maydell <peter.maydell@linaro.org> writes:

> On Mon, 7 Nov 2022 at 14:08, Sunil V L <sunilvl@ventanamicro.com> wrote:
>>
>> On Mon, Nov 07, 2022 at 01:06:38PM +0000, Peter Maydell wrote:
>> > On Mon, 7 Nov 2022 at 13:03, Sunil V L <sunilvl@ventanamicro.com> wrote:
>> > >
>> > > The pflash implementation currently assumes fixed size of the
>> > > backend storage. Due to this, the backend storage file needs to be
>> > > exactly of size 32M. Otherwise, there will be an error like below.
>> > >
>> > > "device requires 33554432 bytes, block backend provides 4194304 bytes"
>> > >
>> > > Fix this issue by using the actual size of the backing store.
>> > >
>> > > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
>> > > ---
>> >
>> > Do you really want the flash device size presented to the guest
>> > to be variable depending on what the user passed as a block backend?
>> > I don't think this is how we handle flash devices on other boards...
>> >
>
>> x86 appears to support variable flash but arm doesn't. What is
>> the reason for not supporting variable size flash in arm?
>
> Mostly, that that's the straightforward thing to code.
> Partly, that it avoids weird cases (eg you can have a backing
> file that's an odd number of bytes but you can't have a
> flash that size).
>
> If x86 has a standard way of handling this then I'm all
> in favour of being consistent across platforms. What's
> the x86 board doing there?

I'm hardly the expert here, but I messed with it at some time... I guess
I can try to answer.

It's complicated.  More often than not, long development history + need
for backward compatibility = complicated.  Which makes it (in my
opinion) not a useful example to follow.

We use either ROM or flash device(s) to hold the BIOS.

The flash option exists since v1.1.

The user interface for picking one or the other, and configure contents
has a long and complicated history.  I'll spare you the details.

ROM contents comes from an image file.  Configurable with -bios.
Default depends on the machine type.

ROM size is the image file size.  It's mapped so it ends right before
address 2^32.

It's mapped a second time so it ends right before 2^20.  If the image
file is larger than 128KiB, only the last 128KiB are mapped there.

Flash contents comes from a block backend.  Configurable with machine
properties "pflash0" and "pflash1" (or legacy -drive if=pflash).  There
is no default.  If you don't configure flash contents, you get ROM
instead.

Flash device size is the block backend size.  Must be a multiple of
4KiB.

If "pflash0" is configured, we create a flash device so it ends right
before address 2^32.  If "pflash1" is also configured, we create a
second flash device so it ends right before the first one (no gap).
Combined size must not exceed a limit that depends on the machine type.

Aside: why two flash devices?  A physical machine has just one...  Well,
we need a read-only part for the code, and a read-write part for
persistent configuration ("varstore" in UEFI parlance).  Physical flash
devices let you write-protect partially, but our device models don't
implement that, it's all or nothing.  So we use two.  Kludge.

Again, there's a second mapping that ends right before 2^20, limited to
128KiB.


In my opinion, setting flash or ROM size to the size of the block
backend or image file is a bad idea.  It tangles up configuration of
frontend and backend.  We used to do this a lot (e.g. -drive).
Untangling (e.g. -device and -blockdev) was a lot of work.  With the
tangle kept around for compatibility.

Doug McIlroy's quip applies: "KISS became MICAHI: make it complicated
and hide it."

A physical machine has a fixed flash memory size.

A virtual machine models a physical machine.  It has a fixed flash
memory size, too.

If we want a machine type to model multiple variations of a physical
machine, say multiple flash sizes, the configuration knob really belongs
to the machine type.  Hiding it somewhere on the file system instead is
a bad idea.


