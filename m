Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mQBWK-0004nF-Jv
	for mharc-qemu-riscv@gnu.org; Tue, 14 Sep 2021 12:42:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQBWJ-0004m7-8W
 for qemu-riscv@nongnu.org; Tue, 14 Sep 2021 12:42:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQBWF-0005rW-Tg
 for qemu-riscv@nongnu.org; Tue, 14 Sep 2021 12:42:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631637770;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u6lYb/Hns0Z5Yn1l/dJhMFIvPLSVRob/t5UIXhvXgSM=;
 b=YJfl9enRqV9slG9XfyGmPsdbgTvlpU+yLJxfbyGneBm2u5kA0wGAUaZ7iZnbDMkLtPDAWs
 vUqFDognh2oQ+zEUWk+Ui/G1nZfGwYZqHhG+uUtO0sVrHMWZL8hnO2bQTI5RH/IwuUpONq
 ilcNAn8YLUyJIIzUJ/RAuyd6p+7Gnf4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-74-QL0xhPSOOqmlXjypKPWyOw-1; Tue, 14 Sep 2021 12:42:49 -0400
X-MC-Unique: QL0xhPSOOqmlXjypKPWyOw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9ACDB100C668;
 Tue, 14 Sep 2021 16:42:45 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.47])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1BC2A60C82;
 Tue, 14 Sep 2021 16:42:26 +0000 (UTC)
Date: Tue, 14 Sep 2021 17:42:24 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
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
Subject: Re: [PATCH v2 30/53] qapi: introduce x-query-roms QMP command
Message-ID: <YUDQ8EgwShhg01/c@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20210914142042.1655100-1-berrange@redhat.com>
 <20210914142042.1655100-31-berrange@redhat.com>
 <342ccd00-7210-1169-fb9d-3fad8d3c3470@redhat.com>
MIME-Version: 1.0
In-Reply-To: <342ccd00-7210-1169-fb9d-3fad8d3c3470@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
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
X-List-Received-Date: Tue, 14 Sep 2021 16:42:55 -0000

On Tue, Sep 14, 2021 at 06:04:48PM +0200, Philippe Mathieu-Daudé wrote:
> On 9/14/21 4:20 PM, Daniel P. Berrangé wrote:
> > This is a counterpart to the HMP "info roms" command. It is being
> > added with an "x-" prefix because this QMP command is intended as an
> > adhoc debugging tool and will thus not be modelled in QAPI as fully
> > structured data, nor will it have long term guaranteed stability.
> > The existing HMP command is rewritten to call the QMP command.
> > 
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > ---
> >  hw/core/loader.c  | 55 ++++++++++++++++++++++++++++++++---------------
> >  qapi/machine.json | 12 +++++++++++
> >  2 files changed, 50 insertions(+), 17 deletions(-)
> 
> > -void hmp_info_roms(Monitor *mon, const QDict *qdict)
> > +HumanReadableText *qmp_x_query_roms(Error **errp)
> >  {
> >      Rom *rom;
> > +    g_autoptr(GString) buf = g_string_new("");
> > +    HumanReadableText *ret;
> >  
> >      QTAILQ_FOREACH(rom, &roms, next) {
> >          if (rom->mr) {
> > -            monitor_printf(mon, "%s"
> > -                           " size=0x%06zx name=\"%s\"\n",
> > -                           memory_region_name(rom->mr),
> > -                           rom->romsize,
> > -                           rom->name);
> > +            g_string_append_printf(buf, "%s"
> > +                                   " size=0x%06zx name=\"%s\"\n",
> > +                                   memory_region_name(rom->mr),
> > +                                   rom->romsize,
> > +                                   rom->name);
> >          } else if (!rom->fw_file) {
> > -            monitor_printf(mon, "addr=" TARGET_FMT_plx
> > -                           " size=0x%06zx mem=%s name=\"%s\"\n",
> > -                           rom->addr, rom->romsize,
> > -                           rom->isrom ? "rom" : "ram",
> > -                           rom->name);
> > +            g_string_append_printf(buf, "addr=" TARGET_FMT_plx
> > +                                   " size=0x%06zx mem=%s name=\"%s\"\n",
> > +                                   rom->addr, rom->romsize,
> > +                                   rom->isrom ? "rom" : "ram",
> > +                                   rom->name);
> >          } else {
> > -            monitor_printf(mon, "fw=%s/%s"
> > -                           " size=0x%06zx name=\"%s\"\n",
> > -                           rom->fw_dir,
> > -                           rom->fw_file,
> > -                           rom->romsize,
> > -                           rom->name);
> > +            g_string_append_printf(buf, "fw=%s/%s"
> > +                                   " size=0x%06zx name=\"%s\"\n",
> > +                                   rom->fw_dir,
> > +                                   rom->fw_file,
> > +                                   rom->romsize,
> > +                                   rom->name);
> >          }
> >      }
> > +
> > +    ret = g_new0(HumanReadableText, 1);
> > +    ret->human_readable_text = g_steal_pointer(&buf->str);
> > +    return ret;
> > +}
> 
> Is it possible to have an helper in 'qapi/qmp/smth.h' such:
> 
> HumanReadableText *qmp_human_readable_text_new(GString **pbuf)
> {
>     HumanReadableText *ret = g_new0(HumanReadableText, 1);
> 
>     ret->human_readable_text = g_steal_pointer(pbuf);

NB, we're not stealing the GString, we're stealing the
char * inside it.

> 
>     return ret;
> }

but yes, we could do a helper like this.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


