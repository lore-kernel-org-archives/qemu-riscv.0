Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B252CD5BD1
	for <qemu-riscv@archiver.kernel.org>; Mon,  1 Jun 2026 14:27:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wU3bX-0006Gk-Ht; Mon, 01 Jun 2026 10:26:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.liu.zevorn@gmail.com>)
 id 1wU3bV-0006FS-FH
 for qemu-riscv@nongnu.org; Mon, 01 Jun 2026 10:26:57 -0400
Received: from mail-dy1-x1344.google.com ([2607:f8b0:4864:20::1344])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chao.liu.zevorn@gmail.com>)
 id 1wU3bT-0004Zh-Ms
 for qemu-riscv@nongnu.org; Mon, 01 Jun 2026 10:26:57 -0400
Received: by mail-dy1-x1344.google.com with SMTP id
 5a478bee46e88-3045c195251so10566770eec.1
 for <qemu-riscv@nongnu.org>; Mon, 01 Jun 2026 07:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780324014; x=1780928814; darn=nongnu.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=tSue0Ph6YN7LH+MLkORyLTwCYdJRYN5b/jagyq/fRTw=;
 b=IvhTQcyXogJTtdFoyH0gLHImIaFP97Rb0eoKyGKQZw+IHDUw/wMT8kmK0l6m6im6wB
 WtSRexrljk9jyYdHZLpv5Jby+RK6o9uUXJUH2ei1QahKit9Gd5AK2EDXGz4bL6OWQp5R
 KPoftiDXlviYvNLU8f2+qb3uZZe7+YWwqsTWelRUYBqF7NLz+GNRqUmnsJRAwwvU1CT5
 tpbDXF7SmSILZpr9+9TWMhBzLneg3iUvmIpN96IiTuobiQg0IxyspTVgR2ysyqQE0KrE
 +JCXfBE0mOFc+RgVoOXtLjb9nU+9SzPqmldPlScjPP8dnoUKQ6zqEMA9HYtuIFD36Ksk
 f+SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780324014; x=1780928814;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tSue0Ph6YN7LH+MLkORyLTwCYdJRYN5b/jagyq/fRTw=;
 b=o6+uMIJM9NA1lIEKSkJ1MSV7l6AVEtHIxrsPs9GN/czvvKpGe/Mw7r+h7eY4z39sa3
 b7Gb4Yhbr7TynvvjAwb8issFveMdojBMDwZcoW4koKJI33QhVPrBrUCgy9jCy8njmnRa
 xuDHA2aU49rS/CQuGjqggsQDhq3QRibOohCQhHxwAL5ZXE5jxxjtBGmiXps/+Qi5HBO3
 W5dH9BZpX6aGtcM1aW/Z0NzTFJm/rHVH25qoff3DgEPyh3vvC5R9dyvP8znG73m/uGGg
 qBD7fRTei7FoJI9TWzKJDAXVbggn3kurSaune7+Y7jzQcXKSA1zKJ8Xg8Ns711MwX+mA
 ps7w==
X-Gm-Message-State: AOJu0Yx5/D/msOi622S1PJAjHdC+WKE+7lHhqhCu3pvcbdliN0HtNx1F
 1MIxlMwcSvSQBvcnCORV23Bxc49bJz884nvS+NwesA6wMylIbUHi3N+h
