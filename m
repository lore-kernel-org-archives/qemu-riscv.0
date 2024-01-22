Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D799C4725D
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 03:40:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rRl9j-0000WN-W1; Sun, 21 Jan 2024 22:39:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rRl9g-0000VZ-Ra; Sun, 21 Jan 2024 22:39:24 -0500
Received: from mail-ua1-x930.google.com ([2607:f8b0:4864:20::930])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rRl9e-0003XG-C1; Sun, 21 Jan 2024 22:39:24 -0500
Received: by mail-ua1-x930.google.com with SMTP id
 a1e0cc1a2514c-7cd5ab5d5bbso823428241.3; 
 Sun, 21 Jan 2024 19:39:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705894761; x=1706499561; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UWykkHMmPGUlpBmq3TPww2Q3eu2EqchxG3mWi7iyKIo=;
 b=jzBpRGMe5E/8OiK0/SKhTuOV+uZqIsBFdsM3DeyxzCw7DmVon6z06IN7EjPMSkplv4
 +ZVMznG5J5oG5PYXzPZ4zceMRKLrpzKmuL74DUCi+GP/YB0veLHk5adfc2nVIWJ+Mbui
 gL+iJ8E0m4SuIRpxoYnuj1GzYMCImMVl0alTfkubq4d+jieMmTrH5Hd+3WBRDtIxRX/0
 VjXGFq/Wa24meu9KqewTbyI83/Q1SycDZc0Hy2wqATMFhOFGbFQpjdvSHxB7m/qMI8v5
 oea7/bpmXJx/LLeB28lgCt7JScTjoJIY0n2W+0IYYEYfhovKR33oAiEEkSpuXsg0k89r
 8WxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705894761; x=1706499561;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UWykkHMmPGUlpBmq3TPww2Q3eu2EqchxG3mWi7iyKIo=;
 b=j0XrtmrTqhSXMLd/X2bNBu7KwDJOzK1da9OtM/C0sbRzChiafFw43gEbsN95nWvinF
 LQNqECOFsoqlTODjkm2weiEcZkknOikjXxnnf3dFpkhU6elCRBk7dH1lYE87g/8uc+/C
 mtYNG9PA2mY/3nIgZWqB4E+f2ews+QeVqkCrw79MtnOblsm5aMHJBTTr3B2CvJSJH8Hr
 ecFedkYTgvKp5a3g95xF7cvdITlsW7rtYuirDTYhK8of4I0wDA5hcflzAAE26BllONqI
 KA4OKSvgCyAmS26eryw/nAG/LymPZP0jkcoVJNC4Izrwpm21mFDhJKS36OS9vzp+Kp05
 NBGA==
X-Gm-Message-State: AOJu0YynnH0bSRXOnwrwSUFykhpFVGmWvJV6R6ta0fOlWdl6RdHqAn66
 veZ+1aTQ0EB/xPE/x9depcnQ6tcXlPjLxMZ+6ONaH3dhYHXRjtIekYnlZ8LsVWzjZsWVtOKP4Yi
 pYIWOBcGKHA/hC4iRtbwOd5BSbz/exupCyh4=
X-Google-Smtp-Source: AGHT+IHR4kxyEo5eWky5FrOT+dIbENXXqOHKTdlwbeHo5NVxEgV3Nh10kiTyJtXaoHAKfXyDVWAjTYnLMTAsIuMohGs=
X-Received: by 2002:a05:6122:311c:b0:4b6:d4a0:5841 with SMTP id
 cg28-20020a056122311c00b004b6d4a05841mr890125vkb.6.1705894760858; Sun, 21 Jan
 2024 19:39:20 -0800 (PST)
MIME-Version: 1.0
References: <20240108161903.353648-1-dbarboza@ventanamicro.com>
In-Reply-To: <20240108161903.353648-1-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 22 Jan 2024 13:38:54 +1000
Message-ID: <CAKmqyKP3TMrzyn9SvAzL3Wt9U=4mOPP7F-GOJo5anJn_h1m_2Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] riscv: add rv32i,rv32e and rv64e CPUs
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::930;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x930.google.com
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

On Tue, Jan 9, 2024 at 3:40=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Hi,
>
> This is the second version of a buried patch series:
>
> "[PATCH for-9.0 0/6] riscv: rv32i,rv32e,rv64i and rv64e CPUs"
>
> This version shrank to 2 patches since most of the prep work was already
> done by the RVA22 profile implementation, which is now queued in
> riscv-to-apply.next.
>
> The motivation is the same as in v1 - give users a cleaner way of using
> a customized CPU, from scratch, without the need to disable default
> extensions.
>
> Patches based on Alistair's riscv-to-apply.next.
>
> Changes from v1:
> - patches 1 to 4 from v1: dropped
> - patches 5 and 6 from v1: merged into patch 2
> - patch 1 (new):
>   - add a new common cpu_init() for all bare CPUs
> - v1 link: https://lore.kernel.org/qemu-riscv/20231113213904.185320-1-dba=
rboza@ventanamicro.com/
>
>
> Daniel Henrique Barboza (2):
>   target/riscv/cpu.c: add riscv_bare_cpu_init()
>   target/riscv: add rv32i, rv32e and rv64e CPUs

Do you mind rebasing this on
https://github.com/alistair23/qemu/tree/riscv-to-apply.next ?

Alistai

>
>  target/riscv/cpu-qom.h |  3 ++
>  target/riscv/cpu.c     | 64 ++++++++++++++++++++++++++++++++----------
>  2 files changed, 52 insertions(+), 15 deletions(-)
>
> --
> 2.43.0
>
>

