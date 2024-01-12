Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D80AEC4706C
	for <qemu-riscv@archiver.kernel.org>; Fri, 12 Jan 2024 16:48:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rOKgQ-0001Lt-ER; Fri, 12 Jan 2024 11:47:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rOKgL-0001HO-7H
 for qemu-riscv@nongnu.org; Fri, 12 Jan 2024 11:46:57 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rOKgH-0001ad-Qk
 for qemu-riscv@nongnu.org; Fri, 12 Jan 2024 11:46:56 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40e68ca8e27so2857445e9.1
 for <qemu-riscv@nongnu.org>; Fri, 12 Jan 2024 08:46:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705078012; x=1705682812; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hGITxN2Vs9jNvuz/cjIb7hgvqAzvNaA/iSybUEu8SrU=;
 b=mDFLSMVibbWB5kznUP0TdeNimajPPhMHLGseyOeQn7rQ6ARmlyOVioqpRdv7WkMkLD
 Zs7Gx6eYSJF9oZeW2/mQsEP3vn5WhT04sf6pUhspU1SFlEDrFb0Sk7RtoISH+i2Y0+9O
 yxUHWT9C7qpQ+7A+w/xQ2vuovsVMraKTT4WhZYC5q6F1yf0BmUjyyJAMvx8aJL/jaHpO
 9Cqo94Fthamn3bl5NE5pBNy16DRtw+tFwlx/1t77veaLAycQpbkdzYZYOL6cn87U2Vvj
 MXSf5o9FTfBG/0arKLVJlLZmWxoTQmW9z0vdYsVYMHXQP+4ahyIenIGTKRM590FThBcK
 LLpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705078012; x=1705682812;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=hGITxN2Vs9jNvuz/cjIb7hgvqAzvNaA/iSybUEu8SrU=;
 b=sBNx6Vua+TwQcqlTt28lEV4KYbEGES6rRIu9ollgW0XdAuv1EoXEpQSS53Q6G8DUpE
 DrsfIDdsgorQuAk9czIITuSfBHlyzuckewTkg9rO3V7+B2VL3PMdeztnrMQXL0PKPH7y
 WPalmyA64bdURBkj9E3CIGcHRPpYBErhNumV4rBOZS9PGi0px+xalsad4m+JP8TZCkGJ
 Mfm5ptb7zTQuhDUClAxBFXrkfg2d9njZSBonDOhUGk0KmZR8fWg7fXnXcFDT5RalG402
 wuXCjcoYDq+ZDIhQAHyHqBrqiR6Lxz7NKWMLl0MzYAU7/XYzo8mimmYpdAowPakB2GkG
 zgdw==
X-Gm-Message-State: AOJu0YyOt0Se5/deEFFFVjPZRaLjlgazioIAK6l8mapJ5GnQ2MHrjVcW
 oGy0IG0cwaUOYyacCj9Fnj6t1o7U89ueiA==
