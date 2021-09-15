Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mQQc8-00053c-CQ
	for mharc-qemu-riscv@gnu.org; Wed, 15 Sep 2021 04:49:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQQc6-00050c-DQ
 for qemu-riscv@nongnu.org; Wed, 15 Sep 2021 04:49:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48069)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQQc3-0000qM-ED
 for qemu-riscv@nongnu.org; Wed, 15 Sep 2021 04:49:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631695789;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UbsWX5ThNzbLSLppNv0zipcECBhQ1lONYygbF5FVZZg=;
 b=X1uY1cyeQ/prqnx0R7/2SKtnT/hVj6H5JPSBf9Qk9Oo28NHwV01I1jtW+yKNKS45yGS5Jo
 BiAF24QFoLvSYDUKKJ7JK+ffsNsUH7zyQZSGc+HMFX3MGO+6UgIX0jNLUP4oDN8S/2ob/D
 UVXzH3ZdYZy8Kc+NXLCxTDj11/LVaHI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-235-fke9A7PLMHqixdvWp5O0SA-1; Wed, 15 Sep 2021 04:49:48 -0400
X-MC-Unique: fke9A7PLMHqixdvWp5O0SA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5F03F802928;
 Wed, 15 Sep 2021 08:49:44 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.233])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7AFF06B54B;
 Wed, 15 Sep 2021 08:49:24 +0000 (UTC)
Date: Wed, 15 Sep 2021 09:49:21 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Chris Wulff <crwulff@gmail.com>, David Hildenbrand <david@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Laurent Vivier <laurent@vivier.eu>,
 Max Filippov <jcmvbkbc@gmail.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>,
 Marek Vasut <marex@denx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Markus Armbruster <armbru@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
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
Subject: Re: [PATCH v2 09/53] target/avr: convert to use format_state instead
 of dump_state
Message-ID: <YUGzkcTjgsTjO5PQ@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20210914142042.1655100-1-berrange@redhat.com>
 <20210914142042.1655100-10-berrange@redhat.com>
 <e0ca8f7b-0e88-4548-1b24-2a3b79e56ad5@amsat.org>
MIME-Version: 1.0
In-Reply-To: <e0ca8f7b-0e88-4548-1b24-2a3b79e56ad5@amsat.org>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 15 Sep 2021 08:49:54 -0000

On Wed, Sep 15, 2021 at 09:13:14AM +0200, Philippe Mathieu-Daudé wrote:
> On 9/14/21 4:19 PM, Daniel P. Berrangé wrote:
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > ---
> >  target/avr/cpu.c | 57 ++++++++++++++++++++++++------------------------
> >  1 file changed, 29 insertions(+), 28 deletions(-)
> > 
> > diff --git a/target/avr/cpu.c b/target/avr/cpu.c
> > index ea14175ca5..17ff21f8be 100644
> > --- a/target/avr/cpu.c
> > +++ b/target/avr/cpu.c
> > @@ -145,43 +145,44 @@ static ObjectClass *avr_cpu_class_by_name(const char *cpu_model)
> >      return oc;
> >  }
> >  
> > -static void avr_cpu_dump_state(CPUState *cs, FILE *f, int flags)
> > +static void avr_cpu_format_state(CPUState *cs, GString *buf, int flags)
> >  {
> >      AVRCPU *cpu = AVR_CPU(cs);
> >      CPUAVRState *env = &cpu->env;
> >      int i;
> >  
> > -    qemu_fprintf(f, "\n");
> > -    qemu_fprintf(f, "PC:    %06x\n", env->pc_w * 2); /* PC points to words */
> > -    qemu_fprintf(f, "SP:      %04x\n", env->sp);
> > -    qemu_fprintf(f, "rampD:     %02x\n", env->rampD >> 16);
> > -    qemu_fprintf(f, "rampX:     %02x\n", env->rampX >> 16);
> > -    qemu_fprintf(f, "rampY:     %02x\n", env->rampY >> 16);
> > -    qemu_fprintf(f, "rampZ:     %02x\n", env->rampZ >> 16);
> > -    qemu_fprintf(f, "EIND:      %02x\n", env->eind >> 16);
> > -    qemu_fprintf(f, "X:       %02x%02x\n", env->r[27], env->r[26]);
> > -    qemu_fprintf(f, "Y:       %02x%02x\n", env->r[29], env->r[28]);
> > -    qemu_fprintf(f, "Z:       %02x%02x\n", env->r[31], env->r[30]);
> > -    qemu_fprintf(f, "SREG:    [ %c %c %c %c %c %c %c %c ]\n",
> > -                 env->sregI ? 'I' : '-',
> > -                 env->sregT ? 'T' : '-',
> > -                 env->sregH ? 'H' : '-',
> > -                 env->sregS ? 'S' : '-',
> > -                 env->sregV ? 'V' : '-',
> > -                 env->sregN ? '-' : 'N', /* Zf has negative logic */
> > -                 env->sregZ ? 'Z' : '-',
> > -                 env->sregC ? 'I' : '-');
> > -    qemu_fprintf(f, "SKIP:    %02x\n", env->skip);
> > -
> > -    qemu_fprintf(f, "\n");
> > +    g_string_append_printf(buf, "\n");
> 
> This would be g_string_append_c(buf, '\n') but in this particular case
> it doesn't seem helpful so I'd directly remove it.

I don't want to change output format of the commands, with exception of
error reporting, as this is intended to be just refactoring patch, not
a cleanup patch.

I'm not convinced it is worth special casing single byte strings to
use g_string_append_c either really.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


