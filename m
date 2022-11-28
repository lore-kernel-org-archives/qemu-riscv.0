Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ozaeQ-0004MB-LU
	for mharc-qemu-riscv@gnu.org; Mon, 28 Nov 2022 04:42:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ozaeB-0004JG-Ba
 for qemu-riscv@nongnu.org; Mon, 28 Nov 2022 04:41:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ozae8-0007Qu-P6
 for qemu-riscv@nongnu.org; Mon, 28 Nov 2022 04:41:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669628511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+KzhYUqTFOfvlfNDQ/m2fzpSA51ejVDroEGZIzO73bk=;
 b=Fxj2iQFP/GNZM1U0DE43YesGf5uH8Cox2Jd7WlnpIB+vPXOTvLgRQKmDmkUe0YvWw0XUA6
 6RSQe4sVeWe43o0NdmW9WDCmXJceZ7hlIM++A16QuK3dzEmuYgaK3I0pGUyGGABTm3v/n1
 v7p3KXX67j+6kRt6Pw7XivPjMZwXHTk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-14-pRMx5t2IOMiVB7VXOJSupg-1; Mon, 28 Nov 2022 04:41:48 -0500
X-MC-Unique: pRMx5t2IOMiVB7VXOJSupg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C50008339CA;
 Mon, 28 Nov 2022 09:41:46 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 45890492B05;
 Mon, 28 Nov 2022 09:41:41 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 113B321E6921; Mon, 28 Nov 2022 10:41:38 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: Alistair.Francis@wdc.com, bin.meng@windriver.com, palmer@dabbelt.com,
 marcandre.lureau@redhat.com, pbonzini@redhat.com, yuval.shaia.ml@gmail.com,
 marcel.apfelbaum@gmail.com, mst@redhat.com, quintela@redhat.com,
 dgilbert@redhat.com, pavel.dovgaluk@ispras.ru, alex.bennee@linaro.org,
 peterx@redhat.com, david@redhat.com, philmd@linaro.org, mrolnik@gmail.com,
 gaosong@loongson.cn, yangxiaojuan@loongson.cn, aurelien@aurel32.net,
 jiaxun.yang@flygoat.com, aleksandar.rikalo@syrmia.com, berrange@redhat.com,
 thuth@redhat.com, lvivier@redhat.com, suhang16@mails.ucas.ac.cn,
 chen.zhang@intel.com, lizhijian@fujitsu.com, stefanha@redhat.com,
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, virtio-fs@redhat.com
Subject: [PATCH v3 0/3] cleanup: Tweak and re-run return_directly.cocci
Date: Mon, 28 Nov 2022 10:41:35 +0100
Message-Id: <20221128094138.2824623-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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
X-List-Received-Date: Mon, 28 Nov 2022 09:42:03 -0000

v3:
* Rebased onto Greg's "[PATCH] 9pfs: Fix some return statements in the
  synth backend", which replaces my change to hw/9pfs/9p-synth.c in
  PATCH 1/3, along with a paragraph on checkpatch.pl in the commit
  message.

v2:
* Changes to imported files dropped [Philippe, Max]
* Handwritten change to vmdk_co_create() split off as PATCH 2/2 [Peter]
* New PATCH 3/2 [Zoltan]

Markus Armbruster (3):
  cleanup: Tweak and re-run return_directly.cocci
  block/vmdk: Simplify vmdk_co_create() to return directly
  ppc4xx_sdram: Simplify sdram_ddr_size() to return directly

 scripts/coccinelle/return_directly.cocci |  5 +--
 include/hw/pci/pci.h                     |  7 +--
 target/avr/cpu.h                         |  4 +-
 block/vmdk.c                             | 28 +++++-------
 hw/char/sifive_uart.c                    |  4 +-
 hw/ppc/ppc4xx_sdram.c                    | 15 ++-----
 hw/rdma/vmw/pvrdma_cmd.c                 | 57 +++++++++---------------
 hw/virtio/vhost-user.c                   |  6 +--
 migration/dirtyrate.c                    | 10 +----
 migration/tls.c                          |  6 +--
 replay/replay-time.c                     |  5 +--
 semihosting/console.c                    |  4 +-
 softmmu/memory.c                         | 11 +----
 softmmu/physmem.c                        |  9 +---
 target/loongarch/cpu.c                   |  4 +-
 target/mips/tcg/dsp_helper.c             | 15 ++-----
 target/riscv/debug.c                     |  6 +--
 target/riscv/vector_helper.c             | 28 +++---------
 tests/bench/benchmark-crypto-akcipher.c  |  6 +--
 tests/qtest/erst-test.c                  |  5 +--
 tests/qtest/hexloader-test.c             |  6 +--
 tests/qtest/pvpanic-pci-test.c           |  6 +--
 tests/qtest/pvpanic-test.c               |  6 +--
 tests/qtest/test-filter-mirror.c         |  6 +--
 tests/qtest/virtio-ccw-test.c            |  6 +--
 tests/tcg/multiarch/sha512.c             |  9 +---
 tools/virtiofsd/fuse_lowlevel.c          | 24 +++-------
 27 files changed, 80 insertions(+), 218 deletions(-)

-- 
2.37.3


