Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37B0DC98302
	for <qemu-riscv@archiver.kernel.org>; Tue, 22 Sep 2026 18:48:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x95X7-0007bZ-Fx; Tue, 22 Sep 2026 14:48:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x95Ws-0007Su-A7
 for qemu-riscv@nongnu.org; Tue, 22 Sep 2026 14:47:49 -0400
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x95Wp-0006xA-KK
 for qemu-riscv@nongnu.org; Tue, 22 Sep 2026 14:47:46 -0400
Received: by mail-pj2-x11.google.com with SMTP id
 98e67ed59e1d1-39b5b07ec78so134033a91.3
 for <qemu-riscv@nongnu.org>; Tue, 22 Sep 2026 11:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1790102862; x=1790707662; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=78JNZklME0O/1rA8EQgIG2udVfDdlIk7cp3F/kt0sSs=;
 b=aNjJz81pOi+C6dNGvsZy5fO9a6d2T8jYVoWDgSSeeJ6MsfDO8pOcJbcUCQIxj3duRY
 /o0aqaxl4hjRTXF2izHH5lhoS1XU7+mWqTp3ENFNo3SnTpEsbmwqL8ubob346mzYHnKT
 QndyWI1eiSNLkmLa1RAHgWJyxpR4TgGMdfWrrHtRvAPgSWtMtDpbBGi6tCMWtF4VqiJE
 qgN9bZugfVf9/hhI6C/nsqR5ZG+8E0KWx1wLrd4f0gJukZedxpLERULMUHcacc6/OskH
 bzSdTWathhY5vvu2/NcxR+nq6MvI3bqmOmoQgDV4ge2t4dZLstIcuIyhAkdKe3V493CB
 SPoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790102862; x=1790707662;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=78JNZklME0O/1rA8EQgIG2udVfDdlIk7cp3F/kt0sSs=;
 b=fA5ZxGXsDyLpRu5LTSEtj6miGKkBxUGdI6uXsIE2OZqX1y6SW1lBGuhxm9Z84PUfoY
 KfZdAl9aABu1/tf8pfvTCy5eginVShpPS2TZi363fM3KFWkq4snWvlAd5gHTF2YTb+vo
 7oeRB9bwYrT6cgUfh7y9WU2QyTV8SlX2YKE3bqVUz/zDkVf1hbxKyjLtpCS7ULw8NruY
 0NMhTHF7G6kZSSiWQxgdy8hoJmaLkEPfbrM5BgSm/MG/V7JCBySMRWdQdqq3ou2AyBV4
 GBNyz8t3Syl4nNWeNnkKCmbt4dFwyiJ+cR7J0vcgAgSMhfJyN2whJt+92PpEF5kOc22g
 IZBA==
X-Gm-Message-State: AFuF++lI6i2emSP08IjfdxO7+2wwPWUslefcGb1HXsfB5A1zBXbeXAEN
 i7qoNnCcaB6T+LP48DBgOBIMDrnqiSCPoDSooTBx3BxWtyC0QBIknOIK08N7iBdh0Ec=
X-Gm-Gg: AYBFou2IERcPiJE8glEQ1L554ybnZio11IPwqHlLKsQSJQjgZz1PWV6rYUFv1x3i9ql
 4ibC+R6ZHw4Kt4IucaHA5+b/817DL5+m0kql6JT8uFg/JyQzcmwKJJ7BrSHab/RuTsrlst9z7HQ
 lj+moz5NAeB5htBrX4vgpEZqVW6ESzJ80EqwgMaEmhhtOedd2L6JJ/mYTh8uewEvTj//tm4rk8G
 iK91L/rZ30X7lXWCVLJsc29fFaCw04a0hjFls24gyPoUBUJB0u7+oouW9rDfFyGFq5BoXGKgL8F
 jZ0tPXuhf/JyCIYkUtertdTp+MTxoaPAFqvo9n5QQkiLYgxA9wZbqK7MZe8a5gZD+NY6SGPobXn
 9sniIZq4Uqo/nzOdvfTfmdBPftDlOTsfbeNYlvlDlh6VCy8lKdKLaPmqNiTCVIOfKbpVJOJGRRh
 K+5C9jX1QW26iroEWkeUHQexWe4Z+AV0x0wVOQnXKvDrGVkYx1zPM2Hljr2PADRlbdDSGOKIOiJ
 PuSTuy99enZ3//zQ+zASGPTL8Wg+Mqoh5UWVvxJ
X-Received: by 2002:a17:90b:50ce:b0:39d:ecb6:8d40 with SMTP id
 98e67ed59e1d1-3a07e4e41e3mr272243a91.4.1790102861933; 
 Tue, 22 Sep 2026 11:47:41 -0700 (PDT)
Received: from [192.168.0.4] (174-21-68-150.tukw.qwest.net. [174.21.68.150])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3a07dc2923fsm694264a91.11.2026.09.22.11.47.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Sep 2026 11:47:41 -0700 (PDT)
Message-ID: <a067cab4-0e09-47e4-bdd0-b3b09d78cde7@linaro.org>
Date: Tue, 22 Sep 2026 11:47:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/17] target/arm: Read halt state atomically in
 arm_cpu_has_work()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org
References: <20260922164936.15189-1-philmd@oss.qualcomm.com>
 <20260922164936.15189-10-philmd@oss.qualcomm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260922164936.15189-10-philmd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:39::11;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj2-x11.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

On 9/22/26 09:49, Philippe Mathieu-Daudé wrote:
> arm_cpu_has_work() runs without the BQL held. Use atomic reads for
> halt_reason and event_register to safely inspect state updated by other
> CPU contexts.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@oss.qualcomm.com>
> ---
>   target/arm/cpu.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

