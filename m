Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i9Eh6-0004L9-6I
	for mharc-qemu-riscv@gnu.org; Sat, 14 Sep 2019 16:30:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37642)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1i9Eh2-0004HK-Rt
 for qemu-riscv@nongnu.org; Sat, 14 Sep 2019 16:30:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1i9Eh1-0007e6-UV
 for qemu-riscv@nongnu.org; Sat, 14 Sep 2019 16:30:52 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:39394)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1i9Eh1-0007dm-M9
 for qemu-riscv@nongnu.org; Sat, 14 Sep 2019 16:30:51 -0400
Received: by mail-pf1-f193.google.com with SMTP id i1so11245764pfa.6
 for <qemu-riscv@nongnu.org>; Sat, 14 Sep 2019 13:30:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=lmIE6brnWQtY5H4j71QmKIIANTmcMtcTWXj0yIx25yc=;
 b=TONDM8AEr/eSET1IRf+mP41f1AYxuNDj8MwrF8tvfcazKNie1XxwX5xnIu/sxEnkBF
 tVV0l2cx0o0jHk5XPxpOl6mHDTnAvJMpe8UT+Z1f3sYVav4+Y9PVgiKnehJOHq8DVxu8
 DkWNEaEJqHt2jZCpzG27fdGg+qfa8Z+fIsWjxngHjYBZ70z5srxubcZaCun2MDtsxOJo
 hD9cDLSP9His18XFcRpT04s2AkRE83S588KGbw4qMa0+YUjGkXqJFU1vRKh55hIa0XCn
 eNZH/sK5Fn3vgx6MPkFtmuJSjU+/vXtzqskNxastCFzcGCVGc2SMurC4t8+zYF1tml7o
 fYzg==
X-Gm-Message-State: APjAAAWubbQggMo2rx7z+wfWa2e7Dm15aSkjrPUiHrjKyFzvAdZX56rm
 MvJZDp2aVbpRg1oQD4GfbtorQg==
X-Google-Smtp-Source: APXvYqzVykDWGPVtRdm206gXhojwCpiwp4WNX7JLu4an0m2s4ppqJlDrbf5FHMYBI2Ne+0qdv/Ezzg==
X-Received: by 2002:a62:2c85:: with SMTP id s127mr25398173pfs.55.1568493050583; 
 Sat, 14 Sep 2019 13:30:50 -0700 (PDT)
Received: from localhost (amx-tls3.starhub.net.sg. [203.116.164.13])
 by smtp.gmail.com with ESMTPSA id h18sm5378122pjt.18.2019.09.14.13.30.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Sep 2019 13:30:49 -0700 (PDT)
Date: Sat, 14 Sep 2019 13:30:49 -0700 (PDT)
X-Google-Original-Date: Sat, 14 Sep 2019 13:30:13 PDT (-0700)
In-Reply-To: <f3f7e9fdb539df1aa4c5f2b64db5847ad8d2eaee.1566603412.git.alistair.francis@wdc.com>
CC: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, alistair23@gmail.com,
 Atish Patra <Atish.Patra@wdc.com>, Anup Patel <Anup.Patel@wdc.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Alistair Francis <Alistair.Francis@wdc.com>
Message-ID: <mhng-d02a4b9d-36d3-4d6c-9616-8a73edaca517@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.210.193
Subject: Re: [Qemu-riscv] [PATCH v1 14/28] target/riscv: Generate illegal
 instruction on WFI when V=1
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 14 Sep 2019 20:30:55 -0000

On Fri, 23 Aug 2019 16:38:26 PDT (-0700), Alistair Francis wrote:
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/op_helper.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
> index d150551bc9..beb34e705b 100644
> --- a/target/riscv/op_helper.c
> +++ b/target/riscv/op_helper.c
> @@ -130,9 +130,10 @@ void helper_wfi(CPURISCVState *env)
>  {
>      CPUState *cs = env_cpu(env);
>
> -    if (env->priv == PRV_S &&
> +    if ((env->priv == PRV_S &&
>          env->priv_ver >= PRIV_VERSION_1_10_0 &&
> -        get_field(*env->mstatus, MSTATUS_TW)) {
> +        get_field(*env->mstatus, MSTATUS_TW)) ||
> +        riscv_cpu_virt_enabled(env)) {
>          riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
>      } else {
>          cs->halted = 1;

Reviewed-by: Palmer Dabbelt <palmer@sifive.com>

