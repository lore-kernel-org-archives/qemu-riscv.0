Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pFTFm-0001Y2-Tb
	for mharc-qemu-riscv@gnu.org; Wed, 11 Jan 2023 00:02:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pFTFk-0001U6-VC; Wed, 11 Jan 2023 00:02:20 -0500
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pFTFj-0004TA-83; Wed, 11 Jan 2023 00:02:20 -0500
Received: by mail-vs1-xe34.google.com with SMTP id 3so14564716vsq.7;
 Tue, 10 Jan 2023 21:02:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=JaKX4u37aTWkO2V9iJYFOqpb4Hx9pLyzHtLcnzVOI/4=;
 b=Cm9pEwd0wbm/ZkH+u11+GLx+i5Mx6VZoMplRCi24JxwQsJi3QNPJyp60OEcCxSNvTS
 j+u/Lzu9QyRcIhNuYVtJ/xjMvZExF1tA99xCn9iVrSIDbjQFt4f+rrFmcgw+dsIqzc/Y
 K+M5zdvrAxbHa8RkYslrfmiLtBSrv4MXXk4YMYPTv1F4PQVpkXJPU4BIlVtG7KfOetq3
 ioEyt/S91Ctizfr+emHk4TosBmQaDG8FlDosdcJwGgn1HYfP5eKGIMIfrfL21cQgulHA
 oG+QcsR6M/5WllPwGdX2pU3WwOzkhwnETK05De7uVFNtrlS3S+bKFZmN/XYqMyGZf1q4
 scjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JaKX4u37aTWkO2V9iJYFOqpb4Hx9pLyzHtLcnzVOI/4=;
 b=0CeUDJtruUpb19Ek1PO3k3YmFycYcCLeT4mCFqnASiFvnJuxL7c6r17jMby6tsHmv2
 TSQhEehbwyaeasLjB+NlDnIgjDY+OBHe4QJWMQ2g68u+D3u41nHiOPrwtF9ncSUtHSXg
 Ej7Qbevw9wr5qzlIyMHPFUtr1RkYU/Gx22QgxQHmrhZgO88viTyR4IkJihP6vNhBvaOV
 QkIF7I4FP4ssy2mdNKDhb4o0ejXdxOrqRgNNTv2mqJkrussNt6TYZLLkk3UVnDk9/qV0
 ixxdRW+Owgwmavw0YQQXNSYybCGHeP+YyvrWV8YQ59E1y2KM0zDsvC3Cb1GbKQy3aBXK
 yhWw==
X-Gm-Message-State: AFqh2kptTCIhwyGuvk53cXaDitQSHCTJlcNznZ+eBcodr4t+5x9h7ihh
 oQMC5xABT9jABIVQeCNulxw4V2qLEnG2Md9P+KY=
X-Google-Smtp-Source: AMrXdXtQO6s4AGq0C6dqhTq73sgbXCMCFZtcv1rwpveQGiSPVlV/Nvhsr+4tcmjZ284sf9CeSiTrOTCTa5oZEHY0w8k=
X-Received: by 2002:a05:6102:510e:b0:3b1:2b83:1861 with SMTP id
 bm14-20020a056102510e00b003b12b831861mr9412409vsb.10.1673413337946; Tue, 10
 Jan 2023 21:02:17 -0800 (PST)
MIME-Version: 1.0
References: <20230110201405.247785-1-dbarboza@ventanamicro.com>
In-Reply-To: <20230110201405.247785-1-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 11 Jan 2023 15:01:51 +1000
Message-ID: <CAKmqyKM=7Ld0FuZ7FfzTKznpM5Zq1xzAKd-iVxqjk6TPbred2g@mail.gmail.com>
Subject: Re: [PATCH 0/2] target/riscv/cpu: fix sifive_u 32/64bits boot in
 riscv-to-apply.next
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 richard.henderson@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e34;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe34.google.com
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
X-List-Received-Date: Wed, 11 Jan 2023 05:02:21 -0000

On Wed, Jan 11, 2023 at 6:17 AM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Hi,
>
> I found this bug when testing my avocado changes in riscv-to-apply.next.
> The sifive_u board, both 32 and 64 bits, stopped booting OpenSBI. The
> guest hangs indefinitely.
>
> Git bisect points that this patch broke things:
>
> 8c3f35d25e7e98655c609b6c1e9f103b9240f8f8 is the first bad commit
> commit 8c3f35d25e7e98655c609b6c1e9f103b9240f8f8
> Author: Weiwei Li <liweiwei@iscas.ac.cn>
> Date:   Wed Dec 28 14:20:21 2022 +0800
>
>     target/riscv: add support for Zca extension
>
>     Modify the check for C extension to Zca (C implies Zca)
> (https://github.com/alistair23/qemu/commit/8c3f35d25e7e98655c609b6c1e9f103b9240f8f8)
>
>
> But this patch per se isn't doing anything wrong. The root of the
> problem is that this patch makes assumptions based on the previous
> patch:
>
> commit a2b409aa6cadc1ed9715e1ab916ddd3dade0ba85
> Author: Weiwei Li <liweiwei@iscas.ac.cn>
> Date:   Wed Dec 28 14:20:20 2022 +0800
>
>     target/riscv: add cfg properties for Zc* extension
> (https://github.com/alistair23/qemu/commit/a2b409aa6cadc1ed9715e1ab916ddd3dade0ba85)
>
> Which added a lot of logic and assumptions that are being skipped by all
> the SiFive boards because, during riscv_cpu_realize(), we have this
> code:
>
>     /* If only MISA_EXT is unset for misa, then set it from properties */
>     if (env->misa_ext == 0) {
>         uint32_t ext = 0;
>         (...)
>     }
>
> In short, we have a lot of code that are being skipped by all SiFive
> CPUs because these CPUs are setting a non-zero value in set_misa() in
> their respective cpu_init() functions.
>
> It's possible to just hack in and fix the SiFive problem in isolate, but
> I believe we can do better and allow all riscv_cpu_realize() to be executed
> for all CPUs, regardless of what they've done during their cpu_init().
>
>
> Daniel Henrique Barboza (2):
>   target/riscv/cpu: set cpu->cfg in register_cpu_props()
>   target/riscv/cpu.c: do not skip misa logic in riscv_cpu_realize()

Thanks for the patches

I have rebased these onto the latest master and dropped the other
series. That way when the other series is applied we don't break
bisectability.

Alistair

>
>  target/riscv/cpu.c | 525 +++++++++++++++++++++++++--------------------
>  target/riscv/cpu.h |   4 +
>  2 files changed, 292 insertions(+), 237 deletions(-)
>
> --
> 2.39.0
>
>

