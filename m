Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66359C83F09
	for <qemu-riscv@archiver.kernel.org>; Tue,  8 Jul 2025 21:27:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uZFD4-0001E6-Ij; Tue, 08 Jul 2025 16:46:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uZDmq-0003yE-SD
 for qemu-riscv@nongnu.org; Tue, 08 Jul 2025 15:15:33 -0400
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uZDmk-0006rv-Kb
 for qemu-riscv@nongnu.org; Tue, 08 Jul 2025 15:15:24 -0400
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-2f77591f208so107694fac.0
 for <qemu-riscv@nongnu.org>; Tue, 08 Jul 2025 12:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752002079; x=1752606879; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=F2HpjSQfUcyL+dk5nvnLr+0m8+LQPNaBS3pAOPLTg4I=;
 b=T7HLdCatu4Bb9z++4+Wdpb9nld1XQQK7zM6vtdBjPhV9uAEoyLmrW49H/+32qbc9sd
 T2qROScWTc61SOumn3bXF4FQ407DRe4kG9kspnDo60vCrO3xI5RDwytuYWcXsbfp07kl
 iS3zzMrUOSndlFeX14XcmyEUcDAnJmv/xvwunLhR5dEIvBKsqhi28SthsccYSgieKHqn
 N6zKRr/6M2HSA3xN3dU1h12DulMRlXCURn2hCAe5LE/aiC/ppHTh4slh6qU6aZHRGIYw
 3qaynsDPbZVl1wC2RFYiCGbTxPXlOsJ/0yH8RzQSqY0m2lBmBX9WB+KhWWQRFaSdU5XM
 pAeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752002079; x=1752606879;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=F2HpjSQfUcyL+dk5nvnLr+0m8+LQPNaBS3pAOPLTg4I=;
 b=Ef7TTrdnN73c1NX23QXTZlI7CQZqwU7KpudHmmN8ZYbsICoWMvrhJbU2bc1kqt5J5y
 cJdk26Xa2PKgWO/zsq4poU6rynu5wwUR5rifeiCmFbBYObO2MTfnK0yNtnBQMCPRKa5b
 4ObkLiZqB4fLSzn2zp5uTikqDoriXu4Tp0KEC3PtB3239DSVsvTp0XRaEjj2NR0CVh5S
 b8tiLgVLoeVBZXMOd70coquf5Fyovxg2zEWr2NhOp0xz1HmBNAeZDj6wZhNlmc95uFbm
 gHHknBsTc8MhelENmuktxSRKItpWGUKRApX0uZUFlUz30Z8SWZnK5FVwUnM+tPO5yWRL
 2SAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCggA3DnIM05lKFkOqFvg7IzJKhsWYLNPWYraFvCK88Y877B2wxFm+6B3J88kHugMMkVdrY3g+DQlZ@nongnu.org
X-Gm-Message-State: AOJu0YyCHc2JKBz24Fb9KvzuCThyx+23t4PxWDW2dJe2t+sKW6gfpbgW
 xyk02oduPzuFeBXbupaKYJhzKFoJH4yBWQo5w/9aEL011PAHy5Ixu56O9lIJQVz3KoASl550IsF
 KHZcQ
X-Gm-Gg: ASbGncvC8ZvWhXNDH40TKL3UfUrIBy2wNjejbECiw9+SZjQ08fNornjfoEqSDdj4+Jd
 zM8wjO2vGtNyg3bofUteWxCAvGjJh35tcYiH+QTWFoAITK2GCoDuLkfTuE1DIjaeYewRpCj+A3c
 JQxXsCP8C4Rz78CPjzTfJ3rcb3/9V34Yy4u+CtLPqOCDiJQ+LbQSZR5eEoIY8kK7iGk5ttpTlju
 2LqnEOhgGwe5ergPJ6vgHNvUcYqXBS7Z80Y1+Kp3e6OdF97CZ2rtIWvLK4QJnXcmh0XJ9nkSE/1
 tzW93jMdHi7znMkBsmvBFJ6OmW8jjVVr6ov18vWXG/wHB7l4d7Pe8AiliIqpkstgv/zepqJawUA
 =
X-Google-Smtp-Source: AGHT+IHpQZ5mayqXOBtFoWMKmAuI9WiG8w0UvJ6VnSm11hYptZaOI4Kwceq/TASatqqqGmROppu9jg==
X-Received: by 2002:a17:902:f644:b0:237:e3bc:7691 with SMTP id
 d9443c01a7336-23dd1cf882cmr44518155ad.13.1751995993465; 
 Tue, 08 Jul 2025 10:33:13 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23c8f1241casm92720165ad.76.2025.07.08.10.33.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jul 2025 10:33:12 -0700 (PDT)
Message-ID: <db881c13-afa7-47a8-b8b1-7a7aad551cd3@linaro.org>
Date: Tue, 8 Jul 2025 10:33:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-10.1 v7 4/8] qemu/target-info: Add target_endian_mode()
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
 <20250708171949.62500-5-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250708171949.62500-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::36;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-oa1-x36.google.com
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
> target_endian_mode() returns the default endianness (QAPI type)
> of a target.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/qemu/target-info-impl.h | 2 ++
>   include/qemu/target-info-qapi.h | 8 ++++++++
>   target-info-stub.c              | 1 +
>   target-info.c                   | 5 +++++
>   4 files changed, 16 insertions(+)

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


