Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1ECBC3ABC3
	for <qemu-riscv@archiver.kernel.org>; Mon, 12 May 2025 15:01:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uEUdu-0008Ny-PB; Mon, 12 May 2025 11:00:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1uEUdf-0008FR-Dj
 for qemu-riscv@nongnu.org; Mon, 12 May 2025 11:00:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1uEUda-0002YA-7k
 for qemu-riscv@nongnu.org; Mon, 12 May 2025 11:00:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747062012;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=62B8wkc3EC4lBjOmztAs/HDq1MT8sStoMKQHzrVxrL0=;
 b=FPjs9sr5tGHmf2lF5d9iET9f8R5RNbVZdY4KH8heWLnoDEgzx27PslR+LfQAb3JxQiHwNM
 s2RCUrFPPMNivYxvj7VrJLQGNMIhonjRIvACZ6uW/O5nyLWAx27774hnWgoDKRd1qsKSa+
 sadBD1mnOe4lKZgo+VtP/HSkoyLQ1UA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-696-yN02o0fWOwi3_rPUT15PYg-1; Mon, 12 May 2025 11:00:09 -0400
X-MC-Unique: yN02o0fWOwi3_rPUT15PYg-1
X-Mimecast-MFC-AGG-ID: yN02o0fWOwi3_rPUT15PYg_1747062007
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-44059976a1fso15052575e9.1
 for <qemu-riscv@nongnu.org>; Mon, 12 May 2025 08:00:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747062007; x=1747666807;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eI5J0HXKP1fZkgVktC6av2xKm9xJ4Og8E9m08wcvTwo=;
 b=L6+O9jIdSkTfZMnN4UDTuXl9HCNnA9uTm/V7H6kXq2048XY9LVjKUW7si2RL/r98kO
 jvZRYmCOtey8GE0yoh/jpkhHNX5qSVPRCZXvrm0pRWR3wKgLk008oAyOkdMDS0yDB0c0
 nPdZaUD0RQ3hDD5EVzFrS5oKShYVXgBKcClI2u9UEDUtP8xzteKE+N7KmBk4y2ikC+uD
 jdAYGKu3tQ3t8wEygzS/JRxuXT870eu1haa4XQu1akLc/o8dYDsFDWV9XhMmbEczdQRa
 Wr2KPx17Y6IfzoWwGszg1Xpj5QCYH+vKDHDNS6PzvTWPScr6h70ybhZdNE3Mb3i61Xs6
 96bg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVAlI08p14fvvCxHVrqYN5CZUeV4U+s3sdqn1ZfOXKgdp2QW3/2axkVJNxTk4K91BGcjlO5177GRKEB@nongnu.org
X-Gm-Message-State: AOJu0Yy/TNxl5Rt/owakxIGkI769bASJW3H0kk3FkPvBsB7+FmWFS6ZQ
 u8Iu9sa6Q8SqwdHw4SJkSLpAzBAMAWQkhVNIqMwavpG5wH0wBh3Jh6gEct7pq7jKXTp2wVTuinL
 uA8UjriJvzeafs370O15y2Nnk4iBAEo3B1+JL04lIt5lK92HPpOWL
X-Gm-Gg: ASbGncspNf10tZnokX6MLyzicAJGCVY/x9O1lLZKBnZ5YmLwIVg6xUZu+km3Ir3usHR
 ZqGYveDMhLzyL6HCWHe6EBbH06XJgwKmKzehH6AAOKSIgGxtUSimTxGFzhxG+m1o7/zpgVEwn2V
 H+Ea/f91mFz/lNimwkKC99aZ2JIN8mNFjt8rwHSuafzhhK2r7HJmSVEiveAFsB+01oWxnkMAVHR
 XENJgnqxLeLAlCtcq4WwmQRHZL1/pdBLRYTpfe4tZ4SCK372g1+4W4/7+Eryz/bIlXuiAp3lGNb
 sZP2LzK7Uuv1DRwxLBa4Y6oisJh8+PwW
X-Received: by 2002:a05:600c:6090:b0:43b:c95f:fd9 with SMTP id
 5b1f17b1804b1-442d6d18bfamr121218325e9.5.1747062007330; 
 Mon, 12 May 2025 08:00:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENnBzlU+YWO9pdg1Vj3hsTx2kvLvw+CHG1z5vAuqAHrGkAn/2pGCf8Z7HbzTYuwHLj+iYbzA==
