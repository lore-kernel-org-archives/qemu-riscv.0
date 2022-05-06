Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nmt8i-0001I4-Mk
	for mharc-qemu-riscv@gnu.org; Fri, 06 May 2022 04:16:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nmt8c-0001Gc-EC
 for qemu-riscv@nongnu.org; Fri, 06 May 2022 04:16:37 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.129.74]:47409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nmt8Y-0007ZG-Vw
 for qemu-riscv@nongnu.org; Fri, 06 May 2022 04:16:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651824989;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hQgwneD91Qayr3wEyJIH1zExFbkD7Nv1J+fjDuwpCL8=;
 b=ZdhegWKZUuNdr4veNPTwSxmhlVr5T0wwJio9Opo3WADW5TIkJoj2DEjGnuLS9vy903wVT9
 8/AVsXxFPXGKYnh6BTn+UwSVCePj8i5ABVFl7ucMmZAxzr9+ZN/Pkgvesu4hNASml+Q5mC
 e0I8wfkH6zvYsQiTiPmLUtK9I5e3PAg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-517-aIRs4HorOwG4lBV896D2og-1; Fri, 06 May 2022 04:16:26 -0400
X-MC-Unique: aIRs4HorOwG4lBV896D2og-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EB2F4801210;
 Fri,  6 May 2022 08:16:25 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.203])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 02C3BC1D3AD;
 Fri,  6 May 2022 08:16:23 +0000 (UTC)
Date: Fri, 6 May 2022 09:16:21 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: Atish Patra <atishp@atishpatra.org>, Atish Patra <atishp@rivosinc.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [RFC 0/3] Introduce a new Qemu machine for RISC-V
Message-ID: <YnTZP1iG+77Cugaq@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20220412021009.582424-1-atishp@rivosinc.com>
 <Yl7oiF7kUrIQ0qk5@redhat.com>
 <CAOnJCUJWX5wPXVNbgNirNgBhi-w39RgqFZMJgvZKTMGhrdLtFw@mail.gmail.com>
 <CAOnJCUK9_qzOLr3GVdFTP95rs3avNE=7E2R27dADkMMsOhnGEQ@mail.gmail.com>
 <CAKmqyKPy=abr_m_YSA2v-rVN8TdnsFX8uzUOpp0BpJkGj9yXMQ@mail.gmail.com>
 <YnOhHZGJphk30SmJ@redhat.com>
 <CAKmqyKMKxb81ZSpz-ncGc3fpt8f06EcEcXvtHjEpWLABXGT+uQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKmqyKMKxb81ZSpz-ncGc3fpt8f06EcEcXvtHjEpWLABXGT+uQ@mail.gmail.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.74; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
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
X-List-Received-Date: Fri, 06 May 2022 08:16:38 -0000

