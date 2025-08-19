Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED0CECA0EEB
	for <qemu-riscv@archiver.kernel.org>; Tue, 19 Aug 2025 22:33:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uoUsf-0004NJ-Jw; Tue, 19 Aug 2025 18:32:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uoUse-0004MH-7k
 for qemu-riscv@nongnu.org; Tue, 19 Aug 2025 18:32:36 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uoUsb-0006rC-AF
 for qemu-riscv@nongnu.org; Tue, 19 Aug 2025 18:32:35 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-24456f3f669so4344795ad.1
 for <qemu-riscv@nongnu.org>; Tue, 19 Aug 2025 15:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755642751; x=1756247551; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0UG8bHYH9qhHIRwV5i1DVVt3dqKwyCbwf3bPUxBc7V4=;
 b=Sr+z+4DNRelgDAZxhKgC0b46IkK6VOYDL3NpCizoNalzcq6HYL3T/odUB5ijwTxaPH
 8nOn2rEzT0yhaOBBFz/dMCbzFohdZP8jA19tXE9MgOJK2dlFEZzScYEvlNOvk/vtdHAM
 +JZMAFkn/agtj5gSYogoMHGd2ceFkJmrcUXmIluGnTR3ql/jkOAAF0b9x+j4z2WM7QPm
 IrEWMdjJ93UKHbRELEiBOiGNTejKA8rRHahm6ayBPoHU0hO46/RY6N2S7AxVo58Rxava
 YnuJ1A9rd8N4qrFCxIDHphVN09FzweN+Uf5yQ40AGXmin3ZiJlZCpdy/B1SmXWJ9NLw/
 jNJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755642751; x=1756247551;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0UG8bHYH9qhHIRwV5i1DVVt3dqKwyCbwf3bPUxBc7V4=;
 b=hfGJEhONqKxgw1NAucWNujv3XIRXjThg5/qAY4wgAWtHGnFPwrkM2cfHFYZQr1+Gdf
 sIGEe9U+QDYDm1T3IGAHir35rKjNdApMmE5T7zwLTP341221DA6DpGRF7i/P7b9wFjRm
 R90yXq3ztgaM7wnTCC3J3/sDn1ZmCO8xsWRpgOCcZDW+nDMni+a9j2PIlgtVT2lx9g6P
 PetVQI9GW6rmsFXsjD+wOol6wkg9qufF2dGiD6VdjNPUBnPRBIAp1k3npm59sLu1Yj5w
 6N8Naob16R6+d6V6QwxQQIxRxgbsgbuOUeI6ZiLjtEPfJQBp9U3m2TQIPtVvAakoOEeO
 fMHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6pe1z6aZ2Lk3obC+4aCIU5LV1dlURWV03iyLcJ+xnPPl+NTeJbINliX00WQl8diTmTyVdaF2KYDUa@nongnu.org
X-Gm-Message-State: AOJu0Yx3t6MUGYmlBYxKGLF9vMouT2YFeaQIXCQxKYZ7e+WmMCtvXzl4
 3wsXdhsQBND1V4KrNvF4Z2OwBFzeW7wydUBKKm0VA6632+7Zb5QT+c1z4YOSlBCRHxY=
X-Gm-Gg: ASbGncv2v6Ln5luuYAG6cIcBBWb1D7rc5p1e/voXse7uOTwIZ2UIxfN7OESU+vzo3uh
 QEUCptymKfr8lzR/leftrLYzChISU574sQYp/c4uyd4rTeAUVb6oFrYlb6XrlD/Gb/j51d/2bro
 NYTLivobR6kzDwBBfsxaF/lZXIGy0r+WD9c4VltknOsioEk2UVtylKsbDhwICSUODzXqCZsdZPf
 w5NlAEQsJ8qqs1qbVJ05dvfx7yM3LORuZQ11O2BrMUk+DIlCwTKaIQYwkD3aKhluq58+4JhX9w7
 QiU6t95PdEvUjc1wUEDn8VlLyQlpga8AVNLhgLolqGHpfdd05BnCXcCgcA9gFCA6hmjGnTdkwxe
 Jt/lCg/2jfUlGEFfM19gIqjJy+gLU/k42rg==
