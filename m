Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mBWSD-0006QU-I9
	for mharc-qemu-riscv@gnu.org; Thu, 05 Aug 2021 02:02:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mBWS7-0006K9-IG; Thu, 05 Aug 2021 02:01:59 -0400
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136]:46737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mBWS5-0004GI-SG; Thu, 05 Aug 2021 02:01:59 -0400
Received: by mail-il1-x136.google.com with SMTP id r5so3967254ilc.13;
 Wed, 04 Aug 2021 23:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3UALmwEmdwcXF69HPRrShi4p4xiWQemFg4GgSCUXR4M=;
 b=TF/lCRnPmElGi0sl6w//lJvDBNTpD2leU35LylKlyv6CjqEB6Uhkwm1V/lVGUzv67M
 NcBYFLsuhuUJ6ga8+BIxwdYFDk2rPYq8BUenQb3ydZKwbni5jxVgFXsZ3SX1hEv9J2jY
 Q/t59OcsJSi/kOrHba86Ge4WoytbMHDVC5GLd5qO0xyuYtDrrDtWk6p3BKmar6/QuHKn
 rHtJAtXjWynWk6XS7DsWtRJXls6JNXKKDcmXnCpRKJijeZY8ggfMhmWPY6i5ExkoCcB/
 G7M4idZccTbLGz02a5y1sG+tjrBOhxnpR8aoFWCv8DtwbIQRtAwdpFvyrf4zmBvMA/g8
 qSSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3UALmwEmdwcXF69HPRrShi4p4xiWQemFg4GgSCUXR4M=;
 b=hEPZJw3E2wKWECTVZ5+verU0DZfl7WjqFBZqCV7C3R/4yR58AE6B6kTsUPx/sipNfI
 majTVADpOUMeBK7piveoQJJc6c3ff8YbmQXGTgZ5EMLHtxg//hDYDGVDf/7mz2MPv4aw
 LIAGUweJTlPwliCGilPT2Vm/TbUND1HAkJUOKvTNfC/zJqeAjA2FPgH14gdXxjIaHYdM
 YNs3BnG9xgDmpDiRqam3FwYxPmEj9UpPYYf3lP4G5y0qGtQxjQEdy/uFj/Zcj7DfFwef
 Kq3Fy5/7S+AXWps1xN+NAwZT5bvccFVrP7ICsIPzvXfFi87bsvorJmFYzxta0oSO4yWH
 N51g==
X-Gm-Message-State: AOAM531D/pZeJ1DwqxkJZE01Var7eJzNEf6ooMiWSQriSJw3Vo+CPstr
 0HyOkf38odiIOrg7q8vH77cmONbqYKu9LgYvdFE=
X-Google-Smtp-Source: ABdhPJw4JjrSIWCY7M+uEs8yIVAgNvv4py7Euyqm8UOgF71S2JditoR5Zfar618ux4pku/NQcxofe26mY/m4phYoBbQ=
X-Received: by 2002:a92:c504:: with SMTP id r4mr145437ilg.131.1628143316385;
 Wed, 04 Aug 2021 23:01:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210805025312.15720-1-zhiwei_liu@c-sky.com>
In-Reply-To: <20210805025312.15720-1-zhiwei_liu@c-sky.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 5 Aug 2021 16:01:30 +1000
Message-ID: <CAKmqyKOCRXbEhZrZSQN-X2ObrX=_aoxgyCsevE05LY9S-TS4hQ@mail.gmail.com>
Subject: Re: [RFC PATCH 00/13] Support UXL field in mstatus
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::136;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x136.google.com
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
X-List-Received-Date: Thu, 05 Aug 2021 06:02:00 -0000

On Thu, Aug 5, 2021 at 12:55 PM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>
> This patch set implements UXL field in mstatus register. Programmer can change
> UXLEN by writting to this field. So that you can run a 32 bit program
> on a 64 bit CPU.

Awesome! Do you have any steps for building a rootFS to test this?

Alistair

>
> This patch set depends on one patch set by Richard Henderson
> https://lists.gnu.org/archive/html/qemu-riscv/2021-07/msg00059.html.
>
> LIU Zhiwei (13):
>   target/riscv: Add UXL to tb flags
>   target/riscv: Support UXL32 for branch instructions
>   target/riscv: Support UXL32 on 64-bit cpu for load/store
>   target/riscv: Support UXL32 for slit/sltiu
>   target/riscv: Support UXL32 for shift instruction
>   target/riscv: Fix div instructions
>   target/riscv: Support UXL32 for RVM
>   target/riscv: Support UXL32 for vector instructions
>   target/riscv: Support UXL32 for atomic instructions
>   target/riscv: Support UXL32 for float instructions
>   target/riscv: Fix srow
>   target/riscv: Support UXL32 for RVB
>   target/riscv: Changing the width of U-mode CSR
>
>  target/riscv/cpu.h                      |  18 +++
>  target/riscv/csr.c                      |  42 +++++-
>  target/riscv/insn_trans/trans_rva.c.inc |  36 ++++-
>  target/riscv/insn_trans/trans_rvb.c.inc |  51 +++++--
>  target/riscv/insn_trans/trans_rvd.c.inc |   4 +-
>  target/riscv/insn_trans/trans_rvf.c.inc |   4 +-
>  target/riscv/insn_trans/trans_rvi.c.inc |  62 ++++++--
>  target/riscv/insn_trans/trans_rvm.c.inc |  24 ++-
>  target/riscv/insn_trans/trans_rvv.c.inc |  44 +++---
>  target/riscv/translate.c                | 186 ++++++++++++++++++++----
>  target/riscv/vector_helper.c            |  54 +++++--
>  11 files changed, 414 insertions(+), 111 deletions(-)
>
> --
> 2.17.1
>
>

