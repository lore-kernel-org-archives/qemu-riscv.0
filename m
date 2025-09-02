Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8126CCA1007
	for <qemu-riscv@archiver.kernel.org>; Tue,  2 Sep 2025 19:10:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1utWO7-0002sN-23; Tue, 02 Sep 2025 15:09:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1utWO5-0002rT-NV
 for qemu-riscv@nongnu.org; Tue, 02 Sep 2025 15:09:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1utWO3-0000vO-VY
 for qemu-riscv@nongnu.org; Tue, 02 Sep 2025 15:09:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1756840187;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T6aZo6bFOejCKlebgRxBSqBSOCqRXA0s/PEkc9kxZzw=;
 b=jF/PRVnGMj1vc4fzB2VmhBG8AqkQi3Pqt+0wigD0vuxYJiTQ/tKYKCLCvBglG8UyKIFHhG
 VcuSNkQaSqQRBOURnpdKwLCBFJJMv2Sp8hZrC6ZAv4HvYOBnqtvHYHktDJQW0wALE2hZyC
 oDrVEd2Z+xiAK1dCEm8Mqe1WMVkBkjc=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-587-ud_o2ddvN0GU1vS6a_yr4g-1; Tue, 02 Sep 2025 15:09:43 -0400
X-MC-Unique: ud_o2ddvN0GU1vS6a_yr4g-1
X-Mimecast-MFC-AGG-ID: ud_o2ddvN0GU1vS6a_yr4g_1756840183
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-80593bfe0a2so311697085a.3
 for <qemu-riscv@nongnu.org>; Tue, 02 Sep 2025 12:09:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756840183; x=1757444983;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=T6aZo6bFOejCKlebgRxBSqBSOCqRXA0s/PEkc9kxZzw=;
 b=HDQp8uIfEkwq2eBvLHZluPtn35KaKXHw9UvajtK4+dl98FMFaTXEa+7b6WTJJ0THTy
 xBZ392YHgGOHXLQOATppljK2Oz3wVb4xBt66+/dbsYdV92632gIQPbXuJsK354cEeJJB
 K/3mGflH0lFpuzo2JymyN4w/HyBKgzfQ587NZk8eBVzBZFVTNDiy6W0DAltLWJWPWfbJ
 TnlhB6qjz2sHaYSVl1P0iNOFaTomlu8Gv458EoONBZzGuamCpGtuzw1W42CMmCGw63Sh
 Ta3Uzpl6TV9S241Ns/qsTqtEzHbA5/TVRpsVRJcGU46Va3dGGM2CaIX2UJpRto4kEjoh
 +6NQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/2aAibVZ7JaEU/rWzzlw50vrfzaDgR7fb5PsqKHHIwkHunwui0XDSAGw02YXaV3IyPtfpZBBDj2fX@nongnu.org
X-Gm-Message-State: AOJu0Ywa/MarzGooZ1TMtQiWGg1nQ15Ypy/nRgotir/SJShcIfrVY6bN
 UNj6Zbz0Mpg2XGiP3uqOnfgu4taxih1woxb5FR6gObTvviKt8fCfc7RZK5KvyTjEScuUna1PWx+
 iuxczEMsczC0Ym/MnSTN+u+uQVvMIlRj2NTkkwL4SC2Ve5Qp/txJDsWBe
X-Gm-Gg: ASbGncvSSOe+bQGeONDz7dKbOmrJL3h8ONGdWob4MzEI3GYeud6w8Q8uVtz1+J5/ftL
 aeAFP0kvjIQoB+0XPodha3XHt8pe+hpYLcbytYcabQkzJEyWGcM8rFvlZtnbFjkN0U+/DyQD2X+
 WTMsUcDYSCnwzLUOVwv7MfdQ0Ke3cQlja23gHU2RT7VFBGyvwpzb46UuCc+foLV1MXCuO/uyBOO
 G1VcD13ULhbTk3UsbrBd3ua6XdJqqSCdCGQtsJmLosQaX/wyxu1lCj2L0bNqSW678k25dkm0pW5
 AtcRsGo7okd9Dq8TrNG7nIf+Cr6oMVXN
