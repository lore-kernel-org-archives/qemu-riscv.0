Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CA85C61CE7
	for <qemu-riscv@archiver.kernel.org>; Fri,  6 Jun 2025 16:35:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uNa1V-0001qy-Sl; Fri, 06 Jun 2025 12:34:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1uNa1U-0001qj-SK
 for qemu-riscv@nongnu.org; Fri, 06 Jun 2025 12:34:28 -0400
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1uNa1O-0001Yn-SP
 for qemu-riscv@nongnu.org; Fri, 06 Jun 2025 12:34:28 -0400
Received: by mail-yb1-xb2f.google.com with SMTP id
 3f1490d57ef6-e7db6aaef22so1847500276.0
 for <qemu-riscv@nongnu.org>; Fri, 06 Jun 2025 09:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1749227661; x=1749832461;
 darn=nongnu.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TTYAh6YODEp15JDlSKfe9dGlhRijyGcVncG62LXwwSo=;
 b=sv8aXDTWZ8h96JI2yiQE46kQFv/776mt8/ItsNoOJXSC5Q63bObC7VEdZ1QUFxYspC
 fiKTKLAJPbrGz3oe59HhuFc/MmYkwZEStlFbqBs2bKGieXNOBlyldEHh+1vbHwqX2ig9
 wyA7CJh8mWRdW7EpIIXQWxLMkxclaYuTOvG0gUNa0CZCOh7lvuLSUD6NpB3fb+UvaFNL
 VV2xWy7iyT0FIR8gPP6KkQcIQBiyy5A95KO/KdjXzLtYyXdls3xUyCM6csgacd9oHaQz
 uXNadu9O4K3YfjMMmKp3Ax2LbFkCf/Q/5pFdLfNK2f71Vkd03nocUNN4NoViQ3AgWxLf
 cIkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749227661; x=1749832461;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TTYAh6YODEp15JDlSKfe9dGlhRijyGcVncG62LXwwSo=;
 b=KJYbM6blpEIskz+Jjqs4wQ8TpGwfds5wOEH91hHyme6+ZqHy6fdDAZSCtifahb5XuB
 3ppofQmCSLMqQrKuVuRXMDcnLGPBX10/8WSqIZashGxaU8nDLHVd5IXECC5Y7vBN6yi3
 +3Ni0Eoh5aRF3RYDRtTgBb3L6DKnLRlFx3E7vQSvTsX9FdgLo6RplLL8RI7c2xK96GIN
 A6UV279P5a/VDpeBtzVA3ns7LzDA76Ep87+U5g1FaPevumK2gfaEzSMrMCRCd36Wkmqa
 i3eVLoasky5MksWv51d+ALtHDtiokoqXIvQhBOVpgivfCaHUL3SKW8tZ8NhMngLLFyMq
 skiQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAgPh8cxFeOZjSZ3HDK7jtk8g0vKpT7t5f+g3bSoMjQAgCMap7NIY8WvZz/CJ03E9WxTbHvt0+xbzL@nongnu.org
X-Gm-Message-State: AOJu0YzJyCfvs64ZsNE1S3z43lOUIJmPulVeKkYEPr8F2ETW66qNzDRJ
 4oOnOP1S21YX6CXWaSkUt2LvbDgv1CI+TA0EPjhOo2oi8ceczKpsyJmYBkoemL4c7xlsRhzx0DC
 AbYWpvT3YTwm49ijnkB0Yxa3UDI5PWdLmvlUoxaEfxQ==
X-Gm-Gg: ASbGncslbgOFpph69jNeRWlTe58MFfqH81Xeu+cRfgHwoOBvtGr7DO7x40lzoaeFJDL
 SyxLB5pb9uZ8fsn+oV1QJxKOo9QdG4ZFxqnkaV86aSu90lHkLF0Yy3H8ewmSnGFEIutywdqKa2i
 Dp+tu34JJX5W9cwUNUbJ1H4YA1/mT+pUpwjA==
X-Google-Smtp-Source: AGHT+IFneTSlARfGZH4zAt3VwU8P/d1fTKkriQSfSc+O7whvf/O7t6i0BPcAlKMm5vsKlxaL42kqOPwB274zK48/2Fo=
X-Received: by 2002:a05:6902:124b:b0:e7d:7310:2d3d with SMTP id
 3f1490d57ef6-e81a2332f4cmr5476588276.33.1749227660713; Fri, 06 Jun 2025
 09:34:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250605142126.1939798-1-alexghiti@rivosinc.com>
In-Reply-To: <20250605142126.1939798-1-alexghiti@rivosinc.com>
From: Deepak Gupta <debug@rivosinc.com>
Date: Fri, 6 Jun 2025 09:34:08 -0700
X-Gm-Features: AX0GCFtsDnJEUmovKNpHqwrtbW-6bSm0nVxINJjMDhj0dIDNLOsOtMofkacdXis
Message-ID: <CAKC1njSo-C=H1aJdKGLvWjH4kTj3oAp=JoRo79E6zWsggfvFEw@mail.gmail.com>
Subject: Re: [PATCH] target: riscv: Add Svrsw60t59b extension support
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=debug@rivosinc.com; helo=mail-yb1-xb2f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

On Thu, Jun 5, 2025 at 7:21=E2=80=AFAM Alexandre Ghiti <alexghiti@rivosinc.=
com> wrote:
>
> The Svrsw60t59b extension allows to free the PTE reserved bits 60 and 59
> for software to use.
>
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---

Reviewed-by: Deepak Gupta <debug@rivosinc.com>

