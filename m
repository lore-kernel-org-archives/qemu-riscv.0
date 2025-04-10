Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1A35C3601E
	for <qemu-riscv@archiver.kernel.org>; Thu, 10 Apr 2025 21:18:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u2zHS-0004d0-PK; Thu, 10 Apr 2025 17:17:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1u2zHO-0004bx-Ti
 for qemu-riscv@nongnu.org; Thu, 10 Apr 2025 17:17:48 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1u2zHM-0004TQ-0l
 for qemu-riscv@nongnu.org; Thu, 10 Apr 2025 17:17:46 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-30155bbbed9so1075612a91.1
 for <qemu-riscv@nongnu.org>; Thu, 10 Apr 2025 14:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1744319862; x=1744924662; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=k27xR+gZgLXWoqf6VEdoeK1pkVf6pdMIpwfEk9UWv9g=;
 b=MMzphmnA0dqP30OmQmZ/TzrN2pePoPUI0iOUodJJSth8qAT6FdS9VN8WmlHKfyw8P9
 j/SFPUwAlek+HK6ggfFhlySfQq15I5GpfCKIbyux/kpeiWfGpNxFONaIfHio/TYOBN46
 9P7PuKmFZwvAhbkRp1gnhm41iW9rUi0Ddf04LoaS/CyOqNMp7ua46iuG1rnc0qVoGLO2
 aqEh8q+bSMpDXI6qlDTVY3bVatqy+mdwS1dA4Fgh1WThpDpZyG5CsGTicsd6qSZoYvCQ
 ph8BM15vxaVYHdcd6TfVt+5MFGWjbvOuaeREIhwBfiL1kf7si+u3PiCyUdsTUn6pQ99N
 LA0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744319862; x=1744924662;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=k27xR+gZgLXWoqf6VEdoeK1pkVf6pdMIpwfEk9UWv9g=;
 b=EJbvlNOOzVLZPoUTny997fzCBZiqa2eHfZTkTF8wl5/Ltec/EPCgF10OKbZk2zO7GZ
 ZGP03pAeyTGbvdd/TX40NKWbN/bYw4npnHgzsp4N5XFnEpRQ5y1yTSMG8RCCKGJIIE1h
 /vkH8cnx/98MSkwQwSKrKIdzxgUNKZArSig9/ENxrLkfohI1SUrGS92INm4+bXfrts+w
 O9PLbdG64uU70+gh2MDQW5JOBFUlg7gYPH82z3Q2l2fkTwUgDnDe3ADYH86i2w2bB2sT
 bIerhJ5ttiV0smBrJzlxoosXnLTUycuamcbxyHXW9h7/Wcc7WK8kbuicvO5T7bgswOFN
 lUQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjJWKc0PaL080PPbsM1cFuLATo4mQngrrNf8XR8cVjN8Lp2+x/UdyD8jXuzgq9j4t3+/yA2XGNOYhp@nongnu.org
X-Gm-Message-State: AOJu0YxwPgwbSZzN82dDeEBC5foOuysjAxyq8BzEa/F3/9Eo+Eii+fq9
 uyLC2pJFIKtjO1OKrp5fmQlXv+fsUZbBESiuK0RWtdK3dT2NOA0cEmBP2mwrB64=
X-Gm-Gg: ASbGnct93jIqqP45v88Noh0xhppo2JecLIJfHgGhCq5bPo84ZIg+YPDk7eqI8fd6QFW
 pjH+xPu2JRXdclJJW0Bz+mJhmq0mZTm199WFODh5mwJqb1DJtwhKpJCEwYiH4462OF2gzcHc53P
 TpLRDC9ndnTrnc3JF1eYNqnAx7xTMOL43945B9wVB0zn/0k/CZ80RBmAMJclErjU5xRVzDiBByl
 F5ODKm9CDoLtG3/uWmgIL5tHoF5qNF9E6GqfDIyyODaBwqzR5OWUV7blGrvanoJ7cxGWXKAZaPz
 lJsUavhgMX9Dy3+YENnRZKTipyUCh3j2dt8zvpOQQCooFNfRoHZ4Qw==
X-Google-Smtp-Source: AGHT+IGV9Kr4rUGiX4wwreN3zU1Uxyn4f5lAefTT7MLjbAvXrDAG3ctGkzG9xhc3nM2j1PGz5SNXeA==
X-Received: by 2002:a17:90a:e7ca:b0:2ff:6ac2:c5a6 with SMTP id
 98e67ed59e1d1-308237cdb4amr522205a91.31.1744319862237; 
 Thu, 10 Apr 2025 14:17:42 -0700 (PDT)
Received: from [192.168.1.87] ([38.39.164.180])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-306dd12b4d5sm4653646a91.25.2025.04.10.14.17.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Apr 2025 14:17:41 -0700 (PDT)
Message-ID: <83f44749-0eea-48f0-8aa5-3882132e30d0@linaro.org>
Date: Thu, 10 Apr 2025 14:17:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/10] Enable QEMU to run on browsers
Content-Language: en-US
To: Kohei Tokunaga <ktokunaga.mail@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, qemu-arm@nongnu.org
References: <cover.1744032780.git.ktokunaga.mail@gmail.com>
 <20250409192115.GA5528@fedora>
 <dc36c24e-dc4a-4c24-97b7-8b812441ffce@linaro.org>
 <CAEDrbUZ4mbCT-npk8Nha4fDd9a5PGguAxS_RD0wG96gpQRUp+g@mail.gmail.com>
 <CAEDrbUYM3aK5ErvF=+oV=q-NVLO0uzxbYjHzcxPGvTLp7yNtwA@mail.gmail.com>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <CAEDrbUYM3aK5ErvF=+oV=q-NVLO0uzxbYjHzcxPGvTLp7yNtwA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Hi Kohei,

first, congrats for this work!
It would be really nice to have this available upstream, starting with a 
modest TCI port, before having the tcg backend also.

On 4/10/25 06:13, Kohei Tokunaga wrote:
> Hi Philippe,
> 
>  >
>  > The biggest problem I'm seeing is we no longer support 64-bit guests on
>  > 32-bit hosts, and don't plan to revert that.
> 
> Yes, so the sixth patch ("[PATCH 06/10] include/exec: Allow using 64bit
> guest addresses on emscripten") should be considered as a temporary
> workaround, enabled only for Emsripten builds. It will be removed once
> wasm64 gains broader support and is adopted in the Wasm backend.
> 

Do you have recent information about wasm64? It seems to be something 
that has been discussed for several years, without really seeing any 
progress.

As Philippe said, we can't really revert that (it's now an assumption 
for our softmmu implementation, and would break code if we enabled it 
again now.)

That said, we can always have a first version supporting only 32 bits 
targets. And later, when wasm64 will be available, we can extend this to 
all remaining ones.

Regards,
Pierrick

