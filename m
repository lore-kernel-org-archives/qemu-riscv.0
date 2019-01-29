Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gochU-0002tH-Mj
	for mharc-qemu-riscv@gnu.org; Tue, 29 Jan 2019 18:21:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47321)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gochS-0002sX-C8
	for qemu-riscv@nongnu.org; Tue, 29 Jan 2019 18:21:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gochR-0003Wg-E5
	for qemu-riscv@nongnu.org; Tue, 29 Jan 2019 18:21:50 -0500
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:40611)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gochQ-0003WS-VC
	for qemu-riscv@nongnu.org; Tue, 29 Jan 2019 18:21:49 -0500
Received: by mail-pg1-x541.google.com with SMTP id z10so9448405pgp.7
	for <qemu-riscv@nongnu.org>; Tue, 29 Jan 2019 15:21:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
	:content-transfer-encoding;
	bh=P3fvlCHy4UJhfVQSdLi7n/SCT7EMChHp0J5YnaaZZ1g=;
	b=Sm103dlAqNJBJo37vVRdzhlxOUZIAIGAkgknyx5j00r5DLwrukBbfgGm0aVJ+9zjAU
	74QEjLSqW3Efyc4SmkmMh9oGbGCYmpn5M+4y0kUdAQcQKs3mKUhdRmee4HGuutAmMpNW
	MmpuNYKwCuG9NGOxsr3qljAcFD9mu5RiciCw+kTrDgtwG2+8brkXJmwkTEFKXVuNtbxl
	ARgmsy0Zux/WdrDwHJciL1UMRgH9Z/RCYMaI523Hyea/sDYHPmbC4KS/MvpTsdRbaHsU
	d03/YqY8C02A42YROW0VXTNB3DkaJZyTLQ1VKd6MeZLjTg7OjK7HTU8eImkOaro8lj/7
	4VTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
	:mime-version:content-transfer-encoding;
	bh=P3fvlCHy4UJhfVQSdLi7n/SCT7EMChHp0J5YnaaZZ1g=;
	b=CgY4T2tZVUbxu/VCCm2TBEil4hlxwT90OU77BTN4unXocVPWELgbDx9IoonJGuK5gg
	7Y/xIxwbB+PgFQHVNe75ycchyApWiHKvYN9JcB1Z6S/EzQHHt1we2vthnKgSnY/BqOtQ
	OfKdslz67lk0q8kRodbkPKDaVbagHFaij6yhMFDw6v8uOd7T0pDxaD16sukEurWQZiOD
	/NW7tA1k8e/nkvVTBchMRqNpGCPWOFBl7EYxayV2vQOcxK9WZCEGlpViTRvL1K/+xYQw
	hMdHKvsOoiux8AqK3LzlChMGYF32H5IIWCswtCIaUKWdO7OU2MYnH8PvU7PnVklYf1b7
	Vl9w==
X-Gm-Message-State: AJcUukdQmCbNmbsUXgNVvd28VmrnTVKSPHxqcEv6symbk+fH1GimTp6S
	ngfuqhU+tkqihYhBhk1BG/Gmjg==
X-Google-Smtp-Source: ALg8bN5U6k9Xax8FbeoQ5WwGT855cYhKRRxWZLfE7BUHlDoFO6RVNMrqDRFyK/oPEgInWRX/5k9qXQ==
X-Received: by 2002:a62:3888:: with SMTP id
	f130mr27588838pfa.132.1548804106768; 
	Tue, 29 Jan 2019 15:21:46 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	l11sm47489739pff.65.2019.01.29.15.21.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 Jan 2019 15:21:46 -0800 (PST)
Date: Tue, 29 Jan 2019 15:21:46 -0800 (PST)
X-Google-Original-Date: Tue, 29 Jan 2019 15:21:26 PST (-0800)
In-Reply-To: <CAFyWVaYACGYvUe2ehYiT0hjJR4bUc44ZG5niEdT7mJOMXxGVpg@mail.gmail.com>
CC: alistair23@gmail.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
From: Palmer Dabbelt <palmer@sifive.com>
To: Jim Wilson <jimw@sifive.com>
Message-ID: <mhng-742f375b-47d4-4554-b13a-270e098799e7@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::541
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH 5/5 v2] RISC-V: Add hooks to
 use the gdb xml files.
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 29 Jan 2019 23:21:51 -0000

On Mon, 28 Jan 2019 19:11:58 PST (-0800), Jim Wilson wrote:
> On Tue, Jan 22, 2019 at 1:52 PM Alistair Francis <alistair23@gmail.com> wrote:
>> You can get env and then check for floating point support:
>>
>> CPURISCVState *env = &cs->env;
>> if (env->misa_mask & RVF) {
>> ...
>
> I needed this which wasn't hard to figure out.
>     RISCVCPU *cpu = RISCV_CPU(cs);
>     CPURISCVState *env = &cpu->env;
>     if (env->misa & RVF) {
>
> The tricky bit was figuring out how to test it, because I wasn't sure
> if making registers conditional would actually work.  I figured out
> that using -machine sifive_e gives me a target with no fpu, and
> playing with that a bit I get the expected result, which is that the
> FP regs don't print anymore.  The FP related CSRs still do, but that
> would require gdb fixes I think, because gdb knows that they are both
> FP regs and CSR, and tries to print them both ways.  That leads to a
> more general problem of figuring out exactly which CSRs a particular
> target implements, which is a bigger problem than I have time to fix
> at the moment, and should be handled as a separate problem.
>
> Since my patch set is now a month old, I'll rebase onto current master
> and post a version 3 patch set.

Thanks!

