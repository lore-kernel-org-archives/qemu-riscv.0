Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FD91CCD184
	for <qemu-riscv@archiver.kernel.org>; Tue, 14 Oct 2025 19:44:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v8kwN-0006V8-NO; Tue, 14 Oct 2025 15:44:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v8kwJ-0006Uj-IX
 for qemu-riscv@nongnu.org; Tue, 14 Oct 2025 15:44:09 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v8kwG-0002Gl-0f
 for qemu-riscv@nongnu.org; Tue, 14 Oct 2025 15:44:07 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-46e33b260b9so46447685e9.2
 for <qemu-riscv@nongnu.org>; Tue, 14 Oct 2025 12:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760471040; x=1761075840; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SOeurXAkir1Ea8+e0dMMj0YaDS6oMfJTkfGBcNEy7fA=;
 b=nCw0hyQqcXmkj2rNxGaKcV4GjEGSUw6vvbnMWnjXWKi41YjpJ3yLbWMx9DQiYZjVvu
 fVg/1zCZCZojn0g6mC4MQIhjMscQgtcGM2iMWMIuNXb0XIADnNEXzvoT4cvocWXMmOsf
 Iaa7dxO6aBsrb2HIK1IchLenpKEMy+9toLABoD1uweD/qWXMKHUIyadUeha4sTz76DRc
 vVjkb7qhFUh4zmQOWvkD0IdhAjAb8QJn0RxFrWTQa4FlojF4xiRCW6bg3LSVF2eIFZ8C
 x6iI1RldwquAlJ0UAy/HzJjVdje1Bi9rc46cLsPW0DJ8/zzHjuFdUG4+QI8xmSBCL734
 XE+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760471040; x=1761075840;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SOeurXAkir1Ea8+e0dMMj0YaDS6oMfJTkfGBcNEy7fA=;
 b=TqK3W78Px9qXevZnAEbJbhM8PCqCeosY2YTK4UtU0TjFQ8D2s+57zm2xfCpeX3+wtj
 Rr2YCG5wglGFkESVoD9CuIsNwEwkLnFshOaDK6TE1mvscP6B820VFZ2oKYOPPiop+tlc
 CAch2EAgw4vPX0bQCsywSTcqvwLlHJeSbGyU4DLth84xgtWhngjGTb5TlLu+oK/A4dSa
 nQh5mtYL7gvNjMgrFBc1KTJK8TY6Pp+uiU7a+Csjr4kaSThR0Rl2VB0P1taARX5wkr5D
 zVUWR4Ju4tJ5nroL3sQNQlJ+xNW2iT5dp4QIfp4Iovu4TihmpbcAsQn7oKEYE2v1xWKZ
 G/vA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmVdoD+OXGzVtd4rsSy6RIjHP3GYLNoYT37x6xx3HKY2fay9RQysku2tOCyLg39I49d6wE1EJMl1Cf@nongnu.org
X-Gm-Message-State: AOJu0YwqhAfQ/yi3XS4ZclRqqfaVER2+aWt7p94RmBQYM/5vDredixof
 ShqYze53uG5C/3272Qq8WQ7uf7WJaPLvbUZxzkswF1Qsjd4bO7BgZXd4qxn0xhWneA0=
X-Gm-Gg: ASbGncsiGhPH0LDUUgbnyk9N3bdzo4rlimHiG/cGUiKjCrMbn9oBpDhfbvUzL2NYs4J
 nW0TuvYvgQJvwqz+VZW4c8wNH7kkHwqbwfC8m/GmgFoOKZpZVfpjkuEyzmISmCPP24AfiF2KGWW
 6zQ1Y1zTa2O8NefjIbB7cQ7E48Gnq2L8KZlVkDkAz2tzXu2wZ3qMQHk6G6XE4gSb0tnkZpRqbfv
 0xG674bFfB/15pITNhIWZj6tMUfxnME1i0tyDu7POyfMLMWHGAztFmL5g1mbFm+QtUAd/97+iik
 oJdXjWt1/aZ+n1kgd3N4nX+1fmz9DmbEmJAYX3au8PDmzW3zjRixdooW8FoATu1LAt9ePw8ayE6
 SdVh/GvtYpN4o5sWEf50Jlzb2ThpJpn+LplR46SzMwLjFu1o/aCg+mQl1K5Z2Smn+DWH5Vb+5Zp
 pLxbhZnv9N/q3v
X-Google-Smtp-Source: AGHT+IH0KXm/oOSnLKkVen6OrIIr+1/i3BdcWdM8D6/ziR1qguuFgTqujZCmgt8AmNHNaH8kIiMGyA==
X-Received: by 2002:a05:600c:1e87:b0:46e:4b89:13d9 with SMTP id
 5b1f17b1804b1-46fa9a22e67mr180653425e9.0.1760471040474; 
 Tue, 14 Oct 2025 12:44:00 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fc57530b3sm139481005e9.12.2025.10.14.12.43.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Oct 2025 12:43:59 -0700 (PDT)
Message-ID: <0e246345-6296-4df2-8f1e-4c8beb9532f0@linaro.org>
Date: Tue, 14 Oct 2025 21:43:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/13] target/riscv: Centralize MO_TE uses in a pair of
 helpers
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Christoph Muellner <christoph.muellner@vrull.eu>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Anton Johansson <anjo@rev.ng>,
 Richard Henderson <richard.henderson@linaro.org>,
 Valentin Haudiquet <valentin.haudiquet@canonical.com>,
 Weiwei Li <liwei1518@gmail.com>, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
References: <20251010155045.78220-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251010155045.78220-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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

Hi Alistair,

On 10/10/25 17:50, Philippe Mathieu-Daudé wrote:
> In preparation of having RISC-V cores changing their endianness
> at runtime, centralize the MO_TE uses to a pair of methods.
> 
> Except the 128-bit LD/ST change (first patch), no further
> functional changes intended.
> 
> Philippe Mathieu-Daudé (13):
>    target/riscv: Really use little endianness for 128-bit loads/stores

Are you OK to queue reviewed patches 2-13 (independent of patch #1)?

>    target/riscv: Explode MO_TExx -> MO_TE | MO_xx
>    target/riscv: Conceal MO_TE within gen_amo()
>    target/riscv: Conceal MO_TE within gen_inc()
>    target/riscv: Conceal MO_TE within gen_load() / gen_store()
>    target/riscv: Conceal MO_TE within gen_load_idx() / gen_store_idx()
>    target/riscv: Conceal MO_TE within gen_fload_idx() / gen_fstore_idx()
>    target/riscv: Conceal MO_TE within gen_storepair_tl()
>    target/riscv: Conceal MO_TE within gen_cmpxchg*()
>    target/riscv: Conceal MO_TE|MO_ALIGN within gen_lr() / gen_sc()
>    target/riscv: Factor MemOp variable out when MO_TE is set
>    target/riscv: Introduce mo_endian() helper
>    target/riscv: Introduce mo_endian_env() helper
Regards,
Phil.

