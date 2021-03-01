Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lGqRo-0000AS-PB
	for mharc-qemu-riscv@gnu.org; Mon, 01 Mar 2021 16:51:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lGqRl-00006P-H1; Mon, 01 Mar 2021 16:51:21 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:42024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lGqRj-0004gv-Gc; Mon, 01 Mar 2021 16:51:20 -0500
Received: by mail-ej1-x62c.google.com with SMTP id c10so4654206ejx.9;
 Mon, 01 Mar 2021 13:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TgU9g7sxuuToYY0NcbUASWLJoXAYrOMW28gUzw0UYX4=;
 b=MjUxIOyJmZt42YG/WnmTH7i+XkiKjXJtVBoVDF2uqpZcPx2bE7UBkt7K7Xedpifgzv
 uVVHZqkiYkq150I/IyLhHiXcxwzqKtlclERrTdetQmrEYTFL1BSksR3cbcneP6ahc2QV
 SX8sivvauRZ8ONUZ+XUgWH2tZgkg+myHwS+hDLUPq/+D/1ac2xGspba+rzN/nb0ewWNk
 j5bj1RWR3jN7JTF7d2edAziBcMKc8ifpqx2OYepTR8hChcOmRVTi+QY7tsbfpkiqBc/P
 6H9fuOiffS4CqoX46+gkBwwKbfx0drAAKzKSXgHmrdPS4lVPtOgFBmz6+OBod0RTqrMP
 +6lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=TgU9g7sxuuToYY0NcbUASWLJoXAYrOMW28gUzw0UYX4=;
 b=HYlz/U3BtaoaCOgnjqteDC1Co3RLS9eNM+5Km/rYK1EwPJiGIsVugyHIwV6jyHbAw8
 LgItuktg5Y42Y1nsM7vdV1VjDzcBFCN7CoW4Lf0JDnx2z2K/WVt57ka9F2PeqJdI61+G
 zOc/hxAAh5mHAK+LxdQLa6xEksFahQTxNVhSD/ylNm5Ka23LJsHDrkZgVW706mAywCTh
 EKZOoo387PoQlh5inMFiOifTMtPyeMJynKNGpKeRrG1ihw7L8n5RzJns0yGKx3wpQ+aO
 MdJD9WOFlVqKmbJLDggsT8nKe6O4RIQbiOfXLXfXsOq/rBmIW25HSWtynBEtb9smkKcP
 VjSw==
X-Gm-Message-State: AOAM533Wc3xA4fwbWSDM9oiVHWmpx2S+mIHMVj9DZivytnZwfU7Q69wx
 /Eh/U3LNj0A7af8EiqPDyex6O3FsERA=
X-Google-Smtp-Source: ABdhPJyOMhDtue9R8x/eGIqKv9n/57r+82/Iadqsps0DpOp6wVPi0IcDaksBuDT2wcEJ+AivKY7uxA==
X-Received: by 2002:a17:906:cecc:: with SMTP id
 si12mr17899227ejb.461.1614635474708; 
 Mon, 01 Mar 2021 13:51:14 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id m7sm15710201ejk.52.2021.03.01.13.51.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Mar 2021 13:51:14 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Michael Rolnik <mrolnik@gmail.com>, Anthony Green <green@moxielogic.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Marek Vasut <marex@denx.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Stafford Horne <shorne@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-s390x@nongnu.org,
 Chris Wulff <crwulff@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Aurelien Jarno <aurelien@aurel32.net>,
 David Gibson <david@gibson.dropbear.id.au>,
 Sarah Harris <S.E.Harris@kent.ac.uk>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, qemu-riscv@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, qemu-ppc@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Claudio Fontana <cfontana@suse.de>,
 Michael Walle <michael@walle.cc>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Thomas Huth <thuth@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Greg Kurz <groug@kaod.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Max Filippov <jcmvbkbc@gmail.com>
Subject: [PATCH v2 00/17] cpu: Introduce SysemuCPUOps structure
Date: Mon,  1 Mar 2021 22:50:53 +0100
Message-Id: <20210301215110.772346-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
X-List-Received-Date: Mon, 01 Mar 2021 21:51:23 -0000

