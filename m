Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8D65C7EE24
	for <qemu-riscv@archiver.kernel.org>; Tue,  6 Jun 2023 17:38:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q6adZ-0003Iq-0L; Tue, 06 Jun 2023 13:38:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1q6adX-0003IL-Fv
 for qemu-riscv@nongnu.org; Tue, 06 Jun 2023 13:38:27 -0400
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1q6adV-0005FB-9E
 for qemu-riscv@nongnu.org; Tue, 06 Jun 2023 13:38:27 -0400
Received: by mail-ot1-x32a.google.com with SMTP id
 46e09a7af769-6af6b6837acso4189343a34.1
 for <qemu-riscv@nongnu.org>; Tue, 06 Jun 2023 10:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1686073104; x=1688665104;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GYkqp0lH9UrQtCa0sTNq50EZ79SEdB53azY7jiGEO9s=;
 b=GEPX9FRcoZRiT9h6yKGRX8Gc57oGYZXyGXas3Y0rlzt4N3RM4hjLNyF3lZdheY9bX3
 oKEDVa10yeTntWOFYnkRS3CpKclCSl1qxUrMbMqV+aJImloepja2OmHMPXVE5DGuBeQX
 6Xd0g9zImH1AJC7w82tOX/erxfceBGQd4cn60VotszM8ZJQXWgR55Yw75y9QMR2rON0A
 T/plAkuo1nGpkjYUYnBYKLig/LrmllBmGR0JhzhK31YmXiV9bLZidamhcLU8hAjgXRzU
 loliVX4VLtH+GYy0IaNQXVbvVNxXXOlHKs0fmyh2WvlDcZD9hWT9n4BMa5XsajfKGPuC
 H1uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686073104; x=1688665104;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GYkqp0lH9UrQtCa0sTNq50EZ79SEdB53azY7jiGEO9s=;
 b=Eg5F0S1bnPSjzpWMHpJIAlirnsDZYbeqlCBmE4w7XbH/P3RlBdLuSHEPSwQfW36XIb
 Byff0L7EyccuXqYQvmwAEZVs7oz+llw6oTIrL6lquW4C4R3uAOXXiOE7qg2x9gN9W7VP
 rRbObgp29dwxKeUt0W0MTFsElwJPjkZDeldReeUwMeLtLC+pYeK0/Dkpjz5dCu63Lx+N
 XA2JosCt6T1blzb7veDx/FR5UqZ5LmWviScKfmvMfeu63Ry7w8B/FpIIDLmnlnNjgoBc
 iSIC9ZHsZvGZV8ukCe2GRr57pbbSpHaV9vGGev/vMCUJ5T/ZzLWgq6x7YUHCKdLVG/Cx
 FZUQ==
X-Gm-Message-State: AC+VfDyj+UBqlzsGCbHioZKZUS7cnC5NQNwaCpboUZ7dWJFyGq/99b6z
 +28y6DrsgtLhXznJcGvSskYZ+g==
X-Google-Smtp-Source: ACHHUZ4A2J2mh0gokjbci6e2dY+rsM3LXzBZImUPVg/EEXig9EMYk23/0qQ1F7qK31w+4GjBngmiHg==
X-Received: by 2002:a05:6830:4c5:b0:6ac:88de:d49d with SMTP id
 s5-20020a05683004c500b006ac88ded49dmr1498656otd.36.1686073103853; 
 Tue, 06 Jun 2023 10:38:23 -0700 (PDT)
Received: from [192.168.68.107] ([177.170.117.52])
 by smtp.gmail.com with ESMTPSA id
 g5-20020a9d6c45000000b006ab13915cd4sm618898otq.81.2023.06.06.10.38.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jun 2023 10:38:23 -0700 (PDT)
Message-ID: <fe417dd1-c639-dc75-14bf-2679dde0911c@ventanamicro.com>
Date: Tue, 6 Jun 2023 14:38:19 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 0/9] disas/riscv: Add vendor extension support
Content-Language: en-US
To: Christoph Muellner <christoph.muellner@vrull.eu>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Philipp Tomsich
 <philipp.tomsich@vrull.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Zhiwei Liu <zhiwei_liu@linux.alibaba.com>
References: <20230530131843.1186637-1-christoph.muellner@vrull.eu>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230530131843.1186637-1-christoph.muellner@vrull.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32a;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x32a.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Hi,

