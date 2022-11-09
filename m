Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1osmyu-0004Ji-3x
	for mharc-qemu-riscv@gnu.org; Wed, 09 Nov 2022 10:27:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1osmys-0004AW-MX
 for qemu-riscv@nongnu.org; Wed, 09 Nov 2022 10:27:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1osmyn-00070D-Mb
 for qemu-riscv@nongnu.org; Wed, 09 Nov 2022 10:27:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668007623;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rwqBaj99ui/gUwlHjxV/4pkbk5Oi/YI0YZmoPqu163Y=;
 b=MR1f9g8Gbp374YbvPsvxygJPAeMdzJVoFDaC6jKL4tSPFcBe+pWbncnWPBaQQL+1lDc3aL
 EhEjabXjN/pGPLCiUxT57DiP/zNaVT1/l23QWseAd2Va1u/PAFsGnH/B/sYlA8K6Vn5C8d
 9vXCKBMB1TeeymNsOv+67I6W1aCES3o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-3EcaFopoM_27geS5k1Y5kw-1; Wed, 09 Nov 2022 10:27:00 -0500
X-MC-Unique: 3EcaFopoM_27geS5k1Y5kw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EB9FD101A528;
 Wed,  9 Nov 2022 15:26:59 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AC902C1908A;
 Wed,  9 Nov 2022 15:26:58 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 67F3A21E6921; Wed,  9 Nov 2022 16:26:53 +0100 (CET)
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
 <Y2lBnPuUA4bgKCLL@redhat.com>
Date: Wed, 09 Nov 2022 16:26:53 +0100
In-Reply-To: <Y2lBnPuUA4bgKCLL@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Mon, 7 Nov 2022 17:34:20 +0000")
Message-ID: <87y1skkv2a.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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
X-List-Received-Date: Wed, 09 Nov 2022 15:27:11 -0000

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Mon, Nov 07, 2022 at 06:32:01PM +0100, Andrew Jones wrote:

[...]

>> Padding is a good idea, but too much causes other problems. When building
>> lightweight VMs which may pull the firmware image from a network,
>> AArch64 VMs require 64MB of mostly zeros to be transferred first, which
>> can become a substantial amount of the overall boot time[*]. Being able =
to
>> create images smaller than the total flash device size, but still add so=
me
>> pad for later growth, seems like the happy-medium to shoot for.
>
> QEMU configures the firmware using -blockdev,

Yes, even though the devices in question are not block devices.

>                                               so can use any file
> format that QEMU supports at the block layer.  IOW, you can store
> the firmware in a qcow2 file and thus you will never fetch any
> of the padding zeros to be transferred.  That said I'm not sure
> that libvirt supports anything other than a raw file today.=20

Here's another idea.  The "raw" format supports exposing a slice of the
underlying block node (options @offset and @size).  It could support
padding.  Writing to the padding should then grow the underlying node.

Taking a step back to look at the bigger picture...  there are three
issues, I think:

(A) Storing padding on disk is wasteful.

    Use a file system that supports sparse files, or an image format
    that can represent the padding efficiently.

(B) Reading padding into memory is wasteful.

    Matters mostly when a network is involved.  Use an image format that
    can represent the padding efficiently.

(C) Dirtying memory for padding is wasteful.

    I figure KSM could turn zero-padding into holes.

    We could play with mmap() & friends.

    Other ideas?

Any solution needs to work both for read-only and read/write padding.
Throwing away data written to the padding on cold restart is not what
I'd regard as "works".


