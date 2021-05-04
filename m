Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ldlUf-0001KD-P6
	for mharc-qemu-riscv@gnu.org; Mon, 03 May 2021 23:13:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ldlUd-0001Jh-CT; Mon, 03 May 2021 23:13:04 -0400
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30]:45758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ldlUb-0005ey-Rz; Mon, 03 May 2021 23:13:03 -0400
Received: by mail-yb1-xb30.google.com with SMTP id g38so10310904ybi.12;
 Mon, 03 May 2021 20:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zAI4LKeE/5i46/kG36UBmTgShSQGZEFeYdnb80hFq1o=;
 b=H1OFQbNtLoSIP8Ab8XkyTVex7Smzygm5J5hpgZ3krqpIyCsB75rzIYRRXGNljCbs/3
 8zr7gi1tXkajt2Je7SMGFKsPZfRQKafF0UTQK95FaHVK3Q53mj89XMM/sUIlbvdI8jLs
 bO9RaHP4nCMfJwTIJnYPwrfNE0/uUekuIiiDT7u4es3M0wetwxujvaxh2W658Usbsg2e
 Cm1g1wgttUjAq+/ka36k8+Oh6pk8da4HJ7wGiftBfA13spO4blR1+GOt1iYy2j1zvK/N
 X7iehCwkSwSJrAb/PDWmvnY5IgO6JgcqRq8sbH0Cv+vMxSNLdr68q3oceLrfnHY+lMkT
 +95w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zAI4LKeE/5i46/kG36UBmTgShSQGZEFeYdnb80hFq1o=;
 b=QKeUSEhWE/EdoxfQsH8JhgLASEzmznilhK/uEVuWzyeWV+b5aWBwwMlxwA4eIfMZDH
 ZNf+cf3xMcWxrxaC4asCafUQ/Ggmu7bdTq1g+p3P2xtcZwZsplAeKPpVPFp9t+1uQJms
 ANFh/ptSeDGCTVzQf2pMu1ozBk7eps1GuyYVtLlgG6Viz7SvwbIOKbO1LFa2zpooXddK
 YBhfvf+yWJ5lApoxn5PeHljjyAVE09Sc8NspX/bqxebhNDtHZczyC3HqVevifDiDBte2
 /uc9k3WKdLsikblBD0Ujg3a8xzmZ0QCS64Q1b6qk+/5es/HhNig9lJgitcrYglnEbA5U
 s87A==
X-Gm-Message-State: AOAM530M5RlGjd3whB3SSL3mcyPQVqaAkbCjaT5uhw4sXUPpyeeGEXht
 YLGqnxZc0RCu3CvCJAAanLWZXntaZBhMT/MmG1I=
X-Google-Smtp-Source: ABdhPJwSWWZWhpkVRtUPY2ZkzeHCwC2XyzffAXHhMx9Fox/2LarLFD34Ja+9d0x8R9KYU6oDra2EzsVAfhHLAQcZAQQ=
X-Received: by 2002:a25:5743:: with SMTP id l64mr26524368ybb.314.1620097979904; 
 Mon, 03 May 2021 20:12:59 -0700 (PDT)
MIME-Version: 1.0
References: <4f1c261e7f69045ab8bb8926d85fe1d35e48ea5b.1620081256.git.alistair.francis@wdc.com>
In-Reply-To: <4f1c261e7f69045ab8bb8926d85fe1d35e48ea5b.1620081256.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 4 May 2021 11:12:48 +0800
Message-ID: <CAEUhbmUK+XXWrBor4o_HJpoeqbiw9GJY-c7yTr2UMKHFyVdkEw@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] docs/system: Move the RISC-V -bios information to
 removed
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb30.google.com
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
X-List-Received-Date: Tue, 04 May 2021 03:13:04 -0000

On Tue, May 4, 2021 at 6:34 AM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> QEMU 5.1 changed the behaviour of the default boot for the RISC-V virt
> and sifive_u machines. This patch moves that change from the
> deprecated.rst file to the removed-features.rst file and the
> target-riscv.rst.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  docs/system/deprecated.rst       | 19 -------------------
>  docs/system/removed-features.rst |  5 +++++
>  docs/system/target-riscv.rst     | 13 ++++++++++++-
>  3 files changed, 17 insertions(+), 20 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