X-Received: by 2002:a05:600c:6090:b0:43b:c95f:fd9 with SMTP id
 5b1f17b1804b1-442d6d18bfamr121217765e9.5.1747062006953; 
 Mon, 12 May 2025 08:00:06 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com ([85.93.96.130])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442cd3b7e26sm171495205e9.37.2025.05.12.08.00.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 May 2025 08:00:06 -0700 (PDT)
Date: Mon, 12 May 2025 17:00:02 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Zhao Liu <zhao1.liu@intel.com>
Cc: Xiaoyao Li <xiaoyao.li@intel.com>, Philippe =?UTF-8?B?TWF0aGlldS1EYXVk?=
 =?UTF-8?B?w6k=?= <philmd@linaro.org>, qemu-devel@nongnu.org, Richard
 Henderson <richard.henderson@linaro.org>, kvm@vger.kernel.org, Sergio Lopez
 <slp@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Laurent Vivier <lvivier@redhat.com>, Jiaxun
 Yang <jiaxun.yang@flygoat.com>, Yi Liu <yi.l.liu@intel.com>, "Michael S.
 Tsirkin" <mst@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, Daniel Henrique Barboza
 <dbarboza@ventanamicro.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-riscv@nongnu.org, Weiwei Li <liwei1518@gmail.com>, Amit Shah
 <amit@kernel.org>, Yanan Wang <wangyanan55@huawei.com>, Helge Deller
 <deller@gmx.de>, Palmer Dabbelt <palmer@dabbelt.com>, Ani Sinha
 <anisinha@redhat.com>, Fabiano Rosas <farosas@suse.de>, Paolo Bonzini
 <pbonzini@redhat.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?B?Q2zDqW1lbnQ=?= Mathieu--Drif <clement.mathieu--drif@eviden.com>,
 qemu-arm@nongnu.org, =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau
 <marcandre.lureau@redhat.com>, Huacai Chen <chenhuacai@kernel.org>, Jason
 Wang <jasowang@redhat.com>
Subject: Re: [PATCH v4 12/27] target/i386/cpu: Remove
 CPUX86State::enable_cpuid_0xb field
Message-ID: <20250512170002.635aa9fa@imammedo.users.ipa.redhat.com>
In-Reply-To: <aB2vjuT07EuO6JSQ@intel.com>
References: <20250508133550.81391-1-philmd@linaro.org>
 <20250508133550.81391-13-philmd@linaro.org>
 <23260c74-01ba-45bc-bf2f-b3e19c28ec8a@intel.com>
 <aB2vjuT07EuO6JSQ@intel.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: U74lqZfsvvsbMsgehYNHUhPFu4hYTfTpuVcZbYx3I9E_1747062007
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.551,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Fri, 9 May 2025 15:32:30 +0800
Zhao Liu <zhao1.liu@intel.com> wrote:

> On Fri, May 09, 2025 at 02:49:27PM +0800, Xiaoyao Li wrote:
> > Date: Fri, 9 May 2025 14:49:27 +0800
> > From: Xiaoyao Li <xiaoyao.li@intel.com>
> > Subject: Re: [PATCH v4 12/27] target/i386/cpu: Remove
> >  CPUX86State::enable_cpuid_0xb field
> >=20
> > On 5/8/2025 9:35 PM, Philippe Mathieu-Daud=C3=A9 wrote: =20
> > > The CPUX86State::enable_cpuid_0xb boolean was only disabled
> > > for the pc-q35-2.6 and pc-i440fx-2.6 machines, which got
> > > removed. Being now always %true, we can remove it and simplify
> > > cpu_x86_cpuid().
> > >=20
> > > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
...
> > > @@ -8828,7 +8823,6 @@ static const Property x86_cpu_properties[] =3D =
{
> > >       DEFINE_PROP_UINT64("ucode-rev", X86CPU, ucode_rev, 0),
> > >       DEFINE_PROP_BOOL("full-cpuid-auto-level", X86CPU, full_cpuid_au=
to_level, true),
> > >       DEFINE_PROP_STRING("hv-vendor-id", X86CPU, hyperv_vendor),
> > > -    DEFINE_PROP_BOOL("cpuid-0xb", X86CPU, enable_cpuid_0xb, true), =
=20
...

> @Philippe, thank you for cleaning up this case! I think we can keep this
> property, and if you don't mind, I can modify its comment later to
> indicate that it's used to adjust the topology support for the CPU.

+1, we should not delete this without due process (aka deprecation).
So perhaps deprecate now and remove in couple of releases=20


