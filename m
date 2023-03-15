Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pcVA6-0001yD-7f
	for mharc-qemu-riscv@gnu.org; Wed, 15 Mar 2023 13:43:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pcVA3-0001uv-NE
 for qemu-riscv@nongnu.org; Wed, 15 Mar 2023 13:43:40 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pcV9y-0000bP-VM
 for qemu-riscv@nongnu.org; Wed, 15 Mar 2023 13:43:39 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 az3-20020a05600c600300b003ed2920d585so1578990wmb.2
 for <qemu-riscv@nongnu.org>; Wed, 15 Mar 2023 10:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678902213;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/XTY7Vej4MUrTa8LspO1+ukvYwDV/OHswwb9kes0OzE=;
 b=FBVDHxJH2Raz0shACtK7xJpCwBhNbY+ZagoTgiblrYs8H8LxA89zfTOw26XJX8e5F6
 cCDbnqo0wui9RbCgM+oZP6PTdDtrjnfYBRLSYyWp7nSPLJZupNg73+OY+fLAH6lKfJ+D
 zxhbqVKhAgm2LAP/b6aMVTgBcXz57fKCh/ydwKOx8iGKV3PVDLWNrrB6izgVvx4lT4QX
 nNcH3TdBWjVr85G4sc0B5+Z6vnMIpjdGUQLb41CDVrV+DXV8gFNeoVQ+T//j686h1NWC
 1oioxOLuj4MhVWWLWj6PXaxaAbTlC/zkdDyGZSJIsU6JXxwG9zWXpjaLrdzYJQtgxqeq
 bA2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678902213;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/XTY7Vej4MUrTa8LspO1+ukvYwDV/OHswwb9kes0OzE=;
 b=vX/MwGWizDka4NwIiNtjavUk12VHFX4WWI1OaVElXj0gArEMgBCnzk1b7tGYCRd1cE
 m8c2ht8p0aCPl+pGlFOAsmKrjpqI/MLuldYf+vdOBvK+HM2qeHbBc4MaGGDacDblJwGX
 uPgi8kJ8pTVZhIpQ7UC2gNNG4Maklz8K12h+9Nvx+KzIh7to8Xw5jit+NxnxmhrkLumH
 PvebionEqTi7Q401JPcm31i+X69TLPh7NBAQF7IZ6nTW86TOW4oGiwqMhUQo+9f6R3jP
 7t3XyrDiPtpxQ/Gv8zN5FwPK88V8DXY1wtmZ0yZYQHfJgsf0Jv/3aizeFrVHcUmybQIp
 klNA==
X-Gm-Message-State: AO0yUKXC5Wtjms73ra6SQVFGOPYQFPis+HVpZevRWl/LJt/Vi/UcxAcy
 W3JkPwgxV8Di4n6jNo/7Y/iDlA==
X-Google-Smtp-Source: AK7set8/BTKWXEg9MGh98mBBbd5uig+ZfFP5Wud6OFqah1I+zgxB1K/We74ROJzzhpsrwN7MYQkQHg==
X-Received: by 2002:a05:600c:35c1:b0:3df:deb5:6ff5 with SMTP id
 r1-20020a05600c35c100b003dfdeb56ff5mr18551068wmq.24.1678902212048; 
 Wed, 15 Mar 2023 10:43:32 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 22-20020a05600c021600b003ecc64edf7esm2475344wmi.39.2023.03.15.10.43.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Mar 2023 10:43:31 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 35C221FFB7;
 Wed, 15 Mar 2023 17:43:31 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-riscv@nongnu.org, Riku Voipio <riku.voipio@iki.fi>,
 Igor Mammedov <imammedo@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, Hao Wu <wuhaotsh@google.com>,
 Cleber Rosa <crosa@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Jan Kiszka <jan.kiszka@web.de>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-arm@nongnu.org, Marcelo Tosatti <mtosatti@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Alexandre Iooss <erdnaxe@crans.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, qemu-ppc@nongnu.org,
 Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Darren Kenny <darren.kenny@oracle.com>, kvm@vger.kernel.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stafford Horne <shorne@gmail.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Sunil V L <sunilvl@ventanamicro.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Thomas Huth <huth@tuxfamily.org>,
 Vijai Kumar K <vijai@behindbytes.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 David Gibson <david@gibson.dropbear.id.au>, Song Gao <gaosong@loongson.cn>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, Greg Kurz <groug@kaod.org>,
 Laurent Vivier <laurent@vivier.eu>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Alexander Bulekov <alxndr@bu.edu>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-block@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>, David Woodhouse <dwmw2@infradead.org>,
 qemu-s390x@nongnu.org, Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Bandan Das <bsd@redhat.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Tyrone Ting <kfting@nuvoton.com>, Kevin Wolf <kwolf@redhat.com>,
 David Hildenbrand <david@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Beniamino Galvani <b.galvani@gmail.com>, Paul Durrant <paul@xen.org>,
 Bin Meng <bin.meng@windriver.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Hanna Reitz <hreitz@redhat.com>,
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 00/32] tweaks and fixes for 8.0-rc1 (tests, plugins, docs)
Date: Wed, 15 Mar 2023 17:42:59 +0000
Message-Id: <20230315174331.2959-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Wed, 15 Mar 2023 17:43:40 -0000

