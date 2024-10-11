Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6294D0EE20
	for <qemu-riscv@archiver.kernel.org>; Fri, 11 Oct 2024 18:53:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1szKkm-0005T4-Qs; Fri, 11 Oct 2024 14:52:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ved@rivosinc.com>) id 1szKkl-0005SY-2g
 for qemu-riscv@nongnu.org; Fri, 11 Oct 2024 14:52:43 -0400
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ved@rivosinc.com>) id 1szKkj-0007n9-AG
 for qemu-riscv@nongnu.org; Fri, 11 Oct 2024 14:52:42 -0400
Received: by mail-oi1-x229.google.com with SMTP id
 5614622812f47-3e3e0a8aaabso854498b6e.3
 for <qemu-riscv@nongnu.org>; Fri, 11 Oct 2024 11:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1728672755; x=1729277555;
 darn=nongnu.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=irZVYvpZUapOC37LWmJjffcjitIBdllmEIpXJj/9rWM=;
 b=OtFntmD24CB6dClkAf8h7gaVmDENcQkIrpxacTRd7GqyPmKPCFCqKwOQ00D7oSxYTl
 nUMTRxLBKVNAtVVKKl3n5uM/jfKcozp4sbkk/pL1C4F2K83ier27damO8pKQDFhrhk7o
 3Gmj8Ff9KTMhFMacZfGl0ssF6I95/AOn+FPnULnCAfoV+wbikvKT+jh4D3yTVQNQyV0T
 461E4oYWhh+tjhhtI60gj8Ppq5/SRfOyQCLe741ESWgh/EBeMKF6LDFAm5c+iZn2+y1g
 PaIyd5dAPXUv0565MVE3+qED1jETiTooVqAHaMfudLc9psJpmqnIY62rsdiaEx3McezM
 AHvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728672755; x=1729277555;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=irZVYvpZUapOC37LWmJjffcjitIBdllmEIpXJj/9rWM=;
 b=Z65GrCaGMszUVhR04YoukCooashBFp7nQqe7Tj9zVue3tbMdcfG833X2Ltg6w4OS+s
 ING2brt1FmLpNEULZ111MJu+1qcTcGbLd34Nb/NmAQc6iniH8jN1z/YtyW0P8x3wgQ6x
 bLuq4CRSwTxF3RE9uwD1elB4CEYXtT/sFK0uiWXp+fqIu7XEOQ5tnBnpEYGX2/919uW6
 a+mZ5yAzlpjxsJdhoqH90GJ6lldb/Cio66bkcBePf3r91N4J1T0TjcuOT+fqtVAO4R0D
 jWOtXs4Gpiwo4QXTVnKAjScjgIvSXlGUvghkeyhehBcz/Qgbu2gYLBwv5TDjez0HscAW
 jvpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXyAXh6GzLdtk1+NCvZt76q/OR1RB+nNf/cfVwIuOu9Q7OnaUnlxz/m/rr9totqrjAxyKi+FiEXXeYK@nongnu.org
X-Gm-Message-State: AOJu0YzAlK3LMM1He3RzLHyh355Oku/JEI0L8zEheyREr59v9YnPfkig
 WRUR5mlcB7DS+FYPmQkHJgx+wGRYamzhPK8Pe+S+WndD8VwMBtCKrSz5LO7J5bk=
X-Google-Smtp-Source: AGHT+IECw5NFO5rwjtf8P5oZTJReMIKRETN8h/oXqXHvqtr4p2g1e7yRDwwXrjwQv1BaUoPRQTJskg==
X-Received: by 2002:a05:6808:1528:b0:3e3:ae35:f418 with SMTP id
 5614622812f47-3e5d2343610mr361779b6e.47.1728672754554; 
 Fri, 11 Oct 2024 11:52:34 -0700 (PDT)
Received: from ved-XPS-8940 ([12.0.166.162]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-5eb11a894acsm514430eaf.40.2024.10.11.11.52.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2024 11:52:34 -0700 (PDT)
Date: Fri, 11 Oct 2024 13:52:32 -0500
From: Ved Shanbhogue <ved@rivosinc.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
 qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Atish Patra <atishp@rivosinc.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v2 2/8] target/riscv: Implement Ssdbltrp sret, mret and
 mnret behavior
Message-ID: <Zwlz8LUEGB4Fa611@ved-XPS-8940>
References: <20240925115808.77874-1-cleger@rivosinc.com>
 <20240925115808.77874-3-cleger@rivosinc.com>
 <CAKmqyKPrHtsjAnc8kX__BeHvxoMvm+MmYLWSgh5TKdx0FE8o9A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAKmqyKPrHtsjAnc8kX__BeHvxoMvm+MmYLWSgh5TKdx0FE8o9A@mail.gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=ved@rivosinc.com; helo=mail-oi1-x229.google.com
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

Alistair Francis wrote:
>> When the Ssdbltrp extension is enabled, SSTATUS.SDT field is cleared
>> when executing sret. When executing mret/mnret, SSTATUS.SDT is cleared
>> when returning to U, VS or VU and VSSTATUS.SDT is cleared when returning
>> to VU from HS.
>
>I don't see mret being mentioned in the spec. Where do you see that
>V/SSTATUS.SDT should be cleared?
>

Ssdbltrp specifies:
    In S-mode, the SRET instruction sets sstatus.SDT to 0,
    and if the new privilege mode is VU, it also sets
    vsstatus.SDT to 0. However, in VS-mode, only vsstatus.SDT
    is set to to 0.

    The MRET instructions sets sstatus.SDT to 0, if the new
    privilege mode is U, VS, or VU. Additionally, if it is
    VU, then vsstatus.SDT is also set to 0.

Smdbltrp specifies:
    The MRET and SRET instructions, when executed in M-mode,
    set the MDT bit to 0. If the new privilege mode is U, VS,
    or VU, then sstatus.SDT is also set to 0. Additionally,
    if it is VU, then vsstatus.SDT is also set to 0.

    The MNRET instruction sets the MDT bit to 0 if the new
    privilege mode is not M. If it is U, VS, or VU, then
    sstatus.SDT is also set to 0. Additionally, if it is VU,
    then vsstatus.SDT is also set to 0.

regards
ved

