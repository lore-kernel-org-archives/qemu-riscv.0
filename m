Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jVd2D-0003pH-8t
	for mharc-qemu-riscv@gnu.org; Mon, 04 May 2020 11:29:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jVd2B-0003m0-TD
 for qemu-riscv@nongnu.org; Mon, 04 May 2020 11:29:31 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:56713
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jVd29-0003rf-EA
 for qemu-riscv@nongnu.org; Mon, 04 May 2020 11:29:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588606168;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=0dDwkE6p8SsMPnxAPkn333jCRizbTYLoA4qGzMJg5yE=;
 b=NoXcMCtXsgWYcEWGC2DkT32qnSv28yVE73gRE/1h4e42AFTpIZDKcc0kR5oAzEMHHoo0Pm
 XanNDJ0D0CMXWg9Om7wJFqO94MD+3HCV2sTCEcq2EMcBX0IGdPUgJ+Dr27sExGsNBuc8ZL
 9fPIha0gz1ur0LMa4jT/FDHzj4FUUic=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-146-dFs0ssiyMlWaAHYSv4F85w-1; Mon, 04 May 2020 11:29:26 -0400
X-MC-Unique: dFs0ssiyMlWaAHYSv4F85w-1
Received: by mail-wm1-f72.google.com with SMTP id s12so5103898wmj.6
 for <qemu-riscv@nongnu.org>; Mon, 04 May 2020 08:29:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qUA+L4wC7Y/HEYRNDubgMlJGc6s5bp4bBZMbUfsNJrk=;
 b=QpAalo9YjOoafQp4mtM4B3WFvQKLoumzIx6VPiWlehjBjvoUloh9dGNmpX/yYj+684
 mOpmlqoSoPzGQKjTapqACAu9AfHf936/v8E1BtaLQ2TLgGyn09KdD5j9yNsdRUWufHl6
 ZOzIA3fVKBri2H7iPi6C8Zw1cAeyWCIPITkYeW/r5i1M1SPLnjoALnczd2XjhWuoYf5C
 yqpqEMje87ARKOaCDHTmq7tT9gkt6bcoSzS7Hri3r9M2m7mBk6TZucm1V0RDktvPXHnR
 mHs1b5TsX0otZU1VUVXf1rt/5xS60NF7/Gbzj/ectEOq70Vpy6+CpKfy88+1VVxTdzU7
 UZoA==
X-Gm-Message-State: AGi0PuZqumnRkLRR8T6JS+2pIFNqRdEDkFFKExsuQqplqPab8Zq3h9z5
 +wAiKGsvAycDh3vMgTv8Ljjz3DHi70tb8iHzTqQUjZowxnM+QH/e9ty57CWwt4/nxorB6J7Hzef
 FLYRMvKVFMHsBuoE=
X-Received: by 2002:a7b:c0d5:: with SMTP id s21mr15170762wmh.107.1588606165067; 
 Mon, 04 May 2020 08:29:25 -0700 (PDT)
X-Google-Smtp-Source: APiQypIq2QWQaCbGOj3Z7IwnTK7lXrQAhrMqXCntIn0TWYJZSO5HjLt49L/E9tbTZiIA8hEffVUcjw==
X-Received: by 2002:a7b:c0d5:: with SMTP id s21mr15170665wmh.107.1588606163927; 
 Mon, 04 May 2020 08:29:23 -0700 (PDT)
Received: from x1w.redhat.com (26.red-88-21-207.staticip.rima-tde.net.
 [88.21.207.26])
 by smtp.gmail.com with ESMTPSA id a13sm12076658wrv.67.2020.05.04.08.29.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2020 08:29:23 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Cornelia Huck <cohuck@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, Richard Henderson <rth@twiddle.net>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v3 00/12] user-mode: Prune build dependencies (part 1)
Date: Mon,  4 May 2020 17:29:10 +0200
Message-Id: <20200504152922.21365-1-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/04 04:24:57
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
X-List-Received-Date: Mon, 04 May 2020 15:29:32 -0000

This is the first part of a series reducing user-mode
dependencies. By stripping out unused code, the build
and testing time is reduced (as is space used by objects).

Part 1 (generic):
- reduce user-mode object list
- remove some migration code from user-mode
- remove cpu_get_crash_info()

This series is fully reviewed.

Since v2:
- Rebased due to conflict when applying patch:
  "util/Makefile: Reduce the user-mode object list"
  because commit 01ef6b9e4e modified util/Makefile.objs:
  "linux-user: factor out reading of /proc/self/maps"

Since v1:
- Addressed Laurent/Richard review comments
- Removed 'exec: Drop redundant #ifdeffery'
- Removed 'target: Restrict write_elfXX_note() handlers to system-mode'

$ git backport-diff -u v1 -r v2
Key:
[----] : patches are identical
[####] : number of functional differences between upstream/downstream patch
[down] : patch is downstream-only
The flags [FC] indicate (F)unctional and (C)ontextual differences, respecti=
vely

001/12:[----] [--] 'Makefile: Only build virtiofsd if system-mode is enable=
d'
002/12:[----] [--] 'configure: Avoid building TCG when not needed'
003/12:[----] [--] 'tests/Makefile: Only display TCG-related tests when TCG=
 is available'
004/12:[----] [--] 'tests/Makefile: Restrict some softmmu-only tests'
005/12:[----] [-C] 'util/Makefile: Reduce the user-mode object list'
006/12:[----] [--] 'stubs/Makefile: Reduce the user-mode object list'
007/12:[----] [--] 'target/riscv/cpu: Restrict CPU migration to system-mode=
'
008/12:[----] [--] 'exec: Assert CPU migration is not used on user-only bui=
ld'
009/12:[----] [--] 'arch_init: Remove unused 'qapi-commands-misc.h' include=
'
010/12:[----] [--] 'target/i386: Restrict CpuClass::get_crash_info() to sys=
tem-mode'
011/12:[----] [--] 'target/s390x: Restrict CpuClass::get_crash_info() to sy=
stem-mode'
012/12:[----] [--] 'hw/core: Restrict CpuClass::get_crash_info() to system-=
mode'

Philippe Mathieu-Daud=C3=A9 (12):
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

 configure              |  4 +++
 Makefile               |  2 +-
 include/hw/core/cpu.h  |  7 ++++-
 arch_init.c            |  1 -
 exec.c                 |  4 ++-
 hw/core/cpu.c          |  2 ++
 target/i386/cpu.c      |  6 ++++-
 target/riscv/cpu.c     |  6 +++--
 target/s390x/cpu.c     | 12 ++++-----
 stubs/Makefile.objs    | 52 +++++++++++++++++++++----------------
 tests/Makefile.include | 18 +++++++------
 util/Makefile.objs     | 59 +++++++++++++++++++++++++++---------------
 12 files changed, 108 insertions(+), 65 deletions(-)

--=20
2.21.3


