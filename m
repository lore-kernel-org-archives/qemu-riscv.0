Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lFg2o-0003wA-T7
	for mharc-qemu-riscv@gnu.org; Fri, 26 Feb 2021 11:32:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lFg2e-0003sO-P6; Fri, 26 Feb 2021 11:32:38 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:43076)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lFg2d-0007V4-8O; Fri, 26 Feb 2021 11:32:36 -0500
Received: by mail-wr1-x432.google.com with SMTP id w11so9141811wrr.10;
 Fri, 26 Feb 2021 08:32:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4uPNQ+x6dgpO2mtsJsF++IAMYIxf8tpt6ZTe02Ue5UU=;
 b=avPC5U10G976cv3P0prBc5nAb7/EpYG0QQUpIKGl8ukDFzuaMqeh4H7+ZGcGb/Ke5I
 HqJ+1frnWszvW9Y1Di/c3odqjbQOYGnAJJD/UjMwHetac4ICNfigk9RAxF8ccJj5VAoF
 K/wjz61R3Him+CqJ4CTMiffdY1ZpU4fj2iCnV4tTwyQ8pSZjAUEBtsWObCUgQw0kRnpC
 SUSiOGfMeJ1dM+wxG2I54eK70uZs0hnOT5rgkpz4VMQSGMN0+UdMhv5Iz2OV2S7fnx0w
 E2o8/q9+DdkRURkV8RzJNkYxqxiaQPVZfWGcQKNCWyTXZe1MktGzNOh5pzwM+bLRs9UB
 fDrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=4uPNQ+x6dgpO2mtsJsF++IAMYIxf8tpt6ZTe02Ue5UU=;
 b=LKTBF4DMRV2eN0cFtN0eNN09OnvOMLnGBI+7g2U28ZwyRCRuMhaY3bISqyrJFk8vMe
 Cym7ElToTcR30r+GI/8C1V3Vt/pQc5iRz9N+mt86IuvfgwgCsD1WoPGVLZgQOFbaVnaf
 CXO7NLvoWPnIDQSxaVHtgctGvKTRWlr6iH/qhK7whmXuLV4eGubfKqxVtqqP+Qh38z/M
 nE5WpXPYHMK1y+dqxYZwzIsGWz3LWuLyrsyIY+vSNbMDl+LGKJjq4PmvcyPucFa0dcZb
 ib0+nAAA//6PVNmC033HfT6VpUYpRgLUFZYE6AZqXZocxQOsFK4R4V8VXm+UbKzqWuEJ
 W4vw==
X-Gm-Message-State: AOAM5327oYWt2viAQTYEjMGg11qjd/Kl15OS7iN7QIqFYL4vWGBkcrD9
 fUax8NRFtEnXUBrG8YY4ETWZiYaw5SM=
X-Google-Smtp-Source: ABdhPJzS15zQqhZYU033d8ID3jjThbUsC93YtRmh88y75XFQICFC7O9HR5TP8+8RLiE1A2bdphM1dw==
X-Received: by 2002:a5d:63ce:: with SMTP id c14mr4076765wrw.15.1614357151642; 
 Fri, 26 Feb 2021 08:32:31 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id y10sm5650344wrl.19.2021.02.26.08.32.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 08:32:31 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Sarah Harris <S.E.Harris@kent.ac.uk>,
 Paolo Bonzini <pbonzini@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, qemu-s390x@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>, qemu-ppc@nongnu.org,
 Marek Vasut <marex@denx.de>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Michael Walle <michael@walle.cc>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
 Laurent Vivier <laurent@vivier.eu>, Anthony Green <green@moxielogic.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, David Hildenbrand <david@redhat.com>,
 qemu-riscv@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 Peter Maydell <peter.maydell@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Chris Wulff <crwulff@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Claudio Fontana <cfontana@suse.de>, Thomas Huth <thuth@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Greg Kurz <groug@kaod.org>,
 Stafford Horne <shorne@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: [PATCH 00/16] cpu: Introduce CPUSystemOperations structure
