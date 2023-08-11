Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F52BC001B0
	for <qemu-riscv@archiver.kernel.org>; Fri, 11 Aug 2023 14:36:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qUTEx-0001Aj-Qq; Fri, 11 Aug 2023 10:35:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qUTEv-0001AK-Kq; Fri, 11 Aug 2023 10:35:45 -0400
Received: from mail-ua1-x92d.google.com ([2607:f8b0:4864:20::92d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qUTEs-0006kA-EZ; Fri, 11 Aug 2023 10:35:45 -0400
Received: by mail-ua1-x92d.google.com with SMTP id
 a1e0cc1a2514c-79d93e7ba34so1177936241.1; 
 Fri, 11 Aug 2023 07:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691764540; x=1692369340;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2hi/KHNzwHwycVXHqpzSUCJ9uGJ4er2ucHtA+BbYpYk=;
 b=WpjlsJkoyoF6XNJ5O2sQISEGEmmMvDi/DA2Ia80URaWdja6orlPSVTYafUhT9NgRrC
 U6k3ctl8OSaJR6M5t0kokrwgcCkEsCUcR/16OIqM7pccFIP5nQ4LxZYSQMD3VGAtAmRa
 3xVbUWL8AJdEhMC80Et3aVxc1t5fjhcxCNwQRdIjsLbiCNy66I4SO45XQZsS6uRuhGoW
 KD2rNt6H198GP+JosR2xPOg5PgUweafEeNO6/9cHQhrEHTrJk25GU51rrzzz4AuIkM53
 rC9zAeruQCNTx9/GUgiMY5wFxqw6D0Y9cUMDPF3GEfzwIozEtHxWSKAImHGmokDoM2BS
 a37w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691764540; x=1692369340;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2hi/KHNzwHwycVXHqpzSUCJ9uGJ4er2ucHtA+BbYpYk=;
 b=UG5QbD92EixJxaVDNmOqVmWW/vmJ50PG8dWvxxHt202aerINU3GQOHU7zWOg7I2N5k
 C6kuKr1lT7+Ed1Qedq00zxq2phf9xf8XMgfUgWt+oY3sf9/Ose7FQSBHvgFnJpN8RNPD
 SWKI0Hie5MpFLXvjEQXPY1FYxB0pG71oKESBpYkrX13cCpENexaFdW8HMvlBOTjLaFU2
 V2PjqjBb9tO2Bs+tv/Di0KjR1UuRAw0pQnAd5/qdGL0Im+RdNWerf43zc4pxk2y5JoUp
 nUgAgIgTFSb8v1wQqTtxhP7yReB7TgSmh3GqjcsELzWnpQaA6mYnXpaSlhD7WyClZ6fy
 FOuw==
X-Gm-Message-State: AOJu0YzihjewZ5SdLEAXYterGGcgCiS0YKvkVcrpikVgTOlrgOhyMp+x
 e1uuoRt4zy8mUIZFNfr2vi77JtyBoDXObQSvPHI=
X-Google-Smtp-Source: AGHT+IH1fo8WPkjFE4Pxm2W6/Ai/a+jYXsh0HaBUHCcPP0viIEJm7YoxkBLS5/m6RHmba6rMZBYrKoh7OZUXPlwJAPA=
X-Received: by 2002:a05:6102:7ac:b0:447:80bb:2104 with SMTP id
 x12-20020a05610207ac00b0044780bb2104mr1541822vsg.9.1691764540083; Fri, 11 Aug
 2023 07:35:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230811055438.1945-1-zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20230811055438.1945-1-zhiwei_liu@linux.alibaba.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 11 Aug 2023 10:35:14 -0400
Message-ID: <CAKmqyKOL4Oe0ZK2a8NTHL=aw=TGraBunza_xgOx4YPLPZySK7g@mail.gmail.com>
Subject: Re: [PATCH v2] linux-user/riscv: Use abi type for target_ucontext
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Cc: qemu-devel@nongnu.org, richard.henderson@linaro.org, 
 Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com, 
 liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com, qemu-riscv@nongnu.org, 
 philmd@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92d;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92d.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Fri, Aug 11, 2023 at 1:57=E2=80=AFAM LIU Zhiwei <zhiwei_liu@linux.alibab=
a.com> wrote:
>
> We should not use types dependend on host arch for target_ucontext.
> This bug is found when run rv32 applications.
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
> v2:
> - Use abi_ptr instead of abi_ulong for uc_link. (Suggest by Philippe Math=
ieu-Daud=C3=A9)
> ---
>  linux-user/riscv/signal.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/linux-user/riscv/signal.c b/linux-user/riscv/signal.c
> index eaa168199a..f989f7f51f 100644
> --- a/linux-user/riscv/signal.c
> +++ b/linux-user/riscv/signal.c
> @@ -38,8 +38,8 @@ struct target_sigcontext {
>  }; /* cf. riscv-linux:arch/riscv/include/uapi/asm/ptrace.h */
>
>  struct target_ucontext {
> -    unsigned long uc_flags;
> -    struct target_ucontext *uc_link;
> +    abi_ulong uc_flags;
> +    abi_ptr uc_link;
>      target_stack_t uc_stack;
>      target_sigset_t uc_sigmask;
>      uint8_t   __unused[1024 / 8 - sizeof(target_sigset_t)];
> --
> 2.17.1
>
>

