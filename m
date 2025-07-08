Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87D8FC83F10
	for <qemu-riscv@archiver.kernel.org>; Tue,  8 Jul 2025 20:48:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uZFBy-0006i5-8n; Tue, 08 Jul 2025 16:45:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uZDpu-0006GB-Or
 for qemu-riscv@nongnu.org; Tue, 08 Jul 2025 15:18:44 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uZDpq-0007u2-Nk
 for qemu-riscv@nongnu.org; Tue, 08 Jul 2025 15:18:36 -0400
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-74931666cbcso3902235b3a.0
 for <qemu-riscv@nongnu.org>; Tue, 08 Jul 2025 12:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752002301; x=1752607101; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NpokmzBZf9Ndynik64SY0VCrm5Id9j2SDPXgY+3AKfI=;
 b=v5tuGiFkT/gB+ENL0/mdRKXRic1Ft7Eceom/OSy7a4Eyay9ZSe0NZ8wQXu+l6bwgCH
 uOSXJBL9gUeCrACAgNRIUVSUbUBCoRlV9tfBEJPKIsfYNPLshAMwqaAyvULRzF9RaafD
 t1L7EvaKGvMR3FIfn6BEKb39MbaUYImwx5O0fAMnx+Ncy70M8eI11/VSL+S7IwD34DNM
 Gsqw7qGI7ZKUmU0AMNRE5yrPUaxmSe0BD59yoTLC2BQcMxogdAxn57QH9LI0kHXCA7op
 evdwgB1wnWDbwFrjxo9yyQouwd9xh8oIPckxXpN7dTc+GCE/JWKXlLZjhEu+uoFqpi+A
 MHSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752002301; x=1752607101;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NpokmzBZf9Ndynik64SY0VCrm5Id9j2SDPXgY+3AKfI=;
 b=H1Wv33u30MSSOosTi0TZVEpEb1hoYjgE2mS9niWrjoJlgKTmOcN3i5EkrMSVyPjxBu
 H29zDc6gqddjyzErDRUGAh4eAn+7KsVg3tTD22QEEUjBcdeE7UZfte+LvhYnv/NysL46
 d7Hcgp8d6o40RdQQ/1xwc0p0iVvpt4mRYOQHi+nm0zyF/MQ/9pcJLst9OpDbCIsnMufL
 2ccv4BnHEo+ewr2x0zoD+Y5vLG53CL87HRmDNusarQ39zFnG86oO9syrzmcnt1CYeOWr
 vJPBZtaeTUWg4h9uU2No6IOWKBDjVDl5z7eRHN8IebBzvpTHHBEkM1gq6zWfRDDWqyg6
 ZlZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqK6cZCPVRFvZX5eWUTpyl6cPeoIi+Uh6AU0i4Qbvjstm0yj5FINPxKASnME+UqHbZ4ricYwECmxfE@nongnu.org
X-Gm-Message-State: AOJu0YyPFOJSemtHP5dtKG0XMsRPlj7RgFtU8F/Hxs+utxw8G6o+7AMW
 0E5UeETpPNZraC4ntGG89wtoasJpd4L7CTaj5Nq4GVRGd8pRqs3fhIXAV2XnJbGOfZWm+MajgIm
 BRmzI
X-Gm-Gg: ASbGncusQsj+EWukPe3phosI3q/dWB3EjpYGjEqkB1yeel8nXjpH5dKYdA6/zzu9G2s
 jccc9JUfTigHFSJ7+lRvjWOdpUXqkFH7CaKbxq5tbJ3asVNW31ZgEIb3c2e6MkY7+ky9OuSZBeK
 PPq0Ku36SbgZHM2MBCOnyZtQE7q5/W7KKAtYzb/uz+bZRHECzj9Kyd/XkO3SHrWO7v2ezfKnYcA
 Ls3jSwpX3aW6idUXvhlFEhtfVNMw+RdPbLUzJ1n36ODRKG3DGXVshIySrl6R8o0AHSS3sTzp3dZ
 WqOvBCTExfD0T3zUyNrupbzMKP99QWmW4Px4fonnlReRqSQr7RaWk1vb1yezG6gkqqIm02lYah8
 =
X-Google-Smtp-Source: AGHT+IFD/tw8S92eqLq6aXF3gXU+MXGEhzjZU7LiY85OvpsrbqvoO6pCAQlmjdzy+5IRmNr/dwAXUw==
X-Received: by 2002:a17:902:d2c5:b0:236:6f43:7051 with SMTP id
 d9443c01a7336-23dd98356a4mr4888025ad.23.1751996046753; 
 Tue, 08 Jul 2025 10:34:06 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23c8455eb3bsm125752875ad.115.2025.07.08.10.34.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jul 2025 10:34:06 -0700 (PDT)
Message-ID: <c51f3075-5511-4a97-9eb9-7605d224c237@linaro.org>
Date: Tue, 8 Jul 2025 10:34:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-10.1 v7 6/8] gdbstub/helpers: Replace
 TARGET_BIG_ENDIAN -> target_big_endian()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-riscv@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-block@nongnu.org,
 qemu-ppc@nongnu.org
References: <20250708171949.62500-1-philmd@linaro.org>
 <20250708171949.62500-7-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250708171949.62500-7-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x42e.google.com
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

On 7/8/25 10:19 AM, Philippe Mathieu-Daudé wrote:
> Check endianness at runtime to remove the target-specific
> TARGET_BIG_ENDIAN definition.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/gdbstub/helpers.h | 15 ++++++---------
>   1 file changed, 6 insertions(+), 9 deletions(-)

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


