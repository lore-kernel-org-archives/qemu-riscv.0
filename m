Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8A8606A323
	for <qemu-riscv@archiver.kernel.org>; Sat, 14 Nov 2026 15:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=AvVHGDDT
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xSFV5-0003RE-NV; Sat, 14 Nov 2026 10:17:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xSFV2-0003On-5z
 for qemu-riscv@nongnu.org; Sat, 14 Nov 2026 10:17:04 -0500
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xSFV0-0006d2-J6
 for qemu-riscv@nongnu.org; Sat, 14 Nov 2026 10:17:03 -0500
Received: by mail-oo1-xc2c.google.com with SMTP id
 006d021491bc7-6df7f544919so1884788eaf.1
 for <qemu-riscv@nongnu.org>; Sat, 14 Nov 2026 07:17:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1794669421; x=1795274221; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Ztr/ufpPwgm1eTxfpDpM0sKjyPATXBSU3kVh4E3UsQA=;
 b=AvVHGDDTAtF79QZlL8XBF/ckrbwKtogaaN+5QsJcMwXEUlNnbJJFHhin5eSAZ3sfpC
 gK+4Gu0R6EUA1gJW2ai1XfKa9HSU5agMlVjDATTHxgfdX5ApdZSzzQCXnnAFg+RioMaY
 z1Y0dRSR8pfHFopIX+M4Jte6UDAbbuqzV7opDc6yvb8JkyRUAteWVkSHP8IpVQPs6BAq
 VugUqJcOLb4J9XLVByzUMuINQ2Q9onHCRajVEVmw8aQNAClonTwZUheJAJ2TRL8yXYhm
 oWCzbQaEMuzzqiWS0EK5vrpw7G0sW8R1hX6TvhkgmwoOsxW/H+64+2Ga9DfzD+yytYzP
 ZZyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794669421; x=1795274221;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Ztr/ufpPwgm1eTxfpDpM0sKjyPATXBSU3kVh4E3UsQA=;
 b=oCMr5fbxo8pg09K+t6BqAyKSxF440ixtiD+0lDohUX032DqehEo/wULdr1XI9Lojso
 mGQ2qdH/W4yeZB4ZMDiTwKxYO8MuhPUlzYnIky0O20rR0eCwuP4CWxq7ETLY7K3w7SR+
 cHOuneq7OnrY2TNbpKUGHtnT8yzYSatFadpY7tq7vb5WTq+zAitlcGy28CT+hpJ8d08x
 aPrI+oQ+JjXJEXadwvMVyr6qkyNlQSqmC/4CB6V/gVj4y0vHz8trjnHV8Jt2kedADHov
 okMo17GOz6qR/g2TIF8HTsLAeKGootqb9ukPD/M4GtziOCSpp3yhJFgRKcWImqDwqFoq
 Fy5Q==
X-Forwarded-Encrypted: i=1;
 AL+hErEG8INE6JvgxeTzX3jRgN+A3jS5/th2JmWtiaBWvoqOo9lEbyg+HIslfjgCiw/BDqVw/9EHgZnG44uA@nongnu.org
X-Gm-Message-State: APuU4Z9b4XX4mvmpwey8Atav94pZD+vJPRUKMGyFRQdwhk5YyUDqgo99
 z3zkExLl/mKMp0ZBxqTspFtvifx4II+qpNCho2nvMFGPs81qlgQXjK8piulzN/wFAPQ=
X-Gm-Gg: AYBFou3R+h8cfxmqkv15wgfdLw7v/f8BTDKaKGXwm5w3S+bgq2HXfcU2bMlfBnImE4F
 piuI6TrVqH0tDBm/0Fb1cxjT+Y6F0qnsraLVBDUbW77EAn3R1EGHL1e1GEUDrazMZSF/0cauqyI
 M0JQ55cLaD4nbZBZmEfo923gekDzESL02CoPfvmNLsMcfMUy35AXZd2tyQ4Adkd8lPqoo26U8dd
 u1ZU9UYV+8KcLdogSHtNH+ICAREOnBTJQgdCDyLzxbd+r+AuadIBzk2G8ql8yeHmr8kYgTmnXZU
 zeH3aqcZBYem7gaPxB9kfDAJ9ygb+0j2EgiDLRLvwbRu/NTSDpbiLT2CVKHUsNbp4D/sjeKyQPE
 doMakC0R09Qo7Gtd4aIVgQSjm8iDLyDXP5pVl6UXMsY1PgxQxoTnZ5x/6sPAQA2hzDWdlh2BRQv
 RgVQMJFHmfIp9iqDCwoVuPA9zPiXlNHC3uQgH1vxrocMEmcDgcxeD75qItzbB9ORlzEYGZkHf0G
 wOzVlzEtu28dzLTySDlb3XuBoGAmYkNm44An6KDmo09m0G0sRjDRwSy1St3V1gyEX5lqGPOUNYz
 lYehtAYqyW3+bl9PKE9/uCfLue5FV4peXgKeA+FCh7U=
X-Received: by 2002:a05:6820:3410:20b0:6dd:3534:478f with SMTP id
 006d021491bc7-71ab5096ba1mr2311970eaf.73.1794669420810; 
 Sat, 14 Nov 2026 07:17:00 -0800 (PST)
Received: from [172.31.6.233] ([209.52.143.85])
 by smtp.gmail.com with ESMTPSA id
 006d021491bc7-71ab428b337sm4538815eaf.4.2026.11.14.07.16.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 Nov 2026 07:17:00 -0800 (PST)
Message-ID: <e2560b96-2c36-4e00-8187-308e379ff1dd@linaro.org>
Date: Sat, 14 Nov 2026 08:16:57 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] target/riscv: use gen_goto_tb for vsetvli
To: WX Chen <wxchen0913@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <e54b27f6-7130-475c-b2b6-b7a477de48b3@linaro.org>
 <20261114075803.58854-1-wxchen0913@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20261114075803.58854-1-wxchen0913@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2c;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc2c.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/14/26 00:58, WX Chen wrote:
>> Did you mean TCG_COND_GEU? Surely dst very large results in vlmax.
> 
> Hi Richard,
> 
> Thanks for the review!
> 
> I think TCG_COND_NE is correct here. The `dst` value actually comes
> from the previous `gen_helper_vsetvl(dst, tcg_env, ...);` call.
> 
> According to the definition of the `vsetvli` instruction, it will
> set vl CSR and copy its value to a dst reg. The value of `vl` is determined
> by the relationship between AVL and VLMAX:
> 
> AVL <= VLMAX:
>      VL = AVL
> 
> AVL < (2 * VLMAX):
>      ceil(AVL / 2) ≤ VL ≤ VLMAX
> 
> Otherwise:
>      VL = VLMAX
> 
> So, `dst` here is either equal to VLMAX or smaller than it.
> That's why TCG_COND_NE is used here.
Ok.  I didn't follow the logic outside the patch context.

r~

