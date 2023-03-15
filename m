Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pcJCy-0002Zt-6k
	for mharc-qemu-riscv@gnu.org; Wed, 15 Mar 2023 00:57:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pcJCq-0002Xx-3S; Wed, 15 Mar 2023 00:57:44 -0400
Received: from mail-ua1-x930.google.com ([2607:f8b0:4864:20::930])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pcJCn-0003iK-5a; Wed, 15 Mar 2023 00:57:43 -0400
Received: by mail-ua1-x930.google.com with SMTP id i22so7541021uat.8;
 Tue, 14 Mar 2023 21:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678856256;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w1aQwP73QDxFiUiU9Cb7lmaQnKachzRaBdy9Y62YCEw=;
 b=nH4lA2o0Ey5CdyFQbCILIfnbCR+VhPp3Yu8+wM9YdC6bQtxNm/+/mUcV/2hohcc65T
 b21JxjIJlO1kvkw3Ve0LyuRxettATiYO2gEBVAGthZcpsxTkPdzPDaGyOZ34tYvZW2Uz
 EdqChgdEfKI20skaTnIeezejweeDqrKiSHngh2lKZoPJesnB70k3vOPURKCsOUluWtaB
 8RuDv6lK6Xumslxa3gWo4pIO9EL8KvhcIS2HTu/OrdLHfhN+3IMd8OeSvOvBAo48Dpiz
 e1dAuweDHq9u841MF6mDHfW+z97g2AsgnjPeYxuigWj01pB9hLcU++FEQW2PZiIBB4iJ
 k+3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678856256;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w1aQwP73QDxFiUiU9Cb7lmaQnKachzRaBdy9Y62YCEw=;
 b=xJfle9P3TpMqKYEGdO6zYesz+kvHCX0DTQgSnA6OR/8msPRLlxKpjztruQNhq7qept
 e6c4c/6ixPLfoXQmTZkzAeh+3qZLAzzcgMuqR5hbnhKtQ9hhR5cstqEWS0jU8uKDz6/j
 eZz5K/+UeXu0pjZyvN7cmhKIZtzRQ5P5xl8+DX5wBmAKE5RcEpd3lfCGVMkiufVS89YE
 A9zn3R43Ree9mAePmdyACcGqOzWipDpNRZ+LhqYTnkLViVblZRTLaA4FgS7TU0p4YQED
 k77I+ABvF95USQOU8egdcTCBCajnohV05fAI6cRjjhPJCnLg7vuw+l0yOOYSJhJzenWM
 Py1w==
X-Gm-Message-State: AO0yUKUQzAia6Hwo5M+xRtrCifzjuGKlGqeBsY327d25Ld0Z72NhQcRN
 E8vXbZYphd/6VK+fIvyFYeDGR/evMzI/qDfnD/d1OzZEZIk=
X-Google-Smtp-Source: AK7set8mj/hbLYWHvktM/Sv9OjBSb5TkCN99y/3IcTjXwYQ27Uut0rbf0QIIuAozMLX6Q1/N1IEhG/NAtii2yjOCAv8=
X-Received: by 2002:ab0:470b:0:b0:688:c23f:c22f with SMTP id
 h11-20020ab0470b000000b00688c23fc22fmr19484779uac.1.1678856256449; Tue, 14
 Mar 2023 21:57:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230309071329.45932-1-liweiwei@iscas.ac.cn>
In-Reply-To: <20230309071329.45932-1-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 15 Mar 2023 14:57:10 +1000
Message-ID: <CAKmqyKMFKO89AwErj4r2PLndsbSK_Om9YDU5k6NU3wOMv6ME3A@mail.gmail.com>
Subject: Re: [PATCH 0/4] target/riscv: Some CPURISCVState related cleanup and
 simplification
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::930;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x930.google.com
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
X-List-Received-Date: Wed, 15 Mar 2023 04:57:44 -0000

On Thu, Mar 9, 2023 at 5:15=E2=80=AFPM Weiwei Li <liweiwei@iscas.ac.cn> wro=
te:
>
> The patchset tries to:
>
> - Use riscv_cpu_cfg(env) instead of env_archcpu().cfg.
> - Use env_archcpu() to get RISCVCPU pointer from env directly
> - Use CPURISCVState as argument directly in riscv_cpu_update_mip and risc=
v_timer_write_timecmp to simplify type conversion
> - Remove RISCVCPU argument of riscv_csrrw_check, and get cfg infomation f=
rom CPURISCVState directly
>
> The port is available here:
> https://github.com/plctlab/plct-qemu/tree/plct-cleanup-upstream
>
> Weiwei Li (4):
>   target/riscv: Avoid env_archcpu() when reading RISCVCPUConfig
>   target/riscv: Simplify getting RISCVCPU pointer from env
>   target/riscv: Simplify type conversion for CPURISCVState
>   target/riscv: Simplify arguments for riscv_csrrw_check

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  target/riscv/cpu.c         |  6 +--
>  target/riscv/cpu.h         |  3 +-
>  target/riscv/cpu_helper.c  | 17 ++++----
>  target/riscv/csr.c         | 87 ++++++++++++--------------------------
>  target/riscv/gdbstub.c     |  4 +-
>  target/riscv/pmu.c         | 14 +++---
>  target/riscv/time_helper.c | 15 +++----
>  target/riscv/time_helper.h |  2 +-
>  8 files changed, 57 insertions(+), 91 deletions(-)
>
> --
> 2.25.1
>
>

