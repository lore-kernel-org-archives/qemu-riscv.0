Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkCBg-0005V9-1I
	for mharc-qemu-riscv@gnu.org; Wed, 05 Apr 2023 19:05:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pkCBd-0005Ur-U5; Wed, 05 Apr 2023 19:05:05 -0400
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pkCBc-0000fC-5v; Wed, 05 Apr 2023 19:05:05 -0400
Received: by mail-vs1-xe35.google.com with SMTP id cu36so32896524vsb.7;
 Wed, 05 Apr 2023 16:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680735902;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L+HpkiUxbKZZuvzD5ms6ufWr18h0S0bZziKCDGRovws=;
 b=oh0cozYaC9VsahSsTKo1fCbrLaZdyIYlCvJk6ahZLCFmc9CcZaC9qczE4VwqW6pfqI
 5QY6bvjfVOogiYGe1StYt/UZx+2/VpWpA0PD0FqXSQvyqZnkdcNlWrWixlGIDQFs9DXz
 yzao7WZmT+U2++hnQ233f07lSk0r+qArFzOeP6cWaSHTsPlZaWFXUFOt7KGUbyFyJUki
 x8V9o5spiMHJhBUfcIR6u6dy27ocgrFbHgsvtQPAW0wOetmMN1lFeCRHBm6p7sPz1NGK
 XHFjt8v6R45NQabQQDfftPxPvjVjY/frLbUhmK7GHuXIO4Kph3QYUh37gder2bvXxqDs
 31Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680735902;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L+HpkiUxbKZZuvzD5ms6ufWr18h0S0bZziKCDGRovws=;
 b=JWiTV5hvzQKG02SE+ZXEhQbBhULOqridHuHMioXOwFJvhU2aA2EZzxZABEyO7rV5PC
 RNsu5902fAaUdJBzPT1fmo5uhr7SSwVk3Pn6K+qpOfk15jgggslKvGWOSspSrWi5KHzf
 y0c0g0+6D0FSTexSGA/EivaNDPd3UcjuJ1F2jIcsfjQxKQCi5G7K/qe/2AiwlpSISI5g
 3A6gRRSIZ0jtqUEr0ioYy0rKAXQ/eyeL94W4ZyxLUrVzw/ARUbkpYkqMcXRU9zOYhATs
 SGLhuHZ5nrNC04HuRXGi4WFBGuwFGC1Rb1ClJR6lRLvOGjJ1I8Lzo996ssbjGlenr72A
 rZiA==
X-Gm-Message-State: AAQBX9ddyTz2W3dQOSGLUjLuh+vJQlR/l+esit6OY/WLxJsj83U8eCBG
 htetWPkEvpkscMiyLnekNGQhawRroIefboZiKmjVz5KnmwA=
X-Google-Smtp-Source: AKy350YOQJX7WKhqgv2+vi4F5exUMPPqx0Bpdb7UdpjpUfROsT0ew808Kur8MZozEfylUZg3IA3fYaA6w1kbGdRW09c=
X-Received: by 2002:a05:6102:3d29:b0:425:ddcf:69b3 with SMTP id
 i41-20020a0561023d2900b00425ddcf69b3mr4510690vsv.0.1680735902132; Wed, 05 Apr
 2023 16:05:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230405085813.40643-1-liweiwei@iscas.ac.cn>
In-Reply-To: <20230405085813.40643-1-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 6 Apr 2023 09:04:36 +1000
Message-ID: <CAKmqyKONe8TTLGrDi+bnjxUiSN=1Hm7AiiDairOtff7aeDHDog@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] target/riscv: Simplification for RVH related check
 and code style fix
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e35;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe35.google.com
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
X-List-Received-Date: Wed, 05 Apr 2023 23:05:06 -0000

On Wed, Apr 5, 2023 at 6:59=E2=80=AFPM Weiwei Li <liweiwei@iscas.ac.cn> wro=
te:
>
> This patchset tries to simplify the RVH related check and fix some code s=
tyle problems, such as problems for indentation, multi-line comments and li=
nes with over 80 characters.
>
> The port is available here:
> https://github.com/plctlab/plct-qemu/tree/plct-virtfix-upstream
>
> v2:
> * add comment to specify riscv_cpu_set_virt_enabled() can only be called =
when RVH is enabled in patch 4 (suggested by Richard Henderson)
> * merge patch from LIU Zhiwei(Message-ID: <20230325145348.1208-1-zhiwei_l=
iu@linux.alibaba.com>) to patch 5
> * use env->virt_enabled directly instead of riscv_cpu_virt_enabled() in p=
atch 6 (suggested by LIU Zhiwei)
> * remain the orginal identation for macro name in patch 8 (suggested by L=
IU Zhiwei)
>
> v3:
> * rebase on riscv-to-apply.next (partial patches in v2 have been applied)
> * Fix new found format problem in patch 2,3,4 of v3
>
> Weiwei Li (4):
>   target/riscv: Remove riscv_cpu_virt_enabled()
>   target/riscv: Fix format for indentation
>   target/riscv: Fix format for comments
>   target/riscv: Fix lines with over 80 characters

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  target/riscv/arch_dump.c                |   7 +-
>  target/riscv/cpu.c                      |  47 ++--
>  target/riscv/cpu.h                      |  31 +--
>  target/riscv/cpu_bits.h                 |   2 +-
>  target/riscv/cpu_helper.c               | 274 ++++++++++----------
>  target/riscv/csr.c                      |  90 +++----
>  target/riscv/debug.c                    |  21 +-
>  target/riscv/fpu_helper.c               |  24 +-
>  target/riscv/gdbstub.c                  |   3 +-
>  target/riscv/insn_trans/trans_rvv.c.inc |  36 +--
>  target/riscv/m128_helper.c              |  16 +-
>  target/riscv/machine.c                  |  18 +-
>  target/riscv/op_helper.c                |  20 +-
>  target/riscv/pmp.c                      |  66 ++---
>  target/riscv/pmp.h                      |   9 +-
>  target/riscv/pmu.c                      |   7 +-
>  target/riscv/sbi_ecall_interface.h      |   8 +-
>  target/riscv/translate.c                |  26 +-
>  target/riscv/vector_helper.c            | 317 ++++++++++++++----------
>  19 files changed, 552 insertions(+), 470 deletions(-)
>
> --
> 2.25.1
>
>

