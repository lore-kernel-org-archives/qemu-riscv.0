Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lanis-0004a4-7k
	for mharc-qemu-riscv@gnu.org; Sun, 25 Apr 2021 18:59:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lanir-0004ZB-Ce; Sun, 25 Apr 2021 18:59:29 -0400
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a]:33764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lanip-0008TN-8m; Sun, 25 Apr 2021 18:59:29 -0400
Received: by mail-il1-x12a.google.com with SMTP id y10so4404729ilv.0;
 Sun, 25 Apr 2021 15:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=woaYW8rwqCMksjeBBUgmhDONmXNPi2hnLmJvSmSN9Mk=;
 b=cCejuyWkzyeAsfYPNN2vVmhniBq8tdvMkSFDXolaH9Cf0zB+qqbGF7SR6ppuUjdwzh
 QYSDHcAUGp0D48ZVLfYX9f/bvAo1R3u10w/y4NH2ppoAfocUSLbarCRzFVKaeASilCB+
 MgQH+W4fbBNyqTM+YujeQw7pIQ5Mp0UpW18KBGY55pMwCtBcWGJqzI/19LDU/nLAvlWg
 2oanR4GKmbIR5XEdzK7gvBBRTC6W39InOFQyIJOhcLGM9Bg4d1PozE8f/tK+7KAihhPZ
 qwgfMtIos8UC1okqHMvzs4sZLiHUCw+8Usw8yYTKzixJS9ILOZJsr0/ifmIhnc9UsJ/2
 q/3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=woaYW8rwqCMksjeBBUgmhDONmXNPi2hnLmJvSmSN9Mk=;
 b=thsbtEkxIE5sKh5zLo7dSR1oGiYv/Wa0tsO+1ceRI4j2Exu7NzQYCeUus1xNfsKsju
 f85jeBWWbJd16SUYAx8jcMWo6vnaP8qNyZGxAM6CncitWtOGHA30UOmtE+u0++++7p2N
 X73b8qPAsYNLmTBNCVPrcS75CI8hTEjgvuajAEU/LlkGaiWtQD6In2AXfft2SI2F2jz/
 jWKbevmirE1fxrvB7C6A05KqYP+/ObN5vgAJ71yzKvdHBj9VVYa08gsmrZ799LYJtoQP
 wKmiWKMGkrzuXxhe/pLfm8FcUUbg/k+T+afHnmY7VrW17HX4ek2ImVGq9WQ5twwmZB42
 dXhA==
X-Gm-Message-State: AOAM530RUnx3GJFlQ4Utu2vV1TI1vI7ffPuW+Ki83p9jqVtIfcRj9yRl
 jkiwXiZze6240J/Elg5nm1CRTADsYXxZhBIo+Fo=
X-Google-Smtp-Source: ABdhPJw4x6J4cvDz+/LaLy9GsElxs0DoQ31a+seDQfB4BIuEcn6TQZQBtFeVIj1BidTyJ0ztiIQ6QD22Q8ITVHXxvbY=
X-Received: by 2002:a92:d68a:: with SMTP id p10mr11359343iln.40.1619391565785; 
 Sun, 25 Apr 2021 15:59:25 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1619234854.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1619234854.git.alistair.francis@wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 26 Apr 2021 08:58:59 +1000
Message-ID: <CAKmqyKPFW6ieaohRStmzH9J6oamoG31x28KvqR9Gk1XxEkCvoQ@mail.gmail.com>
Subject: Re: [PATCH v3 00/10] RISC-V: Steps towards running 32-bit guests on
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bmeng.cn@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12a;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12a.google.com
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
X-List-Received-Date: Sun, 25 Apr 2021 22:59:29 -0000

On Sat, Apr 24, 2021 at 1:28 PM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> This is another step towards running 32-bit CPU code on the 64-bit
> softmmu builds for RISC-V.
>
> I have tested this and am able to run some 32-bit code, but eventually
> hit some issue.  This series doesn't allow users to use 32-bit CPUs with
> 64-bit softmmu builds as it doesn't work yet. This series instead just
> gets us a little closer to being able to and removes more hardcoded
> macros so hopefully others also stop using them for new code.
>
> v3:
>  - Remove casts from the decoder
>  - Add a patch to fix a comment
>  - Rebase on the RISC-V tree
> v2:
>  - Update the decode tree setup
>  - Address other review comments
>
> Alistair Francis (10):
>   target/riscv: Remove the hardcoded RVXLEN macro
>   target/riscv: Remove the hardcoded SSTATUS_SD macro
>   target/riscv: Remove the hardcoded HGATP_MODE macro
>   target/riscv: Remove the hardcoded MSTATUS_SD macro
>   target/riscv: Remove the hardcoded SATP_MODE macro
>   target/riscv: Remove the unused HSTATUS_WPRI macro
>   target/riscv: Remove an unused CASE_OP_32_64 macro
>   target/riscv: Consolidate RV32/64 32-bit instructions
>   target/riscv: Consolidate RV32/64 16-bit instructions
>   target/riscv: Fix the RV64H decode comment

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  target/riscv/cpu.h                      |  6 --
>  target/riscv/cpu_bits.h                 | 44 -------------
>  target/riscv/helper.h                   | 18 +++--
>  target/riscv/insn16-32.decode           | 28 --------
>  target/riscv/insn16-64.decode           | 36 ----------
>  target/riscv/insn16.decode              | 30 +++++++++
>  target/riscv/insn32-64.decode           | 88 -------------------------
>  target/riscv/insn32.decode              | 67 ++++++++++++++++++-
>  target/riscv/cpu.c                      |  6 +-
>  target/riscv/cpu_helper.c               | 48 ++++++++++----
>  target/riscv/csr.c                      | 40 +++++++++--
>  target/riscv/fpu_helper.c               | 16 ++---
>  target/riscv/monitor.c                  | 22 +++++--
>  target/riscv/translate.c                | 32 +++++----
>  target/riscv/vector_helper.c            |  4 --
>  target/riscv/insn_trans/trans_rva.c.inc | 14 +++-
>  target/riscv/insn_trans/trans_rvd.c.inc | 17 ++++-
>  target/riscv/insn_trans/trans_rvf.c.inc |  6 +-
>  target/riscv/insn_trans/trans_rvh.c.inc |  8 ++-
>  target/riscv/insn_trans/trans_rvi.c.inc | 22 +++++--
>  target/riscv/insn_trans/trans_rvm.c.inc | 12 +++-
>  target/riscv/insn_trans/trans_rvv.c.inc | 39 +++++------
>  target/riscv/meson.build                | 13 ++--
>  23 files changed, 310 insertions(+), 306 deletions(-)
>  delete mode 100644 target/riscv/insn16-32.decode
>  delete mode 100644 target/riscv/insn16-64.decode
>  delete mode 100644 target/riscv/insn32-64.decode
>
> --
> 2.31.1
>

