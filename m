Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC4A5C369D7
	for <qemu-riscv@archiver.kernel.org>; Wed, 23 Apr 2025 18:46:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u7f7B-0005oB-HI; Wed, 23 Apr 2025 14:46:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1u7f72-0005nI-PM
 for qemu-riscv@nongnu.org; Wed, 23 Apr 2025 14:46:28 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1u7f71-0001sc-2b
 for qemu-riscv@nongnu.org; Wed, 23 Apr 2025 14:46:24 -0400
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-736c3e7b390so97637b3a.2
 for <qemu-riscv@nongnu.org>; Wed, 23 Apr 2025 11:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1745433981; x=1746038781; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EhM7kuTkAUfVbtlveFdfxT0dzrHfQWObt9U9pD9Jguk=;
 b=j/lenxz+uUAdy0zEhYUVyyc8fd322463xUtaOGRNoX7fN5jFUhfK54HDvoPw5D/KO9
 l275Sj3T8SZQUTAiYs8RWU1ea2W9CJlVj9ueylY69Q+CBv0OMt1NwmboIoeIDon0lzE0
 D7ElomK4mEbz2l2hR6XTr/2Q6hDBWF+qZnhUpUz5Vhgs9eHiHp0vBdECuaGp+1jYFMsm
 Y/qFGkzizaBvxMPnM+WqQ3siM2v8UxINUXzTWDrgBOw9ykxCMdHtbpVQJEgPM43wIh1+
 iRmDroL2igANXFlyxQomO1y2makGlcQ17Zy3LsFoGaGaRGYqfmqmOJJaD1MJlL4waroM
 WStA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745433981; x=1746038781;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EhM7kuTkAUfVbtlveFdfxT0dzrHfQWObt9U9pD9Jguk=;
 b=mozxz9Pbtsxg6SFnVdahgPLzUIDxTblKga2P3Kw8Wa/bmL6LptiuwI7CruSVtFv6HE
 7ir29r0gqppiPSKmwA8ypLIsGQc9rgvpbAH2b+iNXCfwnVBs1jVCjgLVbaT0jMXiPYb8
 Ozv5aMmkpAZKdKf7iqlnNtxEqAGOaB/ako/n5s9Y43VFc6Z1EorV4CM7X8D1CBE9L+WF
 8HpUHHRA8ohFC8tUWY8vnkmsT9XzsQYv/qV2udSNVcd0F/Xv72hbJv6qpGTzYIdUhneb
 zA2rbeA4nYHq2E8LeLdZztKbNy+HXv5a1yjR7x+tn8eIPxfaStij5kEapCe9CH19vqJ2
 LTig==
X-Forwarded-Encrypted: i=1;
 AJvYcCXj2qtp0IbvrcfAV/YOtkbEiflxFLiqQ2A/XdEipE3lhr8wFqPUzB+3k8J6C1EuV70oflagmR0LTuCg@nongnu.org
X-Gm-Message-State: AOJu0YwcPpudQbGcI/aSB0ZlfmEODpeFVzYZvH/pxsEMy6BTy16lrJJO
 WXqkNxJLmQEqNvIOB2egU67SSuPS4eMbiAQdDJcgMNDdu9N8KHDHEA8Z65/Dd/Y=
X-Gm-Gg: ASbGnctupT7szwGybVzvVdkiR3ZQ6iMBtZqqx/6+1hRRzCpKlJMA9g/+bwRVBC1y34s
 eAOLIQaHXWK5UPPjeOvCaSXFyodJy4S+/Pvvloz6jHRH+FWzWvYE2LNNcEKxRPuIEwEwjwoS4pm
 P7G8xnGLVtibmNvPGOV3nq+qD0M8dNrqDBYKIeCfQ7GfrLwxdb4MMDQzr6YRqa20jcH0rRfu5xl
 /N0ELJg2fQxJowzdvjpe0XklHNH0nTJ1MdLb/PcpwViVSjqskqUDlkDajeQ3g/MPptQEkMQYv+G
 fwn/H/DA+48iQBc3S6otKj+pEzF5SweXl4lalsd+bMkifOYz3M31sG0=
X-Google-Smtp-Source: AGHT+IEj1m8U60UnIV0Rrh17ZSBGRWD9iuiRQ6KR9jGPsGhF3n3S4RJettFeuBbYi1hdHahGXawWKQ==
X-Received: by 2002:a05:6a00:1495:b0:736:6279:ca25 with SMTP id
 d2e1a72fcca58-73dc15cf685mr30405480b3a.24.1745433981212; 
 Wed, 23 Apr 2025 11:46:21 -0700 (PDT)
Received: from [192.168.68.110] ([152.234.125.33])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73dbf8e46e3sm11358415b3a.59.2025.04.23.11.46.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Apr 2025 11:46:20 -0700 (PDT)
Message-ID: <4ae09d20-ed68-477e-92eb-b9dd31a919bc@ventanamicro.com>
Date: Wed, 23 Apr 2025 15:46:16 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] target/riscv/kvm: reset 'scounteren' with host val
To: Andrea Bolognani <abologna@redhat.com>,
 Andrew Jones <ajones@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
References: <20250417124839.1870494-1-dbarboza@ventanamicro.com>
 <20250417124839.1870494-8-dbarboza@ventanamicro.com>
 <20250423-7d7e348ed0ec6cadb1efe399@orel>
 <CABJz62NKOzO=aE-fz9Ad2gxLnSNvU41xnfhOS0EKLim0SnYOtA@mail.gmail.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <CABJz62NKOzO=aE-fz9Ad2gxLnSNvU41xnfhOS0EKLim0SnYOtA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x436.google.com
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



On 4/23/25 3:06 PM, Andrea Bolognani wrote:
> On Wed, Apr 23, 2025 at 05:46:16PM +0200, Andrew Jones wrote:
>> I would just drop this patch and make the default 'virt' cpu type 'max',
>> then nobody will hit the issue.
> 
> FWIW virt-manager has recently started doing just that:
> 
>    https://github.com/virt-manager/virt-manager/pull/784
> 

We have a patch in the QEMU ML that does that:

"[PATCH 2/2] hw/riscv/virt.c: change default CPU to 'max'"

https://lore.kernel.org/qemu-riscv/20250404152750.332791-3-dbarboza@ventanamicro.com/


Any updates in that patch is appreciated, in particular if it comes from
the tooling side.


Thanks,

Daniel