X-Google-Smtp-Source: AGHT+IFwELbfk61GZEWzU7kLkBC5Qu9uzr8sZPwcrTV/vTItwnOvjvYIp2u4iH81EOBpZI6D1/SN6A==
X-Received: by 2002:a7b:c44a:0:b0:40d:5b0d:cebe with SMTP id
 l10-20020a7bc44a000000b0040d5b0dcebemr880644wmi.39.1705078011910; 
 Fri, 12 Jan 2024 08:46:51 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 c11-20020a05600c0a4b00b0040d53588d94sm10357998wmq.46.2024.01.12.08.46.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jan 2024 08:46:51 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 3147A5F7A9;
 Fri, 12 Jan 2024 16:46:51 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org,  Peter Maydell <peter.maydell@linaro.org>,
 qemu-s390x@nongnu.org,  qemu-ppc@nongnu.org,  Richard Henderson
 <richard.henderson@linaro.org>,  Song Gao <gaosong@loongson.cn>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,  David
 Hildenbrand
 <david@redhat.com>,  Aurelien Jarno <aurelien@aurel32.net>,  Yoshinori
 Sato <ysato@users.sourceforge.jp>,  Yanan Wang <wangyanan55@huawei.com>,
 Bin Meng <bin.meng@windriver.com>,  Laurent Vivier <lvivier@redhat.com>,
 Michael Rolnik <mrolnik@gmail.com>,  Alexandre Iooss <erdnaxe@crans.org>,
 David Woodhouse <dwmw2@infradead.org>,  Laurent Vivier
 <laurent@vivier.eu>,  Paolo Bonzini <pbonzini@redhat.com>,  Brian Cain
 <bcain@quicinc.com>,  Daniel Henrique Barboza <danielhb413@gmail.com>,
 Beraldo Leal <bleal@redhat.com>,  Paul Durrant <paul@xen.org>,  Mahmoud
 Mandour <ma.mandourr@gmail.com>,  Liu Zhiwei
 <zhiwei_liu@linux.alibaba.com>,  Cleber Rosa <crosa@redhat.com>,
 kvm@vger.kernel.org,  Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-arm@nongnu.org,  Weiwei Li <liwei1518@gmail.com>,  Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  John Snow
 <jsnow@redhat.com>,  Daniel
 Henrique Barboza <dbarboza@ventanamicro.com>,  Nicholas Piggin
 <npiggin@gmail.com>,  Palmer Dabbelt <palmer@dabbelt.com>,  Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>,  Ilya Leoshkevich
 <iii@linux.ibm.com>,  =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,  Eduardo Habkost
 <eduardo@habkost.net>,  Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 qemu-riscv@nongnu.org,  Alistair Francis <alistair.francis@wdc.com>,
 Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH v2 12/43] qtest: bump boot-serial-test timeout to 3 minutes
In-Reply-To: <cf617223-0a0b-4d42-84a3-cd323ea4c421@redhat.com> (Thomas Huth's
 message of "Fri, 12 Jan 2024 16:13:16 +0100")
References: <20240103173349.398526-1-alex.bennee@linaro.org>
 <20240103173349.398526-13-alex.bennee@linaro.org>
 <cf617223-0a0b-4d42-84a3-cd323ea4c421@redhat.com>
User-Agent: mu4e 1.11.27; emacs 29.1
Date: Fri, 12 Jan 2024 16:46:51 +0000
Message-ID: <871qamwlc4.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
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

Thomas Huth <thuth@redhat.com> writes:

> On 03/01/2024 18.33, Alex Benn=C3=A9e wrote:
>> From: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>> The boot-serial-test takes about 1 + 1/2 minutes in a --enable-debug
>> build. Bumping to 3 minutes will give more headroom.
>> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>> Reviewed-by: Thomas Huth <thuth@redhat.com>
>> Message-ID: <20230717182859.707658-9-berrange@redhat.com>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> Message-Id: <20231215070357.10888-9-thuth@redhat.com>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>   tests/qtest/meson.build | 1 +
>>   1 file changed, 1 insertion(+)
>> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
>> index c7944e8dbe9..dc1e6da5c7b 100644
>> --- a/tests/qtest/meson.build
>> +++ b/tests/qtest/meson.build
>> @@ -6,6 +6,7 @@ slow_qtests =3D {
>>     'test-hmp' : 240,
>>     'pxe-test': 600,
>>     'prom-env-test': 360,
>> +  'boot-serial-test': 180,
>>   }
>>     qtests_generic =3D [
>
> 3 minutes was obviously not enough:
>
>  https://gitlab.com/qemu-project/qemu/-/jobs/5918818492#L4984
>
> And in older runs, we can see that the boot-serial-test might take
> longer than 180s when run with TCI :
>
>  https://gitlab.com/qemu-project/qemu/-/jobs/5890481086#L4772
>
> So I think we should bump the timeout to 240s here. Alex, are you
> going to respin your pull request? If so, could you modify your patch?
> Otherwise I can also send a new version of this patch here, just let
> me know.

I'm travelling now so its tricky to respin. If you could send a new
version that would be great.


>
>  Thomas

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