X-Gm-Gg: Acq92OFyEHTLG9uxoMmOrGiJEqR0ODq/HNaoji3soHigQqdeGvpSC/uNk4WpCTvK/yP
 ImSQftGqvwoPEvqWl88EmHWY+Rw9QAkkV2OVJBCveoWUDoiDJNfZtSU9sqSTZ9QXgIM8vvJniMI
 8QA429BZonSDk71+xkMtMxz39QGh5ZGjfdpLg7yjpk3gAjR1Q8Ns5gVRU55waAHgKlKvCLV+GWV
 Cb+tHknv026Zypd4jPVo/LJCEmPa+MWmpVrZfGAj7hcCX3SKxBSVfMmoJXsQidNd2cWkAjqJMkm
 rT/q/1KhFf990TJ/7q8sw3aROqeyWxwKRgjO/zoETylaf5B9QmHXSzVFm1GBbb1XEIKpqoGIQnh
 v/0+IsKPag9L8+h1ItezSjjRDxbs+nqgV36YRrwJSQTs0HPH1+MJgrYajj1gdPXthzUYqJYflkb
 9Snx0WFmhSHIImxGznNjrnzhDriPREIqj2oGx+6nkp+9ofbucrHl8zc88XxtlpjzpfK/OLKA==
X-Received: by 2002:a05:7300:4312:b0:2ce:25be:c8e8 with SMTP id
 5a478bee46e88-304fa5a8b1amr6042649eec.17.1780324013843; 
 Mon, 01 Jun 2026 07:26:53 -0700 (PDT)
