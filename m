Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44404E7F154
	for <qemu-riscv@archiver.kernel.org>; Fri, 29 Sep 2023 11:56:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qmC6E-0007gz-KV; Fri, 29 Sep 2023 07:56:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1qmC6C-0007d3-Bi
 for qemu-riscv@nongnu.org; Fri, 29 Sep 2023 07:56:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1qmC62-0005sY-Fz
 for qemu-riscv@nongnu.org; Fri, 29 Sep 2023 07:56:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695988549;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vSYhVITJkf9yB42IRQELutbkHUlyKeDb+jWuND+J1Xw=;
 b=WCb5qLendso4gYYChsl39370a2Rfbf1gxAj4wg9FZf1u3UxwTpA6IqOB7/Ed3U2eL+SuC5
 A/TnqyKNMbQ9drZi0o6cWt5u+xCt3BGsGtOKNMLsHtbpU0aXiUvRMHO7i/V0xLATnfvMjB
 2h7ne+SsymppNPezEYky5SPpp8j1SVA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-335-HUjb9LcGNz2zfIGrN8BLvg-1; Fri, 29 Sep 2023 07:55:44 -0400
X-MC-Unique: HUjb9LcGNz2zfIGrN8BLvg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C70FC800888;
 Fri, 29 Sep 2023 11:55:43 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.43])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D8E414171CA;
 Fri, 29 Sep 2023 11:55:41 +0000 (UTC)
Date: Fri, 29 Sep 2023 12:55:39 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, liweiwei@iscas.ac.cn,
 zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Andrew Jones <ajones@ventanamicro.com>
Subject: Re: [PATCH 0/6] riscv: RVA22U64 profile support
Message-ID: <ZRa7O67ZTukOq5GL@redhat.com>
References: <20230926194951.183767-1-dbarboza@ventanamicro.com>
 <ZRarBuEeBi7WkS6K@redhat.com>
 <e5342929-506a-ce75-34fa-204ad0970ee2@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e5342929-506a-ce75-34fa-204ad0970ee2@ventanamicro.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Fri, Sep 29, 2023 at 08:29:08AM -0300, Daniel Henrique Barboza wrote:
> 
> 
> On 9/29/23 07:46, Daniel P. Berrangé wrote:
> > On Tue, Sep 26, 2023 at 04:49:44PM -0300, Daniel Henrique Barboza wrote:
> > > Based-on: 20230926183109.165878-1-dbarboza@ventanamicro.com
> > > ("[PATCH 0/2] riscv: add extension properties for all cpus")
> > > 
> > > Hi,
> > > 
> > > These patches implements the base profile support for qemu-riscv and the
> > > first profile, RVA22U64.
> > > 
> > > As discussed in this thread [1] we're aiming for a flag that enables all
> > > mandatory extensions of a profile. Optional extensions were left behind
> > > and must be enabled by hand if desired. Since this is the first profile
> > > we're adding, we'll need to add the base framework as well.
> > > 
> > > The RVA22U64 profile was chosen because qemu-riscv implements all its
> > > extensions, both mandatory and optional. That includes 'zicntr' and
> > > 'zihpm', which we support for awhile but aren't adverting to userspace.
> > > 
> > > Other design decisions made:
> > > 
> > > - disabling a profile flag does nothing, i.e. we won't mass disable
> > >    mandatory extensions of the rva22U64 profile if the user sets
> > >    rva22u64=false;
> > 
> > Why shouldn't this be allowed ?
> > 
> > IIUC, a profile is syntactic sugar for a group of features. If
> > we can disable individual features explicitly, why should we
> > not allow use of the profile as sugar to disable them en-mass ?
> 
> In theory there's no harm in allowing mass disabling of extensions but, given
> it's a whole profile, we would end up disabling most/all CPU extensions and
> the guest would do nothing.

True, that is just user error though.  They could disable a profile
and then manually re-enable individual features, and thus get a
working system.

> There is a thread in the ML:
> 
> https://lore.kernel.org/qemu-riscv/CABJz62NyVNu4Z1qmCG7MyJkGG_9yWxjUFHHWjmoQEP6unRrHNA@mail.gmail.com/
> 
> Where we discussed the possibility of having a minimal CPU extension set. We didn't
> reach a consensus because the definition of "minimal CPU extension set" vary between
> OSes (Linux requires IMAFD, FreeBSD might require something differ).
> 
> Assuming we reach a consensus on what a minimal set is, we could allow disabling mass
> extensions via probile but keeping this minimal set, for example. At very least we
> shouldn't allow users to disable 'I' because that would kill the CPU, so RV64I is
> the minimum set that I would assume for now.

I'd probably just call that user error too. 

> > 
> > TL;DR: feature groups are pretty error prone if more than
> > one is listed by the user, or they're combined with individual
> > features.
> > 
> > > 
> > > - profile support for vendor CPUs consists into checking if the CPU
> > >    happens to have the mandatory extensions required for it. In case it
> > >    doesn't we'll error out. This is done to follow the same prerogative
> > >    we always had of not allowing extensions being enabled for vendor
> > >    CPUs;
> > 
> > Why shouldn't this be allowed ?
> 
> There's no technical reason to not allow it. The reason it's forbid is to be
> closer to what the real hardware would do. E.g. the real hardware doesn't allow
> users to enable Vector if the hardware doesn't support it. Vendor CPUs also has
> a privileged spec restriction as well, so if a CPU is running in an older spec
> it can't enable extensions that were added later.

Real hardware is constrained in not being able to invent arbitrary
new features on chip. Virtual machines  are not constrained, so
I don't think the inability of hardware todo this, is an especially
strong reason to limit software emulation.

What I don't like about this, is that (IIUC) the '$profile=on' option
now has different semantics depending on what CPU it is used with.

ie  using it with a vendor CPU,   $profile=on  becomes an assertion
that the vendor CPU contains all the features needed to satisfy
$profile. It won't enable/disable anything, just check it is present.

With a non-vendor CPU, using $profile=on becomes a mechanism to force
enable all the features needed to satisfy $profile, there is no
mechanism to just check for presence.

Having two different semantics for the same syntax is generally considered
bad design practice.

This points towards supporting a tri-state, not boolean. $profile=check
for validation only, and $profile=on for force enablement.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


