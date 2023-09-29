Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7352E732D0
	for <qemu-riscv@archiver.kernel.org>; Fri, 29 Sep 2023 10:10:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qmAS9-000459-3i; Fri, 29 Sep 2023 06:10:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1qmAS6-00043c-It
 for qemu-riscv@nongnu.org; Fri, 29 Sep 2023 06:10:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1qmAS3-0007WX-Rb
 for qemu-riscv@nongnu.org; Fri, 29 Sep 2023 06:10:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695982227;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AmW8J85dENOAgEDN98oOAMNFnCixUejLydCPc+GbG3c=;
 b=az1SLx4T5eKYFJB5vSjWsl/ZLXZ1g3o5mXxuSZQFkTKFoGyxWTav38B9+1f+5G1R6Ve6WG
 R9unklUisWewetffpP0cKKARBT5fn7AbKdadieKy2LdyvarNO2BIIT+WqXedV71e3hV3eU
 3igk0GevPBV+PHeY7G3vT4H3MnoNGko=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-284-puLuAOlZMn20C1I5u1Ykww-1; Fri, 29 Sep 2023 06:10:24 -0400
X-MC-Unique: puLuAOlZMn20C1I5u1Ykww-1
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-775751c3463so671056685a.2
 for <qemu-riscv@nongnu.org>; Fri, 29 Sep 2023 03:10:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695982223; x=1696587023;
 h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AmW8J85dENOAgEDN98oOAMNFnCixUejLydCPc+GbG3c=;
 b=vWvNd/AWjJBfX9WdZSegM4qfSr32vKYg/1mD1YxIwwHXcR4rGJgQLP22/lvgpMexsf
 ND5ydckC+uslWU7e6v5MxcjCE7NTHyw3rysC5n9cWxrNBmkQc0qsqpi7R82nK4m3t+tf
 Imz9RMUlAfTN/rOyqJLNc51XvMbfv3bKYFZPBdDvnyc7XJjqU1pbu7slWB+XtWPO3NlI
 C0/T+6boncv4lP9+uBZSGT3uHzke9R/EMgn/I+ZJ8CiCpZVlj7o8m6GY5yumpKmsRpe2
 qe/M6AaRXNsPuHqGW6gHdO9BEynJZQ4dySaWE4YX/8UiEeAWaFSlw18DcO7CT5bCSfbf
 0qSA==
X-Gm-Message-State: AOJu0YwzIC684lQXx8cgINJGNCxrfkd4f8GR5YLUj8FSPRRhEX/l0Uk7
 9hE6gRDlvHDZzY0D3DMeB5YI94oY2rwR5eTcjLAvdNuVgDM6rBlWn6ZDPpdcHwTYzP6PXGAzYrb
 mYLPXC0Xkg0ymI3ZP4CeCUEmctejQoD4=
X-Received: by 2002:ac8:5c15:0:b0:417:974f:5619 with SMTP id
 i21-20020ac85c15000000b00417974f5619mr3925862qti.68.1695982223518; 
 Fri, 29 Sep 2023 03:10:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMqtlgfRoQb+JKnv7VH1zy/ZAkYDdiQ+eTWqfyJRTVDSty4jVOK2Kw8mNQE4NmAP1E1wRtqpR6w/D31D0p0qU=
X-Received: by 2002:ac8:5c15:0:b0:417:974f:5619 with SMTP id
 i21-20020ac85c15000000b00417974f5619mr3925848qti.68.1695982223218; Fri, 29
 Sep 2023 03:10:23 -0700 (PDT)
Received: from 744723338238 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 29 Sep 2023 03:10:22 -0700
From: Andrea Bolognani <abologna@redhat.com>
References: <20230926194951.183767-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20230926194951.183767-1-dbarboza@ventanamicro.com>
Date: Fri, 29 Sep 2023 03:10:22 -0700
Message-ID: <CABJz62N_czR3BneV0iqxMfce_V0V7zVvyAe-r62cOsT13-mCrQ@mail.gmail.com>
Subject: Re: [PATCH 0/6] riscv: RVA22U64 profile support
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=abologna@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Wouldn't it make more sense to error out when this is requested?

Silently ignoring an explicit request made by the user is pretty much
never a good idea in my experience.

-- 
Andrea Bolognani / Red Hat / Virtualization


