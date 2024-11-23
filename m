Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3044D75E59
	for <qemu-riscv@archiver.kernel.org>; Sat, 23 Nov 2024 15:30:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tEs4a-00066D-HU; Sat, 23 Nov 2024 10:29:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tEs4X-000656-Tx
 for qemu-riscv@nongnu.org; Sat, 23 Nov 2024 10:29:21 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tEs4V-0007nP-7H
 for qemu-riscv@nongnu.org; Sat, 23 Nov 2024 10:29:21 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4315eeb2601so36892095e9.2
 for <qemu-riscv@nongnu.org>; Sat, 23 Nov 2024 07:29:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732375757; x=1732980557; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L83RtzyR0L4NcRtwdTXA1VSnlQBPYZvSb84HRUVcJp0=;
 b=CDjRX/jTqarkYryLd5gJN6z/DDG9e+TvLc4ja2UjtzRdEO8lLTgx4QX+XhhScuwCQa
 +Iag3MlLsbv8rPRAcV30wiL8MDbz4Cgy2e1/bq7on4x4T+ExLqMnooYhbEfTWhp5msns
 pg+LIajiM9FHp1lh0z7NbB6jo+ChStUSE84i2SK/4BJE0XMvG0b8ZNa3CyO8yHSGaRIo
 Q+xxwtWqbbmpvbHTcqowRm3yfInHXEB8lyfx0c5606jli8NQEi18B8s+crbeX8pFG4kg
 orTKhN/btcY4rjNzuIp8X92PWXL9wMQpsj/cX8XqTTVbIBCdoEN3u5igexG4r0UFzTzd
 gPzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732375757; x=1732980557;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=L83RtzyR0L4NcRtwdTXA1VSnlQBPYZvSb84HRUVcJp0=;
 b=D9TDAqbEhTSRLZy8ZiYnSDHuOoKQmZBE3BttDW1m/k9c270km4TYmunHgRL+/hEhzg
 7V4xkTlZBmMYi/RFF43Ijwmta22x2+v2/nYKolPQ0nuKRdW7eiFrBvrfAa/wFnzMfvuW
 /0fBlw4jf6tuWP+WjJfafApuVLczLQ9o6jZV8582qAjDadyc+xXvsFU46ZGqeaCRkT8u
 GUNGrANsNCUIilW0NZ29dtUhot3xyufDeFsMiQutNhzpQWOGio2hcD5/N6bsLNxmxZAX
 mNC/b6Q9oHc0i6pNLdZGfXqj7EK2JdMWQjMNDuEeKiq6SL8ZmdWWLSD3QVmkE1XekKPI
 u3/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+76eEG9DeU6KkUbRBOzVuXlMf+FjhurIfjgZFs8hVpoYsdjFMgq9s+hnrD7sss1Iui3sXPA7rrtkO@nongnu.org
X-Gm-Message-State: AOJu0Yyv819JyJ1ziyevyQ/Th0cJFsa0midoRW/4gUxer0RNxAEpYhS0
 bE1x8qcfEyoYoAjCPRPlczdXWBATgZUpA6P7Z6wpaTByTjybiYtnWo2xiKL96lw=
X-Gm-Gg: ASbGnctYUS6yHx3ruyv2T31DZnx6nKBIg4O8/s9Nk1t48gMLoEwm6n/k2q7LDKdcV0b
 Y99NpaAIHPWHYAW+mJUUM9e+nrNmIBXLFzmeqrJ1pTzksRn8HIrVdrFGy4Rtv4oH9EUX3AmRuhL
 23jCEuQt0BRgP0pRjaNoPXzM2jvKsv6RR8lNaLGsvkJlIwhxrJsYiE2KO4h1Rxfbt6aFzEtITOp
 4uctATSBZ2TxzaKnhwmSYuw0VZdYjHsDE8qIlePrZytGj7/
