Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A2ACC83F1A
	for <qemu-riscv@archiver.kernel.org>; Mon, 14 Jul 2025 15:09:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1ubKmD-0005RG-60; Mon, 14 Jul 2025 11:07:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ubJSH-00070s-B7
 for qemu-riscv@nongnu.org; Mon, 14 Jul 2025 09:42:56 -0400
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ubJSD-0003DV-IE
 for qemu-riscv@nongnu.org; Mon, 14 Jul 2025 09:42:53 -0400
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-2ea080f900cso1359934fac.2
 for <qemu-riscv@nongnu.org>; Mon, 14 Jul 2025 06:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752500566; x=1753105366; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=xBaadnYzOfBJ6cTf5c2NAo95E7nZ9KE3isU/dbqV4dk=;
 b=kWV6XIw6D+aK2VyGpyvUbTenvZmjPnIqhdpZt37+fwvXGvGmkhIeOLiwu+F2QZvF2p
 NysVeQW68KNmb0AncO4Ry/Z5LhA22qKa/LDv0JJ39ssKwgDhBQwsZxOnklBVYJq3d9vQ
 BCKq1EAGXwwk3ByrakbKUQDFZgo4k1Gtlylprk5o67BqXBmHVO86gaqQ+V854CIeXrGb
 oJsZD0Cfu49p11H3HQaXS8SRn1Nbw2oN4DAiz7KWUiTNijqyNUlKqwT8bjZVGIknEbA6
 UJf6Sx/bhekiqYqnIf82VoHtwAvr38NDjoic5AACCOdbkNU3Peh0UVgx8Txn2OmZCsmO
 nGsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752500566; x=1753105366;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xBaadnYzOfBJ6cTf5c2NAo95E7nZ9KE3isU/dbqV4dk=;
 b=jyur+bzi3gxWCadGCqTJaLxnY5PKte6ysMdmfxqqBM9XoU1DaK5J4rQQ5H7/tdABae
 g2MpIDIhgBrXn5FULeMeIitG+HknbTwJIpndK5rIhm7Jw5ZKwK9KRxA48yJRXdZzp/hJ
 9kMPoL4Amuu5Bfj+nti9IlXiJ3GCmkdQbH5L6aBkNGDmRgJzBQeWxSxvhpsNn4M9GUyq
 fvaCoaaV7ha17VdQd4jRxSmI1DAIYjLL7lrcu+IwmpAX38JGFqYFvs6MWZWEMjhtmUVz
 8bEZLH+UXX+0BqEjcn4lylYsWaSVvFSS/8IyZpc35hruK0zCwDMhrOmLJiOw1vTPp6f0
 TJkQ==
X-Gm-Message-State: AOJu0Yy7hH96Srre59vKR9MWJv0HoNVX/FPz4r42HPzn60cDNssCMQlv
 GyD+D4Evf89i3CjQt5ZyM9ToHNhZnmCpGUf8MmjMhYR63qSoRP/xXRFqTveYpLvOpMQ=
X-Gm-Gg: ASbGnctso4yBM9tIwTRIFMdX6is4QgN2uJHfYXiFFGH60oAFl1Vk4ldp9zvM71j1Gv4
 3zuwJFyJZbgGI+j8ECLucEujy8ZG3BKUi41xZAfUZ40Zj/JiCHErq4dCa+kXF8gobrN0yeOQ7cz
 sZw+oAPmhtRZ+lUlJRNcjTXzaGWhz1dZ60uf8wNBfpKHiNtIxgtIhIDkJBy0l61wBgPmHKBrb2j
 2BeT2f956dKa1dcCmvd1jRGR/yfTkvchlX78jqiitiUKrc4TzZQTSZnwIjvPijnY+SAA/F7dLhk
 LmzAP2ZFmw9yjgCSY6I1T96ztt7+S0VVcOx09bwx7IAipwvE8yfqUA+GMEa35x5mwmWBo9/ZGEg
 z6kN+ErlvX5PH3xq80qOTtavpa6H9ASyyvJxGtfrp0syz9El7ZQDl2pf0FHVHiPbdh/qBx1rI+c
 CWpeARZMH8ZCI=
X-Google-Smtp-Source: AGHT+IGv7rDQ99lcBFL/P0/LzHz5JYgMexrlmLGjR6O8tR87V2maoF111EFOe3v49ufMGhdf3zJEyw==
X-Received: by 2002:a05:6870:3b0e:b0:2d5:b914:fe38 with SMTP id
 586e51a60fabf-2ff26adb16emr8455140fac.37.1752500565616; 
 Mon, 14 Jul 2025 06:42:45 -0700 (PDT)
Received: from [192.168.4.112] (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2ff11680db6sm1942451fac.25.2025.07.14.06.42.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jul 2025 06:42:45 -0700 (PDT)
Message-ID: <e2bf9f69-80bb-42f7-be3f-b51c1d85e244@linaro.org>
Date: Mon, 14 Jul 2025 07:42:43 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/riscv: do not call GETPC() in
 check_ret_from_m_mode()
From: Richard Henderson <richard.henderson@linaro.org>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, palmer@dabbelt.com,
 qemu-stable <qemu-stable@nongnu.org>
References: <20250714133739.1248296-1-dbarboza@ventanamicro.com>
 <22834f14-4fb0-4cf1-94a4-0c53ab094765@linaro.org>
Content-Language: en-US
In-Reply-To: <22834f14-4fb0-4cf1-94a4-0c53ab094765@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2f;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2f.google.com
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

On 7/14/25 07:40, Richard Henderson wrote:
> On 7/14/25 07:37, Daniel Henrique Barboza wrote:
>> GETPC() should always be called from the top level helper, e.g. the
>> first helper that is called by the translation code. We stopped doing
>> that in commit 3157a553ec, and then we introduced problems when
>> unwinding the exceptions being thrown by helper_mret(), as reported by
>> [1].
>>
>> Call GETPC() at the top level helper and pass the value along.
>>
>> [1]https://gitlab.com/qemu-project/qemu/-/issues/3020
>>
>> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
>> Fixes: 3157a553ec ("target/riscv: Add Smrnmi mnret instruction")
>> Closes:https://gitlab.com/qemu-project/qemu/-/issues/3020
>> Signed-off-by: Daniel Henrique Barboza<dbarboza@ventanamicro.com>
>> ---
>>   target/riscv/op_helper.c | 15 +++++++++------
>>   1 file changed, 9 insertions(+), 6 deletions(-)
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Cc: qemu-stable@nongnu.org


r~

