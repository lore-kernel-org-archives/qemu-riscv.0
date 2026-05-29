Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D2F3CD6E45
	for <qemu-riscv@archiver.kernel.org>; Fri, 29 May 2026 06:01:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wSqH1-0003qq-SQ; Fri, 29 May 2026 02:00:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1wSqH0-0003qh-Gz
 for qemu-riscv@nongnu.org; Fri, 29 May 2026 02:00:46 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1wSqGz-0007mb-0X
 for qemu-riscv@nongnu.org; Fri, 29 May 2026 02:00:46 -0400
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-2bcd730e090so108059845ad.2
 for <qemu-riscv@nongnu.org>; Thu, 28 May 2026 23:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1780034442; x=1780639242; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=WBlnqahlL4zc7puc7f/tbbI7ATLOEIWxyXIiecDKUpM=;
 b=i9MhVcfPnqMOiwqoL91Zk2CKwiPcOO4YhbcXV0zum3c1KX+5LY2cM2RRb2uXNaY1wK
 bar5OvAcjrTuVY5Q61Lsb5jQgReMeGPeVVpi2HfAADoy8ax5tMYLr7Vep3fqmtuvf5Zg
 qhC6yViRe8Le6orY85xQzF1MeuW2AkTP6623n6alkxf+NLDFGt3Xu8Njnti2PGuiv9wx
 MhIwnODT5rdzDv2dU34CYW5zFfm4LpQC+lsumRPekdJrqJOZFodZB0tlNH3EKGaDrpzW
 4YnAjKFGC5fgBxKUW74tBDwaFpPjqjtIm1xF+g7kxBMNI0qRRoBMjmcKkc+iQzF6lUzL
 tf7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780034442; x=1780639242;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WBlnqahlL4zc7puc7f/tbbI7ATLOEIWxyXIiecDKUpM=;
 b=NOTFKJ9EuE8VRABeC4ghKE0S5VeyR/S51NrB7vdeim5JGorPOtZ1WFQHYJ/RiXqdri
 qoa0t2CDsi7xbcGb2vPxa/K3ZR2WFGGJm6FofpRx+XTnZIWWeCey89d5Eli472HgglF6
 qiL+y0csytqd1IwDRP3FOxN67god28npQ/1GgmgE/xDNnqIDbDgjfSsUsmbYZYfsSjwt
 cmW2z/380qkbrbuIR2m9JrgmSolddizCERfzMSkcYS0XISSWc4vlEjNMF/GDgEk0LnPw
 1vEwmLE9tmS6ajYS8MSJuADoYVU3+SU0QajFR0r9/UTWNvU4bBXKDIW0UD65kyeVa0se
 tjlA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9winKO1hJ33RiQU60yGhNeeIqRMNdsm0GQrEqm95syYJ+LHgI4BbLVsoGzj5ri1j9lJlOlxgJIKZsU@nongnu.org
X-Gm-Message-State: AOJu0Yxld9lsHS+9LPRDNYav3QRUqAKZb+nT/oo2F4VeM/FBDzWQbO1E
 ORZayAq/87kn6LAthBj7hwF9IhoXieXhRMi91fLReZeHKUnpIqwJ6AsGkkuPZkGYa2o=
X-Gm-Gg: Acq92OHf+Z4AzlB296yFuNi5luyeaR+kstRiRiYK7akQGwRIIxs7M9dT4s8MjOHvu+e
 csftwP5vT/vQ0mJavft3EycvfqvkHvGmDgH1C+UPMN2K3W1o7HV/Zel4ysSi6NQJhqV8CN55p0t
 Rz630Bs01auOROBDJ65rFIj9ksuDB+T6PkK8p5DM8k2293/eKXrIRSHpj0JF+ZWallKHPdfOk6q
 9dj+qBowQWLxaee3tyysFlgCgh1xUYdCthFcgPU3b4Sm0IKTykmqlE/4sJpIL33XUqYCmzuugO/
 QJ0ULMwMDKOLoGsQLZ1rH5Cwl8Ple3gvcog1Gsthh4kqRhtg2Lg+LgNk4PnyvOdCDHaJLawCnUU
 66DoCV6AfwjU59DpY03K1tdLwPSbCGzmWvpBG/MWtWqQg7/q+gMPVSwsH+9dhPNpesMEFMKe2vv
 33j5N5ebHT4neozJnBHScf/83yVxGAVWegmdnH+fQ4YMcTR7AS1MkjU7xmV5krdi1sWniGghpwD
 Wk=
X-Received: by 2002:a17:902:e543:b0:2bc:e62a:979b with SMTP id
 d9443c01a7336-2bf20996a71mr20118105ad.30.1780034441871; 
 Thu, 28 May 2026 23:00:41 -0700 (PDT)
Received: from sifive.com ([136.226.240.165]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2bf239e5c83sm6339045ad.16.2026.05.28.23.00.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2026 23:00:39 -0700 (PDT)
Date: Fri, 29 May 2026 14:00:35 +0800
From: Max Chou <max.chou@sifive.com>
To: Alistair <alistair@alistair23.me>
Cc: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>, 
 qemu-riscv@nongnu.org
Subject: Re: QEMU RISC-V Call
Message-ID: <ahkrD2h1kaubNtXq@sifive.com>
References: <e2576b58-9356-4d88-8485-42256b2a2366@alistair23.me>
 <6e25408f-662c-4cd9-93b7-35ea100c81fb@oss.qualcomm.com>
 <81a5c280-973d-4ada-b2f3-3ac4652a2037@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <81a5c280-973d-4ada-b2f3-3ac4652a2037@app.fastmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=max.chou@sifive.com; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On 2026-05-28 21:37, Alistair wrote:
> On Thu, 28 May 2026, at 5:13 AM, Daniel Henrique Barboza wrote:
> > 
> > 
> > On 5/27/2026 9:15 AM, Alistair Francis wrote:
> > > Hello everyone,
> > > 
> > > There has been some interest recently about setting up a call to discuss QEMU RISC-V and the current status.
> > > 
> > > So I wanted to setup a chat next week AEST (UTC+10) time to discuss a few things on a call.
> > > 
> > > I was thinking 1PM on Monday the 1st of June.
> > 
> > Can we make it 10AM AEST?
> 
> Sure! Let's do that

Both work for me. Thx

rnax

