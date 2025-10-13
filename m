Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ABB9CCD183
	for <qemu-riscv@archiver.kernel.org>; Mon, 13 Oct 2025 11:13:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v8GTr-0001lk-TY; Mon, 13 Oct 2025 07:12:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1v8GTq-0001jJ-LL
 for qemu-riscv@nongnu.org; Mon, 13 Oct 2025 07:12:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1v8GTn-0003ZM-Nf
 for qemu-riscv@nongnu.org; Mon, 13 Oct 2025 07:12:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1760353958;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SkvD9ZJibmBuuFK9XF3GElQxG6YTjDfKWTYYd77qIO4=;
 b=jDE9AJYSRXzCfCCbRVRt1blpnOna9fUG8noAMLITUPGE+AgdqUsEdS+42e67fStUrUZ3WF
 l1h0U1xu+708WLbbvUmdIRsjh70zVLHKJ+8fnpXwqF2g0VriOolDNaIfHPWzmiJjx4rB6N
 Ov6ZwR65RBIjwHh6aluPJvnhwJNAVsc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-38-KEv-VLanN_-4GaH_1IsRvw-1; Mon, 13 Oct 2025 07:12:37 -0400
X-MC-Unique: KEv-VLanN_-4GaH_1IsRvw-1
X-Mimecast-MFC-AGG-ID: KEv-VLanN_-4GaH_1IsRvw_1760353956
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-46e3d43bbc7so25424245e9.2
 for <qemu-riscv@nongnu.org>; Mon, 13 Oct 2025 04:12:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760353956; x=1760958756;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SkvD9ZJibmBuuFK9XF3GElQxG6YTjDfKWTYYd77qIO4=;
 b=JP+Z4n/3tw7ZHr0apfW8DPpnPA4S6cha2BtZ1AU1OX8RyJrKMJO4c3E/hXkXOD2QdB
 3opRuXMkkUyeOVThJsbfqBO4iwSlvE9TR6GeSYdLFh9ctiu3U2hPS5dVoyjTJiPU1tG+
 uXajz6mNSnruOqoM2aWQXaYz9fspiQhcNyoHFGnLKPH4PhNuv2AiFhTCwZj/dLyl826t
 XWAF17iwYJvpVIgZJQBsudxvyxmVaMhbXfervx2YpLelDKVx3bnPa2sq3YJtPpTXaOT4
 7eKDl3DoT0mBrh7gaGmu4IN0/GLUN+30Q8Gp1Oi63TK4wYVE4kHl8+Ad53X0LUre75lF
 Lwsg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUT245OjFjKc9HV5ahG7QdHrsJaV/63//ra8dXW8yGXug8wdz/edQWkeURodmI3gRKwc7EWNKw2/60j@nongnu.org
X-Gm-Message-State: AOJu0Yw8f3/Xz6Tx1RkfFF52fgHlx/IDkLdgsLga6XihIQ2ql5PRKsPw
 PEEEH153uNAUzw99yR4354hLft6t7bIbjLyLGIJToxqTsS1VnP2UGuAerIc/tVqrkIx9sFPr3uo
 V8UZS2JrusabQNojih5yFEzvOjsebJXs5WzhEH1TWIhjqSc2qmJ7P3rWM
X-Gm-Gg: ASbGncthL5Dtydq5fRq6lHlSCEp4GqnfPg6bjXLYfU5P4V/amIRuJ0lypwW1HSw81YG
 yCYrrLLaykUFbcfxYvxqiushVxqC85Q057tS+143E0uLleluirOVQ5ohutWHadyp3Wx624MqT42
 AwKt7HkbbonZsks91qI2TZ4KAuhYEsvFY1v2h7O6XCTmmG/gQn0qM5APLUYuH96fPGO/qswTF1v
 u4WoxSjB+Emr5SlUWjOafQHsT7S4wRQWGhwAs7I6SGIrqNPRo6Y5lUMan58dcycSK9cSazNRW0D
 SthUEUYmkf0WSD2GmHaFyhtRGQu22F1UCw==
