Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34764CA1016
	for <qemu-riscv@archiver.kernel.org>; Mon,  8 Sep 2025 14:47:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uvd8k-00017P-15; Mon, 08 Sep 2025 10:46:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1uvd8D-0000dq-St
 for qemu-riscv@nongnu.org; Mon, 08 Sep 2025 10:46:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1uvd82-0004Oo-3i
 for qemu-riscv@nongnu.org; Mon, 08 Sep 2025 10:46:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1757342753;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=430zy+NmoraJe6H6S/wzGVhUyCf6a1S+6O2Yb0w2HfY=;
 b=dmgQRp3sj0hPG6T07bdvb6/dcFwXbNGtmQlbpb7dkicNfu9WOyRSrfbxkd4XRt7XuxLqzk
 pFU0LrfmZsUSZrbxZdb039ZojCikUPx1VrbD1SgXxGCfkQs8nAAQsp/vW19bL9jNnzN8UU
 tJITo6ha+nJCIUCM7axB1eOaT30mKKU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-16-bCqWDyW6OW64Qgij3FqVSQ-1; Mon, 08 Sep 2025 10:45:49 -0400
X-MC-Unique: bCqWDyW6OW64Qgij3FqVSQ-1
X-Mimecast-MFC-AGG-ID: bCqWDyW6OW64Qgij3FqVSQ_1757342745
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-45dd66e1971so29983915e9.2
 for <qemu-riscv@nongnu.org>; Mon, 08 Sep 2025 07:45:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757342745; x=1757947545;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=430zy+NmoraJe6H6S/wzGVhUyCf6a1S+6O2Yb0w2HfY=;
 b=mD0YuFJkPopBMtjoixK70ATnl+23zo/TVSYnU9N3hTdEI3ly5kXul/XPltoLey4wiE
 jdxEFMOFQ9xACCqnKTGujNmUMDNOYrlgTUNhil2t1iUWBptF+RSdaN9nTBmsrpCh1xG7
 HV6HFk1XDiozMaopkwfle1CrW6yEPFgXc4QuNqzixi9h6NGhA/9RGDWO0GtrfJKHweGO
 MgsxAw2ZcDyaXUe7v5dXDtmMDM9+uVsbD8xevneuTT+bpEaUMx3C0zhafUhwAbGBY3eR
 MZ0w4kcFNZvL46bnsIHOV9Gir+COfMWxgnvxiNO1gmZil0wZp/nKYlszLMvx3QRWJA+t
 zUDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBGqlDhJqbR3BASVTRSksQ9RNLOETE4r7hUAkJWwB0veGULUD4s98r+mH/4VdSzgcf0eb1eG1NEB+k@nongnu.org
X-Gm-Message-State: AOJu0YxdZYj18gEC1GnQiqVPaZBXm15zoua15e8aBvK8y1J5aDOtkNHG
 7JeXmeaky470hbIoyY0NeEhXAUHu1/eVXG8bCEcu0r2AAc7nzIAyWQ0Dr/sx2lDr9l72bf2j+sp
 d/NyyO9VV92ospDGLFob2hfM1d997z4i/8ujj3A06HgPAeVnExBCoLO0X
X-Gm-Gg: ASbGncsumZGD/nQMQCs81UP6pP5FHA9rEUCnwljWFjkHP8ENgiKpcw0xDouuXyRrIkf
 gi+M0EJcfOaa10th8jN/9eJ+2YmU0wTXlZWuT6x/3n1tzth+5qxns9hGwfC3z2MP7W3T2BjzYTr
 LiMc7DP7WeJMboecOn2qLL/pu1qKZtB5QzFzpRuCBtaFlhbmG2+Pl8Dm77ER4wxX5Vtk1CNeCRf
 XbBNBFGm+wr4EMwzLv50+4dRv4GuyjD6iUgYfQ9GhpANYUT6SehCUDo4hooTTubK3TYMSairreJ
 Zm68FKMnwlnax5VfnGm1PBfT2dHO5gl4
X-Received: by 2002:a05:600c:5248:b0:45b:6b57:5308 with SMTP id
 5b1f17b1804b1-45de078401dmr69109815e9.7.1757342745294; 
 Mon, 08 Sep 2025 07:45:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGnDeQpB8Qcm1WhQeZWrgb4Db5QcsuNLbfehqzrlIyGP8NxFYWRiMrcQBNcIh+qTnr7Lnhjww==
X-Received: by 2002:a05:600c:5248:b0:45b:6b57:5308 with SMTP id
 5b1f17b1804b1-45de078401dmr69109375e9.7.1757342744795; 
 Mon, 08 Sep 2025 07:45:44 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1536:c800:2952:74e:d261:8021])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3e543e9f444sm10130705f8f.60.2025.09.08.07.45.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Sep 2025 07:45:44 -0700 (PDT)
