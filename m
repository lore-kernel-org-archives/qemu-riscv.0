Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pG1dH-0002PD-W4
	for mharc-qemu-riscv@gnu.org; Thu, 12 Jan 2023 12:44:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pG1dC-0002Jk-Fd
 for qemu-riscv@nongnu.org; Thu, 12 Jan 2023 12:44:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pG1dA-00037X-C0
 for qemu-riscv@nongnu.org; Thu, 12 Jan 2023 12:44:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673545486;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NtwoKh/3iAKB2XE/31DuEYgAr//oVfLpFtkMDcaEqpE=;
 b=HzXJ3B3y56sYVbuA0BiG1VKDZbtnp1Pf9urWetbgB7vo+dA+DapgVBdGBUzMbDhnRkL6Mm
 GZNxQkuwABmttKUoNzw7rdRsJElm2CI5+3PMwKjHeqYcKV5kGYSvguU5MnPabb5uKxQ7jc
 h452GpdgZPgWJpK2Vg6deRuPtu1Uhcc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-215-TbksA1BdNsefWnC0nIvYDQ-1; Thu, 12 Jan 2023 12:44:42 -0500
X-MC-Unique: TbksA1BdNsefWnC0nIvYDQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 924543813F35;
 Thu, 12 Jan 2023 17:44:40 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.222])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F13D4085720;
 Thu, 12 Jan 2023 17:44:34 +0000 (UTC)
Date: Thu, 12 Jan 2023 17:44:31 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 imp@bsdimp.com, kevans@freebsd.org, ben.widawsky@intel.com,
 jonathan.cameron@huawei.com, kbastian@mail.uni-paderborn.de,
 jasowang@redhat.com, michael.roth@amd.com, kkostiuk@redhat.com,
 tsimpson@quicinc.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, philmd@linaro.org,
 Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH v3 1/1] include: Don't include qemu/osdep.h
Message-ID: <Y8BG/ytLLePRk1ki@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20230112115005.1504812-1-armbru@redhat.com>
 <20230112115005.1504812-2-armbru@redhat.com>
 <20230112082537-mutt-send-email-mst@kernel.org>
 <20230112085520-mutt-send-email-mst@kernel.org>
 <87zgan4xoo.fsf@pond.sub.org>
 <20230112123434-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230112123434-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 12 Jan 2023 17:44:51 -0000

On Thu, Jan 12, 2023 at 12:37:46PM -0500, Michael S. Tsirkin wrote:
> On Thu, Jan 12, 2023 at 03:47:19PM +0100, Markus Armbruster wrote:
> > "Michael S. Tsirkin" <mst@redhat.com> writes:
> > 
> > > On Thu, Jan 12, 2023 at 08:51:32AM -0500, Michael S. Tsirkin wrote:
> > >> On Thu, Jan 12, 2023 at 12:50:05PM +0100, Markus Armbruster wrote:
> > >> > docs/devel/style.rst mandates:
> > >> > 
> > >> >     The "qemu/osdep.h" header contains preprocessor macros that affect
> > >> >     the behavior of core system headers like <stdint.h>.  It must be
> > >> >     the first include so that core system headers included by external
> > >> >     libraries get the preprocessor macros that QEMU depends on.
> > >> > 
> > >> >     Do not include "qemu/osdep.h" from header files since the .c file
> > >> >     will have already included it.
> > >> > 
> > >> > A few violations have crept in.  Fix them.
> > >> > 
> > >> > Signed-off-by: Markus Armbruster <armbru@redhat.com>
> > >> > Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> > >> > Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> > >> > Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>
> > >> > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> > >> 
> > >> With my awesome grep skillz I found one more:
> > >> $ grep -r --include='*.h' qemu/osdep.h
> > >> include/block/graph-lock.h:#include "qemu/osdep.h"
> > 
> > Crept in after I prepared my v1.  I neglected to re-check.
> > 
> > > Also:
> > > $ grep -r --include='*.inc' qemu/osdep.h
> > > ui/vnc-enc-zrle.c.inc:#include "qemu/osdep.h"
> > > crypto/akcipher-nettle.c.inc:#include "qemu/osdep.h"
> > > crypto/akcipher-gcrypt.c.inc:#include "qemu/osdep.h"
> > > crypto/rsakey-nettle.c.inc:#include "qemu/osdep.h"
> > > crypto/cipher-gnutls.c.inc:#include "qemu/osdep.h"
> > > target/xtensa/core-dc233c/xtensa-modules.c.inc:#include "qemu/osdep.h"
> > > target/xtensa/core-sample_controller/xtensa-modules.c.inc:#include "qemu/osdep.h"
> > > target/xtensa/core-de212/xtensa-modules.c.inc:#include "qemu/osdep.h"
> > > target/xtensa/core-dc232b/xtensa-modules.c.inc:#include "qemu/osdep.h"
> > > target/xtensa/core-fsf/xtensa-modules.c.inc:#include "qemu/osdep.h"
> > > target/cris/translate_v10.c.inc:#include "qemu/osdep.h"
> > 
> > Good point.  Looks like I successfully supressed all memory of .inc.
> > 
> > >> Looks like all C files must include qemu/osdep.h, no?
> > 
> > I remember there are a few exceptions, but I don't remember which .c
> > they are.  Hmm... see commit 4bd802b209cff612d1a99674a91895b735be8630.
> > 
> > >> How about
> > >> 
> > >> 1- add -include qemu/osdep.h on compile command line
> > >>    drop #include "qemu/osdep.h" from C files
> > 
> > Then you need to encode the exceptions in the build system.  Which might
> > not be a bad thing.
> > 
> > >> 2- drop double include guards, replace with a warning.
> > >> 
> > >> following patch implements part 2:
> > >> 
> > >> 
> > >> qemu/osdep: don't include it from headers
> > >> 
> > >> doing so will lead to trouble eventually - instead of
> > >> working around such cases make it more likely it will fail.
> > >> 
> > >> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > >> 
> > >> ---
> > >> 
> > >> diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> > >> index 7d059ad526..e4a60f911c 100644
> > >> --- a/include/qemu/osdep.h
> > >> +++ b/include/qemu/osdep.h
> > >> @@ -24,7 +24,12 @@
> > >>   * This work is licensed under the terms of the GNU GPL, version 2 or later.
> > >>   * See the COPYING file in the top-level directory.
> > >>   */
> > >> -#ifndef QEMU_OSDEP_H
> > >> +#ifdef QEMU_OSDEP_H
> > >> +#warning "Never include qemu/osdep.h from a header!"
> > >> +#endif
> > >> +
> > >> +static inline void qemu_osdep_never_include_from_header(void) {}
> > >> +
> > 
> > Why do you need the function, too?
> 
> This seems to give a bit more info if header does get included
> twice: instead of just a warning on the second include compiler says
> definition is duplicated and then shows where the first definition was.
> OTOH first one was almost for sure from the proper first include so
> maybe we don't care. Let me drop this.

FWIW, if we want to simplify our header guards, we could replace the

  #ifndef FOO_H
  #define FOO_H

  ....

  #endif /* FOO_H */

with merely

  #pragma once

at the top of each header.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


