Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nbkhq-0000kE-Br
	for mharc-qemu-riscv@gnu.org; Tue, 05 Apr 2022 11:02:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nbkhn-0000j1-GK
 for qemu-riscv@nongnu.org; Tue, 05 Apr 2022 11:02:51 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:41783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nbkhe-0008Qo-P6
 for qemu-riscv@nongnu.org; Tue, 05 Apr 2022 11:02:51 -0400
Received: by mail-ej1-x62e.google.com with SMTP id bh17so27327187ejb.8
 for <qemu-riscv@nongnu.org>; Tue, 05 Apr 2022 08:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/0EjTon8/xaxIiSgMdIStAZq4/XqBNOwQOhaTNVaNnA=;
 b=gxM18Njc5lBuWvyf/UopHykgg/wT9LXpe3uZY4444LpCsbwPftep3PldTChhEvuzI7
 3Z1BS1iA6EgKNnBgJTYTBl4Qp+kJAfxprGjjccADhoUjX3tkHDkfa1+w7F6sijxjzQ1m
 Kiln5wtp3/2wCT2XZuQgaW6OYOZ29DIqnWlp7iJUYhqoqi8D4YaYKYE6Eh+pqoHOwt2h
 Snp5TDguHv2QA4Epb7Xd8/ABddNMCIRq9W+b16U2xTZpSQU3liPaIkcAidOEmtOux1+l
 eTrkvwFPHDsiIOIbVJOP22/U2rl6OOt5lT8/1aNJt0tQbtv76ePAchEKrCI+pstxAyFg
 eQkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/0EjTon8/xaxIiSgMdIStAZq4/XqBNOwQOhaTNVaNnA=;
 b=rl/2D7jCr7NYJTdGwd+TR/u8BB9/af3APXq0Xiy4wi5JnnvCG4XYfkrLNqRSr4mz/0
 w44mNE4oqcA5farUSFnyV24LSDSnX5OXQXsOIbhs+4qyUjmFCDr6WGmZGzNxpZkHSxfc
 rl5ftdtSYizimALPc4J/nFmyRujm6gzQQsZEZ9CAC0qPABEMt1siR9Q+sBHTpfx9HZED
 5wf96Na0TtYcrKW2a4QBYW6L+Wfb3AucOvrtwou9YBpNdJGfvzJ9vtnQnKUnEPxuauQw
 GIuj2VSwMmAp92BReqG7sYyvuD/mmB12qJmYFAExZYRMtqkv4sw64Q0aPEYKBabjZPTs
 4mfQ==
X-Gm-Message-State: AOAM53051c3GIKX5ztZje0A1NZI9pHMKwf2X4ps5knj8yAquHxUgCXVF
 e82xIBeg9On/OcjrnPiZ5SCijtpOB2gIakE7jDC3Sw==
X-Google-Smtp-Source: ABdhPJwykPAUFkWUGag0/3rrTydkYq593GC3Sc3LWYwGRyN5awpJLdRPc4vsTwtJfEX77MY4Fk463fAUdmP+W5FeVmc=
X-Received: by 2002:a17:907:6e87:b0:6e7:f655:3b41 with SMTP id
 sh7-20020a1709076e8700b006e7f6553b41mr3914457ejc.704.1649170959456; Tue, 05
 Apr 2022 08:02:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220323155743.1585078-1-marcandre.lureau@redhat.com>
 <20220323155743.1585078-33-marcandre.lureau@redhat.com>
In-Reply-To: <20220323155743.1585078-33-marcandre.lureau@redhat.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Tue, 5 Apr 2022 20:32:28 +0530
Message-ID: <CAARzgwzXXKqhvP9CnST3iD_obfqCWn8Z+8WNcs0u-O_UGoM1-w@mail.gmail.com>
Subject: Re: [PATCH 32/32] Remove qemu-common.h include from most units
To: marcandre.lureau@redhat.com
Cc: Aarushi Mehta <mehta.aaru20@gmail.com>, 
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Alexander Bulekov <alxndr@bu.edu>, Alexander Graf <agraf@csgraf.de>,
 Alexey Kardashevskiy <aik@ozlabs.ru>, 
 Alistair Francis <alistair.francis@wdc.com>, Andrew Jeffery <andrew@aj.id.au>, 
 Artyom Tarasenko <atar4qemu@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>, 
 BALATON Zoltan <balaton@eik.bme.hu>, Bandan Das <bsd@redhat.com>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Bin Meng <bin.meng@windriver.com>, 
 Cameron Esfahani <dirty@apple.com>, Chris Wulff <crwulff@gmail.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, 
 Colin Xu <colin.xu@intel.com>, Corey Minyard <minyard@acm.org>,
 Cornelia Huck <cohuck@redhat.com>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Darren Kenny <darren.kenny@oracle.com>,
 David Gibson <david@gibson.dropbear.id.au>, 
 David Hildenbrand <david@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Eduardo Habkost <eduardo@habkost.net>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, 
 Eric Auger <eric.auger@redhat.com>, Eric Farman <farman@linux.ibm.com>, 
 Fabien Chouteau <chouteau@adacore.com>, Fam Zheng <fam@euphon.net>,
 Gerd Hoffmann <kraxel@redhat.com>, 
 Greg Kurz <groug@kaod.org>, Halil Pasic <pasic@linux.ibm.com>,
 Hanna Reitz <hreitz@redhat.com>, 
 Havard Skinnemoen <hskinnemoen@google.com>, Helge Deller <deller@gmx.de>, 
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>, 
 Huacai Chen <chenhuacai@kernel.org>, Igor Mammedov <imammedo@redhat.com>, 
 Jagannathan Raman <jag.raman@oracle.com>, Jason Wang <jasowang@redhat.com>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Joel Stanley <joel@jms.id.au>, 
 John G Johnson <john.g.johnson@oracle.com>, John Snow <jsnow@redhat.com>, 
 Julia Suvorova <jusual@redhat.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>, 
 Kamil Rytarowski <kamil@netbsd.org>, Kevin Wolf <kwolf@redhat.com>,
 Kyle Evans <kevans@freebsd.org>, 
 Laurent Vivier <laurent@vivier.eu>, Li Zhijian <lizhijian@fujitsu.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, 
 Marek Vasut <marex@denx.de>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
 Markus Armbruster <armbru@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>, 
 Michael Rolnik <mrolnik@gmail.com>, Michael Roth <michael.roth@amd.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Qiuhao Li <Qiuhao.Li@outlook.com>, Reinoud Zandijk <reinoud@netbsd.org>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>, 
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, 
 Stefan Weil <sw@weilnetz.de>, Stefano Garzarella <sgarzare@redhat.com>, 
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, 
 Taylor Simpson <tsimpson@quicinc.com>, Thomas Huth <huth@tuxfamily.org>, 
 Tyrone Ting <kfting@nuvoton.com>, Warner Losh <imp@bsdimp.com>, 
 Wenchao Wang <wenchao.wang@intel.com>, Yanan Wang <wangyanan55@huawei.com>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, Zhang Chen <chen.zhang@intel.com>,
 "open list:ARM PrimeCell and..." <qemu-arm@nongnu.org>,
 "open list:Overall KVM CPUs" <kvm@vger.kernel.org>, 
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 "open list:S390-ccw boot" <qemu-s390x@nongnu.org>, 
 "open list:X86 HAXM CPUs" <haxm-team@intel.com>,
 "open list:raw" <qemu-block@nongnu.org>, 
 "open list:sPAPR (pseries)" <qemu-ppc@nongnu.org>, qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000003679bd05dbe989a6"
Received-SPF: none client-ip=2a00:1450:4864:20::62e;
 envelope-from=ani@anisinha.ca; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 05 Apr 2022 15:02:51 -0000

--0000000000003679bd05dbe989a6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 23, 2022 at 9:32 PM <marcandre.lureau@redhat.com> wrote:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


Empty patch descriptions are not a good idea. Please explain why this
removal does not break things and maybe why the header got included
initiatively.