Date: Mon, 8 Sep 2025 10:45:40 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>, Thomas Huth <thuth@redhat.com>,
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
Message-ID: <20250908104125-mutt-send-email-mst@kernel.org>
References: <20250908125058.220973-1-peter.maydell@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20250908125058.220973-1-peter.maydell@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Rdx8c0OILLQIMUV5zfHAPTd67kT3klbVHOSOBmkQwis_1757342745
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
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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

On Mon, Sep 08, 2025 at 01:50:57PM +0100, Peter Maydell wrote:
> Currently our security policy defines a "virtualization use case"
> where we consider bugs to be security issues, and a
> "non-virtualization use case" where we do not make any security
> guarantees and don't consider bugs to be security issues.
> 
> The rationale for this split is that much code in QEMU is older and
> was not written with malicious guests in mind, and we don't have the
> resources to audit, fix and defend it.  So instead we inform users
> about what the can in practice rely on as a security barrier, and
> what they can't.
> 
> We don't currently restrict the "virtualization use case" to any
> particular set of machine types.  This means that we have effectively
> barred ourselves from adding KVM support to any machine type that we
> don't want to put into the "bugs are security issues" category, even
> if it would be useful for users to be able to get better performance
> with a trusted guest by enabling KVM. This seems an unnecessary
> restriction, and in practice the set of machine types it makes
> sense to use for untrusted-guest virtualization is quite small.
> 
> Specifically, we would like to be able to enable the use of
> KVM with the imx8 development board machine types, but we don't
> want to commit ourselves to having to support those SoC models
> and device models as part of QEMU's security boundary:
> https://lore.kernel.org/qemu-devel/20250629204851.1778-3-shentey@gmail.com/
> 
> This patch updates the security policy to explicitly list the
> machine types we consider to be useful for the "virtualization
> use case".

This use-case sounds reasonable to me. I also imagine that
some machines can get fixed down the road perhaps to
the point where they enter the "virtualization use case".

However, since we are
getting this elaborate, would my old idea of a runtime flag
make sense now?

To recap, the idea was to add a "-virt" flag that will
block any machines, devices and so on not considered
part of the "virtualization use case".

We could also create a mechanism for downstreams to
tweak this as they see fit.




> This is an RFC partly to see if we have consensus that this change
> makes sense, and partly because I was only able to identify the
> machine types we want to cover for some of our target architectures.
> If maintainers for the other architectures could clarify which
> machine types work with KVM that would be helpful.
> 
> Notes on the listed machine types:
> 
> architectures I'm pretty sure about:
> 
> aarch64:
>  -- virt is definitely the only supported one
> s390x:
>  -- s390-ccw-virtio is the only machine type for this architecture
> loongarch64:
>  -- virt is the only machine type for this architecture
> 
> architectures where I've made a guess:
> 
> i386, x86_64:
>  -- I have assumed that all machine types except the "experimental"
>     x-remote are supported
> 
> architectures I don't know:
> 
> mips, mips64
> riscv32, riscv64
> ppc, ppc64
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  docs/system/security.rst | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/docs/system/security.rst b/docs/system/security.rst
> index f2092c8768b..395c2d7fb88 100644
> --- a/docs/system/security.rst
> +++ b/docs/system/security.rst
> @@ -35,6 +35,34 @@ malicious:
>  Bugs affecting these entities are evaluated on whether they can cause damage in
>  real-world use cases and treated as security bugs if this is the case.
>  
> +To be covered by this security support policy you must:
> +
> +- use a virtualization accelerator like KVM or HVF
> +- use one of the machine types listed below
> +
> +It may be possible to use other machine types with a virtualization
> +accelerator to provide improved performance with a trusted guest
> +workload, but any machine type not listed here should not be
> +considered to be providing guest isolation or security guarantees,
> +and falls under the "non-virtualization use case".
> +
> +Supported machine types for the virtualization use case, by target architecture:
> +
> +aarch64
> +  ``virt``
> +i386, x86_64
> +  ``microvm``, ``xenfv``, ``xenpv``, ``xenpvh``, ``pc``, ``q35``, ``isapc``
> +s390x
> +  ``s390-ccw-virtio``
> +loongarch64:
> +  ``virt``
> +ppc, ppc64:
> +  TODO
> +mips, mips64:
> +  TODO
> +riscv32, riscv64:
> +  TODO
> +
>  Non-virtualization Use Case
>  '''''''''''''''''''''''''''
>  
> -- 
> 2.43.0


