Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nqswc-0001Sp-N2
	for mharc-qemu-riscv@gnu.org; Tue, 17 May 2022 04:52:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nqswT-0001SC-UV
 for qemu-riscv@nongnu.org; Tue, 17 May 2022 04:52:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nqswQ-0006AW-3z
 for qemu-riscv@nongnu.org; Tue, 17 May 2022 04:52:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652777544;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m9F5xLc60hhWhwq5kwE7Ef6WJP4Y+K7WeLiEjnbb3tI=;
 b=BuvR4/2BqSHK7QLXq3MjK9jymzbNJU2ySp7agBK+2Au2GnWB/0RmaVugcJcwYTFodMQdcT
 q/g3gc+7ZPZLa7tIstWB0YQnB17tAEcQqU0UpCvc32ADAa69tcxakIt2Sk88nAko7QLzTl
 wX3H9znLJthvfPplsp2PoZmGDOH7G9A=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-618-_BhGJs3VM-m16S84P9Wz5A-1; Tue, 17 May 2022 04:52:21 -0400
X-MC-Unique: _BhGJs3VM-m16S84P9Wz5A-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A8102299E755;
 Tue, 17 May 2022 08:52:20 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.190])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C7995742E7;
 Tue, 17 May 2022 08:52:18 +0000 (UTC)
Date: Tue, 17 May 2022 09:52:15 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: Atish Kumar Patra <atishp@rivosinc.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Atish Patra <atishp@atishpatra.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [RFC 0/3] Introduce a new Qemu machine for RISC-V
Message-ID: <YoNiPw/3e+CY0v7o@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <Yl7oiF7kUrIQ0qk5@redhat.com>
 <CAOnJCUJWX5wPXVNbgNirNgBhi-w39RgqFZMJgvZKTMGhrdLtFw@mail.gmail.com>
 <CAOnJCUK9_qzOLr3GVdFTP95rs3avNE=7E2R27dADkMMsOhnGEQ@mail.gmail.com>
 <CAKmqyKPy=abr_m_YSA2v-rVN8TdnsFX8uzUOpp0BpJkGj9yXMQ@mail.gmail.com>
 <YnOhHZGJphk30SmJ@redhat.com>
 <CAKmqyKMKxb81ZSpz-ncGc3fpt8f06EcEcXvtHjEpWLABXGT+uQ@mail.gmail.com>
 <YnTZP1iG+77Cugaq@redhat.com>
 <CAFEAcA_MncAJWUqG3yRVGMT0mXKvnBUqJLdoHwMdd=OW8fnodQ@mail.gmail.com>
 <CAHBxVyH=7hX5mjWcUBODk_tNHoczefdkfS8dFcf6is=vpz=SZw@mail.gmail.com>
 <CAKmqyKPK_F7Z4-tM9k8+3yXDdSTSFagieH23vqoW+TciXpnYqA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKmqyKPK_F7Z4-tM9k8+3yXDdSTSFagieH23vqoW+TciXpnYqA@mail.gmail.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Tue, 17 May 2022 08:52:34 -0000

On Tue, May 17, 2022 at 03:03:38PM +1000, Alistair Francis wrote:
> On Sat, May 7, 2022 at 6:30 AM Atish Kumar Patra <atishp@rivosinc.com> wrote:
> >
> > On Fri, May 6, 2022 at 4:00 AM Peter Maydell <peter.maydell@linaro.org> wrote:
> > >
> > > On Fri, 6 May 2022 at 09:18, Daniel P. Berrangé <berrange@redhat.com> wrote:
> > > >
> > > > On Fri, May 06, 2022 at 06:34:47AM +1000, Alistair Francis wrote:
> > > > > Even if we didn't worry about backwards compatibility the current virt
> > > > > machine would still be what most users want. It's just a small number
> > > > > of users who don't want MMIO devices and instead want to use PCIe for
> > > > > everything. Realistically it's only HPC users who would want this type
> > > > > of machine, at least that's my understanding.
> > > >
> > > > I'm not so sure about that. Every other architecture has ended up
> > > > standardizing on PCI for general purpose virtual machines. IIRC,
> > > > aarch64 started off with MMIO, but switched to PCI as it matured.
> > > >
> > > > In terms of having VM mgmt tools "just work" for risc-v, I think
> > > > it will be very compelling for the general 'virt' machine to be
> > > > PCI based, otherwise all the assumptions about PCI in mgmt apps
> > > > are going to break requiring never ending riscv fixes.
> > >
> > > Mmm, my experience with aarch64 virt is that PCI is much nicer
> > > as a general preference. aarch64 virt has some MMIO devices
> > > for historical reasons and some because you can't reasonably
> > > do the necessary things with PCI, but I'm actively trying to
> > > push people who submit new MMIO device features for virt to
> > > try to use a PCI-based solution instead if they possibly can.
> 
> Interesting...
> 
> Ok, maybe calling this "virt-pcie" might be a good start, with the
> expectation to eventually replace the current virt with the new
> virt-pcie at some point.

Delaying the inevitable by leaving PCIE support in a separate
machine type initially is going to be more painful long term.

> The other option would be to try and gradually change from the current
> virt machine to this new virt machine

Yes, I really think the 'virt' machine type needs to aim for PCIE
support sooner rather than later, if RISC-V wants to get on part
with other architectures. The best time to have added PCIE support
to 'virt' was when it was first created, the next best time is now.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


