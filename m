Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nhCHH-0007un-QF
	for mharc-qemu-riscv@gnu.org; Wed, 20 Apr 2022 11:29:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nhCHE-0007mr-6R
 for qemu-riscv@nongnu.org; Wed, 20 Apr 2022 11:29:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nhCHA-00005Q-KH
 for qemu-riscv@nongnu.org; Wed, 20 Apr 2022 11:29:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650468592;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kMT74te33NYASvhAy5hsV6dRFdGMbmRsTDGP18bxM04=;
 b=Xqm+COJ2pdKdjgHtJyfeNJ2+oApvKlcdjDgwIVgALEYlF6ipGXKc2RiVm6DRKKm3DWYDV1
 aVXwkV4JNiyupiTpMv1w1/n6cvus/ZahS85PilPT8S5pILvOTr4n8jKVmUduM1mMyvKOCq
 ImDzfMSGYeF521QvJ3xjERLIRm8VYo0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-261-2PYDmN9gPMy0InbICXV9Sw-1; Wed, 20 Apr 2022 11:29:47 -0400
X-MC-Unique: 2PYDmN9gPMy0InbICXV9Sw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EEE8286B8A0;
 Wed, 20 Apr 2022 15:29:45 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.162])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D8C240D0161;
 Wed, 20 Apr 2022 15:29:34 +0000 (UTC)
Date: Wed, 20 Apr 2022 16:29:32 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, David Hildenbrand <david@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Yanan Wang <wangyanan55@huawei.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Taylor Simpson <tsimpson@quicinc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Warner Losh <imp@bsdimp.com>, Marek Vasut <marex@denx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Kevin Wolf <kwolf@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 "open list:S390 TCG CPUs" <qemu-s390x@nongnu.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 "open list:PowerPC TCG CPUs" <qemu-ppc@nongnu.org>,
 Stafford Horne <shorne@gmail.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Eduardo Habkost <eduardo@habkost.net>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: [PATCH 19/41] compiler.h: replace QEMU_NORETURN with G_NORETURN
Message-ID: <YmAm3FIbW2lakWDs@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20220420132624.2439741-1-marcandre.lureau@redhat.com>
 <20220420132624.2439741-20-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220420132624.2439741-20-marcandre.lureau@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 20 Apr 2022 15:29:57 -0000

On Wed, Apr 20, 2022 at 05:26:02PM +0400, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> G_NORETURN was introduced in glib 2.68, fallback to G_GNUC_NORETURN in
> glib-compat.
> 
> Note that this attribute must be placed before the function declaration
> (bringing a bit of consistency in qemu codebase usage).
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  accel/tcg/internal.h                 |  3 +--
>  include/exec/exec-all.h              | 20 +++++++++---------
>  include/exec/helper-head.h           |  2 +-
>  include/glib-compat.h                |  4 ++++
>  include/hw/core/cpu.h                |  2 +-
>  include/hw/core/tcg-cpu-ops.h        |  6 +++---
>  include/hw/hw.h                      |  2 +-
>  include/qemu/compiler.h              |  2 --
>  include/qemu/osdep.h                 |  3 ++-
>  include/qemu/thread.h                |  2 +-
>  include/tcg/tcg-ldst.h               |  4 ++--
>  include/tcg/tcg.h                    |  2 +-
>  linux-user/user-internals.h          |  2 +-
>  scripts/cocci-macro-file.h           |  2 +-
>  target/alpha/cpu.h                   | 10 ++++-----
>  target/arm/internals.h               | 12 +++++------
>  target/hppa/cpu.h                    |  2 +-
>  target/i386/tcg/helper-tcg.h         | 24 ++++++++++-----------
>  target/microblaze/cpu.h              |  6 +++---
>  target/mips/tcg/tcg-internal.h       | 17 ++++++++-------
>  target/nios2/cpu.h                   |  6 +++---
>  target/openrisc/exception.h          |  2 +-
>  target/ppc/cpu.h                     | 14 ++++++-------
>  target/ppc/internal.h                |  6 +++---
>  target/riscv/cpu.h                   | 10 ++++-----
>  target/s390x/s390x-internal.h        |  6 +++---
>  target/s390x/tcg/tcg_s390x.h         | 12 +++++------
>  target/sh4/cpu.h                     |  6 +++---
>  target/sparc/cpu.h                   | 10 ++++-----
>  target/xtensa/cpu.h                  |  6 +++---
>  accel/stubs/tcg-stub.c               |  4 ++--
>  bsd-user/signal.c                    |  3 ++-
>  hw/misc/mips_itu.c                   |  3 ++-
>  linux-user/signal.c                  |  3 ++-
>  monitor/hmp.c                        |  4 ++--
>  qemu-img.c                           | 12 +++++++----
>  target/alpha/helper.c                | 10 ++++-----
>  target/arm/pauth_helper.c            |  4 ++--
>  target/arm/tlb_helper.c              |  7 ++++---
>  target/hexagon/op_helper.c           |  9 ++++----
>  target/hppa/cpu.c                    |  8 +++----
>  target/hppa/op_helper.c              |  4 ++--
>  target/i386/tcg/bpt_helper.c         |  2 +-
>  target/i386/tcg/excp_helper.c        | 31 ++++++++++++++--------------
>  target/i386/tcg/misc_helper.c        |  6 +++---
>  target/i386/tcg/sysemu/misc_helper.c |  7 ++++---
>  target/openrisc/exception.c          |  2 +-
>  target/openrisc/exception_helper.c   |  3 ++-
>  target/riscv/op_helper.c             |  4 ++--
>  target/rx/op_helper.c                | 22 +++++++++++---------
>  target/s390x/tcg/excp_helper.c       | 22 +++++++++++---------
>  target/sh4/op_helper.c               |  5 +++--
>  target/sparc/mmu_helper.c            |  8 +++----
>  target/tricore/op_helper.c           |  6 +++---
>  tcg/tcg.c                            |  3 ++-
>  tests/fp/fp-bench.c                  |  3 ++-
>  tests/fp/fp-test.c                   |  3 ++-
>  scripts/checkpatch.pl                |  2 +-
>  58 files changed, 214 insertions(+), 191 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