As usual for softfreeze I switch from my usual maintainer trees to
collecting up miscellaneous fixes and tweaks as we stabilise the
build. I was intending to send it as a PR but I had to squash a number
of CI failures by adding stuff to:

      *: Add missing includes of qemu/error-report.h
      *: Add missing includes of qemu/plugin.h

so I thought it was worth another spin and I can cut the PR from this
if the reviews are ok.

Since v1:
  - grabbed Daniel's iotest cleanup for CI
  - new version of Richard's plugin fix
  - a number of gitdm updates

I've left:
  tests/tcg: disable pauth for aarch64 gdb tests

in for now, but I can easily drop it for the PR as it seems the
consensus is there will be stable updates to gdb that no longer crash
on our pauth support.

The following still need review:

 - contrib/gitdm: add more individual contributors (1 acks, 1 sobs)
 - tests/tcg: add some help output for running individual tests
 - include/qemu: add documentation for memory callbacks
 - gitlab: update centos-8-stream job
 - scripts/ci: update gitlab-runner playbook to handle CentOS
 - tests/docker: all add DOCKER_BUILDKIT to RUNC environment

Alex Bennée (16):
  tests/docker: all add DOCKER_BUILDKIT to RUNC environment
  scripts/ci: add libslirp-devel to build-environment
  scripts/ci: update gitlab-runner playbook to handle CentOS
  gitlab: update centos-8-stream job
  include/qemu: add documentation for memory callbacks
  tests/tcg: add some help output for running individual tests
  tests/tcg: disable pauth for aarch64 gdb tests
  include/exec: fix kerneldoc definition
  tests/avocado: don't use tags to define drive
  contrib/gitdm: Add ASPEED Technology to the domain map
  contrib/gitdm: Add SYRMIA to the domain map
  contrib/gitdm: add Amazon to the domain map
  contrib/gitdm: add Alibaba to the domain-map
  contrib/gitdm: add revng to domain map
  contrib/gitdm: add more individual contributors
  contrib/gitdm: add group map for AMD

Daniel P. Berrangé (8):
  iotests: explicitly pass source/build dir to 'check' command
  iotests: allow test discovery before building
  iotests: strip subdir path when listing tests
  iotests: print TAP protocol version when reporting tests
  iotests: connect stdin to /dev/null when running tests
  iotests: always use a unique sub-directory per test
  iotests: register each I/O test separately with meson
  iotests: remove the check-block.sh script

Marcin Juszkiewicz (1):
  tests/avocado: update AArch64 tests to Alpine 3.17.2

