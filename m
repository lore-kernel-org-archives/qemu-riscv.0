Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mT5AL-0001VQ-SF
	for mharc-qemu-riscv@gnu.org; Wed, 22 Sep 2021 12:32:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mT5AH-0001UA-5A
 for qemu-riscv@nongnu.org; Wed, 22 Sep 2021 12:32:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mT5AD-0001fM-CO
 for qemu-riscv@nongnu.org; Wed, 22 Sep 2021 12:32:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632328322;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tGml+z5wri++cNviwkr9uOImZi4qRo1/XZ9h9m3hxa4=;
 b=insaMYkE3dEeiypju3YER11kY1adb7ldMBXtmgMy1xwiW/FkExF1hZJruJ4Xezo+VRtUSA
 qxhRKPKKRaOY6tadsdrSfCh8F+O5WmS0uG3ne1c8zJPpMjacD4hMSiF6WqH2vR5z5qJ1oy
 MZ7Sv5Q/af1VT8ZjPqaa12h+Q+PLBgI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-138-ZN6EHD2bOcehOHZg4VtXTQ-1; Wed, 22 Sep 2021 12:32:00 -0400
X-MC-Unique: ZN6EHD2bOcehOHZg4VtXTQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 50C8E1006AA5;
 Wed, 22 Sep 2021 16:31:56 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.69])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 097F119724;
 Wed, 22 Sep 2021 16:30:47 +0000 (UTC)
Date: Wed, 22 Sep 2021 17:30:44 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Dongli Zhang <dongli.zhang@oracle.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, David Hildenbrand <david@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Peter Xu <peterx@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Max Filippov <jcmvbkbc@gmail.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Eric Blake <eblake@redhat.com>, Marek Vasut <marex@denx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Markus Armbruster <armbru@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-ppc@nongnu.org,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Greg Kurz <groug@kaod.org>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-riscv@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: [PATCH v2 38/53] qapi: introduce x-query-lapic QMP command
Message-ID: <YUtaNGQ6kHuZ5FY2@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20210914142042.1655100-1-berrange@redhat.com>
 <20210914142042.1655100-39-berrange@redhat.com>
 <68cebe2f-ba56-545f-686a-b9ac2120c5c4@oracle.com>
MIME-Version: 1.0
In-Reply-To: <68cebe2f-ba56-545f-686a-b9ac2120c5c4@oracle.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
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
X-List-Received-Date: Wed, 22 Sep 2021 16:32:09 -0000

On Mon, Sep 20, 2021 at 10:27:06PM -0700, Dongli Zhang wrote:
> Hi Daniel,
> 
> On 9/14/21 7:20 AM, Daniel P. Berrangé wrote:
> > This is a counterpart to the HMP "info lapic" command. It is being
> > added with an "x-" prefix because this QMP command is intended as an
> > adhoc debugging tool and will thus not be modelled in QAPI as fully
> > structured data, nor will it have long term guaranteed stability.
> > The existing HMP command is rewritten to call the QMP command.
> > 
> > This command is unable to use the pre-existing HumanReadableText,
> > because if 'common.json' is included into 'machine-target.json'
> > the static marshalling method for HumanReadableText will be reported
> > as unused by the compiler on all architectures except s390x.
> > 
> > Possible options were
> > 
> >  1 Support 'if' conditionals on 'include' statements in QAPI
> >  2 Add further commands to 'machine-target.json' that use
> >    HumanReadableText, such that it has at least one usage
> >    on all architecture targets.
> >  3 Duplicate HumanReadableText as TargetHumanReadableText
> >    adding conditions
> > 
> > This patch takes option (3) in the belief that we will eventually
> > get to a point where option (2) happens, and TargetHumanReadableText
> > can be removed again.
> > 
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > ---
> >  hw/core/cpu-common.c     |   7 ++
> >  include/hw/core/cpu.h    |  10 +++
> >  qapi/machine-target.json |  19 ++++-
> >  target/i386/cpu-dump.c   | 161 ++++++++++++++++++++-------------------
> >  target/i386/cpu.h        |   4 +-
> >  target/i386/monitor.c    |  46 +++++++++--
> >  6 files changed, 160 insertions(+), 87 deletions(-)


