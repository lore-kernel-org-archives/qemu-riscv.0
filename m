Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62184C3DA6E
	for <qemu-riscv@archiver.kernel.org>; Mon,  8 Jan 2024 16:39:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rMsdP-0005Qf-3t; Mon, 08 Jan 2024 11:37:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1rMsdJ-0005Mi-FE
 for qemu-riscv@nongnu.org; Mon, 08 Jan 2024 11:37:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1rMsdF-0002nn-61
 for qemu-riscv@nongnu.org; Mon, 08 Jan 2024 11:37:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1704731863;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rjva5D5HUZRLSUeQ7TC2x2FhyuCk/YO2hvk35Ore6vo=;
 b=emMkfWRiCeoE26kf/1EbwD5l6tzShNxBnFclGPewePBsTOxuW2XROB5i7qqc1fBEJzipD/
 aJ3hevD3KIjsCTohn2+Kf9YAVj+qJ4wDTJZjQicY1zh0R2NbWnv/J9FnXEvxpNlJ0lz1WG
 0h3D7/meBw/oHP+jXEVhQMsg/8y5/PU=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-642-S-QDLwRgPya2u5KWj3De2w-1; Mon,
 08 Jan 2024 11:37:41 -0500
X-MC-Unique: S-QDLwRgPya2u5KWj3De2w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A2C281C06916;
 Mon,  8 Jan 2024 16:37:38 +0000 (UTC)
