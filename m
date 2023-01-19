Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pIRJM-00089Q-Vy
	for mharc-qemu-riscv@gnu.org; Thu, 19 Jan 2023 04:34:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pIRJI-00088O-1J
 for qemu-riscv@nongnu.org; Thu, 19 Jan 2023 04:34:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pIRJF-0007ru-A2
 for qemu-riscv@nongnu.org; Thu, 19 Jan 2023 04:34:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674120852;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oZLLlV4BGDvm510wcGYESS9p0wICXiApD4Uvqj34INw=;
 b=BTBPDPTD/oFp3q0wCEAR/SB5dXC5pa9Lu0kqF5wp8ykUElexGDbKqMVIzbIfTsER52LJHK
 MmaO26gqyi77R0jhtWfDRXFufm94iW7bnDIjzcf1wHBo337qqffwg9k7R2eGDVaORe3HQp
 4UKwUTk1X+QQ6PVitxR/zbWaInTmnUI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-277-hYanFtl0P-u2wFDLYUFNiw-1; Thu, 19 Jan 2023 04:34:11 -0500
X-MC-Unique: hYanFtl0P-u2wFDLYUFNiw-1
Received: by mail-wm1-f71.google.com with SMTP id
 z22-20020a05600c0a1600b003db00dc4b69so2662079wmp.5
 for <qemu-riscv@nongnu.org>; Thu, 19 Jan 2023 01:34:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oZLLlV4BGDvm510wcGYESS9p0wICXiApD4Uvqj34INw=;
 b=qN3cv66a5hIoMn5Xe70+8sjP3ZUd5n3DC5u2oKCCvGawCqes6oFNJ5ry4UBuHUumzm
 FEAngwLBY5dJoPUTadZ4VfMqN4POQ5LRHQMSGAmK0UDai8XVHzlo8+eZ0mldlYfY2eM0
 wISrzipoNJlEHS5lWgqafGUfQnie8ko2pSTvsVD286cKRIHf2sn5UKIogZ4FSA/Nb87/
 qYQGQfS4qqzaTL7kKyn3yxNTuv29QwYBiGHvco+rNvne5ymumNZQFr/rvvjz1AB8QMs1
 +aaBcuFYJ/KF1p/2xDZPNsLmHPlWN2NHzghfpWY+22dKaQvLasVPLgIL79IGO5uzt2fL
 cy8w==
X-Gm-Message-State: AFqh2kqv7d9Yawed9sEH9c4kKaTT7Q85/ODGj42eLN6rJLzltzsEWts8
 Yru+c0XxZ3NmEUt2LENSstgLkbSjkJB+ChQf0ekzN5RtDrMyLk6rKjGjRWxi8WCcMjuUgPqZr3F
 WWcRnZBmnMhfmgIc=
X-Received: by 2002:a05:600c:4f86:b0:3db:15b1:fb28 with SMTP id
 n6-20020a05600c4f8600b003db15b1fb28mr4970012wmq.19.1674120850181; 
 Thu, 19 Jan 2023 01:34:10 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtACPYeEtXsWD3i8FPBn/RtzVqsOWE4KGdrLkI5m0zB+5vU5TS/iPFcqUFkLzM5CEzrV9UtVw==
X-Received: by 2002:a05:600c:4f86:b0:3db:15b1:fb28 with SMTP id
 n6-20020a05600c4f8600b003db15b1fb28mr4969967wmq.19.1674120849904; 
 Thu, 19 Jan 2023 01:34:09 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 bd24-20020a05600c1f1800b003db122d5ac2sm4430267wmb.15.2023.01.19.01.34.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 01:34:09 -0800 (PST)
Date: Thu, 19 Jan 2023 09:34:07 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, richard.henderson@linaro.org,
 pbonzini@redhat.com, kwolf@redhat.com, hreitz@redhat.com,
 imp@bsdimp.com, kevans@freebsd.org, berrange@redhat.com,
 groug@kaod.org, qemu_oss@crudebyte.com, mst@redhat.com,
 philmd@linaro.org, peter.maydell@linaro.org, alistair@alistair23.me,
 jasowang@redhat.com, jonathan.cameron@huawei.com,
 kbastian@mail.uni-paderborn.de, quintela@redhat.com,
 michael.roth@amd.com, kkostiuk@redhat.com, tsimpson@quicinc.com,
 palmer@dabbelt.com, bin.meng@windriver.com, qemu-block@nongnu.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org
Subject: Re: [PATCH v4 10/19] migration: Clean up includes
Message-ID: <Y8kOj6m4jhtUVg+A@work-vm>
References: <20230119065959.3104012-1-armbru@redhat.com>
 <20230119065959.3104012-11-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20230119065959.3104012-11-armbru@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 19 Jan 2023 09:34:20 -0000

* Markus Armbruster (armbru@redhat.com) wrote:
> Clean up includes so that osdep.h is included first and headers
> which it implies are not included manually.

That change doesn't seem to match the message; the patch is removing the
osdep.h include.

Dave

> This commit was created with scripts/clean-includes.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  include/qemu/userfaultfd.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/include/qemu/userfaultfd.h b/include/qemu/userfaultfd.h
> index 6b74f92792..55c95998e8 100644
> --- a/include/qemu/userfaultfd.h
> +++ b/include/qemu/userfaultfd.h
> @@ -13,7 +13,6 @@
>  #ifndef USERFAULTFD_H
>  #define USERFAULTFD_H
>  
> -#include "qemu/osdep.h"
>  #include "exec/hwaddr.h"
>  #include <linux/userfaultfd.h>
>  
> -- 
> 2.39.0
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