X-Received: by 2002:a05:600d:41f2:b0:46e:456e:ada5 with SMTP id
 5b1f17b1804b1-46fa9b01934mr152651585e9.28.1760353955663; 
 Mon, 13 Oct 2025 04:12:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHN42XRGhYWcZkFoSpXSwxNR23lcFXkckjRIrfz5BwRuRRNrn1VVzYpsWxLj/A4cN25zVaf0w==
X-Received: by 2002:a05:600d:41f2:b0:46e:456e:ada5 with SMTP id
 5b1f17b1804b1-46fa9b01934mr152651285e9.28.1760353955129; 
 Mon, 13 Oct 2025 04:12:35 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:152d:b200:2a90:8f13:7c1e:f479])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fb49d0307sm179508875e9.18.2025.10.13.04.12.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Oct 2025 04:12:34 -0700 (PDT)
Date: Mon, 13 Oct 2025 07:12:31 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Bernhard Beschow <shentey@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, Huacai Chen <chenhuacai@kernel.org>,
 qemu-s390x@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Song Gao <gaosong@loongson.cn>, Bibo Mao <maobibo@loongson.cn>
Subject: Re: [RFC PATCH] docs/system/security: Restrict "virtualization use
 case" to specific machines
Message-ID: <20251013070945-mutt-send-email-mst@kernel.org>
References: <20250908125058.220973-1-peter.maydell@linaro.org>
 <20250908104125-mutt-send-email-mst@kernel.org>
 <46AA9C03-CA7E-4C4B-AD05-A9053666BA52@gmail.com>
MIME-Version: 1.0
In-Reply-To: <46AA9C03-CA7E-4C4B-AD05-A9053666BA52@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2RUZLa9HHpEYOf2gHcExhRywr6VFrZrDSC8xEkpJovk_1760353956
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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

On Mon, Oct 13, 2025 at 10:40:36AM +0000, Bernhard Beschow wrote:
> 
> 
> Am 8. September 2025 14:45:40 UTC schrieb "Michael S. Tsirkin" <mst@redhat.com>:
> >On Mon, Sep 08, 2025 at 01:50:57PM +0100, Peter Maydell wrote:
> >> Currently our security policy defines a "virtualization use case"
> >> where we consider bugs to be security issues, and a
> >> "non-virtualization use case" where we do not make any security
> >> guarantees and don't consider bugs to be security issues.
> >> 
> >> The rationale for this split is that much code in QEMU is older and
> >> was not written with malicious guests in mind, and we don't have the
> >> resources to audit, fix and defend it.  So instead we inform users
> >> about what the can in practice rely on as a security barrier, and
> >> what they can't.
> >> 
> >> We don't currently restrict the "virtualization use case" to any
> >> particular set of machine types.  This means that we have effectively
> >> barred ourselves from adding KVM support to any machine type that we
> >> don't want to put into the "bugs are security issues" category, even
> >> if it would be useful for users to be able to get better performance
> >> with a trusted guest by enabling KVM. This seems an unnecessary
> >> restriction, and in practice the set of machine types it makes
> >> sense to use for untrusted-guest virtualization is quite small.
> >> 
> >> Specifically, we would like to be able to enable the use of
> >> KVM with the imx8 development board machine types, but we don't
> >> want to commit ourselves to having to support those SoC models
> >> and device models as part of QEMU's security boundary:
> >> https://lore.kernel.org/qemu-devel/20250629204851.1778-3-shentey@gmail.com/
> >> 
> >> This patch updates the security policy to explicitly list the
> >> machine types we consider to be useful for the "virtualization
> >> use case".
> >
> >This use-case sounds reasonable to me. I also imagine that
> >some machines can get fixed down the road perhaps to
> >the point where they enter the "virtualization use case".
> >
> >However, since we are
> >getting this elaborate, would my old idea of a runtime flag
> >make sense now?
> >
> >To recap, the idea was to add a "-virt" flag that will
> >block any machines, devices and so on not considered
> >part of the "virtualization use case".
> >
> >We could also create a mechanism for downstreams to
> >tweak this as they see fit.
> 
> Hi Michael,
> 
> Thanks for confirming that the use case seems reasonable.
> 
> For now, we'd like to sharpen the term "virtualization use case" to allow for KVM to be usable in machines that aren't inside the security boundary and where maintenance commitment is unrealistic. The current approach is to adjust the policy and to spell out the machines where these commitments are made.
> 
> The trigger for this RFC was to be able to add KVM support to the imx8mp-evk machine. I have it working but can't currently upstream it due to our policy. It asks for unreasonable work and commitment which adds an unjustifyable burden on the maintainers.
> 
> I do see a need for further enhancements on the broader topic like adding a -virt switch etc. Maybe we should come up with a different term than "virtualization use case" which appears to leave a lot of room for interpretation. I propose these topics to be addressed separately.
> 
> What is missing for your R-b?
> 
> Thanks,
> Bernhard

