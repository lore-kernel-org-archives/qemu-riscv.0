Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pjub6-0004ug-Md
	for mharc-qemu-riscv@gnu.org; Wed, 05 Apr 2023 00:18:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pjub5-0004uR-TR; Wed, 05 Apr 2023 00:18:11 -0400
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pjub4-0000Wv-3G; Wed, 05 Apr 2023 00:18:11 -0400
Received: by mail-vs1-xe36.google.com with SMTP id h27so30389883vsa.1;
 Tue, 04 Apr 2023 21:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680668288;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VjfV0UOcTORanbTLtgrp56CC+yz0243R1o/NaN2R4Z4=;
 b=DZ6oaXi3GPd+cNbDh/8UFIUBAhx3mS4tyFXBZKXPe4FvtII+2zVKI37nCjAOoyT7BM
 2Kr0Hn6zrQMY+clCDXG1W/ZbLEG7NRhu4jlb59u9RGG4ImhG84fXCXCfxC2O9dqOvc6O
 meQfyZRviTDL6bmQ2rCWtHnfnqf0o5eCDGljf5cyeSMuxXQIYHjKkVzXf5tmoNFxFSzm
 yWA4onwsHOmAF4z8EaK5fiGJOmMIgcswBTbTmvOvWaMvgfsWAp+JccLBBbP6RVtDClmi
 CGqPRTMSdr6PU7stk6jOMaOTk34hYqXC/K3j9FhdhNEChMOyL2UDCvvXkEIGKtSotHq1
 K+CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680668288;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VjfV0UOcTORanbTLtgrp56CC+yz0243R1o/NaN2R4Z4=;
 b=ICcjjZf4QsL8Ypted9uKQNA10Ykz4yfvtCogj+iak4kSEzPb8s4nFX81R7stOTKccX
 JM9s1BZoJRooRf6pG8w3VBf8Bev7eFszfdXnV1unTwSrXPl6bofwt8nh7S+pqmNAtqeh
 +tgEhA5cES5eSVx/+s/8FP5/4w3hPnPpf3c1Olfg0NmYKlYrwJWT1EWqqvQKPgxoZq7p
 vOQcBlmh2x1pv9hEDdUPPlKA/pdXQXpzvIB8qQlH3tfzQlHaKbl+wCvCEWCQI3IQZyWW
 QD874/qXfYziKPuQ5ssFcRJ5EtgrD31/WZCJ9ECIZKez4F6kSwBuYgH4HMYcH2S5ZzCg
 yo5A==
X-Gm-Message-State: AAQBX9fYXr2SzX2EMOBc3u9+oGLkT3H0omGnZx2VjIfaTJkLC9xqsd1R
 3yf79vM+zgSqcY79hTTQIpRGviuWHvPcG2nXUY0=
X-Google-Smtp-Source: AKy350ZO7tw8prR3YS20WT3V9majpvIuK4MEi7GkMnIDHro0cmNhp5ubYbbnHtw5KZqMYITNY+04P7dtC0ZsD5yEgyQ=
X-Received: by 2002:a67:d586:0:b0:425:87ab:c386 with SMTP id
 m6-20020a67d586000000b0042587abc386mr1126442vsj.3.1680668288598; Tue, 04 Apr
 2023 21:18:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230307081403.61950-1-liweiwei@iscas.ac.cn>
In-Reply-To: <20230307081403.61950-1-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 5 Apr 2023 14:17:42 +1000
Message-ID: <CAKmqyKMmpg9WVRHXgdeEfAqpd3kYnO0Lj7yHPZvOfHM7R=K+OA@mail.gmail.com>
Subject: Re: [PATCH v12 00/10] support subsets of code size reduction extension
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: richard.henderson@linaro.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e36;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe36.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 05 Apr 2023 04:18:12 -0000

