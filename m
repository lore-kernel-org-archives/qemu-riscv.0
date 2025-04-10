Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9065C3601E
	for <qemu-riscv@archiver.kernel.org>; Thu, 10 Apr 2025 12:20:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u2qtS-0001sq-2r; Thu, 10 Apr 2025 08:20:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u2qtK-0001n3-Op
 for qemu-riscv@nongnu.org; Thu, 10 Apr 2025 08:20:22 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u2qtH-00086S-2R
 for qemu-riscv@nongnu.org; Thu, 10 Apr 2025 08:20:22 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-39bf44be22fso392853f8f.0
 for <qemu-riscv@nongnu.org>; Thu, 10 Apr 2025 05:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1744287617; x=1744892417; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NeXmhdndNS5u8yRWDs4JMcDjHxLBk6ghVK8IdZQ/fes=;
 b=lqcTgmBtR3oN/f7ebYO5hf8BcWca6vbk2vm8T1vruulz3cBpU1dpOIZsuIx/XfsfKS
 O/BHsUDeCU3dUT+7eG5GPqWuyQD1K6yAJwne6broLA4dO6JuocVsV7yngKRDklmLOMvt
 3W9CMYsyQkGTSm7LdvKelGQoxCK9vCG3GRqPNDIZ0anfhWg5GSJgC/+cP4apdZ5ZuwF7
 zewc2qdfTtwZZEC3wvvN6xNDBj10qOG20qDFWLaW8W3eibV5iC5fDldYhDsoNg2ayccb
 yV80C8vaIWrRQrEGzCUdcjYvYbia05n8lvgejySFWms4ZO43prTV/cWxYhKzwLVObetN
 nmXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744287617; x=1744892417;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NeXmhdndNS5u8yRWDs4JMcDjHxLBk6ghVK8IdZQ/fes=;
 b=M/UcGL0tRLhJ4QiJTALpCWYZ9UEkQ7ur+nsoe+ZG1fACFYpdwrQnxGJv4LvXzqxk9U
 xa010+vXAVs859WvcNlDJUFc6Bflw96yJnqTyLdo6A/AwoaP737VKSXLetl5JLJYlUqM
 vCZpSjNom312d8AelUvYIrfSkCI2Qd+Nq1fZMavkRJmVaR/ry6Q9IqmpgHbY1HgGNS2L
 A39IzdrkxBL408avWiOv6zR/8yIQia6FEe7Wy/mLbX15jMeZ8SkxsGTUuKvPNpRnWNHN
 7JVjKX4XHCAAH6cDl2lK6wqhHOqKqgM76XKIXAecbj+Ur7oWx4bVkDktJ6j5EfFBpryl
 +HNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKrCxtDHIm7x2HRMavntXDK2iPPWYvrN9o1TWUSPAALmFa5ocBr0kXDjOdJ2arfND5QB4DPJDLS3wy@nongnu.org
X-Gm-Message-State: AOJu0YxshHKUKQyWyiTzn90pDLaAQhwbTVp8eKnniGko4GDCTx7PnZRD
 /TGjwhrfKpHBQlf6jCT9DsyPjT/ESplWlp2RbHBTjNXmZlo5dNG/lxIhjMoM7VA=
X-Gm-Gg: ASbGncs06SCVsgGJ2PxcUB2jRHTJPH129H8RrATr/cv0VSQDEVI8suYDIujxE3NTwpR
 e9+cIwt1Kzkg/rUkxMhBREn2oMTUh86eUIbpiMWmMrCZJ/uFGCPKTEM4WhTC7HRgzhRlOeFQBdr
 3H7EgDz444YMwh31P1UFuwq1SEwAq9tABkGXsNytzICRCHAiM6Rf0tDaIqZ3ngouiMrHPCxtrvu
 qBEzfsAiovNfz4D+irxN9itG9BcizGMormXmgrNhYIJABRNWt7vle7WTPAIzWUfnzbKFScXhcHl
 YN11QGMRus3tk2QpTwvk5BcInFdjEH1ufVTRjg/wb5QfaMqR5wYblOjD3EjW0+uF4Ykfa+gUBaq
 pFkjCO+gLepxuglSF83yH5wcc
X-Google-Smtp-Source: AGHT+IH55o8dLQU5MWUF0LRk2DuEGnzgemlHs82ch0drklrhuC92n5F05vhxhB+eoJkqYoi47lNtLw==
X-Received: by 2002:a05:6000:2585:b0:39c:12ce:1054 with SMTP id
 ffacd0b85a97d-39d8f2735a4mr2219745f8f.8.1744287617072; 
 Thu, 10 Apr 2025 05:20:17 -0700 (PDT)
Received: from [192.168.69.238] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39d893fdf8fsm4583153f8f.91.2025.04.10.05.20.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Apr 2025 05:20:16 -0700 (PDT)
Message-ID: <dc36c24e-dc4a-4c24-97b7-8b812441ffce@linaro.org>
Date: Thu, 10 Apr 2025 14:20:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/10] Enable QEMU to run on browsers
To: Stefan Hajnoczi <stefanha@redhat.com>,
 Kohei Tokunaga <ktokunaga.mail@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
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
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250409192115.GA5528@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
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

On 9/4/25 21:21, Stefan Hajnoczi wrote:
> On Mon, Apr 07, 2025 at 11:45:51PM +0900, Kohei Tokunaga wrote:
>> This patch series enables QEMU's system emulator to run in a browser using
>> Emscripten.
>> It includes implementations and workarounds to address browser environment
>> limitations, as shown in the following.
> 
> I think it would be great to merge this even if there are limitations
> once code review comments have been addressed. Developing WebAssembly
> support in-tree is likely to allow this effort to develop further than
> if done in personal repos (and with significant efforts required to
> rebase the code periodically).
> 
>> # New TCG Backend for Browsers
>>
>> A new TCG backend translates IR instructions into Wasm instructions and runs
>> them using the browser's WebAssembly APIs (WebAssembly.Module and
>> WebAssembly.instantiate). To minimize compilation overhead and avoid hitting
>> the browser's limitation of the number of instances, this backend integrates
>> a forked TCI. TBs run on TCI by default, with frequently executed TBs
>> compiled into WebAssembly.
>>
>> # Workaround for Running 64-bit Guests
>>
>> The current implementation uses Wasm's 32-bit memory model, even though Wasm
>> supports 64-bit variables and instructions. This patch explores implementing
>> TCG 64-bit instructions while leveraging SoftMMU for address translation. To
>> enable 64-bit guest support in Wasm today, it was necessary to partially
>> revert recent changes that removed support for different pointer widths
>> between the host and guest (e.g., commits
>> a70af12addd9060fdf8f3dbd42b42e3072c3914f and
>> bf455ec50b6fea15b4d2493059365bf94c706273) when compiling with
>> Emscripten. While this serves as a temporary workaround, a long-term
>> solution could involve adopting Wasm's 64-bit memory model once it gains
>> broader support, as it is currently not widely adopted (e.g., unsupported by
>> Safari and libffi). Feedback and suggestions on this approach are welcome.

The biggest problem I'm seeing is we no longer support 64-bit guests on
32-bit hosts, and don't plan to revert that.