Date: Fri, 26 Feb 2021 17:32:11 +0100
Message-Id: <20210226163227.4097950-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
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
X-List-Received-Date: Fri, 26 Feb 2021 16:32:45 -0000

Hi,=0D
=0D
This series is inspired on Claudio TCG work.=0D
=0D
Instead of separate TCG from other accelerators, here we=0D
separate sysemu operations (system VS user).=0D
=0D
This is part 1, overall preparation. Part 2 will make this=0D
field a pointer, similarly to commit 78271684719 ("cpu: tcg_ops:=0D
move to tcg-cpu-ops.h, keep a pointer in CPUClass").=0D
=0D
Regards,=0D
=0D
Phil.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (16):=0D
  target: Set CPUClass::vmsd instead of DeviceClass::vmsd=0D
  cpu: Un-inline cpu_get_phys_page_debug and cpu_asidx_from_attrs=0D
  cpu: Introduce cpu_virtio_is_big_endian()=0D
  cpu: Directly use cpu_write_elf*() fallback handlers in place=0D
  cpu: Directly use get_paging_enabled() fallback handlers in place=0D
  cpu: Directly use get_memory_mapping() fallback handlers in place=0D
  cpu: Introduce CPUSystemOperations structure=0D
  cpu: Move CPUClass::vmsd to CPUSystemOperations=0D
  cpu: Move CPUClass::virtio_is_big_endian to CPUSystemOperations=0D
  cpu: Move CPUClass::get_crash_info to CPUSystemOperations=0D
  cpu: Move CPUClass::write_elf* to CPUSystemOperations=0D
  cpu: Move CPUClass::asidx_from_attrs to CPUSystemOperations=0D
  cpu: Move CPUClass::get_phys_page_debug to CPUSystemOperations=0D
  cpu: Move CPUClass::get_memory_mapping to CPUSystemOperations=0D
  cpu: Move CPUClass::get_paging_enabled to CPUSystemOperations=0D
  cpu: Restrict cpu_paging_enabled / cpu_get_memory_mapping to sysemu=0D
=0D
 include/hw/core/cpu.h           | 162 ++++++++++++++++++--------------=0D
 cpu.c                           |  12 +--=0D
 hw/core/cpu.c                   | 112 ++++++++++++----------=0D
 hw/virtio/virtio.c              |   4 +-=0D
 target/alpha/cpu.c              |   4 +-=0D
 target/arm/cpu.c                |  12 +--=0D
 target/avr/cpu.c                |   4 +-=0D
 target/cris/cpu.c               |   4 +-=0D
 target/hppa/cpu.c               |   4 +-=0D
 target/i386/cpu.c               |  20 ++--=0D
 target/lm32/cpu.c               |   4 +-=0D
 target/m68k/cpu.c               |   4 +-=0D
 target/microblaze/cpu.c         |   4 +-=0D
 target/mips/cpu.c               |   4 +-=0D
 target/moxie/cpu.c              |   4 +-=0D
 target/nios2/cpu.c              |   2 +-=0D
 target/openrisc/cpu.c           |   4 +-=0D
 target/riscv/cpu.c              |   4 +-=0D
 target/rx/cpu.c                 |   2 +-=0D
 target/s390x/cpu.c              |   8 +-=0D
 target/sh4/cpu.c                |   4 +-=0D
 target/sparc/cpu.c              |   4 +-=0D
 target/tricore/cpu.c            |   2 +-=0D
 target/unicore32/cpu.c          |   4 +-=0D
 target/xtensa/cpu.c             |   4 +-=0D
 target/ppc/translate_init.c.inc |  10 +-=0D
 26 files changed, 218 insertions(+), 188 deletions(-)=0D
=0D
-- =0D
2.26.2=0D
=0D

