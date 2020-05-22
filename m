Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jcBQD-0003rR-Id
	for mharc-qemu-riscv@gnu.org; Fri, 22 May 2020 13:25:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jcBQB-0003nq-CQ
 for qemu-riscv@nongnu.org; Fri, 22 May 2020 13:25:23 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:41060
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jcBQA-0001ql-Bz
 for qemu-riscv@nongnu.org; Fri, 22 May 2020 13:25:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590168320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ce7vwIQ/1ZeC11tqPgLtvrw+eu2OuNpc1sn0JnggcMk=;
 b=f5Oukqh9/kzUCKUfEGvFiaaEawPwybGTwjpClMjhCcaDrYx+euBOk2yhVqg431J1qLVSY/
 WdMt068OyEemj2YU4XiCHudHJhD6aPe+Nt1QScwH9DuRmrIxhmANOBPFOyTM/vd0IPWE5h
 V2IyGbPtA6oQFSiuPS2dKTWfgcH8D90=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-484-H5EwZ0ycNf6MV5B1GGZbsw-1; Fri, 22 May 2020 13:25:16 -0400
X-MC-Unique: H5EwZ0ycNf6MV5B1GGZbsw-1
Received: by mail-wm1-f71.google.com with SMTP id t82so2914432wmf.4
 for <qemu-riscv@nongnu.org>; Fri, 22 May 2020 10:25:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ce7vwIQ/1ZeC11tqPgLtvrw+eu2OuNpc1sn0JnggcMk=;
 b=C5T7eAZOLjOwGgUhZkQ678P+EpEyc8X2f5NK5o8YeAeuVidIpfRDfaF7PPKKwV8tF1
 SpJDBllkbQ5+iSqVY8+aWsp+mIXHx5mDQ9XM9XUNVRXMa8ONfXQqJlLBgBRNzD/2096B
 mHwTfTCdK0Jmu13ff/pg1YaiwKxEp15k+emEY1HyoAKCU12U2McTKXVA0en972OWKS0C
 PLrEeZicN2v+DxkUEjrLeSG9c3yAMNgjGumUkVOCvtGiEMGjAjt1/HE6us3sQSYMSFqi
 MAaqzVhL5KMEAKYTx2QKG5xUUvCpubckY3v8Er+HTichu3qX6qac6MS5tnvdqsWtq04C
 NC1g==
X-Gm-Message-State: AOAM5320g7EyW6xDRUBWGg4ArpTN8U5K2RaJKLHGaGYZehXpWLp4JsIj
 PmZJFT8pyOJWlhVNhWHoBveeIZKeeqvsk4kOAksLAjsVMM3L6pvJJc6ZRFSqBaRHrd11w3wpCg4
 FpRalm6l3NJh2ZO0=
X-Received: by 2002:adf:8b47:: with SMTP id v7mr4023293wra.238.1590168313371; 
 Fri, 22 May 2020 10:25:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw5AaGrh13hJG8N4Mlym85bdOO8V3LNiw21Bv2sTklQf051BbLKGaJpXa+FDGTS1ecnxj0l4w==
X-Received: by 2002:adf:8b47:: with SMTP id v7mr4023266wra.238.1590168313010; 
 Fri, 22 May 2020 10:25:13 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id x10sm10422397wrn.54.2020.05.22.10.25.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2020 10:25:12 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Cornelia Huck <cohuck@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, David Hildenbrand <david@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v4 00/13] user-mode: Prune build dependencies (part 1)
Date: Fri, 22 May 2020 19:24:57 +0200
Message-Id: <20200522172510.25784-1-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/22 10:36:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Fri, 22 May 2020 17:25:23 -0000

This is the first part of a series reducing user-mode
dependencies. By stripping out unused code, the build
and testing time is reduced (as is space used by objects).

Part 1 (generic):
- reduce user-mode object list
- remove some migration code from user-mode
- remove cpu_get_crash_info()

Patches 1-12 are fully reviewed.

