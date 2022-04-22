Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ni2Hr-0000n1-0m
	for mharc-qemu-riscv@gnu.org; Fri, 22 Apr 2022 19:02:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ni2Hq-0000mp-30; Fri, 22 Apr 2022 19:02:02 -0400
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c]:46847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ni2Ho-0001Vw-4F; Fri, 22 Apr 2022 19:02:01 -0400
Received: by mail-il1-x12c.google.com with SMTP id f5so5912824ilj.13;
 Fri, 22 Apr 2022 16:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=MaYFCQnrZT94GwQbZDE4dKdgrAss/Ig6GEihpFEDcX8=;
 b=j4K8oBaHzA0WqQdvfv7F33/+a3ZO238rz8zdjN4AeiCsbv499D2CrEvNQ5EjcLPb1X
 fq3OKo9II/6FVQVTX2sY/H5p1LjsfGW3i+zVeo8zRQE82jtDi2PHVOfjlPpNipTdiqde
 eeSpD0Ca1Amq+TZlpeaZgvipREHZQQyW4wec/kdem7rDE8sFQcyIYk4DK2DbZOcjoVYY
 HgD2NA3ZqYs2mGs5ZANvCsoi5hL38tIVjPLjM/WFK8kpJFOcTsvPVZ0RSoCT/zNkWf8N
 qmDfQrqx82kB8PY/wl9WARqYo1rPTrDcp8z+wJLrkhJh/RSydUyiFsci0INV6G74mmAK
 M2rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=MaYFCQnrZT94GwQbZDE4dKdgrAss/Ig6GEihpFEDcX8=;
 b=mEe9XcfUHgOvoRmGAjoY9YlFLEJAdTfL4u08GVnlmTaz8Idyo9tcb2+p3uAI/5k2AJ
 cQJuuikiVBd08lxUg1SzPTe6geDUqWnk4QqHl9cFeRuvjgRAhKXNiaueqZPxfZMg3kb0
 fla5JmwDa/7lWv493fWBEzX5jIM7/tHQw2Vc0CxQHDuXQBBw5IrRIBkBxJZEkpKsazcF
 ZSGMiJAHTdAyGRgUM67e9+mOsZy+Lw8ekRjB/j5HadbKJcIdfrlt4PeiuASsukl/cCzi
 Fs/n9h6Dp0rxcd/sZ9sZLss5eAf+T/V2xXHDrqS5uD67Cv3kX9DK/jhg0OA/gpmP7ek4
 463Q==
X-Gm-Message-State: AOAM531qqiOPJRcQ87kNfI1iSG1a8FpLUci5jp9lC5uWk01tlBt71a1o
 osPIZz2tjUp9DZVp+YJtEIL4qDZ4lwHnj3ZvtLs=
X-Google-Smtp-Source: ABdhPJwg0jbbcUYbl8ECD0kUo4awMlCVhZ1CTLqfm5nRIuWbZIOooQMRTxyIggzmXCJBNrWOD18EfZRKWFxaTpsLC90=
X-Received: by 2002:a05:6e02:1e0a:b0:2cd:6f4d:ad5b with SMTP id
 g10-20020a056e021e0a00b002cd6f4dad5bmr2592447ila.113.1650668518461; Fri, 22
 Apr 2022 16:01:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220419014847.9722-1-liweiwei@iscas.ac.cn>
In-Reply-To: <20220419014847.9722-1-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Sat, 23 Apr 2022 09:01:32 +1000
Message-ID: <CAKmqyKO4XgH06dmDzKv8hs29UX1wvhRdaAOsV0h7LkoFqw_qZg@mail.gmail.com>
Subject: Re: [PATCH v11 00/14] support subsets of scalar crypto extension
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wangjunqiang <wangjunqiang@iscas.ac.cn>, 
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, luruibo2000@163.com, 
 lustrew@foxmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::12c;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12c.google.com
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
X-List-Received-Date: Fri, 22 Apr 2022 23:02:02 -0000

On Tue, Apr 19, 2022 at 11:58 AM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
> This patchset implements RISC-V scalar crypto extension v1.0.0 version in=
structions.
> Partial instructions are reused from B-extension.
>
> Specification:
> https://github.com/riscv/riscv-crypto
>
> The port is available here:
> https://github.com/plctlab/plct-qemu/tree/plct-k-upstream-v11
>
> To test rvk implementation, specify cpu argument with 'zks=3Dtrue,zkn=3Dt=
rue' or "zbkb=3Dtrue,zbkc=3Dtrue,zbkx=3Dtrue,zknd=3Dtrue,zkne=3Dtrue,zknh=
=3Dtrue,zksed=3Dtrue,zksh=3Dtrue,zkr=3Dtrue" to enable K-extension support.=
 This implementation can pass the ACT tests for K with our extended act sup=
