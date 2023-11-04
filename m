Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AC00C4332F
	for <qemu-riscv@archiver.kernel.org>; Sat,  4 Nov 2023 09:14:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qzCjU-0005YN-6e; Sat, 04 Nov 2023 05:14:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qzCjS-0005Xo-O7
 for qemu-riscv@nongnu.org; Sat, 04 Nov 2023 05:14:18 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qzCjR-0006A4-6M
 for qemu-riscv@nongnu.org; Sat, 04 Nov 2023 05:14:18 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-32d849cc152so1837880f8f.1
 for <qemu-riscv@nongnu.org>; Sat, 04 Nov 2023 02:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699089255; x=1699694055; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EeHHICY5M0jlUkbfocY4HLQy7a4KCyh3W7Fxmxl6NCk=;
 b=w/dpnb3vKMhDrsjjvXrMUay/wNuDO96sfjUAFwtwjj6v8aloChqt5r1aSskqwFLoah
 AUc9E+HBbmRbeeQUBsgyexfBjULLEvAoA44F0/AEfvUsbsR568kqq8hOCuN87BMr+NwZ
 2SYzv3F6hvx2EkrrpVsLyGFwmUbN0XONE5V8UEvunWp6xMz810FeNbfJPRomnkS+UIqz
 wqQc6mTTc8dKI7qZjf30Fy5Gut3IfDppFNgGrOgj3mUFk0r8N4VNEpZ72Sh0ErYO08iQ
 IYUwY1nh3t5b0VlTPoF3AVJ+9eLJXxatk4qazihT2ZtUGRLMMHD+HvnXRpqFzbTyOVaK
 rhlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699089255; x=1699694055;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=EeHHICY5M0jlUkbfocY4HLQy7a4KCyh3W7Fxmxl6NCk=;
 b=U+lA2ML2YjI/7kO16KY8S/IS8a/I39vP8r2meTd2JW+0XwcMIudSXQ6IdePVq3G/pp
 AXAxqRwqMhQwhcmdz/rnBe87NQIs4Tqf5QFNa71+h8HtPeSkKGa5q28HAT+qhMM6qoav
 Q0BN6AfQc3C7USpDsYoc+A3jYuqAdsjlD12EAK8z79drHImM+8xWTVl6nCiLI7bb5kfY
 GmLGMS7qzS/dls/PvqoKzGzP/fM8n7iQHDhU4vRowLZXykamrxPoJvahdPv8mdKg1Q3X
 V/ImoByK0hWXz37zSNqdlnJgt8qNLrQlsFIqyW/V+VbnZnCcCl0BttzyLMoFv2zua0En
 +uJw==
X-Gm-Message-State: AOJu0YyIbHHx4C6Q4MsyfWuJGG3PkiKoOPcqXdU9EzoDRpyiw4F8MTUM
 EythIjKN1RqSe1FP1Uk3/Rf3KA==
X-Google-Smtp-Source: AGHT+IFTMs4xk6FOYo68OfhFwWVkfIQsq4SP3p6Fv+z9SckYiKMwEcyZ3/ov76mZ3x0vBQxG4G38ng==
X-Received: by 2002:adf:ec52:0:b0:32d:a405:b6b7 with SMTP id
 w18-20020adfec52000000b0032da405b6b7mr18887677wrn.32.1699089255179; 
 Sat, 04 Nov 2023 02:14:15 -0700 (PDT)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 f11-20020a5d664b000000b0032da75af3easm3902343wrw.80.2023.11.04.02.14.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Nov 2023 02:14:14 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 454BA5F796;
 Sat,  4 Nov 2023 09:14:14 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,  "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>,  Song Gao <gaosong@loongson.cn>,
 qemu-arm@nongnu.org,  =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?=
 <marcandre.lureau@redhat.com>,  Wainer dos Santos Moschetta
 <wainersm@redhat.com>,  Weiwei Li <liweiwei@iscas.ac.cn>,  Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>,  Ilya Leoshkevich
 <iii@linux.ibm.com>,  Daniel Henrique Barboza <danielhb413@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,  Paolo Bonzini
 <pbonzini@redhat.com>,  David Hildenbrand <david@redhat.com>,  Brian Cain
 <bcain@quicinc.com>,  qemu-ppc@nongnu.org,  Palmer Dabbelt
 <palmer@dabbelt.com>,  qemu-riscv@nongnu.org,  Eduardo Habkost
 <eduardo@habkost.net>,  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,  Alistair Francis <alistair.francis@wdc.com>,  Liu
 Zhiwei <zhiwei_liu@linux.alibaba.com>,  Cleber Rosa <crosa@redhat.com>,
 qemu-s390x@nongnu.org,  Laurent Vivier <laurent@vivier.eu>,  Yoshinori
 Sato <ysato@users.sourceforge.jp>,  Nicholas Piggin <npiggin@gmail.com>,
 Thomas Huth <thuth@redhat.com>,  John Snow <jsnow@redhat.com>,  Alexandre
 Iooss <erdnaxe@crans.org>,  =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?=
 <berrange@redhat.com>,  Mahmoud Mandour <ma.mandourr@gmail.com>,  Daniel
 Henrique Barboza <dbarboza@ventanamicro.com>,  Bin Meng
 <bin.meng@windriver.com>,  Beraldo Leal <bleal@redhat.com>,  Richard
 Henderson <richard.henderson@linaro.org>,  Michael Rolnik
 <mrolnik@gmail.com>,  Greg Manning <gmanning@rapitasystems.com>
