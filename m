Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68CEFCD6E49
	for <qemu-riscv@archiver.kernel.org>; Fri, 29 May 2026 04:26:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wSonr-0008OU-CO; Fri, 29 May 2026 00:26:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.liu.zevorn@gmail.com>)
 id 1wSonp-0008OL-14
 for qemu-riscv@nongnu.org; Fri, 29 May 2026 00:26:33 -0400
Received: from mail-dy1-x1341.google.com ([2607:f8b0:4864:20::1341])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chao.liu.zevorn@gmail.com>)
 id 1wSonm-0007Or-Ry
 for qemu-riscv@nongnu.org; Fri, 29 May 2026 00:26:32 -0400
Received: by mail-dy1-x1341.google.com with SMTP id
 5a478bee46e88-304ec41197bso226826eec.1
 for <qemu-riscv@nongnu.org>; Thu, 28 May 2026 21:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780028788; x=1780633588; darn=nongnu.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=8akRhNkIPBNv3euSsFUNNEWsmPxeLpccMMpA7fw3tdM=;
 b=VdCg1yVW/N7UMPrV5TDcwzdSjVFC9gogKjWbsxSY4aedD6J00Yo1LPKGoX208RXa/Z
 6hpJjXo4oljHwxbEWudiD5EgJGnLbOcQGOtvoEUU0+XOoi0kbJT9Sw5bpTGOrF/sO1OP
 rSpWk1htGcpviXivcqYIIxph9OiXqI5xHvNrT9whXYXTtgvOVk/j1MfdtPUiY0roYx9e
 y7fATwMPVdFC+aSECG3qGqRkyLj1NC4azxJ3ar5/72bDsRDFT6ZmqbQnd/OJugLHeTLI
 36DbmVJ7bDtmrpgakuROt7oAg2qcBJrYbXkOUxWr+HPX4dzgAvV0NpoIDAPukmoPBbFP
 NZKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780028788; x=1780633588;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8akRhNkIPBNv3euSsFUNNEWsmPxeLpccMMpA7fw3tdM=;
 b=Zc7gY9qg2OtxLn3MyLWjJZLyncmtSsdKPXW5GHmbUjdy4b5lviFaJ4FTV5HREpqdEI
 BnO0AyYp7Ycug2hIMpFdI3AvM1S5ipegE8Qo277KeBe4BCqrFGFtU/PzSA2jBdo95AMw
 CIZDnJtNgy6eVIGj06rfSTla8vtSPm4mN350YPQIiZHEAiHAf1SR3QrDb0hTRR7s+ilf
 SWmvcLvOviXV6G83r7ALJOalumE2YywS8WyEDSgGnpEY6w4zKCGrauioI06AVsUoCXLM
 JDUx5T97on+RVcwVmxQvby1MBmMqnytwLext8T2+o1k4a3yQEM3jlJx5BwOQJx+Cjxyh
 sMHA==
X-Gm-Message-State: AOJu0Yw0zz799BJGbC3dFreJZcwwCRFhf2XhWuXgCz5cvKre+LKf8jGY
 cPZEwxffzqyZYwA04P61qp7pJvQ8IH1PflqSwm8vqiMA4+p3c7FeptMiZNab2BG7f30=
X-Gm-Gg: Acq92OFKt7hcqXIVnpr59HjZMiBfbRZpo16EBaFGJC1ArlFEMnFNwk6BY3DShF1P9br
 q8xBHffYgczlGf0lDrhjwmR0NSxcuKT99KMC2kJs6i+3ssBEoOsNaDF+MbkmBs6E+QB+FpswrQQ
 ZS9u/Co481Jo2T6MP56iyjLbj2xSOhbF46P5CivPgCTAhtNk4eJ9idyfZ6M6pcXOSjsbMgXvR/K
 GPUekUA6cEqS/+WqODgRogYqnsS4/EmDEYGtxVic3N/ogfxDJn7bmBJCeXbW3DxM+Womcw+v9UU
 4ldNe2E/12Ap2Hyc9ekGak512pJUsiJZPSvt2eHDevO0X8QZVk+KeAuEVmSLzKuDtBr4IcDgQwu
 HsyJzpeGNbbe50aOAYKyRiRCD4U0kvpN4W1qwJWZeqW83RAm7MFUmD7WqRbleR9GhZ0vKBSx6nQ
 I4JRVp13XBvNF0ErCYdJJckEEo8R7ne8pMm4bFwzAvcEgd/P634xVeHkmgzIfo+0YhdQp7rw==
X-Received: by 2002:a05:7300:fb8c:b0:2da:2ec2:64fe with SMTP id
 5a478bee46e88-304eb21b5f9mr540781eec.24.1780028788371; 
 Thu, 28 May 2026 21:26:28 -0700 (PDT)
Received: from localhost ([64.186.250.142]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-304ed5d5385sm513328eec.28.2026.05.28.21.26.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2026 21:26:27 -0700 (PDT)
Date: Fri, 29 May 2026 12:26:24 +0800
From: Chao Liu <chao.liu.zevorn@gmail.com>
To: Alistair Francis <alistair@alistair23.me>
Cc: qemu-riscv@nongnu.org
Subject: Re: QEMU RISC-V Call
Message-ID: <ahkO4rYox0cbCTZk@ChaodeMacBook-Pro.local>
References: <e2576b58-9356-4d88-8485-42256b2a2366@alistair23.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e2576b58-9356-4d88-8485-42256b2a2366@alistair23.me>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1341;
 envelope-from=chao.liu.zevorn@gmail.com; helo=mail-dy1-x1341.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Wed, May 27, 2026 at 10:15:57PM +0800, Alistair Francis wrote:
> Hello everyone,
> 
> There has been some interest recently about setting up a call to discuss
> QEMU RISC-V and the current status.
> 
> So I wanted to setup a chat next week AEST (UTC+10) time to discuss a few
> things on a call.
This works for me(or 10AM). That day happens to be my first day at a new company,
but I’ll do my best to attend.

Thanks,
Chao
> 
> I was thinking 1PM on Monday the 1st of June.
> 
> Kind of similar to the defunct RVI QEMU calls that never really took off. I
> know scheduling can be hard, so don't stress about missing anything. It's
> mostly just a chat to spit ball some ideas and get any feedback. I can send
> out details about the discussion afterwards
> 
> Currently I'm thinking about:
>  * Current QEMU RISC-V extension policies
>     * We are getting inundated with extension support patches and I can't
> keep up
>  * Vector cross implementation issues
>  * Any upstream issues and how we can make things easier
> 
> Alistair
> 

