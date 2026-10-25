Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7CB1606A31A
	for <qemu-riscv@archiver.kernel.org>; Sun, 25 Oct 2026 08:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=hunKJo7r
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xKtYf-0006eX-Fq; Sun, 25 Oct 2026 04:26:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1xKtYb-0006do-AF
 for qemu-riscv@nongnu.org; Sun, 25 Oct 2026 04:26:21 -0400
Received: from mail-dy1-x132b.google.com ([2607:f8b0:4864:20::132b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1xKtYY-0000r5-UV
 for qemu-riscv@nongnu.org; Sun, 25 Oct 2026 04:26:20 -0400
Received: by mail-dy1-x132b.google.com with SMTP id
 5a478bee46e88-36661f953e4so3994668eec.1
 for <qemu-riscv@nongnu.org>; Sun, 25 Oct 2026 01:26:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792916775; cv=none;
 d=google.com; s=arc-20260327;
 b=iVL+OzteNvQQM2sqwGC2bEGKkDwJOxh4wTLLQmxv9+J+BYHfHpndee0E0pqt35XQ6h
 ilsmyzYVlof/AsjcD4KxSdlMvmhOholYWlujAFM/lIWkP+nBScL4WWgi8/261xTZM8sI
 6etsZpxk4ksWkEROc9mh+aWwS8R3iH6LLr7Mv+HMikTU1RWyZxo1aKVnv43NWl0XzCe4
 56y+KyKm3RBCip9jHX2cXvzOBQwpJF10oQT8rKvrcWwwANtoe1ChHc92lL9jX8AorP+0
 BsWcGUZhwqyzZj8//BM5fcBLaDTvMcCDBSo69vM0u1DlXd9HSUmXtbkAfgDGv3tVc8tw
 4G7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=ZnGa7SOHhZOD2c2MNAhv8nHktB8mtvvnR4wT5dbXRNU=;
 fh=yey4PySVT++eRmdZfJ5n/Y8sN6Tezyka7T5nc1tQwFQ=;
 b=liVzyEHZfDJsOlzlGH44oi34LidAfn08OHnJ0SZqRBlJ/k8qCmp8HZNLFlbSwfhWMW
 8PanTHA1NcyYvBMqTdHvmVlWz6lszKHPfoZGrb9/FZe3RktyFb1t2OmHr+oAjl3IOXQu
 hEU7cBC2VgEsC2d9T2wHFph5hf0wAJn7cjxbP+n/Dljhisix4kqkY4m9R1ASpNICb6WL
 DRAoqd2CBm4Pr+mbZUM7iZVhesWTOkisKhyznUYryYuEGxsay4JmAyo/9yYpQ21yiYmS
 BhEgnMbrvdwN7tZ/bVpOlRgLUdHC+FihAQ325c9Sff5k6waO5fDZrIqRBLgVU6oUUXhM
 fa7A==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; s=google; t=1792916775; x=1793521575; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=ZnGa7SOHhZOD2c2MNAhv8nHktB8mtvvnR4wT5dbXRNU=;
 b=hunKJo7rMqlh4IrUiVWQJtOkjWX6qSJDSc9+M2AcvR2zHfsWyxZoo7CeMRlnk0+Paw
 pe2rD+5e6V0jsUKaDTHnqdKSDUi7aSuxdgLr6A4pgPFaamfR9G3w0PBonZ5qzSfUQ10p
 7zyaroJRitBoAn7N4J3bqub6J0q8g915pAeO8AV0Eh7oYSBfiVjmLmNwjrZ/o0AH0raA
 SEnDeycu1KBX25ESiKmbrmhbynZyayDsinlYfSXhdfJEV6WP+EnB0rkhEI1imYM/JTpe
 1nrEk7xXBDyDsOsFW2g9Wn6NdIj87sefvpJjs1Z8fs4kzpaqde7UGtfiLijJ4jNrHPe0
 LbGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792916775; x=1793521575;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=ZnGa7SOHhZOD2c2MNAhv8nHktB8mtvvnR4wT5dbXRNU=;
 b=dv+h9l26b+rNsWxYwY9IftYEEEvaYCNCaev3AL7Qzp5x5DQmuXn150j4amuq7/uXxh
 yxvGFmpHWcSqNfIyGOByQicb3oGn/rQAgODNdEJAUn/PM3RApoWQKEB8x+Qfzg0pe0Df
 MVqXqvDZGSCekP88Xmlg27k1k1ZiKIXuGbmy0lTdaDYmtS1tQBv4m4K6nf52NDkH0kAI
 8nA6z4EjhDcQFGhU9ScFTLSBN0OvqMsUpsL1TWOz++XyFItpucp3FmIfU5DDDyQuPVrz
 xPdfhguHyaEHg8eH0lFL5o6enOeV737euWO1PQnKTg0WDjJfQSVIMnMvoILCOMjj6gLh
 9r+Q==
X-Forwarded-Encrypted: i=1;
 AKwUvBzK2/W39zVgtgKNjqkdQs3AC8sX1vSnjbc/Q4WoLDXRS/ysBbyfS/b53OgankdA2DvoXkUqT9Rmk55B@nongnu.org
X-Gm-Message-State: AFq9FYJKZMieIEG2NCW4mdda0LNVgzIpL7sJ2KilAiAdUeYMcSwxBcJO
 QkgWTa5T8RUP7MgMwvKR4n4AVY3t0asmwRypkRNmCg2cvO8PhBE1Uv5KfmgcKQRkvLvWGMuBVNP
 RHi4MU3/n7qSV+LwtxOaLDo2VxGJnTC8=
X-Gm-Gg: AYBFou3i3bwDOKZUWjxWP6Gj6ZStjh+MTsdcS4TsZtiWXsZNGy8xIMLqCTcaVjudylO
 E+hWOzPB6fECCoV0RE2VcNgKI/cfd/OhJGspf/I2Wv/OSnsYj7nbbohW27l022C7+FKNb1sGNGS
 r3GATp8YPwDEpGQnAK6PRQAVoEIfr2RhiEEPcmHEilzuE07wDO7Y9ona16iTmIMtTYVz8w8Er9V
 5byCQJsAD75X9+Brt33ZqLMJzhacAu836aaonwwooUn+j9dyfK4WwQC43qKXmUtermFg3Fq18gL
 s0H9q/It1hS0OTuIUu9eRrwHVefd4SNHbWsp9J9HJfIMQe5L89UbRIutiIkw/kMNkp4+qBvpFkA
 jAK0Cu0ZYnSQu9RPHqBaJSOkFG7QFVNowE3C0j2uNQXx6hvGTivA1Rzt2IF9WYKSrXOXA
X-Received: by 2002:a05:7301:1694:b0:368:da6c:4fb6 with SMTP id
 5a478bee46e88-369e84ba936mr7875483eec.18.1792916775387; Sun, 25 Oct 2026
 01:26:15 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261022-query-reg-v3-0-7ad902b9a7cf@redhat.com>
 <atzT-0QHYWByMhEg@gallifrey>
In-Reply-To: <atzT-0QHYWByMhEg@gallifrey>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Sun, 25 Oct 2026 12:26:03 +0400
X-Gm-Features: AclHuK8YlbKxm0tXouRrKwXKkmpePE2xkf6pIN5p4Y1ucRE-bI4KaKUftFUxkSw
Message-ID: <CAJ+F1CJWJc=5okkvBYuKhFjU4=iZGWECYmTMMFDbeawA-GGN7A@mail.gmail.com>
Subject: Re: [PATCH v3 00/18] monitor/hmp: replace MonitorDef with GDB
 registers
To: "Dr. David Alan Gilbert" <dave@treblig.org>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Zhao Liu <zhao1.liu@intel.com>, Peter Maydell <peter.maydell@linaro.org>, 
 Chinmay Rath <rathc@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, 
 Glenn Miles <milesg@linux.ibm.com>, Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Chao Liu <chao.liu@processmission.com>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <laurent@vivier.eu>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Helge Deller <deller@gmx.de>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::132b;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-dy1-x132b.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi

On Sat, Oct 24, 2026 at 7:52=E2=80=AFPM Dr. David Alan Gilbert <dave@trebli=
g.org> wrote:
>
> * Marc-Andr=C3=A9 Lureau (marcandre.lureau@redhat.com) wrote:
> > Hi,
> >
> > HMP monitor supports printing $register expression. The lookup
> > was done via GDB stub registers, and supplementary MonitorDef
> > HMP-specific tables.
>
> Why don't you get the first ~3 of these merged and then you can take the
> others through the individual targets at their own pace.

Because I am not a GDB stub or HMP maintainer. Should I send a PR
regardless for those? they can be reviewed & applied at a maintainer
pace. If you think it's too slow, I can agree :)

>
> Dave
>
> > Migrate HMP registers to use the GDB infrastructure and remove the
> > legacy HMP MonitorDef. Internal registers aren't exposed to GDB.
> > This also drops HMP $pc x86 fallback (use $eip/$rip instead).
> >
> > Known behavioural changes on RISC-V: CSR lookup is now case-sensitive
> > and vector registers now report "unkown register" instead of a
> > target-specific message ("Unable to print the value of vector vreg 'v0'
> > from this API")
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> > Changes in v3:
> > - added x86 GDB register patches
> >   - fix the x87 FPU tag word returned by the GDB stub
> >   - split SSE registers into a separate org.gnu.gdb.i386.sse feature
> >   - expose AVX/AVX-512 registers (ymm/zmm upper halves and opmask)
> >   - expose more system registers to HMP
> > - renamed i386-segments.xml to i386-system.xml and registered it as an
> >   internal feature, like the other targets
> > - moved the HMP $pc removal to its own patch and documented it in
> >   removed-features.rst
> > - moved each target's MonitorDef removal into its target patch; the fin=
al
> >   patch now only removes the generic MonitorDef infrastructure
> > - added MAINTAINERS entries
> > - rebased onto current master
> > - Link to v2: https://lore.kernel.org/qemu-devel/20261013-query-reg-v2-=
0-6f95a2e139a9@redhat.com
> >
> > Changes in v2:
> > - dropped v1 patch 5 (CPUClass::get_pc fallback for $pc)
> > - new patch gdb_register_internal_coprocessor() to hide registers from =
GDB
> > - SPARC64, m68k, RISC-V aliases now use internal registration
> > - pickup trailer tags
> > - Link to v1: https://lore.kernel.org/qemu-devel/20260911-query-reg-v1-=
0-0c04f0c02cf3@redhat.com
> >
> > ---
> > Marc-Andr=C3=A9 Lureau (18):
> >       hmp: don't crash on invalid register
> >       gdbstub: fix next register base after register gaps
> >       gdbstub: set feature->base_reg for dynamic features
> >       gdbstub: add gdb_register_internal_coprocessor()
> >       MAINTAINERS: cover x86 GDB XML files
> >       target/i386: expose segment limits register to monitors via gdbst=
ub
> >       target/i386: fix FPU tag word in GDB register read
> >       target/i386: split SSE registers into separate GDB feature
> >       target/i386: expose system registers to monitors via gdbstub
> >       target/i386: expose AVX/AVX-512 registers to GDB
> >       target/i386: drop HMP $pc
> >       MAINTAINERS: cover m68k GDB XML files
> >       target/m68k: expose system registers to monitors via gdbstub
> >       target/sparc64: expose system registers to monitors via gdbstub
> >       target/riscv: bypass smstateen check in debugger mode
> >       MAINTAINERS: cover riscv GDB XML files
> >       target/riscv: expose register aliases to monitors via gdbstub
> >       monitor/hmp: remove legacy MonitorDef infrastructure
> >
> >  MAINTAINERS                               |   4 +
> >  configs/targets/i386-bsd-user.mak         |   2 +-
> >  configs/targets/i386-linux-user.mak       |   2 +-
> >  configs/targets/i386-softmmu.mak          |   2 +-
> >  configs/targets/m68k-softmmu.mak          |   2 +-
> >  configs/targets/riscv32-linux-user.mak    |   2 +-
> >  configs/targets/riscv32-softmmu.mak       |   2 +-
> >  configs/targets/riscv64-bsd-user.mak      |   2 +-
> >  configs/targets/riscv64-linux-user.mak    |   2 +-
> >  configs/targets/riscv64-softmmu.mak       |   2 +-
> >  configs/targets/sparc64-softmmu.mak       |   2 +-
> >  configs/targets/x86_64-bsd-user.mak       |   2 +-
> >  configs/targets/x86_64-linux-user.mak     |   2 +-
> >  configs/targets/x86_64-softmmu.mak        |   2 +-
> >  docs/about/removed-features.rst           |   8 +
> >  gdbstub/gdb-xml/i386-32bit-avx.xml        |  20 ++
> >  gdbstub/gdb-xml/i386-32bit-avx512.xml     |  31 +++
> >  gdbstub/gdb-xml/i386-32bit-sse.xml        |  54 +++++
> >  gdbstub/gdb-xml/i386-32bit.xml            |  46 +---
> >  gdbstub/gdb-xml/i386-64bit-avx.xml        |  28 +++
> >  gdbstub/gdb-xml/i386-64bit-avx512.xml     | 108 +++++++++
> >  gdbstub/gdb-xml/i386-64bit-sse.xml        |  62 +++++
> >  gdbstub/gdb-xml/i386-64bit.xml            |  50 ----
> >  gdbstub/gdb-xml/i386-system.xml           |  53 +++++
> >  gdbstub/gdb-xml/m68k-system.xml           |  32 +++
> >  gdbstub/gdb-xml/riscv-32bit-alias.xml     | 105 +++++++++
> >  gdbstub/gdb-xml/riscv-32bit-fpu-alias.xml |  40 ++++
> >  gdbstub/gdb-xml/riscv-64bit-alias.xml     | 105 +++++++++
> >  gdbstub/gdb-xml/riscv-64bit-fpu-alias.xml |  46 ++++
> >  gdbstub/gdb-xml/sparc64-system.xml        |  22 ++
> >  gdbstub/gdbstub.c                         |  85 +++++--
> >  include/exec/gdbstub.h                    |  21 ++
> >  include/hw/core/cpu.h                     |   5 +-
> >  include/hw/core/sysemu-cpu-ops.h          |  16 --
> >  include/monitor/hmp.h                     |   6 -
> >  include/qemu/typedefs.h                   |   1 -
> >  monitor/hmp.c                             |  45 +---
> >  target/arm/gdbstub.c                      |   8 +-
> >  target/arm/gdbstub64.c                    |  10 +-
> >  target/i386/cpu-dump.c                    |   5 +-
> >  target/i386/cpu.c                         |  60 +++--
> >  target/i386/cpu.h                         |  25 ++
> >  target/i386/gdbstub.c                     | 373 ++++++++++++++++++++++=
+++++---
> >  target/i386/tcg/fpu_helper.c              |  24 +-
> >  target/m68k/cpu.c                         |  22 --
> >  target/m68k/helper.c                      |  49 +++-
> >  target/ppc/gdbstub.c                      |   2 +-
> >  target/riscv/cpu.c                        |   1 -
> >  target/riscv/gdbstub.c                    |  57 ++++-
> >  target/riscv/internals.h                  |   3 -
> >  target/riscv/monitor.c                    | 140 -----------
> >  target/riscv/tcg/csr.c                    |   3 +-
> >  target/sparc/cpu.c                        |  19 --
> >  target/sparc/gdbstub.c                    |  38 +++
> >  target/xtensa/cpu.c                       |   2 +-
> >  tests/qtest/test-hmp.c                    |   1 -
> >  56 files changed, 1383 insertions(+), 478 deletions(-)
> > ---
> > base-commit: 8967b2fe1b2aaae3c29e207d85fab901d580a2dc
> > change-id: 20260910-query-reg-80cd59cf4707
> >
> > Best regards,
> > --
> > Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> --
>  -----Open up your eyes, open up your mind, open up your code -------
> / Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \
> \        dave @ treblig.org |                               | In Hex /
>  \ _________________________|_____ http://www.treblig.org   |_______/
>

