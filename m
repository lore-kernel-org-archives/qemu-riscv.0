Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1osxAu-0004by-K2
	for mharc-qemu-riscv@gnu.org; Wed, 09 Nov 2022 21:20:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1osxAr-0004ai-U9; Wed, 09 Nov 2022 21:20:13 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1osxAq-0002wt-0V; Wed, 09 Nov 2022 21:20:13 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 u8-20020a17090a5e4800b002106dcdd4a0so3590309pji.1; 
 Wed, 09 Nov 2022 18:20:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZScouAwTxaDxDb9chSVnibZWUq+ZYPBEN0iDOjCSd4k=;
 b=QqOQEKAv+rFsJnzqnTmZi7QY2+hnMfktslTM1cMcVFQTmscTIveKr9CAGJs6vN9Qn3
 W2nLAJqiebdh/Ph0uXQB/V5l7jq+W7priD+TYZ43zkZ5Ek8GOnVNrcaMjwjKrhGzH4nf
 trDNIqksWnYYV8B6A9Af7BC693nGzxy9BMRgHKQiIMufc7vlMDez359kvW8DAexp5m8L
 IG4mjdwKmEIBeEKWG+jgEzMAFgbl/NWVkddBz/6pNnNet0ciC4drsnCuLYkfW/2ZKTVn
 CHmGLa/Uc3fZ+0vJWXya0YVyUnrz+HbZvKgTBnZBcpELtVUBvzDR+No5dVZrD99Ou53X
 EYsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZScouAwTxaDxDb9chSVnibZWUq+ZYPBEN0iDOjCSd4k=;
 b=EMzXMIlYd9ynmIezR3RJftWcB0zSKCVX02FputIs+n3FsBgmT9mlCs77TbKV46VYdl
 iif8tkxlpy1OOtXUU+ERPXfUVONUMA6L5Bba7+CjRYGmBrB9e5MeTWepXniCnls42gtw
 7mOhwe3Hz1vyPctck5fpByjIjTAr3bfpW2JqOZjfrPZf0i8eFZ9/xkuQD7Y0uM0VASlJ
 29JDDq+71+PjSYZKEWXQWw7esIdMNIlzuvzaVtt7AwcL94ZAsCAW2JynujGAvqcAFUCP
 p3Obrs9G3TUo9gkq0WzC/PCqe+b4V/uNv9GkIeXpC0pXCUDUPdLjycipYLVsJhCPRmNu
 iLNw==
X-Gm-Message-State: ACrzQf04rRujQ4Z5C85DeUIc3mUwugsK8m4VOZ/Fx8J/Pkb6xjpTsgmi
 /sFPUkNbxQW1zWekGC1KzG/2e7VNSFroJ8aXNGo=
X-Google-Smtp-Source: AMsMyM5+dEdb5q6xwZWg/wOqK6YwTqX0RkXifS0QZPE9FutMCg8SER190fKcF3u7Qe3VtY0uU9TCk0lw76426k2IDII=
X-Received: by 2002:a17:902:7294:b0:187:146c:316f with SMTP id
 d20-20020a170902729400b00187146c316fmr57586185pll.149.1668046809121; Wed, 09
 Nov 2022 18:20:09 -0800 (PST)
MIME-Version: 1.0
References: <20221016124726.102129-1-mchitale@ventanamicro.com>
In-Reply-To: <20221016124726.102129-1-mchitale@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 10 Nov 2022 12:19:42 +1000
Message-ID: <CAKmqyKPWCDRrAT8g5OmdmKeX1v6VK-a-0vNJc65oTeg2m7NF8Q@mail.gmail.com>
Subject: Re: [PATCH v11 0/5] RISC-V Smstateen support
To: Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=alistair23@gmail.com; helo=mail-pj1-x1035.google.com
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
X-List-Received-Date: Thu, 10 Nov 2022 02:20:15 -0000

On Sun, Oct 16, 2022 at 10:48 PM Mayuresh Chitale
<mchitale@ventanamicro.com> wrote:
>
> This series adds support for the Smstateen specification which provides a
> mechanism to plug the potential covert channels which are opened by extensions
> that add to processor state that may not get context-switched. Currently access
> to *envcfg registers and floating point(fcsr) is controlled via smstateen.
>
> These patches can also be found on riscv_smstateen_v11 branch at:
> https://github.com/mdchitale/qemu.git
>
> Changes in v11:
> - Rebase to latest riscv-to-apply.next
> - set virt_inst_excp at the begining of decode_opc
> - Add reviewed by in patch 4
>
> Changes in v10:
> - Add support to generate virt instruction exception after decode failure.
>   Use this change for smstateen fcsr failure when virt is enabled.
> - Implement single write function for *smstateen1 to *smstateen3 registers.
>
> Changes in v9:
> - Rebase to latest riscv-to-apply.next
> - Add reviewed by in patches 2 and 4
>
> Changes in v8:
> - Rebase to latest riscv-to-apply.next
> - Fix m-mode check for hstateen
> - Fix return exception type for VU mode
> - Improve commit description for patch3
>
> Changes in v7:
> - Update smstateen check as per discussion on the following issue:
>   https://github.com/riscv/riscv-state-enable/issues/9
> - Drop the smstateen AIA patch for now.
> - Indentation and other fixes
>
> Changes in v6:
> - Sync with latest riscv-to-apply.next
> - Make separate read/write ops for m/h/s/stateen1/2/3 regs
> - Add check for mstateen.staten when reading or using h/s/stateen regs
> - Add smstateen fcsr check for all floating point operations
> - Move knobs to enable smstateen in a separate patch.
>
> Changes in v5:
> - Fix the order in which smstateen extension is added to the
>   isa_edata_arr as
> described in rule #3 the comment.
>
> Changes in v4:
> - Fix build issue with riscv32/riscv64-linux-user targets
>
> Changes in v3:
> - Fix coding style issues
> - Fix *stateen0h index calculation
>
> Changes in v2:
> - Make h/s/envcfg bits in m/h/stateen registers as writeable by default.
>
> Mayuresh Chitale (5):
>   target/riscv: Add smstateen support
>   target/riscv: smstateen check for h/s/envcfg
>   target/riscv: generate virtual instruction exception
>   target/riscv: smstateen check for fcsr
>   target/riscv: smstateen knobs

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  target/riscv/cpu.c                        |   2 +
>  target/riscv/cpu.h                        |   4 +
>  target/riscv/cpu_bits.h                   |  37 ++
>  target/riscv/csr.c                        | 414 +++++++++++++++++++++-
>  target/riscv/insn_trans/trans_rvf.c.inc   |  43 ++-
>  target/riscv/insn_trans/trans_rvzfh.c.inc |  12 +
>  target/riscv/machine.c                    |  21 ++
>  target/riscv/translate.c                  |   8 +-
>  8 files changed, 536 insertions(+), 5 deletions(-)
>
> --
> 2.25.1
>
>