Richard Henderson (7):
  tcg: Clear plugin_mem_cbs on TB exit
  tcg: Drop plugin_gen_disable_mem_helpers from tcg_gen_exit_tb
  include/qemu/plugin: Remove QEMU_PLUGIN_ASSERT
  *: Add missing includes of qemu/error-report.h
  *: Add missing includes of qemu/plugin.h
  include/qemu: Split out plugin-event.h
  include/qemu/plugin: Inline qemu_plugin_disable_mem_helpers

 include/exec/memory.h                         |  2 +-
 include/hw/core/cpu.h                         |  2 +-
 include/qemu/plugin-event.h                   | 26 ++++++++
 include/qemu/plugin.h                         | 27 ++-------
 include/qemu/qemu-plugin.h                    | 47 +++++++++++++--
 include/user/syscall-trace.h                  |  1 +
 accel/accel-softmmu.c                         |  2 +-
 accel/tcg/cpu-exec-common.c                   |  3 +
 accel/tcg/cpu-exec.c                          |  5 +-
 block/monitor/block-hmp-cmds.c                |  1 +
 cpu.c                                         |  1 +
 dump/dump.c                                   |  1 +
 dump/win_dump.c                               |  1 +
 gdbstub/gdbstub.c                             |  1 +
 hw/arm/collie.c                               |  2 +
 hw/arm/cubieboard.c                           |  1 +
 hw/arm/musicpal.c                             |  2 +
 hw/arm/npcm7xx_boards.c                       |  2 +
 hw/arm/nseries.c                              |  2 +
 hw/arm/omap_sx1.c                             |  2 +
 hw/arm/orangepi.c                             |  1 +
 hw/arm/palm.c                                 |  2 +
 hw/core/loader.c                              |  1 +
 hw/core/machine-smp.c                         |  2 +
 hw/i386/kvm/xen_xenstore.c                    |  1 +
 hw/i386/sgx.c                                 |  1 +
 hw/intc/apic.c                                |  1 +
 hw/loongarch/acpi-build.c                     |  1 +
 hw/loongarch/virt.c                           |  2 +
 hw/m68k/next-cube.c                           |  1 +
 hw/m68k/q800.c                                |  1 +
 hw/m68k/virt.c                                |  1 +
 hw/mem/memory-device.c                        |  1 +
 hw/mem/sparse-mem.c                           |  1 +
 hw/openrisc/boot.c                            |  1 +
 hw/ppc/spapr_softmmu.c                        |  2 +
 hw/riscv/opentitan.c                          |  1 +
 hw/riscv/shakti_c.c                           |  1 +
 hw/riscv/virt-acpi-build.c                    |  1 +
 hw/vfio/display.c                             |  1 +
 hw/vfio/igd.c                                 |  1 +
 hw/vfio/migration.c                           |  1 +
 linux-user/elfload.c                          |  1 +
 linux-user/exit.c                             |  1 +
 linux-user/syscall.c                          |  1 +
 migration/dirtyrate.c                         |  1 +
 migration/exec.c                              |  1 +
 plugins/core.c                                | 11 ----
 target/i386/cpu.c                             |  1 +
 target/i386/host-cpu.c                        |  1 +
 target/i386/sev.c                             |  1 +
 target/i386/whpx/whpx-apic.c                  |  1 +
 target/mips/cpu.c                             |  1 +
 target/s390x/cpu-sysemu.c                     |  1 +
 target/s390x/cpu_models.c                     |  1 +
 target/s390x/diag.c                           |  2 +
 tcg/tcg-op.c                                  |  1 -
 .../custom-runners/centos-stream-8-x86_64.yml | 18 ++----
 contrib/gitdm/domain-map                      |  7 ++-
 contrib/gitdm/group-map-alibaba               |  7 +++
 contrib/gitdm/group-map-amd                   |  8 +++
 contrib/gitdm/group-map-individuals           |  1 +
 gitdm.config                                  |  2 +
 .../org.centos/stream/8/build-environment.yml |  1 +
 scripts/ci/setup/gitlab-runner.yml            | 20 ++++++-
 tests/avocado/machine_aarch64_virt.py         |  8 +--
 tests/avocado/tuxrun_baselines.py             | 60 ++++++++-----------
 tests/check-block.sh                          | 43 -------------
 tests/docker/Makefile.include                 |  2 +-
 tests/qemu-iotests/check                      | 30 ++++++++--
 tests/qemu-iotests/meson.build                | 35 +++++++++--
 tests/qemu-iotests/testenv.py                 | 20 +++----
 tests/qemu-iotests/testrunner.py              | 43 ++++---------
 tests/tcg/Makefile.target                     |  7 +++
 tests/tcg/aarch64/Makefile.target             |  2 +
 ui/cocoa.m                                    |  1 +
 76 files changed, 305 insertions(+), 193 deletions(-)
 create mode 100644 include/qemu/plugin-event.h
 create mode 100644 contrib/gitdm/group-map-alibaba
 create mode 100644 contrib/gitdm/group-map-amd
 delete mode 100755 tests/check-block.sh

-- 
2.39.2