Received: from localhost ([64.186.250.142]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-304ed2eb24fsm8619805eec.7.2026.06.01.07.26.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2026 07:26:53 -0700 (PDT)
Date: Mon, 1 Jun 2026 22:26:50 +0800
From: Chao Liu <chao.liu.zevorn@gmail.com>
To: Alistair Francis <alistair@alistair23.me>
Cc: qemu-riscv@nongnu.org
Subject: Re: QEMU RISC-V Call
Message-ID: <ah2VWgbZ33uUvahG@ChaodeMacBook-Pro.local>
References: <e2576b58-9356-4d88-8485-42256b2a2366@alistair23.me>
 <6e25408f-662c-4cd9-93b7-35ea100c81fb@oss.qualcomm.com>
 <81a5c280-973d-4ada-b2f3-3ac4652a2037@app.fastmail.com>
 <ahkrD2h1kaubNtXq@sifive.com>
 <443d2b53-a613-4d46-b750-3a22aa72f67c@app.fastmail.com>
 <3c88b75c-3658-4516-a655-d500de323d8c@alistair23.me>
 <ah1EuI-RI68I22Ow@ChaodeMacBook-Pro.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ah1EuI-RI68I22Ow@ChaodeMacBook-Pro.local>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1344;
 envelope-from=chao.liu.zevorn@gmail.com; helo=mail-dy1-x1344.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

cc: qemu-riscv
On Mon, Jun 01, 2026 at 10:15:22PM +0800, Chao Liu wrote:
> On Mon, Jun 01, 2026 at 11:56:57AM +0800, Alistair Francis wrote:
> > 
> > 
> > On 30/5/26 20:43, Alistair wrote:
> > > On Fri, 29 May 2026, at 4:00 PM, Max Chou wrote:
> > > > On 2026-05-28 21:37, Alistair wrote:
> > > > > On Thu, 28 May 2026, at 5:13 AM, Daniel Henrique Barboza wrote:
> > > > > > 
> > > > > > 
> > > > > > On 5/27/2026 9:15 AM, Alistair Francis wrote:
> > > > > > > Hello everyone,
> > > > > > > 
> > > > > > > There has been some interest recently about setting up a call to discuss QEMU RISC-V and the current status.
> > > > > > > 
> > > > > > > So I wanted to setup a chat next week AEST (UTC+10) time to discuss a few things on a call.
> > > > > > > 
> > > > > > > I was thinking 1PM on Monday the 1st of June.
> > > > > > 
> > > > > > Can we make it 10AM AEST?
> > > > > 
> > > > > Sure! Let's do that
> > > > 
> > > > Both work for me. Thx
> > > 
> > > Great! I'll send a meeting link out on Monday.
> > 
> > Hello everyone,
> > 
> > We had the meeting today.
> > 
> > A few of my key takeaways after the meeting:
> > 
> >  * We need a new stricter extension requirement as there are just too many
> > extensions being submitted.
> >     * I'm thinking requiring upstream tests to use the extension and at
> > least some proof the extension is used and provides value before it is
> > reviewed. Thoughts?
> >  * Someone? Tenstorrent? will submit documentation to QEMU to describe a few
> > key Vector options that people should test their code against
> >  * Joel to send Sdtrig patches supporting both debug spec versions.
> > Otherwsie deprecate current 0.13 version
> >  * Anton to send vector patches
> >  * Schedule these regularly, but not on a Monday. How about 10AM (so same
> > time) on a Wednesday?
> > 
> > 
> > Portia kindly took notes that are below:
> > 
> > 
> > QEMU Community Meeting Notes
> > 
> > QEMU RISC-V extension policies
> > * There are too many extensions coming through and cannot keep up with
> > reviews.
> > * Is there even code that runs using them?
> > * Discussed requiring some test as part of accepting these, TCG test or kvm
> > unit tests
> >     * RVI is supposed to do compliance test, we could ask for these tests,
> > but they generally don't seem to exist
> > * Discussed having deprecation scheduled but the burden is on submission not
> > maintainance.
> > 
> > Vector cross implementation issue
> > * There is a lot of optionality in the architecture but most software is
> > just being developed against the RVS32 and QEMU defaults.
> >     * For example, GPG Is broken on the K3 since it has a non. 128 vector
> > length.
> > * Suggested having a fuzzer CPU option to run which would randomize certain
> > profile compliant options
> >     * All options are already available in the command line so this doesn’t
> > add much, just makes it easier for people to test more options
> > * Silicon companies have some test vectors of this but it doesn’t help the
> > fact that upstream developers don’t use these options.
> > * Write QEMU documentation (wiki or docs) with 3-5 combinations that it is
> > recommended to test against.
> >     * Projects can be pointed at this for CI
> > 
> > Upstream issues
> > * sdtrig debug patches
> >     * There are two ratified debug specs, 1.0 and 0.13. They are
> > incompatible, all sdtrig patches break the previous ratified version.
> 
> Agreed, this direction makes sense to me.
> 
> I have been working on upstreaming sdext and Debug Module 1.0 support,
> and I will rework the series according to these requirements.
> 
> In particular, I will split the Debug Module changes into smaller series
> and provide sufficient test coverage.
> 
> The sdext and Debug Module work had already been validated internally
> at my previous company, Tecorigin, although that was based on QEMU 9.2.
> 
> >     * stdtrig is needed to be profile compatible so there is a push to
> > remove 0.13.
> >     * Joel is working on adding Sdtrig support while supporting 0.13 as
> > well.
> > 
> 
> For the Debug Module series, I would prefer to continue on top of Joel’s
> sdtrig compatibility work, since my patches also touch sdtrig.
> 
> If possible, I would also like to sync with Joel on the approach.
> 
> Alistair, do you have any thoughts on this?
> 
> > * Vector bugs found from trace matching
> >     * Have found QEMU bugs from trace matching to emulation platforms are
> > they upstreamable? It can be useful for finding QEMU bugs.
> >     * Vector is really slow , would be wary if it impacts performance
> 
> Do we plan to improve RVV emulation performance later?
> 
> I did some work before based on Paolo Savini’s strided vector memory access
> patches, with extra optimization and testing. But this kind of performance
> change can easily break correctness, so I have been careful with it.
> 
> Given the vector bugs found by trace matching, maybe we should add more tests
> first, such as TCG tests, before doing more RVV performance work.
> 
> >     * Don’t want more custom options, try and send patches that tweak QEMU's
> > implementation to be more like real hardware without optionality.
> > 
> 
> ---
> 
> I was onboarding at my new company this morning, so I only caught the first half
> of the meeting. Overall, it sounds good to me, and I’ll keep contributing upstream
> as much as I can.
> 
> Thanks,
> Chao
> > Alistair
> > 
> > 
> > > 
> > > Alistair
> > > 
> > > > 
> > > > rnax
> > > > 
> > 
> > 

