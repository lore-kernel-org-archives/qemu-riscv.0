Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pG07g-0002MA-Jb
	for mharc-qemu-riscv@gnu.org; Thu, 12 Jan 2023 11:08:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pG07d-0002Lp-S1
 for qemu-riscv@nongnu.org; Thu, 12 Jan 2023 11:08:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pG07b-0003iI-W0
 for qemu-riscv@nongnu.org; Thu, 12 Jan 2023 11:08:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673539686;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AFyTiLZgETk24M8fu35FVWHiD18haESTxvCD/MZcpcg=;
 b=EL97xM5EH0sBa5i6QHCt2iNHE82/welX8v9EzVy5LcbqWxE97dRcPFXQ5enfpl6Lwbu4/4
 +nOHTW34Wg7YgXDZDD+i/PtRDer89fTgfgsbclDWrAQA6Zu4XKP8LOnI9AGCcsrCUGcUqM
 M/3rymZY9W9dyT2PC3ZYWNlDRVOkbV0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-577-j-u1WPkPPM-8YizwqmsXqw-1; Thu, 12 Jan 2023 11:08:03 -0500
X-MC-Unique: j-u1WPkPPM-8YizwqmsXqw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 08F281818E48;
 Thu, 12 Jan 2023 16:08:01 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.222])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6615C2166B29;
 Thu, 12 Jan 2023 16:07:58 +0000 (UTC)
Date: Thu, 12 Jan 2023 16:07:56 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 imp@bsdimp.com, kevans@freebsd.org, ben.widawsky@intel.com,
 jonathan.cameron@huawei.com, kbastian@mail.uni-paderborn.de,
 jasowang@redhat.com, michael.roth@amd.com, kkostiuk@redhat.com,
 tsimpson@quicinc.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, philmd@linaro.org,
 Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH v3 1/1] include: Don't include qemu/osdep.h
Message-ID: <Y8AwXG/c+IRyJ2U6@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20230112115005.1504812-1-armbru@redhat.com>
 <20230112115005.1504812-2-armbru@redhat.com>
 <20230112082537-mutt-send-email-mst@kernel.org>
 <Y8AewFAHRGf6ZI3x@redhat.com>
 <CAFEAcA9REU2emdHRhfO2=ZZB3K9O=eKSP1k5aVh_Hwh0+cCW5w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEAcA9REU2emdHRhfO2=ZZB3K9O=eKSP1k5aVh_Hwh0+cCW5w@mail.gmail.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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
X-List-Received-Date: Thu, 12 Jan 2023 16:08:10 -0000

On Thu, Jan 12, 2023 at 03:58:56PM +0000, Peter Maydell wrote:
> On Thu, 12 Jan 2023 at 15:14, Daniel P. Berrangé <berrange@redhat.com> wrote:
> >
> > On Thu, Jan 12, 2023 at 08:51:26AM -0500, Michael S. Tsirkin wrote:
> > > On Thu, Jan 12, 2023 at 12:50:05PM +0100, Markus Armbruster wrote:
> > > > docs/devel/style.rst mandates:
> > > >
> > > >     The "qemu/osdep.h" header contains preprocessor macros that affect
> > > >     the behavior of core system headers like <stdint.h>.  It must be
> > > >     the first include so that core system headers included by external
> > > >     libraries get the preprocessor macros that QEMU depends on.
> > > >
> > > >     Do not include "qemu/osdep.h" from header files since the .c file
> > > >     will have already included it.
> > > >
> > > > A few violations have crept in.  Fix them.
> > > >
> > > > Signed-off-by: Markus Armbruster <armbru@redhat.com>
> > > > Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> > > > Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> > > > Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>
> > > > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> > >
> > > With my awesome grep skillz I found one more:
> > > $ grep -r --include='*.h' qemu/osdep.h
> > > include/block/graph-lock.h:#include "qemu/osdep.h"
> > >
> > > Looks like all C files must include qemu/osdep.h, no?
> >
> > Yes, and IMHO that is/was a mistake, as it means our other header
> > files are not self-contained, which prevents developer tools from
> > reporting useful bugs when you're editting.
> 
> The underlying requirement is "osdep.h must be included
> before any system header file". "Always first in every .c file"
> is an easy way to achieve that, and "never in any .h file" is
> then not mandatory but falls out from the fact that any
> such include is pointless and only serves to increase
> the compilation time (and to increase the chances that
> you don't notice that you forgot osdep.h in your .c file).
> 
> If there's a better way to do this (e.g. one which meant
> that it was a compile error to put osdep includes in the
> wrong place or to omit them) then that would certainly
> save us periodically having to do this kind of fixup commit.

I think the challenge is that osdep.h is too big as it exists
today. The stuff the needs to come before system headers is
actually little more than config-host.h and a few #defines
most of which are specific to windows. If those critical
#defines went into config-host.h, then we could have a rule
'config-host.h' must be included in all .c files as the first
thing. All the header files could just reference the specific
system headers they care about instead of making everything
from osdep.h visible in their namespace.  Still this would be
quite a lot of work to adapt to at this point.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


