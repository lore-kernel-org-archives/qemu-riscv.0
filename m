Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7492CCD98C7
	for <qemu-riscv@archiver.kernel.org>; Fri, 12 Jun 2026 02:37:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wXrm5-0008UH-R8; Thu, 11 Jun 2026 22:37:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wXrm3-0008Tn-Ra
 for qemu-riscv@nongnu.org; Thu, 11 Jun 2026 22:37:35 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wXrm1-0001QP-DM
 for qemu-riscv@nongnu.org; Thu, 11 Jun 2026 22:37:35 -0400
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-bed2195323cso71930966b.1
 for <qemu-riscv@nongnu.org>; Thu, 11 Jun 2026 19:37:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781231852; cv=none;
 d=google.com; s=arc-20240605;
 b=Podeeb9blGv6YO96HiZICRrJXM+CNQ1oWmnAhBRZFff+wlCg8Nd5X95GVhY1yZ8j1A
 yCGYz4yq/v9JPWriWj/TC0/lVqxyQ5qBgCy21pjP4ri+p8j5dDAK9i7pc/cMaS+jOGHk
 QHU4CSdVZh8qDXU2jm73YrlFQxYMbWPSDKaGvLegwsEXd0I36u3IgvJTQ4+yxp6XEej3
 daAU+yibwCwEaSAv9FypvYh4bZGPGcQxBNTnQf4IpTnyyZkkUCYuaPnXSLtjSMh9xTcv
 8o5QoC7GLJF0Yz+k9mrk6CWZ3gm3jhufmXkWyPpUrR+sygAqqE84Grlq1/wm0Vue1in/
 TUrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=g5+kqjJaZ6QVl2vMFXU0POzN1KhlUcnn3TpNAumXc1Y=;
 fh=EA34uV1okEdLSyC4A2IxlC5+Ye6vMaUm3pD41ekaH50=;
 b=h0401neIruoiEQAPtU70fkt0hLPgJwpu875g+hIBWKtWlxGighZNQONHJ1byZYAFMZ
 D99sD8DazRWCyPKBBGDTV5CSEOGxneyqnRwktp4c3w3en9BYpeJarB6z562U4KxGyYad
 /0C1crnkjhv+acaKCkMeUXTOMAaOtCLyBfJW/f7ea9o5QmndkqWD7A8S5/339fndZbhu
 ZEtYox6NRLpEcoIM07UbMa/y4h5V8Z2PFlMDGodEOgTWnjHc0Yu0W0IH2nXCrc1jhMhB
 FyYVtr+twOPS2pMbiOcx6hlXdr4x5X51SmitBiyjq8skulNfgHWj15G0H4ThrgyyCx1U
 Qwmw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781231852; x=1781836652; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g5+kqjJaZ6QVl2vMFXU0POzN1KhlUcnn3TpNAumXc1Y=;
 b=oAaz2PDmbfyK8uVKahMuljlX1NJO+ygrQerHF/QDQzd60SwZaJp4waQJVrqheWrt8t
 E9aVYrsC0mQp2jyZ/wqkFx5ffOzDSvMLsbhVSFrV8fiYEzZqtqkvpa5rvlVvIL0akfQj
 h1iCSB5v7n8NBdnXnzJj1aZzgYXodfRsMMFNQscqvHbJTBP1ds9mJmYQQz/FgitPwGah
 T5PoX7BKAhJC/FwlhkB/JDcRbvgnHyK87AyO1jSArhnhps/gBoNfQzVT7bhmEo+m90J7
 Pkw99lhyad04+CHG+Pz/6/G60lho6YrNDnIYooURmoMyYmRE1GNXXB24H5/NNz3aP8tG
 PXDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781231852; x=1781836652;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=g5+kqjJaZ6QVl2vMFXU0POzN1KhlUcnn3TpNAumXc1Y=;
 b=k2B03U8WXCEPpXOR6vzdWvS3o5nR/+flJlpYrkbI5pnQERIq4iY+pzrdxGnN79foGu
 ojxAdvc9CQlKbqk4doxnRRViz4KWUknBhptKs4QG2FQ4UyPk8UAKIkb+OvnZB+J+ehR1
 ZxOEohgR923Gra3woGu4EfmrMjxwrr2kDyxb5/wUUAO6zTgdOpdk3BkcK/YMvOI/1Nc3
 owFHgzR1WgNZ09o5p3jrZattrx6DAjcq8GLd8/x6OPkZOZDgK8fSY/AACm0z3D+g0a8u
 314bHyS8X4MyZO+ZGuXhG5MoaEhl5C0+AglbvZqTgtuhAYBFC9XSO/DzyRkRLuBKQuiR
 dxzw==