> ---
>  include/qemu-common.h                    | 9 ---------
>  accel/hvf/hvf-all.c                      | 1 -
>  accel/tcg/cpu-exec.c                     | 1 -
>  accel/tcg/tcg-accel-ops-icount.c         | 1 -
>  accel/tcg/tcg-accel-ops-mttcg.c          | 1 -
>  accel/tcg/tcg-accel-ops-rr.c             | 1 -
>  accel/tcg/tcg-accel-ops.c                | 1 -
>  accel/tcg/tcg-all.c                      | 1 -
>  accel/tcg/translate-all.c                | 1 -
>  audio/audio_win_int.c                    | 1 -
>  backends/hostmem-epc.c                   | 1 -
>  backends/tpm/tpm_passthrough.c           | 1 -
>  block/file-posix.c                       | 1 -
>  block/io_uring.c                         | 1 -
>  bsd-user/freebsd/os-syscall.c            | 1 -
>  bsd-user/mmap.c                          | 1 -
>  chardev/char-fd.c                        | 1 -
>  chardev/char-pipe.c                      | 1 -
>  chardev/char-pty.c                       | 1 -
>  cpu.c                                    | 1 -
>  crypto/cipher-afalg.c                    | 1 -
>  crypto/hash-afalg.c                      | 1 -
>  dump/dump.c                              | 1 -
>  dump/win_dump.c                          | 1 -
>  fsdev/virtfs-proxy-helper.c              | 1 -
>  gdbstub.c                                | 1 -
>  hw/9pfs/9p-proxy.c                       | 1 -
>  hw/alpha/dp264.c                         | 1 -
>  hw/avr/boot.c                            | 1 -
>  hw/core/loader.c                         | 1 -
>  hw/display/artist.c                      | 1 -
>  hw/display/cg3.c                         | 1 -
>  hw/display/tcx.c                         | 1 -
>  hw/display/virtio-gpu-udmabuf.c          | 1 -
>  hw/dma/pl330.c                           | 1 -
>  hw/hppa/machine.c                        | 1 -
>  hw/i386/pc_sysfw.c                       | 1 -
>  hw/i386/x86.c                            | 1 -
>  hw/input/vhost-user-input.c              | 1 -
>  hw/intc/xics_kvm.c                       | 1 -
>  hw/m68k/mcf5208.c                        | 1 -
>  hw/m68k/q800.c                           | 1 -
>  hw/m68k/virt.c                           | 1 -
>  hw/microblaze/boot.c                     | 1 -
>  hw/mips/fuloong2e.c                      | 1 -
>  hw/mips/jazz.c                           | 1 -
>  hw/mips/loongson3_virt.c                 | 1 -
>  hw/mips/malta.c                          | 1 -
>  hw/mips/mipssim.c                        | 1 -
>  hw/misc/sbsa_ec.c                        | 1 -
>  hw/net/fsl_etsec/etsec.c                 | 1 -
>  hw/net/fsl_etsec/rings.c                 | 1 -
>  hw/net/msf2-emac.c                       | 1 -
>  hw/net/npcm7xx_emc.c                     | 1 -
>  hw/nios2/boot.c                          | 1 -
>  hw/nios2/generic_nommu.c                 | 1 -
>  hw/nvram/fw_cfg.c                        | 1 -
>  hw/pci-host/mv64361.c                    | 1 -
>  hw/pci-host/pnv_phb3.c                   | 1 -
>  hw/pci-host/pnv_phb3_msi.c               | 1 -
>  hw/pci-host/pnv_phb3_pbcq.c              | 1 -
>  hw/pci-host/pnv_phb4.c                   | 1 -
>  hw/pci-host/pnv_phb4_pec.c               | 1 -
>  hw/pci-host/raven.c                      | 1 -
>  hw/pci-host/remote.c                     | 1 -
>  hw/pci/pci.c                             | 1 -
>  hw/ppc/e500.c                            | 1 -
>  hw/ppc/mac_newworld.c                    | 1 -
>  hw/ppc/mac_oldworld.c                    | 1 -
>  hw/ppc/pegasos2.c                        | 1 -
>  hw/ppc/pnv.c                             | 1 -
>  hw/ppc/pnv_bmc.c                         | 1 -
>  hw/ppc/ppc405_boards.c                   | 1 -
>  hw/ppc/ppc440_bamboo.c                   | 1 -
>  hw/ppc/sam460ex.c                        | 1 -
>  hw/ppc/spapr.c                           | 1 -
>  hw/ppc/spapr_numa.c                      | 1 -
>  hw/ppc/spapr_pci_nvlink2.c               | 1 -
>  hw/ppc/spapr_tpm_proxy.c                 | 1 -
>  hw/ppc/spapr_vof.c                       | 1 -
>  hw/ppc/virtex_ml507.c                    | 1 -
>  hw/ppc/vof.c                             | 1 -
>  hw/remote/iohub.c                        | 1 -
>  hw/remote/machine.c                      | 1 -
>  hw/remote/memory.c                       | 1 -
>  hw/remote/message.c                      | 1 -
>  hw/remote/mpqemu-link.c                  | 1 -
>  hw/remote/proxy-memory-listener.c        | 1 -
>  hw/remote/proxy.c                        | 1 -
>  hw/remote/remote-obj.c                   | 1 -
>  hw/riscv/boot.c                          | 1 -
>  hw/rx/rx-gdbsim.c                        | 1 -
>  hw/s390x/ipl.c                           | 1 -
>  hw/sd/sd.c                               | 1 -
>  hw/sparc/leon3.c                         | 1 -
>  hw/sparc/sun4m.c                         | 1 -
>  hw/sparc64/sun4u.c                       | 1 -
>  hw/usb/dev-mtp.c                         | 1 -
>  hw/virtio/virtio-iommu.c                 | 1 -
>  hw/virtio/virtio-mem.c                   | 1 -
>  hw/virtio/virtio-pmem.c                  | 1 -
>  io/channel-socket.c                      | 1 -
>  linux-user/aarch64/cpu_loop.c            | 1 -
>  linux-user/alpha/cpu_loop.c              | 1 -
>  linux-user/arm/cpu_loop.c                | 1 -
>  linux-user/cris/cpu_loop.c               | 1 -
>  linux-user/hexagon/cpu_loop.c            | 1 -
>  linux-user/i386/cpu_loop.c               | 1 -
>  linux-user/m68k/cpu_loop.c               | 1 -
>  linux-user/microblaze/cpu_loop.c         | 1 -
>  linux-user/mips/cpu_loop.c               | 1 -
>  linux-user/openrisc/cpu_loop.c           | 1 -
>  linux-user/ppc/cpu_loop.c                | 1 -
>  linux-user/riscv/cpu_loop.c              | 1 -
>  linux-user/s390x/cpu_loop.c              | 1 -
>  linux-user/sh4/cpu_loop.c                | 1 -
>  linux-user/sparc/cpu_loop.c              | 1 -
>  linux-user/uname.c                       | 1 -
>  monitor/qmp-cmds.c                       | 1 -
>  net/colo-compare.c                       | 1 -
>  net/net.c                                | 1 -
>  net/socket.c                             | 1 -
>  net/tap-bsd.c                            | 1 -
>  net/tap-linux.c                          | 1 -
>  net/tap-solaris.c                        | 1 -
>  net/tap-win32.c                          | 1 -
>  net/tap.c                                | 1 -
>  net/vde.c                                | 1 -
>  os-posix.c                               | 1 -
>  os-win32.c                               | 1 -
>  page-vary-common.c                       | 1 -
>  qga/commands-posix.c                     | 1 -
>  softmmu/cpu-throttle.c                   | 1 -
>  softmmu/cpu-timers.c                     | 1 -
>  softmmu/cpus.c                           | 1 -
>  softmmu/datadir.c                        | 1 -
>  softmmu/icount.c                         | 1 -
>  softmmu/runstate.c                       | 1 -
>  stubs/monitor-core.c                     | 1 -
>  target/arm/hvf/hvf.c                     | 1 -
>  target/arm/kvm.c                         | 1 -
>  target/arm/kvm64.c                       | 1 -
>  target/hexagon/gdbstub.c                 | 1 -
>  target/i386/hax/hax-all.c                | 1 -
>  target/i386/hvf/hvf.c                    | 1 -
>  target/i386/hvf/x86.c                    | 1 -
>  target/i386/hvf/x86_cpuid.c              | 1 -
>  target/i386/hvf/x86_decode.c             | 1 -
>  target/i386/hvf/x86_descr.c              | 1 -
>  target/i386/hvf/x86_emu.c                | 1 -
>  target/i386/hvf/x86_flags.c              | 1 -
>  target/i386/hvf/x86_mmu.c                | 1 -
>  target/i386/hvf/x86_task.c               | 1 -
>  target/i386/hvf/x86hvf.c                 | 1 -
>  target/i386/kvm/sev-stub.c               | 1 -
>  target/i386/nvmm/nvmm-all.c              | 1 -
>  target/i386/whpx/whpx-all.c              | 1 -
>  target/i386/whpx/whpx-apic.c             | 1 -
>  target/mips/kvm.c                        | 1 -
>  target/nios2/nios2-semi.c                | 1 -
>  target/ppc/kvm.c                         | 1 -
>  target/riscv/kvm.c                       | 1 -
>  target/rx/cpu.c                          | 1 -
>  target/rx/gdbstub.c                      | 1 -
>  target/s390x/kvm/kvm.c                   | 1 -
>  target/s390x/tcg/vec_fpu_helper.c        | 1 -
>  target/s390x/tcg/vec_int_helper.c        | 1 -
>  target/s390x/tcg/vec_string_helper.c     | 1 -
>  target/tricore/gdbstub.c                 | 1 -
>  target/xtensa/core-de233_fpu.c           | 1 -
>  target/xtensa/core-dsp3400.c             | 1 -
>  target/xtensa/core-test_mmuhifi_c3.c     | 1 -
>  tcg/tci.c                                | 1 -
>  tests/qtest/acpi-utils.c                 | 1 -
>  tests/qtest/ahci-test.c                  | 1 -
>  tests/qtest/aspeed_hace-test.c           | 1 -
>  tests/qtest/bios-tables-test.c           | 1 -
>  tests/qtest/boot-sector.c                | 1 -
>  tests/qtest/cpu-plug-test.c              | 1 -
>  tests/qtest/dbus-display-test.c          | 1 -
>  tests/qtest/dbus-vmstate-test.c          | 1 -
>  tests/qtest/device-introspect-test.c     | 1 -
>  tests/qtest/e1000e-test.c                | 2 --
>  tests/qtest/erst-test.c                  | 1 -
>  tests/qtest/fdc-test.c                   | 1 -
>  tests/qtest/fuzz/qos_fuzz.c              | 1 -
>  tests/qtest/hd-geo-test.c                | 1 -
>  tests/qtest/ide-test.c                   | 1 -
>  tests/qtest/ipmi-bt-test.c               | 1 -
>  tests/qtest/ivshmem-test.c               | 1 -
>  tests/qtest/libqos/ahci.c                | 1 -
>  tests/qtest/libqos/malloc-pc.c           | 2 --
>  tests/qtest/libqos/malloc-spapr.c        | 2 --
>  tests/qtest/libqos/malloc.c              | 1 -
>  tests/qtest/libqtest.c                   | 1 -
>  tests/qtest/machine-none-test.c          | 1 -
>  tests/qtest/npcm7xx_emc-test.c           | 1 -
>  tests/qtest/pxe-test.c                   | 1 -
>  tests/qtest/qom-test.c                   | 1 -
>  tests/qtest/rtl8139-test.c               | 1 -
>  tests/qtest/test-filter-mirror.c         | 1 -
>  tests/qtest/test-filter-redirector.c     | 1 -
>  tests/qtest/test-x86-cpuid-compat.c      | 1 -
>  tests/qtest/virtio-net-test.c            | 1 -
>  tests/unit/check-qjson.c                 | 1 -
>  tests/unit/check-qnull.c                 | 1 -
>  tests/unit/check-qnum.c                  | 1 -
>  tests/unit/check-qobject.c               | 1 -
>  tests/unit/check-qstring.c               | 1 -
>  tests/unit/socket-helpers.c              | 1 -
>  tests/unit/test-clone-visitor.c          | 1 -
>  tests/unit/test-forward-visitor.c        | 1 -
>  tests/unit/test-iov.c                    | 1 -
>  tests/unit/test-logging.c                | 1 -
>  tests/unit/test-qmp-event.c              | 1 -
>  tests/unit/test-qobject-input-visitor.c  | 1 -
>  tests/unit/test-qobject-output-visitor.c | 1 -
>  tests/unit/test-string-input-visitor.c   | 1 -
>  tests/unit/test-string-output-visitor.c  | 1 -
>  tests/unit/test-thread-pool.c            | 1 -
>  tests/unit/test-util-sockets.c           | 1 -
>  tests/unit/test-visitor-serialization.c  | 1 -
>  tests/unit/test-xbzrle.c                 | 1 -
>  ui/gtk-clipboard.c                       | 1 -
>  ui/keymaps.c                             | 1 -
>  ui/vdagent.c                             | 1 -
>  ui/vnc-clipboard.c                       | 1 -
>  ui/vnc-enc-tight.c                       | 2 +-
>  ui/vnc.c                                 | 1 -
>  util/aio-win32.c                         | 1 -
>  util/coroutine-sigaltstack.c             | 1 -
>  util/coroutine-win32.c                   | 1 -
>  util/cutils.c                            | 1 -
>  util/event_notifier-posix.c              | 1 -
>  util/event_notifier-win32.c              | 1 -
>  util/iov.c                               | 1 -
>  util/osdep.c                             | 1 -
>  util/oslib-posix.c                       | 1 -
>  util/oslib-win32.c                       | 1 -
>  util/qemu-coroutine-io.c                 | 1 -
>  util/qemu-sockets.c                      | 1 -
>  util/qemu-thread-win32.c                 | 1 -
>  target/xtensa/import_core.sh             | 1 -
>  243 files changed, 1 insertion(+), 254 deletions(-)
>
> diff --git a/include/qemu-common.h b/include/qemu-common.h
> index 0498acd16b78..ba32cc8b1f39 100644
> --- a/include/qemu-common.h
> +++ b/include/qemu-common.h
> @@ -1,12 +1,3 @@
> -/*
> - * This file is supposed to be included only by .c files. No header file
> should
> - * depend on qemu-common.h, as this would easily lead to circular header
> - * dependencies.
> - *
> - * If a header file uses a definition from qemu-common.h, that definitio=
n
> - * must be moved to a separate header file, and the header that uses it
> - * must include that header.
> - */
>  #ifndef QEMU_COMMON_H
>  #define QEMU_COMMON_H
>
> diff --git a/accel/hvf/hvf-all.c b/accel/hvf/hvf-all.c
> index f185b0830a75..0043f4d308ba 100644
> --- a/accel/hvf/hvf-all.c
> +++ b/accel/hvf/hvf-all.c
> @@ -9,7 +9,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>  #include "qemu/error-report.h"
>  #include "sysemu/hvf.h"
>  #include "sysemu/hvf_int.h"
> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
> index c997c2e8e015..083ada76b124 100644
> --- a/accel/tcg/cpu-exec.c
> +++ b/accel/tcg/cpu-exec.c
> @@ -18,7 +18,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>  #include "qemu/qemu-print.h"
>  #include "qapi/error.h"
>  #include "qapi/qapi-commands-machine.h"
> diff --git a/accel/tcg/tcg-accel-ops-icount.c
> b/accel/tcg/tcg-accel-ops-icount.c
> index bdaf2c943b49..6436cd9349a3 100644
> --- a/accel/tcg/tcg-accel-ops-icount.c
> +++ b/accel/tcg/tcg-accel-ops-icount.c
> @@ -24,7 +24,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>  #include "sysemu/tcg.h"
>  #include "sysemu/replay.h"
>  #include "sysemu/cpu-timers.h"
> diff --git a/accel/tcg/tcg-accel-ops-mttcg.c
> b/accel/tcg/tcg-accel-ops-mttcg.c
> index ea2b741deb51..d50239e0e28f 100644
> --- a/accel/tcg/tcg-accel-ops-mttcg.c
> +++ b/accel/tcg/tcg-accel-ops-mttcg.c
> @@ -24,7 +24,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>  #include "sysemu/tcg.h"
>  #include "sysemu/replay.h"
>  #include "sysemu/cpu-timers.h"
> diff --git a/accel/tcg/tcg-accel-ops-rr.c b/accel/tcg/tcg-accel-ops-rr.c
> index b287110766ef..1a72149f0e46 100644
> --- a/accel/tcg/tcg-accel-ops-rr.c
> +++ b/accel/tcg/tcg-accel-ops-rr.c
> @@ -24,7 +24,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>  #include "sysemu/tcg.h"
>  #include "sysemu/replay.h"
>  #include "sysemu/cpu-timers.h"
> diff --git a/accel/tcg/tcg-accel-ops.c b/accel/tcg/tcg-accel-ops.c
> index ea7dcad674cf..684dc5a1371f 100644
> --- a/accel/tcg/tcg-accel-ops.c
> +++ b/accel/tcg/tcg-accel-ops.c
> @@ -26,7 +26,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>  #include "sysemu/tcg.h"
>  #include "sysemu/replay.h"
>  #include "sysemu/cpu-timers.h"
> diff --git a/accel/tcg/tcg-all.c b/accel/tcg/tcg-all.c
> index d6336a9c966d..47952eecd779 100644
> --- a/accel/tcg/tcg-all.c
> +++ b/accel/tcg/tcg-all.c
> @@ -24,7 +24,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>  #include "sysemu/tcg.h"
>  #include "sysemu/cpu-timers.h"
>  #include "tcg/tcg.h"
> diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
> index 5971cd53ab9f..a6e03c1e50b2 100644
> --- a/accel/tcg/translate-all.c
> +++ b/accel/tcg/translate-all.c
> @@ -18,7 +18,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>
>  #define NO_CPU_IO_DEFS
>  #include "trace.h"
> diff --git a/audio/audio_win_int.c b/audio/audio_win_int.c
> index 5ea8157dfcc8..316f118f5099 100644
> --- a/audio/audio_win_int.c
> +++ b/audio/audio_win_int.c
> @@ -1,7 +1,6 @@
>  /* public domain */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>
>  #define AUDIO_CAP "win-int"
>  #include <windows.h>
> diff --git a/backends/hostmem-epc.c b/backends/hostmem-epc.c
> index b47f98b6a3aa..037292d2672f 100644
> --- a/backends/hostmem-epc.c
> +++ b/backends/hostmem-epc.c
> @@ -12,7 +12,6 @@
>  #include <sys/ioctl.h>
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>  #include "qom/object_interfaces.h"
>  #include "qapi/error.h"
>  #include "sysemu/hostmem.h"
> diff --git a/backends/tpm/tpm_passthrough.c
> b/backends/tpm/tpm_passthrough.c
> index d5558fae6cc5..5a2f74db1b38 100644
> --- a/backends/tpm/tpm_passthrough.c
> +++ b/backends/tpm/tpm_passthrough.c
> @@ -23,7 +23,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>  #include "qemu/error-report.h"
>  #include "qemu/module.h"
>  #include "qemu/sockets.h"
> diff --git a/block/file-posix.c b/block/file-posix.c
> index 61b02d85ebf1..bfd9b2111143 100644
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -23,7 +23,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>  #include "qapi/error.h"
>  #include "qemu/cutils.h"
>  #include "qemu/error-report.h"
> diff --git a/block/io_uring.c b/block/io_uring.c
> index 782afdb433e1..0b401512b973 100644
> --- a/block/io_uring.c
> +++ b/block/io_uring.c
> @@ -10,7 +10,6 @@
>   */
>  #include "qemu/osdep.h"
>  #include <liburing.h>
> -#include "qemu-common.h"
>  #include "block/aio.h"
>  #include "qemu/queue.h"
>  #include "block/block.h"
> diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.=
c
> index a17ff9f6ecce..d272478e7b0a 100644
> --- a/bsd-user/freebsd/os-syscall.c
> +++ b/bsd-user/freebsd/os-syscall.c
> @@ -37,7 +37,6 @@
>  #include <utime.h>
>
>  #include "qemu.h"
> -#include "qemu-common.h"
>  #include "signal-common.h"
>  #include "user/syscall-trace.h"
>
> diff --git a/bsd-user/mmap.c b/bsd-user/mmap.c
> index 07aa0a634dff..e54e26de17b0 100644
> --- a/bsd-user/mmap.c
> +++ b/bsd-user/mmap.c
> @@ -19,7 +19,6 @@
>  #include "qemu/osdep.h"
>
>  #include "qemu.h"
> -#include "qemu-common.h"
>
>  static pthread_mutex_t mmap_mutex =3D PTHREAD_MUTEX_INITIALIZER;
>  static __thread int mmap_lock_count;
> diff --git a/chardev/char-fd.c b/chardev/char-fd.c
> index 93c56913b49a..6ec9682b22f2 100644
> --- a/chardev/char-fd.c
> +++ b/chardev/char-fd.c
> @@ -23,7 +23,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>  #include "qemu/module.h"
>  #include "qemu/sockets.h"
>  #include "qapi/error.h"
> diff --git a/chardev/char-pipe.c b/chardev/char-pipe.c
> index 7eca5d9a56ae..66d3b8509183 100644
> --- a/chardev/char-pipe.c
> +++ b/chardev/char-pipe.c
> @@ -23,7 +23,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>  #include "qapi/error.h"
>  #include "qemu/main-loop.h"
>  #include "qemu/module.h"
> diff --git a/chardev/char-pty.c b/chardev/char-pty.c
> index d73d8b23903d..1e2863f532a8 100644
> --- a/chardev/char-pty.c
> +++ b/chardev/char-pty.c
> @@ -23,7 +23,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>  #include "qapi/error.h"
>  #include "chardev/char.h"
>  #include "io/channel-file.h"
> diff --git a/cpu.c b/cpu.c
> index ab2c7c81e460..0fef70e18e74 100644
> --- a/cpu.c
> +++ b/cpu.c
> @@ -18,7 +18,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>  #include "qapi/error.h"
>
>  #include "exec/target_page.h"
> diff --git a/crypto/cipher-afalg.c b/crypto/cipher-afalg.c
> index c55cd28bf01c..3df8fc54c051 100644
> --- a/crypto/cipher-afalg.c
> +++ b/crypto/cipher-afalg.c
> @@ -12,7 +12,6 @@
>   */
>  #include "qemu/osdep.h"
>  #include "qemu/sockets.h"
> -#include "qemu-common.h"
>  #include "qapi/error.h"
>  #include "crypto/cipher.h"
>  #include "cipherpriv.h"
> diff --git a/crypto/hash-afalg.c b/crypto/hash-afalg.c
> index 4ac18c7c1db7..3ebea392920d 100644
> --- a/crypto/hash-afalg.c
> +++ b/crypto/hash-afalg.c
> @@ -13,7 +13,6 @@
>  #include "qemu/osdep.h"
>  #include "qemu/iov.h"
>  #include "qemu/sockets.h"
> -#include "qemu-common.h"
>  #include "qapi/error.h"
>  #include "crypto/hash.h"
>  #include "crypto/hmac.h"
> diff --git a/dump/dump.c b/dump/dump.c
> index 5d71c47d06aa..e766ce1d7d91 100644
> --- a/dump/dump.c
> +++ b/dump/dump.c
> @@ -12,7 +12,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>  #include "qemu/cutils.h"
>  #include "elf.h"
>  #include "exec/hwaddr.h"
> diff --git a/dump/win_dump.c b/dump/win_dump.c
> index c5eb5a9aacd7..fbdbb7bd93a6 100644
> --- a/dump/win_dump.c
> +++ b/dump/win_dump.c
> @@ -9,7 +9,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>  #include "qemu/cutils.h"
>  #include "elf.h"
>  #include "exec/hwaddr.h"
> diff --git a/fsdev/virtfs-proxy-helper.c b/fsdev/virtfs-proxy-helper.c
> index d06a0f7b8326..2dde27922fe2 100644
> --- a/fsdev/virtfs-proxy-helper.c
> +++ b/fsdev/virtfs-proxy-helper.c
> @@ -21,7 +21,6 @@
>  #include <linux/magic.h>
>  #endif
>  #include <cap-ng.h>
> -#include "qemu-common.h"
>  #include "qemu/sockets.h"
>  #include "qemu/xattr.h"
>  #include "9p-iov-marshal.h"
> diff --git a/gdbstub.c b/gdbstub.c
> index c8375e3c3ffe..2c804d506629 100644
> --- a/gdbstub.c
> +++ b/gdbstub.c
> @@ -24,7 +24,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>  #include "qapi/error.h"
>  #include "qemu/error-report.h"
>  #include "qemu/ctype.h"
> diff --git a/hw/9pfs/9p-proxy.c b/hw/9pfs/9p-proxy.c
> index 4c5e0fc217eb..99d115ff0db4 100644
> --- a/hw/9pfs/9p-proxy.c
> +++ b/hw/9pfs/9p-proxy.c
> @@ -18,7 +18,6 @@
>  #include "qemu/osdep.h"
>  #include <sys/socket.h>
>  #include <sys/un.h>
> -#include "qemu-common.h"
>  #include "9p.h"
>  #include "qapi/error.h"
>  #include "qemu/cutils.h"
> diff --git a/hw/alpha/dp264.c b/hw/alpha/dp264.c
> index c78ed96d0eca..f4349eba83fb 100644
> --- a/hw/alpha/dp264.c
> +++ b/hw/alpha/dp264.c
> @@ -7,7 +7,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>  #include "cpu.h"
>  #include "elf.h"
>  #include "hw/loader.h"
> diff --git a/hw/avr/boot.c b/hw/avr/boot.c
> index cbede775cee2..617f3a144c85 100644
> --- a/hw/avr/boot.c
> +++ b/hw/avr/boot.c
> @@ -9,7 +9,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>  #include "qemu/datadir.h"
>  #include "hw/loader.h"
>  #include "elf.h"
> diff --git a/hw/core/loader.c b/hw/core/loader.c
> index 8d9b2df6e725..8167301f0402 100644
> --- a/hw/core/loader.c
> +++ b/hw/core/loader.c
> @@ -43,7 +43,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>  #include "qemu/datadir.h"
>  #include "qapi/error.h"
>  #include "qapi/qapi-commands-machine.h"
> diff --git a/hw/display/artist.c b/hw/display/artist.c
> index 69a8f9eea8ba..8e121bb0b4dc 100644
> --- a/hw/display/artist.c
> +++ b/hw/display/artist.c
> @@ -7,7 +7,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>  #include "qemu/error-report.h"
>  #include "qemu/log.h"
>  #include "qemu/module.h"
> diff --git a/hw/display/cg3.c b/hw/display/cg3.c
> index 4b7e78d91924..2e9656ae1c39 100644
> --- a/hw/display/cg3.c
> +++ b/hw/display/cg3.c
> @@ -24,7 +24,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>  #include "qemu/datadir.h"
>  #include "qapi/error.h"
>  #include "qemu/error-report.h"
> diff --git a/hw/display/tcx.c b/hw/display/tcx.c
> index d4d09d0df8d5..1b27b64f6d14 100644
> --- a/hw/display/tcx.c
> +++ b/hw/display/tcx.c
> @@ -23,7 +23,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>  #include "qemu/datadir.h"
>  #include "qapi/error.h"
>  #include "ui/console.h"
> diff --git a/hw/display/virtio-gpu-udmabuf.c
> b/hw/display/virtio-gpu-udmabuf.c
> index 1597921c51fc..8bdf4bac6e4b 100644
> --- a/hw/display/virtio-gpu-udmabuf.c
> +++ b/hw/display/virtio-gpu-udmabuf.c
> @@ -13,7 +13,6 @@
>
>  #include "qemu/osdep.h"
>  #include "qemu/units.h"
> -#include "qemu-common.h"
>  #include "qemu/iov.h"
>  #include "ui/console.h"
>  #include "hw/virtio/virtio-gpu.h"
> diff --git a/hw/dma/pl330.c b/hw/dma/pl330.c
> index 31ce01b7c57c..08e5938ec7b7 100644
> --- a/hw/dma/pl330.c
> +++ b/hw/dma/pl330.c
> @@ -15,7 +15,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>  #include "hw/irq.h"
>  #include "hw/qdev-properties.h"
>  #include "hw/sysbus.h"
> diff --git a/hw/hppa/machine.c b/hw/hppa/machine.c
> index 98b30e0395ee..f7595c08577c 100644
> --- a/hw/hppa/machine.c
> +++ b/hw/hppa/machine.c
> @@ -4,7 +4,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>  #include "qemu/datadir.h"
>  #include "cpu.h"
>  #include "elf.h"
> diff --git a/hw/i386/pc_sysfw.c b/hw/i386/pc_sysfw.c
> index c8b17af95353..0540047bad22 100644
> --- a/hw/i386/pc_sysfw.c
> +++ b/hw/i386/pc_sysfw.c
> @@ -24,7 +24,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>  #include "qapi/error.h"
>  #include "sysemu/block-backend.h"
>  #include "qemu/error-report.h"
> diff --git a/hw/i386/x86.c b/hw/i386/x86.c
> index 4cf107baea34..bb6727279097 100644
> --- a/hw/i386/x86.c
> +++ b/hw/i386/x86.c
> @@ -25,7 +25,6 @@
>  #include "qemu/option.h"
>  #include "qemu/cutils.h"
>  #include "qemu/units.h"
> -#include "qemu-common.h"
>  #include "qemu/datadir.h"
>  #include "qapi/error.h"
>  #include "qapi/qmp/qerror.h"
> diff --git a/hw/input/vhost-user-input.c b/hw/input/vhost-user-input.c
> index 273e96a7b12d..aeb0624fe57e 100644
> --- a/hw/input/vhost-user-input.c
> +++ b/hw/input/vhost-user-input.c
> @@ -7,7 +7,6 @@
>  #include "qemu/osdep.h"
>  #include "qemu/error-report.h"
>  #include "qapi/error.h"
> -#include "qemu-common.h"
>
>  #include "hw/virtio/virtio-input.h"
>
> diff --git a/hw/intc/xics_kvm.c b/hw/intc/xics_kvm.c
> index f5bfc501bc15..9719d98a179e 100644
> --- a/hw/intc/xics_kvm.c
> +++ b/hw/intc/xics_kvm.c
> @@ -27,7 +27,6 @@
>
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
> -#include "qemu-common.h"
>  #include "trace.h"
>  #include "sysemu/kvm.h"
>  #include "hw/ppc/spapr.h"
> diff --git a/hw/m68k/mcf5208.c b/hw/m68k/mcf5208.c
> index 93812ee206ea..655207e393dc 100644
> --- a/hw/m68k/mcf5208.c
> +++ b/hw/m68k/mcf5208.c
> @@ -11,7 +11,6 @@
>  #include "qemu/error-report.h"
>  #include "qemu/log.h"
>  #include "qapi/error.h"
> -#include "qemu-common.h"
>  #include "qemu/datadir.h"
>  #include "cpu.h"
>  #include "hw/irq.h"
> diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
> index 66ca5c0df6ef..099a758c6f6a 100644
> --- a/hw/m68k/q800.c
> +++ b/hw/m68k/q800.c
> @@ -22,7 +22,6 @@
>
>  #include "qemu/osdep.h"
>  #include "qemu/units.h"
> -#include "qemu-common.h"
>  #include "qemu/datadir.h"
>  #include "sysemu/sysemu.h"
>  #include "cpu.h"
> diff --git a/hw/m68k/virt.c b/hw/m68k/virt.c
> index 8e630282e02c..7de8b5f83393 100644
> --- a/hw/m68k/virt.c
> +++ b/hw/m68k/virt.c
> @@ -9,7 +9,6 @@
>
>  #include "qemu/osdep.h"
>  #include "qemu/units.h"
> -#include "qemu-common.h"
>  #include "sysemu/sysemu.h"
>  #include "cpu.h"
>  #include "hw/boards.h"
> diff --git a/hw/microblaze/boot.c b/hw/microblaze/boot.c
> index 03c030aa2cf0..8b92a9801a02 100644
> --- a/hw/microblaze/boot.c
> +++ b/hw/microblaze/boot.c
> @@ -25,7 +25,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>  #include "qemu/datadir.h"
>  #include "cpu.h"
>  #include "qemu/option.h"
> diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
> index c9f14e70a077..7b13098f9b1b 100644
> --- a/hw/mips/fuloong2e.c
> +++ b/hw/mips/fuloong2e.c
> @@ -19,7 +19,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>  #include "qemu/datadir.h"
>  #include "qemu/units.h"
>  #include "qapi/error.h"
> diff --git a/hw/mips/jazz.c b/hw/mips/jazz.c
> index 4d6b44de342e..6598d7dddd59 100644
> --- a/hw/mips/jazz.c
> +++ b/hw/mips/jazz.c
> @@ -23,7 +23,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>  #include "qemu/datadir.h"
>  #include "hw/clock.h"
>  #include "hw/mips/mips.h"
> diff --git a/hw/mips/loongson3_virt.c b/hw/mips/loongson3_virt.c
> index ae192db0c8b9..25534288dd81 100644
> --- a/hw/mips/loongson3_virt.c
> +++ b/hw/mips/loongson3_virt.c
> @@ -24,7 +24,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>  #include "qemu/units.h"
>  #include "qemu/cutils.h"
>  #include "qemu/datadir.h"
> diff --git a/hw/mips/malta.c b/hw/mips/malta.c
> index c4474b927c46..9ffdc5b8f187 100644
> --- a/hw/mips/malta.c
> +++ b/hw/mips/malta.c
> @@ -25,7 +25,6 @@
>  #include "qemu/osdep.h"
>  #include "qemu/units.h"
>  #include "qemu/bitops.h"
> -#include "qemu-common.h"
>  #include "qemu/datadir.h"
>  #include "hw/clock.h"
>  #include "hw/southbridge/piix.h"
> diff --git a/hw/mips/mipssim.c b/hw/mips/mipssim.c
> index 30bc1c4f086f..39f64448f244 100644
> --- a/hw/mips/mipssim.c
> +++ b/hw/mips/mipssim.c
> @@ -27,7 +27,6 @@
>
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
> -#include "qemu-common.h"
>  #include "qemu/datadir.h"
>  #include "hw/clock.h"
>  #include "hw/mips/mips.h"
> diff --git a/hw/misc/sbsa_ec.c b/hw/misc/sbsa_ec.c
> index 83020fe9ac9b..8d939fe31b1b 100644
> --- a/hw/misc/sbsa_ec.c
> +++ b/hw/misc/sbsa_ec.c
> @@ -11,7 +11,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>  #include "qemu/log.h"
>  #include "hw/sysbus.h"
>  #include "sysemu/runstate.h"
> diff --git a/hw/net/fsl_etsec/etsec.c b/hw/net/fsl_etsec/etsec.c
> index e7fc082518d2..6d50c395439a 100644
> --- a/hw/net/fsl_etsec/etsec.c
> +++ b/hw/net/fsl_etsec/etsec.c
> @@ -27,7 +27,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>  #include "hw/sysbus.h"
>  #include "hw/irq.h"
>  #include "hw/ptimer.h"
> diff --git a/hw/net/fsl_etsec/rings.c b/hw/net/fsl_etsec/rings.c
> index 8f084464155d..a32589e33be4 100644
> --- a/hw/net/fsl_etsec/rings.c
> +++ b/hw/net/fsl_etsec/rings.c
> @@ -22,7 +22,6 @@
>   * THE SOFTWARE.
>   */
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>  #include "net/checksum.h"
>  #include "qemu/log.h"
>  #include "etsec.h"
> diff --git a/hw/net/msf2-emac.c b/hw/net/msf2-emac.c
> index 9278fdce0b3d..7ccd3e514271 100644
> --- a/hw/net/msf2-emac.c
> +++ b/hw/net/msf2-emac.c
> @@ -29,7 +29,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>  #include "qemu/log.h"
>  #include "qapi/error.h"
>  #include "hw/registerfields.h"
> diff --git a/hw/net/npcm7xx_emc.c b/hw/net/npcm7xx_emc.c
> index 9a2328935c1c..7c86bb52e571 100644
> --- a/hw/net/npcm7xx_emc.c
> +++ b/hw/net/npcm7xx_emc.c
> @@ -32,7 +32,6 @@
>  /* For crc32 */
>  #include <zlib.h>
>
> -#include "qemu-common.h"
>  #include "hw/irq.h"
>  #include "hw/qdev-clock.h"
>  #include "hw/qdev-properties.h"
> diff --git a/hw/nios2/boot.c b/hw/nios2/boot.c
> index e889595d5c2b..07b8d87633b6 100644
> --- a/hw/nios2/boot.c
> +++ b/hw/nios2/boot.c
> @@ -30,7 +30,6 @@
>
>  #include "qemu/osdep.h"
>  #include "qemu/units.h"
> -#include "qemu-common.h"
>  #include "qemu/datadir.h"
>  #include "qemu/option.h"
>  #include "qemu/config-file.h"
> diff --git a/hw/nios2/generic_nommu.c b/hw/nios2/generic_nommu.c
> index fbc18dbd04c2..48edb3ae373d 100644
> --- a/hw/nios2/generic_nommu.c
> +++ b/hw/nios2/generic_nommu.c
> @@ -28,7 +28,6 @@
>
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
> -#include "qemu-common.h"
>
>  #include "hw/char/serial.h"
>  #include "hw/boards.h"
> diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
> index ea2d56f9f2af..4125cbebcd38 100644
> --- a/hw/nvram/fw_cfg.c
> +++ b/hw/nvram/fw_cfg.c
> @@ -23,7 +23,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>  #include "qemu/datadir.h"
>  #include "sysemu/sysemu.h"
>  #include "sysemu/dma.h"
> diff --git a/hw/pci-host/mv64361.c b/hw/pci-host/mv64361.c
> index 00b3ff7d9098..cc9c4d6d3b33 100644
> --- a/hw/pci-host/mv64361.c
> +++ b/hw/pci-host/mv64361.c
> @@ -9,7 +9,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>  #include "qemu/units.h"
>  #include "qapi/error.h"
>  #include "hw/hw.h"
> diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
> index 6e9aa9d6ace2..4e68ad4f03fc 100644
> --- a/hw/pci-host/pnv_phb3.c
> +++ b/hw/pci-host/pnv_phb3.c
> @@ -10,7 +10,6 @@
>  #include "qemu/log.h"
>  #include "qapi/visitor.h"
>  #include "qapi/error.h"
> -#include "qemu-common.h"
>  #include "hw/pci-host/pnv_phb3_regs.h"
>  #include "hw/pci-host/pnv_phb3.h"
>  #include "hw/pci/pcie_host.h"
> diff --git a/hw/pci-host/pnv_phb3_msi.c b/hw/pci-host/pnv_phb3_msi.c
> index 8bcbc2cc4f37..2f4112907b84 100644
> --- a/hw/pci-host/pnv_phb3_msi.c
> +++ b/hw/pci-host/pnv_phb3_msi.c
> @@ -9,7 +9,6 @@
>  #include "qemu/osdep.h"
>  #include "qemu/log.h"
>  #include "qapi/error.h"
> -#include "qemu-common.h"
>  #include "hw/pci-host/pnv_phb3_regs.h"
>  #include "hw/pci-host/pnv_phb3.h"
>  #include "hw/ppc/pnv.h"
> diff --git a/hw/pci-host/pnv_phb3_pbcq.c b/hw/pci-host/pnv_phb3_pbcq.c
> index c7426cd27a20..82f70efa4311 100644
> --- a/hw/pci-host/pnv_phb3_pbcq.c
> +++ b/hw/pci-host/pnv_phb3_pbcq.c
> @@ -8,7 +8,6 @@
>   */
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
> -#include "qemu-common.h"
>  #include "qemu/log.h"
>  #include "target/ppc/cpu.h"
>  #include "hw/ppc/fdt.h"
> diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
> index 11c97e27eb16..3c4c2dace0a3 100644
> --- a/hw/pci-host/pnv_phb4.c
> +++ b/hw/pci-host/pnv_phb4.c
> @@ -10,7 +10,6 @@
>  #include "qemu/log.h"
>  #include "qapi/visitor.h"
>  #include "qapi/error.h"
> -#include "qemu-common.h"
>  #include "monitor/monitor.h"
>  #include "target/ppc/cpu.h"
>  #include "hw/pci-host/pnv_phb4_regs.h"
> diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
> index 6f1121a9489a..61bc0b503e3e 100644
> --- a/hw/pci-host/pnv_phb4_pec.c
> +++ b/hw/pci-host/pnv_phb4_pec.c
> @@ -8,7 +8,6 @@
>   */
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
> -#include "qemu-common.h"
>  #include "qemu/log.h"
>  #include "target/ppc/cpu.h"
>  #include "hw/ppc/fdt.h"
> diff --git a/hw/pci-host/raven.c b/hw/pci-host/raven.c
> index 6e514f75eb8f..7a105e4a63d3 100644
> --- a/hw/pci-host/raven.c
> +++ b/hw/pci-host/raven.c
> @@ -24,7 +24,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>  #include "qemu/datadir.h"
>  #include "qemu/units.h"
>  #include "qemu/log.h"
> diff --git a/hw/pci-host/remote.c b/hw/pci-host/remote.c
> index eee45444ef73..bfb25ef6af85 100644
> --- a/hw/pci-host/remote.c
> +++ b/hw/pci-host/remote.c
> @@ -22,7 +22,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>
>  #include "hw/pci/pci.h"
>  #include "hw/pci/pci_host.h"
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index dae9119bfe5f..e99417e50110 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -23,7 +23,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>  #include "qemu/datadir.h"
>  #include "qemu/units.h"
>  #include "hw/irq.h"
> diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
> index c7e6767f91a8..2bc3dce1fb7d 100644
> --- a/hw/ppc/e500.c
> +++ b/hw/ppc/e500.c
> @@ -15,7 +15,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>  #include "qemu/datadir.h"
>  #include "qemu/units.h"
>  #include "qapi/error.h"
> diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
> index 7b5a205309af..e8ef1a9e5d9b 100644
> --- a/hw/ppc/mac_newworld.c
> +++ b/hw/ppc/mac_newworld.c
> @@ -47,7 +47,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>  #include "qemu/datadir.h"
>  #include "qapi/error.h"
>  #include "hw/ppc/ppc.h"
> diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
> index 7016979a7cd0..fe2adb057b0c 100644
> --- a/hw/ppc/mac_oldworld.c
> +++ b/hw/ppc/mac_oldworld.c
> @@ -25,7 +25,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>  #include "qemu/datadir.h"
>  #include "qemu/units.h"
>  #include "qapi/error.h"
> diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
> index d45008ac7131..56bf203dfddf 100644
> --- a/hw/ppc/pegasos2.c
> +++ b/hw/ppc/pegasos2.c
> @@ -8,7 +8,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>  #include "qemu/units.h"
>  #include "qapi/error.h"
>  #include "hw/hw.h"
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index 00f57c9678e6..c5e48992d988 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -18,7 +18,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>  #include "qemu/datadir.h"
>  #include "qemu/units.h"
>  #include "qemu/cutils.h"
> diff --git a/hw/ppc/pnv_bmc.c b/hw/ppc/pnv_bmc.c
> index 75a22ce50b11..99f1e8d7f9f3 100644
> --- a/hw/ppc/pnv_bmc.c
> +++ b/hw/ppc/pnv_bmc.c
> @@ -17,7 +17,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>  #include "qapi/error.h"
>  #include "target/ppc/cpu.h"
>  #include "qemu/log.h"
> diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
> index 7e1a4ac9553b..32013b89836a 100644
> --- a/hw/ppc/ppc405_boards.c
> +++ b/hw/ppc/ppc405_boards.c
> @@ -25,7 +25,6 @@
>  #include "qemu/osdep.h"
>  #include "qemu/units.h"
>  #include "qapi/error.h"
> -#include "qemu-common.h"
>  #include "qemu/datadir.h"
>  #include "cpu.h"
>  #include "hw/ppc/ppc.h"
> diff --git a/hw/ppc/ppc440_bamboo.c b/hw/ppc/ppc440_bamboo.c
> index 7fb620b9a056..efa90ef5ba73 100644
> --- a/hw/ppc/ppc440_bamboo.c
> +++ b/hw/ppc/ppc440_bamboo.c
> @@ -14,7 +14,6 @@
>  #include "qemu/osdep.h"
>  #include "qemu/units.h"
>  #include "qemu/error-report.h"
> -#include "qemu-common.h"
>  #include "qemu/datadir.h"
>  #include "qemu/error-report.h"
>  #include "net/net.h"
> diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
> index 0737234d66e5..2f24598f55db 100644
> --- a/hw/ppc/sam460ex.c
> +++ b/hw/ppc/sam460ex.c
> @@ -13,7 +13,6 @@
>
>  #include "qemu/osdep.h"
>  #include "qemu/units.h"
> -#include "qemu-common.h"
>  #include "qemu/datadir.h"
>  #include "qemu/error-report.h"
>  #include "qapi/error.h"
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index a4372ba1891e..cc11fcc8b24d 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -25,7 +25,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>  #include "qemu/datadir.h"
>  #include "qemu/memalign.h"
>  #include "qapi/error.h"
> diff --git a/hw/ppc/spapr_numa.c b/hw/ppc/spapr_numa.c
> index d7c0e212baf8..a64098c375e0 100644
> --- a/hw/ppc/spapr_numa.c
> +++ b/hw/ppc/spapr_numa.c
> @@ -11,7 +11,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>  #include "hw/ppc/spapr_numa.h"
>  #include "hw/pci-host/spapr.h"
>  #include "hw/ppc/fdt.h"
> diff --git a/hw/ppc/spapr_pci_nvlink2.c b/hw/ppc/spapr_pci_nvlink2.c
> index 4678c79235f6..63b476c8f727 100644
> --- a/hw/ppc/spapr_pci_nvlink2.c
> +++ b/hw/ppc/spapr_pci_nvlink2.c
> @@ -23,7 +23,6 @@
>   */
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
> -#include "qemu-common.h"
>  #include "hw/pci/pci.h"
>  #include "hw/pci-host/spapr.h"
>  #include "hw/ppc/spapr_numa.h"
> diff --git a/hw/ppc/spapr_tpm_proxy.c b/hw/ppc/spapr_tpm_proxy.c
> index 2454086744b1..e10af35a1850 100644
> --- a/hw/ppc/spapr_tpm_proxy.c
> +++ b/hw/ppc/spapr_tpm_proxy.c
> @@ -11,7 +11,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>  #include "qapi/error.h"
>  #include "qemu/error-report.h"
>  #include "sysemu/reset.h"
> diff --git a/hw/ppc/spapr_vof.c b/hw/ppc/spapr_vof.c
> index a33f940c32bb..09f29be0b9de 100644
> --- a/hw/ppc/spapr_vof.c
> +++ b/hw/ppc/spapr_vof.c
> @@ -4,7 +4,6 @@
>   * SPDX-License-Identifier: GPL-2.0-or-later
>   */
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>  #include "qapi/error.h"
>  #include "hw/ppc/spapr.h"
>  #include "hw/ppc/spapr_vio.h"
> diff --git a/hw/ppc/virtex_ml507.c b/hw/ppc/virtex_ml507.c
> index 9c575403b85c..b67a709ddce2 100644
> --- a/hw/ppc/virtex_ml507.c
> +++ b/hw/ppc/virtex_ml507.c
> @@ -23,7 +23,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>  #include "qemu/datadir.h"
>  #include "qemu/units.h"
>  #include "cpu.h"
> diff --git a/hw/ppc/vof.c b/hw/ppc/vof.c
> index 2b63a6287561..8d96593677da 100644
> --- a/hw/ppc/vof.c
> +++ b/hw/ppc/vof.c
> @@ -10,7 +10,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>  #include "qemu/timer.h"
>  #include "qemu/range.h"
>  #include "qemu/units.h"
> diff --git a/hw/remote/iohub.c b/hw/remote/iohub.c
> index 547d597f0feb..40dfee4bad43 100644
> --- a/hw/remote/iohub.c
> +++ b/hw/remote/iohub.c
> @@ -9,7 +9,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>
>  #include "hw/pci/pci.h"
>  #include "hw/pci/pci_ids.h"
> diff --git a/hw/remote/machine.c b/hw/remote/machine.c
> index 952105eab5a2..92d71d47bb9c 100644
> --- a/hw/remote/machine.c
> +++ b/hw/remote/machine.c
> @@ -14,7 +14,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>
>  #include "hw/remote/machine.h"
>  #include "exec/memory.h"
> diff --git a/hw/remote/memory.c b/hw/remote/memory.c
> index 6e21ab1a45c9..6d60da91e01c 100644
> --- a/hw/remote/memory.c
> +++ b/hw/remote/memory.c
> @@ -9,7 +9,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>
>  #include "hw/remote/memory.h"
>  #include "exec/ram_addr.h"
> diff --git a/hw/remote/message.c b/hw/remote/message.c
> index 11d729845c5a..50f6bf2d495f 100644
> --- a/hw/remote/message.c
> +++ b/hw/remote/message.c
> @@ -8,7 +8,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>
>  #include "hw/remote/machine.h"
>  #include "io/channel.h"
> diff --git a/hw/remote/mpqemu-link.c b/hw/remote/mpqemu-link.c
> index 7e841820e521..2a4aa651ca26 100644
> --- a/hw/remote/mpqemu-link.c
> +++ b/hw/remote/mpqemu-link.c
> @@ -9,7 +9,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>
>  #include "qemu/module.h"
>  #include "hw/remote/mpqemu-link.h"
> diff --git a/hw/remote/proxy-memory-listener.c
> b/hw/remote/proxy-memory-listener.c
> index 0e893f3189e9..eb9918fe72bb 100644
> --- a/hw/remote/proxy-memory-listener.c
> +++ b/hw/remote/proxy-memory-listener.c
> @@ -7,7 +7,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>
>  #include "qemu/compiler.h"
>  #include "qemu/int128.h"
> diff --git a/hw/remote/proxy.c b/hw/remote/proxy.c
> index bad164299dd4..1c7786b52cf1 100644
> --- a/hw/remote/proxy.c
> +++ b/hw/remote/proxy.c
> @@ -7,7 +7,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>
>  #include "hw/remote/proxy.h"
>  #include "hw/pci/pci.h"
> diff --git a/hw/remote/remote-obj.c b/hw/remote/remote-obj.c
> index 4f21254219f8..333e5ac44331 100644
> --- a/hw/remote/remote-obj.c
> +++ b/hw/remote/remote-obj.c
> @@ -8,7 +8,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>
>  #include "qemu/error-report.h"
>  #include "qemu/notify.h"
> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> index cae74fcbcd9a..0f179d36014a 100644
> --- a/hw/riscv/boot.c
> +++ b/hw/riscv/boot.c
> @@ -18,7 +18,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>  #include "qemu/datadir.h"
>  #include "qemu/units.h"
>  #include "qemu/error-report.h"
> diff --git a/hw/rx/rx-gdbsim.c b/hw/rx/rx-gdbsim.c
> index 75d1fec6ca46..64f897e5b10a 100644
> --- a/hw/rx/rx-gdbsim.c
> +++ b/hw/rx/rx-gdbsim.c
> @@ -20,7 +20,6 @@
>  #include "qemu/cutils.h"
>  #include "qemu/error-report.h"
>  #include "qapi/error.h"
> -#include "qemu-common.h"
>  #include "hw/loader.h"
>  #include "hw/rx/rx62n.h"
>  #include "sysemu/qtest.h"
> diff --git a/hw/s390x/ipl.c b/hw/s390x/ipl.c
> index eb7fc4c4ae87..84971e537b3e 100644
> --- a/hw/s390x/ipl.c
> +++ b/hw/s390x/ipl.c
> @@ -13,7 +13,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>  #include "qemu/datadir.h"
>  #include "qapi/error.h"
>  #include "sysemu/reset.h"
> diff --git a/hw/sd/sd.c b/hw/sd/sd.c
> index cd67a7bac8e2..8e6fa0915137 100644
> --- a/hw/sd/sd.c
> +++ b/hw/sd/sd.c
> @@ -47,7 +47,6 @@
>  #include "qemu/timer.h"
>  #include "qemu/log.h"
>  #include "qemu/module.h"
> -#include "qemu-common.h"
>  #include "sdmmc-internal.h"
>  #include "trace.h"
>
> diff --git a/hw/sparc/leon3.c b/hw/sparc/leon3.c
> index a9f24968275d..1e39d2e2d0ac 100644
> --- a/hw/sparc/leon3.c
> +++ b/hw/sparc/leon3.c
> @@ -26,7 +26,6 @@
>  #include "qemu/units.h"
>  #include "qemu/error-report.h"
>  #include "qapi/error.h"
> -#include "qemu-common.h"
>  #include "qemu/datadir.h"
>  #include "cpu.h"
>  #include "hw/irq.h"
> diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
> index 7f3a7c002780..fccaed1eb444 100644
> --- a/hw/sparc/sun4m.c
> +++ b/hw/sparc/sun4m.c
> @@ -26,7 +26,6 @@
>  #include "qemu/units.h"
>  #include "qapi/error.h"
>  #include "qemu/datadir.h"
> -#include "qemu-common.h"
>  #include "cpu.h"
>  #include "hw/sysbus.h"
>  #include "qemu/error-report.h"
> diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
> index cda7df36e312..6fd08e2298a6 100644
> --- a/hw/sparc64/sun4u.c
> +++ b/hw/sparc64/sun4u.c
> @@ -26,7 +26,6 @@
>  #include "qemu/units.h"
>  #include "qemu/error-report.h"
>  #include "qapi/error.h"
> -#include "qemu-common.h"
>  #include "qemu/datadir.h"
>  #include "cpu.h"
>  #include "hw/pci/pci.h"
> diff --git a/hw/usb/dev-mtp.c b/hw/usb/dev-mtp.c
> index e6b77a2a941d..5831395cef75 100644
> --- a/hw/usb/dev-mtp.c
> +++ b/hw/usb/dev-mtp.c
> @@ -10,7 +10,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>  #include "qapi/error.h"
>  #include "qemu/error-report.h"
>  #include <wchar.h>
> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
> index 664cbd958323..6de58a76a7ff 100644
> --- a/hw/virtio/virtio-iommu.c
> +++ b/hw/virtio/virtio-iommu.c
> @@ -20,7 +20,6 @@
>  #include "qemu/osdep.h"
>  #include "qemu/log.h"
>  #include "qemu/iov.h"
> -#include "qemu-common.h"
>  #include "hw/qdev-properties.h"
>  #include "hw/virtio/virtio.h"
>  #include "sysemu/kvm.h"
> diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
> index 35cbf1f21946..5aca40872695 100644
> --- a/hw/virtio/virtio-mem.c
> +++ b/hw/virtio/virtio-mem.c
> @@ -11,7 +11,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>  #include "qemu/iov.h"
>  #include "qemu/cutils.h"
>  #include "qemu/error-report.h"
> diff --git a/hw/virtio/virtio-pmem.c b/hw/virtio/virtio-pmem.c
> index 5419dca75e2c..5dd21c2c4408 100644
> --- a/hw/virtio/virtio-pmem.c
> +++ b/hw/virtio/virtio-pmem.c
> @@ -13,7 +13,6 @@
>
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
> -#include "qemu-common.h"
>  #include "qemu/error-report.h"
>  #include "qemu/main-loop.h"
>  #include "hw/virtio/virtio-pmem.h"
> diff --git a/io/channel-socket.c b/io/channel-socket.c
> index 7a8d9f69c92d..9f5ddf68b687 100644
> --- a/io/channel-socket.c
> +++ b/io/channel-socket.c
> @@ -18,7 +18,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>  #include "qapi/error.h"
>  #include "qapi/qapi-visit-sockets.h"
>  #include "qemu/module.h"
> diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.=
c
> index 31a66a4fa07c..3b273f62997a 100644
> --- a/linux-user/aarch64/cpu_loop.c
> +++ b/linux-user/aarch64/cpu_loop.c
> @@ -18,7 +18,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>  #include "qemu.h"
>  #include "user-internals.h"
>  #include "cpu_loop-common.h"
> diff --git a/linux-user/alpha/cpu_loop.c b/linux-user/alpha/cpu_loop.c
> index de6e0c901cdf..2ea039aa71f7 100644
> --- a/linux-user/alpha/cpu_loop.c
> +++ b/linux-user/alpha/cpu_loop.c
> @@ -18,7 +18,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>  #include "qemu.h"
>  #include "user-internals.h"
>  #include "cpu_loop-common.h"
> diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c
> index 9dcb2e024eb0..683b8e47c2bd 100644
> --- a/linux-user/arm/cpu_loop.c
> +++ b/linux-user/arm/cpu_loop.c
> @@ -18,7 +18,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>  #include "qemu.h"
>  #include "user-internals.h"
>  #include "elf.h"
> diff --git a/linux-user/cris/cpu_loop.c b/linux-user/cris/cpu_loop.c
> index 0f46b3c1a87a..01e6ff16fc92 100644
> --- a/linux-user/cris/cpu_loop.c
> +++ b/linux-user/cris/cpu_loop.c
> @@ -18,7 +18,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>  #include "qemu.h"
>  #include "user-internals.h"
>  #include "cpu_loop-common.h"
> diff --git a/linux-user/hexagon/cpu_loop.c b/linux-user/hexagon/cpu_loop.=
c
> index 0d73934d31d5..b84e25bf71eb 100644
> --- a/linux-user/hexagon/cpu_loop.c
> +++ b/linux-user/hexagon/cpu_loop.c
> @@ -19,7 +19,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>  #include "qemu.h"
>  #include "user-internals.h"
>  #include "cpu_loop-common.h"
> diff --git a/linux-user/i386/cpu_loop.c b/linux-user/i386/cpu_loop.c
> index 90bffc1956aa..492701dd9af9 100644
> --- a/linux-user/i386/cpu_loop.c
> +++ b/linux-user/i386/cpu_loop.c
> @@ -18,7 +18,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>  #include "qemu.h"
>  #include "qemu/timer.h"
>  #include "user-internals.h"
> diff --git a/linux-user/m68k/cpu_loop.c b/linux-user/m68k/cpu_loop.c
> index 928a18e3cf05..d1bf8548b747 100644
> --- a/linux-user/m68k/cpu_loop.c
> +++ b/linux-user/m68k/cpu_loop.c
> @@ -18,7 +18,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>  #include "qemu.h"
>  #include "user-internals.h"
>  #include "cpu_loop-common.h"
> diff --git a/linux-user/microblaze/cpu_loop.c
> b/linux-user/microblaze/cpu_loop.c
> index 1a2556be2c5f..5ccf9e942eaa 100644
> --- a/linux-user/microblaze/cpu_loop.c
> +++ b/linux-user/microblaze/cpu_loop.c
> @@ -18,7 +18,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>  #include "qemu.h"
>  #include "user-internals.h"
>  #include "cpu_loop-common.h"
> diff --git a/linux-user/mips/cpu_loop.c b/linux-user/mips/cpu_loop.c
> index 9bb12a07ba08..d5c1c7941d34 100644
> --- a/linux-user/mips/cpu_loop.c
> +++ b/linux-user/mips/cpu_loop.c
> @@ -18,7 +18,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>  #include "qemu.h"
>  #include "user-internals.h"
>  #include "cpu_loop-common.h"
> diff --git a/linux-user/openrisc/cpu_loop.c
> b/linux-user/openrisc/cpu_loop.c
> index 7683bea0649e..a7aa586c8f96 100644
> --- a/linux-user/openrisc/cpu_loop.c
> +++ b/linux-user/openrisc/cpu_loop.c
> @@ -18,7 +18,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>  #include "qemu.h"
>  #include "user-internals.h"
>  #include "cpu_loop-common.h"
> diff --git a/linux-user/ppc/cpu_loop.c b/linux-user/ppc/cpu_loop.c
> index b468f199e4d2..02204ad8bebb 100644
> --- a/linux-user/ppc/cpu_loop.c
> +++ b/linux-user/ppc/cpu_loop.c
> @@ -18,7 +18,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>  #include "qemu.h"
>  #include "qemu/timer.h"
>  #include "user-internals.h"
> diff --git a/linux-user/riscv/cpu_loop.c b/linux-user/riscv/cpu_loop.c
> index 26d446f32379..29084c142196 100644
> --- a/linux-user/riscv/cpu_loop.c
> +++ b/linux-user/riscv/cpu_loop.c
> @@ -18,7 +18,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>  #include "qemu/error-report.h"
>  #include "qemu.h"
>  #include "user-internals.h"
> diff --git a/linux-user/s390x/cpu_loop.c b/linux-user/s390x/cpu_loop.c
> index 7901dfe6f518..285bc60071a8 100644
> --- a/linux-user/s390x/cpu_loop.c
> +++ b/linux-user/s390x/cpu_loop.c
> @@ -18,7 +18,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>  #include "qemu.h"
>  #include "user-internals.h"
>  #include "cpu_loop-common.h"
> diff --git a/linux-user/sh4/cpu_loop.c b/linux-user/sh4/cpu_loop.c
> index 1bd313cb19a2..c805f9db1104 100644
> --- a/linux-user/sh4/cpu_loop.c
> +++ b/linux-user/sh4/cpu_loop.c
> @@ -18,7 +18,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>  #include "qemu.h"
>  #include "user-internals.h"
>  #include "cpu_loop-common.h"
> diff --git a/linux-user/sparc/cpu_loop.c b/linux-user/sparc/cpu_loop.c
> index baf3d9ae011f..434c90a55f8f 100644
> --- a/linux-user/sparc/cpu_loop.c
> +++ b/linux-user/sparc/cpu_loop.c
> @@ -18,7 +18,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>  #include "qemu.h"
>  #include "user-internals.h"
>  #include "cpu_loop-common.h"
> diff --git a/linux-user/uname.c b/linux-user/uname.c
> index 0856783b2190..415fdf31b62d 100644
> --- a/linux-user/uname.c
> +++ b/linux-user/uname.c
> @@ -21,7 +21,6 @@
>
>  #include "qemu.h"
>  #include "user-internals.h"
> -//#include "qemu-common.h"
>  #include "uname.h"
>
>  /* return highest utsname machine name for emulated instruction set
> diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
> index 883cf1ca4bbf..5e7302cbb995 100644
> --- a/monitor/qmp-cmds.c
> +++ b/monitor/qmp-cmds.c
> @@ -14,7 +14,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>  #include "qemu/cutils.h"
>  #include "qemu/option.h"
>  #include "monitor/monitor.h"
> diff --git a/net/colo-compare.c b/net/colo-compare.c
> index 62554b5b3c8f..d5d096580577 100644
> --- a/net/colo-compare.c
> +++ b/net/colo-compare.c
> @@ -13,7 +13,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>  #include "qemu/error-report.h"
>  #include "trace.h"
>  #include "qapi/error.h"
> diff --git a/net/net.c b/net/net.c
> index 9f17ab204422..a094cf1d2929 100644
> --- a/net/net.c
> +++ b/net/net.c
> @@ -23,7 +23,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>
>  #include "net/net.h"
>  #include "clients.h"
> diff --git a/net/socket.c b/net/socket.c
> index c4b80e9228d7..ea5220a2eb51 100644
> --- a/net/socket.c
> +++ b/net/socket.c
> @@ -27,7 +27,6 @@
>  #include "clients.h"
>  #include "monitor/monitor.h"
>  #include "qapi/error.h"
> -#include "qemu-common.h"
>  #include "qemu/error-report.h"
>  #include "qemu/option.h"
>  #include "qemu/sockets.h"
> diff --git a/net/tap-bsd.c b/net/tap-bsd.c
> index e45a6d124eb6..7e65bd391f0b 100644
> --- a/net/tap-bsd.c
> +++ b/net/tap-bsd.c
> @@ -23,7 +23,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>  #include "qapi/error.h"
>  #include "tap_int.h"
>  #include "qemu/cutils.h"
> diff --git a/net/tap-linux.c b/net/tap-linux.c
> index 5e70b9303710..3e24d232e782 100644
> --- a/net/tap-linux.c
> +++ b/net/tap-linux.c
> @@ -24,7 +24,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>  #include "tap_int.h"
>  #include "tap-linux.h"
>  #include "net/tap.h"
> diff --git a/net/tap-solaris.c b/net/tap-solaris.c
> index d85224242b30..79919785c9f6 100644
> --- a/net/tap-solaris.c
> +++ b/net/tap-solaris.c
> @@ -27,7 +27,6 @@
>  #include "tap_int.h"
>  #include "qemu/ctype.h"
>  #include "qemu/cutils.h"
> -#include "qemu-common.h"
>
>  #include <sys/ethernet.h>
>  #include <sys/sockio.h>
> diff --git a/net/tap-win32.c b/net/tap-win32.c
> index 6096972f5d47..7466f22e77a4 100644
> --- a/net/tap-win32.c
> +++ b/net/tap-win32.c
> @@ -29,7 +29,6 @@
>  #include "qemu/osdep.h"
>  #include "tap_int.h"
>
> -#include "qemu-common.h"
>  #include "clients.h"            /* net_init_tap */
>  #include "net/eth.h"
>  #include "net/net.h"
> diff --git a/net/tap.c b/net/tap.c
> index c5cbeaa7a2be..6190fa699d2f 100644
> --- a/net/tap.c
> +++ b/net/tap.c
> @@ -38,7 +38,6 @@
>  #include "monitor/monitor.h"
>  #include "sysemu/sysemu.h"
>  #include "qapi/error.h"
> -#include "qemu-common.h"
>  #include "qemu/cutils.h"
>  #include "qemu/error-report.h"
>  #include "qemu/main-loop.h"
> diff --git a/net/vde.c b/net/vde.c
> index 99189cccb694..1083916bcf52 100644
> --- a/net/vde.c
> +++ b/net/vde.c
> @@ -27,7 +27,6 @@
>
>  #include "net/net.h"
>  #include "clients.h"
> -#include "qemu-common.h"
>  #include "qemu/option.h"
>  #include "qemu/main-loop.h"
>  #include "qapi/error.h"
> diff --git a/os-posix.c b/os-posix.c
> index 24692c8593f3..ee765f047dea 100644
> --- a/os-posix.c
> +++ b/os-posix.c
> @@ -29,7 +29,6 @@
>  #include <grp.h>
>  #include <libgen.h>
>
> -#include "qemu-common.h"
>  /* Needed early for CONFIG_BSD etc. */
>  #include "net/slirp.h"
>  #include "qemu/qemu-options.h"
> diff --git a/os-win32.c b/os-win32.c
> index 6f21b578417c..725ad652e8bb 100644
> --- a/os-win32.c
> +++ b/os-win32.c
> @@ -26,7 +26,6 @@
>  #include "qemu/osdep.h"
>  #include <windows.h>
>  #include <mmsystem.h>
> -#include "qemu-common.h"
>  #include "sysemu/runstate.h"
>
>  static BOOL WINAPI qemu_ctrl_handler(DWORD type)
> diff --git a/page-vary-common.c b/page-vary-common.c
> index 91755564985c..ab77672dd412 100644
> --- a/page-vary-common.c
> +++ b/page-vary-common.c
> @@ -20,7 +20,6 @@
>  #define IN_PAGE_VARY 1
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>  #include "exec/page-vary.h"
>
>  /* WARNING: This file must *not* be complied with -flto. */
> diff --git a/qga/commands-posix.c b/qga/commands-posix.c
> index 4d7a2392c097..9924277c826e 100644
> --- a/qga/commands-posix.c
> +++ b/qga/commands-posix.c
> @@ -16,7 +16,6 @@
>  #include <sys/utsname.h>
>  #include <sys/wait.h>
>  #include <dirent.h>
> -#include "qemu-common.h"
>  #include "guest-agent-core.h"
>  #include "qga-qapi-commands.h"
>  #include "qapi/error.h"
> diff --git a/softmmu/cpu-throttle.c b/softmmu/cpu-throttle.c
> index 8c2144ab95cc..d9bb30a223d8 100644
> --- a/softmmu/cpu-throttle.c
> +++ b/softmmu/cpu-throttle.c
> @@ -23,7 +23,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>  #include "qemu/thread.h"
>  #include "hw/core/cpu.h"
>  #include "qemu/main-loop.h"
> diff --git a/softmmu/cpu-timers.c b/softmmu/cpu-timers.c
> index 204d946a1729..117408cb83af 100644
> --- a/softmmu/cpu-timers.c
> +++ b/softmmu/cpu-timers.c
> @@ -23,7 +23,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>  #include "qemu/cutils.h"
>  #include "migration/vmstate.h"
>  #include "qapi/error.h"
> diff --git a/softmmu/cpus.c b/softmmu/cpus.c
> index 7b75bb66d5e6..668bef9b4d62 100644
> --- a/softmmu/cpus.c
> +++ b/softmmu/cpus.c
> @@ -23,7 +23,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>  #include "monitor/monitor.h"
>  #include "qemu/coroutine-tls.h"
>  #include "qapi/error.h"
> diff --git a/softmmu/datadir.c b/softmmu/datadir.c
> index 504c4665bed7..160cac999a6f 100644
> --- a/softmmu/datadir.c
> +++ b/softmmu/datadir.c
> @@ -23,7 +23,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>  #include "qemu/datadir.h"
>  #include "qemu/cutils.h"
>  #include "trace.h"
> diff --git a/softmmu/icount.c b/softmmu/icount.c
> index 21341a4ce49e..5ca271620db6 100644
> --- a/softmmu/icount.c
> +++ b/softmmu/icount.c
> @@ -23,7 +23,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>  #include "qemu/cutils.h"
>  #include "migration/vmstate.h"
>  #include "qapi/error.h"
> diff --git a/softmmu/runstate.c b/softmmu/runstate.c
> index e0d869b21aa4..fac7b63259e8 100644
> --- a/softmmu/runstate.c
> +++ b/softmmu/runstate.c
> @@ -40,7 +40,6 @@
>  #include "qapi/error.h"
>  #include "qapi/qapi-commands-run-state.h"
>  #include "qapi/qapi-events-run-state.h"
> -#include "qemu-common.h"
>  #include "qemu/error-report.h"
>  #include "qemu/log.h"
>  #include "qemu/job.h"
> diff --git a/stubs/monitor-core.c b/stubs/monitor-core.c
> index d058a2a00d85..afa477aae656 100644
> --- a/stubs/monitor-core.c
> +++ b/stubs/monitor-core.c
> @@ -1,6 +1,5 @@
>  #include "qemu/osdep.h"
>  #include "monitor/monitor.h"
> -#include "qemu-common.h"
>  #include "qapi/qapi-emit-events.h"
>
>  Monitor *monitor_cur(void)
> diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
> index 8c34f86792ed..567e296b21c9 100644
> --- a/target/arm/hvf/hvf.c
> +++ b/target/arm/hvf/hvf.c
> @@ -10,7 +10,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>  #include "qemu/error-report.h"
>
>  #include "sysemu/runstate.h"
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index bbf1ce7ba3bc..5fc37ac10a5b 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -13,7 +13,6 @@
>
>  #include <linux/kvm.h>
>
> -#include "qemu-common.h"
>  #include "qemu/timer.h"
>  #include "qemu/error-report.h"
>  #include "qemu/main-loop.h"
> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> index 9ec8875150d6..17dd2f77d9f5 100644
> --- a/target/arm/kvm64.c
> +++ b/target/arm/kvm64.c
> @@ -16,7 +16,6 @@
>  #include <linux/elf.h>
>  #include <linux/kvm.h>
>
> -#include "qemu-common.h"
>  #include "qapi/error.h"
>  #include "cpu.h"
>  #include "qemu/timer.h"
> diff --git a/target/hexagon/gdbstub.c b/target/hexagon/gdbstub.c
> index 9c8c04c961b1..d152d01bfe7e 100644
> --- a/target/hexagon/gdbstub.c
> +++ b/target/hexagon/gdbstub.c
> @@ -16,7 +16,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>  #include "exec/gdbstub.h"
>  #include "cpu.h"
>  #include "internal.h"
> diff --git a/target/i386/hax/hax-all.c b/target/i386/hax/hax-all.c
> index 81f665e21245..b185ee8de4fd 100644
> --- a/target/i386/hax/hax-all.c
> +++ b/target/i386/hax/hax-all.c
> @@ -27,7 +27,6 @@
>  #include "cpu.h"
>  #include "exec/address-spaces.h"
>
> -#include "qemu-common.h"
>  #include "qemu/accel.h"
>  #include "sysemu/reset.h"
>  #include "sysemu/runstate.h"
> diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
> index fc12c02fb217..f8833277ab6a 100644
> --- a/target/i386/hvf/hvf.c
> +++ b/target/i386/hvf/hvf.c
> @@ -47,7 +47,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>  #include "qemu/error-report.h"
>  #include "qemu/memalign.h"
>
> diff --git a/target/i386/hvf/x86.c b/target/i386/hvf/x86.c
> index 91a3fe002c73..d086584f26d9 100644
> --- a/target/i386/hvf/x86.c
> +++ b/target/i386/hvf/x86.c
> @@ -19,7 +19,6 @@
>  #include "qemu/osdep.h"
>
>  #include "cpu.h"
> -#include "qemu-common.h"
>  #include "x86_decode.h"
>  #include "x86_emu.h"
>  #include "vmcs.h"
> diff --git a/target/i386/hvf/x86_cpuid.c b/target/i386/hvf/x86_cpuid.c
> index 32b0d131df86..f24dd50e48ff 100644
> --- a/target/i386/hvf/x86_cpuid.c
> +++ b/target/i386/hvf/x86_cpuid.c
> @@ -21,7 +21,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>  #include "cpu.h"
>  #include "x86.h"
>  #include "vmx.h"
> diff --git a/target/i386/hvf/x86_decode.c b/target/i386/hvf/x86_decode.c
> index 062713b1a450..3728d7705e21 100644
> --- a/target/i386/hvf/x86_decode.c
> +++ b/target/i386/hvf/x86_decode.c
> @@ -18,7 +18,6 @@
>
>  #include "qemu/osdep.h"
>
> -#include "qemu-common.h"
>  #include "panic.h"
>  #include "x86_decode.h"
>  #include "vmx.h"
> diff --git a/target/i386/hvf/x86_descr.c b/target/i386/hvf/x86_descr.c
> index af15c06ac5db..a484942cfcd4 100644
> --- a/target/i386/hvf/x86_descr.c
> +++ b/target/i386/hvf/x86_descr.c
> @@ -18,7 +18,6 @@
>
>  #include "qemu/osdep.h"
>
> -#include "qemu-common.h"
>  #include "vmx.h"
>  #include "x86_descr.h"
>
> diff --git a/target/i386/hvf/x86_emu.c b/target/i386/hvf/x86_emu.c
> index 050428795bbc..f5704f63e8da 100644
> --- a/target/i386/hvf/x86_emu.c
> +++ b/target/i386/hvf/x86_emu.c
> @@ -37,7 +37,6 @@
>
>  #include "qemu/osdep.h"
>  #include "panic.h"
> -#include "qemu-common.h"
>  #include "x86_decode.h"
>  #include "x86.h"
>  #include "x86_emu.h"
> diff --git a/target/i386/hvf/x86_flags.c b/target/i386/hvf/x86_flags.c
> index fecbca751770..03d6de5efc3e 100644
> --- a/target/i386/hvf/x86_flags.c
> +++ b/target/i386/hvf/x86_flags.c
> @@ -23,7 +23,6 @@
>
>  #include "qemu/osdep.h"
>
> -#include "qemu-common.h"
>  #include "panic.h"
>  #include "cpu.h"
>  #include "x86_flags.h"
> diff --git a/target/i386/hvf/x86_mmu.c b/target/i386/hvf/x86_mmu.c
> index df0b91cd4208..96d117567ee8 100644
> --- a/target/i386/hvf/x86_mmu.c
> +++ b/target/i386/hvf/x86_mmu.c
> @@ -18,7 +18,6 @@
>
>  #include "qemu/osdep.h"
>  #include "panic.h"
> -#include "qemu-common.h"
>  #include "cpu.h"
>  #include "x86.h"
>  #include "x86_mmu.h"
> diff --git a/target/i386/hvf/x86_task.c b/target/i386/hvf/x86_task.c
> index d24daf6a4110..beaeec068731 100644
> --- a/target/i386/hvf/x86_task.c
> +++ b/target/i386/hvf/x86_task.c
> @@ -8,7 +8,6 @@
>  // GNU General Public License for more details.
>  #include "qemu/osdep.h"
>  #include "panic.h"
> -#include "qemu-common.h"
>  #include "qemu/error-report.h"
>
>  #include "sysemu/hvf.h"
> diff --git a/target/i386/hvf/x86hvf.c b/target/i386/hvf/x86hvf.c
> index bec9fc581463..69d4fb8cf555 100644
> --- a/target/i386/hvf/x86hvf.c
> +++ b/target/i386/hvf/x86hvf.c
> @@ -19,7 +19,6 @@
>
>  #include "qemu/osdep.h"
>
> -#include "qemu-common.h"
>  #include "x86hvf.h"
>  #include "vmx.h"
>  #include "vmcs.h"
> diff --git a/target/i386/kvm/sev-stub.c b/target/i386/kvm/sev-stub.c
> index 6080c007a2e4..1be5341e8a6a 100644
> --- a/target/i386/kvm/sev-stub.c
> +++ b/target/i386/kvm/sev-stub.c
> @@ -12,7 +12,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>  #include "sev.h"
>
>  int sev_kvm_init(ConfidentialGuestSupport *cgs, Error **errp)
> diff --git a/target/i386/nvmm/nvmm-all.c b/target/i386/nvmm/nvmm-all.c
> index 9f940413318c..b75738ee9cdf 100644
> --- a/target/i386/nvmm/nvmm-all.c
> +++ b/target/i386/nvmm/nvmm-all.c
> @@ -11,7 +11,6 @@
>  #include "cpu.h"
>  #include "exec/address-spaces.h"
>  #include "exec/ioport.h"
> -#include "qemu-common.h"
>  #include "qemu/accel.h"
>  #include "sysemu/nvmm.h"
>  #include "sysemu/cpus.h"
> diff --git a/target/i386/whpx/whpx-all.c b/target/i386/whpx/whpx-all.c
> index 68a4ebe909ad..5560a22ea5c2 100644
> --- a/target/i386/whpx/whpx-all.c
> +++ b/target/i386/whpx/whpx-all.c
> @@ -12,7 +12,6 @@
>  #include "cpu.h"
>  #include "exec/address-spaces.h"
>  #include "exec/ioport.h"
> -#include "qemu-common.h"
>  #include "qemu/accel.h"
>  #include "sysemu/whpx.h"
>  #include "sysemu/cpus.h"
> diff --git a/target/i386/whpx/whpx-apic.c b/target/i386/whpx/whpx-apic.c
> index bba36f3ec98f..c15df35ad60a 100644
> --- a/target/i386/whpx/whpx-apic.c
> +++ b/target/i386/whpx/whpx-apic.c
> @@ -11,7 +11,6 @@
>   * See the COPYING file in the top-level directory.
>   */
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>  #include "cpu.h"
>  #include "hw/i386/apic_internal.h"
>  #include "hw/i386/apic-msidef.h"
> diff --git a/target/mips/kvm.c b/target/mips/kvm.c
> index 086debd9f013..caf70decd2a5 100644
> --- a/target/mips/kvm.c
> +++ b/target/mips/kvm.c
> @@ -14,7 +14,6 @@
>
>  #include <linux/kvm.h>
>
> -#include "qemu-common.h"
>  #include "cpu.h"
>  #include "internal.h"
>  #include "qemu/error-report.h"
> diff --git a/target/nios2/nios2-semi.c b/target/nios2/nios2-semi.c
> index 5a7ad0c7108d..eda21c04434b 100644
> --- a/target/nios2/nios2-semi.c
> +++ b/target/nios2/nios2-semi.c
> @@ -28,7 +28,6 @@
>  #if defined(CONFIG_USER_ONLY)
>  #include "qemu.h"
>  #else
> -#include "qemu-common.h"
>  #include "exec/softmmu-semi.h"
>  #endif
>  #include "qemu/log.h"
> diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
> index 8644b85de847..f905a2af17a7 100644
> --- a/target/ppc/kvm.c
> +++ b/target/ppc/kvm.c
> @@ -21,7 +21,6 @@
>
>  #include <linux/kvm.h>
>
> -#include "qemu-common.h"
>  #include "qapi/error.h"
>  #include "qemu/error-report.h"
>  #include "cpu.h"
> diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
> index e6b7cb6d4d5f..70b4cff06fbb 100644
> --- a/target/riscv/kvm.c
> +++ b/target/riscv/kvm.c
> @@ -21,7 +21,6 @@
>
>  #include <linux/kvm.h>
>
> -#include "qemu-common.h"
>  #include "qemu/timer.h"
>  #include "qemu/error-report.h"
>  #include "qemu/main-loop.h"
> diff --git a/target/rx/cpu.c b/target/rx/cpu.c
> index 25a4aa2976d3..fb30080ac4ea 100644
> --- a/target/rx/cpu.c
> +++ b/target/rx/cpu.c
> @@ -20,7 +20,6 @@
>  #include "qemu/qemu-print.h"
>  #include "qapi/error.h"
>  #include "cpu.h"
> -#include "qemu-common.h"
>  #include "migration/vmstate.h"
>  #include "exec/exec-all.h"
>  #include "hw/loader.h"
> diff --git a/target/rx/gdbstub.c b/target/rx/gdbstub.c
> index c811d4810b45..7eb2059a841b 100644
> --- a/target/rx/gdbstub.c
> +++ b/target/rx/gdbstub.c
> @@ -16,7 +16,6 @@
>   * this program.  If not, see <http://www.gnu.org/licenses/>.
>   */
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>  #include "cpu.h"
>  #include "exec/gdbstub.h"
>
> diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
> index 6acf14d5ecb4..53098bf54104 100644
> --- a/target/s390x/kvm/kvm.c
> +++ b/target/s390x/kvm/kvm.c
> @@ -24,7 +24,6 @@
>  #include <linux/kvm.h>
>  #include <asm/ptrace.h>
>
> -#include "qemu-common.h"
>  #include "cpu.h"
>  #include "s390x-internal.h"
>  #include "kvm_s390x.h"
> diff --git a/target/s390x/tcg/vec_fpu_helper.c
> b/target/s390x/tcg/vec_fpu_helper.c
> index 1a779934715f..aa2cc8e4a6b5 100644
> --- a/target/s390x/tcg/vec_fpu_helper.c
> +++ b/target/s390x/tcg/vec_fpu_helper.c
> @@ -10,7 +10,6 @@
>   * See the COPYING file in the top-level directory.
>   */
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>  #include "cpu.h"
>  #include "s390x-internal.h"
>  #include "vec.h"
> diff --git a/target/s390x/tcg/vec_int_helper.c
> b/target/s390x/tcg/vec_int_helper.c
> index 5561b3ed9096..b44859ee1630 100644
> --- a/target/s390x/tcg/vec_int_helper.c
> +++ b/target/s390x/tcg/vec_int_helper.c
> @@ -10,7 +10,6 @@
>   * See the COPYING file in the top-level directory.
>   */
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>  #include "cpu.h"
>  #include "vec.h"
>  #include "exec/helper-proto.h"
> diff --git a/target/s390x/tcg/vec_string_helper.c
> b/target/s390x/tcg/vec_string_helper.c
> index ac315eb095c1..f8b54bba4a9d 100644
> --- a/target/s390x/tcg/vec_string_helper.c
> +++ b/target/s390x/tcg/vec_string_helper.c
> @@ -10,7 +10,6 @@
>   * See the COPYING file in the top-level directory.
>   */
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>  #include "cpu.h"
>  #include "s390x-internal.h"
>  #include "vec.h"
> diff --git a/target/tricore/gdbstub.c b/target/tricore/gdbstub.c
> index 3ce55abb8e3b..ebf32defde3a 100644
> --- a/target/tricore/gdbstub.c
> +++ b/target/tricore/gdbstub.c
> @@ -18,7 +18,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>  #include "exec/gdbstub.h"
>
>
> diff --git a/target/xtensa/core-de233_fpu.c
> b/target/xtensa/core-de233_fpu.c
> index c7cbeb1b4834..41af8057fbb9 100644
> --- a/target/xtensa/core-de233_fpu.c
> +++ b/target/xtensa/core-de233_fpu.c
> @@ -28,7 +28,6 @@
>  #include "qemu/osdep.h"
>  #include "cpu.h"
>  #include "exec/gdbstub.h"
> -#include "qemu-common.h"
>  #include "qemu/host-utils.h"
>
>  #include "core-de233_fpu/core-isa.h"
> diff --git a/target/xtensa/core-dsp3400.c b/target/xtensa/core-dsp3400.c
> index 4e0bc8a8c46c..81e425c56828 100644
> --- a/target/xtensa/core-dsp3400.c
> +++ b/target/xtensa/core-dsp3400.c
> @@ -28,7 +28,6 @@
>  #include "qemu/osdep.h"
>  #include "cpu.h"
>  #include "exec/gdbstub.h"
> -#include "qemu-common.h"
>  #include "qemu/host-utils.h"
>
>  #include "core-dsp3400/core-isa.h"
> diff --git a/target/xtensa/core-test_mmuhifi_c3.c
> b/target/xtensa/core-test_mmuhifi_c3.c
> index 123c630b0da7..c0e5d32d1e47 100644
> --- a/target/xtensa/core-test_mmuhifi_c3.c
> +++ b/target/xtensa/core-test_mmuhifi_c3.c
> @@ -28,7 +28,6 @@
>  #include "qemu/osdep.h"
>  #include "cpu.h"
>  #include "exec/gdbstub.h"
> -#include "qemu-common.h"
>  #include "qemu/host-utils.h"
>
>  #include "core-test_mmuhifi_c3/core-isa.h"
> diff --git a/tcg/tci.c b/tcg/tci.c
> index fe92b5d0844b..bdfac83492dd 100644
> --- a/tcg/tci.c
> +++ b/tcg/tci.c
> @@ -18,7 +18,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>  #include "tcg/tcg.h"           /* MAX_OPC_PARAM_IARGS */
>  #include "exec/cpu_ldst.h"
>  #include "tcg/tcg-op.h"
> diff --git a/tests/qtest/acpi-utils.c b/tests/qtest/acpi-utils.c
> index 766c48e3a6a4..673fc975862c 100644
> --- a/tests/qtest/acpi-utils.c
> +++ b/tests/qtest/acpi-utils.c
> @@ -14,7 +14,6 @@
>
>  #include "qemu/osdep.h"
>  #include <glib/gstdio.h>
> -#include "qemu-common.h"
>  #include "qemu/bitmap.h"
>  #include "acpi-utils.h"
>  #include "boot-sector.h"
> diff --git a/tests/qtest/ahci-test.c b/tests/qtest/ahci-test.c
> index 8073ccc20521..aff5f3f79776 100644
> --- a/tests/qtest/ahci-test.c
> +++ b/tests/qtest/ahci-test.c
> @@ -30,7 +30,6 @@
>  #include "libqos/ahci.h"
>  #include "libqos/pci-pc.h"
>
> -#include "qemu-common.h"
>  #include "qapi/qmp/qdict.h"
>  #include "qemu/host-utils.h"
>
> diff --git a/tests/qtest/aspeed_hace-test.c
> b/tests/qtest/aspeed_hace-test.c
> index 09ee31545e41..58aa22014d04 100644
> --- a/tests/qtest/aspeed_hace-test.c
> +++ b/tests/qtest/aspeed_hace-test.c
> @@ -8,7 +8,6 @@
>  #include "qemu/osdep.h"
>
>  #include "libqos/libqtest.h"
> -#include "qemu-common.h"
>  #include "qemu/bitops.h"
>
>  #define HACE_CMD                 0x10
> diff --git a/tests/qtest/bios-tables-test.c
> b/tests/qtest/bios-tables-test.c
> index c4a2d1e1664b..5dddedabcdde 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -57,7 +57,6 @@
>
>  #include "qemu/osdep.h"
>  #include <glib/gstdio.h>
> -#include "qemu-common.h"
>  #include "hw/firmware/smbios.h"
>  #include "qemu/bitmap.h"
>  #include "acpi-utils.h"
> diff --git a/tests/qtest/boot-sector.c b/tests/qtest/boot-sector.c
> index ea8f264661c3..9d9825bc8145 100644
> --- a/tests/qtest/boot-sector.c
> +++ b/tests/qtest/boot-sector.c
> @@ -12,7 +12,6 @@
>   */
>  #include "qemu/osdep.h"
>  #include "boot-sector.h"
> -#include "qemu-common.h"
>  #include "libqos/libqtest.h"
>
>  #define LOW(x) ((x) & 0xff)
> diff --git a/tests/qtest/cpu-plug-test.c b/tests/qtest/cpu-plug-test.c
> index a1c689414be5..7f5dd5f85a78 100644
> --- a/tests/qtest/cpu-plug-test.c
> +++ b/tests/qtest/cpu-plug-test.c
> @@ -9,7 +9,6 @@
>
>  #include "qemu/osdep.h"
>
> -#include "qemu-common.h"
>  #include "libqtest-single.h"
>  #include "qapi/qmp/qdict.h"
>  #include "qapi/qmp/qlist.h"
> diff --git a/tests/qtest/dbus-display-test.c
> b/tests/qtest/dbus-display-test.c
> index 43c77aff045c..81043162dfdd 100644
> --- a/tests/qtest/dbus-display-test.c
> +++ b/tests/qtest/dbus-display-test.c
> @@ -3,7 +3,6 @@
>  #include <gio/gio.h>
>  #include <gio/gunixfdlist.h>
>  #include "libqos/libqtest.h"
> -#include "qemu-common.h"
>  #include "dbus-display1.h"
>
>  static GDBusConnection*
> diff --git a/tests/qtest/dbus-vmstate-test.c
> b/tests/qtest/dbus-vmstate-test.c
> index aca9b98b7a35..a8acab763f5d 100644
> --- a/tests/qtest/dbus-vmstate-test.c
> +++ b/tests/qtest/dbus-vmstate-test.c
> @@ -2,7 +2,6 @@
>  #include <glib/gstdio.h>
>  #include <gio/gio.h>
>  #include "libqos/libqtest.h"
> -#include "qemu-common.h"
>  #include "dbus-vmstate1.h"
>  #include "migration-helpers.h"
>
> diff --git a/tests/qtest/device-introspect-test.c
> b/tests/qtest/device-introspect-test.c
> index bbec166dbc2f..adf39b2518e8 100644
> --- a/tests/qtest/device-introspect-test.c
> +++ b/tests/qtest/device-introspect-test.c
> @@ -18,7 +18,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>  #include "qapi/qmp/qstring.h"
>  #include "qapi/qmp/qdict.h"
>  #include "qapi/qmp/qlist.h"
> diff --git a/tests/qtest/e1000e-test.c b/tests/qtest/e1000e-test.c
> index e648fdd409cd..ddd6983ede14 100644
> --- a/tests/qtest/e1000e-test.c
> +++ b/tests/qtest/e1000e-test.c
> @@ -25,9 +25,7 @@
>
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>  #include "libqtest-single.h"
> -#include "qemu-common.h"
>  #include "libqos/pci-pc.h"
>  #include "qemu/sockets.h"
>  #include "qemu/iov.h"
> diff --git a/tests/qtest/erst-test.c b/tests/qtest/erst-test.c
> index f94cd8dd8e05..a0adc35bef7f 100644
> --- a/tests/qtest/erst-test.c
> +++ b/tests/qtest/erst-test.c
> @@ -11,7 +11,6 @@
>  #include <glib/gstdio.h>
>  #include "libqos/libqos-pc.h"
>  #include "libqos/libqtest.h"
> -#include "qemu-common.h"
>
>  #include "hw/pci/pci.h"
>
> diff --git a/tests/qtest/fdc-test.c b/tests/qtest/fdc-test.c
> index b0d40012e6a9..4aa72f36431f 100644
> --- a/tests/qtest/fdc-test.c
> +++ b/tests/qtest/fdc-test.c
> @@ -27,7 +27,6 @@
>
>  #include "libqtest-single.h"
>  #include "qapi/qmp/qdict.h"
> -#include "qemu-common.h"
>
>  /* TODO actually test the results and get rid of this */
>  #define qmp_discard_response(...) qobject_unref(qmp(__VA_ARGS__))
> diff --git a/tests/qtest/fuzz/qos_fuzz.c b/tests/qtest/fuzz/qos_fuzz.c
> index 7a244c951e5e..dc891d838b6a 100644
> --- a/tests/qtest/fuzz/qos_fuzz.c
> +++ b/tests/qtest/fuzz/qos_fuzz.c
> @@ -19,7 +19,6 @@
>  #include "qemu/osdep.h"
>  #include "qemu/units.h"
>  #include "qapi/error.h"
> -#include "qemu-common.h"
>  #include "exec/memory.h"
>  #include "qemu/main-loop.h"
>
> diff --git a/tests/qtest/hd-geo-test.c b/tests/qtest/hd-geo-test.c
> index 64023c057408..da9c4c2792de 100644
> --- a/tests/qtest/hd-geo-test.c
> +++ b/tests/qtest/hd-geo-test.c
> @@ -16,7 +16,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>  #include "qemu/bswap.h"
>  #include "qapi/qmp/qlist.h"
>  #include "libqos/libqtest.h"
> diff --git a/tests/qtest/ide-test.c b/tests/qtest/ide-test.c
> index 19de3b410405..b7243a17b11d 100644
> --- a/tests/qtest/ide-test.c
> +++ b/tests/qtest/ide-test.c
> @@ -30,7 +30,6 @@
>  #include "libqos/pci-pc.h"
>  #include "libqos/malloc-pc.h"
>  #include "qapi/qmp/qdict.h"
> -#include "qemu-common.h"
>  #include "qemu/bswap.h"
>  #include "hw/pci/pci_ids.h"
>  #include "hw/pci/pci_regs.h"
> diff --git a/tests/qtest/ipmi-bt-test.c b/tests/qtest/ipmi-bt-test.c
> index 19612e9405ae..ed431e34e68d 100644
> --- a/tests/qtest/ipmi-bt-test.c
> +++ b/tests/qtest/ipmi-bt-test.c
> @@ -31,7 +31,6 @@
>
>
>  #include "libqtest-single.h"
> -#include "qemu-common.h"
>
>  #define IPMI_IRQ        5
>
> diff --git a/tests/qtest/ivshmem-test.c b/tests/qtest/ivshmem-test.c
> index 4e8af42a9d04..95628a418579 100644
> --- a/tests/qtest/ivshmem-test.c
> +++ b/tests/qtest/ivshmem-test.c
> @@ -14,7 +14,6 @@
>  #include "libqos/libqos-pc.h"
>  #include "libqos/libqos-spapr.h"
>  #include "libqos/libqtest.h"
> -#include "qemu-common.h"
>
>  #define TMPSHMSIZE (1 << 20)
>  static char *tmpshm;
> diff --git a/tests/qtest/libqos/ahci.c b/tests/qtest/libqos/ahci.c
> index eaa2096512e5..41c4be5efa93 100644
> --- a/tests/qtest/libqos/ahci.c
> +++ b/tests/qtest/libqos/ahci.c
> @@ -28,7 +28,6 @@
>  #include "ahci.h"
>  #include "pci-pc.h"
>
> -#include "qemu-common.h"
>  #include "qemu/host-utils.h"
>
>  #include "hw/pci/pci_ids.h"
> diff --git a/tests/qtest/libqos/malloc-pc.c
> b/tests/qtest/libqos/malloc-pc.c
> index f1e3b392a53c..bbd1b4827e54 100644
> --- a/tests/qtest/libqos/malloc-pc.c
> +++ b/tests/qtest/libqos/malloc-pc.c
> @@ -16,8 +16,6 @@
>
>  #include "standard-headers/linux/qemu_fw_cfg.h"
>
> -#include "qemu-common.h"
> -
>  #define ALLOC_PAGE_SIZE (4096)
>
>  void pc_alloc_init(QGuestAllocator *s, QTestState *qts, QAllocOpts flags=
)
> diff --git a/tests/qtest/libqos/malloc-spapr.c
> b/tests/qtest/libqos/malloc-spapr.c
> index 05b306c191d3..d90ed3c51d7d 100644
> --- a/tests/qtest/libqos/malloc-spapr.c
> +++ b/tests/qtest/libqos/malloc-spapr.c
> @@ -8,8 +8,6 @@
>  #include "qemu/osdep.h"
>  #include "malloc-spapr.h"
>
> -#include "qemu-common.h"
> -
>  #define SPAPR_PAGE_SIZE 4096
>
>  /* Memory must be a multiple of 256 MB,
> diff --git a/tests/qtest/libqos/malloc.c b/tests/qtest/libqos/malloc.c
> index f708b0143262..f0c8f950c805 100644
> --- a/tests/qtest/libqos/malloc.c
> +++ b/tests/qtest/libqos/malloc.c
> @@ -12,7 +12,6 @@
>
>  #include "qemu/osdep.h"
>  #include "malloc.h"
> -#include "qemu-common.h"
>  #include "qemu/host-utils.h"
>
>  typedef struct MemBlock {
> diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
> index dc5566ccfd60..7b5890dcc487 100644
> --- a/tests/qtest/libqtest.c
> +++ b/tests/qtest/libqtest.c
> @@ -21,7 +21,6 @@
>  #include <sys/un.h>
>
>  #include "libqos/libqtest.h"
> -#include "qemu-common.h"
>  #include "qemu/ctype.h"
>  #include "qemu/cutils.h"
>  #include "qapi/error.h"
> diff --git a/tests/qtest/machine-none-test.c
> b/tests/qtest/machine-none-test.c
> index 138101b46ac2..8ca18074b9f9 100644
> --- a/tests/qtest/machine-none-test.c
> +++ b/tests/qtest/machine-none-test.c
> @@ -12,7 +12,6 @@
>
>  #include "qemu/osdep.h"
>
> -#include "qemu-common.h"
>  #include "qemu/cutils.h"
>  #include "libqos/libqtest.h"
>  #include "qapi/qmp/qdict.h"
> diff --git a/tests/qtest/npcm7xx_emc-test.c
> b/tests/qtest/npcm7xx_emc-test.c
> index 7c435ac91576..a353fef0ca13 100644
> --- a/tests/qtest/npcm7xx_emc-test.c
> +++ b/tests/qtest/npcm7xx_emc-test.c
> @@ -15,7 +15,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>  #include "libqos/libqos.h"
>  #include "qapi/qmp/qdict.h"
>  #include "qapi/qmp/qnum.h"
> diff --git a/tests/qtest/pxe-test.c b/tests/qtest/pxe-test.c
> index 32bbae33c597..3cb47d2c5496 100644
> --- a/tests/qtest/pxe-test.c
> +++ b/tests/qtest/pxe-test.c
> @@ -14,7 +14,6 @@
>
>  #include "qemu/osdep.h"
>  #include <glib/gstdio.h>
> -#include "qemu-common.h"
>  #include "libqos/libqtest.h"
>  #include "boot-sector.h"
>  #include "libqos/libqos-spapr.h"
> diff --git a/tests/qtest/qom-test.c b/tests/qtest/qom-test.c
> index eb34af843b79..6b162e12b5aa 100644
> --- a/tests/qtest/qom-test.c
> +++ b/tests/qtest/qom-test.c
> @@ -9,7 +9,6 @@
>
>  #include "qemu/osdep.h"
>
> -#include "qemu-common.h"
>  #include "qapi/qmp/qdict.h"
>  #include "qapi/qmp/qlist.h"
>  #include "qemu/cutils.h"
> diff --git a/tests/qtest/rtl8139-test.c b/tests/qtest/rtl8139-test.c
> index 450604926492..8fa3313cc333 100644
> --- a/tests/qtest/rtl8139-test.c
> +++ b/tests/qtest/rtl8139-test.c
> @@ -11,7 +11,6 @@
>  #include "libqtest-single.h"
>  #include "libqos/pci-pc.h"
>  #include "qemu/timer.h"
> -#include "qemu-common.h"
>
>  /* Tests only initialization so far. TODO: Replace with functional tests
> */
>  static void nop(void)
> diff --git a/tests/qtest/test-filter-mirror.c
> b/tests/qtest/test-filter-mirror.c
> index da4f94de727a..fdf66cebd62f 100644
> --- a/tests/qtest/test-filter-mirror.c
> +++ b/tests/qtest/test-filter-mirror.c
> @@ -9,7 +9,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>  #include "libqos/libqtest.h"
>  #include "qapi/qmp/qdict.h"
>  #include "qemu/iov.h"
> diff --git a/tests/qtest/test-filter-redirector.c
> b/tests/qtest/test-filter-redirector.c
> index fc16cf7e8d5f..339d3c04cedc 100644
> --- a/tests/qtest/test-filter-redirector.c
> +++ b/tests/qtest/test-filter-redirector.c
> @@ -51,7 +51,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>  #include "libqos/libqtest.h"
>  #include "qapi/qmp/qdict.h"
>  #include "qemu/iov.h"
> diff --git a/tests/qtest/test-x86-cpuid-compat.c
> b/tests/qtest/test-x86-cpuid-compat.c
> index 39138db7744b..b39c9055b309 100644
> --- a/tests/qtest/test-x86-cpuid-compat.c
> +++ b/tests/qtest/test-x86-cpuid-compat.c
> @@ -1,5 +1,4 @@
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>  #include "qapi/qmp/qdict.h"
>  #include "qapi/qmp/qlist.h"
>  #include "qapi/qmp/qnum.h"
> diff --git a/tests/qtest/virtio-net-test.c b/tests/qtest/virtio-net-test.=
c
> index a71395849f33..fc9f2b94982d 100644
> --- a/tests/qtest/virtio-net-test.c
> +++ b/tests/qtest/virtio-net-test.c
> @@ -8,7 +8,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>  #include "libqtest-single.h"
>  #include "qemu/iov.h"
>  #include "qemu/module.h"
> diff --git a/tests/unit/check-qjson.c b/tests/unit/check-qjson.c
> index c845f91d4377..c4e0f851bfc6 100644
> --- a/tests/unit/check-qjson.c
> +++ b/tests/unit/check-qjson.c
> @@ -21,7 +21,6 @@
>  #include "qapi/qmp/qnum.h"
>  #include "qapi/qmp/qstring.h"
>  #include "qemu/unicode.h"
> -#include "qemu-common.h"
>
>  static QString *from_json_str(const char *jstr, bool single, Error **err=
p)
>  {
> diff --git a/tests/unit/check-qnull.c b/tests/unit/check-qnull.c
> index ebf21db83ccc..5ceacc65d7f3 100644
> --- a/tests/unit/check-qnull.c
> +++ b/tests/unit/check-qnull.c
> @@ -9,7 +9,6 @@
>  #include "qemu/osdep.h"
>
>  #include "qapi/qmp/qnull.h"
> -#include "qemu-common.h"
>  #include "qapi/qobject-input-visitor.h"
>  #include "qapi/qobject-output-visitor.h"
>  #include "qapi/error.h"
> diff --git a/tests/unit/check-qnum.c b/tests/unit/check-qnum.c
> index b85fca23029e..bf7fe45bacc4 100644
> --- a/tests/unit/check-qnum.c
> +++ b/tests/unit/check-qnum.c
> @@ -15,7 +15,6 @@
>  #include "qemu/osdep.h"
>
>  #include "qapi/qmp/qnum.h"
> -#include "qemu-common.h"
>
>  /*
>   * Public Interface test-cases
> diff --git a/tests/unit/check-qobject.c b/tests/unit/check-qobject.c
> index 7903ebf4cf80..0ed094e55f3a 100644
> --- a/tests/unit/check-qobject.c
> +++ b/tests/unit/check-qobject.c
> @@ -15,7 +15,6 @@
>  #include "qapi/qmp/qnull.h"
>  #include "qapi/qmp/qnum.h"
>  #include "qapi/qmp/qstring.h"
> -#include "qemu-common.h"
>
>  #include <math.h>
>
> diff --git a/tests/unit/check-qstring.c b/tests/unit/check-qstring.c
> index 4bf977209342..bd861f4f8b47 100644
> --- a/tests/unit/check-qstring.c
> +++ b/tests/unit/check-qstring.c
> @@ -12,7 +12,6 @@
>  #include "qemu/osdep.h"
>
>  #include "qapi/qmp/qstring.h"
> -#include "qemu-common.h"
>
>  /*
>   * Public Interface test-cases
> diff --git a/tests/unit/socket-helpers.c b/tests/unit/socket-helpers.c
> index ef31664d0224..0a9e090a68dd 100644
> --- a/tests/unit/socket-helpers.c
> +++ b/tests/unit/socket-helpers.c
> @@ -19,7 +19,6 @@
>   */
>
>  #include "qemu/osde

--0000000000003679bd05dbe989a6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Mar 23, 2022 at 9:32 PM &lt;<a href=3D"mailto:marca=
ndre.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:=
rgb(204,204,204)">From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcan=
dre.lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt=
;<br>
<br>
Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lurea=
u@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;</blockq=
uote><div dir=3D"auto"><br></div><div dir=3D"auto">Empty patch descriptions=
 are not a good idea. Please explain why this removal does not break things=
 and maybe why the header got included initiatively.</div><div dir=3D"auto"=
><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;border-l=
eft-color:rgb(204,204,204)" dir=3D"auto"><br>
---<br>
=C2=A0include/qemu-common.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 | 9 ---------<br>
=C2=A0accel/hvf/hvf-all.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0accel/tcg/cpu-exec.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0accel/tcg/tcg-accel-ops-icount.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1=
 -<br>
=C2=A0accel/tcg/tcg-accel-ops-mttcg.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1=
 -<br>
=C2=A0accel/tcg/tcg-accel-ops-rr.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 1 -<br>
=C2=A0accel/tcg/tcg-accel-ops.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 1 -<br>
=C2=A0accel/tcg/tcg-all.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0accel/tcg/translate-all.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 1 -<br>
=C2=A0audio/audio_win_int.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0backends/hostmem-epc.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0backends/tpm/tpm_passthrough.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 1 -<br>
=C2=A0block/file-posix.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0block/io_uring.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0bsd-user/freebsd/os-syscall.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 1 -<br>
=C2=A0bsd-user/mmap.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0chardev/char-fd.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0chardev/char-pipe.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0chardev/char-pty.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0crypto/cipher-afalg.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0crypto/hash-afalg.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0dump/dump.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0dump/win_dump.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0fsdev/virtfs-proxy-helper.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 1 -<br>
=C2=A0gdbstub.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0hw/9pfs/9p-proxy.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0hw/alpha/dp264.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0hw/avr/boot.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0hw/core/loader.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0hw/display/artist.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0hw/display/cg3.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0hw/display/tcx.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0hw/display/virtio-gpu-udmabuf.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1=
 -<br>
=C2=A0hw/dma/pl330.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0hw/hppa/machine.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0hw/i386/pc_sysfw.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0hw/i386/x86.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0hw/input/vhost-user-input.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 1 -<br>
=C2=A0hw/intc/xics_kvm.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0hw/m68k/mcf5208.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0hw/m68k/q800.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0hw/m68k/virt.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0hw/microblaze/boot.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0hw/mips/fuloong2e.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0hw/mips/jazz.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0hw/mips/loongson3_virt.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0hw/mips/malta.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0hw/mips/mipssim.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0hw/misc/sbsa_ec.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0hw/net/fsl_etsec/etsec.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0hw/net/fsl_etsec/rings.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0hw/net/msf2-emac.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0hw/net/npcm7xx_emc.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0hw/nios2/boot.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0hw/nios2/generic_nommu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0hw/nvram/fw_cfg.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0hw/pci-host/mv64361.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0hw/pci-host/pnv_phb3.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0hw/pci-host/pnv_phb3_msi.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 1 -<br>
=C2=A0hw/pci-host/pnv_phb3_pbcq.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 1 -<br>
=C2=A0hw/pci-host/pnv_phb4.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0hw/pci-host/pnv_phb4_pec.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 1 -<br>
=C2=A0hw/pci-host/raven.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0hw/pci-host/remote.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0hw/pci/pci.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0hw/ppc/e500.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0hw/ppc/mac_newworld.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0hw/ppc/mac_oldworld.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0hw/ppc/pegasos2.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0hw/ppc/pnv.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0hw/ppc/pnv_bmc.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0hw/ppc/ppc405_boards.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0hw/ppc/ppc440_bamboo.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0hw/ppc/sam460ex.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0hw/ppc/spapr.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0hw/ppc/spapr_numa.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0hw/ppc/spapr_pci_nvlink2.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 1 -<br>
=C2=A0hw/ppc/spapr_tpm_proxy.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0hw/ppc/spapr_vof.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0hw/ppc/virtex_ml507.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0hw/ppc/vof.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0hw/remote/iohub.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0hw/remote/machine.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0hw/remote/memory.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0hw/remote/message.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0hw/remote/mpqemu-link.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0hw/remote/proxy-memory-listener.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 -<br=
>
=C2=A0hw/remote/proxy.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0hw/remote/remote-obj.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0hw/riscv/boot.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0hw/rx/rx-gdbsim.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0hw/s390x/ipl.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0hw/sd/sd.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0hw/sparc/leon3.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0hw/sparc/sun4m.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0hw/sparc64/sun4u.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0hw/usb/dev-mtp.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0hw/virtio/virtio-iommu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0hw/virtio/virtio-mem.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0hw/virtio/virtio-pmem.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0io/channel-socket.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0linux-user/aarch64/cpu_loop.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 1 -<br>
=C2=A0linux-user/alpha/cpu_loop.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 1 -<br>
=C2=A0linux-user/arm/cpu_loop.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 1 -<br>
=C2=A0linux-user/cris/cpu_loop.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 1 -<br>
=C2=A0linux-user/hexagon/cpu_loop.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 1 -<br>
=C2=A0linux-user/i386/cpu_loop.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 1 -<br>
=C2=A0linux-user/m68k/cpu_loop.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 1 -<br>
=C2=A0linux-user/microblaze/cpu_loop.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1=
 -<br>
=C2=A0linux-user/mips/cpu_loop.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 1 -<br>
=C2=A0linux-user/openrisc/cpu_loop.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 1 -<br>
=C2=A0linux-user/ppc/cpu_loop.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 1 -<br>
=C2=A0linux-user/riscv/cpu_loop.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 1 -<br>
=C2=A0linux-user/s390x/cpu_loop.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 1 -<br>
=C2=A0linux-user/sh4/cpu_loop.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 1 -<br>
=C2=A0linux-user/sparc/cpu_loop.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 1 -<br>
=C2=A0linux-user/uname.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0monitor/qmp-cmds.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0net/colo-compare.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0net/net.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0net/socket.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0net/tap-bsd.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0net/tap-linux.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0net/tap-solaris.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0net/tap-win32.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0net/tap.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0net/vde.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0os-posix.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0os-win32.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0page-vary-common.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0qga/commands-posix.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0softmmu/cpu-throttle.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0softmmu/cpu-timers.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0softmmu/cpus.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0softmmu/datadir.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0softmmu/icount.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0softmmu/runstate.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0stubs/monitor-core.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0target/arm/hvf/hvf.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0target/arm/kvm.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0target/arm/kvm64.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0target/hexagon/gdbstub.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0target/i386/hax/hax-all.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 1 -<br>
=C2=A0target/i386/hvf/hvf.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0target/i386/hvf/x86.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0target/i386/hvf/x86_cpuid.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 1 -<br>
=C2=A0target/i386/hvf/x86_decode.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 1 -<br>
=C2=A0target/i386/hvf/x86_descr.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 1 -<br>
=C2=A0target/i386/hvf/x86_emu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 1 -<br>
=C2=A0target/i386/hvf/x86_flags.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 1 -<br>
=C2=A0target/i386/hvf/x86_mmu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 1 -<br>
=C2=A0target/i386/hvf/x86_task.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 1 -<br>
=C2=A0target/i386/hvf/x86hvf.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0target/i386/kvm/sev-stub.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 1 -<br>
=C2=A0target/i386/nvmm/nvmm-all.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 1 -<br>
=C2=A0target/i386/whpx/whpx-all.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 1 -<br>
=C2=A0target/i386/whpx/whpx-apic.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 1 -<br>
=C2=A0target/mips/kvm.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0target/nios2/nios2-semi.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 1 -<br>
=C2=A0target/ppc/kvm.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0target/riscv/kvm.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0target/rx/cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0target/rx/gdbstub.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0target/s390x/kvm/kvm.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0target/s390x/tcg/vec_fpu_helper.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 -<br=
>
=C2=A0target/s390x/tcg/vec_int_helper.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 -<br=
>
=C2=A0target/s390x/tcg/vec_string_helper.c=C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0target/tricore/gdbstub.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0target/xtensa/core-de233_fpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 1 -<br>
=C2=A0target/xtensa/core-dsp3400.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 1 -<br>
=C2=A0target/xtensa/core-test_mmuhifi_c3.c=C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0tcg/tci.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0tests/qtest/acpi-utils.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0tests/qtest/ahci-test.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0tests/qtest/aspeed_hace-test.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 1 -<br>
=C2=A0tests/qtest/bios-tables-test.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 1 -<br>
=C2=A0tests/qtest/boot-sector.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 1 -<br>
=C2=A0tests/qtest/cpu-plug-test.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 1 -<br>
=C2=A0tests/qtest/dbus-display-test.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1=
 -<br>
=C2=A0tests/qtest/dbus-vmstate-test.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1=
 -<br>
=C2=A0tests/qtest/device-introspect-test.c=C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0tests/qtest/e1000e-test.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 2 --<br>
=C2=A0tests/qtest/erst-test.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0tests/qtest/fdc-test.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0tests/qtest/fuzz/qos_fuzz.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 1 -<br>
=C2=A0tests/qtest/hd-geo-test.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 1 -<br>
=C2=A0tests/qtest/ide-test.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0tests/qtest/ipmi-bt-test.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 1 -<br>
=C2=A0tests/qtest/ivshmem-test.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 1 -<br>
=C2=A0tests/qtest/libqos/ahci.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 1 -<br>
=C2=A0tests/qtest/libqos/malloc-pc.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 2 --<br>
=C2=A0tests/qtest/libqos/malloc-spapr.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 --<b=
r>
=C2=A0tests/qtest/libqos/malloc.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 1 -<br>
=C2=A0tests/qtest/libqtest.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0tests/qtest/machine-none-test.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1=
 -<br>
=C2=A0tests/qtest/npcm7xx_emc-test.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 1 -<br>
=C2=A0tests/qtest/pxe-test.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0tests/qtest/qom-test.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0tests/qtest/rtl8139-test.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 1 -<br>
=C2=A0tests/qtest/test-filter-mirror.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1=
 -<br>
=C2=A0tests/qtest/test-filter-redirector.c=C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0tests/qtest/test-x86-cpuid-compat.c=C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0tests/qtest/virtio-net-test.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 1 -<br>
=C2=A0tests/unit/check-qjson.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0tests/unit/check-qnull.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0tests/unit/check-qnum.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0tests/unit/check-qobject.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 1 -<br>
=C2=A0tests/unit/check-qstring.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 1 -<br>
=C2=A0tests/unit/socket-helpers.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 1 -<br>
=C2=A0tests/unit/test-clone-visitor.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1=
 -<br>
=C2=A0tests/unit/test-forward-visitor.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 -<br=
>
=C2=A0tests/unit/test-iov.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0tests/unit/test-logging.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 1 -<br>
=C2=A0tests/unit/test-qmp-event.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 1 -<br>
=C2=A0tests/unit/test-qobject-input-visitor.c=C2=A0 | 1 -<br>
=C2=A0tests/unit/test-qobject-output-visitor.c | 1 -<br>
=C2=A0tests/unit/test-string-input-visitor.c=C2=A0 =C2=A0| 1 -<br>
=C2=A0tests/unit/test-string-output-visitor.c=C2=A0 | 1 -<br>
=C2=A0tests/unit/test-thread-pool.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 1 -<br>
=C2=A0tests/unit/test-util-sockets.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 1 -<br>
=C2=A0tests/unit/test-visitor-serialization.c=C2=A0 | 1 -<br>
=C2=A0tests/unit/test-xbzrle.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0ui/gtk-clipboard.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0ui/keymaps.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0ui/vdagent.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0ui/vnc-clipboard.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0ui/vnc-enc-tight.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0ui/vnc.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0util/aio-win32.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0util/coroutine-sigaltstack.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 1 -<br>
=C2=A0util/coroutine-win32.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0util/cutils.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0util/event_notifier-posix.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 1 -<br>
=C2=A0util/event_notifier-win32.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 1 -<br>
=C2=A0util/iov.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0util/osdep.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0util/oslib-posix.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0util/oslib-win32.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0util/qemu-coroutine-io.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0util/qemu-sockets.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0util/qemu-thread-win32.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0target/xtensa/import_core.sh=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 1 -<br>
=C2=A0243 files changed, 1 insertion(+), 254 deletions(-)<br>
<br>
diff --git a/include/qemu-common.h b/include/qemu-common.h<br>
index 0498acd16b78..ba32cc8b1f39 100644<br>
--- a/include/qemu-common.h<br>
+++ b/include/qemu-common.h<br>
@@ -1,12 +1,3 @@<br>
-/*<br>
- * This file is supposed to be included only by .c files. No header file s=
hould<br>
- * depend on qemu-common.h, as this would easily lead to circular header<b=
r>
- * dependencies.<br>
- *<br>
- * If a header file uses a definition from qemu-common.h, that definition<=
br>
- * must be moved to a separate header file, and the header that uses it<br=
>
- * must include that header.<br>
- */<br>
=C2=A0#ifndef QEMU_COMMON_H<br>
=C2=A0#define QEMU_COMMON_H<br>
<br>
diff --git a/accel/hvf/hvf-all.c b/accel/hvf/hvf-all.c<br>
index f185b0830a75..0043f4d308ba 100644<br>
--- a/accel/hvf/hvf-all.c<br>
+++ b/accel/hvf/hvf-all.c<br>
@@ -9,7 +9,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qemu/error-report.h&quot;<br>
=C2=A0#include &quot;sysemu/hvf.h&quot;<br>
=C2=A0#include &quot;sysemu/hvf_int.h&quot;<br>
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c<br>
index c997c2e8e015..083ada76b124 100644<br>
--- a/accel/tcg/cpu-exec.c<br>
+++ b/accel/tcg/cpu-exec.c<br>
@@ -18,7 +18,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qemu/qemu-print.h&quot;<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
=C2=A0#include &quot;qapi/qapi-commands-machine.h&quot;<br>
diff --git a/accel/tcg/tcg-accel-ops-icount.c b/accel/tcg/tcg-accel-ops-ico=
unt.c<br>
index bdaf2c943b49..6436cd9349a3 100644<br>
--- a/accel/tcg/tcg-accel-ops-icount.c<br>
+++ b/accel/tcg/tcg-accel-ops-icount.c<br>
@@ -24,7 +24,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;sysemu/tcg.h&quot;<br>
=C2=A0#include &quot;sysemu/replay.h&quot;<br>
=C2=A0#include &quot;sysemu/cpu-timers.h&quot;<br>
diff --git a/accel/tcg/tcg-accel-ops-mttcg.c b/accel/tcg/tcg-accel-ops-mttc=
g.c<br>
index ea2b741deb51..d50239e0e28f 100644<br>
--- a/accel/tcg/tcg-accel-ops-mttcg.c<br>
+++ b/accel/tcg/tcg-accel-ops-mttcg.c<br>
@@ -24,7 +24,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;sysemu/tcg.h&quot;<br>
=C2=A0#include &quot;sysemu/replay.h&quot;<br>
=C2=A0#include &quot;sysemu/cpu-timers.h&quot;<br>
diff --git a/accel/tcg/tcg-accel-ops-rr.c b/accel/tcg/tcg-accel-ops-rr.c<br=
>
index b287110766ef..1a72149f0e46 100644<br>
--- a/accel/tcg/tcg-accel-ops-rr.c<br>
+++ b/accel/tcg/tcg-accel-ops-rr.c<br>
@@ -24,7 +24,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;sysemu/tcg.h&quot;<br>
=C2=A0#include &quot;sysemu/replay.h&quot;<br>
=C2=A0#include &quot;sysemu/cpu-timers.h&quot;<br>
diff --git a/accel/tcg/tcg-accel-ops.c b/accel/tcg/tcg-accel-ops.c<br>
index ea7dcad674cf..684dc5a1371f 100644<br>
--- a/accel/tcg/tcg-accel-ops.c<br>
+++ b/accel/tcg/tcg-accel-ops.c<br>
@@ -26,7 +26,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;sysemu/tcg.h&quot;<br>
=C2=A0#include &quot;sysemu/replay.h&quot;<br>
=C2=A0#include &quot;sysemu/cpu-timers.h&quot;<br>
diff --git a/accel/tcg/tcg-all.c b/accel/tcg/tcg-all.c<br>
index d6336a9c966d..47952eecd779 100644<br>
--- a/accel/tcg/tcg-all.c<br>
+++ b/accel/tcg/tcg-all.c<br>
@@ -24,7 +24,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;sysemu/tcg.h&quot;<br>
=C2=A0#include &quot;sysemu/cpu-timers.h&quot;<br>
=C2=A0#include &quot;tcg/tcg.h&quot;<br>
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c<br>
index 5971cd53ab9f..a6e03c1e50b2 100644<br>
--- a/accel/tcg/translate-all.c<br>
+++ b/accel/tcg/translate-all.c<br>
@@ -18,7 +18,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
<br>
=C2=A0#define NO_CPU_IO_DEFS<br>
=C2=A0#include &quot;trace.h&quot;<br>
diff --git a/audio/audio_win_int.c b/audio/audio_win_int.c<br>
index 5ea8157dfcc8..316f118f5099 100644<br>
--- a/audio/audio_win_int.c<br>
+++ b/audio/audio_win_int.c<br>
@@ -1,7 +1,6 @@<br>
=C2=A0/* public domain */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
<br>
=C2=A0#define AUDIO_CAP &quot;win-int&quot;<br>
=C2=A0#include &lt;windows.h&gt;<br>
diff --git a/backends/hostmem-epc.c b/backends/hostmem-epc.c<br>
index b47f98b6a3aa..037292d2672f 100644<br>
--- a/backends/hostmem-epc.c<br>
+++ b/backends/hostmem-epc.c<br>
@@ -12,7 +12,6 @@<br>
=C2=A0#include &lt;sys/ioctl.h&gt;<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qom/object_interfaces.h&quot;<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
=C2=A0#include &quot;sysemu/hostmem.h&quot;<br>
diff --git a/backends/tpm/tpm_passthrough.c b/backends/tpm/tpm_passthrough.=
c<br>
index d5558fae6cc5..5a2f74db1b38 100644<br>
--- a/backends/tpm/tpm_passthrough.c<br>
+++ b/backends/tpm/tpm_passthrough.c<br>
@@ -23,7 +23,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qemu/error-report.h&quot;<br>
=C2=A0#include &quot;qemu/module.h&quot;<br>
=C2=A0#include &quot;qemu/sockets.h&quot;<br>
diff --git a/block/file-posix.c b/block/file-posix.c<br>
index 61b02d85ebf1..bfd9b2111143 100644<br>
--- a/block/file-posix.c<br>
+++ b/block/file-posix.c<br>
@@ -23,7 +23,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
=C2=A0#include &quot;qemu/cutils.h&quot;<br>
=C2=A0#include &quot;qemu/error-report.h&quot;<br>
diff --git a/block/io_uring.c b/block/io_uring.c<br>
index 782afdb433e1..0b401512b973 100644<br>
--- a/block/io_uring.c<br>
+++ b/block/io_uring.c<br>
@@ -10,7 +10,6 @@<br>
=C2=A0 */<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
=C2=A0#include &lt;liburing.h&gt;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;block/aio.h&quot;<br>
=C2=A0#include &quot;qemu/queue.h&quot;<br>
=C2=A0#include &quot;block/block.h&quot;<br>
diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c<=
br>
index a17ff9f6ecce..d272478e7b0a 100644<br>
--- a/bsd-user/freebsd/os-syscall.c<br>
+++ b/bsd-user/freebsd/os-syscall.c<br>
@@ -37,7 +37,6 @@<br>
=C2=A0#include &lt;utime.h&gt;<br>
<br>
=C2=A0#include &quot;qemu.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;signal-common.h&quot;<br>
=C2=A0#include &quot;user/syscall-trace.h&quot;<br>
<br>
diff --git a/bsd-user/mmap.c b/bsd-user/mmap.c<br>
index 07aa0a634dff..e54e26de17b0 100644<br>
--- a/bsd-user/mmap.c<br>
+++ b/bsd-user/mmap.c<br>
@@ -19,7 +19,6 @@<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
<br>
=C2=A0#include &quot;qemu.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
<br>
=C2=A0static pthread_mutex_t mmap_mutex =3D PTHREAD_MUTEX_INITIALIZER;<br>
=C2=A0static __thread int mmap_lock_count;<br>
diff --git a/chardev/char-fd.c b/chardev/char-fd.c<br>
index 93c56913b49a..6ec9682b22f2 100644<br>
--- a/chardev/char-fd.c<br>
+++ b/chardev/char-fd.c<br>
@@ -23,7 +23,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qemu/module.h&quot;<br>
=C2=A0#include &quot;qemu/sockets.h&quot;<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
diff --git a/chardev/char-pipe.c b/chardev/char-pipe.c<br>
index 7eca5d9a56ae..66d3b8509183 100644<br>
--- a/chardev/char-pipe.c<br>
+++ b/chardev/char-pipe.c<br>
@@ -23,7 +23,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
=C2=A0#include &quot;qemu/main-loop.h&quot;<br>
=C2=A0#include &quot;qemu/module.h&quot;<br>
diff --git a/chardev/char-pty.c b/chardev/char-pty.c<br>
index d73d8b23903d..1e2863f532a8 100644<br>
--- a/chardev/char-pty.c<br>
+++ b/chardev/char-pty.c<br>
@@ -23,7 +23,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
=C2=A0#include &quot;chardev/char.h&quot;<br>
=C2=A0#include &quot;io/channel-file.h&quot;<br>
diff --git a/cpu.c b/cpu.c<br>
index ab2c7c81e460..0fef70e18e74 100644<br>
--- a/cpu.c<br>
+++ b/cpu.c<br>
@@ -18,7 +18,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
<br>
=C2=A0#include &quot;exec/target_page.h&quot;<br>
diff --git a/crypto/cipher-afalg.c b/crypto/cipher-afalg.c<br>
index c55cd28bf01c..3df8fc54c051 100644<br>
--- a/crypto/cipher-afalg.c<br>
+++ b/crypto/cipher-afalg.c<br>
@@ -12,7 +12,6 @@<br>
=C2=A0 */<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
=C2=A0#include &quot;qemu/sockets.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
=C2=A0#include &quot;crypto/cipher.h&quot;<br>
=C2=A0#include &quot;cipherpriv.h&quot;<br>
diff --git a/crypto/hash-afalg.c b/crypto/hash-afalg.c<br>
index 4ac18c7c1db7..3ebea392920d 100644<br>
--- a/crypto/hash-afalg.c<br>
+++ b/crypto/hash-afalg.c<br>
@@ -13,7 +13,6 @@<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
=C2=A0#include &quot;qemu/iov.h&quot;<br>
=C2=A0#include &quot;qemu/sockets.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
=C2=A0#include &quot;crypto/hash.h&quot;<br>
=C2=A0#include &quot;crypto/hmac.h&quot;<br>
diff --git a/dump/dump.c b/dump/dump.c<br>
index 5d71c47d06aa..e766ce1d7d91 100644<br>
--- a/dump/dump.c<br>
+++ b/dump/dump.c<br>
@@ -12,7 +12,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qemu/cutils.h&quot;<br>
=C2=A0#include &quot;elf.h&quot;<br>
=C2=A0#include &quot;exec/hwaddr.h&quot;<br>
diff --git a/dump/win_dump.c b/dump/win_dump.c<br>
index c5eb5a9aacd7..fbdbb7bd93a6 100644<br>
--- a/dump/win_dump.c<br>
+++ b/dump/win_dump.c<br>
@@ -9,7 +9,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qemu/cutils.h&quot;<br>
=C2=A0#include &quot;elf.h&quot;<br>
=C2=A0#include &quot;exec/hwaddr.h&quot;<br>
diff --git a/fsdev/virtfs-proxy-helper.c b/fsdev/virtfs-proxy-helper.c<br>
index d06a0f7b8326..2dde27922fe2 100644<br>
--- a/fsdev/virtfs-proxy-helper.c<br>
+++ b/fsdev/virtfs-proxy-helper.c<br>
@@ -21,7 +21,6 @@<br>
=C2=A0#include &lt;linux/magic.h&gt;<br>
=C2=A0#endif<br>
=C2=A0#include &lt;cap-ng.h&gt;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qemu/sockets.h&quot;<br>
=C2=A0#include &quot;qemu/xattr.h&quot;<br>
=C2=A0#include &quot;9p-iov-marshal.h&quot;<br>
diff --git a/gdbstub.c b/gdbstub.c<br>
index c8375e3c3ffe..2c804d506629 100644<br>
--- a/gdbstub.c<br>
+++ b/gdbstub.c<br>
@@ -24,7 +24,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
=C2=A0#include &quot;qemu/error-report.h&quot;<br>
=C2=A0#include &quot;qemu/ctype.h&quot;<br>
diff --git a/hw/9pfs/9p-proxy.c b/hw/9pfs/9p-proxy.c<br>
index 4c5e0fc217eb..99d115ff0db4 100644<br>
--- a/hw/9pfs/9p-proxy.c<br>
+++ b/hw/9pfs/9p-proxy.c<br>
@@ -18,7 +18,6 @@<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
=C2=A0#include &lt;sys/socket.h&gt;<br>
=C2=A0#include &lt;sys/un.h&gt;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;9p.h&quot;<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
=C2=A0#include &quot;qemu/cutils.h&quot;<br>
diff --git a/hw/alpha/dp264.c b/hw/alpha/dp264.c<br>
index c78ed96d0eca..f4349eba83fb 100644<br>
--- a/hw/alpha/dp264.c<br>
+++ b/hw/alpha/dp264.c<br>
@@ -7,7 +7,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;cpu.h&quot;<br>
=C2=A0#include &quot;elf.h&quot;<br>
=C2=A0#include &quot;hw/loader.h&quot;<br>
diff --git a/hw/avr/boot.c b/hw/avr/boot.c<br>
index cbede775cee2..617f3a144c85 100644<br>
--- a/hw/avr/boot.c<br>
+++ b/hw/avr/boot.c<br>
@@ -9,7 +9,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qemu/datadir.h&quot;<br>
=C2=A0#include &quot;hw/loader.h&quot;<br>
=C2=A0#include &quot;elf.h&quot;<br>
diff --git a/hw/core/loader.c b/hw/core/loader.c<br>
index 8d9b2df6e725..8167301f0402 100644<br>
--- a/hw/core/loader.c<br>
+++ b/hw/core/loader.c<br>
@@ -43,7 +43,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qemu/datadir.h&quot;<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
=C2=A0#include &quot;qapi/qapi-commands-machine.h&quot;<br>
diff --git a/hw/display/artist.c b/hw/display/artist.c<br>
index 69a8f9eea8ba..8e121bb0b4dc 100644<br>
--- a/hw/display/artist.c<br>
+++ b/hw/display/artist.c<br>
@@ -7,7 +7,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qemu/error-report.h&quot;<br>
=C2=A0#include &quot;qemu/log.h&quot;<br>
=C2=A0#include &quot;qemu/module.h&quot;<br>
diff --git a/hw/display/cg3.c b/hw/display/cg3.c<br>
index 4b7e78d91924..2e9656ae1c39 100644<br>
--- a/hw/display/cg3.c<br>
+++ b/hw/display/cg3.c<br>
@@ -24,7 +24,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qemu/datadir.h&quot;<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
=C2=A0#include &quot;qemu/error-report.h&quot;<br>
diff --git a/hw/display/tcx.c b/hw/display/tcx.c<br>
index d4d09d0df8d5..1b27b64f6d14 100644<br>
--- a/hw/display/tcx.c<br>
+++ b/hw/display/tcx.c<br>
@@ -23,7 +23,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qemu/datadir.h&quot;<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
=C2=A0#include &quot;ui/console.h&quot;<br>
diff --git a/hw/display/virtio-gpu-udmabuf.c b/hw/display/virtio-gpu-udmabu=
f.c<br>
index 1597921c51fc..8bdf4bac6e4b 100644<br>
--- a/hw/display/virtio-gpu-udmabuf.c<br>
+++ b/hw/display/virtio-gpu-udmabuf.c<br>
@@ -13,7 +13,6 @@<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
=C2=A0#include &quot;qemu/units.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qemu/iov.h&quot;<br>
=C2=A0#include &quot;ui/console.h&quot;<br>
=C2=A0#include &quot;hw/virtio/virtio-gpu.h&quot;<br>
diff --git a/hw/dma/pl330.c b/hw/dma/pl330.c<br>
index 31ce01b7c57c..08e5938ec7b7 100644<br>
--- a/hw/dma/pl330.c<br>
+++ b/hw/dma/pl330.c<br>
@@ -15,7 +15,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;hw/irq.h&quot;<br>
=C2=A0#include &quot;hw/qdev-properties.h&quot;<br>
=C2=A0#include &quot;hw/sysbus.h&quot;<br>
diff --git a/hw/hppa/machine.c b/hw/hppa/machine.c<br>
index 98b30e0395ee..f7595c08577c 100644<br>
--- a/hw/hppa/machine.c<br>
+++ b/hw/hppa/machine.c<br>
@@ -4,7 +4,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qemu/datadir.h&quot;<br>
=C2=A0#include &quot;cpu.h&quot;<br>
=C2=A0#include &quot;elf.h&quot;<br>
diff --git a/hw/i386/pc_sysfw.c b/hw/i386/pc_sysfw.c<br>
index c8b17af95353..0540047bad22 100644<br>
--- a/hw/i386/pc_sysfw.c<br>
+++ b/hw/i386/pc_sysfw.c<br>
@@ -24,7 +24,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
=C2=A0#include &quot;sysemu/block-backend.h&quot;<br>
=C2=A0#include &quot;qemu/error-report.h&quot;<br>
diff --git a/hw/i386/x86.c b/hw/i386/x86.c<br>
index 4cf107baea34..bb6727279097 100644<br>
--- a/hw/i386/x86.c<br>
+++ b/hw/i386/x86.c<br>
@@ -25,7 +25,6 @@<br>
=C2=A0#include &quot;qemu/option.h&quot;<br>
=C2=A0#include &quot;qemu/cutils.h&quot;<br>
=C2=A0#include &quot;qemu/units.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qemu/datadir.h&quot;<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
=C2=A0#include &quot;qapi/qmp/qerror.h&quot;<br>
diff --git a/hw/input/vhost-user-input.c b/hw/input/vhost-user-input.c<br>
index 273e96a7b12d..aeb0624fe57e 100644<br>
--- a/hw/input/vhost-user-input.c<br>
+++ b/hw/input/vhost-user-input.c<br>
@@ -7,7 +7,6 @@<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
=C2=A0#include &quot;qemu/error-report.h&quot;<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
<br>
=C2=A0#include &quot;hw/virtio/virtio-input.h&quot;<br>
<br>
diff --git a/hw/intc/xics_kvm.c b/hw/intc/xics_kvm.c<br>
index f5bfc501bc15..9719d98a179e 100644<br>
--- a/hw/intc/xics_kvm.c<br>
+++ b/hw/intc/xics_kvm.c<br>
@@ -27,7 +27,6 @@<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;trace.h&quot;<br>
=C2=A0#include &quot;sysemu/kvm.h&quot;<br>
=C2=A0#include &quot;hw/ppc/spapr.h&quot;<br>
diff --git a/hw/m68k/mcf5208.c b/hw/m68k/mcf5208.c<br>
index 93812ee206ea..655207e393dc 100644<br>
--- a/hw/m68k/mcf5208.c<br>
+++ b/hw/m68k/mcf5208.c<br>
@@ -11,7 +11,6 @@<br>
=C2=A0#include &quot;qemu/error-report.h&quot;<br>
=C2=A0#include &quot;qemu/log.h&quot;<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qemu/datadir.h&quot;<br>
=C2=A0#include &quot;cpu.h&quot;<br>
=C2=A0#include &quot;hw/irq.h&quot;<br>
diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c<br>
index 66ca5c0df6ef..099a758c6f6a 100644<br>
--- a/hw/m68k/q800.c<br>
+++ b/hw/m68k/q800.c<br>
@@ -22,7 +22,6 @@<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
=C2=A0#include &quot;qemu/units.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qemu/datadir.h&quot;<br>
=C2=A0#include &quot;sysemu/sysemu.h&quot;<br>
=C2=A0#include &quot;cpu.h&quot;<br>
diff --git a/hw/m68k/virt.c b/hw/m68k/virt.c<br>
index 8e630282e02c..7de8b5f83393 100644<br>
--- a/hw/m68k/virt.c<br>
+++ b/hw/m68k/virt.c<br>
@@ -9,7 +9,6 @@<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
=C2=A0#include &quot;qemu/units.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;sysemu/sysemu.h&quot;<br>
=C2=A0#include &quot;cpu.h&quot;<br>
=C2=A0#include &quot;hw/boards.h&quot;<br>
diff --git a/hw/microblaze/boot.c b/hw/microblaze/boot.c<br>
index 03c030aa2cf0..8b92a9801a02 100644<br>
--- a/hw/microblaze/boot.c<br>
+++ b/hw/microblaze/boot.c<br>
@@ -25,7 +25,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qemu/datadir.h&quot;<br>
=C2=A0#include &quot;cpu.h&quot;<br>
=C2=A0#include &quot;qemu/option.h&quot;<br>
diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c<br>
index c9f14e70a077..7b13098f9b1b 100644<br>
--- a/hw/mips/fuloong2e.c<br>
+++ b/hw/mips/fuloong2e.c<br>
@@ -19,7 +19,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qemu/datadir.h&quot;<br>
=C2=A0#include &quot;qemu/units.h&quot;<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
diff --git a/hw/mips/jazz.c b/hw/mips/jazz.c<br>
index 4d6b44de342e..6598d7dddd59 100644<br>
--- a/hw/mips/jazz.c<br>
+++ b/hw/mips/jazz.c<br>
@@ -23,7 +23,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qemu/datadir.h&quot;<br>
=C2=A0#include &quot;hw/clock.h&quot;<br>
=C2=A0#include &quot;hw/mips/mips.h&quot;<br>
diff --git a/hw/mips/loongson3_virt.c b/hw/mips/loongson3_virt.c<br>
index ae192db0c8b9..25534288dd81 100644<br>
--- a/hw/mips/loongson3_virt.c<br>
+++ b/hw/mips/loongson3_virt.c<br>
@@ -24,7 +24,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qemu/units.h&quot;<br>
=C2=A0#include &quot;qemu/cutils.h&quot;<br>
=C2=A0#include &quot;qemu/datadir.h&quot;<br>
diff --git a/hw/mips/malta.c b/hw/mips/malta.c<br>
index c4474b927c46..9ffdc5b8f187 100644<br>
--- a/hw/mips/malta.c<br>
+++ b/hw/mips/malta.c<br>
@@ -25,7 +25,6 @@<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
=C2=A0#include &quot;qemu/units.h&quot;<br>
=C2=A0#include &quot;qemu/bitops.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qemu/datadir.h&quot;<br>
=C2=A0#include &quot;hw/clock.h&quot;<br>
=C2=A0#include &quot;hw/southbridge/piix.h&quot;<br>
diff --git a/hw/mips/mipssim.c b/hw/mips/mipssim.c<br>
index 30bc1c4f086f..39f64448f244 100644<br>
--- a/hw/mips/mipssim.c<br>
+++ b/hw/mips/mipssim.c<br>
@@ -27,7 +27,6 @@<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qemu/datadir.h&quot;<br>
=C2=A0#include &quot;hw/clock.h&quot;<br>
=C2=A0#include &quot;hw/mips/mips.h&quot;<br>
diff --git a/hw/misc/sbsa_ec.c b/hw/misc/sbsa_ec.c<br>
index 83020fe9ac9b..8d939fe31b1b 100644<br>
--- a/hw/misc/sbsa_ec.c<br>
+++ b/hw/misc/sbsa_ec.c<br>
@@ -11,7 +11,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qemu/log.h&quot;<br>
=C2=A0#include &quot;hw/sysbus.h&quot;<br>
=C2=A0#include &quot;sysemu/runstate.h&quot;<br>
diff --git a/hw/net/fsl_etsec/etsec.c b/hw/net/fsl_etsec/etsec.c<br>
index e7fc082518d2..6d50c395439a 100644<br>
--- a/hw/net/fsl_etsec/etsec.c<br>
+++ b/hw/net/fsl_etsec/etsec.c<br>
@@ -27,7 +27,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;hw/sysbus.h&quot;<br>
=C2=A0#include &quot;hw/irq.h&quot;<br>
=C2=A0#include &quot;hw/ptimer.h&quot;<br>
diff --git a/hw/net/fsl_etsec/rings.c b/hw/net/fsl_etsec/rings.c<br>
index 8f084464155d..a32589e33be4 100644<br>
--- a/hw/net/fsl_etsec/rings.c<br>
+++ b/hw/net/fsl_etsec/rings.c<br>
@@ -22,7 +22,6 @@<br>
=C2=A0 * THE SOFTWARE.<br>
=C2=A0 */<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;net/checksum.h&quot;<br>
=C2=A0#include &quot;qemu/log.h&quot;<br>
=C2=A0#include &quot;etsec.h&quot;<br>
diff --git a/hw/net/msf2-emac.c b/hw/net/msf2-emac.c<br>
index 9278fdce0b3d..7ccd3e514271 100644<br>
--- a/hw/net/msf2-emac.c<br>
+++ b/hw/net/msf2-emac.c<br>
@@ -29,7 +29,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qemu/log.h&quot;<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
=C2=A0#include &quot;hw/registerfields.h&quot;<br>
diff --git a/hw/net/npcm7xx_emc.c b/hw/net/npcm7xx_emc.c<br>
index 9a2328935c1c..7c86bb52e571 100644<br>
--- a/hw/net/npcm7xx_emc.c<br>
+++ b/hw/net/npcm7xx_emc.c<br>
@@ -32,7 +32,6 @@<br>
=C2=A0/* For crc32 */<br>
=C2=A0#include &lt;zlib.h&gt;<br>
<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;hw/irq.h&quot;<br>
=C2=A0#include &quot;hw/qdev-clock.h&quot;<br>
=C2=A0#include &quot;hw/qdev-properties.h&quot;<br>
diff --git a/hw/nios2/boot.c b/hw/nios2/boot.c<br>
index e889595d5c2b..07b8d87633b6 100644<br>
--- a/hw/nios2/boot.c<br>
+++ b/hw/nios2/boot.c<br>
@@ -30,7 +30,6 @@<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
=C2=A0#include &quot;qemu/units.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qemu/datadir.h&quot;<br>
=C2=A0#include &quot;qemu/option.h&quot;<br>
=C2=A0#include &quot;qemu/config-file.h&quot;<br>
diff --git a/hw/nios2/generic_nommu.c b/hw/nios2/generic_nommu.c<br>
index fbc18dbd04c2..48edb3ae373d 100644<br>
--- a/hw/nios2/generic_nommu.c<br>
+++ b/hw/nios2/generic_nommu.c<br>
@@ -28,7 +28,6 @@<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
<br>
=C2=A0#include &quot;hw/char/serial.h&quot;<br>
=C2=A0#include &quot;hw/boards.h&quot;<br>
diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c<br>
index ea2d56f9f2af..4125cbebcd38 100644<br>
--- a/hw/nvram/fw_cfg.c<br>
+++ b/hw/nvram/fw_cfg.c<br>
@@ -23,7 +23,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qemu/datadir.h&quot;<br>
=C2=A0#include &quot;sysemu/sysemu.h&quot;<br>
=C2=A0#include &quot;sysemu/dma.h&quot;<br>
diff --git a/hw/pci-host/mv64361.c b/hw/pci-host/mv64361.c<br>
index 00b3ff7d9098..cc9c4d6d3b33 100644<br>
--- a/hw/pci-host/mv64361.c<br>
+++ b/hw/pci-host/mv64361.c<br>
@@ -9,7 +9,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qemu/units.h&quot;<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
=C2=A0#include &quot;hw/hw.h&quot;<br>
diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c<br>
index 6e9aa9d6ace2..4e68ad4f03fc 100644<br>
--- a/hw/pci-host/pnv_phb3.c<br>
+++ b/hw/pci-host/pnv_phb3.c<br>
@@ -10,7 +10,6 @@<br>
=C2=A0#include &quot;qemu/log.h&quot;<br>
=C2=A0#include &quot;qapi/visitor.h&quot;<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;hw/pci-host/pnv_phb3_regs.h&quot;<br>
=C2=A0#include &quot;hw/pci-host/pnv_phb3.h&quot;<br>
=C2=A0#include &quot;hw/pci/pcie_host.h&quot;<br>
diff --git a/hw/pci-host/pnv_phb3_msi.c b/hw/pci-host/pnv_phb3_msi.c<br>
index 8bcbc2cc4f37..2f4112907b84 100644<br>
--- a/hw/pci-host/pnv_phb3_msi.c<br>
+++ b/hw/pci-host/pnv_phb3_msi.c<br>
@@ -9,7 +9,6 @@<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
=C2=A0#include &quot;qemu/log.h&quot;<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;hw/pci-host/pnv_phb3_regs.h&quot;<br>
=C2=A0#include &quot;hw/pci-host/pnv_phb3.h&quot;<br>
=C2=A0#include &quot;hw/ppc/pnv.h&quot;<br>
diff --git a/hw/pci-host/pnv_phb3_pbcq.c b/hw/pci-host/pnv_phb3_pbcq.c<br>
index c7426cd27a20..82f70efa4311 100644<br>
--- a/hw/pci-host/pnv_phb3_pbcq.c<br>
+++ b/hw/pci-host/pnv_phb3_pbcq.c<br>
@@ -8,7 +8,6 @@<br>
=C2=A0 */<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qemu/log.h&quot;<br>
=C2=A0#include &quot;target/ppc/cpu.h&quot;<br>
=C2=A0#include &quot;hw/ppc/fdt.h&quot;<br>
diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c<br>
index 11c97e27eb16..3c4c2dace0a3 100644<br>
--- a/hw/pci-host/pnv_phb4.c<br>
+++ b/hw/pci-host/pnv_phb4.c<br>
@@ -10,7 +10,6 @@<br>
=C2=A0#include &quot;qemu/log.h&quot;<br>
=C2=A0#include &quot;qapi/visitor.h&quot;<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;monitor/monitor.h&quot;<br>
=C2=A0#include &quot;target/ppc/cpu.h&quot;<br>
=C2=A0#include &quot;hw/pci-host/pnv_phb4_regs.h&quot;<br>
diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c<br>
index 6f1121a9489a..61bc0b503e3e 100644<br>
--- a/hw/pci-host/pnv_phb4_pec.c<br>
+++ b/hw/pci-host/pnv_phb4_pec.c<br>
@@ -8,7 +8,6 @@<br>
=C2=A0 */<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qemu/log.h&quot;<br>
=C2=A0#include &quot;target/ppc/cpu.h&quot;<br>
=C2=A0#include &quot;hw/ppc/fdt.h&quot;<br>
diff --git a/hw/pci-host/raven.c b/hw/pci-host/raven.c<br>
index 6e514f75eb8f..7a105e4a63d3 100644<br>
--- a/hw/pci-host/raven.c<br>
+++ b/hw/pci-host/raven.c<br>
@@ -24,7 +24,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qemu/datadir.h&quot;<br>
=C2=A0#include &quot;qemu/units.h&quot;<br>
=C2=A0#include &quot;qemu/log.h&quot;<br>
diff --git a/hw/pci-host/remote.c b/hw/pci-host/remote.c<br>
index eee45444ef73..bfb25ef6af85 100644<br>
--- a/hw/pci-host/remote.c<br>
+++ b/hw/pci-host/remote.c<br>
@@ -22,7 +22,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
<br>
=C2=A0#include &quot;hw/pci/pci.h&quot;<br>
=C2=A0#include &quot;hw/pci/pci_host.h&quot;<br>
diff --git a/hw/pci/pci.c b/hw/pci/pci.c<br>
index dae9119bfe5f..e99417e50110 100644<br>
--- a/hw/pci/pci.c<br>
+++ b/hw/pci/pci.c<br>
@@ -23,7 +23,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qemu/datadir.h&quot;<br>
=C2=A0#include &quot;qemu/units.h&quot;<br>
=C2=A0#include &quot;hw/irq.h&quot;<br>
diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c<br>
index c7e6767f91a8..2bc3dce1fb7d 100644<br>
--- a/hw/ppc/e500.c<br>
+++ b/hw/ppc/e500.c<br>
@@ -15,7 +15,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qemu/datadir.h&quot;<br>
=C2=A0#include &quot;qemu/units.h&quot;<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c<br>
index 7b5a205309af..e8ef1a9e5d9b 100644<br>
--- a/hw/ppc/mac_newworld.c<br>
+++ b/hw/ppc/mac_newworld.c<br>
@@ -47,7 +47,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qemu/datadir.h&quot;<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
=C2=A0#include &quot;hw/ppc/ppc.h&quot;<br>
diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c<br>
index 7016979a7cd0..fe2adb057b0c 100644<br>
--- a/hw/ppc/mac_oldworld.c<br>
+++ b/hw/ppc/mac_oldworld.c<br>
@@ -25,7 +25,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qemu/datadir.h&quot;<br>
=C2=A0#include &quot;qemu/units.h&quot;<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c<br>
index d45008ac7131..56bf203dfddf 100644<br>
--- a/hw/ppc/pegasos2.c<br>
+++ b/hw/ppc/pegasos2.c<br>
@@ -8,7 +8,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qemu/units.h&quot;<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
=C2=A0#include &quot;hw/hw.h&quot;<br>
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c<br>
index 00f57c9678e6..c5e48992d988 100644<br>
--- a/hw/ppc/pnv.c<br>
+++ b/hw/ppc/pnv.c<br>
@@ -18,7 +18,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qemu/datadir.h&quot;<br>
=C2=A0#include &quot;qemu/units.h&quot;<br>
=C2=A0#include &quot;qemu/cutils.h&quot;<br>
diff --git a/hw/ppc/pnv_bmc.c b/hw/ppc/pnv_bmc.c<br>
index 75a22ce50b11..99f1e8d7f9f3 100644<br>
--- a/hw/ppc/pnv_bmc.c<br>
+++ b/hw/ppc/pnv_bmc.c<br>
@@ -17,7 +17,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
=C2=A0#include &quot;target/ppc/cpu.h&quot;<br>
=C2=A0#include &quot;qemu/log.h&quot;<br>
diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c<br>
index 7e1a4ac9553b..32013b89836a 100644<br>
--- a/hw/ppc/ppc405_boards.c<br>
+++ b/hw/ppc/ppc405_boards.c<br>
@@ -25,7 +25,6 @@<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
=C2=A0#include &quot;qemu/units.h&quot;<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qemu/datadir.h&quot;<br>
=C2=A0#include &quot;cpu.h&quot;<br>
=C2=A0#include &quot;hw/ppc/ppc.h&quot;<br>
diff --git a/hw/ppc/ppc440_bamboo.c b/hw/ppc/ppc440_bamboo.c<br>
index 7fb620b9a056..efa90ef5ba73 100644<br>
--- a/hw/ppc/ppc440_bamboo.c<br>
+++ b/hw/ppc/ppc440_bamboo.c<br>
@@ -14,7 +14,6 @@<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
=C2=A0#include &quot;qemu/units.h&quot;<br>
=C2=A0#include &quot;qemu/error-report.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qemu/datadir.h&quot;<br>
=C2=A0#include &quot;qemu/error-report.h&quot;<br>
=C2=A0#include &quot;net/net.h&quot;<br>
diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c<br>
index 0737234d66e5..2f24598f55db 100644<br>
--- a/hw/ppc/sam460ex.c<br>
+++ b/hw/ppc/sam460ex.c<br>
@@ -13,7 +13,6 @@<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
=C2=A0#include &quot;qemu/units.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qemu/datadir.h&quot;<br>
=C2=A0#include &quot;qemu/error-report.h&quot;<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c<br>
index a4372ba1891e..cc11fcc8b24d 100644<br>
--- a/hw/ppc/spapr.c<br>
+++ b/hw/ppc/spapr.c<br>
@@ -25,7 +25,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qemu/datadir.h&quot;<br>
=C2=A0#include &quot;qemu/memalign.h&quot;<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
diff --git a/hw/ppc/spapr_numa.c b/hw/ppc/spapr_numa.c<br>
index d7c0e212baf8..a64098c375e0 100644<br>
--- a/hw/ppc/spapr_numa.c<br>
+++ b/hw/ppc/spapr_numa.c<br>
@@ -11,7 +11,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;hw/ppc/spapr_numa.h&quot;<br>
=C2=A0#include &quot;hw/pci-host/spapr.h&quot;<br>
=C2=A0#include &quot;hw/ppc/fdt.h&quot;<br>
diff --git a/hw/ppc/spapr_pci_nvlink2.c b/hw/ppc/spapr_pci_nvlink2.c<br>
index 4678c79235f6..63b476c8f727 100644<br>
--- a/hw/ppc/spapr_pci_nvlink2.c<br>
+++ b/hw/ppc/spapr_pci_nvlink2.c<br>
@@ -23,7 +23,6 @@<br>
=C2=A0 */<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;hw/pci/pci.h&quot;<br>
=C2=A0#include &quot;hw/pci-host/spapr.h&quot;<br>
=C2=A0#include &quot;hw/ppc/spapr_numa.h&quot;<br>
diff --git a/hw/ppc/spapr_tpm_proxy.c b/hw/ppc/spapr_tpm_proxy.c<br>
index 2454086744b1..e10af35a1850 100644<br>
--- a/hw/ppc/spapr_tpm_proxy.c<br>
+++ b/hw/ppc/spapr_tpm_proxy.c<br>
@@ -11,7 +11,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
=C2=A0#include &quot;qemu/error-report.h&quot;<br>
=C2=A0#include &quot;sysemu/reset.h&quot;<br>
diff --git a/hw/ppc/spapr_vof.c b/hw/ppc/spapr_vof.c<br>
index a33f940c32bb..09f29be0b9de 100644<br>
--- a/hw/ppc/spapr_vof.c<br>
+++ b/hw/ppc/spapr_vof.c<br>
@@ -4,7 +4,6 @@<br>
=C2=A0 * SPDX-License-Identifier: GPL-2.0-or-later<br>
=C2=A0 */<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
=C2=A0#include &quot;hw/ppc/spapr.h&quot;<br>
=C2=A0#include &quot;hw/ppc/spapr_vio.h&quot;<br>
diff --git a/hw/ppc/virtex_ml507.c b/hw/ppc/virtex_ml507.c<br>
index 9c575403b85c..b67a709ddce2 100644<br>
--- a/hw/ppc/virtex_ml507.c<br>
+++ b/hw/ppc/virtex_ml507.c<br>
@@ -23,7 +23,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qemu/datadir.h&quot;<br>
=C2=A0#include &quot;qemu/units.h&quot;<br>
=C2=A0#include &quot;cpu.h&quot;<br>
diff --git a/hw/ppc/vof.c b/hw/ppc/vof.c<br>
index 2b63a6287561..8d96593677da 100644<br>
--- a/hw/ppc/vof.c<br>
+++ b/hw/ppc/vof.c<br>
@@ -10,7 +10,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qemu/timer.h&quot;<br>
=C2=A0#include &quot;qemu/range.h&quot;<br>
=C2=A0#include &quot;qemu/units.h&quot;<br>
diff --git a/hw/remote/iohub.c b/hw/remote/iohub.c<br>
index 547d597f0feb..40dfee4bad43 100644<br>
--- a/hw/remote/iohub.c<br>
+++ b/hw/remote/iohub.c<br>
@@ -9,7 +9,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
<br>
=C2=A0#include &quot;hw/pci/pci.h&quot;<br>
=C2=A0#include &quot;hw/pci/pci_ids.h&quot;<br>
diff --git a/hw/remote/machine.c b/hw/remote/machine.c<br>
index 952105eab5a2..92d71d47bb9c 100644<br>
--- a/hw/remote/machine.c<br>
+++ b/hw/remote/machine.c<br>
@@ -14,7 +14,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
<br>
=C2=A0#include &quot;hw/remote/machine.h&quot;<br>
=C2=A0#include &quot;exec/memory.h&quot;<br>
diff --git a/hw/remote/memory.c b/hw/remote/memory.c<br>
index 6e21ab1a45c9..6d60da91e01c 100644<br>
--- a/hw/remote/memory.c<br>
+++ b/hw/remote/memory.c<br>
@@ -9,7 +9,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
<br>
=C2=A0#include &quot;hw/remote/memory.h&quot;<br>
=C2=A0#include &quot;exec/ram_addr.h&quot;<br>
diff --git a/hw/remote/message.c b/hw/remote/message.c<br>
index 11d729845c5a..50f6bf2d495f 100644<br>
--- a/hw/remote/message.c<br>
+++ b/hw/remote/message.c<br>
@@ -8,7 +8,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
<br>
=C2=A0#include &quot;hw/remote/machine.h&quot;<br>
=C2=A0#include &quot;io/channel.h&quot;<br>
diff --git a/hw/remote/mpqemu-link.c b/hw/remote/mpqemu-link.c<br>
index 7e841820e521..2a4aa651ca26 100644<br>
--- a/hw/remote/mpqemu-link.c<br>
+++ b/hw/remote/mpqemu-link.c<br>
@@ -9,7 +9,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
<br>
=C2=A0#include &quot;qemu/module.h&quot;<br>
=C2=A0#include &quot;hw/remote/mpqemu-link.h&quot;<br>
diff --git a/hw/remote/proxy-memory-listener.c b/hw/remote/proxy-memory-lis=
tener.c<br>
index 0e893f3189e9..eb9918fe72bb 100644<br>
--- a/hw/remote/proxy-memory-listener.c<br>
+++ b/hw/remote/proxy-memory-listener.c<br>
@@ -7,7 +7,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
<br>
=C2=A0#include &quot;qemu/compiler.h&quot;<br>
=C2=A0#include &quot;qemu/int128.h&quot;<br>
diff --git a/hw/remote/proxy.c b/hw/remote/proxy.c<br>
index bad164299dd4..1c7786b52cf1 100644<br>
--- a/hw/remote/proxy.c<br>
+++ b/hw/remote/proxy.c<br>
@@ -7,7 +7,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
<br>
=C2=A0#include &quot;hw/remote/proxy.h&quot;<br>
=C2=A0#include &quot;hw/pci/pci.h&quot;<br>
diff --git a/hw/remote/remote-obj.c b/hw/remote/remote-obj.c<br>
index 4f21254219f8..333e5ac44331 100644<br>
--- a/hw/remote/remote-obj.c<br>
+++ b/hw/remote/remote-obj.c<br>
@@ -8,7 +8,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
<br>
=C2=A0#include &quot;qemu/error-report.h&quot;<br>
=C2=A0#include &quot;qemu/notify.h&quot;<br>
diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c<br>
index cae74fcbcd9a..0f179d36014a 100644<br>
--- a/hw/riscv/boot.c<br>
+++ b/hw/riscv/boot.c<br>
@@ -18,7 +18,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qemu/datadir.h&quot;<br>
=C2=A0#include &quot;qemu/units.h&quot;<br>
=C2=A0#include &quot;qemu/error-report.h&quot;<br>
diff --git a/hw/rx/rx-gdbsim.c b/hw/rx/rx-gdbsim.c<br>
index 75d1fec6ca46..64f897e5b10a 100644<br>
--- a/hw/rx/rx-gdbsim.c<br>
+++ b/hw/rx/rx-gdbsim.c<br>
@@ -20,7 +20,6 @@<br>
=C2=A0#include &quot;qemu/cutils.h&quot;<br>
=C2=A0#include &quot;qemu/error-report.h&quot;<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;hw/loader.h&quot;<br>
=C2=A0#include &quot;hw/rx/rx62n.h&quot;<br>
=C2=A0#include &quot;sysemu/qtest.h&quot;<br>
diff --git a/hw/s390x/ipl.c b/hw/s390x/ipl.c<br>
index eb7fc4c4ae87..84971e537b3e 100644<br>
--- a/hw/s390x/ipl.c<br>
+++ b/hw/s390x/ipl.c<br>
@@ -13,7 +13,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qemu/datadir.h&quot;<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
=C2=A0#include &quot;sysemu/reset.h&quot;<br>
diff --git a/hw/sd/sd.c b/hw/sd/sd.c<br>
index cd67a7bac8e2..8e6fa0915137 100644<br>
--- a/hw/sd/sd.c<br>
+++ b/hw/sd/sd.c<br>
@@ -47,7 +47,6 @@<br>
=C2=A0#include &quot;qemu/timer.h&quot;<br>
=C2=A0#include &quot;qemu/log.h&quot;<br>
=C2=A0#include &quot;qemu/module.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;sdmmc-internal.h&quot;<br>
=C2=A0#include &quot;trace.h&quot;<br>
<br>
diff --git a/hw/sparc/leon3.c b/hw/sparc/leon3.c<br>
index a9f24968275d..1e39d2e2d0ac 100644<br>
--- a/hw/sparc/leon3.c<br>
+++ b/hw/sparc/leon3.c<br>
@@ -26,7 +26,6 @@<br>
=C2=A0#include &quot;qemu/units.h&quot;<br>
=C2=A0#include &quot;qemu/error-report.h&quot;<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qemu/datadir.h&quot;<br>
=C2=A0#include &quot;cpu.h&quot;<br>
=C2=A0#include &quot;hw/irq.h&quot;<br>
diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c<br>
index 7f3a7c002780..fccaed1eb444 100644<br>
--- a/hw/sparc/sun4m.c<br>
+++ b/hw/sparc/sun4m.c<br>
@@ -26,7 +26,6 @@<br>
=C2=A0#include &quot;qemu/units.h&quot;<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
=C2=A0#include &quot;qemu/datadir.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;cpu.h&quot;<br>
=C2=A0#include &quot;hw/sysbus.h&quot;<br>
=C2=A0#include &quot;qemu/error-report.h&quot;<br>
diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c<br>
index cda7df36e312..6fd08e2298a6 100644<br>
--- a/hw/sparc64/sun4u.c<br>
+++ b/hw/sparc64/sun4u.c<br>
@@ -26,7 +26,6 @@<br>
=C2=A0#include &quot;qemu/units.h&quot;<br>
=C2=A0#include &quot;qemu/error-report.h&quot;<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qemu/datadir.h&quot;<br>
=C2=A0#include &quot;cpu.h&quot;<br>
=C2=A0#include &quot;hw/pci/pci.h&quot;<br>
diff --git a/hw/usb/dev-mtp.c b/hw/usb/dev-mtp.c<br>
index e6b77a2a941d..5831395cef75 100644<br>
--- a/hw/usb/dev-mtp.c<br>
+++ b/hw/usb/dev-mtp.c<br>
@@ -10,7 +10,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
=C2=A0#include &quot;qemu/error-report.h&quot;<br>
=C2=A0#include &lt;wchar.h&gt;<br>
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c<br>
index 664cbd958323..6de58a76a7ff 100644<br>
--- a/hw/virtio/virtio-iommu.c<br>
+++ b/hw/virtio/virtio-iommu.c<br>
@@ -20,7 +20,6 @@<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
=C2=A0#include &quot;qemu/log.h&quot;<br>
=C2=A0#include &quot;qemu/iov.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;hw/qdev-properties.h&quot;<br>
=C2=A0#include &quot;hw/virtio/virtio.h&quot;<br>
=C2=A0#include &quot;sysemu/kvm.h&quot;<br>
diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c<br>
index 35cbf1f21946..5aca40872695 100644<br>
--- a/hw/virtio/virtio-mem.c<br>
+++ b/hw/virtio/virtio-mem.c<br>
@@ -11,7 +11,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qemu/iov.h&quot;<br>
=C2=A0#include &quot;qemu/cutils.h&quot;<br>
=C2=A0#include &quot;qemu/error-report.h&quot;<br>
diff --git a/hw/virtio/virtio-pmem.c b/hw/virtio/virtio-pmem.c<br>
index 5419dca75e2c..5dd21c2c4408 100644<br>
--- a/hw/virtio/virtio-pmem.c<br>
+++ b/hw/virtio/virtio-pmem.c<br>
@@ -13,7 +13,6 @@<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qemu/error-report.h&quot;<br>
=C2=A0#include &quot;qemu/main-loop.h&quot;<br>
=C2=A0#include &quot;hw/virtio/virtio-pmem.h&quot;<br>
diff --git a/io/channel-socket.c b/io/channel-socket.c<br>
index 7a8d9f69c92d..9f5ddf68b687 100644<br>
--- a/io/channel-socket.c<br>
+++ b/io/channel-socket.c<br>
@@ -18,7 +18,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
=C2=A0#include &quot;qapi/qapi-visit-sockets.h&quot;<br>
=C2=A0#include &quot;qemu/module.h&quot;<br>
diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c<=
br>
index 31a66a4fa07c..3b273f62997a 100644<br>
--- a/linux-user/aarch64/cpu_loop.c<br>
+++ b/linux-user/aarch64/cpu_loop.c<br>
@@ -18,7 +18,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qemu.h&quot;<br>
=C2=A0#include &quot;user-internals.h&quot;<br>
=C2=A0#include &quot;cpu_loop-common.h&quot;<br>
diff --git a/linux-user/alpha/cpu_loop.c b/linux-user/alpha/cpu_loop.c<br>
index de6e0c901cdf..2ea039aa71f7 100644<br>
--- a/linux-user/alpha/cpu_loop.c<br>
+++ b/linux-user/alpha/cpu_loop.c<br>
@@ -18,7 +18,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qemu.h&quot;<br>
=C2=A0#include &quot;user-internals.h&quot;<br>
=C2=A0#include &quot;cpu_loop-common.h&quot;<br>
diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c<br>
index 9dcb2e024eb0..683b8e47c2bd 100644<br>
--- a/linux-user/arm/cpu_loop.c<br>
+++ b/linux-user/arm/cpu_loop.c<br>
@@ -18,7 +18,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qemu.h&quot;<br>
=C2=A0#include &quot;user-internals.h&quot;<br>
=C2=A0#include &quot;elf.h&quot;<br>
diff --git a/linux-user/cris/cpu_loop.c b/linux-user/cris/cpu_loop.c<br>
index 0f46b3c1a87a..01e6ff16fc92 100644<br>
--- a/linux-user/cris/cpu_loop.c<br>
+++ b/linux-user/cris/cpu_loop.c<br>
@@ -18,7 +18,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qemu.h&quot;<br>
=C2=A0#include &quot;user-internals.h&quot;<br>
=C2=A0#include &quot;cpu_loop-common.h&quot;<br>
diff --git a/linux-user/hexagon/cpu_loop.c b/linux-user/hexagon/cpu_loop.c<=
br>
index 0d73934d31d5..b84e25bf71eb 100644<br>
--- a/linux-user/hexagon/cpu_loop.c<br>
+++ b/linux-user/hexagon/cpu_loop.c<br>
@@ -19,7 +19,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qemu.h&quot;<br>
=C2=A0#include &quot;user-internals.h&quot;<br>
=C2=A0#include &quot;cpu_loop-common.h&quot;<br>
diff --git a/linux-user/i386/cpu_loop.c b/linux-user/i386/cpu_loop.c<br>
index 90bffc1956aa..492701dd9af9 100644<br>
--- a/linux-user/i386/cpu_loop.c<br>
+++ b/linux-user/i386/cpu_loop.c<br>
@@ -18,7 +18,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qemu.h&quot;<br>
=C2=A0#include &quot;qemu/timer.h&quot;<br>
=C2=A0#include &quot;user-internals.h&quot;<br>
diff --git a/linux-user/m68k/cpu_loop.c b/linux-user/m68k/cpu_loop.c<br>
index 928a18e3cf05..d1bf8548b747 100644<br>
--- a/linux-user/m68k/cpu_loop.c<br>
+++ b/linux-user/m68k/cpu_loop.c<br>
@@ -18,7 +18,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qemu.h&quot;<br>
=C2=A0#include &quot;user-internals.h&quot;<br>
=C2=A0#include &quot;cpu_loop-common.h&quot;<br>
diff --git a/linux-user/microblaze/cpu_loop.c b/linux-user/microblaze/cpu_l=
oop.c<br>
index 1a2556be2c5f..5ccf9e942eaa 100644<br>
--- a/linux-user/microblaze/cpu_loop.c<br>
+++ b/linux-user/microblaze/cpu_loop.c<br>
@@ -18,7 +18,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qemu.h&quot;<br>
=C2=A0#include &quot;user-internals.h&quot;<br>
=C2=A0#include &quot;cpu_loop-common.h&quot;<br>
diff --git a/linux-user/mips/cpu_loop.c b/linux-user/mips/cpu_loop.c<br>
index 9bb12a07ba08..d5c1c7941d34 100644<br>
--- a/linux-user/mips/cpu_loop.c<br>
+++ b/linux-user/mips/cpu_loop.c<br>
@@ -18,7 +18,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qemu.h&quot;<br>
=C2=A0#include &quot;user-internals.h&quot;<br>
=C2=A0#include &quot;cpu_loop-common.h&quot;<br>
diff --git a/linux-user/openrisc/cpu_loop.c b/linux-user/openrisc/cpu_loop.=
c<br>
index 7683bea0649e..a7aa586c8f96 100644<br>
--- a/linux-user/openrisc/cpu_loop.c<br>
+++ b/linux-user/openrisc/cpu_loop.c<br>
@@ -18,7 +18,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qemu.h&quot;<br>
=C2=A0#include &quot;user-internals.h&quot;<br>
=C2=A0#include &quot;cpu_loop-common.h&quot;<br>
diff --git a/linux-user/ppc/cpu_loop.c b/linux-user/ppc/cpu_loop.c<br>
index b468f199e4d2..02204ad8bebb 100644<br>
--- a/linux-user/ppc/cpu_loop.c<br>
+++ b/linux-user/ppc/cpu_loop.c<br>
@@ -18,7 +18,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qemu.h&quot;<br>
=C2=A0#include &quot;qemu/timer.h&quot;<br>
=C2=A0#include &quot;user-internals.h&quot;<br>
diff --git a/linux-user/riscv/cpu_loop.c b/linux-user/riscv/cpu_loop.c<br>
index 26d446f32379..29084c142196 100644<br>
--- a/linux-user/riscv/cpu_loop.c<br>
+++ b/linux-user/riscv/cpu_loop.c<br>
@@ -18,7 +18,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qemu/error-report.h&quot;<br>
=C2=A0#include &quot;qemu.h&quot;<br>
=C2=A0#include &quot;user-internals.h&quot;<br>
diff --git a/linux-user/s390x/cpu_loop.c b/linux-user/s390x/cpu_loop.c<br>
index 7901dfe6f518..285bc60071a8 100644<br>
--- a/linux-user/s390x/cpu_loop.c<br>
+++ b/linux-user/s390x/cpu_loop.c<br>
@@ -18,7 +18,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qemu.h&quot;<br>
=C2=A0#include &quot;user-internals.h&quot;<br>
=C2=A0#include &quot;cpu_loop-common.h&quot;<br>
diff --git a/linux-user/sh4/cpu_loop.c b/linux-user/sh4/cpu_loop.c<br>
index 1bd313cb19a2..c805f9db1104 100644<br>
--- a/linux-user/sh4/cpu_loop.c<br>
+++ b/linux-user/sh4/cpu_loop.c<br>
@@ -18,7 +18,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qemu.h&quot;<br>
=C2=A0#include &quot;user-internals.h&quot;<br>
=C2=A0#include &quot;cpu_loop-common.h&quot;<br>
diff --git a/linux-user/sparc/cpu_loop.c b/linux-user/sparc/cpu_loop.c<br>
index baf3d9ae011f..434c90a55f8f 100644<br>
--- a/linux-user/sparc/cpu_loop.c<br>
+++ b/linux-user/sparc/cpu_loop.c<br>
@@ -18,7 +18,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qemu.h&quot;<br>
=C2=A0#include &quot;user-internals.h&quot;<br>
=C2=A0#include &quot;cpu_loop-common.h&quot;<br>
diff --git a/linux-user/uname.c b/linux-user/uname.c<br>
index 0856783b2190..415fdf31b62d 100644<br>
--- a/linux-user/uname.c<br>
+++ b/linux-user/uname.c<br>
@@ -21,7 +21,6 @@<br>
<br>
=C2=A0#include &quot;qemu.h&quot;<br>
=C2=A0#include &quot;user-internals.h&quot;<br>
-//#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;uname.h&quot;<br>
<br>
=C2=A0/* return highest utsname machine name for emulated instruction set<b=
r>
diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c<br>
index 883cf1ca4bbf..5e7302cbb995 100644<br>
--- a/monitor/qmp-cmds.c<br>
+++ b/monitor/qmp-cmds.c<br>
@@ -14,7 +14,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qemu/cutils.h&quot;<br>
=C2=A0#include &quot;qemu/option.h&quot;<br>
=C2=A0#include &quot;monitor/monitor.h&quot;<br>
diff --git a/net/colo-compare.c b/net/colo-compare.c<br>
index 62554b5b3c8f..d5d096580577 100644<br>
--- a/net/colo-compare.c<br>
+++ b/net/colo-compare.c<br>
@@ -13,7 +13,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qemu/error-report.h&quot;<br>
=C2=A0#include &quot;trace.h&quot;<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
diff --git a/net/net.c b/net/net.c<br>
index 9f17ab204422..a094cf1d2929 100644<br>
--- a/net/net.c<br>
+++ b/net/net.c<br>
@@ -23,7 +23,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
<br>
=C2=A0#include &quot;net/net.h&quot;<br>
=C2=A0#include &quot;clients.h&quot;<br>
diff --git a/net/socket.c b/net/socket.c<br>
index c4b80e9228d7..ea5220a2eb51 100644<br>
--- a/net/socket.c<br>
+++ b/net/socket.c<br>
@@ -27,7 +27,6 @@<br>
=C2=A0#include &quot;clients.h&quot;<br>
=C2=A0#include &quot;monitor/monitor.h&quot;<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qemu/error-report.h&quot;<br>
=C2=A0#include &quot;qemu/option.h&quot;<br>
=C2=A0#include &quot;qemu/sockets.h&quot;<br>
diff --git a/net/tap-bsd.c b/net/tap-bsd.c<br>
index e45a6d124eb6..7e65bd391f0b 100644<br>
--- a/net/tap-bsd.c<br>
+++ b/net/tap-bsd.c<br>
@@ -23,7 +23,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
=C2=A0#include &quot;tap_int.h&quot;<br>
=C2=A0#include &quot;qemu/cutils.h&quot;<br>
diff --git a/net/tap-linux.c b/net/tap-linux.c<br>
index 5e70b9303710..3e24d232e782 100644<br>
--- a/net/tap-linux.c<br>
+++ b/net/tap-linux.c<br>
@@ -24,7 +24,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;tap_int.h&quot;<br>
=C2=A0#include &quot;tap-linux.h&quot;<br>
=C2=A0#include &quot;net/tap.h&quot;<br>
diff --git a/net/tap-solaris.c b/net/tap-solaris.c<br>
index d85224242b30..79919785c9f6 100644<br>
--- a/net/tap-solaris.c<br>
+++ b/net/tap-solaris.c<br>
@@ -27,7 +27,6 @@<br>
=C2=A0#include &quot;tap_int.h&quot;<br>
=C2=A0#include &quot;qemu/ctype.h&quot;<br>
=C2=A0#include &quot;qemu/cutils.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
<br>
=C2=A0#include &lt;sys/ethernet.h&gt;<br>
=C2=A0#include &lt;sys/sockio.h&gt;<br>
diff --git a/net/tap-win32.c b/net/tap-win32.c<br>
index 6096972f5d47..7466f22e77a4 100644<br>
--- a/net/tap-win32.c<br>
+++ b/net/tap-win32.c<br>
@@ -29,7 +29,6 @@<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
=C2=A0#include &quot;tap_int.h&quot;<br>
<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;clients.h&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 /* net_init_tap */<br>
=C2=A0#include &quot;net/eth.h&quot;<br>
=C2=A0#include &quot;net/net.h&quot;<br>
diff --git a/net/tap.c b/net/tap.c<br>
index c5cbeaa7a2be..6190fa699d2f 100644<br>
--- a/net/tap.c<br>
+++ b/net/tap.c<br>
@@ -38,7 +38,6 @@<br>
=C2=A0#include &quot;monitor/monitor.h&quot;<br>
=C2=A0#include &quot;sysemu/sysemu.h&quot;<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qemu/cutils.h&quot;<br>
=C2=A0#include &quot;qemu/error-report.h&quot;<br>
=C2=A0#include &quot;qemu/main-loop.h&quot;<br>
diff --git a/net/vde.c b/net/vde.c<br>
index 99189cccb694..1083916bcf52 100644<br>
--- a/net/vde.c<br>
+++ b/net/vde.c<br>
@@ -27,7 +27,6 @@<br>
<br>
=C2=A0#include &quot;net/net.h&quot;<br>
=C2=A0#include &quot;clients.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qemu/option.h&quot;<br>
=C2=A0#include &quot;qemu/main-loop.h&quot;<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
diff --git a/os-posix.c b/os-posix.c<br>
index 24692c8593f3..ee765f047dea 100644<br>
--- a/os-posix.c<br>
+++ b/os-posix.c<br>
@@ -29,7 +29,6 @@<br>
=C2=A0#include &lt;grp.h&gt;<br>
=C2=A0#include &lt;libgen.h&gt;<br>
<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0/* Needed early for CONFIG_BSD etc. */<br>
=C2=A0#include &quot;net/slirp.h&quot;<br>
=C2=A0#include &quot;qemu/qemu-options.h&quot;<br>
diff --git a/os-win32.c b/os-win32.c<br>
index 6f21b578417c..725ad652e8bb 100644<br>
--- a/os-win32.c<br>
+++ b/os-win32.c<br>
@@ -26,7 +26,6 @@<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
=C2=A0#include &lt;windows.h&gt;<br>
=C2=A0#include &lt;mmsystem.h&gt;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;sysemu/runstate.h&quot;<br>
<br>
=C2=A0static BOOL WINAPI qemu_ctrl_handler(DWORD type)<br>
diff --git a/page-vary-common.c b/page-vary-common.c<br>
index 91755564985c..ab77672dd412 100644<br>
--- a/page-vary-common.c<br>
+++ b/page-vary-common.c<br>
@@ -20,7 +20,6 @@<br>
=C2=A0#define IN_PAGE_VARY 1<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;exec/page-vary.h&quot;<br>
<br>
=C2=A0/* WARNING: This file must *not* be complied with -flto. */<br>
diff --git a/qga/commands-posix.c b/qga/commands-posix.c<br>
index 4d7a2392c097..9924277c826e 100644<br>
--- a/qga/commands-posix.c<br>
+++ b/qga/commands-posix.c<br>
@@ -16,7 +16,6 @@<br>
=C2=A0#include &lt;sys/utsname.h&gt;<br>
=C2=A0#include &lt;sys/wait.h&gt;<br>
=C2=A0#include &lt;dirent.h&gt;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;guest-agent-core.h&quot;<br>
=C2=A0#include &quot;qga-qapi-commands.h&quot;<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
diff --git a/softmmu/cpu-throttle.c b/softmmu/cpu-throttle.c<br>
index 8c2144ab95cc..d9bb30a223d8 100644<br>
--- a/softmmu/cpu-throttle.c<br>
+++ b/softmmu/cpu-throttle.c<br>
@@ -23,7 +23,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qemu/thread.h&quot;<br>
=C2=A0#include &quot;hw/core/cpu.h&quot;<br>
=C2=A0#include &quot;qemu/main-loop.h&quot;<br>
diff --git a/softmmu/cpu-timers.c b/softmmu/cpu-timers.c<br>
index 204d946a1729..117408cb83af 100644<br>
--- a/softmmu/cpu-timers.c<br>
+++ b/softmmu/cpu-timers.c<br>
@@ -23,7 +23,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qemu/cutils.h&quot;<br>
=C2=A0#include &quot;migration/vmstate.h&quot;<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
diff --git a/softmmu/cpus.c b/softmmu/cpus.c<br>
index 7b75bb66d5e6..668bef9b4d62 100644<br>
--- a/softmmu/cpus.c<br>
+++ b/softmmu/cpus.c<br>
@@ -23,7 +23,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;monitor/monitor.h&quot;<br>
=C2=A0#include &quot;qemu/coroutine-tls.h&quot;<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
diff --git a/softmmu/datadir.c b/softmmu/datadir.c<br>
index 504c4665bed7..160cac999a6f 100644<br>
--- a/softmmu/datadir.c<br>
+++ b/softmmu/datadir.c<br>
@@ -23,7 +23,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qemu/datadir.h&quot;<br>
=C2=A0#include &quot;qemu/cutils.h&quot;<br>
=C2=A0#include &quot;trace.h&quot;<br>
diff --git a/softmmu/icount.c b/softmmu/icount.c<br>
index 21341a4ce49e..5ca271620db6 100644<br>
--- a/softmmu/icount.c<br>
+++ b/softmmu/icount.c<br>
@@ -23,7 +23,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qemu/cutils.h&quot;<br>
=C2=A0#include &quot;migration/vmstate.h&quot;<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
diff --git a/softmmu/runstate.c b/softmmu/runstate.c<br>
index e0d869b21aa4..fac7b63259e8 100644<br>
--- a/softmmu/runstate.c<br>
+++ b/softmmu/runstate.c<br>
@@ -40,7 +40,6 @@<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
=C2=A0#include &quot;qapi/qapi-commands-run-state.h&quot;<br>
=C2=A0#include &quot;qapi/qapi-events-run-state.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qemu/error-report.h&quot;<br>
=C2=A0#include &quot;qemu/log.h&quot;<br>
=C2=A0#include &quot;qemu/job.h&quot;<br>
diff --git a/stubs/monitor-core.c b/stubs/monitor-core.c<br>
index d058a2a00d85..afa477aae656 100644<br>
--- a/stubs/monitor-core.c<br>
+++ b/stubs/monitor-core.c<br>
@@ -1,6 +1,5 @@<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
=C2=A0#include &quot;monitor/monitor.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qapi/qapi-emit-events.h&quot;<br>
<br>
=C2=A0Monitor *monitor_cur(void)<br>
diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c<br>
index 8c34f86792ed..567e296b21c9 100644<br>
--- a/target/arm/hvf/hvf.c<br>
+++ b/target/arm/hvf/hvf.c<br>
@@ -10,7 +10,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qemu/error-report.h&quot;<br>
<br>
=C2=A0#include &quot;sysemu/runstate.h&quot;<br>
diff --git a/target/arm/kvm.c b/target/arm/kvm.c<br>
index bbf1ce7ba3bc..5fc37ac10a5b 100644<br>
--- a/target/arm/kvm.c<br>
+++ b/target/arm/kvm.c<br>
@@ -13,7 +13,6 @@<br>
<br>
=C2=A0#include &lt;linux/kvm.h&gt;<br>
<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qemu/timer.h&quot;<br>
=C2=A0#include &quot;qemu/error-report.h&quot;<br>
=C2=A0#include &quot;qemu/main-loop.h&quot;<br>
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c<br>
index 9ec8875150d6..17dd2f77d9f5 100644<br>
--- a/target/arm/kvm64.c<br>
+++ b/target/arm/kvm64.c<br>
@@ -16,7 +16,6 @@<br>
=C2=A0#include &lt;linux/elf.h&gt;<br>
=C2=A0#include &lt;linux/kvm.h&gt;<br>
<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
=C2=A0#include &quot;cpu.h&quot;<br>
=C2=A0#include &quot;qemu/timer.h&quot;<br>
diff --git a/target/hexagon/gdbstub.c b/target/hexagon/gdbstub.c<br>
index 9c8c04c961b1..d152d01bfe7e 100644<br>
--- a/target/hexagon/gdbstub.c<br>
+++ b/target/hexagon/gdbstub.c<br>
@@ -16,7 +16,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;exec/gdbstub.h&quot;<br>
=C2=A0#include &quot;cpu.h&quot;<br>
=C2=A0#include &quot;internal.h&quot;<br>
diff --git a/target/i386/hax/hax-all.c b/target/i386/hax/hax-all.c<br>
index 81f665e21245..b185ee8de4fd 100644<br>
--- a/target/i386/hax/hax-all.c<br>
+++ b/target/i386/hax/hax-all.c<br>
@@ -27,7 +27,6 @@<br>
=C2=A0#include &quot;cpu.h&quot;<br>
=C2=A0#include &quot;exec/address-spaces.h&quot;<br>
<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qemu/accel.h&quot;<br>
=C2=A0#include &quot;sysemu/reset.h&quot;<br>
=C2=A0#include &quot;sysemu/runstate.h&quot;<br>
diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c<br>
index fc12c02fb217..f8833277ab6a 100644<br>
--- a/target/i386/hvf/hvf.c<br>
+++ b/target/i386/hvf/hvf.c<br>
@@ -47,7 +47,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qemu/error-report.h&quot;<br>
=C2=A0#include &quot;qemu/memalign.h&quot;<br>
<br>
diff --git a/target/i386/hvf/x86.c b/target/i386/hvf/x86.c<br>
index 91a3fe002c73..d086584f26d9 100644<br>
--- a/target/i386/hvf/x86.c<br>
+++ b/target/i386/hvf/x86.c<br>
@@ -19,7 +19,6 @@<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
<br>
=C2=A0#include &quot;cpu.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;x86_decode.h&quot;<br>
=C2=A0#include &quot;x86_emu.h&quot;<br>
=C2=A0#include &quot;vmcs.h&quot;<br>
diff --git a/target/i386/hvf/x86_cpuid.c b/target/i386/hvf/x86_cpuid.c<br>
index 32b0d131df86..f24dd50e48ff 100644<br>
--- a/target/i386/hvf/x86_cpuid.c<br>
+++ b/target/i386/hvf/x86_cpuid.c<br>
@@ -21,7 +21,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;cpu.h&quot;<br>
=C2=A0#include &quot;x86.h&quot;<br>
=C2=A0#include &quot;vmx.h&quot;<br>
diff --git a/target/i386/hvf/x86_decode.c b/target/i386/hvf/x86_decode.c<br=
>
index 062713b1a450..3728d7705e21 100644<br>
--- a/target/i386/hvf/x86_decode.c<br>
+++ b/target/i386/hvf/x86_decode.c<br>
@@ -18,7 +18,6 @@<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;panic.h&quot;<br>
=C2=A0#include &quot;x86_decode.h&quot;<br>
=C2=A0#include &quot;vmx.h&quot;<br>
diff --git a/target/i386/hvf/x86_descr.c b/target/i386/hvf/x86_descr.c<br>
index af15c06ac5db..a484942cfcd4 100644<br>
--- a/target/i386/hvf/x86_descr.c<br>
+++ b/target/i386/hvf/x86_descr.c<br>
@@ -18,7 +18,6 @@<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;vmx.h&quot;<br>
=C2=A0#include &quot;x86_descr.h&quot;<br>
<br>
diff --git a/target/i386/hvf/x86_emu.c b/target/i386/hvf/x86_emu.c<br>
index 050428795bbc..f5704f63e8da 100644<br>
--- a/target/i386/hvf/x86_emu.c<br>
+++ b/target/i386/hvf/x86_emu.c<br>
@@ -37,7 +37,6 @@<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
=C2=A0#include &quot;panic.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;x86_decode.h&quot;<br>
=C2=A0#include &quot;x86.h&quot;<br>
=C2=A0#include &quot;x86_emu.h&quot;<br>
diff --git a/target/i386/hvf/x86_flags.c b/target/i386/hvf/x86_flags.c<br>
index fecbca751770..03d6de5efc3e 100644<br>
--- a/target/i386/hvf/x86_flags.c<br>
+++ b/target/i386/hvf/x86_flags.c<br>
@@ -23,7 +23,6 @@<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;panic.h&quot;<br>
=C2=A0#include &quot;cpu.h&quot;<br>
=C2=A0#include &quot;x86_flags.h&quot;<br>
diff --git a/target/i386/hvf/x86_mmu.c b/target/i386/hvf/x86_mmu.c<br>
index df0b91cd4208..96d117567ee8 100644<br>
--- a/target/i386/hvf/x86_mmu.c<br>
+++ b/target/i386/hvf/x86_mmu.c<br>
@@ -18,7 +18,6 @@<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
=C2=A0#include &quot;panic.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;cpu.h&quot;<br>
=C2=A0#include &quot;x86.h&quot;<br>
=C2=A0#include &quot;x86_mmu.h&quot;<br>
diff --git a/target/i386/hvf/x86_task.c b/target/i386/hvf/x86_task.c<br>
index d24daf6a4110..beaeec068731 100644<br>
--- a/target/i386/hvf/x86_task.c<br>
+++ b/target/i386/hvf/x86_task.c<br>
@@ -8,7 +8,6 @@<br>
=C2=A0// GNU General Public License for more details.<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
=C2=A0#include &quot;panic.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qemu/error-report.h&quot;<br>
<br>
=C2=A0#include &quot;sysemu/hvf.h&quot;<br>
diff --git a/target/i386/hvf/x86hvf.c b/target/i386/hvf/x86hvf.c<br>
index bec9fc581463..69d4fb8cf555 100644<br>
--- a/target/i386/hvf/x86hvf.c<br>
+++ b/target/i386/hvf/x86hvf.c<br>
@@ -19,7 +19,6 @@<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;x86hvf.h&quot;<br>
=C2=A0#include &quot;vmx.h&quot;<br>
=C2=A0#include &quot;vmcs.h&quot;<br>
diff --git a/target/i386/kvm/sev-stub.c b/target/i386/kvm/sev-stub.c<br>
index 6080c007a2e4..1be5341e8a6a 100644<br>
--- a/target/i386/kvm/sev-stub.c<br>
+++ b/target/i386/kvm/sev-stub.c<br>
@@ -12,7 +12,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;sev.h&quot;<br>
<br>
=C2=A0int sev_kvm_init(ConfidentialGuestSupport *cgs, Error **errp)<br>
diff --git a/target/i386/nvmm/nvmm-all.c b/target/i386/nvmm/nvmm-all.c<br>
index 9f940413318c..b75738ee9cdf 100644<br>
--- a/target/i386/nvmm/nvmm-all.c<br>
+++ b/target/i386/nvmm/nvmm-all.c<br>
@@ -11,7 +11,6 @@<br>
=C2=A0#include &quot;cpu.h&quot;<br>
=C2=A0#include &quot;exec/address-spaces.h&quot;<br>
=C2=A0#include &quot;exec/ioport.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qemu/accel.h&quot;<br>
=C2=A0#include &quot;sysemu/nvmm.h&quot;<br>
=C2=A0#include &quot;sysemu/cpus.h&quot;<br>
diff --git a/target/i386/whpx/whpx-all.c b/target/i386/whpx/whpx-all.c<br>
index 68a4ebe909ad..5560a22ea5c2 100644<br>
--- a/target/i386/whpx/whpx-all.c<br>
+++ b/target/i386/whpx/whpx-all.c<br>
@@ -12,7 +12,6 @@<br>
=C2=A0#include &quot;cpu.h&quot;<br>
=C2=A0#include &quot;exec/address-spaces.h&quot;<br>
=C2=A0#include &quot;exec/ioport.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qemu/accel.h&quot;<br>
=C2=A0#include &quot;sysemu/whpx.h&quot;<br>
=C2=A0#include &quot;sysemu/cpus.h&quot;<br>
diff --git a/target/i386/whpx/whpx-apic.c b/target/i386/whpx/whpx-apic.c<br=
>
index bba36f3ec98f..c15df35ad60a 100644<br>
--- a/target/i386/whpx/whpx-apic.c<br>
+++ b/target/i386/whpx/whpx-apic.c<br>
@@ -11,7 +11,6 @@<br>
=C2=A0 * See the COPYING file in the top-level directory.<br>
=C2=A0 */<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;cpu.h&quot;<br>
=C2=A0#include &quot;hw/i386/apic_internal.h&quot;<br>
=C2=A0#include &quot;hw/i386/apic-msidef.h&quot;<br>
diff --git a/target/mips/kvm.c b/target/mips/kvm.c<br>
index 086debd9f013..caf70decd2a5 100644<br>
--- a/target/mips/kvm.c<br>
+++ b/target/mips/kvm.c<br>
@@ -14,7 +14,6 @@<br>
<br>
=C2=A0#include &lt;linux/kvm.h&gt;<br>
<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;cpu.h&quot;<br>
=C2=A0#include &quot;internal.h&quot;<br>
=C2=A0#include &quot;qemu/error-report.h&quot;<br>
diff --git a/target/nios2/nios2-semi.c b/target/nios2/nios2-semi.c<br>
index 5a7ad0c7108d..eda21c04434b 100644<br>
--- a/target/nios2/nios2-semi.c<br>
+++ b/target/nios2/nios2-semi.c<br>
@@ -28,7 +28,6 @@<br>
=C2=A0#if defined(CONFIG_USER_ONLY)<br>
=C2=A0#include &quot;qemu.h&quot;<br>
=C2=A0#else<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;exec/softmmu-semi.h&quot;<br>
=C2=A0#endif<br>
=C2=A0#include &quot;qemu/log.h&quot;<br>
diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c<br>
index 8644b85de847..f905a2af17a7 100644<br>
--- a/target/ppc/kvm.c<br>
+++ b/target/ppc/kvm.c<br>
@@ -21,7 +21,6 @@<br>
<br>
=C2=A0#include &lt;linux/kvm.h&gt;<br>
<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
=C2=A0#include &quot;qemu/error-report.h&quot;<br>
=C2=A0#include &quot;cpu.h&quot;<br>
diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c<br>
index e6b7cb6d4d5f..70b4cff06fbb 100644<br>
--- a/target/riscv/kvm.c<br>
+++ b/target/riscv/kvm.c<br>
@@ -21,7 +21,6 @@<br>
<br>
=C2=A0#include &lt;linux/kvm.h&gt;<br>
<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qemu/timer.h&quot;<br>
=C2=A0#include &quot;qemu/error-report.h&quot;<br>
=C2=A0#include &quot;qemu/main-loop.h&quot;<br>
diff --git a/target/rx/cpu.c b/target/rx/cpu.c<br>
index 25a4aa2976d3..fb30080ac4ea 100644<br>
--- a/target/rx/cpu.c<br>
+++ b/target/rx/cpu.c<br>
@@ -20,7 +20,6 @@<br>
=C2=A0#include &quot;qemu/qemu-print.h&quot;<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
=C2=A0#include &quot;cpu.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;migration/vmstate.h&quot;<br>
=C2=A0#include &quot;exec/exec-all.h&quot;<br>
=C2=A0#include &quot;hw/loader.h&quot;<br>
diff --git a/target/rx/gdbstub.c b/target/rx/gdbstub.c<br>
index c811d4810b45..7eb2059a841b 100644<br>
--- a/target/rx/gdbstub.c<br>
+++ b/target/rx/gdbstub.c<br>
@@ -16,7 +16,6 @@<br>
=C2=A0 * this program.=C2=A0 If not, see &lt;<a href=3D"http://www.gnu.org/=
licenses/" rel=3D"noreferrer" target=3D"_blank">http://www.gnu.org/licenses=
/</a>&gt;.<br>
=C2=A0 */<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;cpu.h&quot;<br>
=C2=A0#include &quot;exec/gdbstub.h&quot;<br>
<br>
diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c<br>
index 6acf14d5ecb4..53098bf54104 100644<br>
--- a/target/s390x/kvm/kvm.c<br>
+++ b/target/s390x/kvm/kvm.c<br>
@@ -24,7 +24,6 @@<br>
=C2=A0#include &lt;linux/kvm.h&gt;<br>
=C2=A0#include &lt;asm/ptrace.h&gt;<br>
<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;cpu.h&quot;<br>
=C2=A0#include &quot;s390x-internal.h&quot;<br>
=C2=A0#include &quot;kvm_s390x.h&quot;<br>
diff --git a/target/s390x/tcg/vec_fpu_helper.c b/target/s390x/tcg/vec_fpu_h=
elper.c<br>
index 1a779934715f..aa2cc8e4a6b5 100644<br>
--- a/target/s390x/tcg/vec_fpu_helper.c<br>
+++ b/target/s390x/tcg/vec_fpu_helper.c<br>
@@ -10,7 +10,6 @@<br>
=C2=A0 * See the COPYING file in the top-level directory.<br>
=C2=A0 */<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;cpu.h&quot;<br>
=C2=A0#include &quot;s390x-internal.h&quot;<br>
=C2=A0#include &quot;vec.h&quot;<br>
diff --git a/target/s390x/tcg/vec_int_helper.c b/target/s390x/tcg/vec_int_h=
elper.c<br>
index 5561b3ed9096..b44859ee1630 100644<br>
--- a/target/s390x/tcg/vec_int_helper.c<br>
+++ b/target/s390x/tcg/vec_int_helper.c<br>
@@ -10,7 +10,6 @@<br>
=C2=A0 * See the COPYING file in the top-level directory.<br>
=C2=A0 */<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;cpu.h&quot;<br>
=C2=A0#include &quot;vec.h&quot;<br>
=C2=A0#include &quot;exec/helper-proto.h&quot;<br>
diff --git a/target/s390x/tcg/vec_string_helper.c b/target/s390x/tcg/vec_st=
ring_helper.c<br>
index ac315eb095c1..f8b54bba4a9d 100644<br>
--- a/target/s390x/tcg/vec_string_helper.c<br>
+++ b/target/s390x/tcg/vec_string_helper.c<br>
@@ -10,7 +10,6 @@<br>
=C2=A0 * See the COPYING file in the top-level directory.<br>
=C2=A0 */<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;cpu.h&quot;<br>
=C2=A0#include &quot;s390x-internal.h&quot;<br>
=C2=A0#include &quot;vec.h&quot;<br>
diff --git a/target/tricore/gdbstub.c b/target/tricore/gdbstub.c<br>
index 3ce55abb8e3b..ebf32defde3a 100644<br>
--- a/target/tricore/gdbstub.c<br>
+++ b/target/tricore/gdbstub.c<br>
@@ -18,7 +18,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;exec/gdbstub.h&quot;<br>
<br>
<br>
diff --git a/target/xtensa/core-de233_fpu.c b/target/xtensa/core-de233_fpu.=
c<br>
index c7cbeb1b4834..41af8057fbb9 100644<br>
--- a/target/xtensa/core-de233_fpu.c<br>
+++ b/target/xtensa/core-de233_fpu.c<br>
@@ -28,7 +28,6 @@<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
=C2=A0#include &quot;cpu.h&quot;<br>
=C2=A0#include &quot;exec/gdbstub.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qemu/host-utils.h&quot;<br>
<br>
=C2=A0#include &quot;core-de233_fpu/core-isa.h&quot;<br>
diff --git a/target/xtensa/core-dsp3400.c b/target/xtensa/core-dsp3400.c<br=
>
index 4e0bc8a8c46c..81e425c56828 100644<br>
--- a/target/xtensa/core-dsp3400.c<br>
+++ b/target/xtensa/core-dsp3400.c<br>
@@ -28,7 +28,6 @@<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
=C2=A0#include &quot;cpu.h&quot;<br>
=C2=A0#include &quot;exec/gdbstub.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qemu/host-utils.h&quot;<br>
<br>
=C2=A0#include &quot;core-dsp3400/core-isa.h&quot;<br>
diff --git a/target/xtensa/core-test_mmuhifi_c3.c b/target/xtensa/core-test=
_mmuhifi_c3.c<br>
index 123c630b0da7..c0e5d32d1e47 100644<br>
--- a/target/xtensa/core-test_mmuhifi_c3.c<br>
+++ b/target/xtensa/core-test_mmuhifi_c3.c<br>
@@ -28,7 +28,6 @@<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
=C2=A0#include &quot;cpu.h&quot;<br>
=C2=A0#include &quot;exec/gdbstub.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qemu/host-utils.h&quot;<br>
<br>
=C2=A0#include &quot;core-test_mmuhifi_c3/core-isa.h&quot;<br>
diff --git a/tcg/tci.c b/tcg/tci.c<br>
index fe92b5d0844b..bdfac83492dd 100644<br>
--- a/tcg/tci.c<br>
+++ b/tcg/tci.c<br>
@@ -18,7 +18,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;tcg/tcg.h&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0/* MAX_OPC_PARAM_IARGS */<br>
=C2=A0#include &quot;exec/cpu_ldst.h&quot;<br>
=C2=A0#include &quot;tcg/tcg-op.h&quot;<br>
diff --git a/tests/qtest/acpi-utils.c b/tests/qtest/acpi-utils.c<br>
index 766c48e3a6a4..673fc975862c 100644<br>
--- a/tests/qtest/acpi-utils.c<br>
+++ b/tests/qtest/acpi-utils.c<br>
@@ -14,7 +14,6 @@<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
=C2=A0#include &lt;glib/gstdio.h&gt;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qemu/bitmap.h&quot;<br>
=C2=A0#include &quot;acpi-utils.h&quot;<br>
=C2=A0#include &quot;boot-sector.h&quot;<br>
diff --git a/tests/qtest/ahci-test.c b/tests/qtest/ahci-test.c<br>
index 8073ccc20521..aff5f3f79776 100644<br>
--- a/tests/qtest/ahci-test.c<br>
+++ b/tests/qtest/ahci-test.c<br>
@@ -30,7 +30,6 @@<br>
=C2=A0#include &quot;libqos/ahci.h&quot;<br>
=C2=A0#include &quot;libqos/pci-pc.h&quot;<br>
<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qapi/qmp/qdict.h&quot;<br>
=C2=A0#include &quot;qemu/host-utils.h&quot;<br>
<br>
diff --git a/tests/qtest/aspeed_hace-test.c b/tests/qtest/aspeed_hace-test.=
c<br>
index 09ee31545e41..58aa22014d04 100644<br>
--- a/tests/qtest/aspeed_hace-test.c<br>
+++ b/tests/qtest/aspeed_hace-test.c<br>
@@ -8,7 +8,6 @@<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
<br>
=C2=A0#include &quot;libqos/libqtest.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qemu/bitops.h&quot;<br>
<br>
=C2=A0#define HACE_CMD=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A00x10<br>
diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.=
c<br>
index c4a2d1e1664b..5dddedabcdde 100644<br>
--- a/tests/qtest/bios-tables-test.c<br>
+++ b/tests/qtest/bios-tables-test.c<br>
@@ -57,7 +57,6 @@<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
=C2=A0#include &lt;glib/gstdio.h&gt;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;hw/firmware/smbios.h&quot;<br>
=C2=A0#include &quot;qemu/bitmap.h&quot;<br>
=C2=A0#include &quot;acpi-utils.h&quot;<br>
diff --git a/tests/qtest/boot-sector.c b/tests/qtest/boot-sector.c<br>
index ea8f264661c3..9d9825bc8145 100644<br>
--- a/tests/qtest/boot-sector.c<br>
+++ b/tests/qtest/boot-sector.c<br>
@@ -12,7 +12,6 @@<br>
=C2=A0 */<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
=C2=A0#include &quot;boot-sector.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;libqos/libqtest.h&quot;<br>
<br>
=C2=A0#define LOW(x) ((x) &amp; 0xff)<br>
diff --git a/tests/qtest/cpu-plug-test.c b/tests/qtest/cpu-plug-test.c<br>
index a1c689414be5..7f5dd5f85a78 100644<br>
--- a/tests/qtest/cpu-plug-test.c<br>
+++ b/tests/qtest/cpu-plug-test.c<br>
@@ -9,7 +9,6 @@<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;libqtest-single.h&quot;<br>
=C2=A0#include &quot;qapi/qmp/qdict.h&quot;<br>
=C2=A0#include &quot;qapi/qmp/qlist.h&quot;<br>
diff --git a/tests/qtest/dbus-display-test.c b/tests/qtest/dbus-display-tes=
t.c<br>
index 43c77aff045c..81043162dfdd 100644<br>
--- a/tests/qtest/dbus-display-test.c<br>
+++ b/tests/qtest/dbus-display-test.c<br>
@@ -3,7 +3,6 @@<br>
=C2=A0#include &lt;gio/gio.h&gt;<br>
=C2=A0#include &lt;gio/gunixfdlist.h&gt;<br>
=C2=A0#include &quot;libqos/libqtest.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;dbus-display1.h&quot;<br>
<br>
=C2=A0static GDBusConnection*<br>
diff --git a/tests/qtest/dbus-vmstate-test.c b/tests/qtest/dbus-vmstate-tes=
t.c<br>
index aca9b98b7a35..a8acab763f5d 100644<br>
--- a/tests/qtest/dbus-vmstate-test.c<br>
+++ b/tests/qtest/dbus-vmstate-test.c<br>
@@ -2,7 +2,6 @@<br>
=C2=A0#include &lt;glib/gstdio.h&gt;<br>
=C2=A0#include &lt;gio/gio.h&gt;<br>
=C2=A0#include &quot;libqos/libqtest.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;dbus-vmstate1.h&quot;<br>
=C2=A0#include &quot;migration-helpers.h&quot;<br>
<br>
diff --git a/tests/qtest/device-introspect-test.c b/tests/qtest/device-intr=
ospect-test.c<br>
index bbec166dbc2f..adf39b2518e8 100644<br>
--- a/tests/qtest/device-introspect-test.c<br>
+++ b/tests/qtest/device-introspect-test.c<br>
@@ -18,7 +18,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qapi/qmp/qstring.h&quot;<br>
=C2=A0#include &quot;qapi/qmp/qdict.h&quot;<br>
=C2=A0#include &quot;qapi/qmp/qlist.h&quot;<br>
diff --git a/tests/qtest/e1000e-test.c b/tests/qtest/e1000e-test.c<br>
index e648fdd409cd..ddd6983ede14 100644<br>
--- a/tests/qtest/e1000e-test.c<br>
+++ b/tests/qtest/e1000e-test.c<br>
@@ -25,9 +25,7 @@<br>
<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;libqtest-single.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;libqos/pci-pc.h&quot;<br>
=C2=A0#include &quot;qemu/sockets.h&quot;<br>
=C2=A0#include &quot;qemu/iov.h&quot;<br>
diff --git a/tests/qtest/erst-test.c b/tests/qtest/erst-test.c<br>
index f94cd8dd8e05..a0adc35bef7f 100644<br>
--- a/tests/qtest/erst-test.c<br>
+++ b/tests/qtest/erst-test.c<br>
@@ -11,7 +11,6 @@<br>
=C2=A0#include &lt;glib/gstdio.h&gt;<br>
=C2=A0#include &quot;libqos/libqos-pc.h&quot;<br>
=C2=A0#include &quot;libqos/libqtest.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
<br>
=C2=A0#include &quot;hw/pci/pci.h&quot;<br>
<br>
diff --git a/tests/qtest/fdc-test.c b/tests/qtest/fdc-test.c<br>
index b0d40012e6a9..4aa72f36431f 100644<br>
--- a/tests/qtest/fdc-test.c<br>
+++ b/tests/qtest/fdc-test.c<br>
@@ -27,7 +27,6 @@<br>
<br>
=C2=A0#include &quot;libqtest-single.h&quot;<br>
=C2=A0#include &quot;qapi/qmp/qdict.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
<br>
=C2=A0/* TODO actually test the results and get rid of this */<br>
=C2=A0#define qmp_discard_response(...) qobject_unref(qmp(__VA_ARGS__))<br>
diff --git a/tests/qtest/fuzz/qos_fuzz.c b/tests/qtest/fuzz/qos_fuzz.c<br>
index 7a244c951e5e..dc891d838b6a 100644<br>
--- a/tests/qtest/fuzz/qos_fuzz.c<br>
+++ b/tests/qtest/fuzz/qos_fuzz.c<br>
@@ -19,7 +19,6 @@<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
=C2=A0#include &quot;qemu/units.h&quot;<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;exec/memory.h&quot;<br>
=C2=A0#include &quot;qemu/main-loop.h&quot;<br>
<br>
diff --git a/tests/qtest/hd-geo-test.c b/tests/qtest/hd-geo-test.c<br>
index 64023c057408..da9c4c2792de 100644<br>
--- a/tests/qtest/hd-geo-test.c<br>
+++ b/tests/qtest/hd-geo-test.c<br>
@@ -16,7 +16,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qemu/bswap.h&quot;<br>
=C2=A0#include &quot;qapi/qmp/qlist.h&quot;<br>
=C2=A0#include &quot;libqos/libqtest.h&quot;<br>
diff --git a/tests/qtest/ide-test.c b/tests/qtest/ide-test.c<br>
index 19de3b410405..b7243a17b11d 100644<br>
--- a/tests/qtest/ide-test.c<br>
+++ b/tests/qtest/ide-test.c<br>
@@ -30,7 +30,6 @@<br>
=C2=A0#include &quot;libqos/pci-pc.h&quot;<br>
=C2=A0#include &quot;libqos/malloc-pc.h&quot;<br>
=C2=A0#include &quot;qapi/qmp/qdict.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qemu/bswap.h&quot;<br>
=C2=A0#include &quot;hw/pci/pci_ids.h&quot;<br>
=C2=A0#include &quot;hw/pci/pci_regs.h&quot;<br>
diff --git a/tests/qtest/ipmi-bt-test.c b/tests/qtest/ipmi-bt-test.c<br>
index 19612e9405ae..ed431e34e68d 100644<br>
--- a/tests/qtest/ipmi-bt-test.c<br>
+++ b/tests/qtest/ipmi-bt-test.c<br>
@@ -31,7 +31,6 @@<br>
<br>
<br>
=C2=A0#include &quot;libqtest-single.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
<br>
=C2=A0#define IPMI_IRQ=C2=A0 =C2=A0 =C2=A0 =C2=A0 5<br>
<br>
diff --git a/tests/qtest/ivshmem-test.c b/tests/qtest/ivshmem-test.c<br>
index 4e8af42a9d04..95628a418579 100644<br>
--- a/tests/qtest/ivshmem-test.c<br>
+++ b/tests/qtest/ivshmem-test.c<br>
@@ -14,7 +14,6 @@<br>
=C2=A0#include &quot;libqos/libqos-pc.h&quot;<br>
=C2=A0#include &quot;libqos/libqos-spapr.h&quot;<br>
=C2=A0#include &quot;libqos/libqtest.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
<br>
=C2=A0#define TMPSHMSIZE (1 &lt;&lt; 20)<br>
=C2=A0static char *tmpshm;<br>
diff --git a/tests/qtest/libqos/ahci.c b/tests/qtest/libqos/ahci.c<br>
index eaa2096512e5..41c4be5efa93 100644<br>
--- a/tests/qtest/libqos/ahci.c<br>
+++ b/tests/qtest/libqos/ahci.c<br>
@@ -28,7 +28,6 @@<br>
=C2=A0#include &quot;ahci.h&quot;<br>
=C2=A0#include &quot;pci-pc.h&quot;<br>
<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qemu/host-utils.h&quot;<br>
<br>
=C2=A0#include &quot;hw/pci/pci_ids.h&quot;<br>
diff --git a/tests/qtest/libqos/malloc-pc.c b/tests/qtest/libqos/malloc-pc.=
c<br>
index f1e3b392a53c..bbd1b4827e54 100644<br>
--- a/tests/qtest/libqos/malloc-pc.c<br>
+++ b/tests/qtest/libqos/malloc-pc.c<br>
@@ -16,8 +16,6 @@<br>
<br>
=C2=A0#include &quot;standard-headers/linux/qemu_fw_cfg.h&quot;<br>
<br>
-#include &quot;qemu-common.h&quot;<br>
-<br>
=C2=A0#define ALLOC_PAGE_SIZE (4096)<br>
<br>
=C2=A0void pc_alloc_init(QGuestAllocator *s, QTestState *qts, QAllocOpts fl=
ags)<br>
diff --git a/tests/qtest/libqos/malloc-spapr.c b/tests/qtest/libqos/malloc-=
spapr.c<br>
index 05b306c191d3..d90ed3c51d7d 100644<br>
--- a/tests/qtest/libqos/malloc-spapr.c<br>
+++ b/tests/qtest/libqos/malloc-spapr.c<br>
@@ -8,8 +8,6 @@<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
=C2=A0#include &quot;malloc-spapr.h&quot;<br>
<br>
-#include &quot;qemu-common.h&quot;<br>
-<br>
=C2=A0#define SPAPR_PAGE_SIZE 4096<br>
<br>
=C2=A0/* Memory must be a multiple of 256 MB,<br>
diff --git a/tests/qtest/libqos/malloc.c b/tests/qtest/libqos/malloc.c<br>
index f708b0143262..f0c8f950c805 100644<br>
--- a/tests/qtest/libqos/malloc.c<br>
+++ b/tests/qtest/libqos/malloc.c<br>
@@ -12,7 +12,6 @@<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
=C2=A0#include &quot;malloc.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qemu/host-utils.h&quot;<br>
<br>
=C2=A0typedef struct MemBlock {<br>
diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c<br>
index dc5566ccfd60..7b5890dcc487 100644<br>
--- a/tests/qtest/libqtest.c<br>
+++ b/tests/qtest/libqtest.c<br>
@@ -21,7 +21,6 @@<br>
=C2=A0#include &lt;sys/un.h&gt;<br>
<br>
=C2=A0#include &quot;libqos/libqtest.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qemu/ctype.h&quot;<br>
=C2=A0#include &quot;qemu/cutils.h&quot;<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
diff --git a/tests/qtest/machine-none-test.c b/tests/qtest/machine-none-tes=
t.c<br>
index 138101b46ac2..8ca18074b9f9 100644<br>
--- a/tests/qtest/machine-none-test.c<br>
+++ b/tests/qtest/machine-none-test.c<br>
@@ -12,7 +12,6 @@<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qemu/cutils.h&quot;<br>
=C2=A0#include &quot;libqos/libqtest.h&quot;<br>
=C2=A0#include &quot;qapi/qmp/qdict.h&quot;<br>
diff --git a/tests/qtest/npcm7xx_emc-test.c b/tests/qtest/npcm7xx_emc-test.=
c<br>
index 7c435ac91576..a353fef0ca13 100644<br>
--- a/tests/qtest/npcm7xx_emc-test.c<br>
+++ b/tests/qtest/npcm7xx_emc-test.c<br>
@@ -15,7 +15,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;libqos/libqos.h&quot;<br>
=C2=A0#include &quot;qapi/qmp/qdict.h&quot;<br>
=C2=A0#include &quot;qapi/qmp/qnum.h&quot;<br>
diff --git a/tests/qtest/pxe-test.c b/tests/qtest/pxe-test.c<br>
index 32bbae33c597..3cb47d2c5496 100644<br>
--- a/tests/qtest/pxe-test.c<br>
+++ b/tests/qtest/pxe-test.c<br>
@@ -14,7 +14,6 @@<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
=C2=A0#include &lt;glib/gstdio.h&gt;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;libqos/libqtest.h&quot;<br>
=C2=A0#include &quot;boot-sector.h&quot;<br>
=C2=A0#include &quot;libqos/libqos-spapr.h&quot;<br>
diff --git a/tests/qtest/qom-test.c b/tests/qtest/qom-test.c<br>
index eb34af843b79..6b162e12b5aa 100644<br>
--- a/tests/qtest/qom-test.c<br>
+++ b/tests/qtest/qom-test.c<br>
@@ -9,7 +9,6 @@<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qapi/qmp/qdict.h&quot;<br>
=C2=A0#include &quot;qapi/qmp/qlist.h&quot;<br>
=C2=A0#include &quot;qemu/cutils.h&quot;<br>
diff --git a/tests/qtest/rtl8139-test.c b/tests/qtest/rtl8139-test.c<br>
index 450604926492..8fa3313cc333 100644<br>
--- a/tests/qtest/rtl8139-test.c<br>
+++ b/tests/qtest/rtl8139-test.c<br>
@@ -11,7 +11,6 @@<br>
=C2=A0#include &quot;libqtest-single.h&quot;<br>
=C2=A0#include &quot;libqos/pci-pc.h&quot;<br>
=C2=A0#include &quot;qemu/timer.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
<br>
=C2=A0/* Tests only initialization so far. TODO: Replace with functional te=
sts */<br>
=C2=A0static void nop(void)<br>
diff --git a/tests/qtest/test-filter-mirror.c b/tests/qtest/test-filter-mir=
ror.c<br>
index da4f94de727a..fdf66cebd62f 100644<br>
--- a/tests/qtest/test-filter-mirror.c<br>
+++ b/tests/qtest/test-filter-mirror.c<br>
@@ -9,7 +9,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;libqos/libqtest.h&quot;<br>
=C2=A0#include &quot;qapi/qmp/qdict.h&quot;<br>
=C2=A0#include &quot;qemu/iov.h&quot;<br>
diff --git a/tests/qtest/test-filter-redirector.c b/tests/qtest/test-filter=
-redirector.c<br>
index fc16cf7e8d5f..339d3c04cedc 100644<br>
--- a/tests/qtest/test-filter-redirector.c<br>
+++ b/tests/qtest/test-filter-redirector.c<br>
@@ -51,7 +51,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;libqos/libqtest.h&quot;<br>
=C2=A0#include &quot;qapi/qmp/qdict.h&quot;<br>
=C2=A0#include &quot;qemu/iov.h&quot;<br>
diff --git a/tests/qtest/test-x86-cpuid-compat.c b/tests/qtest/test-x86-cpu=
id-compat.c<br>
index 39138db7744b..b39c9055b309 100644<br>
--- a/tests/qtest/test-x86-cpuid-compat.c<br>
+++ b/tests/qtest/test-x86-cpuid-compat.c<br>
@@ -1,5 +1,4 @@<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qapi/qmp/qdict.h&quot;<br>
=C2=A0#include &quot;qapi/qmp/qlist.h&quot;<br>
=C2=A0#include &quot;qapi/qmp/qnum.h&quot;<br>
diff --git a/tests/qtest/virtio-net-test.c b/tests/qtest/virtio-net-test.c<=
br>
index a71395849f33..fc9f2b94982d 100644<br>
--- a/tests/qtest/virtio-net-test.c<br>
+++ b/tests/qtest/virtio-net-test.c<br>
@@ -8,7 +8,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;libqtest-single.h&quot;<br>
=C2=A0#include &quot;qemu/iov.h&quot;<br>
=C2=A0#include &quot;qemu/module.h&quot;<br>
diff --git a/tests/unit/check-qjson.c b/tests/unit/check-qjson.c<br>
index c845f91d4377..c4e0f851bfc6 100644<br>
--- a/tests/unit/check-qjson.c<br>
+++ b/tests/unit/check-qjson.c<br>
@@ -21,7 +21,6 @@<br>
=C2=A0#include &quot;qapi/qmp/qnum.h&quot;<br>
=C2=A0#include &quot;qapi/qmp/qstring.h&quot;<br>
=C2=A0#include &quot;qemu/unicode.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
<br>
=C2=A0static QString *from_json_str(const char *jstr, bool single, Error **=
errp)<br>
=C2=A0{<br>
diff --git a/tests/unit/check-qnull.c b/tests/unit/check-qnull.c<br>
index ebf21db83ccc..5ceacc65d7f3 100644<br>
--- a/tests/unit/check-qnull.c<br>
+++ b/tests/unit/check-qnull.c<br>
@@ -9,7 +9,6 @@<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
<br>
=C2=A0#include &quot;qapi/qmp/qnull.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qapi/qobject-input-visitor.h&quot;<br>
=C2=A0#include &quot;qapi/qobject-output-visitor.h&quot;<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
diff --git a/tests/unit/check-qnum.c b/tests/unit/check-qnum.c<br>
index b85fca23029e..bf7fe45bacc4 100644<br>
--- a/tests/unit/check-qnum.c<br>
+++ b/tests/unit/check-qnum.c<br>
@@ -15,7 +15,6 @@<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
<br>
=C2=A0#include &quot;qapi/qmp/qnum.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
<br>
=C2=A0/*<br>
=C2=A0 * Public Interface test-cases<br>
diff --git a/tests/unit/check-qobject.c b/tests/unit/check-qobject.c<br>
index 7903ebf4cf80..0ed094e55f3a 100644<br>
--- a/tests/unit/check-qobject.c<br>
+++ b/tests/unit/check-qobject.c<br>
@@ -15,7 +15,6 @@<br>
=C2=A0#include &quot;qapi/qmp/qnull.h&quot;<br>
=C2=A0#include &quot;qapi/qmp/qnum.h&quot;<br>
=C2=A0#include &quot;qapi/qmp/qstring.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
<br>
=C2=A0#include &lt;math.h&gt;<br>
<br>
diff --git a/tests/unit/check-qstring.c b/tests/unit/check-qstring.c<br>
index 4bf977209342..bd861f4f8b47 100644<br>
--- a/tests/unit/check-qstring.c<br>
+++ b/tests/unit/check-qstring.c<br>
@@ -12,7 +12,6 @@<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
<br>
=C2=A0#include &quot;qapi/qmp/qstring.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
<br>
=C2=A0/*<br>
=C2=A0 * Public Interface test-cases<br>
diff --git a/tests/unit/socket-helpers.c b/tests/unit/socket-helpers.c<br>
index ef31664d0224..0a9e090a68dd 100644<br>
--- a/tests/unit/socket-helpers.c<br>
+++ b/tests/unit/socket-helpers.c<br>
@@ -19,7 +19,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osde</blockquote></div></div>

--0000000000003679bd05dbe989a6--

