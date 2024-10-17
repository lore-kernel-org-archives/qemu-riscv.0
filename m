Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A866BD3C526
	for <qemu-riscv@archiver.kernel.org>; Thu, 17 Oct 2024 18:27:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1t1VDX-0003SN-Pc; Thu, 17 Oct 2024 14:27:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ved@rivosinc.com>) id 1t1VDU-0003RZ-Bl
 for qemu-riscv@nongnu.org; Thu, 17 Oct 2024 14:27:20 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ved@rivosinc.com>) id 1t1VDS-0000FC-5w
 for qemu-riscv@nongnu.org; Thu, 17 Oct 2024 14:27:20 -0400
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-7ea7d509e61so683384a12.1
 for <qemu-riscv@nongnu.org>; Thu, 17 Oct 2024 11:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1729189633; x=1729794433;
 darn=nongnu.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=gU65EaIFgt0BlsqoVHbVhKXrSQa15kQYbNAAlBQsbsc=;
 b=TqzeNZseL0I2sRzzD+DvTPsaG2SXfXVu0R+2As4kAhP3ZWtgtgQpVsm/VQm2FM6dW4
 enhGWFL6raNKroq0XN+SnIYVr5E32slCZrHnXAN913tF+Fr1zw4UIBsiVkja0TtTHV3p
 KYjzhbV3suf3Xk2yew+XWC4Hoh9EXpgr3SOJcC/37xn1zdau/49+JgjQd5KJCeaZqk9g
 CIZSrVCNWxX+pjG0ZHsJMGK/P/NHcnYUWEiys1Xp25obEy+gKzdHSaFpHv7h/TyCnfV7
 mDK5j96i7LNP4GgTZxeSKlLHT5y8yb/zyhMpcviJmF6k6z6J3xans/8E65NEhHsjAuSp
 g+Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729189633; x=1729794433;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gU65EaIFgt0BlsqoVHbVhKXrSQa15kQYbNAAlBQsbsc=;
 b=hKLDi8w8qCo+dymc2TRYovB55OvkEPXouosmoAGBmHKTSlDQp8kY7pDC/3bCDdzaJr
 OQ1pNB2UsCgY8ZHxwr5F9kEk/xWhs0iUy9D6KoHCJujm5bWv0h9yMw7cLwSaU1l5rjv9
 nDEUxgIJRvYHTVc/dsLfpOFLsOhoDD0BM5OlxafebQyktSf3N203IVvchPgQgJS4jX7b
 LEcoVEpdQaxV2AlV+EAfkZDJzYw7/8DljVZpbbDpAESddVUgOCfgdUGnLJVODWuZpsgp
 Fvy7/fgOjyUV07A9nMjtQ8I3Runp48Y6K8CMmgqbHAS0Gl4CYSFlKsjpXwAkpwGBpJ+/
 jazg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXmeNYbT3uSFfZJU7SpSxFxwqHd25ngfzB0xJ5PKcfnF6vdrnshQAC/li+9L5bUCxkPCfUBaQiy2Kc@nongnu.org
X-Gm-Message-State: AOJu0YwaEAqeJHEUwPxfCvE7pN8iRGpTfRY5PQ3W5x+uqQXtM9wf/85T
 qqUJGQn6H8KmZeHsaTwPqSO/errlVGSVgoJ3rAjKrFP+1nc9nVBcUeeFVFW/a0E=
X-Google-Smtp-Source: AGHT+IHVf56ZsI3PGvuOiCWK/YEign0bboh46rhkrE4GtIfxWf9DIfnl8fYL3CPEok7qnTPdtoTO8A==
X-Received: by 2002:a05:6a20:ac43:b0:1d2:e903:432f with SMTP id
 adf61e73a8af0-1d8bcfbb744mr31375490637.46.1729189633275; 
 Thu, 17 Oct 2024 11:27:13 -0700 (PDT)
Received: from vedvyas-XPS-13-9310 ([50.145.13.30])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71e774c37c2sm5199718b3a.143.2024.10.17.11.27.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2024 11:27:12 -0700 (PDT)
Date: Thu, 17 Oct 2024 13:27:10 -0500
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
Message-ID: <20241017182710.GA403564@vedvyas-XPS-13-9310>
References: <20240925115808.77874-1-cleger@rivosinc.com>
 <20240925115808.77874-3-cleger@rivosinc.com>
 <CAKmqyKPrHtsjAnc8kX__BeHvxoMvm+MmYLWSgh5TKdx0FE8o9A@mail.gmail.com>
 <Zwlz8LUEGB4Fa611@ved-XPS-8940>
 <CAKmqyKMtJK_2yoUoudVoZorW=A5fX=m5RvG_vvHNHj45nQy_hw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAKmqyKMtJK_2yoUoudVoZorW=A5fX=m5RvG_vvHNHj45nQy_hw@mail.gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=ved@rivosinc.com; helo=mail-pg1-x534.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Alistair Francis wrote:
>$ grep -r sstatus.SDT | grep SRET
>src/hypervisor.adoc:if the new privilege mode is VU, the `SRET`
>instruction sets `vsstatus.SDT`
>
>What am I missing here?

https://github.com/riscv/riscv-isa-manual/blob/ef2ec9dc9afd003d0dab6d5ca36db59864c8483c/src/machine.adoc?plain=1#L538


regards
ved

