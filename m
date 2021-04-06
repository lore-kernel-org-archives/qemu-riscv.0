Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lTh8E-0005ai-L6
	for mharc-qemu-riscv@gnu.org; Tue, 06 Apr 2021 04:32:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lTh8C-0005Xk-Or; Tue, 06 Apr 2021 04:32:16 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31]:43853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lTh8B-0005z3-2x; Tue, 06 Apr 2021 04:32:16 -0400
Received: by mail-yb1-xb31.google.com with SMTP id i143so7245801yba.10;
 Tue, 06 Apr 2021 01:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VrmbqjDy2RIRuHvd8EdwzjlxX1J1dGVamCx0jO6lFjU=;
 b=d7KV8Vm/mu/QMqlPI9IsuljPKj/6ErPcSOsBc7eyUcOReUcoNcyqQ6hqzsW/kChV5U
 VB6umfawv7sZuEq0t9Y03f9bGsm0CFgasZ96D23TenJ1qMOD7Xeb37mkl/YHgQ12eS/1
 ZtyQx4LD+RTZTxiwktdu8Sc1pi7yJWwnNpuRsXvpxUhk+t5kU6O3nPbiGZccLEOR5Hry
 t9nrvjhAUlxyjHtaG59q+S+0FgsL+ffYR69OCrvgvcVJb9Pf7Es1nIatHX4kzpaWdGHa
 lkUKN/Z0zMF/QeYtRlqyDf+xNJjCMwwOAMNaqi5umfAE1qinu8Ny3DDb/y0bvSkQtzaK
 ywhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VrmbqjDy2RIRuHvd8EdwzjlxX1J1dGVamCx0jO6lFjU=;
 b=dlnjLY9fC2s8AoWsSKVHlr8EmiOkD1ynQSuMEDUoPqyeYbILmLBbSy8oT4FKSqMfNP
 MUEyMIN5d2evM8mM23+Svc0VEvEUo60JQOeXlx07+X/GL7u7XOAnOZW//D/S72nSE6Vz
 CG6eVpoTsgCj7dJN8NcsM8HjEeVdXWIA1zhRhFyT22PjFzcT4gpfWRA6VFOSUkdzdMWK
 5BuAmkfWm0lZFWhfSA/Nl858U9ytWNoshGUY8762jjuFn1IhxaKJH+IsHoJzwxJBzdHX
 vh5dxh4YU+lhUTpLniKZ5MypKXHsm/mpdibwIuXPTPo6vOkifoN8KEDmMe+qTut1ayMe
 No1A==
X-Gm-Message-State: AOAM532HvoJKqf2CTl7vDCztXw3KOPS5ujcO4XqM9+gOlYcRwdYL19L+
 NWMNf0ei0XyF+TIsAEPfEjhTlzSxTFmkB1GvV2E=
X-Google-Smtp-Source: ABdhPJyHctZAsyztdGAxaJumhOP8MJaHBdLRLCwF+CHt7C5jV3Jq6AIwUGXJQnHocFE26yqEoHv5yLIRTbwDzcX5c0g=
X-Received: by 2002:a25:5146:: with SMTP id f67mr40964654ybb.332.1617697933657; 
 Tue, 06 Apr 2021 01:32:13 -0700 (PDT)
MIME-Version: 1.0
References: <e92b696f1809c9fa4410da2e9f23c414db5a6960.1617202791.git.alistair.francis@wdc.com>
In-Reply-To: <e92b696f1809c9fa4410da2e9f23c414db5a6960.1617202791.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 6 Apr 2021 16:32:02 +0800
Message-ID: <CAEUhbmXLHVck3ee1v_DR4WCNxjW7Uhw4VKQ4jv9U37aBtqTySw@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] hw/opentitan: Update the interrupt layout
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Tue, 06 Apr 2021 08:32:17 -0000

On Wed, Mar 31, 2021 at 11:02 PM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> Update the OpenTitan interrupt layout to match the latest OpenTitan
> bitstreams. This involves changing the Ibex PLIC memory layout and the
> UART interrupts.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  include/hw/riscv/opentitan.h | 16 ++++++++--------
>  hw/intc/ibex_plic.c          | 20 ++++++++++----------
>  hw/riscv/opentitan.c         |  8 ++++----
>  3 files changed, 22 insertions(+), 22 deletions(-)
>

LGTM

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

