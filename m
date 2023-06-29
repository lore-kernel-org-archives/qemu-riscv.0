Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82A6FEB64DC
	for <qemu-riscv@archiver.kernel.org>; Thu, 29 Jun 2023 16:25:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qEuSU-00021Y-S2; Thu, 29 Jun 2023 12:25:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qEuSQ-000205-Mr
 for qemu-riscv@nongnu.org; Thu, 29 Jun 2023 12:25:23 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qEuSN-0000JG-AJ
 for qemu-riscv@nongnu.org; Thu, 29 Jun 2023 12:25:21 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3fbc244d386so2147155e9.2
 for <qemu-riscv@nongnu.org>; Thu, 29 Jun 2023 09:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688055917; x=1690647917;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/cSxNoc5hhgPjFncoQgRk5fGebB8J7lWg6rD6Ui8oDw=;
 b=WvGyqyiU34RJSCmz97DCgR1ATP6UByGXPZyCE6yuIA3YK2H/AoFHPUyzBRFTQhuhrH
 nwMbCd0+CZsRQeLPQDvHICe+nM4dgAGIDEm3u0tBDyPn5/fEWDqW8mIPzxLvWs/OHINT
 LMZjRdoIre07E82gYImcJq7QbWE35qNwMUgeF0N2WMfq7q9fBSeRQamzw6ZTfmFNO2vp
 2Bpfl1Dc2bV1iAiReki9jqovaIgCYGU3A3byuYXYK0v5vv7FneJJ0tbqBg+3YQrLW8Ek
 Z/15CNN+iNKxhZltQUlYXBWvJLoBcZq1mzFzFXTNHMLu/ZbHTMrnbozcA3hYdSezn3kS
 OxKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688055917; x=1690647917;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/cSxNoc5hhgPjFncoQgRk5fGebB8J7lWg6rD6Ui8oDw=;
 b=Jov+k8dnPcAizilImZumJwAhtJKnDboA9PWMSQKm/pEAogHp3+8mW7tVH3h+/HXHgx
 bUhAQa5qmI8BafKiMVMfBzmpPh48VQQcQ5DpyBP6N/+qJY+4gui8yN8H33b6o2WX7BTU
 9bQRg5VG1DQ/EdxYKKpZoNnrDmvcV+xXfOyMgZFb08y2vtVH5vg1F+Hm+0Lbm7DVA/t2
 DzO7ps7O9+WPx7X15JLuC+kyh1+FhXwi7qVvBNF9chBCSEQvFiOz3m/S8S+du9ciCO3d
 +WlR1LzTRDKZJE+ZLjYrXARyQux1NnSR+5WHBoMpVKWKjL7EOECXsPw2uF7Stqzwzo4z
 CNjA==
X-Gm-Message-State: AC+VfDzM2HB1e0EkpIdIxXi2yWA7LNeUA6MQkFIYNSCL/VsU+GL389jG
 OG75TVuhZ+Jwhd1LG/6pCufwrQ==
X-Google-Smtp-Source: ACHHUZ6YjZ5QaFD4+5VlK+eY44PPHiM/RdN99Lqb0iocTVuQZkrh+aNdu/JnDhcTjmhvCQt5Gu1NUg==
X-Received: by 2002:a05:600c:2043:b0:3fb:ad5d:9568 with SMTP id
 p3-20020a05600c204300b003fbad5d9568mr4619039wmg.38.1688055917441; 
 Thu, 29 Jun 2023 09:25:17 -0700 (PDT)
Received: from [192.168.1.208] ([139.47.41.96])
 by smtp.gmail.com with ESMTPSA id
 j8-20020adfff88000000b0031412b685d2sm2711672wrr.32.2023.06.29.09.25.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jun 2023 09:25:17 -0700 (PDT)
Message-ID: <e163fb6a-56d1-082f-5330-3c88cb949d25@linaro.org>
Date: Thu, 29 Jun 2023 18:25:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v6 09/15] target/riscv: Add Zvkned ISA extension support
Content-Language: en-US
To: Max Chou <max.chou@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: dbarboza@ventanamicro.com, Nazar Kazakov <nazar.kazakov@codethink.co.uk>, 
 Lawrence Hunter <lawrence.hunter@codethink.co.uk>,
 William Salmon <will.salmon@codethink.co.uk>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Kiran Ostrolenk <kiran.ostrolenk@codethink.co.uk>
References: <20230627174551.65498-1-max.chou@sifive.com>
 <20230627174551.65498-10-max.chou@sifive.com>
 <af36c183-aad0-6e66-62e0-0f97b04eb4cc@linaro.org>
 <c7860d59-2166-292b-4689-0d25ff7b7469@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <c7860d59-2166-292b-4689-0d25ff7b7469@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.093,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 6/29/23 17:10, Max Chou wrote:
> On 2023/6/28 5:07 PM, Richard Henderson wrote:
>> You can eliminate the vstart % EGS test, and the vstart < vl test, when VSTART_EQ_ZERO.
>> You can eliminate the vl % EGS test when VL_EQ_VLMAX.
>>
>> You could move all of these tests out of line, into a helper_foo_chk() function which 
>> performs the checks and then calls helper_foo().
> Hi Richard
> 
> Thank you for the suggestion.
> I'll provide the v7 patch set with this suggestion.
> 
> But I have an question about the vstart < vl test.
> I think that we can't eliminate the vstart < vl test when both the vstart and vl are equal 
> to zero.
> Although this situation means that the instructions will do nothing.

We know vlmax != 0 (there's some architectural minimum).
Therefore if VL_EQ_VLMAX, vl != 0 and if VSTART_EQ_ZERO, then vstart < vl.


r~

