Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84388CAC5BB
	for <qemu-riscv@archiver.kernel.org>; Wed,  1 Oct 2025 12:14:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v3vj1-000106-6w; Wed, 01 Oct 2025 08:14:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3vix-0000x4-Gd
 for qemu-riscv@nongnu.org; Wed, 01 Oct 2025 08:14:25 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3vij-0005xd-1b
 for qemu-riscv@nongnu.org; Wed, 01 Oct 2025 08:14:19 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-414f48bd785so4048679f8f.1
 for <qemu-riscv@nongnu.org>; Wed, 01 Oct 2025 05:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759320841; x=1759925641; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EutSndq8oB+MlZ4caVmBR2hGlbLCTV6/YaJtxzDNT/g=;
 b=cGYMXsIpxTvK3D5c6VTrAkp/MVZRrS8wJzdXHeYd0DYFjZn5HVwLof3ELI5vXUiLak
 93j7Ji692pRpTxAMiTV0iIKc3tEBuYBROAyf62rBY/G16SClN4CIxlxsR6TAaz8bgNAt
 Mt+WksshskYaOlbv8Rwdj9gWe2U/rLu6jj2v5TSiWB2ttmWZZ6zvxb+av09CmQO0NVhH
 a0GKBVAeHiEXQjz06sLBSTAWe8nlmRWuPWQj96fRNP97YxfsEFm5mb7q8rQfu4s6SBn9
 f9qDnHsvR5xI2YAH87g4q4pz1R6PTqyOG/jsfRJr4EfHJjl0aqzzK6qc/m9nQue47kw2
 OSAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759320841; x=1759925641;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EutSndq8oB+MlZ4caVmBR2hGlbLCTV6/YaJtxzDNT/g=;
 b=opMkyx0773tLX/LrqnFEnzHi0anIn+ThXT6L41x3DoxKowfz9Hvt1L1Sgd/fVmni89
 RFDLJjZVVCRZkmj4pAd8l2UJ1jscvaBOqIcxmOaPqc6Eiqu81vBF7JH9NsTZ0fahc0aa
 jpDH/be+B8e9NhrPz3O9C0VFJEmw7OZHJCd7476faJl3FYO3q/bIdSL9acBun7UlkVzL
 UwbtJrgVuc3FvVPdMfp0qdCn6L0xIhmau89hwITrgjqn8HEm4EUumGNGwQJ6OPhVCRyw
 F2j4Y9EX0d8XfNrzfk9jQxIxD/35RwbAM7N/pkg9PT9qSQbtjm1PbZN9LRJ9EXBgB1w4
 w4xA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVCD5093xO+Iy5VoIMvU85Mk/GLKgTEklAIB7nEJM2GbwjSwg21jJJfZnRVIurHmxSi8BW13lOiWn8@nongnu.org
X-Gm-Message-State: AOJu0Yx6iJZURi3hQLSnCHw43pBtunFMpUllv0TxCPnOxOoJmknjo8vb
 GZtfL9kj1US27JUEcf4falaFKbYcgluDjZd2O3h55U5Sxqa5bcT2bELkPec2teOW+2M=
X-Gm-Gg: ASbGncu1ViDQOM0HigQsVqcGAoC1UoKGs9e5++iewqUjWl/BnxQH2BHBzXY75RbPkkL
 JBwgJ7sTMjHoDbBlnPaBBtIkMYjBYv8ZkEb+n5JbfrX27bW5awKDQby667xagqf84XYygZ55guS
 s06Q7rp0Gks+fm2adUPkkojpN0Ne8BpqJUoEa2b9Tcu+WNlmRu3S3PCH2ATtXn0qxIRvbm/MXT5
 aI49UPVt4f8RxscVBPj6HWTjV+zVMAc50oR1Tsbh5/tw5j5wBWomcepc0BfIv3sSD5mIRPjXqLL
 Ev6/QgsgzZcJqzzhi5J/dmmOiyJ7PfuPLgMZW3Db45Gq/bpWPC3YlyFrljacBIMTvcnALr7NLn5
 2RcR4mKZ08ZMbm4vxYxihHoHRQp7bblU81JcqS9IVeKp1TBiE21BvmoSnzrHcOOIqwvU0XQ==
X-Google-Smtp-Source: AGHT+IFGhomTvd84cDwlD0yny0+xs+on25TT5OGNcJMwnPbzDWrd/J82pawNv9BPnqnmpnGnXKAvXw==
X-Received: by 2002:a05:6000:3102:b0:414:a552:86b1 with SMTP id
 ffacd0b85a97d-42557820e75mr2640161f8f.63.1759320841153; 
 Wed, 01 Oct 2025 05:14:01 -0700 (PDT)
Received: from [192.168.69.221] ([88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-41f00aebdb7sm14201386f8f.57.2025.10.01.05.14.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Oct 2025 05:14:00 -0700 (PDT)
Message-ID: <3da08594-1c54-48aa-a35d-3f6a6bf353fb@linaro.org>
Date: Wed, 1 Oct 2025 14:13:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/7] Add RISCV big endian support
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Roan Richmond <roan.richmond@codethink.co.uk>, ben.dooks@codethink.co.uk,
 lawrence.hunter@codethink.co.uk
Cc: felix.chong@codethink.co.uk, sagark@eecs.berkeley.edu, palmer@dabbet.com, 
 alistair.francis@wdc.com, bmeng.cn@gmail.com, qemu-riscv@nongnu.org,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20241220154616.283933-1-roan.richmond@codethink.co.uk>
 <6ad3dee0-0fe8-4368-b43f-e7f8f30ead24@canonical.com>
 <0878ebc9-f553-46b8-b2ff-b748bd45da88@ventanamicro.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <0878ebc9-f553-46b8-b2ff-b748bd45da88@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

On 1/10/25 13:32, Daniel Henrique Barboza wrote:
> (ccing qemu-devel ML - please send all patches to qemu-devel too)

Indeed, please repost so we can review :)

Regards,

Phil.

