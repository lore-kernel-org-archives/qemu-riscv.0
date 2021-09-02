Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mLpNf-0006vg-VH
	for mharc-qemu-riscv@gnu.org; Thu, 02 Sep 2021 12:15:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLpNe-0006qJ-82; Thu, 02 Sep 2021 12:15:58 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:39716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLpNZ-0000Ia-Nf; Thu, 02 Sep 2021 12:15:55 -0400
Received: by mail-wr1-x434.google.com with SMTP id z4so3826552wrr.6;
 Thu, 02 Sep 2021 09:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Cx9tmtcMe/yqb/L4FxX6s6fgCGjzmE2xzXTNn5n4WRY=;
 b=mcdkcgUkPmIymlgoHwDrJpvE9KHw9dvSG2MlkuM7+LMu3zkIYpqtCeCGgcISYDoKCb
 8696YyJt2CPh12bbX7QpwDA8IAMyJN7taR/RiiyUq4y4j+fSACZ5oqQ08yGPg+QlMR0S
 hitbbr51iTLrvFSzYtCDWEBhD9WU3oObbn7IgCnxkcpgU8/Bpb/PRbBi6oyJFhSCPB/4
 T4eJ4wL0xOuOcg0FizPKZv0AhuncICKZC1qKdxIbn5OpaC/dbV050AWnqohvIXKAkBb9
 MuFoocUeCUvdcKKf//7Z32DJC9YmwC2EKSjtLp0AMfq+R5Wwnd7FM6PpEyUZ4hvUxjzc
 2tig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=Cx9tmtcMe/yqb/L4FxX6s6fgCGjzmE2xzXTNn5n4WRY=;
 b=DXVoPzIcuSZ8svWYZ71oCNmkkE8YFGS6Ql8UG0F1m980QACOlF2LkRJSTrYgsATY+C
 eN4C3GgiIPfNPndMqZrdYwhjexLkj4h8JV0Z7tChmoUJ004GgZ28DIKV6olzbRnIFycx
 D9kI7TN0AoZsKgAi+a6SPoQ1dNFFgULABYk5iTMwYJ3UJE1eAIcaIVgyVJTIG6fhBcT/
 nv0Nx8mXc59fT9mG/05qsdWyQpvEdXHCnca7eRuVGSGv3Rm1hjptISRMamhG2IPlYVv4
 qe5xvbB7okGGixRYT2OEEofFaQoACuxkzqRqBWTW2NR9cmVIG+SR3ZFHTZGRu4cKJY4z
 lFmg==
X-Gm-Message-State: AOAM532jRYte2o8MdJAmhqnzwBNTEKpTgVTuSJEaAzSqBrQ1A5AExH4r
 rq0UyEQyURbrF3mSLxPRWOh7UYWQ47w=
X-Google-Smtp-Source: ABdhPJwMW19l1RT5uyseQGoPrvV+9UXH/fieGpgiPEuYOlcUopWj6VFIU2AjhhvSZ8tr8ff4GeIa0w==
X-Received: by 2002:adf:8144:: with SMTP id 62mr4741623wrm.144.1630599347027; 
 Thu, 02 Sep 2021 09:15:47 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 j18sm2355853wrd.56.2021.09.02.09.15.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 09:15:45 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Greg Kurz <groug@kaod.org>, haxm-team@intel.com,
 Kamil Rytarowski <kamil@netbsd.org>, qemu-ppc@nongnu.org,
 Anthony Perard <anthony.perard@citrix.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Michael Rolnik <mrolnik@gmail.com>, qemu-riscv@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Cameron Esfahani <dirty@apple.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Taylor Simpson <tsimpson@quicinc.com>,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paul Durrant <paul@xen.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Laurent Vivier <laurent@vivier.eu>, Cornelia Huck <cohuck@redhat.com>,
 qemu-arm@nongnu.org, Wenchao Wang <wenchao.wang@intel.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 xen-devel@lists.xenproject.org, Marek Vasut <marex@denx.de>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Colin Xu <colin.xu@intel.com>, Claudio Fontana <cfontana@suse.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, Stafford Horne <shorne@gmail.com>,
 Reinoud Zandijk <reinoud@netbsd.org>, kvm@vger.kernel.org
Subject: [PATCH v3 00/30] accel: Move has_work() from SysemuCPUOps to
 AccelOpsClass
Date: Thu,  2 Sep 2021 18:15:13 +0200
Message-Id: <20210902161543.417092-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Thu, 02 Sep 2021 16:15:58 -0000

