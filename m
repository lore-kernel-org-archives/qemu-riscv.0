Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51ABEC83F09
	for <qemu-riscv@archiver.kernel.org>; Tue,  8 Jul 2025 21:14:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uZFFv-0005Co-3b; Tue, 08 Jul 2025 16:49:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uZDt4-0001pM-Jz
 for qemu-riscv@nongnu.org; Tue, 08 Jul 2025 15:22:02 -0400
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uZDt2-0000uw-JX
 for qemu-riscv@nongnu.org; Tue, 08 Jul 2025 15:21:54 -0400
Received: by mail-io1-xd30.google.com with SMTP id
 ca18e2360f4ac-876ae3f7768so442438939f.0
 for <qemu-riscv@nongnu.org>; Tue, 08 Jul 2025 12:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752002511; x=1752607311; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gFl9ycDvD8hTkIKtix9h4JxZql62asrb+MOPRsaNjSc=;
 b=yuYZfdoX7NlMrkz4T2zhbzGMuLnpCJZvDImS/1MZ1wWsY0ODrG+zKmJyM1SVmtN5sc
 ntNnpjwNkeoz61X5xACXG6vUwyvYCGwUGNAZvKYLWuMOaE1xwvk8Ws+Y5Bcnz2Sy3TV9
 Wlf/N74B7EW1yE9M0a2ws486XQuhObzAj3/JGn9gulBCR/unlmDwwGDtp17b/QJs2oQU
 alA9+JFG4BhNxe8l0q8jnJfLmTllPoEJYJAbtnDdSszLjuxm0jIfz1X8Zi1ComJwJKsb
 hPrn4S3Kx+tKKUQosS8R22TQ/aJ6jdcIXeQ/IHH/ivzbNbLS9BTjr3ODYWO7s7miNC5u
 9xtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752002511; x=1752607311;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gFl9ycDvD8hTkIKtix9h4JxZql62asrb+MOPRsaNjSc=;
 b=gNutBlmVycqU/0ZaVrnfRvae8F0fCdKco+C7kw7X/tEoi0AndLc/pr/EDsBDWC58l+
 nlVFiQPqXdK0HMRcFe+UrAvCf9zatV8q0ywUTW6DKKS9mhgAuj3j6Ip8rRdekgJuExVi
 r9hxOi7oWPgCpgFpqw8q4No8g15dxGAfjvp+XtVyLB6xtVg5EdPM6TSRPxCRa92ZAmwf
 zLnK2eYRoOQGECAyea6AEwbvV82XHYrCvv8E3IFKr8cTEx1M0F+rEGIHtBO8QEyJHA4A
 sPNMhtcWLHNyYLZvYP75Lx/kKvL4qwzWQkFw+VqXgf5vfzxO1eg1+KtXxEERChqUTSiM
 idQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8lSiYHvbNoZd4AmQRMwPhX3v/HUei6OzL7D7ohBQEox18SkMP401e2TQVvdWC1J2k2CjYs5W1tWUL@nongnu.org
X-Gm-Message-State: AOJu0YwNYm+9R93CSK97frv4jGbk/qXzjawn0LnGtKpI6F9z28KPabW9
 6tZf3bBh5EavoWglEHYABSX3d/7rbPwIlEmIUdyYRrPnwjYUaQhQZG0QaPDnhZK6Gezd4ZqrA3e
 qeRhLP9s=
X-Gm-Gg: ASbGncs1lHXLiGIN7+L3FE1Y46FvKEmrxreH7+PiSVHdsGdY7DZLpjhrh08gKv7dDYa
 S8WTFrLpAZ1Xu9QmvFhF5GOcoG5hLHoduDWh3nESuqf7919DIrPLxm1+G7y0bZrWLcd/5E5qsv8
 akNrrYqr3oRyx2isIhZRtHlFY6kXyjxyGGZ3vhUR91UNucRZxGw7KtBCNIUS+bPomkISkB5Ke70
 lbzt22MaBOvL0SlZqAufxOmIYlRZTmsdYl1gWLf4p49WDCebVcKoh3jf6AnGuCVPitN1JVtx7iL
 PXh+jZxKL7XAWb44FQCXPhFbs26JGZkF0dPw4kx9UTA6mmZyuBO2GMbgO//YW29kJMN6OH2jped
 dCPi+JGye8xoAgxQ55kyR+fVCzkFYwF8zID4FphnP
X-Google-Smtp-Source: AGHT+IEtnZVx8pxz2Bsy1b7CSnXurKno5YuaxEVnhnM2MYcsGC4zvlbMkQQgbLPB0Lq6wNwAmjGpaA==
X-Received: by 2002:a05:6808:4fe0:b0:403:37dd:e109 with SMTP id
 5614622812f47-40d073dd740mr12731140b6e.27.1751996176929; 
 Tue, 08 Jul 2025 10:36:16 -0700 (PDT)
Received: from [192.168.4.112] (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-40d02ac77e9sm1678991b6e.36.2025.07.08.10.36.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jul 2025 10:36:16 -0700 (PDT)
Message-ID: <d182e9ee-afae-41fc-b160-971cd909b9b9@linaro.org>
Date: Tue, 8 Jul 2025 11:36:13 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-10.1 v7 4/8] qemu/target-info: Add target_endian_mode()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-riscv@nongnu.org,
 qemu-block@nongnu.org, qemu-ppc@nongnu.org
References: <20250708171949.62500-1-philmd@linaro.org>
 <20250708171949.62500-5-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250708171949.62500-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d30;
 envelope-from=richard.henderson@linaro.org; helo=mail-io1-xd30.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 7/8/25 11:19, Philippe Mathieu-Daudé wrote:
> +/**
> + * target_endian_mode:
> + *
> + * Returns: QAPI EndianMode enum (i.e. ENDIAN_MODE_LITTLE).

s/i.e./e.g./

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