rebase on top of this:
https://lore.kernel.org/all/20250926140144.1998694-1-berrange@redhat.com

if there's anything missing there, add it.


> >
> >
> >
> >
> >> This is an RFC partly to see if we have consensus that this change
> >> makes sense, and partly because I was only able to identify the
> >> machine types we want to cover for some of our target architectures.
> >> If maintainers for the other architectures could clarify which
> >> machine types work with KVM that would be helpful.
> >> 
> >> Notes on the listed machine types:
> >> 
> >> architectures I'm pretty sure about:
> >> 
> >> aarch64:
> >>  -- virt is definitely the only supported one
> >> s390x:
> >>  -- s390-ccw-virtio is the only machine type for this architecture
> >> loongarch64:
> >>  -- virt is the only machine type for this architecture
> >> 
> >> architectures where I've made a guess:
> >> 
> >> i386, x86_64:
> >>  -- I have assumed that all machine types except the "experimental"
> >>     x-remote are supported
> >> 
> >> architectures I don't know:
> >> 
> >> mips, mips64
> >> riscv32, riscv64
> >> ppc, ppc64
> >> 
> >> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> >> ---
> >>  docs/system/security.rst | 28 ++++++++++++++++++++++++++++
> >>  1 file changed, 28 insertions(+)
> >> 
> >> diff --git a/docs/system/security.rst b/docs/system/security.rst
> >> index f2092c8768b..395c2d7fb88 100644
> >> --- a/docs/system/security.rst
> >> +++ b/docs/system/security.rst
> >> @@ -35,6 +35,34 @@ malicious:
> >>  Bugs affecting these entities are evaluated on whether they can cause damage in
> >>  real-world use cases and treated as security bugs if this is the case.
> >>  
> >> +To be covered by this security support policy you must:
> >> +
> >> +- use a virtualization accelerator like KVM or HVF
> >> +- use one of the machine types listed below
> >> +
> >> +It may be possible to use other machine types with a virtualization
> >> +accelerator to provide improved performance with a trusted guest
> >> +workload, but any machine type not listed here should not be
> >> +considered to be providing guest isolation or security guarantees,
> >> +and falls under the "non-virtualization use case".
> >> +
> >> +Supported machine types for the virtualization use case, by target architecture:
> >> +
> >> +aarch64
> >> +  ``virt``
> >> +i386, x86_64
> >> +  ``microvm``, ``xenfv``, ``xenpv``, ``xenpvh``, ``pc``, ``q35``, ``isapc``
> >> +s390x
> >> +  ``s390-ccw-virtio``
> >> +loongarch64:
> >> +  ``virt``
> >> +ppc, ppc64:
> >> +  TODO
> >> +mips, mips64:
> >> +  TODO
> >> +riscv32, riscv64:
> >> +  TODO
> >> +
> >>  Non-virtualization Use Case
> >>  '''''''''''''''''''''''''''
> >>  
> >> -- 
> >> 2.43.0
> >


