Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9496DE7F153
	for <qemu-riscv@archiver.kernel.org>; Fri, 29 Sep 2023 10:46:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qmB1F-0004DG-Ou; Fri, 29 Sep 2023 06:46:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1qmB1D-0004BJ-0F
 for qemu-riscv@nongnu.org; Fri, 29 Sep 2023 06:46:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1qmB17-0007HX-CC
 for qemu-riscv@nongnu.org; Fri, 29 Sep 2023 06:46:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695984400;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=NDXDyU0wVHX7Zo+IO6ndoLidUjfEibxMerlcU+TWVs4=;
 b=eLWmcT7cQ4COdan5bOUfafAMcvjwCtYgxoaWJwB81z3ZJVujXTnnG2g3f/NyesqHVlu+dk
 jRa6PuN4G5xK6kDTAQgX7sTzGHkikT5JeOlEtOkxlz3zyiIQp/f87ON86R44GZf840qXuh
 U94dAw5AUwlRFG822gA1UVSbkxynHTk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-533-wGYc2Rd3OsGy08kdphQy7Q-1; Fri, 29 Sep 2023 06:46:35 -0400
X-MC-Unique: wGYc2Rd3OsGy08kdphQy7Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D5E94101A529;
 Fri, 29 Sep 2023 10:46:34 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.43])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A7DD1004145;
 Fri, 29 Sep 2023 10:46:33 +0000 (UTC)
Date: Fri, 29 Sep 2023 11:46:30 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, liweiwei@iscas.ac.cn,
 zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
Subject: Re: [PATCH 0/6] riscv: RVA22U64 profile support
Message-ID: <ZRarBuEeBi7WkS6K@redhat.com>
References: <20230926194951.183767-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230926194951.183767-1-dbarboza@ventanamicro.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Tue, Sep 26, 2023 at 04:49:44PM -0300, Daniel Henrique Barboza wrote:
> Based-on: 20230926183109.165878-1-dbarboza@ventanamicro.com
> ("[PATCH 0/2] riscv: add extension properties for all cpus")
> 
> Hi,
> 
> These patches implements the base profile support for qemu-riscv and the
> first profile, RVA22U64. 
> 
> As discussed in this thread [1] we're aiming for a flag that enables all
> mandatory extensions of a profile. Optional extensions were left behind
> and must be enabled by hand if desired. Since this is the first profile
> we're adding, we'll need to add the base framework as well. 
> 
> The RVA22U64 profile was chosen because qemu-riscv implements all its
> extensions, both mandatory and optional. That includes 'zicntr' and
> 'zihpm', which we support for awhile but aren't adverting to userspace.
> 
> Other design decisions made:
> 
> - disabling a profile flag does nothing, i.e. we won't mass disable
>   mandatory extensions of the rva22U64 profile if the user sets
>   rva22u64=false;

Why shouldn't this be allowed ?

IIUC, a profile is syntactic sugar for a group of features. If
we can disable individual features explicitly, why should we
not allow use of the profile as sugar to disable them en-mass ?


BTW, I would caution that the semantics of mixing groups of
features, with individual features in -cpu is likely to be
ill defined, as you cannot rely on left-to-right processing
of the -cpu arguments.

IOW, if you say  -cpu $foo,$group=on,$feature=off

you might expect this to result in '$feature' being disabled
if it were implied by $group. This is not guaranteed as the
QDict processing of options could result in us effectively
processing   -cpu $foo,$feature=off,$group=on

This brokeness with CPU feature groups and their interaction
with CPU feature flags already impacts s390x:

  https://lists.nongnu.org/archive/html/qemu-devel/2023-09/msg00981.html

There is a possible way to fix it by declaring an ordering
such that all groups will be processed fully, before any
individual features are processed, and declaring that group
or feature names must not be repeated. This avoids a reliance
on left-to-right ordering:

  https://lists.nongnu.org/archive/html/qemu-devel/2023-09/msg01005.html

that is still likely broken, however, if multiple different
groups are listed, and there is overlap in their feature
sets.

TL;DR: feature groups are pretty error prone if more than
one is listed by the user, or they're combined with individual
features.

> 
> - profile support for vendor CPUs consists into checking if the CPU
>   happens to have the mandatory extensions required for it. In case it
>   doesn't we'll error out. This is done to follow the same prerogative
>   we always had of not allowing extensions being enabled for vendor
>   CPUs;

Why shouldn't this be allowed ?

> - the KVM driver doesn't support profiles. In theory we could apply the
>   same logic as for the vendor CPUs, but KVM has a long way to go before
>   that becomes a factor. We'll revisit this decision when KVM is able to
>   support at least one profile.
> 
> Patch 5 ("enable profile support for vendor CPUs") needs the following
> series to be applied beforehand:
> 
> "[PATCH 0/2] riscv: add extension properties for all cpus"
> 
> Otherwise we won't be able to add the profile flag to vendor CPUs.
> 
> [1] https://lore.kernel.org/qemu-riscv/35a847a1-2720-14ab-61b0-c72d77d5f43b@ventanamicro.com/
> 
> Daniel Henrique Barboza (6):
>   target/riscv/cpu.c: add zicntr extension flag
>   target/riscv/cpu.c: add zihpm extension flag
>   target/riscv: add rva22u64 profile definition
>   target/riscv/tcg: implement rva22u64 profile
>   target/riscv/tcg-cpu.c: enable profile support for vendor CPUs
>   target/riscv/kvm: add 'rva22u64' flag as unavailable
> 
>  target/riscv/cpu.c         | 25 ++++++++++
>  target/riscv/cpu.h         | 10 ++++
>  target/riscv/cpu_cfg.h     |  2 +
>  target/riscv/kvm/kvm-cpu.c |  5 +-
>  target/riscv/tcg/tcg-cpu.c | 98 ++++++++++++++++++++++++++++++++++++++
>  5 files changed, 139 insertions(+), 1 deletion(-)
> 
> -- 
> 2.41.0
> 
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


