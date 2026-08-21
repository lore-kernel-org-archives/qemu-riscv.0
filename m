Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9A26C5DF94
	for <qemu-riscv@archiver.kernel.org>; Fri, 21 Aug 2026 17:08:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wxSiN-0006Wp-OT; Fri, 21 Aug 2026 13:07:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wxSiM-0006Vw-8G
 for qemu-riscv@nongnu.org; Fri, 21 Aug 2026 13:07:34 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wxSiK-000627-HL
 for qemu-riscv@nongnu.org; Fri, 21 Aug 2026 13:07:33 -0400
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-8485b358552so448857b3a.2
 for <qemu-riscv@nongnu.org>; Fri, 21 Aug 2026 10:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787332051; x=1787936851; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=iwoY3fBtLl9fRUQCLLgjCX29uMCeiWJhu1A2Z6V/jpY=;
 b=mbW+cRXnbJGB61egv1/zXf9TTa5c4R7KAQoAvrfti9+nDWMFgfFaNUyZ3nL40+j2ZU
 UdrsPiFBUtwSZ88Fva7WneS+Tvrc6gwWwMulDEHdb+K19mEV6yHBE62OB6vo6KX76qGc
 KhfzVFpvZWm23b7JMsolaaG3T3pQsRj4EbzQMhYQE6SUAeeeCuSu616aHoASN5fxLEox
 N/Ks4Abelx9SUZmNxJfAUY8x50TTDfsJL1/0aJoFfeSV7p+NXQBtrc8OaDKGjQNA1pFo
 tcs2nn6vpWUGqpkSjAcmty0be1+HEddt/+vQlrlTroLjhLTBNByaco4UOZWHNbz2NyX2
 ze+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787332051; x=1787936851;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=iwoY3fBtLl9fRUQCLLgjCX29uMCeiWJhu1A2Z6V/jpY=;
 b=IC7isto8UtTQ3zOmnCUqRR+/pSVCa7H14giDrBrWBDn914yIzQsAhogYhbSPMD0oap
 0Rolx5QHmD54cOuZWY3MNgzaDT6N79+uGmUWSEvIxhXbZKG1TZIaf0oVkC1NIGh3EFFp
 NK0Z98oL+1GXITqadDmxglDnhz0UCrOuKChCYn+blv3ZjJKryRYNcZROBQvZATmbiZBE
 62XWhAkHj6uC56Rf7EKNKmKAma5hh3LOHLGjsi3SAQnv6ZFvQwo2JCM3chbLG7R1z1re
 z5ONGFsz5l2VZyuISTOUvXxiBtbkIYprdIXvXjECvG+23IJ+DbIsC9wTgWP9sbCBwumj
 EQhg==
X-Forwarded-Encrypted: i=1;
 AHgh+RrUaTlYNd72B9DXiMgzCuVRHWw4MhODDae9XY8W+FdpXVA/K/8j1wHpu21tgbnwm1536lZDAoQu07nU@nongnu.org
X-Gm-Message-State: AFuF++mbx75rGYZTfrxYORkdaIbUrCvrYXGDRu6m5rD5Zyicl/JvTCA1
 cXGDebo7pTg6k0Vk1OP7a1G/AfejA9E8N84bzmIyCg9K2YmmB1vE5Io+pP7SFz48TTM=
X-Gm-Gg: AR+sD127dhqsg1GnerpH/MeKdmJK5vTH2kU5rmUxvZnqJTDIH2o/9UhSSEMj0g68RH2
 xPahLXjUOlvoR3mmt57AD9+Cfp0Ynd7k6modjL2UyuKbBc01gYID3YmJ5FVwOlU6k7oW/e2OSv3
 rZqdjcrSouJrXWMegdBV2/2LAKmS9/X5jHG3+s9h/Ruofc/iQ6yK7Xx+tVCZ1/MXsbJgA/DPlgW
 3+v2ZD2MYKC9ewEBrkiP79Kzb5hM6yvDswHfY7QhHKO8lNCTyN9l3WXlb/2c6gfLV1eklCjeqKO
 s2KQRtp98SgZL3lUyEo/Bt+nlEUebTK7UIW4haYYYaiEh5Rc2aP7QLIdmQVmG3migAwhCRO5cvv
 6Qh1fJEWG+Q41PRK/0DtaWIxnVTQMbQLayJ7KDkhxZBnKIz0t7MLDedOBkH6VJOtciD7oFsdQta
 /U5OgxiDqCms5lZhnF4+D3awqXB1xkiVo6njRuGFgsA0eL+ErztbDa8BlrR+4wIvI8gVe3khBFZ
 h9N
X-Received: by 2002:a05:6a00:4c98:b0:84f:dc19:b77d with SMTP id
 d2e1a72fcca58-851fa011e87mr14038569b3a.12.1787332050732; 
 Fri, 21 Aug 2026 10:07:30 -0700 (PDT)
Received: from [172.20.6.168] ([108.174.179.84])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-851d366eebfsm3124052b3a.52.2026.08.21.10.07.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Aug 2026 10:07:30 -0700 (PDT)
Message-ID: <bde71c0c-ba94-4bd6-9ef9-e868fbd8562e@linaro.org>
Date: Fri, 21 Aug 2026 10:07:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/15] cpus: Add const-qualified CPU environment
 accessors
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org, =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?=
 <marcandre.lureau@redhat.com>, Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Zhao Liu <zhao1.liu@intel.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Eric Blake <eblake@redhat.com>
References: <20260821104950.32108-1-philmd@oss.qualcomm.com>
 <20260821104950.32108-3-philmd@oss.qualcomm.com>
 <3c9fe944-2b51-412c-bd30-26bf013cff46@oss.qualcomm.com>
 <22188776-edeb-44e6-b79d-0b877292221d@oss.qualcomm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <22188776-edeb-44e6-b79d-0b877292221d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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

On 8/21/26 08:51, Philippe Mathieu-Daudé wrote:
> No, this now fails distinctly on Ubuntu 24.04:
> 
> In file included from ../accel/tcg/tcg-runtime.c:26:
> ../accel/tcg/tcg-runtime.c: In function ‘helper_exit_atomic’:
> /home/runner/work/qemu/qemu/include/exec/cpu-common.h:100:31: error: expected expression 
> before ‘typeof’
>    100 | #define env_cpu(env) _Generic(typeof(*env), \
>        |                               ^~~~~~
> ../accel/tcg/tcg-runtime.c:135:26: note: in expansion of macro ‘env_cpu’
>    135 |     cpu_loop_exit_atomic(env_cpu(env), GETPC());
>        |                          ^~~~~~~

Yeah, this of course fails because _Generic wants an expression and typeof() is a type not 
an expression.

However, in this case less is more -- just don't dereference env:

#define env_cpu(env) _Generic(env, \
             CPUArchState *: \
                 (CPUState *)((void *)(env) - sizeof(CPUState)), \
             const CPUArchState *: \
                 (const CPUState *)((const void *)(env) - sizeof(CPUState)))

etc.  It's only top-level qualifiers that are stripped (so const int -> const), but 
qualified pointers aren't top level (so const int * and int * do not match).


r~

