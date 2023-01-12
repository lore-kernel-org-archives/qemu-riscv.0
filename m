Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pFw6o-0000ys-7p
	for mharc-qemu-riscv@gnu.org; Thu, 12 Jan 2023 06:51:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pFw61-0000q1-Sw
 for qemu-riscv@nongnu.org; Thu, 12 Jan 2023 06:50:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pFw60-0000Rm-EW
 for qemu-riscv@nongnu.org; Thu, 12 Jan 2023 06:50:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673524211;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=aQ5rwiGK3BqD0lynecjo86MeUkRzro/Kze8S7Uhf7Rw=;
 b=VsD+BTgmnWgHOls9So4QW7bC3sm/4qu2s3e4Q1j8YZgIQwwE+YLuI+RNU+quKkU8KlDO3h
 MjYqJHj1hQinLEssSJgmE2yYXXlyJsqI8RuDv12BrNse6OVFNOuioS/P5olhNl4E6Sv43s
 D/YpZRDUF6KhHNEYB6UR3QGs1HLytps=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-434-fUVLaQU1MJS32GSsPi4rMg-1; Thu, 12 Jan 2023 06:50:08 -0500
X-MC-Unique: fUVLaQU1MJS32GSsPi4rMg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EF48085CBE2;
 Thu, 12 Jan 2023 11:50:07 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.78])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E369E1121314;
 Thu, 12 Jan 2023 11:50:06 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id DD5A621E5DCF; Thu, 12 Jan 2023 12:50:05 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: imp@bsdimp.com, kevans@freebsd.org, berrange@redhat.com,
 ben.widawsky@intel.com, jonathan.cameron@huawei.com,
 kbastian@mail.uni-paderborn.de, jasowang@redhat.com, michael.roth@amd.com,
 kkostiuk@redhat.com, tsimpson@quicinc.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 philmd@linaro.org, mst@redhat.com
Subject: [PATCH v3 0/1] Clean up includes
Date: Thu, 12 Jan 2023 12:50:04 +0100
Message-Id: <20230112115005.1504812-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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
X-List-Received-Date: Thu, 12 Jan 2023 11:50:28 -0000

Back in 2016, we discussed[1] rules for headers, and these were
generally liked:

1. Have a carefully curated header that's included everywhere first.  We
   got that already thanks to Peter: osdep.h.

2. Headers should normally include everything they need beyond osdep.h.
   If exceptions are needed for some reason, they must be documented in
   the header.  If all that's needed from a header is typedefs, put
   those into qemu/typedefs.h instead of including the header.

3. Cyclic inclusion is forbidden.

This series fixes a number of rule violations.

Together with

    [PATCH v2 0/4] hw/ppc: Clean up includes
    [PATCH v2 0/7] include/hw/pci include/hw/cxl: Clean up includes
        in master as commit 9d94c21363..881e019770
    [PATCH v2 0/3] block: Clean up includes
    [PATCH v3 0/5] coroutine: Clean up includes

just three inclusion loops remain reachable from include/:

    target/microblaze/cpu.h target/microblaze/mmu.h

    target/nios2/cpu.h target/nios2/mmu.h

    target/riscv/cpu.h target/riscv/pmp.h

Breaking them would be nice, but I'm out of steam.

v3:
* Rebased, old PATCH 1+2+4 are in master as commit
  881e019770..f07ceffdf5
* PATCH 1: Fix bsd-user

v2:
* Rebased
* PATCH 3: v1 posted separately
* PATCH 4: New

[1] Message-ID: <87h9g8j57d.fsf@blackfin.pond.sub.org>
    https://lists.nongnu.org/archive/html/qemu-devel/2016-03/msg03345.html

Markus Armbruster (1):
  include: Don't include qemu/osdep.h

 bsd-user/qemu.h                 | 1 -
 crypto/block-luks-priv.h        | 1 -
 include/hw/cxl/cxl_host.h       | 1 -
 include/hw/input/pl050.h        | 1 -
 include/hw/tricore/triboard.h   | 1 -
 include/qemu/userfaultfd.h      | 1 -
 net/vmnet_int.h                 | 1 -
 qga/cutils.h                    | 1 -
 target/hexagon/hex_arch_types.h | 1 -
 target/hexagon/mmvec/macros.h   | 1 -
 target/riscv/pmu.h              | 1 -
 bsd-user/arm/signal.c           | 1 +
 bsd-user/arm/target_arch_cpu.c  | 2 ++
 bsd-user/freebsd/os-sys.c       | 1 +
 bsd-user/i386/signal.c          | 1 +
 bsd-user/x86_64/signal.c        | 1 +
 qga/cutils.c                    | 3 ++-
 17 files changed, 8 insertions(+), 12 deletions(-)

-- 
2.39.0


