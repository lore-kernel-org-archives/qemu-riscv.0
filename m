Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nHzoV-00009Y-Kc
	for mharc-qemu-riscv@gnu.org; Wed, 09 Feb 2022 22:08:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nHzoS-00009F-Cm; Wed, 09 Feb 2022 22:08:04 -0500
Received: from [2607:f8b0:4864:20::d2e] (port=45588
 helo=mail-io1-xd2e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nHzo5-0004BD-3m; Wed, 09 Feb 2022 22:07:44 -0500
Received: by mail-io1-xd2e.google.com with SMTP id s18so5677254ioa.12;
 Wed, 09 Feb 2022 19:07:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5HARNDOch051tubGfEPzahIMKlYtJeCAEKPSJ1brXd0=;
 b=cMQpRMu3R/Mnvlpxiktspjee7Zu/JttIv+ldBHioukRoq1oGPDHT+S8a3SYuWF7Nvh
 KL7MWzIQGMXHqcyUiyHcnNB2O26ya0mF1wqo8UC3Ic6LMqueSdtgC0jmRVmRLOOJfcYF
 H/RlGP/mm04/CwnXjTuKmiarSxKVsGdOKyvkC8gus8mPXJG9niRoona9VgiSG8MLt60+
 MZHebiLWrw7GMKfy0nde0LjjpI06QewGDwKNbV+rnAHAJ5ghdgGkDyBqxCTLQ7H9XXM+
 BsSw9gxuzgqhifSVvmkh3jma3/p3Mjh7xzNKQbwLpjoNLHEwKoPiJiTZM/2ejtvE9kXF
 DHsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5HARNDOch051tubGfEPzahIMKlYtJeCAEKPSJ1brXd0=;
 b=t2WvYkM5Q64c7uJLy9GAiIuj+ii/byZOmw6pz7ML5AYJ+jh9AWG1seXzDRKYY6TqSQ
 KQhdFuUVq5dN2Kwgr/X7JzbfLvpeinjSoJWD8/uco/uTtCHmp7zbSnq/U04h0u0SLQSq
 mJPjT6dtIJDJ3w7h3Bw56K6BZSKU0mJplFl+JdJTO5f2I9fOBH32bGF2SVENvb8Fdzjh
 qRDrLnhKZgxQCD6Js3XqH4DDJItMmktwYoB+jkwyxTzzr171PbrN452Cyu3qZ+to1akW
 4+62ryXKpAfyf30q5zO39wsMDpK5358v2nb3UbYRLh286ar39OHO3UF/AqKfusHJKArn
 CMEg==
X-Gm-Message-State: AOAM5318ACOjgwc7OeaI7SC+vYlEUfYBL4sp4aN/K9OM6jBs4MW8hhYQ
 65yvsACYcX6DoolZMjzkPzz026ssvm8xsy7DkKE=
X-Google-Smtp-Source: ABdhPJwZOK8U+tYytvP/R7sy3X1VowFIbxUR4+Aqwl1ZheqbDHqIequNHgfN/8tcjLxv5hYKjd/8QdejZMmnudf7ZQ4=
X-Received: by 2002:a05:6602:727:: with SMTP id
 g7mr2844061iox.90.1644462459694; 
 Wed, 09 Feb 2022 19:07:39 -0800 (PST)
MIME-Version: 1.0
References: <20220204022658.18097-1-liweiwei@iscas.ac.cn>
In-Reply-To: <20220204022658.18097-1-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 10 Feb 2022 13:07:13 +1000
Message-ID: <CAKmqyKPF7o=if6hR+pZWEgBkwsXgBr1x09f5-ucoAvwpX1Zk5A@mail.gmail.com>
Subject: Re: [PATCH v9 0/5] support subsets of virtual memory extension
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wangjunqiang <wangjunqiang@iscas.ac.cn>, 
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, 
 Guo Ren <ren_guo@c-sky.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2e.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Thu, 10 Feb 2022 03:08:04 -0000

On Fri, Feb 4, 2022 at 12:32 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
> This patchset implements virtual memory related RISC-V extensions: Svnapot version 1.0, Svinval vesion 1.0, Svpbmt version 1.0.
>
> Specification:
> https://github.com/riscv/virtual-memory/tree/main/specs
>
> The port is available here:
> https://github.com/plctlab/plct-qemu/tree/plct-virtmem-upstream-v9
>
> To test this implementation, specify cpu argument with 'svinval=true,svnapot=true,svpbmt=true'.
>
> This implementation can pass the riscv-tests for rv64ssvnapot.
>
> v9:
> * delete cast for PTE bits check
>
> v8:
> * rebase on https://lore.kernel.org/qemu-devel/20220131110201.2303275-1-philipp.tomsich@vrull.eu/
> * move variables to tops of function
> * add ULL for PTE_N and PTE_PMBT
> * add mask variable for napot_bits
>
> v7:
> * delete definition of PTE_PPN_MASK for TARGET_RISCV32
> * make riscv_cpu_sxl works for user mode
> * add commit msg for patch 2
>
> v6:
> * select ppn mask base on sxl
>
> v5:
> * merge patch https://lore.kernel.org/qemu-devel/1569456861-8502-1-git-send-email-guoren@kernel.org/
> * relax pte attribute check
>
> v4:
> * fix encodings for hinval_vvma and hinval_gvma
> * partition inner PTE check into several steps
> * improve commit messages to describe changes
>
> v3:
> * drop "x-" in exposed properties
>
> v2:
> * add extension check for svnapot and svpbmt
>
> Guo Ren (1):
>   target/riscv: Ignore reserved bits in PTE for RV64
>
> Weiwei Li (4):
>   target/riscv: add PTE_A/PTE_D/PTE_U bits check for inner PTE
>   target/riscv: add support for svnapot extension
>   target/riscv: add support for svinval extension
>   target/riscv: add support for svpbmt extension

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  target/riscv/cpu.c                          |  4 ++
>  target/riscv/cpu.h                          | 16 +++++
>  target/riscv/cpu_bits.h                     |  6 ++
>  target/riscv/cpu_helper.c                   | 34 +++++++++-
>  target/riscv/insn32.decode                  |  7 ++
>  target/riscv/insn_trans/trans_svinval.c.inc | 75 +++++++++++++++++++++
>  target/riscv/translate.c                    |  1 +
>  7 files changed, 140 insertions(+), 3 deletions(-)
>  create mode 100644 target/riscv/insn_trans/trans_svinval.c.inc
>
> --
> 2.17.1
>
>

