Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1osnH6-0007CV-C4
	for mharc-qemu-riscv@gnu.org; Wed, 09 Nov 2022 10:46:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1osnGk-0004q3-49
 for qemu-riscv@nongnu.org; Wed, 09 Nov 2022 10:45:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1osnGf-0002Jg-Mk
 for qemu-riscv@nongnu.org; Wed, 09 Nov 2022 10:45:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668008729;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JH9aYRRznTn4kzoDiVa5UoS9HBvWBVF2BNGjiMEWqBI=;
 b=hPhkMaZr2xpzvJ3l9iou0sKpPGtoyps8cTnZ06HANCd/l7mUwcXWPbeeGOAC4BS9G9UNfP
 EJzckYxmM/MO3ztPagyPFcl0z24e47GC2HGFGvFYVwdBhtcwnNYuIK4Ft8nLCNDM072/cl
 1EZKR9qqy0qPg8cAAyFQh5wNh+rVL1Y=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-568-AAOckC7vMUyjOjiKvxP6_w-1; Wed, 09 Nov 2022 10:45:23 -0500
X-MC-Unique: AAOckC7vMUyjOjiKvxP6_w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3698D101A52A;
 Wed,  9 Nov 2022 15:45:23 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 10EAA40C2086;
 Wed,  9 Nov 2022 15:45:22 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id AB81921E6921; Wed,  9 Nov 2022 16:45:18 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,  Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>,  Sunil V L <sunilvl@ventanamicro.com>,  Peter
 Maydell <peter.maydell@linaro.org>,  Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,  Bin Meng
 <bin.meng@windriver.com>,  Gerd Hoffmann <kraxel@redhat.com>,
 qemu-riscv@nongnu.org,  qemu-devel@nongnu.org
Subject: Re: [PATCH V2] hw/riscv: virt: Remove size restriction for pflash
References: <20221107130217.2243815-1-sunilvl@ventanamicro.com>
 <CAFEAcA8X3Q7s6qZ=ojE9fTLG464rrZw+FX=4hmMOhwR-Q4n2sA@mail.gmail.com>
 <Y2kRWNnk7wDxPnBK@sunil-laptop> <871qqehib4.fsf@linaro.org>
 <Y2kv/k5oKGOd+90w@redhat.com> <20221107173201.343hkqqugkzdzqcf@kamzik>
 <Y2lBnPuUA4bgKCLL@redhat.com> <87y1skkv2a.fsf@pond.sub.org>
 <Y2vHmFtfxZBDnFNk@redhat.com>
Date: Wed, 09 Nov 2022 16:45:18 +0100
In-Reply-To: <Y2vHmFtfxZBDnFNk@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Wed, 9 Nov 2022 15:30:32 +0000")
Message-ID: <878rkkku7l.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 09 Nov 2022 15:45:59 -0000

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Wed, Nov 09, 2022 at 04:26:53PM +0100, Markus Armbruster wrote:
>> Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:
>>=20
>> > On Mon, Nov 07, 2022 at 06:32:01PM +0100, Andrew Jones wrote:
>>=20
>> [...]
>>=20
>> >> Padding is a good idea, but too much causes other problems. When buil=
ding
>> >> lightweight VMs which may pull the firmware image from a network,
>> >> AArch64 VMs require 64MB of mostly zeros to be transferred first, whi=
ch
>> >> can become a substantial amount of the overall boot time[*]. Being ab=
le to
>> >> create images smaller than the total flash device size, but still add=
 some
>> >> pad for later growth, seems like the happy-medium to shoot for.
>> >
>> > QEMU configures the firmware using -blockdev,
>>=20
>> Yes, even though the devices in question are not block devices.
>>=20
>> >                                               so can use any file
>> > format that QEMU supports at the block layer.  IOW, you can store
>> > the firmware in a qcow2 file and thus you will never fetch any
>> > of the padding zeros to be transferred.  That said I'm not sure
>> > that libvirt supports anything other than a raw file today.=20
>>=20
>> Here's another idea.  The "raw" format supports exposing a slice of the
>> underlying block node (options @offset and @size).  It could support
>> padding.  Writing to the padding should then grow the underlying node.
>>=20
>> Taking a step back to look at the bigger picture...  there are three
>> issues, I think:
>>=20
>> (A) Storing padding on disk is wasteful.
>>=20
>>     Use a file system that supports sparse files, or an image format
>>     that can represent the padding efficiently.
>>=20
>> (B) Reading padding into memory is wasteful.
>>=20
>>     Matters mostly when a network is involved.  Use an image format that
>>     can represent the padding efficiently.
>>=20
>> (C) Dirtying memory for padding is wasteful.
>>=20
>>     I figure KSM could turn zero-padding into holes.
>>=20
>>     We could play with mmap() & friends.
>>=20
>>     Other ideas?
>
> Is (C) actually a separate issue ?  I thought it was simply the
> result of (B) ?  ie if we skip reading the zero padding, we won't
> be dirtying the memory with lots of zeros. we'll have mmap'd the
> full 64 MB, but most won't be paged in since we wouldn't write
> the zeros to it. Only if the guest writes to those areas do we
> need to then flush it back out.

I expressed myself poorly.  All three are related, but there's still a
distinction between each of them in my thinking.

Say we use an image format that compresses data.  Represents the padding
efficiently.  Storage on disk is efficient (A), and so is reading it
(B).  Trouble is decompressing it to memory dirties the memory unless we
take care not to write all-zero pages (C).

Clearer now?


