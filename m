Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52C11C28B28
	for <qemu-riscv@archiver.kernel.org>; Mon, 17 Mar 2025 18:36:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tuFJM-0004sb-7u; Mon, 17 Mar 2025 14:35:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1tuFIf-0004Tw-DL
 for qemu-riscv@nongnu.org; Mon, 17 Mar 2025 14:35:03 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1tuFIK-00068o-4r
 for qemu-riscv@nongnu.org; Mon, 17 Mar 2025 14:34:54 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-22359001f1aso41891445ad.3
 for <qemu-riscv@nongnu.org>; Mon, 17 Mar 2025 11:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742236465; x=1742841265; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RPbHwvloYIySCZWmnoL8Q2AUPe8llNmEPWBrsL/waLI=;
 b=vGYbSPI7QPk4hOer0pr3bcrcT7Bb/B/quFzVvsiyEBmHE/Pf2sk/dvbeG+dAYtrGFZ
 TPWwCGOHRbm3TmFab94y1Qz/59HHqI6Hny6dkXugHo8pnCujcYcwUGPLqVBD/Q+U7wRA
 lQ0sdodHSQ/ZtR/Ki6R24S98txQG8rgTcXPrKFNirTqRG0SFbUjNPQFHqqODjDojPTae
 mkydrDbe45/kwOsbWY9ADtlpFitk5DsXFgCHsaKim7OWwIbGfU2DBbJr1/SWoHt7l56E
 07N+fnuSf6KYeaSEzr0PwFkgnuHUX0e0ahisUdcMezzwLvAxCNOyfX07Qrx4lvgrk8hD
 Swlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742236465; x=1742841265;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RPbHwvloYIySCZWmnoL8Q2AUPe8llNmEPWBrsL/waLI=;
 b=ABLlYlWh1dXb/BVJYPR7gkFxEHOhjVCX/hcrNaJaInRfQ3iJiFWyAwT0OnY94HTqNs
 a77b0IPmU2KfN7JwamR+5bjWcpltH69bg26TjU+3uxGxy/BoNezEUQ7xUW1C+bMEVtNo
 r/em2IHHASCnWS1QP0z6Ud8kCjEHzcajSg8s46KukGvKkKRVvYzQJktyLhHKa/8zIH24
 7W5OZDkJP6SOSyg6lGeEKQ23skp3t6bUWUWW85NFGN2y1M7zLjFH719+a24S+pz6RY/b
 Upi1IhtRdE2C4Q0jwuLx6jXzqAjjOXSyYiyBydW+46MAk0juh8EhX0KNWE5Ah7xPdYCD
 xLUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhMMxpLC3/EcG6/ZoPFjocH7C+EH0BYvxo4pfxPpTomdsCEM+pFJehCu1xpw2Y8lYiuNBk78dbyMTV@nongnu.org
X-Gm-Message-State: AOJu0Yx4VfcdYaI1sd/g3bMmVu98eYIm3GAzM9/Mst2YdwnNLxf+hL1w
 qTDa0Cm3zpE67Te7Hd3fbJNtBgKZ/nmUBDzkalyc/xSwogIYCBlbcGArj9c9Akk=
X-Gm-Gg: ASbGncv2G11rf8UNF6z53VY0DWAs6OpV+SYfDcpTcqhLiqcKXwvvvhANB+E9Ciqg2ir
 S5nt45pyMvwSLvEGJ3u7fDOWTT/wTRnpRJxjH0HoyRrVbxwj2ALPlZ8MBnJrqBtEcrzWGva70hf
 VQjfWiI6eeCkOPm6tJuuHKzW4i4ko9rUhidgNpVtxNWxZ3bEX6C+6bb+jWuU0lE6o5i5h6Hxbxw
 wEPteuj1pTNgG0OJTvub5L3ZlMS5q26kxNQVN+jspbguqPOMru7irzLT28XYrRONv3/6ciqAABt
 7wefSSo4g6oHFXzEuCFnGvL+7w2Boo2O9MpRq+FXZubn
X-Google-Smtp-Source: AGHT+IHpwrE/9GG9C2SlpcasgbLprVybd7V3qfmK368RSyHmuII8fQHqzJpX5Xu5Sns9RSpMe6xOTQ==
X-Received: by 2002:a05:6a20:6a0c:b0:1f5:8903:860f with SMTP id
 adf61e73a8af0-1fa4428f303mr888720637.14.1742236464910; 
 Mon, 17 Mar 2025 11:34:24 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73711695a2esm8188770b3a.144.2025.03.17.11.34.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Mar 2025 11:34:24 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org,
 David Hildenbrand <david@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-riscv@nongnu.org,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, alex.bennee@linaro.org,
 manos.pitsidianakis@linaro.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>, kvm@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Peter Xu <peterx@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Anthony PERARD <anthony@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v6 00/18] make system memory API available for common code
