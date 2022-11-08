Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1osQ9F-00051v-GC
	for mharc-qemu-riscv@gnu.org; Tue, 08 Nov 2022 10:04:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1osQ92-0004vM-R0
 for qemu-riscv@nongnu.org; Tue, 08 Nov 2022 10:04:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1osQ90-0005R5-I9
 for qemu-riscv@nongnu.org; Tue, 08 Nov 2022 10:04:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667919845;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jxQOX9qI5Q816weuY2735uu256Gb8VOPiCr6mUMaQKY=;
 b=QH7TrWIHP1EKJgYIMQFjHmTwsvagP65Vdc0MHEvV9tIrRzzPf4PbbYKCm5JuujG1rEmJ8D
 pRUVdwlEphmM0JYzSOdlsgLIBd+Wxwc7lUN6ab4QNQMH+3rAVXyHNy71RFqADl51r1zpyf
 bc6glHHZ9q8qH1ZiNxE8eVVC1jsW1k8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-171-EtURvIGBM92myZ9me_qNLg-1; Tue, 08 Nov 2022 10:04:01 -0500
X-MC-Unique: EtURvIGBM92myZ9me_qNLg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1B640185A7A9;
 Tue,  8 Nov 2022 15:04:01 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.36])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E833640C2064;
 Tue,  8 Nov 2022 15:03:58 +0000 (UTC)
Date: Tue, 8 Nov 2022 15:03:56 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Andrew Jones <ajones@ventanamicro.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Sunil V L <sunilvl@ventanamicro.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, David Edmondson <david.edmondson@oracle.com>
Subject: Re: [PATCH V2] hw/riscv: virt: Remove size restriction for pflash
Message-ID: <Y2pv3M5voj2iLqTo@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20221107130217.2243815-1-sunilvl@ventanamicro.com>
 <CAFEAcA8X3Q7s6qZ=ojE9fTLG464rrZw+FX=4hmMOhwR-Q4n2sA@mail.gmail.com>
 <Y2kRWNnk7wDxPnBK@sunil-laptop> <871qqehib4.fsf@linaro.org>
 <Y2kv/k5oKGOd+90w@redhat.com>
 <20221107173201.343hkqqugkzdzqcf@kamzik>
 <Y2lBnPuUA4bgKCLL@redhat.com>
 <934d7560-daee-9f7e-2abb-640575768b2f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <934d7560-daee-9f7e-2abb-640575768b2f@linaro.org>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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
X-List-Received-Date: Tue, 08 Nov 2022 15:04:14 -0000

On Tue, Nov 08, 2022 at 03:12:42PM +0100, Philippe Mathieu-Daudé wrote:
> On 7/11/22 18:34, Daniel P. Berrangé wrote:
> > On Mon, Nov 07, 2022 at 06:32:01PM +0100, Andrew Jones wrote:
> > > On Mon, Nov 07, 2022 at 04:19:10PM +0000, Daniel P. Berrangé wrote:
> > > > On Mon, Nov 07, 2022 at 03:50:44PM +0000, Alex Bennée wrote:
> > > > > 
> > > > > Sunil V L <sunilvl@ventanamicro.com> writes:
> > > > > 
> > > > > > On Mon, Nov 07, 2022 at 01:06:38PM +0000, Peter Maydell wrote:
> > > > > > > On Mon, 7 Nov 2022 at 13:03, Sunil V L <sunilvl@ventanamicro.com> wrote:
> > > > > > > > 
> > > > > > > > The pflash implementation currently assumes fixed size of the
> > > > > > > > backend storage. Due to this, the backend storage file needs to be
> > > > > > > > exactly of size 32M. Otherwise, there will be an error like below.
> > > > > > > > 
> > > > > > > > "device requires 33554432 bytes, block backend provides 4194304 bytes"
> > > > > > > > 
> > > > > > > > Fix this issue by using the actual size of the backing store.
> > > > > > > > 
> > > > > > > > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > > > > > > > ---
> > > > > > > 
> > > > > > > Do you really want the flash device size presented to the guest
> > > > > > > to be variable depending on what the user passed as a block backend?
> > > > > > > I don't think this is how we handle flash devices on other boards...
> > > > > > > 
> > > > > > 
> > > > > > Hi Peter,
> > > > > > 
> > > > > > x86 appears to support variable flash but arm doesn't. What is
> > > > > > the reason for not supporting variable size flash in arm?
> > > > > 
> > > > > If I recall from the last time we went around this is was the question
> > > > > of what you should pad it with.
> > > > 
> > > > Padding is a very good thing from the POV of upgrades. Firmware has shown
> > > > a tendancy to change (grow) over time, and the size has an impact of the
> > > > guest ABI/live migration state.
> > > > 
> > > > To be able to live migrate, or save/restore to/from files, then the machine
> > > > firmware size needs to be sufficient to cope with future size changes of
> > > > the firmware. The best way to deal with this is to not use the firmware
> > > > binaries' minimum compiled size, but instead to pad it upto a higher
> > > > boundary.
> > > > 
> > > > Enforcing such padding is a decent way to prevent users from inadvertantly
> > > > painting themselves into a corner with a very specific firmware binary
> > > > size at initial boot.
> > > 
> > > Padding is a good idea, but too much causes other problems. When building
> > > lightweight VMs which may pull the firmware image from a network,
> > > AArch64 VMs require 64MB of mostly zeros to be transferred first, which
> > > can become a substantial amount of the overall boot time[*]. Being able to
> > > create images smaller than the total flash device size, but still add some
> > > pad for later growth, seems like the happy-medium to shoot for.
> > 
> > QEMU configures the firmware using -blockdev, so can use any file
> > format that QEMU supports at the block layer.  IOW, you can store
> > the firmware in a qcow2 file and thus you will never fetch any
> > of the padding zeros to be transferred.  That said I'm not sure
> > that libvirt supports anything other than a raw file today.
> 
> Drew might be referring to:
> 
> https://lore.kernel.org/qemu-devel/20210810134050.396747-1-david.edmondson@oracle.com/
> 
>  > Currently ARM UEFI images are typically built as 2MB/768kB flash
>  > images for code and variables respectively. These images are both
>  > then padded out to 64MB before being loaded by QEMU.
>  >
>  > Because the images are 64MB each, QEMU allocates 128MB of memory to
>  > read them, and then proceeds to read all 128MB from disk (dirtying
>  > the memory). Of this 128MB less than 3MB is useful - the rest is
>  > zero padding.
>  >
>  > On a machine with 100 VMs this wastes over 12GB of memory.
> 
> See previous attempts:
> - Huawei
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg607292.html
> - Tencent
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg742066.html
> - Oracle
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg760065.html
> - Red Hat
> https://www.mail-archive.com/qemu-block@nongnu.org/msg81714.html

I've not looked at the patch series above in detail, but I'm thinking
that even if the file is 64 MB in size, it should never read all 64 MB
of data. The block layer APIs have ability to detect and report holes,
so it ought to be possible to only read the data which is non-zero,
and thus avoid dirtying more than 3 MB of useful

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


