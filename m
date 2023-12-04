Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F664C4167B
	for <qemu-riscv@archiver.kernel.org>; Mon,  4 Dec 2023 01:49:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r9y4s-00019I-Sd; Sun, 03 Dec 2023 20:48:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1r9y4l-00018a-EG; Sun, 03 Dec 2023 20:48:47 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1r9y4j-0004og-ME; Sun, 03 Dec 2023 20:48:47 -0500
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-548f0b7ab11so4935299a12.1; 
 Sun, 03 Dec 2023 17:48:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701654523; x=1702259323; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OeAbMN+a0irZZZx8y43K2WlU21sQUerbXuKjPoVYglQ=;
 b=BfjAwcXuJIGnnAsOZ0vG2N1O33s3WeJYe1uxwBqWgo+7JvY7Q774PDZFr0Tv8kq+Cw
 g4fjRjeT2UJw3ojqUjVX7h5B0D18dSgnqc2k6/XNHzl//ZKl+EZYQ4aHTqM8RIbvZVus
 JVnxJLp7kWKKHH+uC6nPA4cF6z9rRihhb8LharEtnVmO5HcmCj9IqKpuHbwX+349Np3l
 mQLxIgzPXPRlxNtrOkfwtzib/vXCopZtusyWAzNsQ6TDv5WQLzPYiTlol43+wwizyBUC
 +VhlQCwm4hBSYTp5P2m30FY8du5mEFOTTiFEjou0CMSbdxiXDWm96NoYfItfJGpm0tSy
 LG3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701654523; x=1702259323;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OeAbMN+a0irZZZx8y43K2WlU21sQUerbXuKjPoVYglQ=;
 b=tmOLd54lxaBUTDknPLIF+MFN3SxwrjzpX/uffh3WmqHT1yI6K6rZwCTD/xvj6u10xB
 sq7EXqqAO3a4v3NRe78sCm0v01FdTojA6rQQnloyzIeXhNlIlFslfEq0qqAifwAskdTh
 OGmlmtq7uyrtDBC5feois4C0OXHVPSZd1ZrgAxZ0pxSXdIDya4z5gZ0ZoWAObATwisgo
 t8WNMvAbPPtc+fwSmJfGsvjRTajRwrxsGmfGIwcpYvWjr4CuMl/H5zGnGA+t2qcFnHP0
 ZyGoV/n/Zw5DqFRetTs+KSAjcHLtBkuOL35WesPvTyrR1uLcavmqemGXVfdlI61wZ2s7
 ViPg==
X-Gm-Message-State: AOJu0Yy7YJR4AYkXFpRUlx9qLyX+XwWJCFadn29jhRc0QaZaIAGEPdw/
 Xlv+mgdFD0Axo5EzIf2s0AyFec4yQ9GGdgiJnNg=
X-Google-Smtp-Source: AGHT+IF46w/rCJhBDlHEseBjwBo/bWYp8uSzoHYqPt/8an2qisTwjGqZG+BQpED51GokxP/6NFQLfQ5LnNTNUnfE9dA=
X-Received: by 2002:a50:cd16:0:b0:54c:ac82:6622 with SMTP id
 z22-20020a50cd16000000b0054cac826622mr725981edi.59.1701654523018; Sun, 03 Dec
 2023 17:48:43 -0800 (PST)
MIME-Version: 1.0
References: <20231123101338.1040134-1-dbarboza@ventanamicro.com>
 <5cb07d83-934d-4db0-8fee-3146f3751743@linaro.org>
 <94455c2c-dba0-454e-b9b6-3413f272e13f@linaro.org>
In-Reply-To: <94455c2c-dba0-454e-b9b6-3413f272e13f@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 4 Dec 2023 11:48:14 +1000
Message-ID: <CAKmqyKPiWtapH7=T0rK1CWAd5Wjm0HO7XSnx7P3AR8uU_UwaPQ@mail.gmail.com>
Subject: Re: [PATCH for-8.2] target/riscv/kvm: fix shadowing in
 kvm_riscv_(get|put)_regs_csr
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, 
 alistair.francis@wdc.com, bmeng@tinylab.org, liwei1518@gmail.com, 
 Markus Armbruster <armbru@redhat.com>, zhiwei_liu@linux.alibaba.com, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, palmer@rivosinc.com, 
 ajones@ventanamicro.com, Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Mon, Dec 4, 2023 at 3:00=E2=80=AFAM Philippe Mathieu-Daud=C3=A9 <philmd@=
linaro.org> wrote:
>
> On 23/11/23 11:23, Philippe Mathieu-Daud=C3=A9 wrote:
> > On 23/11/23 11:13, Daniel Henrique Barboza wrote:
> >> KVM_RISCV_GET_CSR() and KVM_RISCV_SET_CSR() use an 'int ret' variable
> >> that is used to do an early 'return' if ret > 0. Both are being called
> >> in functions that are also declaring a 'ret' integer, initialized with
> >> '0', and this integer is used as return of the function.
> >>
> >> The result is that the compiler is less than pleased and is pointing
> >> shadowing errors:
> >>
> >> ../target/riscv/kvm/kvm-cpu.c: In function 'kvm_riscv_get_regs_csr':
> >> ../target/riscv/kvm/kvm-cpu.c:90:13: error: declaration of 'ret'
> >> shadows a previous local [-Werror=3Dshadow=3Dcompatible-local]
> >>     90 |         int ret =3D kvm_get_one_reg(cs, RISCV_CSR_REG(env,
> >> csr), &reg); \
> >>        |             ^~~
> >> ../target/riscv/kvm/kvm-cpu.c:539:5: note: in expansion of macro
> >> 'KVM_RISCV_GET_CSR'
> >>    539 |     KVM_RISCV_GET_CSR(cs, env, sstatus, env->mstatus);
> >>        |     ^~~~~~~~~~~~~~~~~
> >> ../target/riscv/kvm/kvm-cpu.c:536:9: note: shadowed declaration is her=
e
> >>    536 |     int ret =3D 0;
> >
> >
> >> The macros are doing early returns for non-zero returns and the local
> >> 'ret' variable for both functions is used just to do 'return 0', so
> >> remove them from kvm_riscv_get_regs_csr() and kvm_riscv_put_regs_csr()
> >> and do a straight 'return 0' in the end.
> >>
> >> For good measure let's also rename the 'ret' variables in
> >> KVM_RISCV_GET_CSR() and KVM_RISCV_SET_CSR() to '_ret' to make them mor=
e
> >> resilient to these kind of errors.
> >>
> >> Fixes: 937f0b4512 ("target/riscv: Implement kvm_arch_get_registers")
> >> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> >> ---
> >>   target/riscv/kvm/kvm-cpu.c | 19 +++++++++----------
> >>   1 file changed, 9 insertions(+), 10 deletions(-)
> >
> > Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

>
> Also:
>
> Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>
> Alistair, if you don't have any pending riscv pull request
> I can take this patch with the one I plan to post tomorrow
> (this is the last fix missing to get our CI green again).

Go for it! That would be really helpful

Alistair

>