Date: Mon, 17 Mar 2025 11:33:59 -0700
Message-Id: <20250317183417.285700-1-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

The main goal of this series is to be able to call any memory ld/st function
from code that is *not* target dependent. As a positive side effect, we can
turn related system compilation units into common code.

The first 5 patches remove dependency of memory API to cpu headers and remove
dependency to target specific code. This could be a series on its own, but it's
great to be able to turn system memory compilation units into common code to
make sure it can't regress, and prove it achieves the desired result.

The next patches remove more dependencies on cpu headers (exec-all,
memory-internal, ram_addr).
Then, we add access to a needed function from kvm, some xen stubs, and we
finally can turn our compilation units into common code.

Every commit was tested to build correctly for all targets (on windows, linux,
macos), and the series was fully tested by running all tests we have (linux,
x86_64 host).

v2:
- reorder first commits (tswap change first, so memory cached functions can use it)
- move st/ld*_p functions to tswap instead of bswap
- add define for target_words_bigendian when COMPILING_PER_TARGET, equals to
  TARGET_BIG_ENDIAN (avoid overhead in target code)
- rewrite devend_memop
- remove useless exec-all.h in concerned patch
- extract devend_big_endian function to reuse in system/memory.c
- rewrite changes to system/memory.c

v3:
- move devend functions to memory_internal.h
- completed description for commits removing cpu.h dependency

v4:
- rebase on top of master
  * missing include in 'codebase: prepare to remove cpu.h from exec/exec-all.h'
  * meson build conflict

v5:
- remove extra xen stub xen_invalidate_map_cache()
- edit xen stubs commit message

v6:
- remove xen inline stubs from headers

Pierrick Bouvier (18):
  exec/tswap: target code can use TARGET_BIG_ENDIAN instead of
    target_words_bigendian()
  exec/tswap: implement {ld,st}.*_p as functions instead of macros
  exec/memory_ldst: extract memory_ldst declarations from cpu-all.h
  exec/memory_ldst_phys: extract memory_ldst_phys declarations from
    cpu-all.h
  exec/memory.h: make devend_memop "target defines" agnostic
  codebase: prepare to remove cpu.h from exec/exec-all.h
  exec/exec-all: remove dependency on cpu.h
  exec/memory-internal: remove dependency on cpu.h
  exec/ram_addr: remove dependency on cpu.h
  system/kvm: make kvm_flush_coalesced_mmio_buffer() accessible for
    common code
  exec/ram_addr: call xen_hvm_modified_memory only if xen is enabled
  hw/xen: add stubs for various functions
  system/xen: remove inline stubs
  system/physmem: compilation unit is now common to all targets
  include/exec/memory: extract devend_big_endian from devend_memop
  include/exec/memory: move devend functions to memory-internal.h
  system/memory: make compilation unit common
  system/ioport: make compilation unit common

 include/exec/cpu-all.h              | 66 -----------------------
 include/exec/exec-all.h             |  1 -
 include/exec/memory-internal.h      | 21 +++++++-
 include/exec/memory.h               | 30 ++++-------
 include/exec/ram_addr.h             | 11 ++--
 include/exec/tswap.h                | 81 +++++++++++++++++++++++++++--
 include/system/kvm.h                |  6 +--
 include/system/xen-mapcache.h       | 41 ---------------
 include/system/xen.h                | 21 ++------
 include/tcg/tcg-op.h                |  1 +
 target/ppc/helper_regs.h            |  2 +
 include/exec/memory_ldst.h.inc      |  4 --
 include/exec/memory_ldst_phys.h.inc |  5 +-
 cpu-target.c                        |  1 +
 hw/ppc/spapr_nested.c               |  1 +
 hw/sh4/sh7750.c                     |  1 +
 hw/xen/xen_stubs.c                  | 51 ++++++++++++++++++
 page-vary-target.c                  |  2 +-
 system/ioport.c                     |  1 -
 system/memory.c                     | 17 ++----
 target/ppc/tcg-excp_helper.c        |  1 +
 target/riscv/bitmanip_helper.c      |  2 +-
 hw/xen/meson.build                  |  3 ++
 system/meson.build                  |  6 +--
 24 files changed, 191 insertions(+), 185 deletions(-)
 create mode 100644 hw/xen/xen_stubs.c

-- 
2.39.5