> > diff --git a/target/i386/monitor.c b/target/i386/monitor.c
> > index 19468c4e85..fc09f90059 100644
> > --- a/target/i386/monitor.c
> > +++ b/target/i386/monitor.c
> > @@ -33,6 +33,7 @@
> >  #include "qapi/error.h"
> >  #include "sev_i386.h"
> >  #include "qapi/qapi-commands-misc-target.h"
> > +#include "qapi/qapi-commands-machine-target.h"
> >  #include "qapi/qapi-commands-misc.h"
> >  #include "hw/i386/pc.h"
> >  
> > @@ -650,23 +651,52 @@ const MonitorDef *target_monitor_defs(void)
> >      return monitor_defs;
> >  }
> >  
> > +TargetHumanReadableText *qmp_x_query_lapic(int64_t apicid,
> > +                                           Error **errp)
> > +{
> > +    TargetHumanReadableText *ret;
> > +    g_autoptr(GString) buf = NULL;
> > +    CPUState *cs = cpu_by_arch_id(apicid);
> > +
> > +    if (!cs) {
> > +        error_setg(errp, "No CPU with APIC ID %" PRId64 " available", apicid);
> > +        return NULL;
> > +    }
> 
> Suppose the accelerator is KVM, the CPUState (cs) might not be syncrhonized with
> KVM kernel space (APIC+PIR). As a result, the data is stale.
> 
> I sent below patch long time ago but it never got reviewed.
> 
> https://lore.kernel.org/qemu-devel/20210908143803.29191-1-dongli.zhang@oracle.com/

I'll include your patch in the next version of this series
just before this patch, and then update this patch to  take
it into account.

> 
> > +
> > +    buf = x86_cpu_format_local_apic_state(cs, CPU_DUMP_FPU, errp);
> > +    if (!buf) {
> > +        return NULL;
> > +    }
> > +
> > +    ret = g_new0(TargetHumanReadableText, 1);
> > +    ret->human_readable_text = g_steal_pointer(&buf->str);
> > +    return ret;
> > +}
> > +
> >  void hmp_info_local_apic(Monitor *mon, const QDict *qdict)
> >  {
> > -    CPUState *cs;
> > +    Error *err = NULL;
> > +    g_autoptr(TargetHumanReadableText) info = NULL;
> > +    int64_t apicid;
> >  
> >      if (qdict_haskey(qdict, "apic-id")) {
> > -        int id = qdict_get_try_int(qdict, "apic-id", 0);
> > -        cs = cpu_by_arch_id(id);
> > +        apicid = qdict_get_try_int(qdict, "apic-id", 0);
> 
> Here is where I used to fix with the patch.
> 
> Thank you very much!
> 
> Dongli Zhang
> 
> >      } else {
> > -        cs = mon_get_cpu(mon);
> > +        CPUState *cs = mon_get_cpu(mon);
> > +        if (!cs) {
> > +            monitor_printf(mon, "No CPU available\n");
> > +            return;
> > +        }
> > +        apicid = cpu_get_arch_id(cs);
> >      }
> >  
> > -
> > -    if (!cs) {
> > -        monitor_printf(mon, "No CPU available\n");
> > +    info = qmp_x_query_lapic(apicid, &err);
> > +    if (err) {
> > +        error_report_err(err);
> >          return;
> >      }
> > -    x86_cpu_dump_local_apic_state(cs, CPU_DUMP_FPU);
> > +
> > +    monitor_printf(mon, "%s", info->human_readable_text);
> >  }
> >  
> >  SevInfo *qmp_query_sev(Error **errp)
> > 
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


