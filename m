Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF1B6C4706C
	for <qemu-riscv@archiver.kernel.org>; Fri, 12 Jan 2024 13:56:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rOI17-0007uw-Ji; Fri, 12 Jan 2024 08:56:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rOI16-0007pa-9z
 for qemu-riscv@nongnu.org; Fri, 12 Jan 2024 08:56:12 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rOI13-0002Vc-T6
 for qemu-riscv@nongnu.org; Fri, 12 Jan 2024 08:56:12 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40e68d836bcso2141045e9.2
 for <qemu-riscv@nongnu.org>; Fri, 12 Jan 2024 05:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705067768; x=1705672568; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AOB8JnVE3SX6iRInWd6TCVKBhgs5LElYDobunt8K5us=;
 b=U6UhZZQFVWlPzrntxD9Uv9qGUJsOQA0g6f52Y6CaNyaiNW/Rdkm6TVHQ2r+cQ9RYxG
 74pSAhnholL78NVkIHBGj7Z2iQ6CIJn0Wy8JyQKZ9YnHBpjSt2uF0n/2OkjLZkfWg/cG
 R+JYODWmI/lG9FAjyq+OudX8TbWGmfSwoPhfFalixi33T81KV46WdjGLGhlsHnXqvcsF
 1WjOTqaTPeB4rfA4a3BAsirK6xnYuuqScJtmtpNf4XSIVoUFEx4/HXoGUNAitknkr6V9
 GcR6WyETQxLLkTsdf/+ckT3cAQn84MPaWZfxqvdWQczWPxpzTyxZ0QKYBkvqGMbydYMa
 o1/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705067768; x=1705672568;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=AOB8JnVE3SX6iRInWd6TCVKBhgs5LElYDobunt8K5us=;
 b=NCtuK3Pbd1NpEswAIDt283xlxNvvp9Du0AkeASytWO2TrnoQVOuIu6naphhUG0WBY+
 jLsEar1NlH8eQwxkfAH5r1B0Em8y+317MR3WBXZoXCFiSNzoDjML0C6bO7zqCVIRwKF4
 BrEEXDYfnU6zYs89sdfQYZcmUe18+8GivSJoLe76x+jZF/hbI57FW9xrEMAKNB/nX8AR
 3jeeW7tiAMRTnxfSOvOSU7FVM6PZEmA8s+xdFi3J2NlGv7lSfv/EFdXT4/VUjxMFLl1O
 l6qgiWjecZFz6FTrdc2gkO6q/AA+ddtd+0eDfXkYea/Z06O/e3OdGirRQFnLTpbSCdf2
 xBpQ==
X-Gm-Message-State: AOJu0YwY7D3fYRrUjG0ohtY18vUVpMGYkhJBV3jc4DWbQQBOeXGrbpn4
 SmQOb7Egq2ykasYud4SepslV0qAttoQB3A==
X-Google-Smtp-Source: AGHT+IEa5aOGGd6elo7lF7xI4ybVKMItLa9QTtJ7HJRr3ckjMycVA8LjLnWzE+WcGqMlocCBDGvr7A==
X-Received: by 2002:a05:600c:45ca:b0:40e:45be:3d92 with SMTP id
 s10-20020a05600c45ca00b0040e45be3d92mr877069wmo.106.1705067768203; 
 Fri, 12 Jan 2024 05:56:08 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 p10-20020a05600c358a00b0040e559e0ba7sm9611323wmq.26.2024.01.12.05.56.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jan 2024 05:56:07 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 7116D5F760;
 Fri, 12 Jan 2024 13:56:07 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Alistair Francis <alistair23@gmail.com>
Cc: qemu-devel@nongnu.org,  Palmer Dabbelt <palmer@dabbelt.com>,  Alistair
 Francis <alistair.francis@wdc.com>,  Bin Meng <bin.meng@windriver.com>,
 Weiwei Li <liwei1518@gmail.com>,  Daniel Henrique Barboza
 <dbarboza@ventanamicro.com>,  Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 qemu-riscv@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: Re: [PATCH v2 23/43] target/riscv: Remove misa_mxl validation
In-Reply-To: <CAKmqyKPCy9W-iYscHLjVvU=RfoSLURFgdki0qdzgNSkLKqutyg@mail.gmail.com>
 (Alistair Francis's message of "Fri, 12 Jan 2024 09:29:35 +1000")
References: <20240103173349.398526-1-alex.bennee@linaro.org>
 <20240103173349.398526-24-alex.bennee@linaro.org>
 <87sf37hlwo.fsf@draig.linaro.org>
 <CAKmqyKPCy9W-iYscHLjVvU=RfoSLURFgdki0qdzgNSkLKqutyg@mail.gmail.com>
User-Agent: mu4e 1.11.27; emacs 29.1
Date: Fri, 12 Jan 2024 13:56:07 +0000
Message-ID: <875xzyejuw.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Alistair Francis <alistair23@gmail.com> writes:

> On Tue, Jan 9, 2024 at 1:43=E2=80=AFAM Alex Benn=C3=A9e <alex.bennee@lina=
ro.org> wrote:
>>
>> Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:
>>
>> > From: Akihiko Odaki <akihiko.odaki@daynix.com>
>> >
>> > It is initialized with a simple assignment and there is little room for
>> > error. In fact, the validation is even more complex.
>> >
>> > Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>> > Acked-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
>> > Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>> > Acked-by: Alistair Francis <alistair.francis@wdc.com>
>> > Message-Id: <20231213-riscv-v7-2-a760156a337f@daynix.com>
>> > Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>
>> ping: along with this are the RiscV maintainers happy for me to take:
>>
>>   [PATCH v2 23/43] target/riscv: Remove misa_mxl validation
>>   [PATCH v2 24/43] target/riscv: Move misa_mxl_max to class
>>   [PATCH v2 25/43] target/riscv: Validate misa_mxl_max only once
>>
>> through my next pull request?
>
> Yep! Go for it

Sadly some of the recent changes that went through have created a merge
conflict.

Akihiko,

Any chance you could re-spin just the MISA_MXL patches?

>
> Alistair
>
>>
>> <snip>
>>
>> --
>> Alex Benn=C3=A9e
>> Virtualisation Tech Lead @ Linaro
>>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