On Fri, May 06, 2022 at 06:34:47AM +1000, Alistair Francis wrote:
> On Thu, May 5, 2022 at 8:04 PM Daniel P. Berrangé <berrange@redhat.com> wrote:
> >
> > On Thu, May 05, 2022 at 07:36:51PM +1000, Alistair Francis wrote:
> > > On Tue, May 3, 2022 at 5:57 PM Atish Patra <atishp@atishpatra.org> wrote:
> > > >
> > > > On Tue, Apr 19, 2022 at 5:26 PM Atish Patra <atishp@atishpatra.org> wrote:
> > > > >
> > > > > On Tue, Apr 19, 2022 at 9:51 AM Daniel P. Berrangé <berrange@redhat.com> wrote:
> > > > > >
> > > > > > On Mon, Apr 11, 2022 at 07:10:06PM -0700, Atish Patra wrote:
> > > > > > >
> > > > > > > The RISC-V virt machine has helped RISC-V software eco system to evolve at a
> > > > > > > rapid pace even in absense of the real hardware. It is definitely commendable.
> > > > > > > However, the number of devices & commandline options keeps growing as a result
> > > > > > > of that as well. That adds flexibility but will also become bit difficult
> > > > > > > to manage in the future as more extension support will be added. As it is the
> > > > > > > most commonly used qemu machine, it needs to support all kinds of device and
> > > > > > > interrupts as well. Moreover, virt machine has limitations on the maximum
> > > > > > > number of harts it can support because of all the MMIO devices it has to support.
> > > > > > >
> > > > > > > The RISC-V IMSIC specification allows to develop machines completely relying
> > > > > > > on MSI and don't care about the wired interrupts at all. It just requires
> > > > > > > all the devices to be present behind a PCI bus or present themselves as platform
> > > > > > > MSI device. The former is a more common scenario in x86 world where most
> > > > > > > of the devices are behind PCI bus. As there is very limited MMIO device
> > > > > > > support, it can also scale to very large number of harts.
> > > > > > >
> > > > > > > That's why, this patch series introduces a minimalistic yet very extensible
> > > > > > > forward looking machine called as "RISC-V Mini Computer" or "minic". The
> > > > > > > idea is to build PC or server like systems with this machine. The machine can
> > > > > > > work with or without virtio framework. The current implementation only
> > > > > > > supports RV64. I am not sure if building a RV32 machine would be of interest
> > > > > > > for such machines. The only mmio device it requires is clint to emulate
> > > > > > > the mtimecmp.
> > > > > >
> > > >
> > > > Any other thoughts ?
> > >
> > > I don't *love* this idea. I think the virt machine is useful, but I'm
> > > not convinced we need a second one.
> > >
> > > This feels a little bit more like a "none" machine, as it contains
> > > just the bare minimum to work.
> > >
> > > >
> > > > > > I would ask what you see as the long term future usage for 'virt' vs
> > > > > > 'minic' machine types ? Would you expect all existing users of 'virt'
> > > > > > to ultimately switch to 'minic', or are there distinct non-overlapping
> > > > > > use cases for 'virt' vs 'minic' such that both end up widely used ?
> > > > > >
> > > > >
> > > > > Nope. I don't expect existing 'virt' users to switch to 'minic' as
> > > > > they aim to cater to different users.
> > > > >
> > > > > Here are the major differences
> > > > > 1. virt machine supports MMIO devices & wired interrupts. Minic doesn't
> > >
> > > This seems like the main difference
> > >
> > > > > 2. virt machine doesn't support the MSI only option yet (can be added
> > > > > though[1]). Minic does.
> > >
> > > This could be fixed
> > >
> > > > > 3. Number of cpu supported by virt machine are limited because of the
> > > > > MMIO devices. Minic can scale to very
> > > > > large numbers of cpu.
> > >
> > > Similar to 1
> > >
> > > > > 4. 'Minic' only supports PCI based MSI capable devices. Thus, MSI is a
> > > > > mandatory requirement for 'minic' while
> > > > > it is optional for 'virt'.
> > >
> > > I'm not fully convinced we need this, but it also doesn't seem to cost
> > > us a lot in terms of maintenance. It would be beneficial if we could
> > > share a bit more of the code. Can we share the socket creation code as
> > > well?
> > >
> > > I don't like the name minic though. What about something like
> > > `virt-hpc`, `virt-pcie-minimal` or something like that? That way we
> > > indicate it's still a virt board
> >
> > We're not versioning the 'virt' machine type right so. IOW, we've not
> > made any promises about its long term featureset.
> >
> > If the virt machine type isn't the perfect match right now, should
> > we change it, in a potentially incompatible way, to give us the right
> > solution long term, rather than introducing a brand new machine type
> > with significant overlap.
> 
> Even if we didn't worry about backwards compatibility the current virt
> machine would still be what most users want. It's just a small number
> of users who don't want MMIO devices and instead want to use PCIe for
> everything. Realistically it's only HPC users who would want this type
> of machine, at least that's my understanding.

I'm not so sure about that. Every other architecture has ended up
standardizing on PCI for general purpose virtual machines. IIRC,
aarch64 started off with MMIO, but switched to PCI as it matured. 

In terms of having VM mgmt tools "just work" for risc-v, I think
it will be very compelling for the general 'virt' machine to be
PCI based, otherwise all the assumptions about PCI in mgmt apps
are going to break requiring never ending riscv fixes.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