port for qemu (available at https://github.com/plctlab/plct-qemu/tree/plct-=
k-upstream-v11-with-act)
>
> Review status:
> patch 5 is reviewed by Philippe Mathieu-Daud=C3=A9
> patch 1~11 and 13-14 are acked or reviewed by Alistair Francis
> patch 2~11 are reviewed by Richard Henderson (fix new comments on patch 6=
 and 7)
>
> v11:
> * patch 6: add REQUIRE_32BIT to trans_* function for aes RV32 instruction
> * patch 7: add REQUIRE_64BIT to trans_* function for aes RV64 instruction
>
> v10:
> (only patch 12 is modified)
> * simplify the conditions for the check in seed function
> * add NULL check for ret_val in rmw_seed function
> * remain the change of MSECCFG_* to align with the added MSECCFG_*SEED
>
> v9:
> * check whether seed is accessed by a read-write instruction in helper_cs=
rr.
> * fix disas for partial scalar crypto instructions
> * rebase on https://lists.nongnu.org/archive/html/qemu-riscv/2022-03/msg0=
0156.html
>
> v8:
> * replace large macro for trans function of sha256/512 instructions with =
parameters to gen_sha* function in patch 8,9,10
> * fix tcg_const_tl to tcg_constant_tl
> * fix rmw_seed function
>
> v7:
> * reuse gen_unary/gen_arith to simplify trans_* functions
> * replace DEF_HELPER_* with DEF_HEPER_FLAG_*
> * move aes64 related macros from patch 6 to patch 7
> * create common helper gen_aes32_sm4 for aes32 and sm4 related instructio=
ns
> * replace bs with shamt (bs << 3)
> * optimize trans function for sha256, sha512 and sm4 instructions to be g=
enerated inline
>
> v6:
> * add reviewed-by tags
> * rebase on upstream
>
> v5:
> * split the big patches
>
> v4:
> * drop "x-" in exposed properties
> * delete unrelated changes
>
> v3:
> * add extension check for SEED csr access
>
> v2:
> * optimize implementation for brev8, xperm, zip, unzip
> * use aes related sbox array from crypto/aes.h
> * move sm4_sbox to crypto/sm4.c, and share it with target/arm
>
> Weiwei Li (14):
>   target/riscv: rvk: add cfg properties for zbk* and zk*
>   target/riscv: rvk: add support for zbkb extension
>   target/riscv: rvk: add support for zbkc extension
>   target/riscv: rvk: add support for zbkx extension
>   crypto: move sm4_sbox from target/arm
>   target/riscv: rvk: add support for zknd/zkne extension in RV32
>   target/riscv: rvk: add support for zkne/zknd extension in RV64
>   target/riscv: rvk: add support for sha256 related instructions in zknh
>     extension
>   target/riscv: rvk: add support for sha512 related instructions for
>     RV32 in zknh extension
>   target/riscv: rvk: add support for sha512 related instructions for
>     RV64 in zknh extension
>   target/riscv: rvk: add support for zksed/zksh extension
>   target/riscv: rvk: add CSR support for Zkr
>   disas/riscv.c: rvk: add disas support for Zbk* and Zk* instructions
>   target/riscv: rvk: expose zbk* and zk* properties

Do you mind rebasing this on the latest master? Then I can merge it

Alistair

>
>  crypto/meson.build                      |   1 +
>  crypto/sm4.c                            |  49 +++
>  disas/riscv.c                           | 173 ++++++++++-
>  include/crypto/sm4.h                    |   6 +
>  target/arm/crypto_helper.c              |  36 +--
>  target/riscv/bitmanip_helper.c          |  80 +++++
>  target/riscv/cpu.c                      |  36 +++
>  target/riscv/cpu.h                      |  13 +
>  target/riscv/cpu_bits.h                 |   9 +
>  target/riscv/crypto_helper.c            | 302 ++++++++++++++++++
>  target/riscv/csr.c                      |  80 +++++
>  target/riscv/helper.h                   |  22 ++
>  target/riscv/insn32.decode              |  97 ++++--
>  target/riscv/insn_trans/trans_rvb.c.inc | 116 ++++++-
>  target/riscv/insn_trans/trans_rvk.c.inc | 391 ++++++++++++++++++++++++
>  target/riscv/meson.build                |   3 +-
>  target/riscv/op_helper.c                |   9 +
>  target/riscv/pmp.h                      |   8 +-
>  target/riscv/translate.c                |   8 +
>  19 files changed, 1368 insertions(+), 71 deletions(-)
>  create mode 100644 crypto/sm4.c
>  create mode 100644 include/crypto/sm4.h
>  create mode 100644 target/riscv/crypto_helper.c
>  create mode 100644 target/riscv/insn_trans/trans_rvk.c.inc
>
> --
> 2.17.1
>
>

