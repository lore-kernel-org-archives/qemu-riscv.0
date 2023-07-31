Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2037EC001DE
	for <qemu-riscv@archiver.kernel.org>; Mon, 31 Jul 2023 13:35:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qQT2w-0008QA-HS; Mon, 31 Jul 2023 09:34:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qQT2u-0008P3-0Q
 for qemu-riscv@nongnu.org; Mon, 31 Jul 2023 09:34:48 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qQT2s-0006fV-CD
 for qemu-riscv@nongnu.org; Mon, 31 Jul 2023 09:34:47 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3fe110de3b6so19562905e9.1
 for <qemu-riscv@nongnu.org>; Mon, 31 Jul 2023 06:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690810484; x=1691415284;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=r7Uopr2kgIXt3FFhLmTKhDjvzf6Kx+vE1vxShydLgeA=;
 b=JSMWrok2UQBCpyrAEWsgW2Hbs50BJw08em/KcVvuVIxLGOsz3E6LsKaRVfl9eB/5c8
 OYk6qRpnK8E1KRfNK4SJODWZBROQvKybthPZkluX9Ink2ajQQfe2WvkKvdL5l3pDDZgJ
 3YBUbTvZ2JLWTsm+8iM1/shQq5eA/YhnXNEs89YNYLlaGJSkbTax2mL6/JaNtUSrWLq1
 bf/CnUqSNCB1AmCSeZhwHHKXfx4Z682pJid4Z1eRR69oWc/O4BVRp6ChHp/xdSmI3x/G
 QV6GetEt3zxwdduQY8tuTHAX1XosnyVweHmxmF0w8437PgCGBe5ISQnFQ1uRZhmp978Q
 q9aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690810484; x=1691415284;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=r7Uopr2kgIXt3FFhLmTKhDjvzf6Kx+vE1vxShydLgeA=;
 b=FYGF+NjVY6c3JVs/y+B4dVXMrzjVluufWj3sp/DOxpNGr8Q23+ZDEtlL9fYr22kbLb
 lz4Jn8O01uOmbzOnsKN+1O2Y6EFVzjue8XRyWHMtPCotYxqdo5EN71AnXQAfHgOJwiQI
 lr9ayh8Uh0d2Hke4IXRBMhAEvlhoWRF56jpo+/8zalRzGDTZS6Il1PdRa0UHNTuhoroH
 4J8MCdgQsfMrxHFANA9dQebCtoRvAj8T8hxlU90oNVoNyc5dXhMw69ravrIFk9BMHJQn
 l0ISKaAvew/5GaSCUqEo6Bp3jNJe9xTSSG7XxzxNgVtKMceSVOQEOUUtSCEXo+y75y01
 4nKg==
X-Gm-Message-State: ABy/qLahGLJ3eOxaJH6+o5yuSxXiTzC9pixustiRihE1FJY1nNcj62Yu
 FgIFdUaHHuoxxvi5z+kotG/0TA==
X-Google-Smtp-Source: APBJJlHgjcjnmExY7U3tcpjy8F+fxzOvv6AKBpdUY6kpOips7eRhD3ysZnz85lMBaf7HYKmQhGRIeA==
X-Received: by 2002:a05:600c:11c9:b0:3f6:d90:3db with SMTP id
 b9-20020a05600c11c900b003f60d9003dbmr7656681wmi.3.1690810483742; 
 Mon, 31 Jul 2023 06:34:43 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.198.42])
 by smtp.gmail.com with ESMTPSA id
 e36-20020a5d5964000000b002fb60c7995esm13215285wri.8.2023.07.31.06.34.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Jul 2023 06:34:43 -0700 (PDT)
Message-ID: <eb9ef3c1-18f8-2209-8630-155e38dd4d12@linaro.org>
Date: Mon, 31 Jul 2023 15:34:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [RFC PATCH 02/24] gdbstub: Introduce GDBFeature structure
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Mahmoud Mandour
 <ma.mandourr@gmail.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Michael Rolnik
 <mrolnik@gmail.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Brian Cain <bcain@quicinc.com>, Song Gao <gaosong@loongson.cn>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Laurent Vivier
 <laurent@vivier.eu>, Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 Stafford Horne <shorne@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Nicholas Piggin <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org
References: <20230731084354.115015-1-akihiko.odaki@daynix.com>
 <20230731084354.115015-3-akihiko.odaki@daynix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230731084354.115015-3-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.101,
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

On 31/7/23 10:43, Akihiko Odaki wrote:
> Before this change, the information from a XML file was stored in an
> array that is not descriptive. Introduce a dedicated structure type to
> make it easier to understand and to extend with more fields.

Great idea!

> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   MAINTAINERS             |  2 +-
>   meson.build             |  2 +-
>   include/exec/gdbstub.h  |  9 ++++--
>   gdbstub/gdbstub.c       |  4 +--
>   stubs/gdbstub.c         |  6 ++--
>   scripts/feature_to_c.py | 44 ++++++++++++++++++++++++++
>   scripts/feature_to_c.sh | 69 -----------------------------------------
>   7 files changed, 58 insertions(+), 78 deletions(-)
>   create mode 100755 scripts/feature_to_c.py
>   delete mode 100644 scripts/feature_to_c.sh


> diff --git a/scripts/feature_to_c.py b/scripts/feature_to_c.py
> new file mode 100755
> index 0000000000..5a5b49367b
> --- /dev/null
> +++ b/scripts/feature_to_c.py
> @@ -0,0 +1,44 @@

SPDX-License-Identifier: GPL-2.0-or-later ?

> +#!/usr/bin/env python3
> +
> +import os, sys
> +
> +def writeliteral(indent, bytes):
> +    sys.stdout.write(' ' * indent)
> +    sys.stdout.write('"')
> +    quoted = True
> +
> +    for c in bytes:
> +        if not quoted:
> +            sys.stdout.write('\n')
> +            sys.stdout.write(' ' * indent)
> +            sys.stdout.write('"')
> +            quoted = True
> +
> +        if c == b'"'[0]:
> +            sys.stdout.write('\\"')
> +        elif c == b'\\'[0]:
> +            sys.stdout.write('\\\\')
> +        elif c == b'\n'[0]:
> +            sys.stdout.write('\\n"')
> +            quoted = False
> +        elif c >= 32 and c < 127:
> +            sys.stdout.write(c.to_bytes(1, 'big').decode())
> +        else:
> +            sys.stdout.write(f'\{c:03o}')
> +
> +    if quoted:
> +        sys.stdout.write('"')
> +
> +sys.stdout.write('#include "qemu/osdep.h"\n#include "exec/gdbstub.h"\n\nconst GDBFeature gdb_features[] = {\n')

Preferably split in 3 calls for readability, otherwise:

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


