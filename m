Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4540C369A2
	for <qemu-riscv@archiver.kernel.org>; Wed,  9 Apr 2025 10:59:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u2T8x-00041l-MO; Wed, 09 Apr 2025 06:58:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u2T8q-0003qz-Mq
 for qemu-riscv@nongnu.org; Wed, 09 Apr 2025 06:58:51 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u2T8n-0000zP-9w
 for qemu-riscv@nongnu.org; Wed, 09 Apr 2025 06:58:48 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43cfdc2c8c9so38182075e9.2
 for <qemu-riscv@nongnu.org>; Wed, 09 Apr 2025 03:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1744196323; x=1744801123; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CM6GJHUe2MWUm47NGTkKsNCuck/2ZwQKCfLGM9K8E9I=;
 b=RrQidARPuliO1TZASvKHfCaBE2uuDvI3KMwkIdMEujU61OsaBJJ2Mj4t4kvhe5P4Yw
 g3hYQN7AttTdbxJrI4B1sj372IA7PkNv2azweeaSKDMqbHbrfYBrTsSk7T6sVo2RwLu5
 KlI0ch1Ob8SXWFMMX2nu6FG4njwFuTaziVroXQF7uTIGC5fCM1yflMRYg3P6BwmrhwUd
 m4j2yKzI5MmfZb1NTW2yDK8iY7ogmGb7vWVamteAe8jOSprJWnVuooKS5XosXRpx08RS
 w84o1wC2SC1rTIMLLpjzefoy40jxqKtuTmSDmC3V2asrmGFN8l7+ZKmxBt0jKkbDJ455
 RJ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744196323; x=1744801123;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CM6GJHUe2MWUm47NGTkKsNCuck/2ZwQKCfLGM9K8E9I=;
 b=p/TuC0FDj/vZRsfoFQVsLDcCMACKe7cYoovjDJxwdJydb7gleBO0q/L+Y6AgTZ2bjI
 cnLqCmu13D1ZRMpWgTJP6bfcXWA8oEFOejIHFf1fcFcJwOLuLAgiHxy0RKBN/8JMD/RA
 xDRp3N4RxtOO+MdJ3ZmcCW6pwRomut1K03LYZriJbNZcKiFbzutnon0fS7eRm0EwR9U/
 F2itxViIXnuYY20hn550lprhBNoJ5+hwJkRQFPcZDnrXuKHDsX1wV2vkTngX6HLCHwj6
 r3E1byaPA+sITkpo3GS8Xv06SOwfj0mW9Kgec7oaw9tYTfbmDEq8VXyqhbDuQ6qDD2wn
 /ktQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWD98lUegYl545UVDNOMfXtXi519MAeab+F3j0Jbt0XA+H+J0SgV1IJLKlgT2Z5ptLPggaWORND92lO@nongnu.org
X-Gm-Message-State: AOJu0YzOw1p55vyBtXKApQ1mP087t2/XpSmnaFt91gc30yc3Ajo0k0dt
 k4374uCw1mOYwcsfZNlWQqxPkElOxDA4LjtptBHhKFVklT0dB2XmhearlMYYXU8=
X-Gm-Gg: ASbGnculeBeat5k1d5D9/tC9dUoNOp3tVzlM9yvpDOQ2wVklKc9SHl1550UwkhNL+vw
 Ftz8bJJ80nNTPDHvajavl/DD5BZpVV4K15ABVlcydl7mErFU6JVX5GZaLHBbuKL05bI3bKIqQvY
 4ESpBoq/N/mToM2qYXpbTDt7FZMvrdZ9S5qNtSNQNj5TZNIMjmX3c7jGEzfevat3v/e1GIderzG
 PcWQcNke0sDGkxp45pQMarZVz+okkEv7mnKfLxGzAusXPZGLlKAdAZ/+tPVht/xkndcGG2rzfOM
 ySiRfxnjG05cfuEUttOWmchOVdxyZx8NFxmyKgTluLHk/oocqt/Scb3KvZ+WGZLzizrL/WvvKb1
 V0C/PX7wLsfU=
