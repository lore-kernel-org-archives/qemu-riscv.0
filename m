Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5D10E71D35
	for <qemu-riscv@archiver.kernel.org>; Fri, 29 Sep 2023 13:32:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qmDbb-0002yX-MG; Fri, 29 Sep 2023 09:32:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1qmDba-0002y4-PR
 for qemu-riscv@nongnu.org; Fri, 29 Sep 2023 09:32:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1qmDbY-0001Yk-Ox
 for qemu-riscv@nongnu.org; Fri, 29 Sep 2023 09:32:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695994346;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v7Otf/rq0X29FCRiDiXGkFl4GHrPfZcsCx7n2iyDWwg=;
 b=L9G96Ipj2W/++sLwCwv+TxJH7J3WiH9Dx7gwCVUUC0UaUBL4prv5FpQRFT4dqazVvSxzEX
 XEwUxbnR5DZ2dIuzE5xVCCaW16XQBzJu6KdCncMLX/aVo1TiZrjIArhteu4baE+ZtYbMQq
 +ncp63Ms2JUTsk5ZSEphd2xu12wOuPo=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-623-04o6CL_FPsyQcRSudSsYdw-1; Fri, 29 Sep 2023 09:32:20 -0400
X-MC-Unique: 04o6CL_FPsyQcRSudSsYdw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A3F331C0514E;
 Fri, 29 Sep 2023 13:32:19 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.43])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 031282026D68;
 Fri, 29 Sep 2023 13:32:16 +0000 (UTC)
Date: Fri, 29 Sep 2023 14:32:14 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, liweiwei@iscas.ac.cn,
 zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Andrew Jones <ajones@ventanamicro.com>
Subject: Re: [PATCH 0/6] riscv: RVA22U64 profile support
Message-ID: <ZRbR3j0M1XiuUS0m@redhat.com>
References: <20230926194951.183767-1-dbarboza@ventanamicro.com>
 <ZRarBuEeBi7WkS6K@redhat.com>
 <e5342929-506a-ce75-34fa-204ad0970ee2@ventanamicro.com>
 <ZRa7O67ZTukOq5GL@redhat.com>
 <b6256c0e-5000-2af1-5ffa-caae55d9f694@ventanamicro.com>
 <ZRbIqHuefKCBNudv@redhat.com>
 <2acdbc24-33e6-3cd2-b4c7-713844f8211d@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2acdbc24-33e6-3cd2-b4c7-713844f8211d@ventanamicro.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Fri, Sep 29, 2023 at 10:26:08AM -0300, Daniel Henrique Barboza wrote:
