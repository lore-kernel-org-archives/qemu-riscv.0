Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09E52C4707B
	for <qemu-riscv@archiver.kernel.org>; Thu, 11 Jan 2024 12:37:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rNuJT-0000U0-9C; Thu, 11 Jan 2024 07:37:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rNuJS-0000T8-BF
 for qemu-riscv@nongnu.org; Thu, 11 Jan 2024 07:37:34 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rNuJP-0007oh-AQ
 for qemu-riscv@nongnu.org; Thu, 11 Jan 2024 07:37:34 -0500
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-336c8ab0b20so4620897f8f.1
 for <qemu-riscv@nongnu.org>; Thu, 11 Jan 2024 04:37:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704976649; x=1705581449; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XjWVrWLBuhexZhNzqcbaaji/ra/r9VF4ONEQ8D3AprU=;
 b=yZPFGqiG0LI22OIAHxdFL4L3OmR4S2CrjvWBlKI+K/0v9jcsu3pm98uAQeacvUg2iO
 DH7debgPOPf0me68Mg8XrFdGbKQ7/nsMX1i2/Yz7by11zeO5Mb+H1tvkrVQnYY8uEJMq
 j7ST5pybWNG4ePsbLSBLXaEwVsrEDNe+Ysk31LNP72njLlHxDGSZCF80rzo74lSjd+4p
 kDnRjNNGDuGea4TgGPBj+KiNuWAmxic3QFG1LhK/ZbasZGpb8wH94i5isI15f+uLoVCK
 +9jVKJgkCzBNjukZSwL04lr3yBEQlZttXgM7A32shgJn04hWQFUrNzwz27/5I8EY7yoF
 sF8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704976649; x=1705581449;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=XjWVrWLBuhexZhNzqcbaaji/ra/r9VF4ONEQ8D3AprU=;
 b=WCN5+hKmSdpCEVjukeyS/15SMIkVvyPVgLHgaxElQQPF8JI2mxBIeJGV5+juJgNfS8
 38qfJzWeFb4YcWyrBZcgS4TfPRDUKAZYEhI1dCSIGNAtchU0fqMe9iAugSV2ECx/LScS
 c8juROloIyFN0WqDmfY9TY5vaUrH41m716a/T2TqCMDvnngY3urf5Sb70e6uyG5VmeBg
 Xht8piHdFkHu7audeUXJSw6Aaa5CFkf4D5g5mHQZ3dkRhijsZNwIYw5HeQ27nWSA6YRi
 tMwCjQmikrfLyHnpMBukIPFyfc0GzJLNC6o9/2kWttdbV2jRUGZZGG0Q4QqUKYuSokD9
 QdZQ==
X-Gm-Message-State: AOJu0YzSL4qXiyhZeoFbWYCku2b6obcl9uLW44xtHWqxoLh9sLykeUeG
 Zje5iVC3zXMOMXopz9U99i1Eq1bkOqIc0g==
X-Google-Smtp-Source: AGHT+IFZRj0uozQ33Kz3/zEEIWAh2I8FM6ycWyYCYl25J9YmcIK8POHwIM0XSklNJwKChNuv51rsAg==
X-Received: by 2002:a5d:4d84:0:b0:336:6dad:2c71 with SMTP id
 b4-20020a5d4d84000000b003366dad2c71mr672153wru.111.1704976649448; 
 Thu, 11 Jan 2024 04:37:29 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 l4-20020adffe84000000b003375cf3b17dsm1130163wrr.42.2024.01.11.04.37.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jan 2024 04:37:29 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 93E4C5F7AD;
 Thu, 11 Jan 2024 12:37:28 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org,  qemu-ppc@nongnu.org,  Richard Henderson
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
 Mandour <ma.mandourr@gmail.com>,  Thomas Huth <thuth@redhat.com>,  Liu
 Zhiwei <zhiwei_liu@linux.alibaba.com>,  Cleber Rosa <crosa@redhat.com>,
 kvm@vger.kernel.org,  Peter Maydell <peter.maydell@linaro.org>,  Wainer
 dos Santos Moschetta <wainersm@redhat.com>,  qemu-arm@nongnu.org,  Weiwei
 Li <liwei1518@gmail.com>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, John Snow <jsnow@redhat.com>,  Daniel Henrique Barboza
 <dbarboza@ventanamicro.com>,  Nicholas Piggin <npiggin@gmail.com>,  Palmer
 Dabbelt <palmer@dabbelt.com>,  Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>,  Ilya Leoshkevich <iii@linux.ibm.com>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,  "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>,  Eduardo Habkost <eduardo@habkost.net>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,  qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>
Subject: Re: [PATCH v2 00/43] testing and plugin updates for 9.0 (pre-PR)
In-Reply-To: <20240103173349.398526-1-alex.bennee@linaro.org> ("Alex
 =?utf-8?Q?Benn=C3=A9e=22's?=
 message of "Wed, 3 Jan 2024 17:33:06 +0000")
References: <20240103173349.398526-1-alex.bennee@linaro.org>
User-Agent: mu4e 1.11.27; emacs 29.1
Date: Thu, 11 Jan 2024 12:37:28 +0000
Message-ID: <87cyu8f3lj.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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

Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> This brings in the first batch of testing updates for the next
> release. The main bulk of these is Daniel and Thomas' cleanups of the
> qtest timeouts and allowing meson control them. There are a few minor
> tweaks I've made to some avocado and gitlab tests.
>
> The big update is support for reading register values in TCG plugins.
> After feedback from Akihiko I've left all the smarts to the plugin and
> made the interface a simple "all the registers" dump. There is a
> follow on patch to make the register code a little more efficient by
> checking disassembly. However we can leave the door open for future
> API enhancements if the translator ever learns to reliably know when
> registers might be touched.
>
> v2
> --
>
>  - Review feedback for register API
>  - readthedocs update
>  - add expectation docs for plugins
>
> The following still need review:
>
>   docs/devel: document some plugin assumptions
>   docs/devel: lift example and plugin API sections up
>   contrib/plugins: optimise the register value tracking
>   contrib/plugins: extend execlog to track register changes
>   contrib/plugins: fix imatch
>   plugins: add an API to read registers
>   gdbstub: expose api to find registers
>   readthodocs: fully specify a build environment
>   gitlab: include microblazeel in testing
>   tests/avocado: use snapshot=3Don in kvm_xen_guest

Ping for final review? I'd at least like to get the testing stuff
cleared out of my tree.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

