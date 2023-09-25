Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B0F1CE7A9D
	for <qemu-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 16:45:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qkohp-0008BH-Du; Mon, 25 Sep 2023 12:45:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qkohn-0008Ae-Og
 for qemu-riscv@nongnu.org; Mon, 25 Sep 2023 12:45:07 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qkohh-0005oH-Of
 for qemu-riscv@nongnu.org; Mon, 25 Sep 2023 12:45:07 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4053d53a1bfso56771595e9.1
 for <qemu-riscv@nongnu.org>; Mon, 25 Sep 2023 09:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695660300; x=1696265100; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fPIkwzhPt1ncv5Tdd9l0QJC7UJmsuiM/hxU7gX511UU=;
 b=rLjs5GLKMZGEzpnAnlA8sR72+mUan78UyIxjZ/HYtRFueaBhLib4Oga03RsInKHaf2
 fjDbTm/4MJfE0+hvZ0L5c00OyH53XonAGYp8vRNHwhfOAIXBbLtSXr0slQI77aJbyvDT
 a3gB6A3YKX2aZfXmez4HYXAOtJGlFA3VdCGKBKOKJPID+RWn1peRb6AmEKIqQuDtCCrd
 wC5GNhsYjWG7mIa9ZMzkds35mWkQImSdIj+2wDYCasvJHfGYZPO/HzttDpp9SsN001Qx
 RgFcAVKeiulQxHIMb+QZ4qfsFhdhboseNg4s0Vxv0RKKzkA7fNJMFdIi7w9rkcexXpQC
 1R8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695660300; x=1696265100;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=fPIkwzhPt1ncv5Tdd9l0QJC7UJmsuiM/hxU7gX511UU=;
 b=WzSx/UpwIoQ5ahU/HNGw310un3L/8pOJdecpLubryCDN+xVqi2F0AP8wUhNpM1Ogjb
 cQBDBgzfnclIRusu9k71t81tqd9JJhh5+TQHLh3c6hHiu/7z0zf9TxOnY7HIcyhJaF6k
 SwF9rDBGzAa8bF1m6fjiaMekQ9p0HHPQRmnOoiRdV+QXNtnu5Do7P9c1wutvHN6VqCbD
 pxIwpZnKlbUvEQ7qPEXbmXgW3BCtjpbOfidpkA4oy2IEtApR0uh5eBQwgENNT8c6w3aL
 BNMIsxSgZg0GoLVjoTPsjAC9iCgg9hUWzVTToQeYoQQkyNq55GSHhCduZLDk3DmyiHrC
 Mtxw==
X-Gm-Message-State: AOJu0YyiCM3M3+Zxxc+tCn8NQ5Bep3by3Fhk9rSfdJy1P57aVtVv61+W
 RT8kdhLggpavqtybdcu6wTeNGA==
X-Google-Smtp-Source: AGHT+IGvqsoujhj6gaKh4dH1+e6xuQ64Ou0OQJB4cHEcxp/P+2N9tmNWJ18n6nuSFZ6094TNB0QrIw==
X-Received: by 2002:a7b:ca53:0:b0:403:bb3:28c9 with SMTP id
 m19-20020a7bca53000000b004030bb328c9mr6084672wml.38.1695660299821; 
 Mon, 25 Sep 2023 09:44:59 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 q25-20020a7bce99000000b00405ee9dc69esm366355wmj.18.2023.09.25.09.44.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Sep 2023 09:44:59 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CEEA41FFBB;
 Mon, 25 Sep 2023 17:44:58 +0100 (BST)
References: <20230925144854.1872513-1-alex.bennee@linaro.org>
 <20230925144854.1872513-9-alex.bennee@linaro.org>
 <908ae9aa-11fc-8584-bd60-e269a1026e37@redhat.com>
User-agent: mu4e 1.11.20; emacs 29.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>, Marcin Juszkiewicz
 <marcin.juszkiewicz@linaro.org>, John Snow <jsnow@redhat.com>,
 libvir-list@redhat.com, =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,
 qemu-s390x@nongnu.org, Song Gao <gaosong@loongson.cn>, Daniel Henrique
 Barboza <danielhb413@gmail.com>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Bastian Koppelmann
 <kbastian@mail.uni-paderborn.de>, Liu Zhiwei
 <zhiwei_liu@linux.alibaba.com>, Weiwei Li <liweiwei@iscas.ac.cn>, Nicholas
 Piggin <npiggin@gmail.com>, Radoslaw Biernacki <rad@semihalf.com>,
 =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, Eduardo
 Habkost <eduardo@habkost.net>,
 Cleber Rosa <crosa@redhat.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Thomas Huth
 <thuth@redhat.com>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Bin Meng
 <bin.meng@windriver.com>, Alexandre Iooss <erdnaxe@crans.org>, Xiaojuan
 Yang <yangxiaojuan@loongson.cn>, qemu-ppc@nongnu.org, David Hildenbrand
 <david@redhat.com>, Yanan Wang <wangyanan55@huawei.com>, Peter Maydell
 <peter.maydell@linaro.org>, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Laurent Vivier <lvivier@redhat.com>, Yoshinori Sato
 <ysato@users.sourceforge.jp>, Leif Lindholm <quic_llindhol@quicinc.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: Re: [PATCH 08/31] configure: ensure dependency for cross-compile setup
Date: Mon, 25 Sep 2023 17:42:22 +0100
In-reply-to: <908ae9aa-11fc-8584-bd60-e269a1026e37@redhat.com>
Message-ID: <87cyy6rylx.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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


Paolo Bonzini <pbonzini@redhat.com> writes:

> On 9/25/23 16:48, Alex Benn=C3=A9e wrote:
>> If we update configure we should make sure we regenerate all the
>> compiler details. We should also ensure those details are upto date
>> before building the TCG tests.
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>   configure | 2 ++
>>   1 file changed, 2 insertions(+)
>> diff --git a/configure b/configure
>> index e83872571d..a95e0f5767 100755
>> --- a/configure
>> +++ b/configure
>> @@ -1788,6 +1788,8 @@ for target in $target_list; do
>>             echo "HOST_GDB_SUPPORTS_ARCH=3Dy" >> "$config_target_mak"
>>         fi
>>   +      echo "$config_target_mak: configure" >> Makefile.prereqs
>
> This in practice is not adding anything; if "configure" changes then
> Makefile's dependency on config-host.mak will trigger a configure
> rerun anyway.
>
> If you want to add it, you should also add it for other config-*.mak
> files.  However, I'd remove this line and just change
>
> -# 1. ensure config-host.mak is up-to-date
> +# 1. ensure config-host.mak is up-to-date.  All other config-*.mak
> +# files for subdirectories will be updated as well.

Peter ran into a mismatch between config-host.mak and
tests/tcg/foo/config-target.mak in his build system so it didn't get
picked up at one point.

>
> in the Makefile.
>
> Paolo


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

