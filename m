Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oxTeY-0000cM-MR
	for mharc-qemu-riscv@gnu.org; Tue, 22 Nov 2022 08:49:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oxTeW-0000Ss-Fn
 for qemu-riscv@nongnu.org; Tue, 22 Nov 2022 08:49:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oxTeT-0005zk-TV
 for qemu-riscv@nongnu.org; Tue, 22 Nov 2022 08:49:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669124969;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=RzWnF+5ChKiOgVKHeg2ESCoS/IPicyQ4OUq/UbmGQak=;
 b=FfjKuvx6ArJrC3+OL226JBDAhjhfFDYNP0xKYIbuopLo9LpCOvZP4gJfJUfOdUO4AWSs9w
 TjcTXC6G11wWnWyBQidzUtY3yId/hfwBcsmE/S4O3Y7oP2raZmS+8CBaGfx88OWtbxUXZv
 b5u3n+IWVG8tIW8XEUeeQW3g/VstHcE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-151-7crCNkh6OEWCUlO3mfci5g-1; Tue, 22 Nov 2022 08:49:24 -0500
X-MC-Unique: 7crCNkh6OEWCUlO3mfci5g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 09139101A528;
 Tue, 22 Nov 2022 13:49:23 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7056E40C6EC6;
 Tue, 22 Nov 2022 13:49:21 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E877921E6921; Tue, 22 Nov 2022 14:49:17 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: groug@kaod.org, qemu_oss@crudebyte.com, Alistair.Francis@wdc.com,
 bin.meng@windriver.com, palmer@dabbelt.com, marcandre.lureau@redhat.com,
 pbonzini@redhat.com, yuval.shaia.ml@gmail.com, marcel.apfelbaum@gmail.com,
 mst@redhat.com, quintela@redhat.com, dgilbert@redhat.com,
 pavel.dovgaluk@ispras.ru, alex.bennee@linaro.org, peterx@redhat.com,
 david@redhat.com, philmd@linaro.org, mrolnik@gmail.com,
 gaosong@loongson.cn, yangxiaojuan@loongson.cn, aurelien@aurel32.net,
 jiaxun.yang@flygoat.com, aleksandar.rikalo@syrmia.com, berrange@redhat.com,
 thuth@redhat.com, lvivier@redhat.com, suhang16@mails.ucas.ac.cn,
 chen.zhang@intel.com, lizhijian@fujitsu.com, stefanha@redhat.com,
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, virtio-fs@redhat.com
Subject: [PATCH v2 0/2] cleanup: Tweak and re-run return_directly.cocci
Date: Tue, 22 Nov 2022 14:49:15 +0100
Message-Id: <20221122134917.1217307-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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
X-List-Received-Date: Tue, 22 Nov 2022 13:49:32 -0000

Markus Armbruster (2):
  cleanup: Tweak and re-run return_directly.cocci
  block/vmdk: Simplify vmdk_co_create() to return directly

 scripts/coccinelle/return_directly.cocci |  5 +--
 include/hw/pci/pci.h                     |  7 +--
 target/avr/cpu.h                         |  4 +-
 block/vmdk.c                             | 28 +++++-------
 hw/9pfs/9p-synth.c                       | 14 ++----
 hw/char/sifive_uart.c                    |  4 +-
 hw/ppc/ppc4xx_sdram.c                    |  5 +--
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
 28 files changed, 81 insertions(+), 221 deletions(-)

-- 
2.37.3