> 
> 
> On 9/29/23 09:52, Daniel P. Berrangé wrote:
> > On Fri, Sep 29, 2023 at 09:49:47AM -0300, Daniel Henrique Barboza wrote:
> > > 
> > > 
> > > On 9/29/23 08:55, Daniel P. Berrangé wrote:
> > > > On Fri, Sep 29, 2023 at 08:29:08AM -0300, Daniel Henrique Barboza wrote:
> > > > > 
> > > > > 
> > > > > On 9/29/23 07:46, Daniel P. Berrangé wrote:
> > > > > > On Tue, Sep 26, 2023 at 04:49:44PM -0300, Daniel Henrique Barboza wrote:
> > > > > > > Based-on: 20230926183109.165878-1-dbarboza@ventanamicro.com
> > > > > > > ("[PATCH 0/2] riscv: add extension properties for all cpus")
> > > > > > > 
> > > > > > > Hi,
> > > > > > > 
> > > > > > > These patches implements the base profile support for qemu-riscv and the
> > > > > > > first profile, RVA22U64.
> > > > > > > 
> > > > > > > As discussed in this thread [1] we're aiming for a flag that enables all
> > > > > > > mandatory extensions of a profile. Optional extensions were left behind
> > > > > > > and must be enabled by hand if desired. Since this is the first profile
> > > > > > > we're adding, we'll need to add the base framework as well.
> > > > > > > 
> > > > > > > The RVA22U64 profile was chosen because qemu-riscv implements all its
> > > > > > > extensions, both mandatory and optional. That includes 'zicntr' and
> > > > > > > 'zihpm', which we support for awhile but aren't adverting to userspace.
> > > > > > > 
> > > > > > > Other design decisions made:
> > > > > > > 
> > > > > > > - disabling a profile flag does nothing, i.e. we won't mass disable
> > > > > > >      mandatory extensions of the rva22U64 profile if the user sets
> > > > > > >      rva22u64=false;
> > > > > > 
> > > > > > Why shouldn't this be allowed ?
> > > > > > 
> > > > > > IIUC, a profile is syntactic sugar for a group of features. If
> > > > > > we can disable individual features explicitly, why should we
> > > > > > not allow use of the profile as sugar to disable them en-mass ?
> > > > > 
> > > > > In theory there's no harm in allowing mass disabling of extensions but, given
> > > > > it's a whole profile, we would end up disabling most/all CPU extensions and
> > > > > the guest would do nothing.
> > > > 
> > > > True, that is just user error though.  They could disable a profile
> > > > and then manually re-enable individual features, and thus get a
> > > > working system.
> > > > 
> > > > > There is a thread in the ML:
> > > > > 
> > > > > https://lore.kernel.org/qemu-riscv/CABJz62NyVNu4Z1qmCG7MyJkGG_9yWxjUFHHWjmoQEP6unRrHNA@mail.gmail.com/
> > > > > 
> > > > > Where we discussed the possibility of having a minimal CPU extension set. We didn't
> > > > > reach a consensus because the definition of "minimal CPU extension set" vary between
> > > > > OSes (Linux requires IMAFD, FreeBSD might require something differ).
> > > > > 
> > > > > Assuming we reach a consensus on what a minimal set is, we could allow disabling mass
> > > > > extensions via probile but keeping this minimal set, for example. At very least we
> > > > > shouldn't allow users to disable 'I' because that would kill the CPU, so RV64I is
> > > > > the minimum set that I would assume for now.
> > > > 
> > > > I'd probably just call that user error too.
> > > > 
> > > > > > 
> > > > > > TL;DR: feature groups are pretty error prone if more than
> > > > > > one is listed by the user, or they're combined with individual
> > > > > > features.
> > > > > > 
> > > > > > > 
> > > > > > > - profile support for vendor CPUs consists into checking if the CPU
> > > > > > >      happens to have the mandatory extensions required for it. In case it
> > > > > > >      doesn't we'll error out. This is done to follow the same prerogative
> > > > > > >      we always had of not allowing extensions being enabled for vendor
> > > > > > >      CPUs;
> > > > > > 
> > > > > > Why shouldn't this be allowed ?
> > > > > 
> > > > > There's no technical reason to not allow it. The reason it's forbid is to be
> > > > > closer to what the real hardware would do. E.g. the real hardware doesn't allow
> > > > > users to enable Vector if the hardware doesn't support it. Vendor CPUs also has
> > > > > a privileged spec restriction as well, so if a CPU is running in an older spec
> > > > > it can't enable extensions that were added later.
> > > > 
> > > > Real hardware is constrained in not being able to invent arbitrary
> > > > new features on chip. Virtual machines  are not constrained, so
> > > > I don't think the inability of hardware todo this, is an especially
> > > > strong reason to limit software emulation.
> > > > 
> > > > What I don't like about this, is that (IIUC) the '$profile=on' option
> > > > now has different semantics depending on what CPU it is used with.
> > > > 
> > > > ie  using it with a vendor CPU,   $profile=on  becomes an assertion
> > > > that the vendor CPU contains all the features needed to satisfy
> > > > $profile. It won't enable/disable anything, just check it is present.
> > > > 
> > > > With a non-vendor CPU, using $profile=on becomes a mechanism to force
> > > > enable all the features needed to satisfy $profile, there is no
> > > > mechanism to just check for presence.
> > > > 
> > > > Having two different semantics for the same syntax is generally considered
> > > > bad design practice.
> > > > 
> > > > This points towards supporting a tri-state, not boolean. $profile=check
> > > > for validation only, and $profile=on for force enablement.
> > > 
> > > This would leave us with:
> > > 
> > > - $profile=off => disable all extensions. Let users hit themselves in the foot if they
> > > don't enable any other extensions. Note that disabling a profile and enabling extensions
> > > on top of it is very sensitive to left-to-right ordering, so it would be good to have
> > > a way to enforce this ordering somehow (feature groups always first);
> > 
> > It is also order sensitive if 2 profiles have overlap in the
> > extensions they represent. So might also require an ordering
> > of profiles themselves to be defined if you permit multiple
> > profiles.
> > 
> > If we dont want to think about this immediately that, then
> > we should make $profile=off into a fatal error rather than
> > silently ignoring it
> 
> I don't mind handling it right now, I just don't know how hehe
> 
> I'll re-read the thread you sent earlier and see if there's something I missed. I got the
> impression that we need your qom patch first.

My patch is dropped as it was considered too gross. Kevin provided
a new impl for ARRAY properties which eliminates the ordering problem.

IOW, QemuOpts iteration order will remain undefined in general.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


