Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3333E7B601
	for <qemu-riscv@archiver.kernel.org>; Wed,  4 Oct 2023 12:34:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qo14K-0002M6-KU; Wed, 04 Oct 2023 08:33:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1qo14C-00028U-QD
 for qemu-riscv@nongnu.org; Wed, 04 Oct 2023 08:33:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1qo14A-00005Y-Gz
 for qemu-riscv@nongnu.org; Wed, 04 Oct 2023 08:33:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696422806;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ihODOrbA60WdNjWuy5YbID0afwvWWeY+G74+NEikqAg=;
 b=SIQ4DrULxVV++gJk8Va3q+zOHnY9Q84jJbQn/qble2dnU+MKmnHbHF3Irn9jMgfVGWynEH
 DL6AlIP/jddk24F3u+OJg2BGs5wn0vmCAEBIAnVfU86bQYD7SVMSDOafYFZ68HnPUZzMzT
 U2I59nQ23JwK5E5cC3WrUlFhSwN1CDA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-270-bhW9QaQaMVGk4BUHhxh50g-1; Wed, 04 Oct 2023 08:33:22 -0400
X-MC-Unique: bhW9QaQaMVGk4BUHhxh50g-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6C05118175B3;
 Wed,  4 Oct 2023 12:33:22 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.44])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3B6DC4A9B0A;
 Wed,  4 Oct 2023 12:33:21 +0000 (UTC)
Date: Wed, 4 Oct 2023 13:33:18 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Thomas Huth <thuth@redhat.com>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 00/13] misc: Rename 'softmmu' -> 'system'
Message-ID: <ZR1bjpEi5HdFp2xj@redhat.com>
References: <20231004090629.37473-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231004090629.37473-1-philmd@linaro.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Wed, Oct 04, 2023 at 11:06:15AM +0200, Philippe Mathieu-Daudé wrote:
> This series finishes the cleanup which remove the confusion
> of using 'softmmu' when we really mean 'system emulation',
> as opposition to 'user emulation'.

Am I mis-understanding what you mean by 'finishes' here, as
I see many references to softmmu remaining

  $ git grep softmmu | wc -l
  270

In particular under configs/

I was also hoping it meant that we'd be changing configure
to allow

    configure --target-list=x86_64-system

though the lazy side of me would like

    configure --target-list=x86_64-vm

for less typing

