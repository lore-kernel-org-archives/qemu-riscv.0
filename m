Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1miaUG-0002e1-28
	for mharc-qemu-riscv@gnu.org; Thu, 04 Nov 2021 07:00:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1miaUE-0002dG-G3; Thu, 04 Nov 2021 07:00:50 -0400
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:40687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1miaUC-0002ZH-E4; Thu, 04 Nov 2021 07:00:50 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id 131so13481402ybc.7;
 Thu, 04 Nov 2021 04:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TLRme9Dl3B3TRzjnmeLDUIqW/ETgB53gkpy7gp9WniU=;
 b=VeKuSFyMZ234mI8QSpVEvdQ+cDwvlTb3yu8ZGiWfz7804k85XwEqJT3XlM+cTbkPWd
 ax7IXvTBhszdJotEasjhMg+Hkv9Ce/M7QiuAr02fMVCDbnPTdfF7NgIuKfExuymIo0GF
 ejkJ2EY2c+74DNd+lrDo/IZ5irHieBbccbNySOmAU3+XD3eH9LOLNjOjnicwCDEoD2A9
 /uibABQQMxetfLXmF8PsatK0ACOBtAP5C1WZSnnqmCzvb+I+yZYZp1XOUBWWLvP9BtNb
 AXu45NQynj57dmF5yTV3uVFrvt6YyGJ+R2mK8Quu7zVkIicakw1mIKTTvpbixLENDhzL
 RNzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TLRme9Dl3B3TRzjnmeLDUIqW/ETgB53gkpy7gp9WniU=;
 b=0geIZF33mxLOR32TRle+gL/i+s3Ovkt+gYmQDcIu3wuhA4dKhS2fW8ZNvnQ2evYYBJ
 I7oZey/7a11TTcElwhyQfaxo9z2tRowZvTnNoIgJ2fC6QfKValcPUTXjaQLojF0ecHjH
 Lm1MtK6GL42UGkOVfSOYJPRUuDR9awN4kbw6UJsKQGYItDHI3WKiJ8/PwXvPejKadoMt
 5KsP9s/I7UbVM6vcteh+wToP3dnq432thAYAnBSyTK7SZVLet0ehd3Vu9vn7DJuXbsft
 kAza3m1+Lc4lHw7TdWefaeZElhtnnQnJDlqLTp/4bna0ap/Gg7m5TbeI4waCkWwlWSus
 jv1A==
X-Gm-Message-State: AOAM531t9d1clzEdvyIe/NdM4747zICxrBljJBUhFQXnO8LXXOettgU4
 FNcaXXUMokPMcGAWlPA2KaCtw5ephi7yJ6/Ufyw=
X-Google-Smtp-Source: ABdhPJzlV+J12dGWlfEYJlBtDbLtUDX8IyyP38Q0bi/bxaZjRlvOV8u7jZXzbnmfd7l5exWuQMmFxYQ48JCh2k+gqpY=
X-Received: by 2002:a25:42c7:: with SMTP id
 p190mr45925696yba.332.1636023643767; 
 Thu, 04 Nov 2021 04:00:43 -0700 (PDT)
MIME-Version: 1.0
References: <20211025195601.245631-1-atish.patra@wdc.com>
 <20211025195601.245631-2-atish.patra@wdc.com>
In-Reply-To: <20211025195601.245631-2-atish.patra@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 4 Nov 2021 19:00:32 +0800
Message-ID: <CAEUhbmUTyHM3ck3pHQdKyxm-tvX8YmExS=z7-tR9LqRYXSSrnQ@mail.gmail.com>
Subject: Re: [ PATCH v3 01/10] target/riscv: Fix PMU CSR predicate function
To: Atish Patra <atish.patra@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Thu, 04 Nov 2021 11:00:50 -0000

On Tue, Oct 26, 2021 at 4:39 AM Atish Patra <atish.patra@wdc.com> wrote:
>
> The predicate function calculates the counter index incorrectly for
> hpmcounterx. Fix the counter index to reflect correct CSR number.
>

Fixes: e39a8320b088 ("target/riscv: Support the Virtual Instruction fault")

> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  target/riscv/csr.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

