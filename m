Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iFaf2-0006Tj-E8
	for mharc-qemu-riscv@gnu.org; Wed, 02 Oct 2019 05:11:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43603)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1iFaf0-0006S3-6J
 for qemu-riscv@nongnu.org; Wed, 02 Oct 2019 05:11:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1iFaey-00010Q-Kr
 for qemu-riscv@nongnu.org; Wed, 02 Oct 2019 05:11:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48742)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>)
 id 1iFaek-0000ks-04; Wed, 02 Oct 2019 05:10:46 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E8A388F4E1;
 Wed,  2 Oct 2019 09:10:41 +0000 (UTC)
Received: from redhat.com (unknown [10.42.17.55])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CD3175D9D3;
 Wed,  2 Oct 2019 09:10:39 +0000 (UTC)
Date: Wed, 2 Oct 2019 10:10:37 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "qemu-discuss@nongnu.org" <qemu-discuss@nongnu.org>,
 qemu-s390x <qemu-s390x@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 qemu-ppc <qemu-ppc@nongnu.org>, "open list:RISC-V" <qemu-riscv@nongnu.org>
Subject: Re: [RFC PATCH] configure: deprecate 32 bit build hosts
Message-ID: <20191002091037.GB607@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20190925233013.6449-1-alex.bennee@linaro.org>
 <CAFEAcA9vb5_Mi_axWpu7269Zg0xMLbiiV80ofLeyDpfws3G4nQ@mail.gmail.com>
 <4512b61a-ed82-e628-88e5-f44ef87c2b50@linaro.org>
 <20190930092519.GB11996@redhat.com> <87impakrky.fsf@linaro.org>
 <CAFEAcA8_Zt+4RuXh8ww3Xm5=fQT+e_XcjZ6VC2N9k5mzLy0bnw@mail.gmail.com>
 <ddf455e3-742e-81ce-c51a-d783e8d2ad55@ilande.co.uk>
 <58da7aa4-877b-2c85-71f5-e703a841e6d4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <58da7aa4-877b-2c85-71f5-e703a841e6d4@linaro.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Wed, 02 Oct 2019 09:10:42 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
X-List-Received-Date: Wed, 02 Oct 2019 09:11:03 -0000

On Tue, Oct 01, 2019 at 11:02:14AM -0700, Richard Henderson wrote:
> On 10/1/19 10:56 AM, Mark Cave-Ayland wrote:
> > Just out of interest, which host/compiler combinations don't currently implement
> > int128_t?
> 
> GCC only implements int128_t for 64-bit targets.

QEMU probes for that during configure  and sets CONFIG_INT128

If I'm reading correctly include/qemu/int128.h then provides a
fallback type based on a struct with two int64s.

This has some inconvenience though as you have to use the the (inline)
function calls for all the basic operands and will be less efficient
when using the fallback.

Presumably this is not viable for TCG ?

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