On Tue, Mar 7, 2023 at 6:16=E2=80=AFPM Weiwei Li <liweiwei@iscas.ac.cn> wro=
te:
>
> This patchset implements RISC-V Zc* extension v1.0.3-1 version instructio=
ns.
>
> Specification:
> https://github.com/riscv/riscv-code-size-reduction/tree/main/Zc-specifica=
tion
>
> The port is available here:
> https://github.com/plctlab/plct-qemu/tree/plct-zce-upstream-v12
>
> To test Zc* implementation, specify cpu argument with 'x-zca=3Dtrue,x-zcb=
=3Dtrue,x-zcf=3Dtrue,f=3Dtrue" and "x-zcd=3Dtrue,d=3Dtrue" (or "x-zcmp=3Dtr=
ue,x-zcmt=3Dtrue" with c or d=3Dfalse) to enable Zca/Zcb/Zcf and Zcd(or Zcm=
p,Zcmt) extensions support. We can also specify "x-zce=3Dtrue,f=3Dtrue" to =
enable Zca/Zcb/Zcmp/Zcmt and Zcf.
>
> This implementation can pass the basic zc tests from https://github.com/y=
ulong-plct/zc-test
>
> v12
> * add patch 10 to support zce property
> * rebase on upstream master: reuse riscv_get_cfg() in patch 7 and remove =
tcg_temp_free in patch 6
>
> v11
> * update format and field name based on the latest spec in patch 5, 6, 7 =
(without other functional changes)
> * rebase on riscv-to-apply.next
>
> v10:
> * rebase on Daniel's series(riscv-to-apply.next) and adjust riscv-tests t=
o test on sifive related CPUs
>
> v9:
> * rebase on riscv-to-apply.next
>
> v8:
> * improve disas support in Patch 9
>
> v7:
> * Fix description for Zca
>
> v6=EF=BC=9A
> * fix base address for jump table in Patch 7
> * rebase on riscv-to-apply.next
>
> v5:
> * fix exception unwind problem for cpu_ld*_code in helper of cm_jalt
>
> v4:
> * improve Zcmp suggested by Richard
> * fix stateen related check for Zcmt
>
> v3:
> * update the solution for Zcf to the way of Zcd
> * update Zcb to reuse gen_load/store
> * use trans function instead of helper for push/pop
>
> v2:
> * add check for relationship between Zca/Zcf/Zcd with C/F/D based on rela=
ted discussion in review of Zc* spec
> * separate c.fld{sp}/fsd{sp} with fld{sp}/fsd{sp} before support of zcmp/=
zcmt
>
> Weiwei Li (10):
>   target/riscv: add cfg properties for Zc* extension
>   target/riscv: add support for Zca extension
>   target/riscv: add support for Zcf extension
>   target/riscv: add support for Zcd extension
>   target/riscv: add support for Zcb extension
>   target/riscv: add support for Zcmp extension
>   target/riscv: add support for Zcmt extension
>   target/riscv: expose properties for Zc* extension
>   disas/riscv.c: add disasm support for Zc*
>   target/riscv: Add support for Zce

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  disas/riscv.c                             | 228 +++++++++++++++-
>  target/riscv/cpu.c                        |  69 +++++
>  target/riscv/cpu.h                        |  11 +
>  target/riscv/cpu_bits.h                   |   7 +
>  target/riscv/csr.c                        |  36 ++-
>  target/riscv/helper.h                     |   3 +
>  target/riscv/insn16.decode                |  62 ++++-
>  target/riscv/insn_trans/trans_rvd.c.inc   |  18 ++
>  target/riscv/insn_trans/trans_rvf.c.inc   |  18 ++
>  target/riscv/insn_trans/trans_rvi.c.inc   |   4 +-
>  target/riscv/insn_trans/trans_rvzce.c.inc | 311 ++++++++++++++++++++++
>  target/riscv/machine.c                    |  19 ++
>  target/riscv/meson.build                  |   3 +-
>  target/riscv/translate.c                  |  15 +-
>  target/riscv/zce_helper.c                 |  55 ++++
>  15 files changed, 843 insertions(+), 16 deletions(-)
>  create mode 100644 target/riscv/insn_trans/trans_rvzce.c.inc
>  create mode 100644 target/riscv/zce_helper.c
>
> --
> 2.25.1
>
>

