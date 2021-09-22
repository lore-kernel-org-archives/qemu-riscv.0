Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mT4jk-0000Us-8X
	for mharc-qemu-riscv@gnu.org; Wed, 22 Sep 2021 12:04:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mT4je-0000Ry-5Q
 for qemu-riscv@nongnu.org; Wed, 22 Sep 2021 12:04:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56392)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mT4jb-0004TJ-R0
 for qemu-riscv@nongnu.org; Wed, 22 Sep 2021 12:04:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632326674;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QebOB2SYHOmYM3jUpMCe05d9zHZjO5/ZfL4UGrTq+EM=;
 b=KXFb/L2ebMSRDbiP66SurAVdffcyz1NvHMiAd9K8moeWHjm8fNLv/ePmewu+iKeE16TXI+
 VaxaCa1rw26m1uuf5NAt1ttWLGGGa4XjTPZXCOd18hEoUmZD4YMk1alc0bi0VYDtRpFH14
 8NWhTb/Fw8/oz49I4hmPV5YjNejns/0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-18-7eIC7RurO66dIJH9eiFOlg-1; Wed, 22 Sep 2021 12:04:16 -0400
X-MC-Unique: 7eIC7RurO66dIJH9eiFOlg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C88551923768;
 Wed, 22 Sep 2021 16:04:11 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.69])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4BE661865D;
 Wed, 22 Sep 2021 16:02:27 +0000 (UTC)
Date: Wed, 22 Sep 2021 17:02:24 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>,
 Bin Meng <bin.meng@windriver.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Stafford Horne <shorne@gmail.com>, Cornelia Huck <cohuck@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Peter Xu <peterx@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-ppc@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Halil Pasic <pasic@linux.ibm.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-riscv@nongnu.org,
 Max Filippov <jcmvbkbc@gmail.com>, Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Marek Vasut <marex@denx.de>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-s390x@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>, Eric Blake <eblake@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Chris Wulff <crwulff@gmail.com>
Subject: Re: [PATCH v2 01/53] docs/devel: rename file for writing monitor
 commands
Message-ID: <YUtTkO9SFnA5xs2v@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20210914142042.1655100-1-berrange@redhat.com>
 <20210914142042.1655100-2-berrange@redhat.com>
 <87a6k74rsl.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87a6k74rsl.fsf@dusky.pond.sub.org>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) DKIMWL_WL_HIGH=-1.472, DKIM_SIGNED=0.1,
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
X-List-Received-Date: Wed, 22 Sep 2021 16:04:39 -0000

On Mon, Sep 20, 2021 at 09:42:02AM +0200, Markus Armbruster wrote:
> Daniel P. Berrangé <berrange@redhat.com> writes:
> 
> > The file already covers writing new style HMP commands, in addition to
> > the QMP commands, so it deserves a more general name.
> >
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > ---
> >  docs/devel/index.rst                                        | 2 +-
> >  ...riting-qmp-commands.rst => writing-monitor-commands.rst} | 6 +++---
> >  2 files changed, 4 insertions(+), 4 deletions(-)
> >  rename docs/devel/{writing-qmp-commands.rst => writing-monitor-commands.rst} (99%)
> >
> > diff --git a/docs/devel/index.rst b/docs/devel/index.rst
> > index f95df10b3e..7c25177c5d 100644
> > --- a/docs/devel/index.rst
> > +++ b/docs/devel/index.rst
> > @@ -44,4 +44,4 @@ modifying QEMU's source code.
> >     ebpf_rss
> >     vfio-migration
> >     qapi-code-gen
> > -   writing-qmp-commands
> > +   writing-monitor-commands
> > diff --git a/docs/devel/writing-qmp-commands.rst b/docs/devel/writing-monitor-commands.rst
> > similarity index 99%
> > rename from docs/devel/writing-qmp-commands.rst
> > rename to docs/devel/writing-monitor-commands.rst
> > index 6a10a06c48..497c9ce0d5 100644
> > --- a/docs/devel/writing-qmp-commands.rst
> > +++ b/docs/devel/writing-monitor-commands.rst
> > @@ -1,8 +1,8 @@
> > -How to write QMP commands using the QAPI framework
> > -==================================================
> > +How to write monitor commands
> > +=============================
> >  
> >  This document is a step-by-step guide on how to write new QMP commands using
> > -the QAPI framework. It also shows how to implement new style HMP commands.
> > +the QAPI framework and new style HMP commands.
> 
> Recommend to drop "new style", here and in the commit message.

Ok, will do.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


