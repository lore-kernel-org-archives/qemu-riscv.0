Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA585C83F0F
	for <qemu-riscv@archiver.kernel.org>; Tue,  8 Jul 2025 21:25:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uZFC4-0007DJ-Rh; Tue, 08 Jul 2025 16:45:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uZDmK-0003g7-56
 for qemu-riscv@nongnu.org; Tue, 08 Jul 2025 15:14:59 -0400
Received: from mail-vk1-xa2d.google.com ([2607:f8b0:4864:20::a2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uZDmG-0006gS-C6
 for qemu-riscv@nongnu.org; Tue, 08 Jul 2025 15:14:54 -0400
Received: by mail-vk1-xa2d.google.com with SMTP id
 71dfb90a1353d-5315972826dso147853e0c.1
 for <qemu-riscv@nongnu.org>; Tue, 08 Jul 2025 12:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752002031; x=1752606831; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hhWCRVHslwq6uQ1RrYD5pYArFASP6BrAWb7d3H68MWU=;
 b=EmI/O4ZMTnZhNxr9YA8Hc3v+AXCXRe6T4vU+NctaWjL46ScHX1kI1M4dPWOO2KmmkA
 ZYAgcmVmlR9GDb9mDUxXAGbMGViQnL4+MFPixfVRNrogYISuPAbA6p6uMlGi3/wtkeJG
 F5iGdRVBFp3Vg9m74uzDuAzjKpkoRQB2b5qxLehpnF59PvqKgnPhLhLjIIPSx3eQsDa1
 QHfo4TTL4S4uvmHOyJazAlxLmms/tOfwQapLkFAueo5wW8veBc+dWdzxOSqbALaeQGlH
 KvPnrx29wUeVIjeRKLsDO+BEI5n/vziMqH0N59wXI+CdQg9ImFtZ04eWMMoiwhWJb80I
 VahQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752002031; x=1752606831;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hhWCRVHslwq6uQ1RrYD5pYArFASP6BrAWb7d3H68MWU=;
 b=hDRXBYtZArEPmq+uKzRQgM4jkHm6cQvK7Kp9fqN2hMBzB5CFjdFuEDa/PXd4gLHbN8
 kSgguur7h5CDpTnbLijDkx4HQfHVdjjJzJnDWpYE6EYgPXSqmj/x2ch6Ge6Hj9+Bgpa8
 pBx6Ydf4P8Zsw8ojUh6dWFCldiAWJc2X9OB2tCGTc14vucksAjbrGFA55oOF62L7tcpX
 8HgozZyhIGLrXk71d3sT5H7h5sybp+a4V4eas3rJO7JtjR87Vwn3F6CfojmTs+gMWqd6
 L3z0OUy+bBl391ilYe7H8JQ4b6GXkrGi41AkbiSQT1feQMOTOPbrkl2sM/XVFXA30ygN
 AvoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpXgijVX3YSsamw+c9AXRADmPOap1gf4k/038SfjvtfrkOBpjxgc8l8mMjXyerAPVZGRDjGItxeGRm@nongnu.org
X-Gm-Message-State: AOJu0YwbjpQd7+uD7z844kAMYUmhVtZsT7Lbphy6/Y5vhKQqHJhFb6B7
 uEiXapPfOxjTNG9t7fpoAFKI6L54418WGIgW7vMX9olBbnbBXjnY1NmLB+e6oXmnezXzrDhaluj
 9rSUa
X-Gm-Gg: ASbGncuVe4a1cPvqzF3iVYc0PfPmzNlUp1eaz7WShAQ4045mmovz2R68pkJJJhwm49w
 HrqL0c19pM2qiJpNUvWxeU2AZyVUCDLGVQ8P5XlwEAsvV+OsPL6f0antOxD5RsQvhUgILcF1FgZ
 Qy9htUmIWWyQY2AijjfQhZ6SCSeQ725jhtaaoNZaU0k5m+6zQYNaVgjU540yjvbGDxBmCHccgPq
 HZKztGaiQ6yEMFy3xlopgSIS8+hB8+xu/z1ry2eNu2W0x/+nKNw5t5SEH++C4mxk9ZjrSGG4rZC
 2OskiqVFPR0RtmFoROI+Jr+HBisWJowUbsIXF6dsmgciLpBhOl22bsQiEfAxDgNaWUx2s1Mu7M0
 =
X-Google-Smtp-Source: AGHT+IHn7j7DwtC37mVnuJxSAyamU1ibclONru48BAOFY7tp15B+Io74D//xDBie9Udp6k0JPh09yw==
X-Received: by 2002:a05:6a20:ce47:b0:220:1843:3b7b with SMTP id
 adf61e73a8af0-22b6640dcabmr5437329637.4.1751995905836; 
 Tue, 08 Jul 2025 10:31:45 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b38ee4509d0sm12056925a12.7.2025.07.08.10.31.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jul 2025 10:31:45 -0700 (PDT)
Message-ID: <b30ca036-df53-41d3-9234-1f32070915df@linaro.org>
Date: Tue, 8 Jul 2025 10:31:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-10.1 v7 1/8] target/qmp: Use target_cpu_type()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-riscv@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-block@nongnu.org,
 qemu-ppc@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Song Gao <gaosong@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Aleksandar Rikalo <arikalo@gmail.com>
References: <20250708171949.62500-1-philmd@linaro.org>
 <20250708171949.62500-2-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250708171949.62500-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2d;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-vk1-xa2d.google.com
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
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/arm-qmp-cmds.c             | 3 ++-
>   target/loongarch/loongarch-qmp-cmds.c | 3 ++-
>   target/mips/system/mips-qmp-cmds.c    | 3 ++-
>   3 files changed, 6 insertions(+), 3 deletions(-) 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


