Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E510CA5FC1
	for <qemu-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 08:50:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xBq0p-0000Vz-9h; Wed, 30 Sep 2026 04:50:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1xBq0k-0000VM-1j
 for qemu-riscv@nongnu.org; Wed, 30 Sep 2026 04:49:58 -0400
Received: from mail-dy2-x0f.google.com ([2607:f8b0:4864:36::f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1xBq0i-0002Pl-2G
 for qemu-riscv@nongnu.org; Wed, 30 Sep 2026 04:49:57 -0400
Received: by mail-dy2-x0f.google.com with SMTP id
 5a478bee46e88-34b1743e9c7so808596eec.3
 for <qemu-riscv@nongnu.org>; Wed, 30 Sep 2026 01:49:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790758194; cv=none;
 d=google.com; s=arc-20260327;
 b=kztletYZ+Pms+oUv9CYMCjwQbS4wnNOKP7o5HwnaGI1o43ALodXLYjyBNSizAlsity
 GKwK5snt4G14LTy/P2SzhCk/HDYLLBDBtzkNhSx5CZ1ULtTSgZyoWZxSimB+yJIN8mfP
 DDTJkZJolmpRQ2MTXJ5RlJRSayhBnj0pzNnIaW9xFHHUkXnBeToYf7Ya5ffM0e4NWyR4
 BKcNVEGtGPoGExMz6nQMRl0K+ayIwqyYbFIgI/blWZNb13ZaVZvLwTyw7fNK6AWga4AS
 77gLZYF8wqVgub3ZtVLhXs27t1AxZpK304oCZMVXd2SNaCibsKsYKoYGnMmSLNehed0+
 Gj3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=crnh6RL7TdRyTJ0xbV1wIcboYFjhAL3YOuAutLU/cCM=;
 fh=uBqzpNUco7jCfZJs5Diq3lV3HNYORHPq6AbNPbpWMSg=;
 b=hKI7yg2vHbmRztZHHMNeJaTB7bulScMXm3Iitkn2V9yBCSk/cVZ5qFXnfcNsawtTLx
 yEbBO9Q65l3y4prVIeVEKp34Z/ixrhMtsCr0L6khnrgWIMMwb7gjcei/1gTtx5OzEEWC
 GR3mJh5HAlKsMIbM87Fge3k2t9++ArUmiHJok7exTNHENcyU6g/tl/wJHire840Y21FS
 AqLaLfNqmIT6Q/TZ4+7GjxxBwMa0gmk1j5rKt0alihXLdiuJh1jfuKfUJwj0yF0RbVPU
 TncXwq/V5JZFnRVqFOZfuepIET5r/74nyLAJ7Vt/MbRBOxq0nZGYdrr2ixenBj+pO5A6
 7MEw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; s=google; t=1790758194; x=1791362994; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=crnh6RL7TdRyTJ0xbV1wIcboYFjhAL3YOuAutLU/cCM=;
 b=qiip053fdf8zdT4Utzaz59IgVIfoa8XscVZC4RvOCSMvTuMZHA6K4tshZvaQve1GLO
 2fVnMdYr+FNM8qzj/84OGohOCMrID5ar38GBZfeHc3yt+qFLKqWL57kpei2gkTxPxN0P
 qBVlLTMyvkHZlO9QWVgP9xIbBoayGdcu8Jvl58deiyHN2zSH4wv025bMy9ySw2EyyeN+
 eyQ4iA4nigj4vcfdrij02b5+iJ1kGylpK+9jgT8MrXaJ2Bh7Mr7fe9xQ0dI4P6GD6xxU
 LjOU7G4gwjo50DQE1Kh/mTTkGNWEcZfRUkMQlQKrmLY7H9413O7rtq4Iutmo2Ger0gTr
 c4nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790758194; x=1791362994;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=crnh6RL7TdRyTJ0xbV1wIcboYFjhAL3YOuAutLU/cCM=;
 b=MvWfWrplKaDn+H4mN4xTG3taWDE/HYJqVm1EbTjOHnL0PuaQuzEo/8tCiSha+uRGuL
 fiQlM9hIAgfNIpISA6klmODXgugd7Pq0Vxp5vNH+er7O8tpRV0K9nPsPvSJkTXTSeLcT
 Ti7Py1osis9CkggHJlbXYkHW+DnltKgl0pN8d1+pzd3UJdXTi8VUxwv+jH9ij+EI6P3A
 oVpqiNDJfnYmnLBfI8ho/sM7G37rWjepT559EemvBRZbjzHj3Y8rWgKoVHr/YkFR8eqn
 iVCPGTGIkjRIjn1qNVh3gq9WKCaYFzWgCRhe9DomCz/Ug1uo/DSAlg4PJMtDcvHBJ4nl
 YBkw==
X-Forwarded-Encrypted: i=1;
 AKwUvBw9UfmSzaqy/Nqg7YKSQwyAb1aUOb+/l4ZJ+ONYWmyM2PIwRML/QS1+tvfUkDuWR0tG+xcKqEJkgqE0@nongnu.org
X-Gm-Message-State: AFq9FYKB+PF67mZqXOpn5ADs1TcEXkbjOIag2HBQTdB7fYtqh567B0Xn
 Z9ri5MsGJ9KY4v4oX8tv1V04mCTsrvacqauGqmIfx8o/skgGjcomn0WmLraL2jX+5m0UgyN7PFT
 gTa+AEsodPOe96St1NRlGhhbC4SjzyNU=
X-Gm-Gg: AYBFou1vpd3n45vQob1drGfRwFH1WO/DpzRVqOgB58Vs5o3cVlUDoCLJBqKptAwkWu+
 HXDq9jzETkph8PfKa4fY6nJnyn2wDCe3ymlJHL/EFgxtyJHgPLtVGuHeFNIeEB1wUMwzvQrSri6
 i5hl3i0OXou/Z7jgfhvfhGLatpXIDDPHRKMuf6lkVEqR2zUchc1lYhFQgnToKwA7KhE7a/PW9KA
 ICKSPEer44uKgPX2l4BZhJXxqHwkB2m53ZmbFCe/xI1EW4hauXzXuj6hET60ZzrlB+fNosEnU9u
 bLzN7aRxQtxYhFHKVxVDrzT6kSlhfxVuxR3wPzqYCjwM59/q3npUpSV0m63FJWSOeF2+iUjkFVe
 W6TZPMVfKk/0=
X-Received: by 2002:a05:7301:3a94:b0:339:79c9:a711 with SMTP id
 5a478bee46e88-34cdcfaaccbmr1032865eec.33.1790758194133; Wed, 30 Sep 2026
 01:49:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260911-query-reg-v1-0-0c04f0c02cf3@redhat.com>
In-Reply-To: <20260911-query-reg-v1-0-0c04f0c02cf3@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 30 Sep 2026 12:49:39 +0400
X-Gm-Features: AclHuK_Mu3G3eXqG-b1feIF6ZN0w9rURAjDZ6ecMuHJI04OyIf5XTn6JhGWe6eQ
Message-ID: <CAJ+F1CK_hgMdVduOt4NrMKyKcKJcBB6sdH9-B9Kfw__esNc7kw@mail.gmail.com>
Subject: Re: [PATCH 00/10] monitor/hmp: replace MonitorDef with GDB registers
To: qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dave@treblig.org>,
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
Received-SPF: pass client-ip=2607:f8b0:4864:36::f;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-dy2-x0f.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Hi

On Fri, Sep 11, 2026 at 4:28=E2=80=AFPM Marc-Andr=C3=A9 Lureau
<marcandre.lureau@redhat.com> wrote:
>
> Hi,
>
> HMP monitor supports printing $register expression. The lookup
> was done via GDB stub registers, and supplementary MonitorDef
> HMP-specific tables.
>
> Migrate HMP registers to use the GDB infrastructure and remove the
> legacy HMP MonitorDef. Use a "qemu-debug" register group, as they are
> aliases or synthetic registers, but gdb doesn't seem to care.
>
> Known behavioural changes on RISC-V: CSR lookup is now case-sensitive
> and vector registers now report "unkown register" instead of a
> target-specific message ("Unable to print the value of vector vreg 'v0'
> from this API")
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

ping? swap reviews?

> ---
> Marc-Andr=C3=A9 Lureau (10):
>       hmp: don't crash on invalid register
>       gdbstub: fix next register base after register gaps
>       gdbstub: set feature->base_reg for dynamic features
>       target/i386: expose segment limits via GDB
>       monitor/hmp: add CPUClass::get_pc fallback for HMP $pc
>       target/m68k: expose system registers via GDB
>       target/sparc64: expose system registers via GDB
>       target/riscv: bypass smstateen check in debugger mode
>       target/riscv: expose register aliases via GDB
>       monitor/hmp: remove legacy MonitorDef infrastructure
>
>  configs/targets/i386-softmmu.mak          |   2 +-
>  configs/targets/m68k-softmmu.mak          |   2 +-
>  configs/targets/riscv32-linux-user.mak    |   2 +-
>  configs/targets/riscv32-softmmu.mak       |   2 +-
>  configs/targets/riscv64-bsd-user.mak      |   2 +-
>  configs/targets/riscv64-linux-user.mak    |   2 +-
>  configs/targets/riscv64-softmmu.mak       |   2 +-
>  configs/targets/sparc64-softmmu.mak       |   2 +-
>  configs/targets/x86_64-softmmu.mak        |   2 +-
>  gdbstub/gdb-xml/i386-segments.xml         |  14 +++
>  gdbstub/gdb-xml/m68k-system.xml           |  32 +++++++
>  gdbstub/gdb-xml/riscv-32bit-alias.xml     | 105 ++++++++++++++++++++++
>  gdbstub/gdb-xml/riscv-32bit-fpu-alias.xml |  40 +++++++++
>  gdbstub/gdb-xml/riscv-64bit-alias.xml     | 105 ++++++++++++++++++++++
>  gdbstub/gdb-xml/riscv-64bit-fpu-alias.xml |  46 ++++++++++
>  gdbstub/gdb-xml/sparc64-system.xml        |  22 +++++
>  gdbstub/gdbstub.c                         |  14 +--
>  include/hw/core/cpu.h                     |   2 +-
>  include/hw/core/sysemu-cpu-ops.h          |  16 ----
>  include/monitor/hmp.h                     |   6 --
>  include/qemu/typedefs.h                   |   1 -
>  monitor/hmp.c                             |  52 ++---------
>  target/arm/gdbstub.c                      |   8 +-
>  target/arm/gdbstub64.c                    |  10 ++-
>  target/i386/cpu.c                         |  32 -------
>  target/i386/gdbstub.c                     |  24 +++++
>  target/m68k/cpu.c                         |  22 -----
>  target/m68k/helper.c                      |  47 ++++++++++
>  target/ppc/gdbstub.c                      |   2 +-
>  target/riscv/cpu.c                        |   1 -
>  target/riscv/gdbstub.c                    |  52 ++++++++++-
>  target/riscv/internals.h                  |   3 -
>  target/riscv/monitor.c                    | 140 ------------------------=
------
>  target/riscv/tcg/csr.c                    |   3 +-
>  target/sparc/cpu.c                        |  19 ----
>  target/sparc/gdbstub.c                    |  38 ++++++++
>  target/xtensa/cpu.c                       |   2 +-
>  37 files changed, 562 insertions(+), 314 deletions(-)
> ---
> base-commit: 209b2afaface001c7d4d981e38f186afe7b24a50
> change-id: 20260910-query-reg-80cd59cf4707
>
> Best regards,
> --
> Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
>

