Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 991F0CCF9EE
	for <qemu-riscv@archiver.kernel.org>; Mon, 27 Oct 2025 11:21:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vDLHO-0002fu-0s; Mon, 27 Oct 2025 07:20:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDLH2-0001xK-D8
 for qemu-riscv@nongnu.org; Mon, 27 Oct 2025 07:20:35 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDLGu-0001Jn-NV
 for qemu-riscv@nongnu.org; Mon, 27 Oct 2025 07:20:28 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4710683a644so37617895e9.0
 for <qemu-riscv@nongnu.org>; Mon, 27 Oct 2025 04:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761564017; x=1762168817; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nO3lNScKiiWvqqEh/loTsdCNf697WClZjXeg3xz97Jo=;
 b=hKt9cxaF7FKuIdA0E1qDwd4IFdnoiqBrwHY3Q+UnB6AxT8o3/jfNuR846t5BHI1Mls
 rvaDfRvCFaMlMCdqWa+zp164jQDUUI6q5YoGCsTn3i+YM0UBcISBJcanPKrz/SzgrTx2
 CLkk4I5fdhPueL01xXVNE+pi3SCtA+orF9P7r6JKJqU9mKdLcmu534HmfltcP/VFKxBA
 Yf/fDdd7daK56PeOH3OsEevTkMR8fh6Z7CJugJb3yHXVwKKjy2yUI5FaUmQAIhXOnrOt
 6BSeklQrcknP1673VtBcReCH0eLvrOql/4xtLqCrruEB59MsWztFwaVpf8tsZFz/cQgI
 vtcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761564017; x=1762168817;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nO3lNScKiiWvqqEh/loTsdCNf697WClZjXeg3xz97Jo=;
 b=eJg2FqsgWkRfk07p+MmQ7FOVyRCgkuJGC5UORGHeYccspjNlcSGOGM8Bqu6iUgwMxj
 rCakDY/Nc0g4RwLQQFoalckN7sKm9kl/SKJ8HlqZ0+Ak4uFQydU8FIxjll+oc515rwTy
 7wBaUsELzPjZUOtCHFbqX8/KR/ziT7i2L+4d5jQC21p9s3yTh0OWLLBdxWl7/aLRqIbD
 ws0U/Sv4MrDJ9cTWU6Bjtdwo8jt7qvB+fYkdp6TiD92/YDXkoqak/ZVLvgPttvq/3b9q
 jHMIhEWfOKC7SFhSOOjtz6teXbSnPwGOkWjsHi5a43YkT5gg79Fb4QP/q31onksO9P+w
 OksQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWyvJCq9PH6ErRdUPJFbdvzumx8I+l0yjh0BQJCMXXuTO12DKAbc+cEOWrsYzBJ30tPHXVIVoeotKqR@nongnu.org
X-Gm-Message-State: AOJu0YzNbgnDrEx5Jic3eVuCIXBZMvIRs7Mb5lyhH9SdOOo1CPOMmq5a
 RROMtPBodhCva9wHbom0Do/X6/Ii7S85/JncdqDdCcerfGzWo+nIbYLfopDklfQEHAU=
X-Gm-Gg: ASbGnctxDhMKjb3cQwRKNex3q4n7A/KjQsLOmyIceZa5abOVDcD3vRAkonZFwyQS7IV
 yRq3sdUSXLfdF5CKH99DhMjjPlYEfSwW5WqE4cDXuK5KUOgt6u7Qwv/uZloXByU7iX8d6EXIzkC
 PZHHr/WmY6xvN8UbX8/psarlsxldXgPCRjqci/8ISSSJzHhictEXRc/n9kUEcENv3/4lMZs7NJV
 PRU1KiAP2z1FdbIdm+2q06Z5QR7VLVOq/5oqxp01HjjuxtrgoUoGToHTNmp059IkthHg4wcziG6
 e7SU8iM7JjJId5g4PazB/Jb5tP+No9vb5IwTs0C/09B+laSJvlHFakGQXDxhDoRDZNVrW5KR4Cz
 eo3+kB/OiX4K4YU0mA2FgnESp9fQgzL5yXyNbXqEvWXkxZ/si0j161yNeEH7ctOpC6aZGNzFQdu
 4oUL2XuJhfGbbk8LGVMYxrpWShLegD2SBBXNQh67aj1k27yvh2CfeeRj3tpCY=
X-Google-Smtp-Source: AGHT+IHEUnV1AykrggKoia9CZDo9Z7W6W1PE4O2InlfS6IlS1+bf7cSFHkw2t1kCvzUiRP7UaublFA==
X-Received: by 2002:a05:600d:42e2:b0:45d:e775:d8b8 with SMTP id
 5b1f17b1804b1-475d24088a3mr67734275e9.1.1761564016749; 
 Mon, 27 Oct 2025 04:20:16 -0700 (PDT)
Received: from [192.168.69.201] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475dcbacdc6sm65522715e9.0.2025.10.27.04.20.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Oct 2025 04:20:16 -0700 (PDT)
Message-ID: <2e6c67ff-e8d3-40b0-a648-f0ad755fa433@linaro.org>
Date: Mon, 27 Oct 2025 12:20:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/35] ci: clean-up remaining bits of armhf builds.
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Chinmay Rath <rathc@linux.ibm.com>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Helge Deller <deller@gmx.de>, Stafford Horne <shorne@gmail.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Eduardo Habkost
 <eduardo@habkost.net>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Laurent Vivier <laurent@vivier.eu>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Yoshinori Sato <yoshinori.sato@nifty.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Michael Rolnik <mrolnik@gmail.com>,
 Song Gao <gaosong@loongson.cn>, qemu-riscv@nongnu.org,
 Aleksandar Rikalo <arikalo@gmail.com>
References: <20251027110344.2289945-1-alex.bennee@linaro.org>
 <20251027110344.2289945-2-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251027110344.2289945-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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

On 27/10/25 12:03, Alex Bennée wrote:
> We no longer need to support 32 bit builds and we missed this while
> cleaning up.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   docs/devel/testing/ci-jobs.rst.inc            | 7 -------
>   scripts/ci/setup/ubuntu/build-environment.yml | 6 ------
>   2 files changed, 13 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


