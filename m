Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n9gJo-0001gz-Qa
	for mharc-qemu-riscv@gnu.org; Mon, 17 Jan 2022 23:42:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n9gJn-0001dg-6o; Mon, 17 Jan 2022 23:42:03 -0500
Received: from [2607:f8b0:4864:20::12b] (port=42842
 helo=mail-il1-x12b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n9gJl-0006Mb-G7; Mon, 17 Jan 2022 23:42:02 -0500
Received: by mail-il1-x12b.google.com with SMTP id u5so12284164ilq.9;
 Mon, 17 Jan 2022 20:42:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YjcdWzujMvAJulI9gk/+Fb+CyW2bO4dWXAXP3PYALMw=;
 b=fgIjxVbU5j+RfUZbXlqxdRM399C6i5hHtnbUaGi6JU73mfVvF8Bttgqg3G24zqSWp8
 Ucb5CweKOZmFQcKr1ggkseBkYfeLJJwKlHO/uXqGPwMPQz3QFlD/39EkmVBcWsD64UVP
 t6oNGnLYtEHxEnHIMzuoV0JwXE1wQSxzB88h19NSSb7IiFUz3Xi2IoWSvcuJdYhG0hU+
 mmE3nyck1AOWKQ7AOVkrJnzKR235eSXyvHkFOFGTcEBDb1knVsJs+sdkX1/jW0/AVq21
 PsmGXQ2Nad+KNzD1TK0owBUe4CySajwV8sIcJVizw7Z+jF/qMwAgcLPtmKixHzNmBkne
 1HEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YjcdWzujMvAJulI9gk/+Fb+CyW2bO4dWXAXP3PYALMw=;
 b=JPQQvqjHcZoM4qIpTPG4GzoFJKbR++WvTiH04XFgai6eHlOKswuOiZer3+LGD+RLVz
 uDvDfstkq+S6TA10mgdkiUmf7lu1bNBgrdPv8vzdBtjtml6baUq6NVUgc7CWXjFBTTMz
 x5brqCRXnXJBUjUndaaPBhTCNZ+Iu/s7P7hP8OjBO4RU08s3pigpgGu8hlH9E1c8uV9J
 zw6n42rQMl5j5yxv8rJuxUCGGOpbGFbHGd+BFhlVCDweMwHhrQ6K0uagH1FZVHE9IXLr
 W+qUzWDxw96Td/xTJ2pX/lEMleaNvn1d4+V+ucdl2+ZckUeNiKzGyiFCwB3V8dggRjMc
 j2KQ==
X-Gm-Message-State: AOAM5339IK1CfZY66WuqG1a4yjaK/Y5JCNNBzOjSu9EyENJATbhJ3g6I
 iib32skg+J7xk7AB+PQm7yz5kDsMt1NXCHZFVeM=
X-Google-Smtp-Source: ABdhPJy/10WwRtBTvyFUCxU9pzU8GHXB85kb2oO0rpFmUvgMGrG0QnAAaD1GhW6H+zXJ+fQoD2zNBkDiq92xdB9D1PA=
X-Received: by 2002:a92:3012:: with SMTP id x18mr11969148ile.221.1642480920034; 
 Mon, 17 Jan 2022 20:42:00 -0800 (PST)
MIME-Version: 1.0
References: <20220111035124.9468-1-liweiwei@iscas.ac.cn>
In-Reply-To: <20220111035124.9468-1-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 18 Jan 2022 14:41:33 +1000
Message-ID: <CAKmqyKOxD33qVpT1k3-BU1MRSZS3+vN-f7z-kaGQ0RhXWKhBqQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] support subsets of scalar crypto extension
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wangjunqiang <wangjunqiang@iscas.ac.cn>, lazyparser@gmail.com, 
 luruibo2000@163.com, lustrew@foxmail.com
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::12b;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12b.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Tue, 18 Jan 2022 04:42:03 -0000

On Tue, Jan 11, 2022 at 1:54 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
> This patchset implements RISC-V scalar crypto extension v1.0.0 version instructions.
> Partial instructions are reused from B-extension.
>
> Specification:
> https://github.com/riscv/riscv-crypto
>
> The port is available here:
> https://github.com/plctlab/plct-qemu/tree/plct-k-upstream-v4
>
> To test rvk implementation,  specify cpu argument with 'zks=true,zkn=true'
> or
> "zbkb=true,zbkc=true,zbkx=true,zknd=true,zkne=true,zknh=true,zksed=true,zksh=true,zkr=true"
>  to enable  K-extension support.  This implementation can pass the ACT tests
> for K with our extended act support for qemu (available at
> https://github.com/plctlab/plct-qemu/tree/plct-k-upstream-v4-with-act)
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
> Weiwei Li (7):
>   target/riscv: rvk: add cfg properties for zbk* and zk*
>   target/riscv: rvk: add implementation of instructions for Zbk*
>   crypto include/crypto target/arm: move sm4_sbox to crypto
>   target/riscv: rvk: add implementation of instructions for Zk*
>   target/riscv: rvk: add CSR support for Zkr
>   disas/riscv.c: rvk: add disas support for Zbk* and Zk* instructions
>   target/riscv: rvk: expose zbk* and zk* properties

Thanks for the patches!

Overall this looks good, just some small comments on the individual patches.

For the next version do you mind splitting the patches up a little bit
more? That will make it easier and faster to review

Alistair

>
>  crypto/meson.build                      |   1 +
>  crypto/sm4.c                            |  49 +++
>  disas/riscv.c                           | 170 +++++++++
>  include/crypto/sm4.h                    |   6 +
>  target/arm/crypto_helper.c              |  36 +-
>  target/riscv/bitmanip_helper.c          |  74 ++++
>  target/riscv/cpu.c                      |  37 ++
>  target/riscv/cpu.h                      |  13 +
>  target/riscv/cpu_bits.h                 |   9 +
>  target/riscv/crypto_helper.c            | 446 ++++++++++++++++++++++
>  target/riscv/csr.c                      |  74 ++++
>  target/riscv/helper.h                   |  42 +++
>  target/riscv/insn32.decode              |  94 ++++-
>  target/riscv/insn_trans/trans_rvb.c.inc | 127 ++++++-
>  target/riscv/insn_trans/trans_rvk.c.inc | 467 ++++++++++++++++++++++++
>  target/riscv/meson.build                |   3 +-
>  target/riscv/pmp.h                      |   8 +-
>  target/riscv/translate.c                |   8 +
>  18 files changed, 1594 insertions(+), 70 deletions(-)
>  create mode 100644 crypto/sm4.c
>  create mode 100644 include/crypto/sm4.h
>  create mode 100644 target/riscv/crypto_helper.c
>  create mode 100644 target/riscv/insn_trans/trans_rvk.c.inc
>
> --
> 2.17.1
>
>