Hi,=0D
=0D
CPU has_work() is a per-accelerator handler. This series=0D
- explicit the KVM / WHPX implementations=0D
- moves TCG implementations in AccelOpsClass=0D
- explicit missing implementations (returning 'false').=0D
=0D
Since v2:=0D
- Full rewrite, no more RFC.=0D
=0D
Supersedes: <20210304222323.1954755-1-f4bug@amsat.org>=0D
"cpu: Move CPUClass::has_work() to TCGCPUOps"=0D
=0D
Philippe Mathieu-Daud=C3=A9 (30):=0D
  accel/tcg: Restrict cpu_handle_halt() to sysemu=0D
  hw/core: Restrict cpu_has_work() to sysemu=0D
  hw/core: Un-inline cpu_has_work()=0D
  sysemu: Introduce AccelOpsClass::has_work()=0D
  accel/kvm: Implement AccelOpsClass::has_work()=0D
  accel/whpx: Implement AccelOpsClass::has_work()=0D
  accel/tcg: Implement AccelOpsClass::has_work() as stub=0D
  target/alpha: Restrict has_work() handler to sysemu and TCG=0D
  target/arm: Restrict has_work() handler to sysemu and TCG=0D
  target/avr: Restrict has_work() handler to sysemu and TCG=0D
  target/cris: Restrict has_work() handler to sysemu and TCG=0D
  target/hexagon: Remove unused has_work() handler=0D
  target/hppa: Restrict has_work() handler to sysemu and TCG=0D
  target/i386: Restrict has_work() handler to sysemu and TCG=0D
  target/m68k: Restrict has_work() handler to sysemu and TCG=0D
  target/microblaze: Restrict has_work() handler to sysemu and TCG=0D
  target/mips: Restrict has_work() handler to sysemu and TCG=0D
  target/nios2: Restrict has_work() handler to sysemu and TCG=0D
  target/openrisc: Restrict has_work() handler to sysemu and TCG=0D
  target/ppc: Restrict has_work() handler to sysemu and TCG=0D
  target/ppc: Introduce PowerPCCPUClass::has_work()=0D
  target/ppc: Simplify has_work() handlers=0D
  target/riscv: Restrict has_work() handler to sysemu and TCG=0D
  target/rx: Restrict has_work() handler to sysemu and TCG=0D
  target/s390x: Restrict has_work() handler to sysemu and TCG=0D
  target/sh4: Restrict has_work() handler to sysemu and TCG=0D
  target/sparc: Restrict has_work() handler to sysemu and TCG=0D
  target/tricore: Restrict has_work() handler to sysemu and TCG=0D
  target/xtensa: Restrict has_work() handler to sysemu and TCG=0D
  accel: Add missing AccelOpsClass::has_work() and drop SysemuCPUOps one=0D
=0D
 include/hw/core/cpu.h             |  28 +--=0D
 include/hw/core/tcg-cpu-ops.h     |   4 +=0D
 include/sysemu/accel-ops.h        |   5 +=0D
 target/ppc/cpu-qom.h              |   3 +=0D
 accel/hvf/hvf-accel-ops.c         |   6 +=0D
 accel/kvm/kvm-accel-ops.c         |   6 +=0D
 accel/qtest/qtest.c               |   6 +=0D
 accel/tcg/cpu-exec.c              |   8 +-=0D
 accel/tcg/tcg-accel-ops.c         |  12 ++=0D
 accel/xen/xen-all.c               |   6 +=0D
 hw/core/cpu-common.c              |   6 -=0D
 softmmu/cpus.c                    |  10 +-=0D
 target/alpha/cpu.c                |   4 +-=0D
 target/arm/cpu.c                  |   7 +-=0D
 target/avr/cpu.c                  |   4 +-=0D
 target/cris/cpu.c                 |   4 +-=0D
 target/hexagon/cpu.c              |   6 -=0D
 target/hppa/cpu.c                 |   4 +-=0D
 target/i386/cpu.c                 |   6 -=0D
 target/i386/hax/hax-accel-ops.c   |   6 +=0D
 target/i386/nvmm/nvmm-accel-ops.c |   6 +=0D
 target/i386/tcg/tcg-cpu.c         |   8 +-=0D
 target/i386/whpx/whpx-accel-ops.c |   6 +=0D
 target/m68k/cpu.c                 |   4 +-=0D
 target/microblaze/cpu.c           |  10 +-=0D
 target/mips/cpu.c                 |   4 +-=0D
 target/nios2/cpu.c                |   4 +-=0D
 target/openrisc/cpu.c             |   4 +-=0D
 target/ppc/cpu_init.c             | 324 +++++++++++++++---------------=0D
 target/riscv/cpu.c                |   8 +-=0D
 target/rx/cpu.c                   |   4 +-=0D
 target/s390x/cpu.c                |   4 +-=0D
 target/sh4/cpu.c                  |   7 +-=0D
 target/sparc/cpu.c                |   4 +-=0D
 target/tricore/cpu.c              |   6 +-=0D
 target/xtensa/cpu.c               |  16 +-=0D
 36 files changed, 321 insertions(+), 239 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D

