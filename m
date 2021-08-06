Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mBwjt-0002Aa-6b
	for mharc-qemu-riscv@gnu.org; Fri, 06 Aug 2021 06:06:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mBwjq-00029I-TR; Fri, 06 Aug 2021 06:06:02 -0400
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c]:33621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mBwjp-0005d5-5B; Fri, 06 Aug 2021 06:06:02 -0400
Received: by mail-il1-x12c.google.com with SMTP id y4so8310650ilp.0;
 Fri, 06 Aug 2021 03:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=PWMmefiGpc9vzQDx52OUoZ+PL+lhEEr9ix5Ofw3iTpY=;
 b=Xh5SF8T+ZRkDMa3EaOnjbMFWlHRc7x89tWMSyv4ONyUQJGWf3NX8NDCcAiPJi0eOFp
 UtwR9rLLbm0CngTQD0853HNaos2nJQ1f5iEQgmAueSmaoxUymPJFxu4THXyau0N94y3W
 cwDcAEJg6lEPPZCEdg0d5nQqKW172iLAHefG8U9a1ATzgqlHhcIdA/e9OfRuQl9SSrl/
 1dHduUSifpBN/1Hf+nWpPe4LWYk/GbOzItJTZK7ErYFUmBNwXcY8Bym9x586YmaApt02
 WwJwrcZj36Vt/dy84OrOqGa4zxOlOVWss1NY7g2/1eOOCNOJ7y9rbLffzfkAII77FguS
 sXXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=PWMmefiGpc9vzQDx52OUoZ+PL+lhEEr9ix5Ofw3iTpY=;
 b=p2/hDHzPvj7CBbvzR38FryI/BS2G/uArzPkwQTY4UKLjeTw7l5hFt9YC+J8ecDe4mh
 YWyoXQtcssuUPI10Fkl/MhmzbvHzkQsO4O2AbbpU16VdyRsriF8mZcJ37mJvZeZily4j
 RyKr/PbVcx26RrAno7mK76PaSBUqN+OC+BGlGiOGSGsl3F+bn6ielsWEckxS+AYb0KsN
 T7fjE7Mjsw72PPufEP1eWj5jdlAnBt0xXJmcol5Y+tHKuqlMKee0BCItk7r16WBzxPVc
 9y626NqgeqIGcJLRfo7CS9h7GONyEB03PmoQWzh+2I9vuL6fxcQD+ufQ3v4lfnm5tC2U
 vkOw==
X-Gm-Message-State: AOAM531FT/C3Va/APg3xCG9CuslO7bRVGuZBrg448vqXOHDTuGRI9VQz
 at5wCOpsKgdB9cMXEIQAHKnc0av6/kJlGAwQYg0=
X-Google-Smtp-Source: ABdhPJy9woPnNeeHJRxiButx/cEG2NmV9U337wz9jdOaEujb7lUPcZ7r8+u3WKJmB1SOpNOnqxsm4TNcb73THULbMrE=
X-Received: by 2002:a92:c24d:: with SMTP id k13mr139982ilo.227.1628244359241; 
 Fri, 06 Aug 2021 03:05:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210805025312.15720-1-zhiwei_liu@c-sky.com>
 <CAKmqyKOCRXbEhZrZSQN-X2ObrX=_aoxgyCsevE05LY9S-TS4hQ@mail.gmail.com>
 <a404e8dd-eb20-4d4a-6aa0-7c444b46c706@c-sky.com>
In-Reply-To: <a404e8dd-eb20-4d4a-6aa0-7c444b46c706@c-sky.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 6 Aug 2021 20:05:32 +1000
Message-ID: <CAKmqyKPEadYomK36PadYFNvuxL-icLOr7VXPOJjoS3LmZsxSzg@mail.gmail.com>
Subject: Re: [RFC PATCH 00/13] Support UXL field in mstatus
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::12c;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12c.google.com
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
X-List-Received-Date: Fri, 06 Aug 2021 10:06:03 -0000

On Thu, Aug 5, 2021 at 5:15 PM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>
>
> On 2021/8/5 =E4=B8=8B=E5=8D=882:01, Alistair Francis wrote:
> > On Thu, Aug 5, 2021 at 12:55 PM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote=
:
> >> This patch set implements UXL field in mstatus register. Programmer ca=
n change
> >> UXLEN by writting to this field. So that you can run a 32 bit program
> >> on a 64 bit CPU.
> > Awesome! Do you have any steps for building a rootFS to test this?
>
> Not yet.  It depends on Linux support which  will not start until
> October.  Maybe as a rough test,
> we can run the 32 glibc test cases on qemu-riscv64 with an option
> uxl32=3Dtrue(not implement yet).

Hmmm... That's a pain. We really need some way to test this (and
ensure no future breakages occur). But I see the problem of no
software support until this exists.

It sounds like you or a colleague is planning on adding Linux support.
Maybe we will have to wait until that at least exists before this can
go upstream. We could at least review this before hand though, so
thanks for sending the series.

A 32-bit glibc test on qemu-riscv64 would probably also be enough, at
least as a start.

Alistair

>
> Zhiwei
>
> >
> > Alistair
> >
> >> This patch set depends on one patch set by Richard Henderson
> >> https://lists.gnu.org/archive/html/qemu-riscv/2021-07/msg00059.html.
> >>
> >> LIU Zhiwei (13):
> >>    target/riscv: Add UXL to tb flags
> >>    target/riscv: Support UXL32 for branch instructions
> >>    target/riscv: Support UXL32 on 64-bit cpu for load/store
> >>    target/riscv: Support UXL32 for slit/sltiu
> >>    target/riscv: Support UXL32 for shift instruction
> >>    target/riscv: Fix div instructions
> >>    target/riscv: Support UXL32 for RVM
> >>    target/riscv: Support UXL32 for vector instructions
> >>    target/riscv: Support UXL32 for atomic instructions
> >>    target/riscv: Support UXL32 for float instructions
> >>    target/riscv: Fix srow
> >>    target/riscv: Support UXL32 for RVB
> >>    target/riscv: Changing the width of U-mode CSR
> >>
> >>   target/riscv/cpu.h                      |  18 +++
> >>   target/riscv/csr.c                      |  42 +++++-
> >>   target/riscv/insn_trans/trans_rva.c.inc |  36 ++++-
> >>   target/riscv/insn_trans/trans_rvb.c.inc |  51 +++++--
> >>   target/riscv/insn_trans/trans_rvd.c.inc |   4 +-
> >>   target/riscv/insn_trans/trans_rvf.c.inc |   4 +-
> >>   target/riscv/insn_trans/trans_rvi.c.inc |  62 ++++++--
> >>   target/riscv/insn_trans/trans_rvm.c.inc |  24 ++-
> >>   target/riscv/insn_trans/trans_rvv.c.inc |  44 +++---
> >>   target/riscv/translate.c                | 186 ++++++++++++++++++++--=
--
> >>   target/riscv/vector_helper.c            |  54 +++++--
> >>   11 files changed, 414 insertions(+), 111 deletions(-)
> >>
> >> --
> >> 2.17.1
> >>
> >>

