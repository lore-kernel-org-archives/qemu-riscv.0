Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mQBPK-0008Q4-0J
	for mharc-qemu-riscv@gnu.org; Tue, 14 Sep 2021 12:35:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQBPD-0008Lc-UK
 for qemu-riscv@nongnu.org; Tue, 14 Sep 2021 12:35:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52388)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQBPB-0007fR-7d
 for qemu-riscv@nongnu.org; Tue, 14 Sep 2021 12:35:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631637331;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uB/IOM9wvm06euCcwdkC6N9/8Q6PIHGVDPykNlmmfIQ=;
 b=aK8Fis10zkrq98hGPJeKiJRfAocQZ7ezWSJ/JIUUosv0YX+vFSwgilgf64DRcu/nOooKoD
 JbfAQ7Sedo+fLKzzuxuI5cj2sz1nYDncmK0xh2olU284HAIjMwgON+VQqCNZNgCBxDVliu
 XYXDNZpDYjYrTb4oMt7KYHQw4sZaj18=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-564-tGaUdgfPPR61IwJzSKKHAQ-1; Tue, 14 Sep 2021 12:35:30 -0400
X-MC-Unique: tGaUdgfPPR61IwJzSKKHAQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5B5F9104FC26;
 Tue, 14 Sep 2021 16:35:10 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.47])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D2205DF2F;
 Tue, 14 Sep 2021 16:34:27 +0000 (UTC)
Date: Tue, 14 Sep 2021 17:34:24 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
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
Subject: Re: [PATCH v2 42/53] hw/core: introduce a 'format_tlb' callback
Message-ID: <YUDPECQJraD3thwi@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20210914142042.1655100-1-berrange@redhat.com>
 <20210914142042.1655100-43-berrange@redhat.com>
 <818d439f-337e-a73c-9e22-fbf8a119435f@redhat.com>
MIME-Version: 1.0
In-Reply-To: <818d439f-337e-a73c-9e22-fbf8a119435f@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
X-List-Received-Date: Tue, 14 Sep 2021 16:35:39 -0000

On Tue, Sep 14, 2021 at 05:56:09PM +0200, Philippe Mathieu-Daudé wrote:
> On 9/14/21 4:20 PM, Daniel P. Berrangé wrote:
> > This will allow us to reduce duplication between the different targets
> > implementing the 'info tlb' command.
> > 
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > ---
> >  hw/core/cpu-common.c  |  9 +++++++++
> >  include/hw/core/cpu.h | 11 +++++++++++
> >  2 files changed, 20 insertions(+)
> 
> > diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> > index 4c47e1df18..64fc57c8d9 100644
> > --- a/include/hw/core/cpu.h
> > +++ b/include/hw/core/cpu.h
> >   * @has_work: Callback for checking if there is work to do.
> >   * @memory_rw_debug: Callback for GDB memory access.
> >   * @format_state: Callback for formatting state.
> > + * @format_tlb: Callback for formatting memory mappings
> >   * @get_arch_id: Callback for getting architecture-dependent CPU ID.
> >   * @set_pc: Callback for setting the Program Counter register. This
> >   *       should have the semantics used by the target architecture when
> > @@ -136,6 +137,7 @@ struct CPUClass {
> >      int (*memory_rw_debug)(CPUState *cpu, vaddr addr,
> >                             uint8_t *buf, int len, bool is_write);
> >      void (*format_state)(CPUState *cpu, GString *buf, int flags);
> > +    void (*format_tlb)(CPUState *cpu, GString *buf);
> 
> Doesn't this belong to SysemuCPUOps?

I can't really answer, since my knowledge of this area of QEMU code is
fairly mimimal. I put it here because it is basically serving the same
purpose as the "format_state" callback immediately above it, which was
a rename of the existing "dump_state" callback. I assumed whatever was
there already was a good practice to follow[1]...

Regards,
Daniel

[1] yes assuming these things is often foolish in QEMU :-)
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


