Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pjwIS-0003sD-QG
	for mharc-qemu-riscv@gnu.org; Wed, 05 Apr 2023 02:07:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pjwIO-0003qs-Cr; Wed, 05 Apr 2023 02:07:00 -0400
Received: from mail-vs1-xe2a.google.com ([2607:f8b0:4864:20::e2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pjwIM-0006yU-Hi; Wed, 05 Apr 2023 02:06:59 -0400
Received: by mail-vs1-xe2a.google.com with SMTP id dc30so30012731vsb.3;
 Tue, 04 Apr 2023 23:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680674817;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R59xKTyGphhIrqMul2zpI3JPMBveLuUkBToB6HPuqYM=;
 b=kHAsemvpG56FDzQoR+KJ+8oMMCgQM97MyjHHCK8Csu5/YZJj3DJl8TGS81aQ6Jla+L
 CfqCxXzvZpIR2zS8ArX/kY1F+dFjkcb19Qxt4QJE2fgipQLwXvc8G9wrknyeygrSJ7uf
 K/rDZRf0VFArWSfl3lwOfAWICDrhcQYjhVlRyStN5l6FgJoC/enYGm/rcTq/Oi0ouo6t
 P5OrjNlmTKDAMTaO8bM0ckhkY9HT304lA1hvJax/+l36nmiBtJV1P7T0yUtFF1TQ1WAx
 MHyinsUj/J4SgUH9aATBc7PjVCB0GKQtTz3uUnpT3Mh2T1At0g7i7F7Sye1b2pEhauG3
 2ABA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680674817;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R59xKTyGphhIrqMul2zpI3JPMBveLuUkBToB6HPuqYM=;
 b=mb18/bs53zufcXNKi4ayodqgE+qYeypxEXg0lLSYEISQ60k0EnjnPZE9Kkifq8yhk3
 wNFj8ElPak2s5U3NvEucZEfGTrjfCJlDRrse0qpryQ3fQ4b5TJuOWAPjqjN5Tr1ONrXU
 Tg9bmJryfV9ZXcA/maTI/s8MxoFLZHVzjTTaRxl3T8yuFKnKb24zsRAslZSa4icgt/2K
 WrH2J7wWHckxCLFSN55SO5+9WXO80Wzsl2N7A9sKD0MWnCUiSik+dlsgW8qoByE/+30M
 45eYcLKt0Mytnt3KqaAF4uFAhUAPKfRiZlQ9U7qQM97r12dL9cfnkcWcd5cH3JgYp1fM
 hYdA==
X-Gm-Message-State: AAQBX9cw30pVqndtOquYkEYvT2xXYrroEXRDuFrBDzkIQLryZT3i8nnW
 1NGRlrMk6ZB77+BvLY4Rc5PXmwsn/KU/AXtTodnzTUDqOe0=
X-Google-Smtp-Source: AKy350ZuKxOqbP9MuHpRwbTbGjp+Y84TrgADUKQBo7BimUiCXsIHqY+0FVGE8INZlrhewHI+B0xuMyaKHnEasQTNvUo=
X-Received: by 2002:a67:c890:0:b0:425:8e57:7bfd with SMTP id
 v16-20020a67c890000000b004258e577bfdmr3706839vsk.3.1680674816197; Tue, 04 Apr
 2023 23:06:56 -0700 (PDT)
MIME-Version: 1.0
References: <e9de7676-b669-4f4e-e3e0-e57fb58b7bd7@intel.com>
In-Reply-To: <e9de7676-b669-4f4e-e3e0-e57fb58b7bd7@intel.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 5 Apr 2023 16:06:30 +1000
Message-ID: <CAKmqyKO6n0go_SzsViGjuS_US8ewiWkNdnVSHwjHmZWUSajpow@mail.gmail.com>
Subject: Re: riscv: g_assert for NULL predicate?
To: "Wu, Fei" <fei2.wu@intel.com>
Cc: "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 qemu-devel <qemu-devel@nongnu.org>, bmeng@tinylab.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2a;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2a.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Wed, 05 Apr 2023 06:07:02 -0000

On Mon, Apr 3, 2023 at 11:43=E2=80=AFPM Wu, Fei <fei2.wu@intel.com> wrote:
>
> Recent commit 0ee342256af92 switches to g_assert() for the predicate()
> NULL check from returning RISCV_EXCP_ILLEGAL_INST. Qemu doesn't have
> predicate() for un-allocated CSRs, then a buggy userspace application
> reads CSR such as 0x4 causes qemu to exit, I don't think it's expected.

Hm.... That's not good. Userspace shouldn't be able to crash QEMU. I
think we want to revert that patch then.

@Bin Meng any thoughts?

Alistair

>
>   .global _start
>
>   .text
>   _start:
>       csrr t3, 0x4
>
> Thanks,
> Fei.
>

