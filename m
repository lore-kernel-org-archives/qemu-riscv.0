Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEEBDC3ABC3
	for <qemu-riscv@archiver.kernel.org>; Tue, 13 May 2025 11:15:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uEnbA-0005W7-59; Tue, 13 May 2025 07:15:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1uEnay-0005Ld-4T
 for qemu-riscv@nongnu.org; Tue, 13 May 2025 07:14:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1uEnau-0006TI-UH
 for qemu-riscv@nongnu.org; Tue, 13 May 2025 07:14:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747134884;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hrWL8St/KjWNdQDgkpm2yN+yrijnA+A+ERdMiZgrZ2I=;
 b=J1bnO70iPLcw/YOM93SZGEoh+cdUxW6rcM/cm+IwOOoKWuHtYG1WfhkCJcBKRiSu+pXSkm
 767IUxtbgAE4/IpWd14CEEy0Mb74pWi4EsT8oAczxXPH/W1usAY9DM1yU91g5uVArbq2ux
 YsnqiyWp7gTkhscpU7hZzwIbGUX6RCA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-275--sy9NKpsNXmiwC9azqBR-A-1; Tue, 13 May 2025 07:14:43 -0400
X-MC-Unique: -sy9NKpsNXmiwC9azqBR-A-1
X-Mimecast-MFC-AGG-ID: -sy9NKpsNXmiwC9azqBR-A_1747134882
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3a0ba24d233so1804009f8f.2
 for <qemu-riscv@nongnu.org>; Tue, 13 May 2025 04:14:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747134882; x=1747739682;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hrWL8St/KjWNdQDgkpm2yN+yrijnA+A+ERdMiZgrZ2I=;
 b=mZIS+FmQx3qb1pzc1rqPVwUEaGD0M69Pq3mkgLH1OmGPpBGetzaD+EBnQphkiseoV1
 AL3nL/jxxL6Y0A1LTUiOoUel7mxtoesK6UycoTYK43y4ndVUEQOgc9icoTPgWq75/h1L
 zyeKeL8znBIR4ud7gjPa36OXfU/ea5rdF3ylZZP5KHpCG3u+LLaJRhC/3GCGfpDYfjPa
 dd09j9Oj0BAfHkzM4iTd87ds5hnM05MsC2T0B3dsu3zJaMl4ufhICIjd1WAdhOhEISym
 XSaD0rCK5es+TW3bakEY0l8jIDh8CwkFY4BvYUKV4q40NOrOxBKNDD4/1EnM3z7luxyK
 tLCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmLCT20b+eY5q4I3FiYaa7vGebAkVbmCvlXaCdbhBc4vF7I7Erztt+5FFwQOvBIKJIcb8VfTonVYD6@nongnu.org
X-Gm-Message-State: AOJu0Yz0uxM6+3Fs/IIv2dHvxiIgZU0WYHGwW/Wy7qytQ3+BFRMmWRAz
 Y4kPC0mXlkNw0/ymvYJ0VxjarQs9J8lWaV/jBBHLCFD61LufC5WGYQwNHVwshEZh87IgSTEeSP6
 esvjqOeac0Cf51Gk4EGQLLSGGp4tMBxfJU04IWK/kbb7VsucKxPyc
X-Gm-Gg: ASbGncsccMvTCmsBy/uEBCf4LKYBwNH1GkEVNQWGPBS44YKZkD8DVLxd8olauzVXlHC
 vj1ciO5VmF0TmIWBKsFpJBqjmN/RHhqrYseN2qnf03JRO+pl+BYvExogbC1XHFJSG3m3PpYJf5/
 1221APVl5y9DnguNZZBYI2p/YqcqOi7f7OINjAV81uC5iRQ7vH1EDx2vDkPDiJ+BIuxBOFsJ9uT
 p2GDBDwo/ZgUMVusZc6ZLva6uYpkOrtjBkRaa5iYXIE+FRrshHLpWj+TnzDYuZRRZS1CWLoUGGw
 7WUBBkk7E7lpXs48/GYFpGiZS1P4hoLL
X-Received: by 2002:a05:6000:3113:b0:3a0:b308:8427 with SMTP id
 ffacd0b85a97d-3a1f6482d31mr13683865f8f.37.1747134881730; 
 Tue, 13 May 2025 04:14:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFA3snbPG8QRbnrblP9wfN5lZEYrMvzqD3KCpso9gCqQnk2Tt5GM7Z4lipgqnFLC0sYrJWIfA==
