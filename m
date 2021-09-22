Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mT4uW-0002Yk-Aj
	for mharc-qemu-riscv@gnu.org; Wed, 22 Sep 2021 12:15:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mT4u5-0002SP-HS
 for qemu-riscv@nongnu.org; Wed, 22 Sep 2021 12:15:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59209)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mT4tx-0004tQ-Fd
 for qemu-riscv@nongnu.org; Wed, 22 Sep 2021 12:15:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632327316;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=afaPrI2lIsJwwd28N+rf0rsb28GkzigsVp3a5c793L8=;
 b=ghUvoz/IB1qbJpPYirJMore6cBqL2xnrJWvITejs0SVWUaveYz30vqkgOsaD1hAKTuZnnm
 mq8MKNrxoC+gWubR7jGB0MhjMU5npRqxqCuGDrb3LvVGSHBFqBsiMC1/8Ljci8owRABtl4
 a0/TCKKoqhxpHFPuhZfS5/D/SKKWauM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-P_JRwo8oOayG3k6XMsPO2A-1; Wed, 22 Sep 2021 12:15:02 -0400
X-MC-Unique: P_JRwo8oOayG3k6XMsPO2A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5B653A40C1;
 Wed, 22 Sep 2021 16:14:58 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.69])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4E23160843;
 Wed, 22 Sep 2021 16:14:50 +0000 (UTC)
Date: Wed, 22 Sep 2021 17:14:47 +0100
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
Subject: Re: [PATCH v2 05/53] docs/devel: document expectations for HMP
 commands in the future
Message-ID: <YUtWd5oNATbtsTxe@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20210914142042.1655100-1-berrange@redhat.com>
 <20210914142042.1655100-6-berrange@redhat.com>
 <87pmt33c38.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87pmt33c38.fsf@dusky.pond.sub.org>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Wed, 22 Sep 2021 16:15:41 -0000

On Mon, Sep 20, 2021 at 10:06:35AM +0200, Markus Armbruster wrote:
> Daniel P. Berrangé <berrange@redhat.com> writes:
> 
> > We no longer wish to have commands implemented in HMP only. All commands
> > should start with a QMP implementation and the HMP merely be a shim
> > around this. To reduce the burden of implementing QMP commands where
> > there is low expectation of machine usage, requirements for QAPI
> > modelling are relaxed provided the command is under the "x-" name
> > prefix.
> >
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > ---
> >  docs/devel/writing-monitor-commands.rst | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/docs/devel/writing-monitor-commands.rst b/docs/devel/writing-monitor-commands.rst
> > index 4cf51ab557..983130a793 100644
> > --- a/docs/devel/writing-monitor-commands.rst
> > +++ b/docs/devel/writing-monitor-commands.rst
> > @@ -11,6 +11,16 @@ For an in-depth introduction to the QAPI framework, please refer to
> >  docs/devel/qapi-code-gen.txt. For documentation about the QMP protocol,
> >  start with docs/interop/qmp-intro.txt.
> >  
> > +Historically QEMU has permitted new monitor commands to be implemented in HMP
> > +only, QMP only, or both, depending on whether they needed to be accessible to
> > +human operators, machines, or both. When both QMP and HMP are implemented it
> > +is expected the HMP implementation is a shim around the QMP implementation.
> > +Going forward, the expectation is that new commands are implemented in QMP
> > +only, or both QMP and HMP. No further commands are to be added to HMP only.
> > +The long term goal is that all HMP commands will be implemented in terms of
> > +their QMP equivalent, enabling internals of QEMU to be fully isolated from
> 
> This feels a bit too tight.  Most HMP commands are going to wrap around
> their equivalent QMP command.  However, high-level HMP commands built
> from low-level QMP building blocks remain permissble.
> 
> > +the HMP implementation. Refer to the later topic on modelling data in QAPI
> 
> Suggest to use the exact section name for easy searching, or even
> better, make it a link.
> 
> > +for further guidance on commands that would have traditionally been HMP only.
> >  
> >  Overview
> >  --------
> 
> Discussing history is quite valuable in commit messages, but less so in
> a "how to do stuff" document.  Consider cutting this down some.  What
> about:
> 
>     New commands may be implemented in QMP only.  New HMP commands should be
>     implemented on top of QMP.  The typical HMP command wraps around an
>     equivalent QMP command, but HMP convenience commands built from QMP
>     building blocks are also fine.  The long term goal is to make all
>     existing HMP commands conform to this, to fully isolate HMP from the
>     internals of QEMU.

That's good with me. I'll just add the final sentance linking to the
later illustration for debugging aids.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