Subject: Re: [PATCH 27/29] plugins: make test/example plugins work on windows
In-Reply-To: <20231103195956.1998255-28-alex.bennee@linaro.org> (UTF's message
 of "Fri, 3 Nov 2023 19:59:54 +0000 (13 hours, 12 minutes,
 33 seconds ago)")
References: <20231103195956.1998255-1-alex.bennee@linaro.org>
 <20231103195956.1998255-28-alex.bennee@linaro.org>
User-Agent: mu4e 1.11.24; emacs 29.1
Date: Sat, 04 Nov 2023 09:14:08 +0000
Message-ID: <877cmxc23j.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org> writes:

> From: Greg Manning <gmanning@rapitasystems.com>
>
> Generate a qemu_plugin_api.lib delay import lib on windows, for
> windows qemu plugins to link against.
>
> Implement an example dll load fail hook to link up the API functions
> correctly when a plugin is loaded on windows.
>
> Update the build scripts for the test and example plugins to use these
> things.
>
> Signed-off-by: Greg Manning <gmanning@rapitasystems.com>
> Acked-by: Alex Benn.©e <alex.bennee@linaro.org>
> Message-Id: <20231102172053.17692-3-gmanning@rapitasystems.com>
> Signed-off-by: Alex Benn.©e <alex.bennee@linaro.org>
> ---
>  configure                      |  3 +++
>  contrib/plugins/win32_linker.c | 34 ++++++++++++++++++++++++++++++++++
>  contrib/plugins/Makefile       | 20 ++++++++++++++++----
>  plugins/meson.build            | 17 +++++++++++++++++
>  tests/plugin/meson.build       | 14 +++++++++++---
>  5 files changed, 81 insertions(+), 7 deletions(-)
>  create mode 100644 contrib/plugins/win32_linker.c
>
>  
>  if get_option('plugins')
> +  if targetos == 'windows'
> +    # Generate a .lib file for plugins to link against.
> +    # First, create a .def file listing all the symbols a plugin should expect to have
> +    # available in qemu
> +    win32_plugin_def = configure_file(
> +      input: files('qemu-plugins.symbols'),
> +      output: 'qemu_plugin_api.def',
> +      capture: true,
> +      command: ['sed', '-e', '0,/^/s//EXPORTS/; s/[{};]//g', '@INPUT@'])
> +    # then use dlltool to assemble a delaylib.
> +    win32_qemu_plugin_api_lib = configure_file(
> +      input: win32_plugin_def,
> +      output: 'qemu_plugin_api.lib',
> +      command: ['dlltool', '--input-def', '@INPUT@',
> +                '--output-delaylib', '@OUTPUT@', '--dllname',
>  'qemu.exe']

We need to ensure we have dlltool available before enabling plugins for
windows otherwise we fail here. Also we need to update the windows
images to include it.

-- 
Alex Bennée
Virtualisation Tech Lead @ Linaro