> 
> Now that Richard posted its "tcg: Allow softmmu for user-only"
> series, this is particularly relevant:
> https://lore.kernel.org/qemu-devel/20231003174356.1602279-1-richard.henderson@linaro.org/
> 
> Philippe Mathieu-Daudé (13):
>   softmmu/trace-events: Fix a typo
>   travis-ci: Correct invalid mentions of 'softmmu' by 'system'
>   cpu: Correct invalid mentions of 'softmmu' by 'system-mode'
>   fuzz: Correct invalid mentions of 'softmmu' by 'system'
>   tcg: Correct invalid mentions of 'softmmu' by 'system-mode'
>   accel: Rename accel_softmmu* -> accel_system*
>   gdbstub: Rename 'softmmu' -> 'system'
>   semihosting: Rename softmmu_FOO_user() -> uaccess_FOO_user()
>   target/i386: Rename i386_softmmu_kvm_ss -> i386_kvm_ss
>   hw/virtio/meson: Rename softmmu_virtio_ss -> system_virtio_ss
>   meson: Rename softmmu_mods -> system_mods
>   meson: Rename target_softmmu_arch -> target_system_arch
>   system: Rename softmmu/ directory as system/
> 
>  MAINTAINERS                                   | 44 +++++++++----------
>  docs/devel/build-system.rst                   |  4 +-
>  docs/devel/qtest.rst                          |  2 +-
>  docs/devel/testing.rst                        |  2 +-
>  tests/tcg/s390x/pgm-specification.mak         |  2 +-
>  meson.build                                   | 22 +++++-----
>  accel/{accel-softmmu.h => accel-system.h}     |  6 +--
>  gdbstub/internals.h                           |  4 +-
>  include/qemu/atomic128.h                      |  4 +-
>  .../{softmmu-uaccess.h => uaccess.h}          | 24 +++++-----
>  include/sysemu/runstate-action.h              |  2 +-
>  include/tcg/tcg-op-common.h                   |  2 +-
>  softmmu/trace.h                               |  1 -
>  {softmmu => system}/timers-state.h            |  0
>  system/trace.h                                |  1 +
>  tests/qtest/fuzz/fuzz.h                       |  4 +-
>  accel/accel-common.c                          |  2 +-
>  accel/{accel-softmmu.c => accel-system.c}     |  6 +--
>  accel/tcg/user-exec.c                         |  2 +-
>  cpu.c                                         |  2 +-
>  gdbstub/{softmmu.c => system.c}               |  2 +-
>  hw/core/cpu-common.c                          |  4 +-
>  semihosting/arm-compat-semi.c                 |  4 +-
>  semihosting/config.c                          |  2 +-
>  semihosting/guestfd.c                         |  2 +-
>  semihosting/syscalls.c                        |  2 +-
>  semihosting/uaccess.c                         | 14 +++---
>  stubs/semihost.c                              |  4 +-
>  {softmmu => system}/arch_init.c               |  0
>  {softmmu => system}/async-teardown.c          |  0
>  {softmmu => system}/balloon.c                 |  0
>  {softmmu => system}/bootdevice.c              |  0
>  {softmmu => system}/cpu-throttle.c            |  0
>  {softmmu => system}/cpu-timers.c              |  0
>  {softmmu => system}/cpus.c                    |  0
>  {softmmu => system}/datadir.c                 |  0
>  {softmmu => system}/device_tree.c             |  0
>  {softmmu => system}/dirtylimit.c              |  0
>  {softmmu => system}/dma-helpers.c             |  0
>  {softmmu => system}/globals.c                 |  0
>  {softmmu => system}/icount.c                  |  0
>  {softmmu => system}/ioport.c                  |  0
>  {softmmu => system}/main.c                    |  0
>  {softmmu => system}/memory.c                  |  2 +-
>  {softmmu => system}/memory_mapping.c          |  0
>  {softmmu => system}/physmem.c                 |  6 ++-
>  {softmmu => system}/qdev-monitor.c            |  0
>  {softmmu => system}/qemu-seccomp.c            |  0
>  {softmmu => system}/qtest.c                   |  0
>  {softmmu => system}/rtc.c                     |  0
>  {softmmu => system}/runstate-action.c         |  0
>  {softmmu => system}/runstate-hmp-cmds.c       |  0
>  {softmmu => system}/runstate.c                |  0
>  {softmmu => system}/tpm-hmp-cmds.c            |  0
>  {softmmu => system}/tpm.c                     |  0
>  {softmmu => system}/vl.c                      |  0
>  {softmmu => system}/watchpoint.c              |  0
>  target/m68k/m68k-semi.c                       |  2 +-
>  target/mips/tcg/sysemu/mips-semi.c            |  2 +-
>  target/nios2/nios2-semi.c                     |  2 +-
>  target/riscv/vector_helper.c                  |  2 +-
>  tcg/region.c                                  |  4 +-
>  tcg/tcg.c                                     | 11 ++---
>  tests/qtest/fuzz/fuzz.c                       |  2 +-
>  tests/tcg/multiarch/system/memory.c           |  4 +-
>  tcg/aarch64/tcg-target.c.inc                  |  4 +-
>  tcg/arm/tcg-target.c.inc                      |  2 +-
>  tcg/i386/tcg-target.c.inc                     |  2 +-
>  tcg/loongarch64/tcg-target.c.inc              |  4 +-
>  tcg/mips/tcg-target.c.inc                     |  4 +-
>  tcg/ppc/tcg-target.c.inc                      |  4 +-
>  tcg/riscv/tcg-target.c.inc                    |  4 +-
>  tcg/s390x/tcg-target.c.inc                    |  4 +-
>  tcg/sparc64/tcg-target.c.inc                  |  4 +-
>  .travis.yml                                   |  4 +-
>  accel/meson.build                             |  2 +-
>  accel/stubs/meson.build                       | 10 ++---
>  gdbstub/meson.build                           | 10 ++---
>  gdbstub/trace-events                          |  2 +-
>  hw/virtio/meson.build                         | 22 +++++-----
>  scripts/checkpatch.pl                         |  2 +-
>  scripts/coverity-scan/COMPONENTS.md           |  2 +-
>  scripts/get_maintainer.pl                     |  2 +-
>  {softmmu => system}/meson.build               |  0
>  {softmmu => system}/trace-events              |  2 +-
>  target/alpha/meson.build                      |  2 +-
>  target/arm/meson.build                        |  2 +-
>  target/avr/meson.build                        |  2 +-
>  target/cris/meson.build                       |  2 +-
>  target/hppa/meson.build                       |  2 +-
>  target/i386/kvm/meson.build                   | 10 ++---
>  target/i386/meson.build                       |  2 +-
>  target/loongarch/meson.build                  |  2 +-
>  target/m68k/meson.build                       |  2 +-
>  target/microblaze/meson.build                 |  2 +-
>  target/mips/meson.build                       |  2 +-
>  target/nios2/meson.build                      |  2 +-
>  target/openrisc/meson.build                   |  2 +-
>  target/ppc/meson.build                        |  2 +-
>  target/riscv/meson.build                      |  2 +-
>  target/rx/meson.build                         |  2 +-
>  target/s390x/meson.build                      |  2 +-
>  target/sh4/meson.build                        |  2 +-
>  target/sparc/meson.build                      |  2 +-
>  target/tricore/meson.build                    |  2 +-
>  target/xtensa/meson.build                     |  2 +-
>  tcg/meson.build                               |  6 +--
>  tests/tcg/Makefile.target                     |  2 +-
>  tests/tcg/multiarch/gdbstub/interrupt.py      |  2 +-
>  tests/tcg/multiarch/gdbstub/memory.py         |  2 +-
>  tests/tcg/s390x/pgm-specification-softmmu.S   |  2 +-
>  tests/tcg/s390x/softmmu.ld                    |  2 +-
>  tests/tcg/xtensa/Makefile.softmmu-target      |  2 +-
>  tests/tcg/xtensaeb/Makefile.softmmu-target    |  2 +-
>  tests/unit/meson.build                        |  2 +-
>  115 files changed, 188 insertions(+), 181 deletions(-)
>  rename accel/{accel-softmmu.h => accel-system.h} (77%)
>  rename include/semihosting/{softmmu-uaccess.h => uaccess.h} (75%)
>  delete mode 100644 softmmu/trace.h
>  rename {softmmu => system}/timers-state.h (100%)
>  create mode 100644 system/trace.h
>  rename accel/{accel-softmmu.c => accel-system.c} (96%)
>  rename gdbstub/{softmmu.c => system.c} (99%)
>  rename {softmmu => system}/arch_init.c (100%)
>  rename {softmmu => system}/async-teardown.c (100%)
>  rename {softmmu => system}/balloon.c (100%)
>  rename {softmmu => system}/bootdevice.c (100%)
>  rename {softmmu => system}/cpu-throttle.c (100%)
>  rename {softmmu => system}/cpu-timers.c (100%)
>  rename {softmmu => system}/cpus.c (100%)
>  rename {softmmu => system}/datadir.c (100%)
>  rename {softmmu => system}/device_tree.c (100%)
>  rename {softmmu => system}/dirtylimit.c (100%)
>  rename {softmmu => system}/dma-helpers.c (100%)
>  rename {softmmu => system}/globals.c (100%)
>  rename {softmmu => system}/icount.c (100%)
>  rename {softmmu => system}/ioport.c (100%)
>  rename {softmmu => system}/main.c (100%)
>  rename {softmmu => system}/memory.c (99%)
>  rename {softmmu => system}/memory_mapping.c (100%)
>  rename {softmmu => system}/physmem.c (99%)
>  rename {softmmu => system}/qdev-monitor.c (100%)
>  rename {softmmu => system}/qemu-seccomp.c (100%)
>  rename {softmmu => system}/qtest.c (100%)
>  rename {softmmu => system}/rtc.c (100%)
>  rename {softmmu => system}/runstate-action.c (100%)
>  rename {softmmu => system}/runstate-hmp-cmds.c (100%)
>  rename {softmmu => system}/runstate.c (100%)
>  rename {softmmu => system}/tpm-hmp-cmds.c (100%)
>  rename {softmmu => system}/tpm.c (100%)
>  rename {softmmu => system}/vl.c (100%)
>  rename {softmmu => system}/watchpoint.c (100%)
>  rename {softmmu => system}/meson.build (100%)
>  rename {softmmu => system}/trace-events (99%)
> 
> -- 
> 2.41.0
> 
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


