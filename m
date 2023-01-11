Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pFTEd-00018a-8K
	for mharc-qemu-riscv@gnu.org; Wed, 11 Jan 2023 00:01:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pFTEb-00018M-Na; Wed, 11 Jan 2023 00:01:09 -0500
Received: from mail-vk1-xa33.google.com ([2607:f8b0:4864:20::a33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pFTEZ-0004LW-NH; Wed, 11 Jan 2023 00:01:09 -0500
Received: by mail-vk1-xa33.google.com with SMTP id z190so6691973vka.4;
 Tue, 10 Jan 2023 21:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rgUaN+q2yvFxYwwVvqgAkek6COOSPKktoPJiGAEtmL4=;
 b=JJ16nNnMgBvVbxK/rdYg4iufKERYb9GRAYr/Sq/j2RIWbe7ydFzzMBHk4hsmkC8vZu
 MT4VYFWcRWKl2K6fkViU4JloiYK7EUHPGLAPeyrnWev6tAxYLk0QI4iLVDJuLMDLLy/d
 9/sYaspg87W9/7QqJrzm0jYC9ezbaTIFqgQxEmGloF7OB9hPJmJ1/G0a0GPWJrSnB950
 GC+poA62kv1n+dgzftfrV47jL4fd3utFtaR2vegMz596if8mb1ju45BN+6tGndFcCN0y
 1sMNoz+5GFvCc51vGJeswE/Su/F2KuIvfdW6rA5fU3lhyX/9Rcsrimj/pLWTa4MNSDUt
 NENg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rgUaN+q2yvFxYwwVvqgAkek6COOSPKktoPJiGAEtmL4=;
 b=p+vQ7HNUDcKZO58Bu6GIPqhRRMy289OeFzXd1nTovPS0cS51XdQumZfi4+oxZO9+Ri
 LcJPGuJCXYOGX2P3DEGk8/WVeaXP3CLZAeEdoHBGYEQwK4fRubFSDnujo2g+eo/BUAix
 UvpZIWx3MvQG46sK/RJv0c/5LmiAsqMxzGxmOKA9WZntW1vpsuV13WCy94/jZMSyrNa3
 4/ewgULmzt9+fTpZraKVfDVHcLRvKBGzmkulQNrrVjDBs4TG3WQ6BLJrTMAHm68OUOW6
 zvOpeXlp262H2JnJVxuaJN3lfq807n+1sciKKb29pCnEJz8yYQBBZmFpE/HH0+BFrZM4
 9W9A==
X-Gm-Message-State: AFqh2kp227GcQEdHO7AMtzzdaGg8HDDH1oo+gRvXbyJuzpIc+Jx62a81
 wZv1vCw82ZJTWs1kKLEEejcHEtiCDZOXCkJ0Zec=
X-Google-Smtp-Source: AMrXdXvFkdDxLOJV3XwYCXxPFCW6T0+uymThsMDDT6KScCDnWxSno3YXBjrzm8TNu03dJzlfJI3uoCPFDqbmauEFHK8=
X-Received: by 2002:a1f:c703:0:b0:3d5:6ccb:8748 with SMTP id
 x3-20020a1fc703000000b003d56ccb8748mr7111250vkf.26.1673413265750; Tue, 10 Jan
 2023 21:01:05 -0800 (PST)
MIME-Version: 1.0
References: <20221228062028.29415-1-liweiwei@iscas.ac.cn>
In-Reply-To: <20221228062028.29415-1-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 11 Jan 2023 15:00:39 +1000
Message-ID: <CAKmqyKONF+C_xiUiM0aGww1yNVnx_-VRayK0sp+sn_gURA22=g@mail.gmail.com>
Subject: Re: [PATCH v9 0/9] support subsets of code size reduction extension
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: richard.henderson@linaro.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a33;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa33.google.com
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
X-List-Received-Date: Wed, 11 Jan 2023 05:01:10 -0000

On Wed, Dec 28, 2022 at 4:23 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
> This patchset implements RISC-V Zc* extension v1.0.0.RC5.7 version instru=
ctions.
>
> Specification:
> https://github.com/riscv/riscv-code-size-reduction/tree/main/Zc-specifica=
tion
>
> The port is available here:
> https://github.com/plctlab/plct-qemu/tree/plct-zce-upstream-v9
>
> To test Zc* implementation, specify cpu argument with 'x-zca=3Dtrue,x-zcb=
=3Dtrue,x-zcf=3Dtrue,f=3Dtrue" and "x-zcd=3Dtrue,d=3Dtrue" (or "x-zcmp=3Dtr=
ue,x-zcmt=3Dtrue" with c or d=3Dfalse) to enable Zca/Zcb/Zcf and Zcd(or Zcm=
p,Zcmt) extensions support.
>
>
> This implementation can pass the basic zc tests from https://github.com/y=
ulong-plct/zc-test
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
> Weiwei Li (9):
>   target/riscv: add cfg properties for Zc* extension
>   target/riscv: add support for Zca extension
>   target/riscv: add support for Zcf extension
>   target/riscv: add support for Zcd extension
>   target/riscv: add support for Zcb extension
>   target/riscv: add support for Zcmp extension
>   target/riscv: add support for Zcmt extension
>   target/riscv: expose properties for Zc* extension
>   disas/riscv.c: add disasm support for Zc*

This series broke a range of boards that use specific CPUs. I have
dropped it from my tree.

Daniel has sent a series that should fix it though
(https://www.mail-archive.com/qemu-devel@nongnu.org/msg930952.html). I
have applied his fixes. Can you rebase this series on
https://github.com/alistair23/qemu/tree/riscv-to-apply.next, test to
ensure the SiFive boards continue to work and then re-send the series?

Alistair

>
>  disas/riscv.c                             | 228 +++++++++++++++-
>  target/riscv/cpu.c                        |  56 ++++
>  target/riscv/cpu.h                        |  10 +
>  target/riscv/cpu_bits.h                   |   7 +
>  target/riscv/csr.c                        |  38 ++-
>  target/riscv/helper.h                     |   3 +
>  target/riscv/insn16.decode                |  63 ++++-
>  target/riscv/insn_trans/trans_rvd.c.inc   |  18 ++
>  target/riscv/insn_trans/trans_rvf.c.inc   |  18 ++
>  target/riscv/insn_trans/trans_rvi.c.inc   |   4 +-
>  target/riscv/insn_trans/trans_rvzce.c.inc | 313 ++++++++++++++++++++++
>  target/riscv/machine.c                    |  19 ++
>  target/riscv/meson.build                  |   3 +-
>  target/riscv/translate.c                  |  15 +-
>  target/riscv/zce_helper.c                 |  55 ++++
>  15 files changed, 834 insertions(+), 16 deletions(-)
>  create mode 100644 target/riscv/insn_trans/trans_rvzce.c.inc
>  create mode 100644 target/riscv/zce_helper.c
>
> --
> 2.25.1
>
>

