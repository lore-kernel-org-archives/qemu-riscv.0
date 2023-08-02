Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A273C04E69
	for <qemu-riscv@archiver.kernel.org>; Wed,  2 Aug 2023 14:55:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qRDFL-00049Y-Sv; Wed, 02 Aug 2023 10:54:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qRDFJ-00048l-Ul; Wed, 02 Aug 2023 10:54:41 -0400
Received: from mail-ua1-x92d.google.com ([2607:f8b0:4864:20::92d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qRDFH-0000TE-V0; Wed, 02 Aug 2023 10:54:41 -0400
Received: by mail-ua1-x92d.google.com with SMTP id
 a1e0cc1a2514c-79ad4ffc6e6so720417241.3; 
 Wed, 02 Aug 2023 07:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690988078; x=1691592878;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pxNeoBEC0NAs3HMeydOSbaDziZzHPfXtSbezqldeE1M=;
 b=ivA5DIgySHKKStD1aGxGqpfsORPoD4E/3TTrPcKQa2gotY6B1HXWP7dsSJQY2Zl9Jy
 jXIAcXfuaCJUMVL03gj3mMp5A0K41xJqE60+0bGOUUAQ6UZTcIapwABiHPA0C/0mXiIL
 5tinlcT4+72F7YnSXvWhtFAw8tyzLduJE69UEmP10GxrJpQ5TpWqlJ06kJfCwSAG6HMW
 uG45mMkpn2NIR8sSrI580QAfQzbH4r04bqkwMq89si0WshIpZFR24KRrRRXLtjJ7fB93
 hbll3upUU1Fzqh/8h5eE0ltRLHrTFKaYXNhbTrKCX1/DwJ/k1oNX+mqH9XJgIse58nyT
 1prQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690988078; x=1691592878;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pxNeoBEC0NAs3HMeydOSbaDziZzHPfXtSbezqldeE1M=;
 b=QTwYWb1gKFxTpG3kRfjBbsO5VcqFoL8ndx1HtIwBKa4tkg+6aPeVaBW5Hk+WMfbxku
 VRIY7IfceNykuem6TPMZ9mQFL86MvEKMr4kajL9qFCt9cw9Gu3nV5D1NebUZMFpmYy0j
 a243KOEIDA/oXNtJbaZS+Lj5RxiXMtjGeXgdwbYF5PsEP4oRkJgEMbt2CRLaVIY+9uVm
 TrKKzsC7lIzjS//BWGXYSmabPbVsntc/PZ93LwFhoWU1zYiOWkVbg5kEykq2dz0GYwmG
 e6TIe16lmhZao4Z5ILxIbael0bphFSKfQqtYXXSmKxir50qpyUxbXAkTd8pXrb75UJtR
 CrRw==
X-Gm-Message-State: ABy/qLY7eyTnAbqSQKm0DSSWQ+YSakRASGOhNtEtcoTlTTrMeHc3TdT4
 ANjgomTvi4qaYcv5aysZ7rHzcbnDSeliaaDb0dg=
X-Google-Smtp-Source: APBJJlG0ItVxMV2aV3LfGqgjmzy0D+OKhLk/j3WiThRHJKwz0JWHXVDfkSVjrZbHLe3/8D4kYu/s53ehCzOBpAgQB6o=
X-Received: by 2002:a67:fa51:0:b0:440:c4fb:f257 with SMTP id
 j17-20020a67fa51000000b00440c4fbf257mr4456069vsq.0.1690988078304; Wed, 02 Aug
 2023 07:54:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230711165917.2629866-1-max.chou@sifive.com>
In-Reply-To: <20230711165917.2629866-1-max.chou@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 2 Aug 2023 10:54:11 -0400
Message-ID: <CAKmqyKNpg=DMbidwRbR5La2GrETTfR--zKBGGgJ-eirRmCywBA@mail.gmail.com>
Subject: Re: [PATCH v8 00/15] Add RISC-V vector cryptographic instruction set
 support
To: Max Chou <max.chou@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, dbarboza@ventanamicro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92d;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Tue, Jul 11, 2023 at 12:59=E2=80=AFPM Max Chou <max.chou@sifive.com> wro=
te:
>
> This patchset provides an implementation for Zvbb, Zvbc, Zvkned, Zvknh,
> Zvksh, Zvkg, and Zvksed of the draft RISC-V vector cryptography
> extensions as per the v20230620 version of the specification(1)(168e7b4).
> This is an update to the patchset submitted to qemu-devel on
> Wed, 12 Jul 2023 00:31:21 +0800
>
> v2:
>
>     Squashed commits into one commit per extension with separate
>     commits for each refactoring.
>     Unified trans_rvzvk*.c.inc files into one trans_rvvk.c.inc.
>     Style fixes in insn32.decode and other files.
>     Added macros for EGS values in translation functions.
>     Updated from v20230303 to v20230407 of the spec:
>         Zvkb has been split into Zvbb and Zvbc.
>         vbrev, vclz, vctz, vcpop and vwsll have been added to Zvbb.
>
> v3:
>
>     New patch 03/19 removes redundant =E2=80=9Ccpu_vl =3D=3D 0=E2=80=9D c=
hecks from
>     trans_rvv.c.inc.
>     Introduction of new tcg ops has been factored out of patch 11/19
>     and into 09/19.
>         These ops are now added to non riscv-specific files.
>
> v4:
>
>     New patch 08/17 fixes the tcg_gen_gvec_andcs temporary variable
>     issue.
>     Patch 09/17 fixes imm mode for vror.vi.
>     Rebased to riscv-to-apply.next branch (de395bb):
>         Replace vstart constraint checking by TCG op.
>     Verified by code examples provided by vector crypto spec repository
>     (riscv-crypto).
>
> v5:
>
>     Imported aes-round.h for Zvkned extension.
>         Rebased to 20230620110758.787479-1-richard.henderson@linaro.org
>     Exposed the properties of v4 patch 17/17 to the patches that the
>     extension was added.
>     Removed v4 patch 08/17 that is queued to tcg-next.
>
> v6:
>
>     Resent the same content becaue v5 was splitted by broken
>     git-send-mail
>
> v7:
>
>     Fixed endian issues
>     Replace the TCG ops of vstart & vl EGS checking by helper function
>     Changed the SEW selection of vsha2c[hl].vv to TCG translation
>
> v8:
>
>     Rebased to the riscv-to-apply.next branch
>     Fixed cross win32 build issue
>     Removed redundent swap in AES key expanding (vaeskf1 & vaeskf2)
>
>
> As v20230620 is a frozen version, we are not expecting any significant
> changes to the specification or this patch series.
>
> Please note that the Zvkt data-independent execution latency extension
> (and all extensions including it) has not been implemented, and we
> would recommend not using these patches in an environment where timing
> attacks are an issue.
>
> Work performed by Dickon, Lawrence, Nazar, Kiran, and William from
> Codethink sponsored by SiFive, as well as Max Chou and Frank Chang
> from SiFive.
>
>     https://github.com/riscv/riscv-crypto/releases
>
> Thanks to those who have already reviewed:
>
>     Daniel Henrique Barboza dbarboza@ventanamicro.com
>         [PATCH v4 09/17] target/riscv: Add Zvbb ISA extension support
>         [PATCH v4 10/17] target/riscv: Add Zvkned ISA extension support
>         [PATCH v4 11/17] target/riscv: Add Zvknh ISA extension support
>         [PATCH v4 12/17] target/riscv: Add Zvksh ISA extension support
>         [PATCH v4 13/17] target/riscv: Add Zvkg ISA extension support
>     Weiwei Li liweiwei@iscas.ac.cn
>         [PATCH v3 01/19] target/riscv: Refactor some of the generic vecto=
r functionality
>         [PATCH v3 02/19] target/riscv: Refactor vector-vector translation=
 macro
>         [PATCH v3 03/19] target/riscv: Remove redundant "cpu_vl =3D=3D 0"=
 checks
>         [PATCH v3 05/19] target/riscv: Move vector translation checks
>         [PATCH v3 06/19] target/riscv: Refactor translation of vector-wid=
ening instruction
>         [PATCH v3 07/19] target/riscv: Refactor some of the generic vecto=
r functionality
>         [PATCH v3 19/19] target/riscv: Expose Zvk* and Zvb[b, c] cpu prop=
erties
>     Richard Henderson richard.henderson@linaro.org
>         [PATCH v2 02/17] target/riscv: Refactor vector-vector translation=
 macro
>         [PATCH v2 04/17] target/riscv: Move vector translation checks
>         [PATCH v2 05/17] target/riscv: Refactor translation of vector-wid=
ening instruction
>         [PATCH v2 07/17] qemu/bitops.h: Limit rotate amounts
>         [PATCH v2 08/17] qemu/host-utils.h: Add clz and ctz functions for=
 lower-bit integers
>         [PATCH v2 14/17] crypto: Create sm4_subword
>     Alistair Francis alistair.francis@wdc.com
>         [PATCH v2 02/17] target/riscv: Refactor vector-vector translation=
 macro
>     Philipp Tomsich philipp.tomsich@vrull.eu
>         Various v1 reviews
>     Christoph M=C3=BCllner christoph.muellner@vrull.eu
>         Various v1 reviews
>
> Dickon Hood (2):
>   target/riscv: Refactor translation of vector-widening instruction
>   target/riscv: Add Zvbb ISA extension support
>
> Kiran Ostrolenk (4):
>   target/riscv: Refactor some of the generic vector functionality
>   target/riscv: Refactor vector-vector translation macro
>   target/riscv: Refactor some of the generic vector functionality
>   target/riscv: Add Zvknh ISA extension support
>
> Lawrence Hunter (2):
>   target/riscv: Add Zvbc ISA extension support
>   target/riscv: Add Zvksh ISA extension support
>
> Max Chou (3):
>   crypto: Create sm4_subword
>   crypto: Add SM4 constant parameter CK
>   target/riscv: Add Zvksed ISA extension support
>
> Nazar Kazakov (4):
>   target/riscv: Remove redundant "cpu_vl =3D=3D 0" checks
>   target/riscv: Move vector translation checks
>   target/riscv: Add Zvkned ISA extension support
>   target/riscv: Add Zvkg ISA extension support

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  crypto/sm4.c                             |  10 +
>  include/crypto/sm4.h                     |   9 +
>  target/arm/tcg/crypto_helper.c           |  10 +-
>  target/riscv/cpu.c                       |  37 +
>  target/riscv/cpu_cfg.h                   |   8 +
>  target/riscv/helper.h                    |  98 +++
>  target/riscv/insn32.decode               |  58 ++
>  target/riscv/insn_trans/trans_rvv.c.inc  | 171 ++--
>  target/riscv/insn_trans/trans_rvvk.c.inc | 606 ++++++++++++++
>  target/riscv/meson.build                 |   4 +-
>  target/riscv/translate.c                 |   1 +
>  target/riscv/vcrypto_helper.c            | 970 +++++++++++++++++++++++
>  target/riscv/vector_helper.c             | 243 +-----
>  target/riscv/vector_internals.c          |  81 ++
>  target/riscv/vector_internals.h          | 228 ++++++
>  15 files changed, 2179 insertions(+), 355 deletions(-)
>  create mode 100644 target/riscv/insn_trans/trans_rvvk.c.inc
>  create mode 100644 target/riscv/vcrypto_helper.c
>  create mode 100644 target/riscv/vector_internals.c
>  create mode 100644 target/riscv/vector_internals.h
>
> --
> 2.34.1
>