Since v3:
- Rebased due to (trivial) conflicts after:
  . commit 2df9f5718df7722924699a3754f99165e2f4ae35
    ui/win32-kbd-hook: handle AltGr in a hook procedure
  . commit b69c3c21a5d11075d42100d5cfe0a736593fae6b
    qdev: Unrealize must not fail
  . commit d2623129a7dec1d3041ad1221dda1ca49c667532
    qom: Drop parameter @errp of object_property_add() & friends
- Added patch #13 'Restrict ui/win32-kbd-hook to system-mode'

Since v2:
- Rebased due to conflict when applying patch:
  "util/Makefile: Reduce the user-mode object list"
  because commit 01ef6b9e4e modified util/Makefile.objs:
  "linux-user: factor out reading of /proc/self/maps"

Since v1:
- Addressed Laurent/Richard review comments
- Removed 'exec: Drop redundant #ifdeffery'
- Removed 'target: Restrict write_elfXX_note() handlers to system-mode'

$ git backport-diff -u v2 -r v3
Key:
[----] : patches are identical
[####] : number of functional differences between upstream/downstream patch
[down] : patch is downstream-only
The flags [FC] indicate (F)unctional and (C)ontextual differences, respectively

001/13:[----] [--] 'Makefile: Only build virtiofsd if system-mode is enabled'
002/13:[----] [--] 'configure: Avoid building TCG when not needed'
003/13:[----] [--] 'tests/Makefile: Only display TCG-related tests when TCG is available'
004/13:[----] [--] 'tests/Makefile: Restrict some softmmu-only tests'
005/13:[----] [--] 'util/Makefile: Reduce the user-mode object list'
006/13:[----] [-C] 'stubs/Makefile: Reduce the user-mode object list'
007/13:[----] [--] 'target/riscv/cpu: Restrict CPU migration to system-mode'
008/13:[----] [--] 'exec: Assert CPU migration is not used on user-only build'
009/13:[----] [--] 'arch_init: Remove unused 'qapi-commands-misc.h' include'
010/13:[----] [-C] 'target/i386: Restrict CpuClass::get_crash_info() to system-mode'
011/13:[----] [-C] 'target/s390x: Restrict CpuClass::get_crash_info() to system-mode'
012/13:[----] [--] 'hw/core: Restrict CpuClass::get_crash_info() to system-mode'
013/13:[down] 'stubs: Restrict ui/win32-kbd-hook to system-mode'

Philippe Mathieu-Daudé (13):
  Makefile: Only build virtiofsd if system-mode is enabled
  configure: Avoid building TCG when not needed
  tests/Makefile: Only display TCG-related tests when TCG is available
  tests/Makefile: Restrict some softmmu-only tests
  util/Makefile: Reduce the user-mode object list
  stubs/Makefile: Reduce the user-mode object list
  target/riscv/cpu: Restrict CPU migration to system-mode
  exec: Assert CPU migration is not used on user-only build
  arch_init: Remove unused 'qapi-commands-misc.h' include
  target/i386: Restrict CpuClass::get_crash_info() to system-mode
  target/s390x: Restrict CpuClass::get_crash_info() to system-mode
  hw/core: Restrict CpuClass::get_crash_info() to system-mode
  stubs: Restrict ui/win32-kbd-hook to system-mode

 configure              |  4 +++
 Makefile               |  2 +-
 include/hw/core/cpu.h  |  7 ++++-
 arch_init.c            |  1 -
 exec.c                 |  4 ++-
 hw/core/cpu.c          |  2 ++
 target/i386/cpu.c      |  6 ++++-
 target/riscv/cpu.c     |  6 +++--
 target/s390x/cpu.c     | 12 ++++-----
 stubs/Makefile.objs    | 54 ++++++++++++++++++++++----------------
 tests/Makefile.include | 18 +++++++------
 util/Makefile.objs     | 59 +++++++++++++++++++++++++++---------------
 12 files changed, 109 insertions(+), 66 deletions(-)

-- 
2.21.3