X-Google-Smtp-Source: AGHT+IHhredJ7Kkusy+tGIE0IwuBjJ8/nZr2qMMx1RKVolxYRMe6Wz1tOxQ5etLaAplLbHpp6+sN3w==
X-Received: by 2002:a05:600c:3ac3:b0:431:4b88:d407 with SMTP id
 5b1f17b1804b1-433ce410255mr66227435e9.5.1732375756689; 
 Sat, 23 Nov 2024 07:29:16 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-433cde114d5sm63238445e9.17.2024.11.23.07.29.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Nov 2024 07:29:15 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id D93295F7DF;
 Sat, 23 Nov 2024 15:29:14 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,  qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  "Michael S.
 Tsirkin"
 <mst@redhat.com>,  Daniel Henrique Barboza <danielhb413@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,  Harsh Prateek Bora
 <harshpb@linux.ibm.com>,  Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,  Halil Pasic
 <pasic@linux.ibm.com>,  Christian Borntraeger <borntraeger@linux.ibm.com>,
 qemu-ppc@nongnu.org,  Daniel Henrique Barboza
 <dbarboza@ventanamicro.com>,  Alexandre Iooss <erdnaxe@crans.org>,
 qemu-riscv@nongnu.org,  Thomas Huth <huth@tuxfamily.org>,  Bernhard
 Beschow <shentey@gmail.com>,  Eric Farman <farman@linux.ibm.com>,  Bin
 Meng <bmeng.cn@gmail.com>,  qemu-s390x@nongnu.org,  Niek Linnenbank
 <nieklinnenbank@gmail.com>,  qemu-arm@nongnu.org,  John Snow
 <jsnow@redhat.com>,  Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,  qemu-rust@nongnu.org,  Nicholas Piggin
 <npiggin@gmail.com>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,  Palmer
 Dabbelt <palmer@dabbelt.com>,  Markus Armbruster <armbru@redhat.com>,
 Weiwei Li <liwei1518@gmail.com>,  Mahmoud Mandour
 <ma.mandourr@gmail.com>,  Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>,  Liu Zhiwei
 <zhiwei_liu@linux.alibaba.com>,  Aurelien Jarno <aurelien@aurel32.net>,
 Ani Sinha <anisinha@redhat.com>,  Alistair Francis
 <alistair.francis@wdc.com>
Subject: Re: [PATCH 00/39] maintainer updates for -rc2 pre-PR
In-Reply-To: <eb3dd52c-b7bc-4c77-ad33-33e52d7ecef7@redhat.com> (Thomas Huth's
 message of "Fri, 22 Nov 2024 11:45:42 +0100")
References: <20241121165806.476008-1-alex.bennee@linaro.org>
 <CAFEAcA8KD4qxY18pJakSeziTioNYDQkd3VYcxYfq9y2KAON4Wg@mail.gmail.com>
 <875xoglcin.fsf@draig.linaro.org>
 <eb3dd52c-b7bc-4c77-ad33-33e52d7ecef7@redhat.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Sat, 23 Nov 2024 15:29:14 +0000
Message-ID: <87wmguoto5.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Thomas Huth <thuth@redhat.com> writes:

> On 21/11/2024 18.31, Alex Benn=C3=A9e wrote:
>> Peter Maydell <peter.maydell@linaro.org> writes:
>>=20
>>> On Thu, 21 Nov 2024 at 16:58, Alex Benn=C3=A9e <alex.bennee@linaro.org>=
 wrote:
>>>>
>>>> This is a mostly testing focused set of patches but a few bug fixes as
>>>> well. I plan to send the PR in on Monday. I can drop any patches that
>>>> are objected to but I think its pretty safe.
>>>>
>>>> Contains:
>>>>
>>>>    - Daniel's clean-up of functional tests
>>>>    - Another avocado->function conversion from Thomas
>>>>    - Update the tuxrun baseline images
>>>>    - Minor fix to the rust pl011 device
>>>>    - Documentation clarification on identity
>>>
>>> Should we really be updating the tuxrun baseline images
>>> in the middle of a release freeze period? Unless the old images
>>> are going to go away and break the tests, I think it would
>>> be better to stick with what we're currently testing.
>> Well the arm64be fixed a real problem and while I was at it I
>> figured
>> might as well keep the rest in sync. I have tested them so they all pass
>> (although I'm waiting on the CI run now).
>
> But there could be new intermittent problems in the new images ... so
> if we'd face such a problem, we would not know whether it is the image
> or whether it is QEMU. Thus maybe let's better keep the old versions
> for 9.2 (except for the arm64 patch that fixes a real problem), and
> use the new versions for 10.0 ?

Fair enough. Will drop the others for now.

>
>  Thomas

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

