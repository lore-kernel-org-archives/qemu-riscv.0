Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pG0TN-0007jR-IR
	for mharc-qemu-riscv@gnu.org; Thu, 12 Jan 2023 11:30:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pG0TM-0007jA-7x
 for qemu-riscv@nongnu.org; Thu, 12 Jan 2023 11:30:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pG0TK-00078v-6f
 for qemu-riscv@nongnu.org; Thu, 12 Jan 2023 11:30:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673541033;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6ItsCWe1UDiIbTyHhNfrT6iDzjS+UiQ4kz4DGSVQ3d8=;
 b=ZCw59cesAm6FsvXpEnRP1SLdFYsfOu75i6IxmbcTP/hXpE4XOW52M+uyiTyoqL879F0KWr
 1wr2it7x52tUSubi5Rwcupq9b5t0BX8NEUjbmTQG30dssTfiaox8BdToM2zs/UtVNedARc
 4LlK5/A6ByDb8oYEE2ZbhBmfOLc4OuE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-650-93pzmnrXNkSZdZTIGhgU4A-1; Thu, 12 Jan 2023 11:30:31 -0500
X-MC-Unique: 93pzmnrXNkSZdZTIGhgU4A-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 24E5C811E6E;
 Thu, 12 Jan 2023 16:30:31 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.222])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 48EE6492C14;
 Thu, 12 Jan 2023 16:30:28 +0000 (UTC)
Date: Thu, 12 Jan 2023 16:30:20 +0000
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
Message-ID: <Y8A1nNp/JieSDgIP@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20230112115005.1504812-1-armbru@redhat.com>
 <20230112115005.1504812-2-armbru@redhat.com>
 <20230112082537-mutt-send-email-mst@kernel.org>
 <Y8AewFAHRGf6ZI3x@redhat.com>
 <CAFEAcA9REU2emdHRhfO2=ZZB3K9O=eKSP1k5aVh_Hwh0+cCW5w@mail.gmail.com>
 <Y8AwXG/c+IRyJ2U6@redhat.com>
 <CAFEAcA_EP2_0vm8r=12DBTG4a7X7aMYAy2x+K7YctZmSZWTv2g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEAcA_EP2_0vm8r=12DBTG4a7X7aMYAy2x+K7YctZmSZWTv2g@mail.gmail.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 12 Jan 2023 16:30:36 -0000

On Thu, Jan 12, 2023 at 04:20:36PM +0000, Peter Maydell wrote:
> On Thu, 12 Jan 2023 at 16:08, Daniel P. Berrangé <berrange@redhat.com> wrote:
> > I think the challenge is that osdep.h is too big as it exists
> > today. The stuff the needs to come before system headers is
> > actually little more than config-host.h and a few #defines
> > most of which are specific to windows. If those critical
> > #defines went into config-host.h, then we could have a rule
> > 'config-host.h' must be included in all .c files as the first
> > thing.
> 
> This doesn't seem much different to the rules we have today,
> except you've renamed osdep.h to config-host.h...

If the QEMU header files all contain #includes for the
system headers they rely on, then when tools are validating
code in the header, they can stand a better chance of being
able to resolve all the types. Though it'll still fail if
some of the system header pieces only get exposed as a result
of config-host.h macros, but that's relatively few, compared
to today where amost nothing resolves if yuo validate the
headers files in isolation.


> > All the header files could just reference the specific
> > system headers they care about instead of making everything
> > from osdep.h visible in their namespace.
> 
> There are some complicated things in there, not always
> limited to Windows. Also where there is some header
> that needs a platform-specific workaround I prefer that
> that header is pulled in by osdep.h. This avoids the
> failure mode of "developer working on Linux directly
> includes some-system-header.h; works fine on their machine,
> but doesn't work on oddball-platform where the header
> needs a workaround". (For instance, handling "sys/mman.h
> on this system doesn't define MAP_ANONYMOUS", or the
> backcompat stuff in glib-compat.h.)

Yeah, its not entirely straightforward, though our CI will catch
that on our most important target platforms.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


