Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F52AC0218D
	for <qemu-riscv@archiver.kernel.org>; Sun, 26 Jan 2025 20:33:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tc9Jc-00020A-IU; Sun, 26 Jan 2025 15:33:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tc9JY-0001yy-Tl
 for qemu-riscv@nongnu.org; Sun, 26 Jan 2025 15:33:05 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tc9JW-0000sU-Uj
 for qemu-riscv@nongnu.org; Sun, 26 Jan 2025 15:33:04 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-2ee46851b5eso4960521a91.1
 for <qemu-riscv@nongnu.org>; Sun, 26 Jan 2025 12:33:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737923581; x=1738528381; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GarlRROndxCjTPZHSIwatKna1U0gu9y5c+dSUp9779s=;
 b=LGniS8LRQDEmFIncFXhnd0GdFBtgyGic+MQM7ghCvKNc0Ql47pWJdUkOETdaJzbQAZ
 zEYexbvobWIYci3Hwa/memwwCSnsCJXVc6GxtkrWLeNYJjINTCT1RoAqfdLumzBgussy
 5BZtuL003UGSTgbifaH1EzYdqgZ61RYPsjcvWt7SMm32V97Co62BbwmizJMcNbjoz/vU
 ZD29pe83PRGpZXOoOAKkmxUDFvu5kbtoP48DjcZ6FvdKLDLNy/+lVGmwsGE0lGyD/pj8
 UG3NoDzDWaToCVAHEtA3j0YVqbRpPbCZqRJoLa674nZLU5pbmZCwNeCV6PmTAzVO0me4
 Nrgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737923581; x=1738528381;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GarlRROndxCjTPZHSIwatKna1U0gu9y5c+dSUp9779s=;
 b=wCUlmtDsQX2t/wXzt4PFlmQHnolFcMVmp5ugVfLSvBIHUQcKfbnyXr9IATmR1J7t4h
 NkmGsSqtFj/NqRTZtrL9kMCQEvOzQlzIv95gb1mwAOBdzKp1FsP5J1xHBTcKlUeHllqH
 qulTCnPFunuWFVXTPXfh9GIGRZ0Lsk7x3QUIMtbNwVBxCuSZ9D0/8PBByPiQvLhAYteF
 Q8wBFpxy8naSeGsFBlsO69c3sduJ2lXbMoZvMtVQ+++dHcHC88r5c164Gq2U1gENpQ45
 IK0l8ahxjoxNpxigOlbHIEkAbPM4MrUJFh/f+FODAXiNna3PSZ9iVc+jOejYY8L1Vk7i
 IM7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbKmMZsEjBMZCdQqwSOzpUajGvweFOzBVKpbaLQ1SHn4eRw267XNcQWwqx+7VI0O7Pv2K9MxYTp9cN@nongnu.org
X-Gm-Message-State: AOJu0YxjGTML9koiwpXncsKjIfLL3bj5sn8suMaXBAnI2V0Pgufowqaw
 yKy6U6mBYyDknxCJe1fYCYz50MnHhE2zLJQQWHVefWMuou36GTs0+bQU1prm/4U=
X-Gm-Gg: ASbGnctfJgbXc4oAOSUzpCqcZXQmu4QWsZFKZ5K9PMWWVlFW6bOJ4Tgxu7zenwCw3iu
 UwU0k9Worlzv1f5ZRfCf4hUnH0k++PWYlmSprho2dG5NnLPSxjRCNKTij1klJOSGKPz6QOwQqOE
 j8rFrMfkfAMW1IFkgnPjKvd/8ZmhEW9dAD3gFqDhUJJCCmSx1DMukluXYP24VCFxskcqrBBsZHT
 QLfpO3s7LW/kHCRJQIS2XHwAF7//pqbF6T4W9aGxn99gi46aCYbcOihxW4j/6HJbdXmt32G9pZR
 kuJOcBmwM0n5Thkyxk+nnVoeb/Z85+D67HQOTehTKnS6Uak=
X-Google-Smtp-Source: AGHT+IGrTF0ua3JOvhdmIhcZ60si5thXhjyK00MEnuyxWBq+ow6bXi0deca44yvyI2f3m7/CVHkiOg==
X-Received: by 2002:a17:90b:3a0e:b0:2f7:7680:51a6 with SMTP id
 98e67ed59e1d1-2f782c55be4mr50581605a91.6.1737923581153; 
 Sun, 26 Jan 2025 12:33:01 -0800 (PST)
Received: from [192.168.0.4] (174-21-71-127.tukw.qwest.net. [174.21.71.127])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f7ffa8122fsm5509332a91.41.2025.01.26.12.33.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Jan 2025 12:33:00 -0800 (PST)
Message-ID: <525918e8-b114-49de-bf4f-5b6e1c04d29c@linaro.org>
Date: Sun, 26 Jan 2025 12:32:59 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/20] accel/tcg: Restrict tlb_init() / destroy() to TCG
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, David Hildenbrand <david@redhat.com>,
 qemu-s390x@nongnu.org, xen-devel@lists.xenproject.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
References: <20250123234415.59850-1-philmd@linaro.org>
 <20250123234415.59850-9-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250123234415.59850-9-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On 1/23/25 15:44, Philippe Mathieu-Daudé wrote:
> Move CPU TLB related methods to accel/tcg/ scope,
> in "internal-common.h".
> 
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Reviewed-by: Pierrick Bouvier<pierrick.bouvier@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   accel/tcg/internal-common.h | 11 +++++++++++
>   include/exec/exec-all.h     | 16 ----------------
>   accel/tcg/user-exec-stub.c  | 11 +++++++++++
>   3 files changed, 22 insertions(+), 16 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