X-Forwarded-Encrypted: i=1;
 AFNElJ8BU7QCvFJsr/zluSYuSwNqTajSK2luEktOMLP+1+llm993SWy3+iBYyGm1RAb61xodXT431uIKQg7r@nongnu.org
X-Gm-Message-State: AOJu0Ywor8te088YV8iUoxPoiUkes4jemb7NkUaA6UqCmIU3h0lrORxK
 uqL6hzrjr4UugbKk9l72OSpS4HTnX8dqeH3rFYCP63G94OIGKqForVXT6heh1UOS1LGS8aXYVPh
 DDuvMfy0FLhV0MWGopNcStd2kuuqkNMU=
X-Gm-Gg: Acq92OEg7mFZCDeOJuMQIJu0I+ehJYJY/y+U3Sh8EN2Cl0WnrHr6lrlQ8pAsKVUeonI
 bKmk2CtAIEbO3RJ8R3NMA4HiDExGbX9LU2Akrurzkrr/uS6+jCRBcNdtgQchUmpepEYDPaqovB7
 ue2DHOK9JoEDUzO3LLeRaOQTcRsjQtrOwjHvCT4+S6AF6G6dQ2bl5W3ED4oZBzdfokqDYbpPgJp
 NVCtc7rFZlceviVZu8K1XFj/djd7hVhxWLybdC+8G2GZEIHfNSKQiYtBnYJxVmCB7vbT1uQEKfZ
 mZQE5ZTmHMpOfbCYerulPSy0WzW/D8IVdMmrGA==
X-Received: by 2002:a17:906:45a3:b0:bed:4603:805f with SMTP id
 a640c23a62f3a-bfe28e12257mr19006466b.24.1781231851647; Thu, 11 Jun 2026
 19:37:31 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1778516731.git.chao.liu.zevorn@gmail.com>
 <69be8c8a8b47f4b6283a4a89850fff8cde300137.1778516731.git.chao.liu.zevorn@gmail.com>
In-Reply-To: <69be8c8a8b47f4b6283a4a89850fff8cde300137.1778516731.git.chao.liu.zevorn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 12 Jun 2026 12:37:03 +1000
X-Gm-Features: AVVi8CdyAWL_EPwCCHzKRIPGXqGqeSDZNpSmSvmM-BAgJ-cXVmqc12-5a73TNck
Message-ID: <CAKmqyKOF8KpDTtmtHpJvQ-uu6trSQZ3=NNs-R3AkW3RUMLP98g@mail.gmail.com>
Subject: Re: [PATCH v7 4/5] tests/qtest: add test for K230 watchdog
To: Chao Liu <chao.liu.zevorn@gmail.com>
Cc: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 Christoph Muellner <christoph.muellner@vrull.eu>, 
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>,
 qemu-devel@nongnu.org, 
 qemu-riscv@nongnu.org, Chao Liu <chao.liu@zevorn.cn>, 
 Mig Yang <temashking@foxmail.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=alistair23@gmail.com; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Tue, May 12, 2026 at 2:33=E2=80=AFAM Chao Liu <chao.liu.zevorn@gmail.com=
> wrote:
>
> From: Chao Liu <chao.liu@zevorn.cn>
>
> Testing the Basic Functions of K230 WDT:
> 1. Reset Function
> 2. Timeout Check
> 3. Interrupt Function
>
> Signed-off-by: Mig Yang <temashking@foxmail.com>
> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Acked-by: Fabiano Rosas <farosas@suse.de>
> Signed-off-by: Chao Liu <chao.liu.zevorn@gmail.com>

This fails `make check` for me. I guess the `k230` machine wasn't built?

541/542 qemu:qtest+qtest-aarch64 / qtest-aarch64/bios-tables-test
               OK              91.02s   15 subtests passed
=E2=96=B6 542/542 /riscv64/k230-wdt/register_read_write -
ERROR:../tests/qtest/libqtest.c:558:qtest_connect: assertion failed:
(s->fd >=3D 0 && s->qmp_fd >=3D 0) FAIL
=E2=96=B6 542/542
               ERROR
542/542 qemu:qtest+qtest-riscv64 / qtest-riscv64/k230-wdt-test
               ERROR           51.60s   killed by signal 6 SIGABRT
