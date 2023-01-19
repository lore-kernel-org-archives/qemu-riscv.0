Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pITMX-0007a7-7S
	for mharc-qemu-riscv@gnu.org; Thu, 19 Jan 2023 06:45:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pITMV-0007VL-Ti
 for qemu-riscv@nongnu.org; Thu, 19 Jan 2023 06:45:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pITMU-00076T-4r
 for qemu-riscv@nongnu.org; Thu, 19 Jan 2023 06:45:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674128741;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=P78m2bxRvKQ56Scy0mxTJdk2vWI6fJdUGvOt38e9eUg=;
 b=QiXd4nBQYA3OTLlHdXft/Dt1VQhjdRlnygadiAakA0mG7Jbm8xHU9c/bJ20vACEenIvlP7
 s0yEDXuLA2JLlvlPAjwoYh5Rx/4wvELae6R9gXiivFAX241fUVVxNmEbQ72zNhITc4mszw
 XQkzRpIG0DbjerlLS2DFEwBX1RX0Gvg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-605-NaVypYlPPHm3NtCGrSG_uQ-1; Thu, 19 Jan 2023 06:45:40 -0500
X-MC-Unique: NaVypYlPPHm3NtCGrSG_uQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 c7-20020a1c3507000000b003d355c13ba8so1079407wma.6
 for <qemu-riscv@nongnu.org>; Thu, 19 Jan 2023 03:45:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P78m2bxRvKQ56Scy0mxTJdk2vWI6fJdUGvOt38e9eUg=;
 b=dDeDSEJQoqs6GkfncgciBhF1JdMIUzpDcZauUqKVjTtDdTmaga+vMjcRwB0GD/Ud43
 Qvr0T2R8USTSLFjxHfVpQiiAn9991Akf1dM8kGAufiJSCI/i6blfMsqHuazTpmYk+KaS
 DUSRWjVh4+FqMTb0eBmb66/wRVorjqUALZxa9WlLfJW5uYo7tR5vnC9lvoSex/rdLtfB
 qzQIL8Tt2HTjky+LhjIfMryPu5pyUapLd80SYIvpJnfQ19qrhdoLk7gsoCRscDiJTa/X
 91jR6uKxxweHRfV7SBBpLXWrbw9zEEgJ9tDBFysBXHYo4somjoIRDJNdn+qHNfh2dJPb
 Q17Q==
X-Gm-Message-State: AFqh2kokghLS3l0UDnXU/KowPPtnXadEgTESmCnADq409wwHaqoo5/J5
 DpAy5BBMdzTh6kB7CXexq7LhM3O4wx9/yF58GliOXdP5mZHfMvtC6VFEvwQ4czO9JofRsiqxUMy
 MdFIHwXXe7okvmaw=
X-Received: by 2002:a05:600c:214f:b0:3d9:ecae:84f2 with SMTP id
 v15-20020a05600c214f00b003d9ecae84f2mr9637809wml.25.1674128738970; 
 Thu, 19 Jan 2023 03:45:38 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvKovz8+ZDX4sjT/oeKatK0MjM5AWffSSa+Dw2pKc55XmUjZ2fH6WQq39m2D5iyra5dosN8ww==
X-Received: by 2002:a05:600c:214f:b0:3d9:ecae:84f2 with SMTP id
 v15-20020a05600c214f00b003d9ecae84f2mr9637775wml.25.1674128738765; 
 Thu, 19 Jan 2023 03:45:38 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 x23-20020a1c7c17000000b003d974076f13sm4504208wmc.3.2023.01.19.03.45.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 03:45:38 -0800 (PST)
Date: Thu, 19 Jan 2023 11:45:36 +0000
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
Message-ID: <Y8ktYMfKahtAZ83A@work-vm>
References: <20230119065959.3104012-1-armbru@redhat.com>
 <20230119065959.3104012-11-armbru@redhat.com>
 <Y8kOj6m4jhtUVg+A@work-vm> <87wn5ivmru.fsf@pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87wn5ivmru.fsf@pond.sub.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 19 Jan 2023 11:45:44 -0000

* Markus Armbruster (armbru@redhat.com) wrote:
> "Dr. David Alan Gilbert" <dgilbert@redhat.com> writes:
> 
> > * Markus Armbruster (armbru@redhat.com) wrote:
> >> Clean up includes so that osdep.h is included first and headers
> >> which it implies are not included manually.
> >
> > That change doesn't seem to match the message; the patch is removing the
> > osdep.h include.
> 
> It's the commit message scripts/clean-includes creates :)
> 
> I can throw in another patch to the script so it mentions it also
> removes qemu/osdep.h from headers.

Oh hmm it would be clearer; but OK then, so 

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> >> This commit was created with scripts/clean-includes.
> >> 
> >> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> >> ---
> >>  include/qemu/userfaultfd.h | 1 -
> >>  1 file changed, 1 deletion(-)
> >> 
> >> diff --git a/include/qemu/userfaultfd.h b/include/qemu/userfaultfd.h
> >> index 6b74f92792..55c95998e8 100644
> >> --- a/include/qemu/userfaultfd.h
> >> +++ b/include/qemu/userfaultfd.h
> >> @@ -13,7 +13,6 @@
> >>  #ifndef USERFAULTFD_H
> >>  #define USERFAULTFD_H
> >>  
> >> -#include "qemu/osdep.h"
> >>  #include "exec/hwaddr.h"
> >>  #include <linux/userfaultfd.h>
> >>  
> >> -- 
> >> 2.39.0
> >> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


