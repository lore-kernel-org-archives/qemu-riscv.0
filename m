Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F64EC61DBD
	for <qemu-riscv@archiver.kernel.org>; Wed, 26 Aug 2026 18:41:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wzIYN-0005Wz-Bd; Wed, 26 Aug 2026 14:40:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1wzIYL-0005WE-3y
 for qemu-riscv@nongnu.org; Wed, 26 Aug 2026 14:40:49 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1wzIYJ-0001uM-8i
 for qemu-riscv@nongnu.org; Wed, 26 Aug 2026 14:40:48 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-2cacb8416a1so12759505ad.1
 for <qemu-riscv@nongnu.org>; Wed, 26 Aug 2026 11:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1787769645; x=1788374445; darn=nongnu.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :content-type:mime-version:references:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=2RwGYqKwDPFeCLcJXcwe93n5V0oqEi7xNMqQdcuMlfY=;
 b=B4X5ZMqyiOpsXK1qWJhixPdkc7eIQpSEuvBufQrybZ1MZyRIz9ZrIc0ftTkGCguCu8
 n81cE5QLdfy7GnInlR4HwEEjIIW4h3xQhOub5GGasQbokIMmWXKyVzuZW1lIIqJzKNBk
 cUxS8UZUz+MktYEwjJOIza13yAaOMsynGx0sgbL5KC3APUXOyw8c0oXtAaNv/P/Wemj4
 vsUncqsNsk8NtWasjmEXKnUZmmsVYGyT2IZUQHF4xqIaB7TqolIP5MxjY/7uwNY600zA
 phu0/HvJRL2reCcGkeDPJHVbU5x73gGcZHYfgwAL9gbhOxeuYK9GyUDqWW3ZY/DSQepI
 mlow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787769645; x=1788374445;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :content-type:mime-version:references:message-id:subject:cc:to:from
 :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=2RwGYqKwDPFeCLcJXcwe93n5V0oqEi7xNMqQdcuMlfY=;
 b=ZOR9BT4QLM4kWS7G8hkQ5iAoeFFzmnrgN2merWGQf+BseQbuOpPH8WbNE3KTBrXqHP
 tTki0MX/IN6VoL+ucsUDvApPOgeVpwkAKvuW4zBsRagHVnG/QwBvgRBNQSQ6s56hGjcc
 T8EtGaE1hLTIXIFUjrvfxqoa/83xS3ViJKOa3TE9MxyXhAX7v6e0EHLRJUQm6U/qFxRV
 +xymY2H4bofcXJfP5JgFHaLRZ6D6aSrYQvfM7jmeyVg41Is4HEIMk4l5afiuMauEThFb
 V94n5Re+xV88N+cziIPHDUR89wbLG7h4M3nERDPVYCgB9cF90pv04Jic9IWDOh9Xd9A2
 Mgog==
X-Forwarded-Encrypted: i=1;
 AHgh+RqRdbNRzg/kvga+A/DeuQONLYikBvGaU7JFAuUluthEYL/tCMFR3XTGL116Sa8TmAE8TLpCXj9BuFdU@nongnu.org
X-Gm-Message-State: AFuF++n7DCOyhmCS+mmLQQSqzvVVbQsjezoogYtLBlpG7kKTcavUyBF0
 pZpklp2uUpnV3m/8GUceZ5DE2zzH7+0eKcxauJTZe5IDRmXuV/zLKFnQ8oruSuyyl1VZm95Lmc5
 ZFK3TNsI=
X-Gm-Gg: AR+sD12y0rZ1R+Q5FoqkXlefasenIvjWWdIDq5Bzdu/jwXiRlJUfoychTuwRQtJvwGZ
 oIsAwHcWsCBUtjpYLSWoLT9g1WXsCt3lWOFvZZsvHcnWiuWZHXPJGT7W/aQVrUgq2P87gLDhOiU
 kEwsJT7XxDVMeCaXrmfkE4ZKHtAYOZShC6SPDEd96TSfv2RrTCcjjZSG8BGdXtC1Eu3g3uJsGl1
 7WOtRyboTScmDAphqi8jG/XDC6G4GcBA7Q1/g8IXq056L62w9RKR36gquKFxngUlJcFPyMraCEF
 IOTCZIDZA46x2S228yvEaJuLMsqQUiKimDrL/Kr0jTUSlzcarVpUWfT+zNN05HkePKVEsQ4hpGA
 VxGmpqqx31BSpPuLkriIcp7Fbwdx0zzmnm6GTfTHLlsV3ILswrydq7TaLSmnr2Fm3zk2JH7OCT2
 mBbEKx3DL1+ZlmAAKIkMOXJe24lDa1ASm57jc7ThBLVWhWnbp4nUIvOKQDLN5NckhOHIDnZSYf8
 PgEXpe98TECPL/34RL9HzXlScTn1F/T3A==
X-Received: by 2002:a17:903:4b4b:b0:2d3:160b:c01f with SMTP id
 d9443c01a7336-2d707a8ebdfmr176203985ad.6.1787769645159; 
 Wed, 26 Aug 2026 11:40:45 -0700 (PDT)
