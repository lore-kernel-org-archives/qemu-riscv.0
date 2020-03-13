Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jCpB9-0007ee-Cv
	for mharc-qemu-riscv@gnu.org; Fri, 13 Mar 2020 14:37:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53004)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jCpB6-0007dI-Ok
 for qemu-riscv@nongnu.org; Fri, 13 Mar 2020 14:37:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jCpB5-0002BM-A2
 for qemu-riscv@nongnu.org; Fri, 13 Mar 2020 14:37:00 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:26607
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jCpB5-00029I-4o
 for qemu-riscv@nongnu.org; Fri, 13 Mar 2020 14:36:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584124618;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=LlpMWUrtmzUqdAEMSyBsmvOkuEwO+0Reg5YUJ16z+Cc=;
 b=Bge88/wGnHXPPZpCVJZYVlq6jk4BZ42K5OzRo79Gt+0zhPs0Uan/+XuPJ6td12HCpTK94X
 00SK7ye81nNtqGkEvR8MaoTyc13KcyFG//eOhHNNB60NfqpcxRF+UH3Ywxo/IJlDTqeIzw
 XD1YGtCyjS3kQ/9QdX9D8E7fY5pBlR4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-350-JrC0zMfuMACWx1ONeGidAw-1; Fri, 13 Mar 2020 14:36:56 -0400
X-MC-Unique: JrC0zMfuMACWx1ONeGidAw-1
Received: by mail-wm1-f72.google.com with SMTP id x7so3301326wmi.4
 for <qemu-riscv@nongnu.org>; Fri, 13 Mar 2020 11:36:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tT9l7cduJOEnaW27bPqDaHoIXT0dr05sJq/BTyFEpNQ=;
 b=nXYNhWZo7E7oLqdTtVInVsf1teORd8w3hUwR/qpiQKDc96AiA1qVea6eIjKRdXxIu4
 vwnR4ohYt/hilCJeqZAYoeYvenMpll2cAagwd6/AytP2f8CB5dLgvJLAcwT2nuSEeHNM
 XO5u6k4KkLvb6kR+nvLjYsptxszhHpiRE9OPQvbSqE5bhQ6ht8TH5vlS04b+3AEzsQzG
 ABaAuF88Z0hhpi5qTbuaFOHLaqNyJeoyrcBZLD4wPLI1uApdZQtOxfIVhR1LcawuOD/Z
 A0B24iowm2RRpUOE4bOPrx7WrQ48l4k+yFGKhtU4zszSHLqX94bm1hCOoje8KyQJIw/3
 UAUw==
X-Gm-Message-State: ANhLgQ3UdwtiTIjd7MkaNSIjE23xnVB7aYjQ79Pnag7AxFzMoUB5MoDf
 PHUi9oU2YomXqKBlOLKOtWvaoxAfJJY+6KQCDDweKS+okpS41NEATF6FxK8QKAAwDEJ5FodImzn
 fA+1+dvnrwKlgtV4=
X-Received: by 2002:adf:e883:: with SMTP id d3mr18744598wrm.75.1584124615599; 
 Fri, 13 Mar 2020 11:36:55 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vt9mytHYo/pSWgoSKjkVW0PoSDhZoUUt6iMQk5TCvXjj6f09M3be890BT+eyPIlV2DYV8WIKA==
X-Received: by 2002:adf:e883:: with SMTP id d3mr18744553wrm.75.1584124615257; 
 Fri, 13 Mar 2020 11:36:55 -0700 (PDT)
Received: from x1w.redhat.com (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id l7sm9367538wrw.33.2020.03.13.11.36.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Mar 2020 11:36:54 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Alistair Francis <Alistair.Francis@wdc.com>, qemu-ppc@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-s390x@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <rth@twiddle.net>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-riscv@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-arm@nongnu.org,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH 00/14] user-mode: Prune build dependencies (part 1)
Date: Fri, 13 Mar 2020 19:36:38 +0100
Message-Id: <20200313183652.10258-1-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
X-List-Received-Date: Fri, 13 Mar 2020 18:37:02 -0000

This is the first part of a series reducing user-mode
dependencies. By stripping out unused code, the build
and testing time is reduced (as is space used by objects).

Part 1:
- reduce user-mode object list
- remove some migration code from user-mode
- remove cpu_get_crash_info()

Philippe Mathieu-Daud=C3=A9 (14):
  Makefile: Only build virtiofsd if system-mode is enabled
  configure: Avoid building TCG when not needed
  tests/Makefile: Only display TCG-related tests when TCG is available
  tests/Makefile: Restrict some softmmu-only tests
  stubs/Makefile: Reduce the user-mode object list
  util/Makefile: Reduce the user-mode object list
  target/riscv/cpu: Restrict CPU migration to system-mode
  exec: Assert CPU migration is not used on user-only build
  exec: Drop redundant #ifdeffery
  arch_init: Remove unused 'qapi-commands-misc.h' include
  target: Restrict write_elfXX_note() handlers to system-mode
  target/i386: Restrict CpuClass::get_crash_info() to system-mode
  target/s390x: Restrict CpuClass::get_crash_info() to system-mode
  hw/core: Restrict CpuClass::get_crash_info() to system-mode

 configure                       |  4 +++
 Makefile                        |  4 +--
 include/hw/core/cpu.h           |  7 +++-
 target/arm/cpu.h                | 10 +++---
 target/i386/cpu.h               | 18 +++++-----
 target/ppc/cpu.h                |  2 --
 target/s390x/internal.h         |  3 +-
 arch_init.c                     |  1 -
 exec.c                          |  8 ++---
 hw/core/cpu.c                   |  2 ++
 target/i386/cpu.c               |  6 +++-
 target/ppc/translate_init.inc.c |  2 --
 target/riscv/cpu.c              |  6 ++--
 target/s390x/cpu.c              | 12 +++----
 stubs/Makefile.objs             | 52 +++++++++++++++++------------
 tests/Makefile.include          | 18 +++++-----
 util/Makefile.objs              | 59 +++++++++++++++++++++------------
 17 files changed, 125 insertions(+), 89 deletions(-)

--=20
2.21.1


