Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mdh05-0008FN-0v
	for mharc-qemu-riscv@gnu.org; Thu, 21 Oct 2021 18:57:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mdh03-0008E5-94; Thu, 21 Oct 2021 18:57:27 -0400
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:44967)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mdh01-0005mL-4K; Thu, 21 Oct 2021 18:57:26 -0400
Received: by mail-io1-xd36.google.com with SMTP id r134so2978053iod.11;
 Thu, 21 Oct 2021 15:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=l425e8rpkEKLAVmEKE+Fwdd+L0iFgwoON3UDd1ZjUxQ=;
 b=VGTMYayR5oXRsxetkEg8n3QxSlzl89FAi3GVX98qwhJTGNRkEWsVIyAUblYtgyu+Gm
 a5kuAN0DonXHboE1mo2WvCaNWuD7ZkHzUw0uDmd6RCKnLZLjdvyBybktP1cmIWr3Rv+R
 MxnWBZI31UtjHa/1PfVewGymDpU12wqCpxgccH2m5g/CLWEkSjMthUXkxnhbUjIntj1+
 t5rqxWjI6QGCjFK4GnEX5sRopPbPrOWbLcWldLAKLMfdzgf22rq7Yeq0+80qKt5z1zlB
 Tz3qz+VviypTqF9uxNeQtsqyYYd2dmtaUEaq+YXSXGULwE8WhgVsb34bWYrHuTU5HprF
 8Tww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l425e8rpkEKLAVmEKE+Fwdd+L0iFgwoON3UDd1ZjUxQ=;
 b=Poz8zJ9Wy0Mx0GBy5e7YEqpzNaOiG8RHMC3sKwgozcTL9kDYrHaWcw30gKmTq3JozT
 w3KKjiaGCGN13FVI+egqwXG+8NshxfzNTcCltKPYVYhytEcnqajX2fxiUoSLBfiTXsPt
 gQWRus0nosoYWR/vIqcdxpHvKOhWl3E2EVm4o9eNjLN1AeDRDWOEEkV1xz0WEgukL6Sa
 hVI+Z61vfNJGxndR9oUt7PYiQTTOUpRmr9hQMbRUscG4jISvSTaaMirMxbS/5ovhVCtg
 /m28KEn1olszE77buj61BFi7AYjStAn8pAHq71Rk8/hrQbmWs9F6lT+Iu8EQ9uujTjah
 Cn1w==
X-Gm-Message-State: AOAM5313Xz4UqKuED2AehPuPSb90ScMZOPj4yaILTBzkhgy6I9c7zwUM
 /sFPZdFIeRhsRUQ7x62YQu5CePVq4K3JPpm9tcs=
X-Google-Smtp-Source: ABdhPJxWjCWB44RcytNYMb4BQWrwRNZ0ZuytjMlkptVQiQ/LDqcseOF5gMwf0Cy2wobAfmPwDPBuYuWKAULArRapT/M=
X-Received: by 2002:a05:6638:2581:: with SMTP id
 s1mr5754221jat.35.1634857043320; 
 Thu, 21 Oct 2021 15:57:23 -0700 (PDT)
MIME-Version: 1.0
References: <20211020101935.1369682-1-space.monkey.delivers@gmail.com>
In-Reply-To: <20211020101935.1369682-1-space.monkey.delivers@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 22 Oct 2021 08:56:57 +1000
Message-ID: <CAKmqyKPxRUaBLCp=ZrMVoxGTR+gr6ALAbp2kWPjN-b1CAHg5zg@mail.gmail.com>
Subject: Re: [PATCH v15 0/8] RISC-V Pointer Masking implementation
To: Alexey Baturo <baturo.alexey@gmail.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 space.monkey.delivers@gmail.com, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Dave Smith <kupokupokupopo@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d36;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd36.google.com
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
X-List-Received-Date: Thu, 21 Oct 2021 22:57:27 -0000

On Wed, Oct 20, 2021 at 8:43 PM Alexey Baturo <baturo.alexey@gmail.com> wrote:
>
> v14:
> Addressed Richard's comments from previous series.
>
> v13:
> Rebased QEMU and addressed Richard's comment.
>
> v12:
> Updated function for adjusting address with pointer masking to allocate and use temp register.
>
> v11:
> Addressed a few style issues Alistair mentioned in the previous review.
>
> If this patch series would be accepted, I think my further attention would be to:
> - Support pm for memory operations for RVV
> - Add proper csr and support pm for memory operations for Hypervisor mode
> - Support address wrapping on unaligned accesses as @Richard mentioned previously
>
> Thanks!

Hey!

Sorry about this, but there has been some churn and this no longer
applies. Do you mind rebasing on
https://github.com/alistair23/qemu/tree/riscv-to-apply.next

Alistair

>
> Alexey Baturo (7):
>   [RISCV_PM] Add J-extension into RISC-V
>   [RISCV_PM] Add CSR defines for RISC-V PM extension
>   [RISCV_PM] Support CSRs required for RISC-V PM extension except for
>     the h-mode
>   [RISCV_PM] Add J extension state description
>   [RISCV_PM] Print new PM CSRs in QEMU logs
>   [RISCV_PM] Support pointer masking for RISC-V for i/c/f/d/a types of
>     instructions
>   [RISCV_PM] Allow experimental J-ext to be turned on
>
> Anatoly Parshintsev (1):
>   [RISCV_PM] Implement address masking functions required for RISC-V
>     Pointer Masking extension
>
>  target/riscv/cpu.c                      |  31 +++
>  target/riscv/cpu.h                      |  33 +++
>  target/riscv/cpu_bits.h                 |  96 ++++++++
>  target/riscv/csr.c                      | 285 ++++++++++++++++++++++++
>  target/riscv/insn_trans/trans_rva.c.inc |   3 +
>  target/riscv/insn_trans/trans_rvd.c.inc |   2 +
>  target/riscv/insn_trans/trans_rvf.c.inc |   2 +
>  target/riscv/insn_trans/trans_rvi.c.inc |   2 +
>  target/riscv/machine.c                  |  27 +++
>  target/riscv/translate.c                |  43 ++++
>  10 files changed, 524 insertions(+)
>
> --
> 2.30.2
>
>

