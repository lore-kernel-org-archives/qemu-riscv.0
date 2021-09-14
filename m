Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mQBzv-0006Ph-2w
	for mharc-qemu-riscv@gnu.org; Tue, 14 Sep 2021 13:13:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQBzn-0006NU-E3
 for qemu-riscv@nongnu.org; Tue, 14 Sep 2021 13:13:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58235)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQBzf-0006yI-K4
 for qemu-riscv@nongnu.org; Tue, 14 Sep 2021 13:13:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631639594;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jggs6OfC+tSYzr8Gie1Phu+g74Lb1MFLOQ1xr+RGMWQ=;
 b=Nu1fDIAR7erAIf12627oHCaWcx934U/KmH3Fa76Vtzocpj5bwpj87ZTfULvfnk9FQrtMLo
 WznTqIOqlrhnkZkQkKDo7dkRrnI/6JVnrgWuu0lr/wDI+d1Jt/zsMtpPcCLCU/X3jYUVFN
 8QDqlwlfHuoTLQCPdb0dFB6zh5YKiQQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-126-rCZCWg9wOVKM3t53wAX4_w-1; Tue, 14 Sep 2021 13:13:01 -0400
X-MC-Unique: rCZCWg9wOVKM3t53wAX4_w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B034180830E;
 Tue, 14 Sep 2021 17:12:57 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.47])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7A2CF6D981;
 Tue, 14 Sep 2021 17:12:37 +0000 (UTC)
Date: Tue, 14 Sep 2021 18:12:34 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Chris Wulff <crwulff@gmail.com>, David Hildenbrand <david@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>,
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
 Eduardo Habkost <ehabkost@redhat.com>, Greg Kurz <groug@kaod.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>, Peter Xu <peterx@redhat.com>,
 Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-riscv@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, qemu-ppc@nongnu.org,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: [PATCH v2 42/53] hw/core: introduce a 'format_tlb' callback
Message-ID: <YUDYArsgmyBxFveW@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20210914142042.1655100-1-berrange@redhat.com>
 <20210914142042.1655100-43-berrange@redhat.com>
 <818d439f-337e-a73c-9e22-fbf8a119435f@redhat.com>
 <YUDPECQJraD3thwi@redhat.com>
 <a127efbf-8953-2ec5-9ba0-badbce949264@redhat.com>
MIME-Version: 1.0
In-Reply-To: <a127efbf-8953-2ec5-9ba0-badbce949264@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
X-List-Received-Date: Tue, 14 Sep 2021 17:13:25 -0000

On Tue, Sep 14, 2021 at 07:02:19PM +0200, Philippe Mathieu-Daudé wrote:
> On 9/14/21 6:34 PM, Daniel P. Berrangé wrote:
> > On Tue, Sep 14, 2021 at 05:56:09PM +0200, Philippe Mathieu-Daudé wrote:
> >> On 9/14/21 4:20 PM, Daniel P. Berrangé wrote:
> >>> This will allow us to reduce duplication between the different targets
> >>> implementing the 'info tlb' command.
> >>>
> >>> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> >>> ---
> >>>  hw/core/cpu-common.c  |  9 +++++++++
> >>>  include/hw/core/cpu.h | 11 +++++++++++
> >>>  2 files changed, 20 insertions(+)
> >>
> >>> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> >>> index 4c47e1df18..64fc57c8d9 100644
> >>> --- a/include/hw/core/cpu.h
> >>> +++ b/include/hw/core/cpu.h
> >>>   * @has_work: Callback for checking if there is work to do.
> >>>   * @memory_rw_debug: Callback for GDB memory access.
> >>>   * @format_state: Callback for formatting state.
> >>> + * @format_tlb: Callback for formatting memory mappings
> 
> "... for formatting translations of virtual to physical memory mappings"
> 
> >>>   * @get_arch_id: Callback for getting architecture-dependent CPU ID.
> >>>   * @set_pc: Callback for setting the Program Counter register. This
> >>>   *       should have the semantics used by the target architecture when
> >>> @@ -136,6 +137,7 @@ struct CPUClass {
> >>>      int (*memory_rw_debug)(CPUState *cpu, vaddr addr,
> >>>                             uint8_t *buf, int len, bool is_write);
> >>>      void (*format_state)(CPUState *cpu, GString *buf, int flags);
> >>> +    void (*format_tlb)(CPUState *cpu, GString *buf);
> >>
> >> Doesn't this belong to SysemuCPUOps?
> > 
> > I can't really answer, since my knowledge of this area of QEMU code is
> > fairly mimimal. I put it here because it is basically serving the same
> > purpose as the "format_state" callback immediately above it, which was
> > a rename of the existing "dump_state" callback. I assumed whatever was
> > there already was a good practice to follow[1]...
> 
> Since it involves physical memory, I'm pretty sure this is sysemu
> specific. Beside in the following patches you guard the handlers
> with '#ifndef CONFIG_USER_ONLY'.
> 
> Good news, there is very few changes needed in your patches, for
> example the next patch:

.snip..

yes I see what you mean now, and agree this looks like a better
approach

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


