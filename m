Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B276C7115C
	for <qemu-riscv@archiver.kernel.org>; Wed, 25 Jun 2025 07:27:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uUKWq-0000vh-44; Wed, 25 Jun 2025 03:26:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rkrcmar@ventanamicro.com>)
 id 1uUKWX-0000u9-K5
 for qemu-riscv@nongnu.org; Wed, 25 Jun 2025 03:26:26 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rkrcmar@ventanamicro.com>)
 id 1uUKWV-0003QY-K6
 for qemu-riscv@nongnu.org; Wed, 25 Jun 2025 03:26:25 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3a4eed70f24so933174f8f.0
 for <qemu-riscv@nongnu.org>; Wed, 25 Jun 2025 00:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1750836381; x=1751441181; darn=nongnu.org;
 h=in-reply-to:references:from:to:cc:subject:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YSzKtOlkvtm0QiZN/LTbTIpVSTo2J0t+mIpuEuW1t5U=;
 b=bup4F0gY4Xb9NlAWw9Jn6RuKmaqSTBO3zcr88cM5ygw2sQHb199gbFZpPBXe3Z8K5Y
 ziAH+Pt4bZfLT5ACvKhx+KdU/aBfcdcTXLuMiztF7ACN85X3juYqvw+V1HGwMIe6eA4G
 mdkGpTjMCqk149WHWA0S9np0Kqg51moAs1w6qgJl7V9up7qmJ0NkkZlVH53tIDZCujI5
 WEOdPYbPsAzJ1jJgcpykEgGnV6YG1KRbgj4eXgbchTftwxZ+k7YdA97nWJr7H7YZqYwg
 a5Nkx7bc1zZdYKoPHA8I5J1dpkAPRhU3TDdBUXYNtR+PQO08LJxUMxbNkMgmDlS3Qdjw
 jscQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750836381; x=1751441181;
 h=in-reply-to:references:from:to:cc:subject:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=YSzKtOlkvtm0QiZN/LTbTIpVSTo2J0t+mIpuEuW1t5U=;
 b=lCI30Pvw/+J7OT9YuvAIeVsX+pEqdmnPKLCpQVhLHdGdUPO60cnP4TRz4XRtGjM0DV
 BU4d6Rm/cxykB5+IEXee6LbGrEzr3ks1n2zUVBUb6DzXqwzZc7j218Cbn8vrWDIIxZMg
 1IOXLLa68v7eI4zh/6af8MnwnaAUgPF/fzY4/giMR/2APGfLJXCUAPX+W3/6yvwj/SOX
 t+06Hhb0cOWYlRgpF5nhQHatwk5kb2+bhrnl7a0q92o8oeS/UmqnoRlVrEJG9vU11OIT
 5ue6GIOgFBgflB10Zd3iSCGMbfJ5UP2y5QTn3LwrTYjKSoNLaDjaL/4biIGywfltES3u
 uPRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNZ9Qd8xTTnHstCri60UOdPDdF6HdPppncEdQ/hl/1VNK5QE2qrqvenjC/Dp0J6Mv7mzpkzf+VEykj@nongnu.org
X-Gm-Message-State: AOJu0Yxn9VBXBDd+7BEqXjnA2wdbvvLvp0h5ypfnOPKLgnsPFVKbJ4g1
 yzRnbo8/5BP8ztXCjRw0yXWpITbIscXyMIPwX8ZwH/YdrH+XCuYQwQ0Pwt1ljCAgHIA=
X-Gm-Gg: ASbGncs2xxYR8fKfhD4Df4ZuXjZGZiz/eKxjdlWO9biiuilThCwjQJsYIEL488kCai5
 NnMbquQJtQxRE2c0HMh5kUlQ5Brh9SGtdcRaDIPx08Lg4+400ZaQMgzmdD2NzAuW5wKWF9mIWsu
 n6mhn3CP8aNN/FVdbcua0KQ8KCyXyRGae7gsXfVhYJDyTZpaBz3itdNSoFLV26IW7Rterg7itb+
 w0aHFgKuD1GxA7nSIlxBLkpscOMLYsK6j429RfNILSPna/NewCOLJxXMacIVyhOkI7HDVCZtKMo
 EJE8LVUe4liniYrwuVS3SZZxq4ErD3KHhleEYf/dCazViOqKM62QfVNhU+/5numrL29ZnhX935x
 5msnMwXWcrW55EI0XnjVDK6eSfrtw2lf0
X-Google-Smtp-Source: AGHT+IE9Fcx+sQrN+3rf6cneNzg/NOTVVhQnYDct/WLHG1af9B9ieo/IiIwqZJ94W+/pFUP2p0KnkQ==
X-Received: by 2002:a05:6000:2dc2:b0:3a4:eeeb:7e89 with SMTP id
 ffacd0b85a97d-3a6ed608b79mr478799f8f.7.1750836380845; 
 Wed, 25 Jun 2025 00:26:20 -0700 (PDT)
Received: from localhost (ip-89-103-73-235.bb.vodafone.cz. [89.103.73.235])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a6e80695efsm3704476f8f.40.2025.06.25.00.26.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jun 2025 00:26:20 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Jun 2025 09:26:19 +0200
Message-Id: <DAVFP4YNR8KQ.3RYUHSEF34EG1@ventanamicro.com>
Subject: Re: [PATCH 1/2] target/riscv: disable *stimecmp interrupts without
 *envcfg.STCE
Cc: "Daniel Henrique Barboza" <dbarboza@ventanamicro.com>,
 <qemu-riscv@nongnu.org>, <qemu-devel@nongnu.org>, "Alistair Francis"
 <alistair.francis@wdc.com>, "Weiwei Li" <liwei1518@gmail.com>, "Liu Zhiwei"
 <zhiwei_liu@linux.alibaba.com>, "Atish Patra" <atishp@rivosinc.com>,
 <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
To: "Jim Shu" <jim.shu@sifive.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20250623165329.2759651-1-rkrcmar@ventanamicro.com>
 <20250623165329.2759651-2-rkrcmar@ventanamicro.com>
 <0811914e-623e-41a2-a54b-8ce42f45740c@ventanamicro.com>
 <DAUT771C07KV.2JZ4ZCRQ1MEQM@ventanamicro.com>
 <CALw707rf-7ftLs3xM2Btxz9H78E0nDj6D=1N18jWe5jroZ_7Zg@mail.gmail.com>
In-Reply-To: <CALw707rf-7ftLs3xM2Btxz9H78E0nDj6D=1N18jWe5jroZ_7Zg@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=rkrcmar@ventanamicro.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.999, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

2025-06-25T14:24:25+08:00, Jim Shu <jim.shu@sifive.com>:
> Hi Radim,
>
> Does your patchset want to resolve the same issue as my sstc patch [1]?
> My sstc patchset has been merged to "riscv-to-apply.next".

Yeah, I wasn't aware where patches go in the QEMU land.

> Maybe you can review it or check if there is still any issue in the
> "riscv-to-apply.next" branch, thanks!

My patch is doing exactly the same as [1/4] and [3/4] in your series.
I see you also fixed the NULL dereference. :)

I'm withdrawing this series, thanks.