X-Google-Smtp-Source: AGHT+IFFox61GKWj46seevPvRx2oEhJvCGdxwcCkrJrk9NKaEewyCfvcNP2h6dvtzHSMfbAtBRt4Pg==
X-Received: by 2002:a05:6000:381:b0:39a:c80b:828a with SMTP id
 ffacd0b85a97d-39d87acd580mr2307449f8f.33.1744196323107; 
 Wed, 09 Apr 2025 03:58:43 -0700 (PDT)
Received: from [192.168.1.74] (88-187-86-199.subs.proxad.net. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39d893f0d15sm1294700f8f.67.2025.04.09.03.58.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Apr 2025 03:58:42 -0700 (PDT)
Message-ID: <069ad872-5012-4f2a-8ba6-e2a22ce2bb49@linaro.org>
Date: Wed, 9 Apr 2025 12:58:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/10] tcg: Add a TCG backend for WebAssembly
To: Kohei Tokunaga <ktokunaga.mail@gmail.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, qemu-arm@nongnu.org
References: <cover.1744032780.git.ktokunaga.mail@gmail.com>
 <24b5ff124d70043aff97dc30aa45f8a502676989.1744032780.git.ktokunaga.mail@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <24b5ff124d70043aff97dc30aa45f8a502676989.1744032780.git.ktokunaga.mail@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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

On 7/4/25 16:45, Kohei Tokunaga wrote:
> A TB consists of a wasmTBHeader followed by the data listed below. The
> wasmTBHeader contains pointers for each element:
> 
> - TCI code
> - Wasm code
> - Array of function indices imported into the Wasm instance
> - Counter tracking the number of TB executions
> - Pointer to the Wasm instance information
> 
> The Wasm backend (tcg/wasm32.c) and Wasm instances running on the same
> thread share information, such as CPUArchState, through a wasmContext
> structure. The Wasm backend defines tcg_qemu_tb_exec as a common entry point
> for TBs, similar to the TCI backend. tcg_qemu_tb_exec runs TBs on a forked
> TCI interpreter by default, while compiles and executes frequently executed
> TBs as Wasm.
> 
> The code generator (tcg/wasm32) receives TCG IR and generates both Wasm and
> TCI instructions. Since Wasm cannot directly jump to specific addresses,
> labels are implemented using Wasm control flow instructions. As shown in the
> pseudo-code below, a TB wraps instructions in a large loop, where codes are
> placed within if blocks separated by labels. Branching is handled by
> breaking from the current block and entering the target block.
> 
> loop
>    if
>      ... code after label1
>    end
>    if
>      ... code after label2
>    end
>    ...
> end
> 
> Additionally, the Wasm backend differs from other backends in several ways:
> 
> - goto_tb and goto_ptr return control to tcg_qemu_tb_exec which runs the
>    target TB
> - Helper function pointers are stored in an array in TB and imported into
>    the Wasm instance on execution
> - Wasm TBs lack prologue and epilogue. TBs are executed via tcg_qemu_tb_exec
> 
> Browsers cause out of memory error if too many Wasm instances are
> created. To prevent this, the Wasm backend tracks active instances using an
> array. When instantiating a new instance risks exceeding the limit, the
> backend removes older instances to avoid browser errors. These removed
> instances are re-instantiated when needed.
> 
> Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
> ---
>   include/accel/tcg/getpc.h        |    2 +-
>   include/tcg/helper-info.h        |    4 +-
>   include/tcg/tcg.h                |    2 +-
>   meson.build                      |    2 +
>   tcg/meson.build                  |    5 +
>   tcg/tcg.c                        |   26 +-
>   tcg/wasm32.c                     | 1260 +++++++++
>   tcg/wasm32.h                     |   39 +
>   tcg/wasm32/tcg-target-con-set.h  |   18 +
>   tcg/wasm32/tcg-target-con-str.h  |    8 +
>   tcg/wasm32/tcg-target-has.h      |  102 +
>   tcg/wasm32/tcg-target-mo.h       |   12 +
>   tcg/wasm32/tcg-target-opc.h.inc  |    4 +
>   tcg/wasm32/tcg-target-reg-bits.h |   12 +
>   tcg/wasm32/tcg-target.c.inc      | 4484 ++++++++++++++++++++++++++++++
>   tcg/wasm32/tcg-target.h          |   65 +
>   16 files changed, 6035 insertions(+), 10 deletions(-)

Eh TBH this is too much to review as a single patch.

Do you already have an idea how different the wasm64 implementation can
be?