Can you please rebase on top of Alistair's riscv-to-apply.next and re-send?

Some patches can't be applied cleanly, in particular patch 2, which conflicts
with Weiwei's "target/riscv: Split RISCVCPUConfig declarations from cpu.h
into cpu_cfg.h" that landed into riscv-to-apply.next a few weeks ago. In
this particular case patch 2 of this series would need to move just the
bits of target/ppc/translate.c to the already existing cpu_cfg.h file.


Put me in the CC when you re-send and I'll review it asap. Thanks,


Daniel

On 5/30/23 10:18, Christoph Muellner wrote:
> From: Christoph Müllner <christoph.muellner@vrull.eu>
> 
> This series adds vendor extension support to the QEMU disassembler
> for RISC-V. The following vendor extensions are covered:
> * XThead{Ba,Bb,Bs,Cmo,CondMov,FMemIdx,Fmv,Mac,MemIdx,MemPair,Sync}
> * XVentanaCondOps
> 
> So far, there have been two attempts to add vendor extension support
> to the QEMU disassembler. The first one [1] was posted in August 2022
> by LIU Zhiwei and attempts to separate vendor extension specifics
> from standard extension code in combination with a patch that introduced
> support for XVentanaCondOps. The second one [2] was posted in March 2023
> by me and added XThead* support without separating the vendor extensions
> from the standard code.
> 
> This patchset represents the third attempt to add vendor extension
> support to the QEMU disassembler. It adds all features of the previous
> attempts and integrates them into a patchset that uses the same
> mechanism for testing the extension availability like translate.c
> (using the booleans RISCVCPUConfig::ext_*).
> To achieve that, a couple of patches were needed to restructure
> the existing code.
> 
> Note, that this patchset allows an instruction encoder function for each
> vendor extension, but operand decoding and instruction printing remains
> common code. This is irrelevant for XVentanaCondOps, but the patch for
> the XThead* extensions includes changes in riscv.c and riscv.h.
> This could be changed to force more separation with the cost of
> duplication.
> 
> The first patch of this series is cherry-picked from LIU Zhiwei's series.
> It was reviewed by Alistair Francis and Richard Henderson, but never
> made it on master. I've added "Reviewed-by" tags to the commit.
> 
> I've added "Co-developed-by" tags to those commits that are derived
> from the series of LIU Zhiwei.
> 
> [1] https://lists.nongnu.org/archive/html/qemu-devel/2022-08/msg03662.html
> [2] https://lists.nongnu.org/archive/html/qemu-devel/2023-03/msg04566.html
> 
> Christoph Müllner (8):
>    target/riscv: Factor out RISCVCPUConfig from cpu.h
>    disas/riscv: Move types/constants to new header file
>    disas/riscv: Make rv_op_illegal a shared enum value
>    disas/riscv: Encapsulate opcode_data into decode
>    target/riscv/cpu: Share RISCVCPUConfig with disassembler
>    disas/riscv: Provide infrastructure for vendor extensions
>    disas/riscv: Add support for XVentanaCondOps
>    disas/riscv: Add support for XThead* instructions
> 
> LIU Zhiwei (1):
>    target/riscv: Use xl instead of mxl for disassemble
> 
>   disas/meson.build         |   6 +-
>   disas/riscv-xthead.c      | 707 ++++++++++++++++++++++++++++++++++++++
>   disas/riscv-xthead.h      |  28 ++
>   disas/riscv-xventana.c    |  41 +++
>   disas/riscv-xventana.h    |  18 +
>   disas/riscv.c             | 384 ++++++---------------
>   disas/riscv.h             | 297 ++++++++++++++++
>   target/riscv/cpu-config.h | 159 +++++++++
>   target/riscv/cpu.c        |   6 +-
>   target/riscv/cpu.h        | 114 +-----
>   target/riscv/translate.c  |  27 +-
>   11 files changed, 1374 insertions(+), 413 deletions(-)
>   create mode 100644 disas/riscv-xthead.c
>   create mode 100644 disas/riscv-xthead.h
>   create mode 100644 disas/riscv-xventana.c
>   create mode 100644 disas/riscv-xventana.h
>   create mode 100644 disas/riscv.h
>   create mode 100644 target/riscv/cpu-config.h
> 

