Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7729EB64DA
	for <qemu-riscv@archiver.kernel.org>; Fri, 14 Jul 2023 06:31:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qKCKb-0006de-Hz; Fri, 14 Jul 2023 02:31:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qKCKQ-0006cE-Vh
 for qemu-riscv@nongnu.org; Fri, 14 Jul 2023 02:31:02 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qKCKL-00072m-3z
 for qemu-riscv@nongnu.org; Fri, 14 Jul 2023 02:30:57 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1b8b2b60731so8110805ad.2
 for <qemu-riscv@nongnu.org>; Thu, 13 Jul 2023 23:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689316251; x=1691908251;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6J5Db53f6xjvipUdL8t6sRYWt+uYG1taHQ91KoD9xCw=;
 b=eeHdVOkHr0dxq26I1RFQt/ekAYMMx4qQmOxFBeKFX6OVEMY5B7PirckhAP8pVvAn7/
 FJB5ogOImosAXeI2S2qjMrgQ3mS7Ks8wa36Qa+0mWHC63d2d8LF9NScIoKC0Lec8piU1
 m3IauvCdvy8Onh/Wk+V9kO0nraRCScMMq739Zl/F2duI0EFd+kkQaKiIc+zj6bpWyR2O
 p7ZGUfX1F4t6DGmuX77oN4hLWPq3sy//7AMdZJroh6us6xyd0DwZ514k7MC1gOfhZwRE
 +laV9yeu8xokarPoJQx+aWEkoE96LnxGbCGoubRCD9jv3HIeXpvMBGi1GQSLqRXUvO3+
 L0uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689316251; x=1691908251;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6J5Db53f6xjvipUdL8t6sRYWt+uYG1taHQ91KoD9xCw=;
 b=ZHapskp3ohjiEbz/OyYsrzOsqKAfyH8hE9qxJIt/jDVwSADPisy/nWQVnlVLHzmi1U
 HNz4P4F8ibIdPAUo1XDOpc2IOgX+z6rBJBupCsc0k8E7v0tMxZMnzaoUuDSTfdF1BlNU
 kNwikIHQdUIzmx0asfIcSlxMf9HhY/Q1/6ZiNE2dNTrCzQRogNphesv9iG/3RRbTvEeA
 j47K8Tkah7typmT2kIjiNB1eDh9X8DNiTrGgaLSzeKtEoPWeCDRrZ2+omHCd0Kw1Mh9u
 exCDFzavsTUqlp3KoogbM4a1uV7KpPZPjRUsXmxfviL4wyHl6DOO8ENWHDZTeV8ot4Ow
 e/Uw==
X-Gm-Message-State: ABy/qLayqQfmXks0wpCf3wikfmL4s8dvX0slJKQoU/PKXps+45Brv4dh
 w+RwdX826wr0h5dVMwExQhcypw==
X-Google-Smtp-Source: APBJJlF4PF+9OlQdkKC3Z8Iwf8xJH6oSGgYsSV2Gp36CCytcJ+Xo/naQcY61aefm4Nrb6R9my+pMMA==
X-Received: by 2002:a17:902:788d:b0:1a9:40d5:b0ae with SMTP id
 q13-20020a170902788d00b001a940d5b0aemr2580310pll.12.1689316251505; 
 Thu, 13 Jul 2023 23:30:51 -0700 (PDT)
Received: from [192.168.149.227] ([172.58.27.104])
 by smtp.gmail.com with ESMTPSA id
 c10-20020a1709029d8a00b001b83db0bcf2sm6932354plq.141.2023.07.13.23.30.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jul 2023 23:30:50 -0700 (PDT)
Message-ID: <ca3da84b-2e4c-ad27-09fc-58aab4a7f39e@linaro.org>
Date: Fri, 14 Jul 2023 07:30:43 +0100
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
 <9626ed95-9d50-344b-696a-95998e98e3f4@linaro.org>
 <f26e3e23-6c15-9d8d-5750-37d43275a87a@ventanamicro.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <f26e3e23-6c15-9d8d-5750-37d43275a87a@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.096,
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

On 7/13/23 22:27, Daniel Henrique Barboza wrote:
> 
> 
> On 7/13/23 17:40, Richard Henderson wrote:
>> On 7/12/23 21:57, Daniel Henrique Barboza wrote:
>>> +#define ADD_CPU_PROPERTIES_ARRAY(_dev, _array) \
>>> +    for (prop = _array; prop && prop->name; prop++) { \
>>> +        qdev_property_add_static(_dev, prop); \
>>> +    } \
>>
>> do { } while(0)
>>
>> Watch the \ on the last line of the macro.
>> Declare the iterator within the macro, rather than use one defined in the outer scope.
> 
> Like this?
> 
> #define ADD_CPU_PROPERTIES_ARRAY(_dev, _array) \
>      do { \
>          Property *prop; \
>          for (prop = _array; prop && prop->name; prop++) { \
>              qdev_property_add_static(_dev, prop); \
>          } \
>      } while(0)

Yes, like that, thanks.


r~

