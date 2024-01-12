Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3DF1C4707C
	for <qemu-riscv@archiver.kernel.org>; Fri, 12 Jan 2024 03:52:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rO8av-0008UR-4x; Thu, 11 Jan 2024 22:52:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rO8au-0008UC-E2; Thu, 11 Jan 2024 22:52:32 -0500
Received: from mail-vk1-xa35.google.com ([2607:f8b0:4864:20::a35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rO8as-0004ZL-Nu; Thu, 11 Jan 2024 22:52:32 -0500
Received: by mail-vk1-xa35.google.com with SMTP id
 71dfb90a1353d-4b77c843fbeso1829773e0c.2; 
 Thu, 11 Jan 2024 19:52:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705031549; x=1705636349; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NyIHxte1CANQrKE+yjnvpa/JVQI+Oxxe/KuXiX7eWqc=;
 b=eslpwk6AmX0mEjajwYazoF92rghT5ElH925StrTkEgx3jkjocidk5oXSOuhp8VpNt2
 3YK3TZxW1geY9QbwI1I05EQwozsPnQDVq9TfbYra82b41Twk0HI0WJWmBBRWaiUQ5d4V
 dBUamRm6yd7F7q/Cg0fM+ljs5YE/0ydiBUtmkMLzJvgDPlDWsz2QZWcwnRwkFKjBL5wk
 L2TH3sQ06xqzhWfJ+CJl8qlKvN1ujxAfMFNRYZlEabXrzg7hUzRcqOnKmw5fSn16xYO3
 woHnRC+agB8Xf2dZOs91jt6cZ3iqu0Em6bgmyqu7ezCgJOLtxz0ViThnzhKwrD78rKUR
 vjXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705031549; x=1705636349;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NyIHxte1CANQrKE+yjnvpa/JVQI+Oxxe/KuXiX7eWqc=;
 b=vGmrkiUbRgoPXZtsYDrtjTgNLhMDgaDVyHiGdj8OFujKb7QJQkxUgbwO5zqwfuzYgq
 jCMXdHzyrJIL4Qa4EKoG8pPyVhFE5EYzUZXXCMduv+tMOyfXbtKGCC4BOWFd6xoeNSK8
 067j2cz7Tdwf9ZvO+nZRizCQw0CGbeoDm5dtsXtEgKwpyLzGQEyQpdwY0amr7Z5o41ws
 3xCVxDHm+COy3zEYxT9fV1ElO5D2VZAshrXLezqs7I/xfFcsdpY8iCHd3n+Ks/kl6Gbg
 Uo/Fk162kI5yby7tKM1lqncFEf27+sDBRLtPR/R/u0vLTwp5vZFr3CM/BwaeUZxyyGCB
 WMBQ==
X-Gm-Message-State: AOJu0Yxd4obQ6SoCMytWr8vx+VBiZDdjpjMsmPAv2T4DX1nwNjTpc1jf
 f+ndnTJFlrm83G+wIJTnTafL4N8vXsns80mJAQI=
X-Google-Smtp-Source: AGHT+IEKjzbyApgczJs7UpePz4pE3g6iCFZZNHelhfLMhaNvUZWSARKYwl2V76OjDhCue1eX5iR5qgZBsZjupckm+Nk=
X-Received: by 2002:a05:6102:1250:b0:468:1d5:941a with SMTP id
 p16-20020a056102125000b0046801d5941amr750894vsg.28.1705031549165; Thu, 11 Jan
 2024 19:52:29 -0800 (PST)
MIME-Version: 1.0
References: <20240110040203.1920924-1-hchauhan@ventanamicro.com>
 <e2763db2-fade-482d-b433-1bfce6acf7d3@ventanamicro.com>
In-Reply-To: <e2763db2-fade-482d-b433-1bfce6acf7d3@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 12 Jan 2024 13:52:02 +1000
Message-ID: <CAKmqyKOA6OtixYoMJ_qtXj_u0t6rMdHawg0VEvq3-=mK4q6_XQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] Export debug triggers as an extension
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: Himanshu Chauhan <hchauhan@ventanamicro.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Alvin Chang <alvinga@andestech.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a35;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa35.google.com
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

On Thu, Jan 11, 2024 at 5:20=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Himanshu,
>
> We spoke offline but let's make everyone aware:
>
> - 'sdtrig' should be marked with 'x-' and be an experimental extension si=
nce
> the spec isn't yet frozen;
>
> - Alvin sent a patch to the ML adding the 'mcontext' CSR for 'sdtrig' som=
e time
> ago:
>
> "[PATCH v2] target/riscv: Implement optional CSR mcontext of debug Sdtrig=
 extension"
>
> It would be good to put his patch on top of this series to ease the revie=
w for everyone.
> The changes done in patch 2 would also be applicable to the mcontext CSR;
>
>
> - last but probably the most important: the existing 'debug' flag seems t=
o be acting as
> the actual 'sdtrig' extension due to how the flag is gating trigger code,=
 e.g.:
>
>    if (cpu->cfg.debug) {
>          riscv_trigger_realize(&cpu->env);
>      }
>
> and
>
>      if (cpu->cfg.debug) {
>          riscv_trigger_reset_hold(env);
>      }
>
>
> If that's really the case, all the checks with cpu->cfg.debug will need t=
o also include
> cpu->cfg.ext_sdtrig (one or the other). And now we'll have to make an opt=
ion: do we leave
> the debug triggers (i.e. the 'debug' flag) as always enabled?

From memory the "debug" property is for the original debug spec:
https://github.com/riscv/riscv-debug-spec/releases/tag/task_group_vote

That was ratified and is an official extension. AFAIK this is what is
in physical hardware as well.

The actual PDF says draft though, I'm not sure what's going on there.

The debug spec doesn't have a Z* name, so it's just "debug", at least AFAIK=
.

"sdtrig" seems to be a new backwards-incompatible extension doing
basically the same thing. What a mess

>
> If it's up to me I would make 'debug' as default 'false' and deprecate it=
. Users will need

I don't think that's the right approach. It's a ratified extension
that we are supporting and is in hardware. I think we are stuck
supporting it

> to enable the debug triggers via x-sdtrig=3Dtrue from now on. This will b=
reak existing behavior,
> but the way it is now we're always enabling an extension (via the debug f=
lag) that isn't even
> frozen, so we're already in the wrong.

Maybe the debug group can chime in and say what they expect users to
do? It seems like there are conflicting specs

Alistair

