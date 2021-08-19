Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mGd2R-0001EC-SO
	for mharc-qemu-riscv@gnu.org; Thu, 19 Aug 2021 04:04:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mGd2L-00014t-NC; Thu, 19 Aug 2021 04:04:29 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:46998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mGd2F-0005u0-K2; Thu, 19 Aug 2021 04:04:26 -0400
Received: by mail-yb1-xb35.google.com with SMTP id k65so10646384yba.13;
 Thu, 19 Aug 2021 01:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EDglccKS3oYSgWtld6iRjPjTvFZbU9bmDrPkx1gqxJU=;
 b=jUY+ZoigydXG8zdBMEtiRwFfz+s0ElPYos1c/H6BpW9Ggd4T68UO46xdEQ0hGz5wrz
 FjYyrZI24AO8GAssmFDdlzzM6UIX2dcK6qul9VfsSVmOCah3e8HAEj+RbpLsqa3L0DX5
 kUHWJTzmXBBPmVrQF/mvOZgzjeRafLYeDFPrFKdvsWRPqlJZq4lTNwjLcbA86VE3oqjC
 UFNn6GKpGhE638mjGMpTjaNSx8tX03Owk5MhHcM8auYksjwuI2H6c10I1MNcXDbD4czU
 8Ibxbej8W1ZgTK/zETNLwgWaPZeL+m0m6vRBVjIZRr/0dJ2SAQyf3hRBCtmM3JThFjtj
 9/cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EDglccKS3oYSgWtld6iRjPjTvFZbU9bmDrPkx1gqxJU=;
 b=PJt6GARMX/M0Cuhgx20KjbcR5A2O+wW7q/HOxXj6oVD6h+jUb8a92v87jabOffyj5E
 oDMXeRx5It+uF8uNWYd9sQBLB5FQan+8PVlAOtHWqqFOX24y9NPHJICVmFncs9tVuSrK
 ykM0DniG7fb0tc9dVC21ybDzjWTBXBVxIzb24QlQ3J2RmOuaRUqGpb65IAnCDDQJZHlU
 p0GTPc1fSw0Sf5Ao1lHXE/5fnzQrN6/OPudFaZ0RI++s08E0rfieLEG7XkuDULVmggvh
 +azlpyX7fpT+eOI0JCnbbPXtHgKe0LR2P45F/0MwfljDqYb76viOslhimbNKIMfHKewR
 EieA==
X-Gm-Message-State: AOAM532D4Z3wLntEPs80arCK6+rA7ekceqknLmBx/gDX+BYAmW5KVImp
 HNO/txDEqh2oMPDaExTu7ObRrGVFb201sGWcot4=
X-Google-Smtp-Source: ABdhPJykugWU3ImgnPfOnoIvn/xZFGH2eZ8UdLTyqfErc26YtU1I25KITWGpcMbdjZSwRVC287nbjF5dfL05Ww5tcqA=
X-Received: by 2002:a25:2646:: with SMTP id m67mr16602797ybm.122.1629360260610; 
 Thu, 19 Aug 2021 01:04:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210817211803.283639-1-richard.henderson@linaro.org>
 <20210817211803.283639-20-richard.henderson@linaro.org>
In-Reply-To: <20210817211803.283639-20-richard.henderson@linaro.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 19 Aug 2021 16:04:09 +0800
Message-ID: <CAEUhbmVXkHrrA7se0AYvzR=4jp+V2OCA707ajm4+Garj+cx0Eg@mail.gmail.com>
Subject: Re: [PATCH v2 19/21] target/riscv: Use {get,dest}_gpr for RVD
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 liuzhiwei <zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb35.google.com
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
X-List-Received-Date: Thu, 19 Aug 2021 08:04:30 -0000

On Wed, Aug 18, 2021 at 5:30 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/riscv/insn_trans/trans_rvd.c.inc | 125 ++++++++++++------------
>  1 file changed, 60 insertions(+), 65 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