Received: from sifive.com ([136.226.240.165]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2d7049a18aesm10519175ad.32.2026.08.26.11.40.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2026 11:40:44 -0700 (PDT)
Date: Thu, 27 Aug 2026 02:40:41 +0800
From: Max Chou <max.chou@sifive.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, frank.chang@sifive.com, qemu-riscv@nongnu.org
Subject: Re: [PATCH 11/23] target/riscv: Rewrite vext_ldff
Message-ID: <ao8wupCB3A-7-4-K@sifive.com>
References: <20260815194549.1377505-1-richard.henderson@linaro.org>
 <20260815194549.1377505-12-richard.henderson@linaro.org>
 <ao3JcPyrC7cZaCgp@sifive.com>
 <2db8ac0a-1b37-450d-8c11-2c5da46ca97a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2db8ac0a-1b37-450d-8c11-2c5da46ca97a@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=max.chou@sifive.com; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On 2026-08-25 13:15, Richard Henderson wrote:
> On 8/25/26 10:58, Max Chou wrote:
> 
> > On 2026-08-15 12:45, Richard Henderson wrote:
> > > Do not call probe_pages for every active element.
> > > We can make do with no more than 2 such calls for
> > > the two pages the insn might reference.
> > > 
> > > Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> > > +    /*
> > > +     * Test whether the first page is accessible.
> > > +     * If the first element is active, it must succeed.
> > > +     */
> > > +    flags = probe_access_flags(env, adjust_addr(env, addr),
> > > +                               MIN(last, last_in_page) - addr + 1,
> > > +                               MMU_DATA_LOAD, mmu_index, !first_active,
> > > +                               &host, ra);
> > Hi Richard,
> > 
> > This probe traverses every byte from the initial active element to the
> > end of the page, not just the bytes of active elements. In the masked
> > case, the range may encompass a masked-off element, and masked-off body
> > elements do not perform memory accesses.
> > I think it may causes unexpected vl.
> > 
> > > +    /* Get number of complete elements in the first page. */
> > > +    elems = MIN(page_split / msize, vl - i);
> > > +
> > > +    /* Load complete elements from the first page. */
> > > +    if (likely(elems)) {
> > > +        uint32_t page_evl = i + elems;
> > > +
> > > +        if (flags == 0) {
> > ...
> > > +        } else {
> > > +            /*
> > > +             * If the first element is active, it must succeed.
> > > +             * This will load from MMIO or fault from INVALID.
> > > +             */
> > > +            if (first_active) {
> > > +                vext_ldst_nf_tlb(env, vd, addr, 0, nf, esz,
> > > +                                 max_elems, ldst_tlb, ra);
> > > +                i = 1;
> > > +                addr += msize;
> > > +            }
> > > +
> > > +            /* Stop if invalid (unmapped) or mmio (transaction may fail). */
> > > +            if (flags & (TLB_INVALID_MASK | TLB_MMIO)) {
> > > +                env->vl = i;
> > > +                goto tail;
> > > +            }
> > > +
> > For an example, assume
> > - vl = 3
> > - vstart = 0
> > - the mask be [1, 0, 1]
> > - assume element 0 and element 2 be readable, but deny the byte at element 1
> > - all three elements are in the same target page.
> > 
> > In theory, the element 1 is masked off and doesn’t perform any memory
> > access, so the value of vl remains 3.
> > 
> > But the previous probe covers element 1 to 2 and the flags will be non
> > zero due to the denied masked-off element 2. Then the vl will set to 1
> > here.
> > 
> > Maybe we could switch to per element prob when vm is 0 and flags is not 0?
> 
> How are you going to deny the byte at element 1 to be unreadable?  Are you
> expecting this to be some PMP thing, with a 1 byte range?
> 
> How I expect things to work is that:
> 
>  (1) We scan forward for the first active element, set vstart.
> 
>  (2) Probe the page for that element.  If that faults, vstart is visible to
> the trap handler.
> 
>  (3) Discounting MMIO, all following elements in the same page cannot fault,
> and we can process them immediately.  Obviously inactive elements get vma
> handling not loads.
> 
Hi Richard,

Sorry, my previous example was unclear. It does not need a 1-byte PMP
region: RISC-V PMP definition allows the minimum 4-byte PMP region,
which exactly matches one e32 element.

For example, with vl=3, vstart=0, e32, and v0.mask = [1, 0, 1],
configure locked PMP entries as follows:

  PMP0: NA4   [base + 4, base + 7], L, ---    # element 1, no read
  PMP1: NAPOT target page,          L, R      # lower-priority page allow

  bytes:       base       base + 4     base + 8
               +-----+    +-----+      +-----+
  element:       0          1            2
  mask:          1          0            1
  access:     active      inactive      active
  PMP:        PMP1 R      PMP0 ---      PMP1 R

The RISC-V spec defines that masked vector loads access memory and raise
exceptions only for active elements.
Therefore this situation has reads only for elements 0 and 2; PMP0 must
not create an access-fault condition for this instruction.

My concern is that the page probe may be unsafe in some situations
because PMP permissions can change at 4-byte granularity inside a
target page, while the probe includes bytes which are not part of
active vector memory operations.

Maybe we could use the page probe only when it returns flags == 0,
and otherwise fall back to checking only active elements or active
runs?

I'm trying to create masked fauly-only-first + PMP test for this.

Thanks,

rnax

> I'm not sure I'm understanding your question properly...
> 
> 
> r~
> 

