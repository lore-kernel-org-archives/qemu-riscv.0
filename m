Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1512AC30658
	for <qemu-riscv@archiver.kernel.org>; Tue,  2 Jul 2024 22:35:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sOm5d-0003bP-02; Tue, 02 Jul 2024 18:35:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1sOm5M-0003Pu-KF
 for qemu-riscv@nongnu.org; Tue, 02 Jul 2024 18:34:52 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1sOm5I-0001rK-CY
 for qemu-riscv@nongnu.org; Tue, 02 Jul 2024 18:34:51 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-2c961b5f215so774935a91.0
 for <qemu-riscv@nongnu.org>; Tue, 02 Jul 2024 15:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719959669; x=1720564469;
 darn=nongnu.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=teK2dbJPJGjp9j6O0rW0RrLg/324QgFq5JfybygwYRw=;
 b=YHGLHVndr+EzloyV12qGJW4UNAp6QAGWGfXAboKIF9luWEQk3xIj6h1GaNF8d7w2l3
 meNspERaCfALEGynBQ6m9s36VugltuiKj+nwWUJAMJzLelpI/POoMY2/Gy/pAT3W19fe
 O1WG+f822jA7d28bqMpOvyoGFyXKFpWxkLqAUfqXROnfBI86cZXpTRHiqmHPtvvgV8zP
 aYFgLMwHuHibH0iqd8x2Nle5VrW6moULgz5FJXxGrVYjCDyiSZZrL8xPXDuuQl2n7pj7
 U+Iv/cW93cqZi2OsJvwMf/UBoh5osGfweE3kXJMb4Pqxy6+9a2LEcGrwwq7WvRAb59Sh
 EIjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719959669; x=1720564469;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=teK2dbJPJGjp9j6O0rW0RrLg/324QgFq5JfybygwYRw=;
 b=rUNBc6+ua5yIw2/Ha9cqjr1icuBfMcZGlO19cbY+IvbJNtQktkyGrsvOkPNJSB5LjK
 rmiIZIkV1Ex8EvoeB6qL/M5mz3e3fOpT1m1/Y9UyHUXq6INCIwGq6TYakUEt8oPmvYFi
 p81T1YARebGSMnM5bTATLAgI5WrqQlcq9JxF/Y2Lvak/nxIkP08Tdzg+dBsanAjuknx9
 0TlDqYcVZ2y6XvFWBtpAp6q7sfayYWzbKzH+dxeqZvvb1uJRMmE/Bg1CcLXyvSFwIvDo
 6nBK1TBJfzPfdADDBfir4Qx7hq8TTx6UAaYO5OJAl0C2yKKK35JX5esohTtOt3uSrzil
 C8mA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4yLFm9n4fg2zM0XT2C5zW16sIrHdWB32zUmRCjVn0jO1BNJbENiv9wlBDd+LkA2rk88eOnFjg/FbkfBYRtNuyg5/KioQ=
X-Gm-Message-State: AOJu0YxO7fluYV+OxNmzMuBrAn6M07WGP3jC6hQPZiusy2stLhRcu0cy
 lb8DJQRDzDF39jfNFEu/K9OH38ddSQWfiacmf6Yk76MTC650NytbvCIQ2lmlB5U=
X-Google-Smtp-Source: AGHT+IHPhPQJSN80APrR3MVw5cSnwzY2kPDOR+eLpjp2NLmVO/TeYGSidyxvnknVQh3te4REHyzeIQ==
X-Received: by 2002:a17:90b:3105:b0:2c4:e4a3:b83c with SMTP id
 98e67ed59e1d1-2c93d6dc7b7mr6251396a91.2.1719959669478; 
 Tue, 02 Jul 2024 15:34:29 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2c91ce43303sm9361904a91.17.2024.07.02.15.34.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 15:34:29 -0700 (PDT)