X-Google-Smtp-Source: AGHT+IHp8VTKG9Vpn6FAHdmy+mSnJ5GgTEl0qI+uay+ssgl1frq/JCQo7z7Y3bdVkLlZC9I8Uw3G3Q==
X-Received: by 2002:a17:903:41c2:b0:23f:fa47:f933 with SMTP id
 d9443c01a7336-245e0930050mr46957165ad.8.1755642751182; 
 Tue, 19 Aug 2025 15:32:31 -0700 (PDT)
Received: from [10.0.0.90] ([120.159.20.238]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-324e251e891sm233987a91.5.2025.08.19.15.32.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Aug 2025 15:32:30 -0700 (PDT)
Message-ID: <bcdcb0b0-3427-4c4e-b3cf-32b53b5e6c4e@linaro.org>
Date: Wed, 20 Aug 2025 08:32:21 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/35] tcg/wasm: Add bswap instructions
To: Kohei Tokunaga <ktokunaga.mail@gmail.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 WANG Xuerui <git@xen0n.name>, Aurelien Jarno <aurelien@aurel32.net>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <arikalo@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Stefan Weil <sw@weilnetz.de>,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
References: <cover.1755623521.git.ktokunaga.mail@gmail.com>
 <ceb5f4b3fb6a4c0f6c647a7e1b39c801144ac6af.1755623522.git.ktokunaga.mail@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <ceb5f4b3fb6a4c0f6c647a7e1b39c801144ac6af.1755623522.git.ktokunaga.mail@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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

On 8/20/25 04:21, Kohei Tokunaga wrote:
> +static void tcg_wasm_out_bswap64(
> +    TCGContext *s, TCGReg dest, TCGReg src)
> +{
> +    tcg_wasm_out_op_idx(s, OPC_GLOBAL_GET, REG_IDX(src));
> +    tcg_wasm_out_op_const(s, OPC_I64_CONST, 32);
> +    tcg_wasm_out_op(s, OPC_I64_ROTR);
> +    tcg_wasm_out_op_idx(s, OPC_LOCAL_SET, TMP64_LOCAL_0_IDX);
> +
> +    tcg_wasm_out_op_idx(s, OPC_LOCAL_GET, TMP64_LOCAL_0_IDX);
> +    tcg_wasm_out_op_const(s, OPC_I64_CONST, 0xff000000ff000000);
> +    tcg_wasm_out_op(s, OPC_I64_AND);
> +    tcg_wasm_out_op_const(s, OPC_I64_CONST, 24);
> +    tcg_wasm_out_op(s, OPC_I64_SHR_U);
> +
> +    tcg_wasm_out_op_idx(s, OPC_LOCAL_GET, TMP64_LOCAL_0_IDX);
> +    tcg_wasm_out_op_const(s, OPC_I64_CONST, 0x00ff000000ff0000);
> +    tcg_wasm_out_op(s, OPC_I64_AND);
> +    tcg_wasm_out_op_const(s, OPC_I64_CONST, 8);
> +    tcg_wasm_out_op(s, OPC_I64_SHR_U);
> +
> +    tcg_wasm_out_op(s, OPC_I64_OR);
> +
> +    tcg_wasm_out_op_idx(s, OPC_LOCAL_GET, TMP64_LOCAL_0_IDX);
> +    tcg_wasm_out_op_const(s, OPC_I64_CONST, 0x0000ff000000ff00);
> +    tcg_wasm_out_op(s, OPC_I64_AND);
> +    tcg_wasm_out_op_const(s, OPC_I64_CONST, 8);
> +    tcg_wasm_out_op(s, OPC_I64_SHL);
> +
> +    tcg_wasm_out_op_idx(s, OPC_LOCAL_GET, TMP64_LOCAL_0_IDX);
> +    tcg_wasm_out_op_const(s, OPC_I64_CONST, 0x000000ff000000ff);
> +    tcg_wasm_out_op(s, OPC_I64_AND);
> +    tcg_wasm_out_op_const(s, OPC_I64_CONST, 24);
> +    tcg_wasm_out_op(s, OPC_I64_SHL);
> +
> +    tcg_wasm_out_op(s, OPC_I64_OR);
> +
> +    tcg_wasm_out_op(s, OPC_I64_OR);
> +    tcg_wasm_out_op_idx(s, OPC_GLOBAL_SET, REG_IDX(dest));
> +}

Is this any better than the default expansion?


r~