Received: from localhost (unknown [10.39.194.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F3AF01C060AF;
 Mon,  8 Jan 2024 16:37:36 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 qemu-block@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Max Filippov <jcmvbkbc@gmail.com>, kvm@vger.kernel.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-arm@nongnu.org,
 Jean-Christophe Dubois <jcd@tribudubois.net>, Jiri Slaby <jslaby@suse.cz>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eric Blake <eblake@redhat.com>, Paul Durrant <paul@xen.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, Kevin Wolf <kwolf@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Roman Bolshakov <rbolshakov@ddn.com>, Reinoud Zandijk <reinoud@netbsd.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 xen-devel@lists.xenproject.org, Anthony Perard <anthony.perard@citrix.com>,
 Weiwei Li <liwei1518@gmail.com>, qemu-ppc@nongnu.org,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Halil Pasic <pasic@linux.ibm.com>, Song Gao <gaosong@loongson.cn>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-riscv@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Alexander Graf <agraf@csgraf.de>,
 Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Hailiang Zhang <zhanghailiang@xfusion.com>,
 Hyman Huang <yong.huang@smartx.com>, Michael Roth <michael.roth@amd.com>,
 Fam Zheng <fam@euphon.net>, Stefano Stabellini <sstabellini@kernel.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 David Gibson <david@gibson.dropbear.id.au>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Stafford Horne <shorne@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 David Woodhouse <dwmw2@infradead.org>, Cameron Esfahani <dirty@apple.com>,
 Eric Farman <farman@linux.ibm.com>, Jason Wang <jasowang@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Bin Meng <bin.meng@windriver.com>, Fabiano Rosas <farosas@suse.de>,
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 David Hildenbrand <david@redhat.com>
Subject: [PULL 0/6] Block patches
Date: Mon,  8 Jan 2024 11:37:29 -0500
Message-ID: <20240108163735.254732-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

The following changes since commit ffd454c67e38cc6df792733ebc5d967eee28ac0d:

  Merge tag 'pull-vfio-20240107' of https://github.com/legoater/qemu into staging (2024-01-08 10:28:42 +0000)

are available in the Git repository at:

  https://gitlab.com/stefanha/qemu.git tags/block-pull-request

for you to fetch changes up to 0b2675c473f68f13bc5ca1dd1c43ce421542e7b8:

  Rename "QEMU global mutex" to "BQL" in comments and docs (2024-01-08 10:45:43 -0500)

----------------------------------------------------------------
Pull request

----------------------------------------------------------------

Philippe Mathieu-Daudé (1):
  iothread: Remove unused Error** argument in aio_context_set_aio_params

Stefan Hajnoczi (5):
  system/cpus: rename qemu_mutex_lock_iothread() to bql_lock()
  qemu/main-loop: rename QEMU_IOTHREAD_LOCK_GUARD to BQL_LOCK_GUARD
  qemu/main-loop: rename qemu_cond_wait_iothread() to
    qemu_cond_wait_bql()
  Replace "iothread lock" with "BQL" in comments
  Rename "QEMU global mutex" to "BQL" in comments and docs

 docs/devel/multi-thread-tcg.rst      |   7 +-
 docs/devel/qapi-code-gen.rst         |   2 +-
 docs/devel/replay.rst                |   2 +-
 docs/devel/reset.rst                 |   2 +-
 docs/devel/multiple-iothreads.txt    |  14 ++--
 hw/display/qxl.h                     |   2 +-
 include/block/aio-wait.h             |   2 +-
 include/block/aio.h                  |   3 +-
 include/block/blockjob.h             |   6 +-
 include/exec/cpu-common.h            |   2 +-
 include/exec/memory.h                |   4 +-
 include/exec/ramblock.h              |   2 +-
 include/io/task.h                    |   2 +-
 include/migration/register.h         |   8 +-
 include/qemu/coroutine-core.h        |   2 +-
 include/qemu/coroutine.h             |   2 +-
 include/qemu/main-loop.h             |  68 ++++++++-------
 include/qemu/thread.h                |   2 +-
 target/arm/internals.h               |   4 +-
 accel/accel-blocker.c                |  10 +--
 accel/dummy-cpus.c                   |   8 +-
 accel/hvf/hvf-accel-ops.c            |   4 +-
 accel/kvm/kvm-accel-ops.c            |   4 +-
 accel/kvm/kvm-all.c                  |  22 ++---
 accel/tcg/cpu-exec.c                 |  26 +++---
 accel/tcg/cputlb.c                   |  20 ++---
 accel/tcg/tcg-accel-ops-icount.c     |   6 +-
 accel/tcg/tcg-accel-ops-mttcg.c      |  12 +--
 accel/tcg/tcg-accel-ops-rr.c         |  18 ++--
 accel/tcg/tcg-accel-ops.c            |   2 +-
 accel/tcg/translate-all.c            |   2 +-
 cpu-common.c                         |   4 +-
 dump/dump.c                          |   4 +-
 hw/block/dataplane/virtio-blk.c      |   8 +-
 hw/block/virtio-blk.c                |   2 +-
 hw/core/cpu-common.c                 |   6 +-
 hw/display/virtio-gpu.c              |   2 +-
 hw/i386/intel_iommu.c                |   6 +-
 hw/i386/kvm/xen_evtchn.c             |  30 +++----
 hw/i386/kvm/xen_gnttab.c             |   2 +-
 hw/i386/kvm/xen_overlay.c            |   2 +-
 hw/i386/kvm/xen_xenstore.c           |   2 +-
 hw/intc/arm_gicv3_cpuif.c            |   2 +-
 hw/intc/s390_flic.c                  |  18 ++--
 hw/mips/mips_int.c                   |   2 +-
 hw/misc/edu.c                        |   4 +-
 hw/misc/imx6_src.c                   |   2 +-
 hw/misc/imx7_src.c                   |   2 +-
 hw/net/xen_nic.c                     |   8 +-
 hw/ppc/pegasos2.c                    |   2 +-
 hw/ppc/ppc.c                         |   6 +-
 hw/ppc/spapr.c                       |   2 +-
 hw/ppc/spapr_events.c                |   2 +-
 hw/ppc/spapr_rng.c                   |   4 +-
 hw/ppc/spapr_softmmu.c               |   4 +-
 hw/remote/mpqemu-link.c              |  22 ++---
 hw/remote/vfio-user-obj.c            |   2 +-
 hw/s390x/s390-skeys.c                |   2 +-
 hw/scsi/virtio-scsi-dataplane.c      |   6 +-
 iothread.c                           |   3 +-
 migration/block-dirty-bitmap.c       |  14 ++--
 migration/block.c                    |  38 ++++-----
 migration/colo.c                     |  62 +++++++-------
 migration/dirtyrate.c                |  12 +--
 migration/migration.c                |  54 ++++++------
 migration/ram.c                      |  16 ++--
 net/tap.c                            |   2 +-
 replay/replay-internal.c             |   2 +-
 semihosting/console.c                |   8 +-
 stubs/iothread-lock.c                |   6 +-
 system/cpu-throttle.c                |   6 +-
 system/cpus.c                        |  55 +++++++------
 system/dirtylimit.c                  |   4 +-
 system/memory.c                      |   2 +-
 system/physmem.c                     |  14 ++--
 system/runstate.c                    |   2 +-
 system/watchpoint.c                  |   4 +-
 target/arm/arm-powerctl.c            |  14 ++--
 target/arm/helper.c                  |   6 +-
 target/arm/hvf/hvf.c                 |   8 +-
 target/arm/kvm.c                     |   8 +-
 target/arm/ptw.c                     |   6 +-
 target/arm/tcg/helper-a64.c          |   8 +-
 target/arm/tcg/m_helper.c            |   6 +-
 target/arm/tcg/op_helper.c           |  24 +++---
 target/arm/tcg/psci.c                |   2 +-
 target/hppa/int_helper.c             |   8 +-
 target/i386/hvf/hvf.c                |   6 +-
 target/i386/kvm/hyperv.c             |   4 +-
 target/i386/kvm/kvm.c                |  28 +++----
 target/i386/kvm/xen-emu.c            |  16 ++--
 target/i386/nvmm/nvmm-accel-ops.c    |   6 +-
 target/i386/nvmm/nvmm-all.c          |  20 ++---
 target/i386/tcg/sysemu/fpu_helper.c  |   6 +-
 target/i386/tcg/sysemu/misc_helper.c |   4 +-
 target/i386/whpx/whpx-accel-ops.c    |   6 +-
 target/i386/whpx/whpx-all.c          |  24 +++---
 target/loongarch/tcg/csr_helper.c    |   4 +-
 target/mips/kvm.c                    |   4 +-
 target/mips/tcg/sysemu/cp0_helper.c  |   4 +-
 target/openrisc/sys_helper.c         |  16 ++--
 target/ppc/excp_helper.c             |  14 ++--
 target/ppc/helper_regs.c             |   2 +-
 target/ppc/kvm.c                     |   4 +-
 target/ppc/misc_helper.c             |   8 +-
 target/ppc/timebase_helper.c         |   8 +-
 target/riscv/cpu_helper.c            |   4 +-
 target/s390x/kvm/kvm.c               |   4 +-
 target/s390x/tcg/misc_helper.c       | 118 +++++++++++++--------------
 target/sparc/int32_helper.c          |   2 +-
 target/sparc/int64_helper.c          |   6 +-
 target/sparc/win_helper.c            |  20 ++---
 target/xtensa/exc_helper.c           |   8 +-
 ui/spice-core.c                      |   6 +-
 util/aio-posix.c                     |   3 +-
 util/aio-win32.c                     |   3 +-
 util/async.c                         |   2 +-
 util/main-loop.c                     |  13 ++-
 util/qsp.c                           |   6 +-
 util/rcu.c                           |  16 ++--
 audio/coreaudio.m                    |   8 +-
 memory_ldst.c.inc                    |  18 ++--
 target/i386/hvf/README.md            |   2 +-
 ui/cocoa.m                           |  56 ++++++-------
 124 files changed, 646 insertions(+), 655 deletions(-)

-- 
2.43.0