Hi,=0D
=0D
This series is inspired on Claudio TCG work.=0D
=0D
Instead of separate TCG from other accelerators, here we=0D
separate sysemu operations (system VS user).=0D
=0D
Patches 1-6 are generic cleanups.=0D
Patches 7-15 move from CPUClass to SysemuCPUOps=0D
Patches 16-17 restrict SysemuCPUOps to sysemu=0D
=0D
Since v1:=0D
- Name 'sysemu' (Claudio)=0D
- change each field progressively (Richard)=0D
=0D
Regards,=0D
=0D
Phil.=0D
=0D
Supersedes: <20210226163227.4097950-1-f4bug@amsat.org>=0D
=0D
Philippe Mathieu-Daud=C3=A9 (17):=0D
  target: Set CPUClass::vmsd instead of DeviceClass::vmsd=0D
  cpu: Un-inline cpu_get_phys_page_debug and cpu_asidx_from_attrs=0D
  cpu: Introduce cpu_virtio_is_big_endian()=0D
  cpu: Directly use cpu_write_elf*() fallback handlers in place=0D
  cpu: Directly use get_paging_enabled() fallback handlers in place=0D
  cpu: Directly use get_memory_mapping() fallback handlers in place=0D
  cpu: Introduce SysemuCPUOps structure=0D
  cpu: Move CPUClass::vmsd to SysemuCPUOps=0D
  cpu: Move CPUClass::virtio_is_big_endian to SysemuCPUOps=0D
  cpu: Move CPUClass::get_crash_info to SysemuCPUOps=0D
  cpu: Move CPUClass::write_elf* to SysemuCPUOps=0D
  cpu: Move CPUClass::asidx_from_attrs to SysemuCPUOps=0D
  cpu: Move CPUClass::get_phys_page_debug to SysemuCPUOps=0D
  cpu: Move CPUClass::get_memory_mapping to SysemuCPUOps=0D
  cpu: Move CPUClass::get_paging_enabled to SysemuCPUOps=0D
  cpu: Restrict cpu_paging_enabled / cpu_get_memory_mapping to sysemu=0D
  cpu: Restrict "hw/core/sysemu-cpu-ops.h" to target/cpu.c=0D
=0D
 include/hw/core/cpu.h            |  91 ++++++-------------------=0D
 include/hw/core/sysemu-cpu-ops.h |  89 ++++++++++++++++++++++++=0D
 cpu.c                            |  19 +++---=0D
 hw/core/cpu.c                    | 113 +++++++++++++++++--------------=0D
 hw/virtio/virtio.c               |   4 +-=0D
 target/alpha/cpu.c               |  11 ++-=0D
 target/arm/cpu.c                 |  19 ++++--=0D
 target/avr/cpu.c                 |   9 ++-=0D
 target/cris/cpu.c                |  11 ++-=0D
 target/hppa/cpu.c                |  11 ++-=0D
 target/i386/cpu.c                |  29 +++++---=0D
 target/lm32/cpu.c                |  10 ++-=0D
 target/m68k/cpu.c                |  11 ++-=0D
 target/microblaze/cpu.c          |  11 ++-=0D
 target/mips/cpu.c                |  11 ++-=0D
 target/moxie/cpu.c               |  11 +--=0D
 target/nios2/cpu.c               |  16 ++++-=0D
 target/openrisc/cpu.c            |  11 ++-=0D
 target/riscv/cpu.c               |  13 +++-=0D
 target/rx/cpu.c                  |  17 ++++-=0D
 target/s390x/cpu.c               |  15 ++--=0D
 target/sh4/cpu.c                 |  11 ++-=0D
 target/sparc/cpu.c               |  11 ++-=0D
 target/tricore/cpu.c             |  14 +++-=0D
 target/unicore32/cpu.c           |   8 ++-=0D
 target/xtensa/cpu.c              |  11 ++-=0D
 target/ppc/translate_init.c.inc  |  21 +++---=0D
 27 files changed, 409 insertions(+), 199 deletions(-)=0D
 create mode 100644 include/hw/core/sysemu-cpu-ops.h=0D
=0D
-- =0D
2.26.2=0D
=0D