Date: Tue, 2 Jul 2024 15:34:27 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, palmer@dabbelt.com,
 alistair.francis@wdc.com, dbarboza@ventanamicro.com,
 liwei1518@gmail.com, bmeng.cn@gmail.com
Subject: Re: [PATCH v2 00/11] target/riscv: Support zimop/zcmop/zama16b/zabha
Message-ID: <ZoSAc4Jap1Wl04GX@debug.ba.rivosinc.com>
References: <20240630030559.877-1-zhiwei_liu@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20240630030559.877-1-zhiwei_liu@linux.alibaba.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=debug@rivosinc.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Hi LIU,

On Sun, Jun 30, 2024 at 11:05:48AM +0800, LIU Zhiwei wrote:
>We have sent their implementations separately, and we have received few objective
>comments except for some ISA extensions order. So, I have put them together
>as one patch set to make it easier for merging.
>
>v1->v2:
>    1. Fix the isa orders.
>    2. Make zimop/zcmop/zama16b/zabha depend on priviledged 1.13

I didn't realize you started zimop/zcmop upstream efforts already. I had sent
a patch series last friday. And just noticed that you this one on Saturday.
It seems you had sent first set of zimop/zcmop patches in May (which I missed).

Overall my patches and yours look equivalent. Infact, you've added disasm
support as well, so it's a superset. I'll stop my effort to upstream then.

Thanks for working on these.

Otherwise (for zimop/zcmop patches in this series)

Reviewed-by: Deepak Gupta <debug@rivosinc.com>

>    2. Add review tags.
>
>The v1 patch set is here
>    1. zimop/zcmop
>        https://mail.gnu.org/archive/html/qemu-riscv/2024-05/msg00207.html
>    2. zama16b
>        https://mail.gnu.org/archive/html/qemu-riscv/2024-05/msg00212.html
>    3. zabha
>        https://mail.gnu.org/archive/html/qemu-riscv/2024-05/msg00214.html
>
>LIU Zhiwei (11):
>  target/riscv: Add zimop extension
>  disas/riscv: Support zimop disassemble
>  target/riscv: Add zcmop extension
>  disas/riscv: Support zcmop disassemble
>  target/riscv: Support Zama16b extension
>  target/riscv: Move gen_amo before implement Zabha
>  target/riscv: Add AMO instructions for Zabha
>  target/riscv: Move gen_cmpxchg before adding amocas.[b|h]
>  target/riscv: Add amocas.[b|h] for Zabha
>  target/riscv: Enable zabha for max cpu
>  disas/riscv: Support zabha disassemble
>
> disas/riscv.c                               | 183 ++++++++++++++++++++
> target/riscv/cpu.c                          |   8 +
> target/riscv/cpu_cfg.h                      |   4 +
> target/riscv/insn16.decode                  |   1 +
> target/riscv/insn32.decode                  |  33 ++++
> target/riscv/insn_trans/trans_rva.c.inc     |  51 ++----
> target/riscv/insn_trans/trans_rvd.c.inc     |  14 +-
> target/riscv/insn_trans/trans_rvf.c.inc     |  14 +-
> target/riscv/insn_trans/trans_rvi.c.inc     |   6 +
> target/riscv/insn_trans/trans_rvzabha.c.inc | 145 ++++++++++++++++
> target/riscv/insn_trans/trans_rvzacas.c.inc |  13 --
> target/riscv/insn_trans/trans_rvzcmop.c.inc |  29 ++++
> target/riscv/insn_trans/trans_rvzimop.c.inc |  37 ++++
> target/riscv/tcg/tcg-cpu.c                  |   5 +
> target/riscv/translate.c                    |  38 ++++
> 15 files changed, 531 insertions(+), 50 deletions(-)
> create mode 100644 target/riscv/insn_trans/trans_rvzabha.c.inc
> create mode 100644 target/riscv/insn_trans/trans_rvzcmop.c.inc
> create mode 100644 target/riscv/insn_trans/trans_rvzimop.c.inc
>
>-- 
>2.25.1
>
>

