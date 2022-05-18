Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nrF0R-0004pU-Ie
	for mharc-qemu-riscv@gnu.org; Wed, 18 May 2022 04:26:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nrF0L-0004nI-Tz
 for qemu-riscv@nongnu.org; Wed, 18 May 2022 04:26:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nrF0F-000716-6A
 for qemu-riscv@nongnu.org; Wed, 18 May 2022 04:26:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652862354;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SZ0DCdN63BZ7gPYYeIxsbUTXjFdor4Hd0+VM8dJBrWA=;
 b=LmMNTbacjELWRkNLekdJm6KLBdNtzayKvsOhl1jZ0GlMoB/4XugTb75oILeR5LjgTAOiR/
 sdatAk95W3UYhB4TEza6E+XAm8Cp6zPM6kjHvgghL3QPlgNyebW8p8Jl7oMNKaLyRPFheb
 Hvx8jK35prjMZPThPZC5XPzuYRcRRyw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-668-bNcyKgbfP2Wuu4ByYu5VZA-1; Wed, 18 May 2022 04:25:51 -0400
X-MC-Unique: bNcyKgbfP2Wuu4ByYu5VZA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 176F1934FE0;
 Wed, 18 May 2022 08:25:51 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.166])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0376240C1421;
 Wed, 18 May 2022 08:25:47 +0000 (UTC)
Date: Wed, 18 May 2022 09:25:45 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Atish Patra <atishp@atishpatra.org>
Cc: Alistair Francis <alistair23@gmail.com>,
 Atish Kumar Patra <atishp@rivosinc.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [RFC 0/3] Introduce a new Qemu machine for RISC-V
Message-ID: <YoStifZ0sCQkjyik@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <CAKmqyKPy=abr_m_YSA2v-rVN8TdnsFX8uzUOpp0BpJkGj9yXMQ@mail.gmail.com>
 <YnOhHZGJphk30SmJ@redhat.com>
 <CAKmqyKMKxb81ZSpz-ncGc3fpt8f06EcEcXvtHjEpWLABXGT+uQ@mail.gmail.com>
 <YnTZP1iG+77Cugaq@redhat.com>
 <CAFEAcA_MncAJWUqG3yRVGMT0mXKvnBUqJLdoHwMdd=OW8fnodQ@mail.gmail.com>
 <CAHBxVyH=7hX5mjWcUBODk_tNHoczefdkfS8dFcf6is=vpz=SZw@mail.gmail.com>
 <CAKmqyKPK_F7Z4-tM9k8+3yXDdSTSFagieH23vqoW+TciXpnYqA@mail.gmail.com>
 <YoNiPw/3e+CY0v7o@redhat.com>
 <CAKmqyKOC0Fgu7WUXRcAJZNmVR8GeiXHGh4K8fg+5_c+pvZR_7w@mail.gmail.com>
 <CAOnJCU+i3m5OjM-wBf+t58YP9k5Jd0VeBK_yoPSPtzoE68H2EQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOnJCU+i3m5OjM-wBf+t58YP9k5Jd0VeBK_yoPSPtzoE68H2EQ@mail.gmail.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 18 May 2022 08:26:05 -0000