>>> PYTHON=3D/var/mnt/scratch/alistair/software/qemu/build/pyvenv/bin/pytho=
n3 MSAN_OPTIONS=3Dhalt_on_error=3D1:abort_on_error=3D1:print_summary=3D1:pr=
int_stacktrace=3D1 QTEST_QEMU_VNC_BINARY=3D./tools/qemu-vnc/qemu-vnc UBSAN_=
OPTIONS=3Dhalt_on_error=3D1:abort_on_error=3D1:print_summary=3D1:print_stac=
ktrace=3D1 MESON_TEST_ITERATION=3D1 QTEST_QEMU_IMG=3D./qemu-img RUST_BACKTR=
ACE=3D1 G_TEST_DBUS_DAEMON=3D/var/mnt/scratch/alistair/software/qemu/tests/=
dbus-daemon.sh MALLOC_PERTURB_=3D94 QTEST_QEMU_STORAGE_DAEMON_BINARY=3D./st=
orage-daemon/qemu-storage-daemon ASAN_OPTIONS=3Dhalt_on_error=3D1:abort_on_=
error=3D1:print_summary=3D1 QTEST_QEMU_BINARY=3D./qemu-system-riscv64 /var/=
mnt/scratch/alistair/software/qemu/build/tests/qtest/k230-wdt-test --tap -k
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95
=E2=9C=80  =E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95
stderr:
qemu-system-riscv64: unsupported machine type: "k230"
Use -machine help to list supported machines
socket_accept failed: Resource temporarily unavailable
**
ERROR:../tests/qtest/libqtest.c:558:qtest_connect: assertion failed:
(s->fd >=3D 0 && s->qmp_fd >=3D 0)
../tests/qtest/libqtest.c:201: kill_qemu() tried to terminate QEMU
process but encountered exit status 1 (expected 0)

(test program exited with status code -6)
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95


Summary of Failures:

542/542 qemu:qtest+qtest-riscv64 / qtest-riscv64/k230-wdt-test
      ERROR           51.60s   killed by signal 6 SIGABRT

Ok:                 510
Expected Fail:      0
Fail:               1
Unexpected Pass:    0
Skipped:            31
Timeout:            0

Alistair

