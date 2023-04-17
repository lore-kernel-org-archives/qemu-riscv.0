Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1poF5R-0002uo-H1
	for mharc-qemu-riscv@gnu.org; Sun, 16 Apr 2023 22:59:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1poF5P-0002uL-N2; Sun, 16 Apr 2023 22:59:23 -0400
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1poF5O-0005YI-4V; Sun, 16 Apr 2023 22:59:23 -0400
Received: by mail-vs1-xe34.google.com with SMTP id b26so21893053vsa.11;
 Sun, 16 Apr 2023 19:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681700360; x=1684292360;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Xk2dt18vvurekovHf1/0W3rYHrcI5o/GJokgI7GUq/s=;
 b=D+4NKJraHtP3fNS0+2xE2yiIYVuDOwMWuKUL9kyh4ixCzVf9Mq3IE6QXSsbszMgaK1
 LxDJEvTVYh13/7Lt5cToT673pmakOZ0/m6GorROaE/7lbxfgQFWa0n9B0e3oDuq5CVf8
 xZ4UstuCbmMLpO60F+Ioqpt27/zMI7xtZS25q5QpJa7zZBTVboXM43brGBcnLI2q8y5k
 yyBIpq3xPj2p1pw6ZObZ23G4kwnZlPr9dYaUOdAYpYo+HDwdXXw97ose60wYWxpQFW5z
 omrZtzEgQSNdjzbyNFCiQNBdxMibGWMygQv9cW2kLLcjYGe2+3kdTMHefLl/plRrw21F
 tcMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681700360; x=1684292360;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Xk2dt18vvurekovHf1/0W3rYHrcI5o/GJokgI7GUq/s=;
 b=T4v8EN8ztiBAYDewJs7j9SHl6jI7t7nY+fZ59I1QAQud87kyEVWdRVfY+jjbMuifad
 5a9bhYCOPk9LtLQlbek48fCsTmFmVczLo4SscYyLc47kpBeelLtqM4XUOlH5lxCmQLCq
 xBtCvnsB67ocI4ZJYythkZHPXFuJHfVmI0+uJskAVno1nhOziM4OUgn4WjVm4cXR6MoV
 WJbiuEUk8Djha6fiG8Aq2GIwLIukBa7ZI9oTvzdWUmN+64M2rhdY0mng82rJ6LhnUKpg
 H56FqFFCXp54GCVOdxGEIIYLSzhQOMS/9gZNamfk26hqYgNf9xnODyxMLxg3T5whrjig
 M2CA==
X-Gm-Message-State: AAQBX9cudiLHpjOakjyvhHyPMsgAzK9X4L/Cy1l5ES844TNrqliulYB+
 bWfcsX39Pw/6yrYpibBfrYZ/neHJMm4hNRvOoOA=
X-Google-Smtp-Source: AKy350ZZrAiiT6MI4So7E7rj3nMRkjo8SWO7XtBUxK+wG3bQwWwpGX6nblb2HSkXv6ljnDb7F+8Bru5MV8JGMFsGwts=
X-Received: by 2002:a67:d71c:0:b0:422:1654:7737 with SMTP id
 p28-20020a67d71c000000b0042216547737mr7092263vsj.3.1681700360614; Sun, 16 Apr
 2023 19:59:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230411183511.189632-1-dbarboza@ventanamicro.com>
In-Reply-To: <20230411183511.189632-1-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 17 Apr 2023 12:58:54 +1000
Message-ID: <CAKmqyKMhA5=f99rzxp63-vqiUCZwEuWmAZK76=ZKUrni-CTauQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] target/riscv: implement query-cpu-definitions
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, richard.henderson@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e34;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe34.google.com
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
X-List-Received-Date: Mon, 17 Apr 2023 02:59:24 -0000

On Wed, Apr 12, 2023 at 4:36=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Hi,
>
> In this v3 I removed patches 3 and 4 of v2.
>
> Patch 3 now implements a new type that the generic CPUs (any, rv32,
> rv64, x-rv128) were converted to. This type will be used by
> query-cpu-definitions to determine if a given cpu is static or not based
> on its type. This approach was suggested by Richard Henderson in the v2
> review.
>
> Patches are based on top of Alistair's riscv-to-apply.next.
>
> Changes from v2:
> - old patches 3 and 4: removed
> - patch 3:
>   - add TYPE_RISCV_DYNAMIC_CPU
>   - use this type to set 'q_static' in riscv_cpu_add_definition()
> - v2 link: https://lists.gnu.org/archive/html/qemu-devel/2023-04/msg01310=
.html
>
> Daniel Henrique Barboza (3):
>   target/riscv: add CPU QOM header
>   target/riscv: add query-cpy-definitions support
>   target/riscv: add TYPE_RISCV_DYNAMIC_CPU

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  qapi/machine-target.json      |  6 ++-
>  target/riscv/cpu-qom.h        | 70 +++++++++++++++++++++++++++++++++++
>  target/riscv/cpu.c            | 20 ++++++++--
>  target/riscv/cpu.h            | 46 +----------------------
>  target/riscv/meson.build      |  3 +-
>  target/riscv/riscv-qmp-cmds.c | 57 ++++++++++++++++++++++++++++
>  6 files changed, 150 insertions(+), 52 deletions(-)
>  create mode 100644 target/riscv/cpu-qom.h
>  create mode 100644 target/riscv/riscv-qmp-cmds.c
>
> --
> 2.39.2
>
>