On Tue, May 17, 2022 at 11:38:39PM -0700, Atish Patra wrote:
> On Tue, May 17, 2022 at 1:54 PM Alistair Francis <alistair23@gmail.com> wrote:
> >
> > On Tue, May 17, 2022 at 6:52 PM Daniel P. Berrangé <berrange@redhat.com> wrote:
> > >
> > > On Tue, May 17, 2022 at 03:03:38PM +1000, Alistair Francis wrote:
> > > > On Sat, May 7, 2022 at 6:30 AM Atish Kumar Patra <atishp@rivosinc.com> wrote:
> > > > >
> > > > > On Fri, May 6, 2022 at 4:00 AM Peter Maydell <peter.maydell@linaro.org> wrote:
> > > > > >
> > > > > > On Fri, 6 May 2022 at 09:18, Daniel P. Berrangé <berrange@redhat.com> wrote:
> > > > > > >
> > > > > > > On Fri, May 06, 2022 at 06:34:47AM +1000, Alistair Francis wrote:
> > > > > > > > Even if we didn't worry about backwards compatibility the current virt
> > > > > > > > machine would still be what most users want. It's just a small number
> > > > > > > > of users who don't want MMIO devices and instead want to use PCIe for
> > > > > > > > everything. Realistically it's only HPC users who would want this type
> > > > > > > > of machine, at least that's my understanding.
> > > > > > >
> > > > > > > I'm not so sure about that. Every other architecture has ended up
> > > > > > > standardizing on PCI for general purpose virtual machines. IIRC,
> > > > > > > aarch64 started off with MMIO, but switched to PCI as it matured.
> > > > > > >
> > > > > > > In terms of having VM mgmt tools "just work" for risc-v, I think
> > > > > > > it will be very compelling for the general 'virt' machine to be
> > > > > > > PCI based, otherwise all the assumptions about PCI in mgmt apps
> > > > > > > are going to break requiring never ending riscv fixes.
> > > > > >
> > > > > > Mmm, my experience with aarch64 virt is that PCI is much nicer
> > > > > > as a general preference. aarch64 virt has some MMIO devices
> > > > > > for historical reasons and some because you can't reasonably
> > > > > > do the necessary things with PCI, but I'm actively trying to
> > > > > > push people who submit new MMIO device features for virt to
> > > > > > try to use a PCI-based solution instead if they possibly can.
> > > >
> > > > Interesting...
> > > >
> > > > Ok, maybe calling this "virt-pcie" might be a good start, with the
> > > > expectation to eventually replace the current virt with the new
> > > > virt-pcie at some point.
> > >
> > > Delaying the inevitable by leaving PCIE support in a separate
> > > machine type initially is going to be more painful long term.
> > >
> > > > The other option would be to try and gradually change from the current
> > > > virt machine to this new virt machine
> > >
> > > Yes, I really think the 'virt' machine type needs to aim for PCIE
> > > support sooner rather than later, if RISC-V wants to get on part
> > > with other architectures. The best time to have added PCIE support
> > > to 'virt' was when it was first created, the next best time is now.
> >
> > So maybe instead we lock in the current virt machine as the 7.1 virt
> > machine for QEMU 7.1, then work on migrating to a PCIe only machine
> > with versions (similar to the other archs)
> >
> 
> I am not quite sure what exactly you mean here. Do you mean to modify
> the current virt
> machine to be PCIE only after QEMU 7.1 or the new PCIE only machine
> (with the versioning)
> which will be the default machine in the future
> 
> If you intend to say the former, few issues with that approach.
> 
> 1. virt machine is not well documented and already bloated. There is
> no specification for virt machine as such.
> Putting restrictions after a certain release will lead to confusion.
> 2. Do we support existing MMIO devices after that specific version or not ?
> 3. The user has to be aware of which version of virt machine it is
> running in order to test specific features (i.e. flash, reset, wired
> interrupts)
> 4. Based on the version of the virt machine, the command line options
> will change. This may also be confusing.
> 
> On the other hand, the second approach will be much cleaner without
> any baggage. The RISC-V eco-system is still maturing and this is the
> right time
> to start something fresh. Let's call the new machine virt-pcie for
> now. Here are a few things that can be implemented for this machine.

The fact that RISC-V ecosystem is so young & has relatively few
users, and even fewer expecting  long term stability, is precisely
why we should just modify the existing 'virt' machine now rather
than introducing a new 'virt-pcie'. We can afford to have the
limited incompatibility in the short term given the small userbase.
We went through this same exercise with aarch64 virt machine and
despite the short term disruption, it was a good success IMHO to
get it switched from MMIO to PCI, instead of having two machines
in parallel long term.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


