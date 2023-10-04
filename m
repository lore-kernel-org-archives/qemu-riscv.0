Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CED79E7B61D
	for <qemu-riscv@archiver.kernel.org>; Wed,  4 Oct 2023 13:54:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qo2K6-0001OA-84; Wed, 04 Oct 2023 09:53:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1qo2Jz-0001GX-IB
 for qemu-riscv@nongnu.org; Wed, 04 Oct 2023 09:53:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1qo2Jl-0002lX-L0
 for qemu-riscv@nongnu.org; Wed, 04 Oct 2023 09:53:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696427617;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0dfRZbA01YJUiuxNKBFFhz/y+zEEaB2FKPcBYc0j6bA=;
 b=UpPG/ZQqbqif09cGE0SSsgWH9qf1rnhWL/a/9G2CTk1wv1n7FrWrJ9QxFPygQ6QtZgpCLU
 SZPiSt+M+88aZ1dY6rW7tbH3+2iv/l9fpb4PESpwn8XFvf1Q294cdBCAXuproSNP1sraJC
 x6y2WQQZqyym6wGsA/v1AW98nWX752Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-253-9PvPRIP2NemlBKvVWsW91w-1; Wed, 04 Oct 2023 09:53:34 -0400
X-MC-Unique: 9PvPRIP2NemlBKvVWsW91w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4017D18312C1;
 Wed,  4 Oct 2023 13:53:33 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.44])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1621D63F20;
 Wed,  4 Oct 2023 13:53:31 +0000 (UTC)
Date: Wed, 4 Oct 2023 14:53:29 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Claudio Fontana <cfontana@suse.de>, Thomas Huth <thuth@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH 00/13] misc: Rename 'softmmu' -> 'system'
Message-ID: <ZR1uWXEqcyPxsV3g@redhat.com>
References: <20231004090629.37473-1-philmd@linaro.org>
 <ZR1bjpEi5HdFp2xj@redhat.com>
 <85be2979-c0ca-3eb4-dae9-bbabf256c201@redhat.com>
 <00b2ec16-162e-9204-3a04-f45e0edeeb15@suse.de>
 <CABgObfZBTZZvcSPcMSRLWscyEz7B-2h9g28FJx7t7Ggux6E9cA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABgObfZBTZZvcSPcMSRLWscyEz7B-2h9g28FJx7t7Ggux6E9cA@mail.gmail.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Wed, Oct 04, 2023 at 03:49:31PM +0200, Paolo Bonzini wrote:
> On Wed, Oct 4, 2023 at 3:41 PM Claudio Fontana <cfontana@suse.de> wrote:
> >
> > On 10/4/23 14:37, Thomas Huth wrote:
> > > On 04/10/2023 14.33, Daniel P. Berrangé wrote:
> > >> Am I mis-understanding what you mean by 'finishes' here, as
> > >> I see many references to softmmu remaining
> > >> In particular under configs/
> > >>
> > >> I was also hoping it meant that we'd be changing configure
> > >> to allow
> > >>
> > >>      configure --target-list=x86_64-system
> > >>      configure --target-list=x86_64-vm
> > >>
> > >> for less typing
> > >
> > > Maybe we should also bikeshed about the naming first... "system" is a quite
> > > overloaded word in this context already, and "vm" sounds rather like
> > > hardware-accelerated stuff ... what about using something like "sysemu"? Or
> > > "fullsys" for "full system emulation" (in contrast to "user space"-only
> > > emulation)?
> 
> I agree that changing other remnants should be done right
> after this patch, for example $softmmu in configure. Changing
> all targets is a very large and very user-visible change, it is
> required but it should be planned very well.
> 
> As to the actual target names, I think system is the only
> consistent choice since we have --enable/--disable-system
> (as pointed out by Claudio) and qemu-system-*.  sysemu
> may make a little more sense in the codebase (we have
> include/sysemu after all), but maybe that ship has sailed
> since we have many occurrences of "system", for example
> system_ss and other related sourcesets.

Yep, I agree with that view now, lets stick with 'system'.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


