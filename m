Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mbIfK-00065m-6V
	for mharc-qemu-riscv@gnu.org; Fri, 15 Oct 2021 04:34:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mbIfI-00061M-Np
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 04:34:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41264)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mbIfF-0008Gn-KG
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 04:34:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634286845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TYrMW4J2GLrUnZ2qu0QF95C2NwS5VrQGpSyTnUJImo0=;
 b=P44sNLP+eiDYT4r6mJkLsNEM/AsUKOdzktKQgOxJzJXdcpg6mp6vzCwEcek9jll5VRZ8ug
 UXUhmYNb3OYr/D1TXa9Be5s0RFfS6p/UT5dkxI7l/PHb2d3uHoLOZD2O7KgujihFVXKQvS
 ogiUpJF4MyZ4gpwAKI2GdTJ0qAf+iFc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-324--zdrS_b8M2eoJH69QW51MA-1; Fri, 15 Oct 2021 04:34:03 -0400
X-MC-Unique: -zdrS_b8M2eoJH69QW51MA-1
Received: by mail-wr1-f71.google.com with SMTP id
 r16-20020adfbb10000000b00160958ed8acso5632152wrg.16
 for <qemu-riscv@nongnu.org>; Fri, 15 Oct 2021 01:34:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TYrMW4J2GLrUnZ2qu0QF95C2NwS5VrQGpSyTnUJImo0=;
 b=ldvV0WkhnD7YKR7XBNmPpiMDl15jjiJzKX0FyE/3qeg9/GPqUjuFM+bTDXWVVtYDmz
 IWuSMmlhxY3oqv9/H57yWxTs4/9XPFO4v58N3oWDUsEPhG678ddArNBFrMgxbqLwVH8+
 n79vWtEPh0d2hg5VIMlBgxckPJe62N4CcIlRpsr3nCHp9aNJqSPtaXYkasrxEaEigC3q
 ifKBBsM3R/B3jGrBFtlFOo/Xik7nKZetMrgug2Actq3LAkXobpnADemyIfzpPWzx1kRD
 9nlIMWrC+P1rQpTeLZBLcqpjlR4w7/1AuYACTXm1R3vP4TTuBDkXeywuUc9qm0Z+/oi0
 6/RQ==
X-Gm-Message-State: AOAM531/Rs748PHiDaDKuwFGJbhdcT5hAhSXE7HTaQbp0dkLSU4p9pG2
 Wpowhe7x3EjM/vEyL4QpzowXEMOaG7y7dFJYr/ydIx3fkaQM2CoKJFgEMf+ph3arYfSVX4HWF8Q
 xlpEnzXjPdikkGAk=
X-Received: by 2002:a05:600c:2041:: with SMTP id
 p1mr11035387wmg.145.1634286842171; 
 Fri, 15 Oct 2021 01:34:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx/VYVj65MZ4QsG97incAvV8T0qrQrB8urp0I3FiJ3FcgxINAYcqV0GJFFbmxu1sr/5v9bT7g==
X-Received: by 2002:a05:600c:2041:: with SMTP id
 p1mr11035355wmg.145.1634286841896; 
 Fri, 15 Oct 2021 01:34:01 -0700 (PDT)
Received: from gator (nat-pool-brq-u.redhat.com. [213.175.37.12])
 by smtp.gmail.com with ESMTPSA id p7sm3403504wrm.61.2021.10.15.01.34.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 01:34:01 -0700 (PDT)
Date: Fri, 15 Oct 2021 10:33:59 +0200
From: Andrew Jones <drjones@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>, peter.maydell@linaro.org,
 ehabkost@redhat.com, robh@kernel.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, shan.gavin@gmail.com, qemu-riscv@nongnu.org
Subject: Re: [PATCH v3 1/2] numa: Require distance map when empty node exists
Message-ID: <20211015083359.j5t2xt7cfdjqbzlm@gator>
References: <20211013045805.192165-1-gshan@redhat.com>
 <20211013045805.192165-2-gshan@redhat.com>
 <20211013133011.62b8812d@redhat.com>
 <20211013113544.4xrfagduw4nlbvou@gator.home>
 <20211013135346.3a8f6c9a@redhat.com>
 <20211013121125.sdewyrxcipsi3o22@gator.home>
 <20211013122840.fi4ufle4czyzegtb@gator.home>
 <20211014171417.541c9bee@redhat.com>
 <20211014153609.pzndx7um3dfdgelo@gator>
 <2399ce27-0663-6780-5453-3ee773563352@redhat.com>
MIME-Version: 1.0
In-Reply-To: <2399ce27-0663-6780-5453-3ee773563352@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 15 Oct 2021 08:34:09 -0000

On Fri, Oct 15, 2021 at 07:22:05PM +1100, Gavin Shan wrote:
> It's possible that the empty NUMA nodes aren't referred by any CPUs,
> as the following command line indicate. In this case, the empty NUMA
> node IDs aren't existing in device-tree CPU nodes. So we still need
> the distance-map.

Ah, indeed.

> 
> However, I would like to drop this (PATCH[01/02]) in v4. The memory
> hotplug through device-tree on ARM64 isn't existing. We might have
> alternative ways to present the empty NUMA nodes when it's supported,
> or we needn't it for ever because ACPI is enough to support the
> memory hotplug.

Agreed. Please update the commit message of 2/2 for v4 and also add
a comment above the new code with the rationale for dropping those
memory nodes.

Thanks,
drew


