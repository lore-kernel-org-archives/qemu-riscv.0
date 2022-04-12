Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ne47m-0004Pc-Lx
	for mharc-qemu-riscv@gnu.org; Mon, 11 Apr 2022 20:11:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ne47l-0004Oj-1y; Mon, 11 Apr 2022 20:11:13 -0400
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133]:46729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ne47j-0007E4-3z; Mon, 11 Apr 2022 20:11:12 -0400
Received: by mail-il1-x133.google.com with SMTP id f5so664500ilj.13;
 Mon, 11 Apr 2022 17:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=y+2cJ4XLBJjq2wqhT1NvZHOCVv0sA032dzQwobARL1U=;
 b=iCK0/wiksW6d7nZ4+WMtQtuPIVs9NPOL+xCD0UbLqWYe0ckFJmtZf80TUDekW3wUMi
 dCyYyT78Bi08C/JtjhRtBrHMVtNnfv0Pt/B5qlJnZYDqHGSW2W5TiBgJ6g6c0SeGn0vS
 SbUXOHnrC0POUNSKoskOFE2h6IXm/WOTpii3vcayoN1/jqNirPqeFsALgSFg6EylV8gm
 ld6cIP8+wu93MwYnCz/ynTtYPPxKy54LmuwRutB+XnCiXauhHa5wACurLkShlXjrL4i6
 QVYFKt1hIs5ZdtwfNvWfTv2pqF1ZZUPJKk3ws8j+ktREHBXJDogNA22s9Br44P/H0HB2
 AmTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y+2cJ4XLBJjq2wqhT1NvZHOCVv0sA032dzQwobARL1U=;
 b=nEP79gJv0ftZPFjWiDUXo1r8gDdYbNK2LFXGX4EEa57k1s7TW07Cj0RoRe5IUmeeQ/
 zsC+ZTagISHgfirwW/jzoOOjpIiwRxM44mlL8BRFgHNRuU6x6zqqgzMJ9DinTmZ9194x
 KGdkarhjXYNPJzDHHcFOBIdwyMgzP2t2Jz0mIVkeiqSSqKMi64HTE1KAC//b+uJOCXsi
 cnKd4gHfUo7YjgrMSGQjLb0LVjxW+x310lmYY2zlPHrhcd3RaHz5DPqzHdQzbHYdxFQ2
 Xhe1a4t8SYoCvcGYuGBAQp+t8A5hFZpS1hmgpsAzoBCRmCq98emB4CWMClTXv5VueXS4
 YcSw==
X-Gm-Message-State: AOAM531mIN9A5r2NP60sEFSHfyNgmrqyEdgi61hP33ZIdutzssYriVS/
 kKgXFPkliDTvPap1S74xVBVojYWYuCIxgYSxpj8=
X-Google-Smtp-Source: ABdhPJxN+fncO04OSbymUBCUIeyKhXu2DVK+jY0DnjdB++qyDPEHBl3uMx4yhbGcFDZKQJPTwo6HwKhU9TsOwP3+ZLY=
X-Received: by 2002:a05:6e02:219b:b0:2ca:9f50:998 with SMTP id
 j27-20020a056e02219b00b002ca9f500998mr5247365ila.55.1649722269687; Mon, 11
 Apr 2022 17:11:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220401125948.79292-1-richard.henderson@linaro.org>
In-Reply-To: <20220401125948.79292-1-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 12 Apr 2022 10:10:43 +1000
Message-ID: <CAKmqyKOkRv7LDDrCgPENbXXv12S7+PWzkzGM=URiDtEHiHHNkw@mail.gmail.com>
Subject: Re: [PATCH 0/2] target/riscv: Annotate atomic operations
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::133;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x133.google.com
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
X-List-Received-Date: Tue, 12 Apr 2022 00:11:13 -0000

On Fri, Apr 1, 2022 at 11:00 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> If an atomic operation fails on RISC-V, we want to generate
> a store/amo fault and not a load fault.
>
> Annotate amo insns, so that we can recognize them after unwinding.
> Transform the implementation access type to store/amo for reporting.
>
>
> r~
>
>
> Richard Henderson (2):
>   target/riscv: Use cpu_loop_exit_restore directly from mmu faults
>   target/riscv: Mark amo insns during translation
>
>  target/riscv/cpu.h                      | 15 ++++++
>  target/riscv/cpu.c                      |  3 ++
>  target/riscv/cpu_helper.c               | 62 +++++++++++++++++--------
>  target/riscv/translate.c                |  9 ++++
>  target/riscv/insn_trans/trans_rva.c.inc | 11 ++++-
>  5 files changed, 79 insertions(+), 21 deletions(-)

Thanks!

Applied to riscv-to-apply.next

Alistair

>
> --
> 2.25.1
>
>