> ---
>  MAINTAINERS                 |   1 +
>  tests/qtest/k230-wdt-test.c | 189 ++++++++++++++++++++++++++++++++++++
>  tests/qtest/meson.build     |   3 +-
>  3 files changed, 192 insertions(+), 1 deletion(-)
>  create mode 100644 tests/qtest/k230-wdt-test.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e5ec6367ca..e7e3ed0c5c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1788,6 +1788,7 @@ F: hw/riscv/k230.c
>  F: hw/watchdog/k230_wdt.c
>  F: include/hw/riscv/k230.h
>  F: include/hw/watchdog/k230_wdt.h
> +F: tests/qtest/k230-wdt-test.c
>
>  RX Machines
>  -----------
> diff --git a/tests/qtest/k230-wdt-test.c b/tests/qtest/k230-wdt-test.c
> new file mode 100644
> index 0000000000..c8eaeaf1ae
> --- /dev/null
> +++ b/tests/qtest/k230-wdt-test.c
> @@ -0,0 +1,189 @@
> +/*
> + * QTest testcase for K230 Watchdog
> + *
> + * Copyright (c) 2025 Mig Yang <temashking@foxmail.com>
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + *
> + * Provides a board compatible with the kendryte K230 SDK
> + *
> + * K230 Technical Reference Manual V0.3.1 (2024-11-18):
> + * https://github.com/revyos/external-docs/blob/master/K230/en-us/K230_T=
echnical_Reference_Manual_V0.3.1_20241118.pdf
> + *
> + * For more information, see <https://www.kendryte.com/en/proDetail/230>
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/timer.h"
> +#include "qemu/bitops.h"
> +#include "libqtest.h"
> +#include "hw/watchdog/k230_wdt.h"
> +
> +/* K230 WDT0 base address */
> +#define K230_WDT0_BASE 0x91106000
> +#define K230_WDT1_BASE 0x91106800
> +
> +/* Test WDT0 by default */
> +#define WDT_BASE K230_WDT0_BASE
> +
> +static void test_register_read_write(void)
> +{
> +    QTestState *qts =3D qtest_init("-machine k230");
> +
> +    /* Test Control Register (CR) read/write */
> +    qtest_writel(qts, WDT_BASE + K230_WDT_CR, 0xFFFFFFFF);
> +    g_assert_cmphex(qtest_readl(qts, WDT_BASE + K230_WDT_CR), =3D=3D,
> +                    (K230_WDT_CR_RPL_MASK << K230_WDT_CR_RPL_SHIFT) |
> +                    K230_WDT_CR_RMOD | K230_WDT_CR_WDT_EN);
> +
> +    /* Test Timeout Range Register (TORR) read/write */
> +    qtest_writel(qts, WDT_BASE + K230_WDT_TORR, 0xFFFFFFFF);
> +    g_assert_cmphex(qtest_readl(qts, WDT_BASE + K230_WDT_TORR), =3D=3D,
> +                    K230_WDT_TORR_TOP_MASK);
> +
> +    /* Test Protection Level Register read/write */
> +    qtest_writel(qts, WDT_BASE + K230_WDT_PROT_LEVEL, 0xFFFFFFFF);
> +    g_assert_cmphex(qtest_readl(qts, WDT_BASE + K230_WDT_PROT_LEVEL), =
=3D=3D, 0x7);
> +
> +    qtest_quit(qts);
> +}
> +
> +static void test_counter_restart(void)
> +{
> +    QTestState *qts =3D qtest_init("-machine k230");
> +
> +    /* Enable watchdog and set timeout */
> +    qtest_writel(qts, WDT_BASE + K230_WDT_CR, K230_WDT_CR_WDT_EN);
> +    qtest_writel(qts, WDT_BASE + K230_WDT_TORR, 0x5); /* TOP =3D 5 */
> +
> +    /* Read current counter value */
> +    uint32_t initial_count =3D qtest_readl(qts, WDT_BASE + K230_WDT_CCVR=
);
> +    g_assert_cmpuint(initial_count, >, 0);
> +
> +    /* Restart counter with magic value */
> +    qtest_writel(qts, WDT_BASE + K230_WDT_CRR, K230_WDT_CRR_RESTART);
> +
> +    /* Wait for time */
> +    qtest_clock_step(qts, NANOSECONDS_PER_SECOND * 2);
> +
> +    /* Counter should be reset to timeout value */
> +    uint32_t new_count =3D qtest_readl(qts, WDT_BASE + K230_WDT_CCVR);
> +    g_assert_cmpuint(new_count, >, 0);
> +    g_assert_cmpuint(new_count, !=3D, initial_count);
> +
> +    qtest_quit(qts);
> +}
> +
> +static void test_interrupt_mode(void)
> +{
> +    QTestState *qts =3D qtest_init("-machine k230 --trace k230_*,file=3D=
k230.log");
> +
> +    /* Set interrupt mode and enable watchdog */
> +    qtest_writel(qts, WDT_BASE + K230_WDT_CR,
> +                 K230_WDT_CR_RMOD | K230_WDT_CR_WDT_EN);
> +    qtest_writel(qts, WDT_BASE + K230_WDT_TORR, 0x1); /* Short timeout *=
/
> +
> +    /* Wait for timeout to trigger interrupt */
> +    qtest_clock_step(qts, NANOSECONDS_PER_SECOND * 10);
> +
> +    /* Check interrupt status */
> +    uint32_t stat =3D qtest_readl(qts, WDT_BASE + K230_WDT_STAT);
> +    g_assert_cmphex(stat & K230_WDT_STAT_INT, =3D=3D, K230_WDT_STAT_INT)=
;
> +
> +    /* Clear interrupt */
> +    qtest_writel(qts, WDT_BASE + K230_WDT_EOI, 0x1);
> +    stat =3D qtest_readl(qts, WDT_BASE + K230_WDT_STAT);
> +    g_assert_cmphex(stat & K230_WDT_STAT_INT, =3D=3D, 0);
> +
> +    qtest_quit(qts);
> +}
> +
> +static void test_reset_mode(void)
> +{
> +    QTestState *qts =3D qtest_init("-machine k230 -no-reboot");
> +
> +    /* Set reset mode and enable watchdog */
> +    qtest_writel(qts, WDT_BASE + K230_WDT_CR, K230_WDT_CR_WDT_EN);
> +    qtest_writel(qts, WDT_BASE + K230_WDT_TORR, 0x1); /* Short timeout *=
/
> +
> +    /* Wait for timeout to trigger reset */
> +    qtest_clock_step(qts, NANOSECONDS_PER_SECOND * 2);
> +
> +    /* In reset mode, the system should reset */
> +    /* This test verifies that reset mode is properly configured */
> +
> +    qtest_quit(qts);
> +}
> +
> +static void test_timeout_calculation(void)
> +{
> +    QTestState *qts =3D qtest_init("-machine k230");
> +
> +    /* Test different timeout values */
> +    for (uint32_t top =3D 0; top <=3D 15; top++) {
> +        qtest_writel(qts, WDT_BASE + K230_WDT_TORR, top);
> +        qtest_writel(qts, WDT_BASE + K230_WDT_CR, K230_WDT_CR_WDT_EN);
> +
> +        /* Read current counter value */
> +        uint32_t count =3D qtest_readl(qts, WDT_BASE + K230_WDT_CCVR);
> +        g_assert_cmpuint(count, >, 0);
> +
> +        /* Disable watchdog for next iteration */
> +        qtest_writel(qts, WDT_BASE + K230_WDT_CR, 0);
> +    }
> +
> +    qtest_quit(qts);
> +}
> +
> +static void test_wdt1_registers(void)
> +{
> +    QTestState *qts =3D qtest_init("-machine k230");
> +
> +    /* Test WDT1 registers (second watchdog) */
> +    qtest_writel(qts, K230_WDT1_BASE + K230_WDT_CR, 0xFFFFFFFF);
> +    g_assert_cmphex(qtest_readl(qts, K230_WDT1_BASE + K230_WDT_CR), =3D=
=3D,
> +                    (K230_WDT_CR_RPL_MASK << K230_WDT_CR_RPL_SHIFT) |
> +                    K230_WDT_CR_RMOD | K230_WDT_CR_WDT_EN);
> +
> +    qtest_writel(qts, K230_WDT1_BASE + K230_WDT_TORR, 0xFFFFFFFF);
> +    g_assert_cmphex(qtest_readl(qts, K230_WDT1_BASE + K230_WDT_TORR), =
=3D=3D,
> +                    K230_WDT_TORR_TOP_MASK);
> +
> +    qtest_quit(qts);
> +}
> +
> +static void test_enable_disable(void)
> +{
> +    QTestState *qts =3D qtest_init("-machine k230");
> +
> +    /* Initially disabled */
> +    uint32_t cr =3D qtest_readl(qts, WDT_BASE + K230_WDT_CR);
> +    g_assert_cmphex(cr & K230_WDT_CR_WDT_EN, =3D=3D, 0);
> +
> +    /* Enable watchdog */
> +    qtest_writel(qts, WDT_BASE + K230_WDT_CR, K230_WDT_CR_WDT_EN);
> +    cr =3D qtest_readl(qts, WDT_BASE + K230_WDT_CR);
> +    g_assert_cmphex(cr & K230_WDT_CR_WDT_EN, =3D=3D, K230_WDT_CR_WDT_EN)=
;
> +
> +    /* Disable watchdog */
> +    qtest_writel(qts, WDT_BASE + K230_WDT_CR, 0);
> +    cr =3D qtest_readl(qts, WDT_BASE + K230_WDT_CR);
> +    g_assert_cmphex(cr & K230_WDT_CR_WDT_EN, =3D=3D, 0);
> +
> +    qtest_quit(qts);
> +}
> +
> +int main(int argc, char *argv[])
> +{
> +    g_test_init(&argc, &argv, NULL);
> +
> +    qtest_add_func("/k230-wdt/register_read_write", test_register_read_w=
rite);
> +    qtest_add_func("/k230-wdt/counter_restart", test_counter_restart);
> +    qtest_add_func("/k230-wdt/interrupt_mode", test_interrupt_mode);
> +    qtest_add_func("/k230-wdt/reset_mode", test_reset_mode);
> +    qtest_add_func("/k230-wdt/timeout_calculation", test_timeout_calcula=
tion);
> +    qtest_add_func("/k230-wdt/wdt1_registers", test_wdt1_registers);
> +    qtest_add_func("/k230-wdt/enable_disable", test_enable_disable);
> +
> +    return g_test_run();
> +}
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index 43f83ffd3a..45c4898454 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -290,7 +290,8 @@ qtests_riscv64 =3D ['riscv-csr-test'] + \
>    (unpack_edk2_blobs ? ['bios-tables-test'] : []) + \
>    (config_all_devices.has_key('CONFIG_IOMMU_TESTDEV') and
>     config_all_devices.has_key('CONFIG_RISCV_IOMMU') ?
> -   ['iommu-riscv-test'] : [])
> +   ['iommu-riscv-test'] : []) + \
> +  (config_all_devices.has_key('CONFIG_K230') ? ['k230-wdt-test'] : [])
>
>  qos_test_ss =3D ss.source_set()
>  qos_test_ss.add(
>

