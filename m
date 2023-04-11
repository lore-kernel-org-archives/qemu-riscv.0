Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pm6f0-00084f-3F
	for mharc-qemu-riscv@gnu.org; Tue, 11 Apr 2023 01:35:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pm6ey-00084L-GY; Tue, 11 Apr 2023 01:35:16 -0400
Received: from mail-vs1-xe2d.google.com ([2607:f8b0:4864:20::e2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pm6ew-000829-PF; Tue, 11 Apr 2023 01:35:16 -0400
Received: by mail-vs1-xe2d.google.com with SMTP id z13so6524832vss.1;
 Mon, 10 Apr 2023 22:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1681191313; x=1683783313;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gWV+je5bE/RogYYBIceHrO2e1HT7i/ZGW8nuCWodz80=;
 b=JDpQaVsJFRKmklK4Ll1ka27Et+FT4xcFjjufUkewW5uplRJn8Ygdxtp+JxjhyxzKqR
 7/1ePw2uDTQDr4neZfgF6gGNrwYhuTR7BikzxhbZ7UrpWY3opLT26UveM47kP2EC7pDk
 6pj2osRuA9SwIXdRn4IkUrJlI3yVhWapMbJZn6zTzlJnJWvrx7SofkjSSwFDPFez6DjG
 DZT1S/be+lR9W0LSP2ujk9L1A9tUwP4y2YHwJOcrw7+a7yb6aIelrKmmRPETLzcRXGkD
 y/fsWL3jJW1EKElr1MzxpalABuUEdaG0gDCszzDH5rmD4LaV7+j6TLfNjZv5ab4T3MaS
 y5Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681191313; x=1683783313;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gWV+je5bE/RogYYBIceHrO2e1HT7i/ZGW8nuCWodz80=;
 b=NZySPPom/rolJu3RqTADl4Ph1wefaIhXkCly3VIvYZQyKAVPi9wub9lqzAEh9Jc5jV
 qQ+9MqvQhrfSOy6weNX4/99bogo5oMS3VZm7y6iHhfx8R3DqSDCri+PyYR4tLNbpIVWv
 h91RFIw8d4Y8QpUd8WK6s3zBDu1eyPv9Hldpf7DmjZUQlsBQbmUksvdo8fIE9wtf5+RW
 OWaN1scMB6iFUIQ5F+Ld2UVhiGSma9iwhey3UO2Y3RrECjNc+/O3wPCCg/ys9QdbEnPq
 e4MqdFSrokaU4UjZRco9D7hNm+xLcetUfXYgrliOSTUMJGL5q6jPFnsCfcOfRNMZnMWL
 ffaQ==
X-Gm-Message-State: AAQBX9c2pjvx3fUBzRnJEXfP00YSPJfNWA2a57XzduL74KyeGlpoPtTP
 NFnYWBk4YUJ5ZHSVKUEzBh4SKUaRZ44cKquNHNM=
X-Google-Smtp-Source: AKy350btKV1/skshWx2pKpJS01YT0tjXyYpxBEych6+ay8tgi3fJQwbNCDSQP1GX1fPPDKrrjdXtuXwG1FQm6FxoOfc=
X-Received: by 2002:a67:c81c:0:b0:42c:33ab:97fd with SMTP id
 u28-20020a67c81c000000b0042c33ab97fdmr6413877vsk.3.1681191313424; Mon, 10 Apr
 2023 22:35:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230407014743.18779-1-liweiwei@iscas.ac.cn>
In-Reply-To: <20230407014743.18779-1-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 11 Apr 2023 15:34:47 +1000
Message-ID: <CAKmqyKM1f955Yx-+F_RQ8t1aWtO-Edno1VcOzXwzxB3PzJx_Tg@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] target/riscv: Fix mstatus.MPP related support
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2d;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2d.google.com
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
X-List-Received-Date: Tue, 11 Apr 2023 05:35:16 -0000

On Fri, Apr 7, 2023 at 11:49=E2=80=AFAM Weiwei Li <liweiwei@iscas.ac.cn> wr=
ote:
>
> This patchset tries to fix some problems in current implementation for ms=
tatus.MPP
>
> The port is available here:
> https://github.com/plctlab/plct-qemu/tree/plct-mpp-fix-v3
>
> v3:
> * add patch 2 to remove PRV_H, and use PRV_RESERVED instead in some cases
> * improve legalize_mpp and assert error message in patch 3
>
> v2:
> * Modify commit message and add comment to specify MPP field becomes a WA=
RL field since priv version 1.11 in patch 2
> * rebase on riscv-to-apply.next
>
> Weiwei Li (3):
>   target/riscv: Fix the mstatus.MPP value after executing MRET
>   target/riscv: Use PRV_RESERVED instead of PRV_H
>   target/riscv: Legalize MPP value in write_mstatus

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  target/riscv/cpu.h        |  2 +-
>  target/riscv/cpu_bits.h   |  2 +-
>  target/riscv/cpu_helper.c |  8 ++------
>  target/riscv/csr.c        | 32 ++++++++++++++++++++++++++++++++
>  target/riscv/gdbstub.c    |  2 +-
>  target/riscv/op_helper.c  |  5 +++--
>  6 files changed, 40 insertions(+), 11 deletions(-)
>
> --
> 2.25.1
>
>

