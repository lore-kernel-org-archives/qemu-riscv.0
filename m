Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BD53C0015E
	for <qemu-riscv@archiver.kernel.org>; Thu, 13 Jul 2023 20:41:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qK37d-0003T9-5v; Thu, 13 Jul 2023 16:41:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qK37b-0003Ra-MA
 for qemu-riscv@nongnu.org; Thu, 13 Jul 2023 16:41:07 -0400
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qK37Y-0001cO-QV
 for qemu-riscv@nongnu.org; Thu, 13 Jul 2023 16:41:07 -0400
Received: by mail-ot1-x331.google.com with SMTP id
 46e09a7af769-6b867acbf6dso1433638a34.0
 for <qemu-riscv@nongnu.org>; Thu, 13 Jul 2023 13:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689280863; x=1691872863;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3ZHe1yZhpHWI9L1W76hCRW8ggK8BpUEE980E6SLbHhk=;
 b=QiGD0oDM42MHxy+LD9KwHYGRDajaLAUvVPBSebzmSG/+A2pHTCD18//EKRMq6YsW6q
 bx+Tpsth4hNKpz/jLruy8El47ZoyVqjNY22D8xs/W9U4PmLZiU6csIeOvKFY+mrxR4aT
 pl1LTAfKVBDc8++vKeNBRZWBJ9jzOeETfa7U0cCQ3IJCNkGLIXWV0jBdKdGivUe6zQmr
 pLd+fUm1FY7ALcUDdaArFgvJesRlU7Rb3ehYsiqLWvpJQnMtFuMSrxh4NZH+a/FscGYn
 +E1HXnhp3/qDg5u6eYjTw3ZUIFRlXRle9nwDhg2GHuDcN/ItrWMS81m10Eoqm5zluDwo
 VQ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689280863; x=1691872863;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3ZHe1yZhpHWI9L1W76hCRW8ggK8BpUEE980E6SLbHhk=;
 b=ksMtAFbcug0+gLmr5jfjnx2j0wax2r/9M/7N95gVRHnOIayumEgSQ0GT/JPiC47ce4
 rqqycXIi0A6eKUHIaFpMKPBh97LVYMB+Jt45StnmEV1fn+bZgFPWJHwEUwSslu5ggqzu
 /5/bxXldXQ0EI8Sy0icfvhL65zaA/IqomYHfNIGzyKer+oEZ53g7G1TKueUln+w1wQSS
 ePwFjT7jcHYzfWZ9rqGwZr6bEwsrDx/EvkSC3GHMPY2pjDW9tkN4i8qqmFzzNCowc/5E
 iR/q5SLCck3Mp6cvanWEnZKGSgHiiQZfpQuFh6zcID3RZBXBQZp5lk8Sd0DD8G+PBfiP
 PGtA==
X-Gm-Message-State: ABy/qLbn3REkVIX8LyEFGu90kr6AXTvcX/vvup1ZK+d++iBIUDVo5g7o
 sL2RcRy+CEFSy4RYofnifevPOQ==
X-Google-Smtp-Source: APBJJlG5XGIPjZ1coj2+OI59u+rAhwU8nGUBHx4xa8kPskPTrRBo1gnL+buD/UNwfIfYNQClSvYufw==
X-Received: by 2002:a05:6830:4612:b0:6b8:b83c:a1f8 with SMTP id
 ba18-20020a056830461200b006b8b83ca1f8mr387547otb.19.1689280863291; 
 Thu, 13 Jul 2023 13:41:03 -0700 (PDT)
Received: from [192.168.88.227] ([172.58.109.82])
 by smtp.gmail.com with ESMTPSA id
 g13-20020a056830160d00b006b93c6c97basm3285447otr.44.2023.07.13.13.41.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jul 2023 13:41:02 -0700 (PDT)
Message-ID: <9626ed95-9d50-344b-696a-95998e98e3f4@linaro.org>
Date: Thu, 13 Jul 2023 21:40:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH for-8.2 v2 5/7] target/riscv/cpu.c: add a
 ADD_CPU_PROPERTIES_ARRAY() macro
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
References: <20230712205748.446931-1-dbarboza@ventanamicro.com>
 <20230712205748.446931-6-dbarboza@ventanamicro.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230712205748.446931-6-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::331;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x331.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.096,
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

On 7/12/23 21:57, Daniel Henrique Barboza wrote:
> +#define ADD_CPU_PROPERTIES_ARRAY(_dev, _array) \
> +    for (prop = _array; prop && prop->name; prop++) { \
> +        qdev_property_add_static(_dev, prop); \
> +    } \

do { } while(0)

Watch the \ on the last line of the macro.
Declare the iterator within the macro, rather than use one defined in the outer scope.
Why not use ARRAY_SIZE?


r~

