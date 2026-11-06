Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D5D9606A339
	for <qemu-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 14:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LCC3GsFj
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xPL2x-0007S0-VJ; Fri, 06 Nov 2026 09:36:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1xPL2m-0007PV-GW
 for qemu-riscv@nongnu.org; Fri, 06 Nov 2026 09:35:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1xPL2h-0000Qh-Io
 for qemu-riscv@nongnu.org; Fri, 06 Nov 2026 09:35:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1793975746;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OEU1FFl9p8QKFt3KoXpoGyAibRKo7aP0DPJXAUN0p44=;
 b=LCC3GsFjIGpmXgb8dVi1UdmRfeO2dpvyoCPTFEcMNAZLzW5i7e1mWe/s2O+WWest4+iT6a
 yJSlB1xSUsexNEKdjh5PCjg+9iuZrwQPgOkJt327gqdXuwtkIqjC1uPGbOmxgFhBvP2RZw
 tYrS51+ibwJHxSJk7byEi+z1Yn+eniY=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-300-NPvFRrJDPMKEJvZb6p6ERw-1; Fri, 06 Nov 2026 09:35:43 -0500
X-MC-Unique: NPvFRrJDPMKEJvZb6p6ERw-1
X-Mimecast-MFC-AGG-ID: NPvFRrJDPMKEJvZb6p6ERw_1793975742
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-3b0a13ae043so1058763a91.0
 for <qemu-riscv@nongnu.org>; Fri, 06 Nov 2026 06:35:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793975741; x=1794580541;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=OEU1FFl9p8QKFt3KoXpoGyAibRKo7aP0DPJXAUN0p44=;
 b=12qLRyYGyGdnR2AL0DkPFZR8Uwu0a8RumGUy112a90P3dmIKN6h1zSUuw+X0YdeapW
 wyIEV+BihPF2t6LecFUoCwd727IQtjpa8JMSbWwJSAk8tU8Yz0HKIDpd42QVcXxVqw99
 ckbjUgh2dLA+tMN5rNSDAifJe3ZK7i446klNoA2jJediZuHpyXolh8FaUq2eEf4sJv+W
 d8lQviYQ3QmHE1Z3JphCyaS3fvyqU1uUxqSWCG2tXsEwhl4jX1GdMpK6uK/M+uvtfmn2
 64jjWQE4rzwXXB1h9lG5YFs+nEOY17G5KNxC0CWJh5nBj6A9qNHbyI0nN9sK9HZPpw28
 k5nQ==
X-Forwarded-Encrypted: i=1;
 AL+hErEO9klGiRYbedtXy0hck2ljgoy2UTCqztuu9IwglWPoCXAeFxBx8v35hjgg1FJ3mGMuZ30tTC1oQsGa@nongnu.org
X-Gm-Message-State: APuU4Z9GCOr4rfsBjfPVl5MKHiu69mK3tDqS1ZnPURLL4wAP2Grw4ZnI
 2wmDjKudbC7R6SEOhRNw0/VbUG6pbBPi/Q+N9oqlXSXtOj8MSwlWFpGtmXCiElOIzsl0d7Z/0aq
 qgpWE/pCaTKxAz8NN5RkJrKsdZQkwx+NyN2cTvxp0fsFONdn4Vj8iPDcZSfGIwWL/QUa8aLNFQO
 w//6L0/ypLe+qahr9PDBJR/IFiaYaq1ko=
X-Gm-Gg: AYBFou1PbDNXvusBADZWvmoZ+Kae+/oalJfVsVPlze2LgPpIxSVuy4w7EKRB2r9CBty
 8DOJxzgVsSL5J9ZBxMQgLIrt8yazJ7zpnEIZa8AAroEoJhlp1j8UN4IXRS0WUEa+HaL6Ataa5HT
 lu2NgFGgd8Mn7aVpJD751Q9sa8X1U5VauOgTqufI2Bmg/5s7ZKiFV73Iag++cg4/QV/v3pgze4S
 dsd6WeFG4fYSqEi64e9WX31JrtPSuCZxns5oLTFB98FJt1TBXASWXcHfWuZdA+oz4hNG9/KbaYh
 lA==
X-Received: by 2002:a17:90b:3804:b0:3ad:b7d1:8631 with SMTP id
 98e67ed59e1d1-3b0db6bb484mr2733940a91.17.1793975741418; 
 Fri, 06 Nov 2026 06:35:41 -0800 (PST)
X-Received: by 2002:a17:90b:3804:b0:3ad:b7d1:8631 with SMTP id
 98e67ed59e1d1-3b0db6bb484mr2733912a91.17.1793975740880; Fri, 06 Nov 2026
 06:35:40 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261029131241.2275706-1-berrange@redhat.com>
 <20261029131241.2275706-5-berrange@redhat.com>
 <fe7f7d29-8ca3-4ced-afcc-c768b84c4888@redhat.com>
In-Reply-To: <fe7f7d29-8ca3-4ced-afcc-c768b84c4888@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Fri, 6 Nov 2026 18:35:29 +0400
X-Gm-Features: AclHuK9FADW3osoyNv3LUIVQ7f8FSa2MdA_3foOulSE_SWW0ekbzYnV7KFEDPMc
Message-ID: <CAMxuvazfhfGSZCiSi+viwJ7f7XDWAZfjmW39n3a7a-qQyw-YSA@mail.gmail.com>
Subject: Re: [PATCH v2 04/28] hw: mark all remaining virtio object types as
 secure
To: Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hYhX2ROIK-D2UWkiplDvb9suAJZxF0NjQu1CSL5rMdk_1793975742
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi

On Fri, Nov 6, 2026 at 3:53=E2=80=AFPM Thomas Huth <thuth@redhat.com> wrote=
:
>
> On 29/10/2026 14.12, Daniel P. Berrang=C3=A9 wrote:
> > These are all intended for use in a virtualization scenario and must
> > provide a security boundary.
> >
> > Acked-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> > ---
> Reviewed-by: Thomas Huth <thuth@redhat.com>
>

I have a second thought about this, I'd like to exclude all
gpu-accelerated paths for now. virgl/mesa/rutabaga expose a very large
attack surface, so I'd like to drop them from the secure boundary

thanks