X-Received: by 2002:a05:6000:3113:b0:3a0:b308:8427 with SMTP id
 ffacd0b85a97d-3a1f6482d31mr13683826f8f.37.1747134881344; 
 Tue, 13 May 2025 04:14:41 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com ([85.93.96.130])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a1f5a4d21esm16063106f8f.99.2025.05.13.04.14.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 May 2025 04:14:40 -0700 (PDT)
Date: Tue, 13 May 2025 13:14:39 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Zhao Liu <zhao1.liu@intel.com>
Cc: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 kvm@vger.kernel.org, Sergio Lopez <slp@redhat.com>, Gerd Hoffmann
 <kraxel@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, Laurent
 Vivier <lvivier@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Yi Liu
 <yi.l.liu@intel.com>, "Michael S. Tsirkin" <mst@redhat.com>, Eduardo
 Habkost <eduardo@habkost.net>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, Marcelo Tosatti
 <mtosatti@redhat.com>, qemu-riscv@nongnu.org, Weiwei Li
 <liwei1518@gmail.com>, Amit Shah <amit@kernel.org>, Yanan Wang
 <wangyanan55@huawei.com>, Helge Deller <deller@gmx.de>, Palmer Dabbelt
 <palmer@dabbelt.com>, Ani Sinha <anisinha@redhat.com>, Fabiano Rosas
 <farosas@suse.de>, Paolo Bonzini <pbonzini@redhat.com>, Liu Zhiwei
 <zhiwei_liu@linux.alibaba.com>, =?UTF-8?B?Q2zDqW1lbnQ=?= Mathieu--Drif
 <clement.mathieu--drif@eviden.com>, qemu-arm@nongnu.org, =?UTF-8?B?TWFy?=
 =?UTF-8?B?Yy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>, Huacai Chen
 <chenhuacai@kernel.org>, Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH v4 20/27] target/i386/cpu: Remove
 CPUX86State::enable_l3_cache field
Message-ID: <20250513131439.3ae54224@imammedo.users.ipa.redhat.com>
In-Reply-To: <aB3GsY71YH4usdSi@intel.com>
References: <20250508133550.81391-1-philmd@linaro.org>
 <20250508133550.81391-21-philmd@linaro.org>
 <aB3GsY71YH4usdSi@intel.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: FRbN45QYKKWZonRTFvr-Nclts6GBqpc_uYwvKiBrJI0_1747134882
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.549,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Fri, 9 May 2025 17:11:13 +0800
Zhao Liu <zhao1.liu@intel.com> wrote:

> On Thu, May 08, 2025 at 03:35:43PM +0200, Philippe Mathieu-Daud=C3=A9 wro=
te:
> > Date: Thu,  8 May 2025 15:35:43 +0200
> > From: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> > Subject: [PATCH v4 20/27] target/i386/cpu: Remove
> >  CPUX86State::enable_l3_cache field
> > X-Mailer: git-send-email 2.47.1
> >=20
> > The CPUX86State::enable_l3_cache boolean was only disabled
> > for the pc-q35-2.7 and pc-i440fx-2.7 machines, which got
> > removed.  Being now always %true, we can remove it and simplify
> > cpu_x86_cpuid() and encode_cache_cpuid80000006().
> >=20
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> > ---
> >  target/i386/cpu.h |  6 ------
> >  target/i386/cpu.c | 39 +++++++++++++--------------------------
> >  2 files changed, 13 insertions(+), 32 deletions(-)
> >=20
> > diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> > index b5cbd91c156..62239b0a562 100644
> > --- a/target/i386/cpu.h
> > +++ b/target/i386/cpu.h
> > @@ -2219,12 +2219,6 @@ struct ArchCPU {
> >       */
> >      bool enable_lmce;
> > =20
> > -    /* Compatibility bits for old machine types.
> > -     * If true present virtual l3 cache for VM, the vcpus in the same =
virtual
> > -     * socket share an virtual l3 cache.
> > -     */
> > -    bool enable_l3_cache;
> > -
> >      /* Compatibility bits for old machine types.
> >       * If true present L1 cache as per-thread, not per-core.
> >       */ =20
>=20
> I realize this is another special case.
>=20
> There is no support for hybrid x86 CPUs in QEMU, but it's also true that
> there are some actual modern x86 Client CPUs without l3 cache, such as
> Intel MTL's low power E core (and it has vmx support, i.e., support KVM).
>=20
> So I think we can keep this property as well, to have some more
> configuration options for users' emulation.

it also seems that libvirt uses it.


