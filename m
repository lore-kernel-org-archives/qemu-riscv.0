Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mQQfV-0000Ow-Qp
	for mharc-qemu-riscv@gnu.org; Wed, 15 Sep 2021 04:53:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQQfQ-0000L5-Ux
 for qemu-riscv@nongnu.org; Wed, 15 Sep 2021 04:53:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQQfM-0003km-La
 for qemu-riscv@nongnu.org; Wed, 15 Sep 2021 04:53:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631695995;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TBaKNBu639ZEHh/xMX97nJQu/PlaKwVBQMbzZpIXLbg=;
 b=UqP4eW/CP4ydYEg9ccuRKR7GtgoJyKDeE0Y8FKBQyFng68rJpc9mcVv/ElOEur4so+lqnq
 c4qoYbP86e8fjNgPN1ZOHNLPEtzFyFl8xZjezmDCYs/hptq23kgPv/kIjAtEraPGAL0pVY
 K3IBrTRNAJuFW0Zrh/ajntar8k4x5cU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-201-Z3tcu2TcPT64z57HgXjrXw-1; Wed, 15 Sep 2021 04:53:12 -0400
X-MC-Unique: Z3tcu2TcPT64z57HgXjrXw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 250A31015DA3;
 Wed, 15 Sep 2021 08:53:09 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.233])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 91F4B10016FE;
 Wed, 15 Sep 2021 08:52:53 +0000 (UTC)
Date: Wed, 15 Sep 2021 09:52:51 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Chris Wulff <crwulff@gmail.com>, David Hildenbrand <david@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Max Filippov <jcmvbkbc@gmail.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Eric Blake <eblake@redhat.com>, Marek Vasut <marex@denx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Markus Armbruster <armbru@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Greg Kurz <groug@kaod.org>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>, Peter Xu <peterx@redhat.com>,
 Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-riscv@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: [PATCH v2 27/53] target/xtensa: convert to use format_state
 instead of dump_state
Message-ID: <YUG0YwV1om2bmD9L@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20210914142042.1655100-1-berrange@redhat.com>
 <20210914142042.1655100-28-berrange@redhat.com>
 <1cb38e8f-cc05-461a-c722-efb18519f6fe@amsat.org>
MIME-Version: 1.0
In-Reply-To: <1cb38e8f-cc05-461a-c722-efb18519f6fe@amsat.org>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.398, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Wed, 15 Sep 2021 08:53:22 -0000

On Wed, Sep 15, 2021 at 09:32:38AM +0200, Philippe Mathieu-Daudé wrote:
> On 9/14/21 4:20 PM, Daniel P. Berrangé wrote:
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > ---
> >  target/xtensa/cpu.c       |  2 +-
> >  target/xtensa/cpu.h       |  2 +-
> >  target/xtensa/translate.c | 45 ++++++++++++++++++++-------------------
> >  3 files changed, 25 insertions(+), 24 deletions(-)
> 
> > -void xtensa_cpu_dump_state(CPUState *cs, FILE *f, int flags)
> > +void xtensa_cpu_format_state(CPUState *cs, GString *buf, int flags)
> >  {
> >      XtensaCPU *cpu = XTENSA_CPU(cs);
> >      CPUXtensaState *env = &cpu->env;
> >      xtensa_isa isa = env->config->isa;
> >      int i, j;
> >  
> > -    qemu_fprintf(f, "PC=%08x\n\n", env->pc);
> > +    g_string_append_printf(buf, "PC=%08x\n\n", env->pc);
> >  
> >      for (i = j = 0; i < xtensa_isa_num_sysregs(isa); ++i) {
> >          const uint32_t *reg =
> > @@ -1340,55 +1340,56 @@ void xtensa_cpu_dump_state(CPUState *cs, FILE *f, int flags)
> >          int regno = xtensa_sysreg_number(isa, i);
> >  
> >          if (regno >= 0) {
> > -            qemu_fprintf(f, "%12s=%08x%c",
> > -                         xtensa_sysreg_name(isa, i),
> > -                         reg[regno],
> > -                         (j++ % 4) == 3 ? '\n' : ' ');
> > +            g_string_append_printf(buf, "%12s=%08x%c",
> > +                                   xtensa_sysreg_name(isa, i),
> > +                                   reg[regno],
> > +                                   (j++ % 4) == 3 ? '\n' : ' ');
> >          }
> >      }
> >  
> > -    qemu_fprintf(f, (j % 4) == 0 ? "\n" : "\n\n");
> > +    g_string_append_printf(buf, (j % 4) == 0 ? "\n" : "\n\n");
> >  
> >      for (i = 0; i < 16; ++i) {
> > -        qemu_fprintf(f, " A%02d=%08x%c",
> > -                     i, env->regs[i], (i % 4) == 3 ? '\n' : ' ');
> > +        g_string_append_printf(buf, " A%02d=%08x%c",
> > +                               i, env->regs[i], (i % 4) == 3 ? '\n' : ' ');
> >      }
> >  
> >      xtensa_sync_phys_from_window(env);
> > -    qemu_fprintf(f, "\n");
> > +    g_string_append_printf(buf, "\n");
> 
> g_string_append_c(); pre-existing but better to move it before
> xtensa_sync_phys_from_window().

I don't want to be re-arranging the code in this series. It is just
a straight search/replace of qemu_fprintf with g_string_append_printf,
with the bare minimum of other changes,  to minimize risk of breaking
something unexpected.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