X-Received: by 2002:a05:620a:2043:b0:809:3aea:1401 with SMTP id
 af79cd13be357-8093aea6251mr189380285a.75.1756840183198; 
 Tue, 02 Sep 2025 12:09:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvr13b2cdJkcUH4TQ6/CI39Vrq5Vu33VWLBBTCta1UQzE2Fcgg8l3R8uExaeGI7N3K3jtzDw==
X-Received: by 2002:a05:620a:2043:b0:809:3aea:1401 with SMTP id
 af79cd13be357-8093aea6251mr189375385a.75.1756840182677; 
 Tue, 02 Sep 2025 12:09:42 -0700 (PDT)
Received: from x1.local ([174.89.135.121]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8069cdf0c07sm180439385a.59.2025.09.02.12.09.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Sep 2025 12:09:41 -0700 (PDT)
Date: Tue, 2 Sep 2025 15:09:22 -0400
From: Peter Xu <peterx@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: CJ Chen <cjchen@igel.co.jp>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Jesper Devantier <foss@defmacro.it>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Tyrone Ting <kfting@nuvoton.com>, Hao Wu <wuhaotsh@google.com>,
 Max Filippov <jcmvbkbc@gmail.com>, David Hildenbrand <david@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>,
 Tomoyuki Hirose <hrstmyk811m@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [RFC PATCH v2 3/9] hw: npcm7xx_fiu and mx_pic change
 .impl.unaligned = true
Message-ID: <aLdA4uH5CGbfz9Gd@x1.local>
References: <20250822092410.25833-1-cjchen@igel.co.jp>
 <20250822092410.25833-4-cjchen@igel.co.jp>
 <3a80c5e5-9889-4830-9a00-5d4d92141a3a@linaro.org>
MIME-Version: 1.0
In-Reply-To: <3a80c5e5-9889-4830-9a00-5d4d92141a3a@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ZVGhdlRFPn_5F3JZmC-AYgnysno4kz6oeYf2BnGuqA8_1756840183
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Mon, Aug 25, 2025 at 01:00:21PM +0200, Philippe Mathieu-Daudé wrote:
> Hi,
> 
> On 22/8/25 11:24, CJ Chen wrote:
> > By setting .impl.unaligned = true, we allow QEMU to pass along
> > unaligned requests directly as-is, rather than splitting them into
> > multiple aligned sub-requests that might cause repeated device
> > callbacks or unintended side effects.
> > 
> > Signed-off-by: CJ Chen <cjchen@igel.co.jp>
> > Tested-by: CJ Chen <cjchen@igel.co.jp>
> > Acked-by: Tomoyuki Hirose <hrstmyk811m@gmail.com>
> > Reported-by: Tomoyuki Hirose <hrstmyk811m@gmail.com>
> > ---
> >   hw/ssi/npcm7xx_fiu.c | 3 +++
> >   hw/xtensa/mx_pic.c   | 3 +++
> >   2 files changed, 6 insertions(+)
> 
> 
> > diff --git a/hw/xtensa/mx_pic.c b/hw/xtensa/mx_pic.c
> > index 8211c993eb..6bf524a918 100644
> > --- a/hw/xtensa/mx_pic.c
> > +++ b/hw/xtensa/mx_pic.c
> > @@ -270,6 +270,9 @@ static const MemoryRegionOps xtensa_mx_pic_ops = {
> >       .valid = {
> >           .unaligned = true,
> >       },
> > +    .impl = {
> > +        .unaligned = true,
> > +    },
> >   };
> 
> Surely a distinct patch.

Besides that, I also don't understand how it used to work even before this
change..

E.g., both of the xtensa mx_pic read/write ignores size, that doesn't look
right already when there's totally no limitation of impl.*_access_size.

Meanwhile, taking xtensa_mx_pic_ext_reg_read() as example, it'll return a
u32 by offset smaller than MX_MAX_IRQ (where MIROUT==0):

    if (offset < MIROUT + MX_MAX_IRQ) {
        return mx->mirout[offset - MIROUT];
    }

But it returns different u32 for different offsets.. so reading 0x0 returns
the 1st u32, then 0x1 returns the 2nd (rather than reading 0x4 returns
that).

Even if there might be a driver that works with it, it still doesn't look
like the traditional way of doing MMIOs.. irrelevant of setting unaligned
or not in its .impl.

-- 
Peter Xu


