Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 705ADC282EC
	for <qemu-riscv@archiver.kernel.org>; Fri, 14 Mar 2025 18:40:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tt9wv-00048q-RQ; Fri, 14 Mar 2025 14:40:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1tt9wb-000428-9T
 for qemu-riscv@nongnu.org; Fri, 14 Mar 2025 14:39:46 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1tt9wY-0008FH-8A
 for qemu-riscv@nongnu.org; Fri, 14 Mar 2025 14:39:40 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-2fecba90cc3so71398a91.2
 for <qemu-riscv@nongnu.org>; Fri, 14 Mar 2025 11:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741977575; x=1742582375; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fOozeBnii/eu0U/Pc7KwHCWiz8f0qLLsCP/hc4MPynk=;
 b=kt+VaxkwBs9JZYf1h42qxj/cixdRyn58YJXXABCpuLEMQfXARMfYxPvYWhegj23g6i
 xRfAXmrXhy6znXZ4kHB8TuBmUzrBG6gdgJBbmOov/WLMz528k2mixFscqdZ1I57nVnZB
 xmyFVqlMIVaemvhu+2YXo6k03eJkiecuwOwrTVS4+cUW6Zby4Yu5OQ9bjHSglbkXY9vb
 8yB166NelkXoJMniNbHsEoOEMSVjlTqgRHBSeiPuKKsW7fbfEImFi788MWwPrHO5tEDV
 JjH7Rc4ppB+yjIdGCl9vRSjKC+uJg5TUeQqwVfKpC5f3RBkqZWMDjCdmoyluMepfCt/2
 /p2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741977575; x=1742582375;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fOozeBnii/eu0U/Pc7KwHCWiz8f0qLLsCP/hc4MPynk=;
 b=EN5rNODlQAlqXf/UPn0xy4oEdLiEBSK3l87zxdXn2ujpNivFSMz/TCFGPLAzgPKE+b
 mkXkKWvQF/5MBWXV7FMDdHDGsvGVVZJAg2tkdkOehCQ3rZJdtRXmMl6jtRGiOwFTZKjy
 282O6bXx3szhfvcYuaKORJAftbQDUzlZcPAS+DfOM/z9Rue8k20Y2a6Op7AKaB3iyR5Q
 5FNac7iwFhrF9K2gZF62b9A5XDv252bBEZ+gy5RaDgavZKgqEKe5WHCpyV7jO6EiS/Xj
 Mf10QjH2KsUOub9RCaWCMMOB73PcQwdGoqe1Qnte3DKEV5I5FNKVLQhqN+ZIVGZ/bnv4
 jWRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpH4oW3n91UbKnxX3k4qxs1XnYO8e9VU8fM9eCBj2/hU8ytT0gNdX4eZEx4Vj64s8aOzthZImQkwTH@nongnu.org
X-Gm-Message-State: AOJu0YwAhDNngRfntYSevET8meTKlS16z3RZ37gwbQbON3X9I5MIuurK
 2zTlIZ03+rLux4HJ30KIvTIKlUhlmHFpuj6BIUqygF7uVqX/Mg05fjLP3hFJu6E=
X-Gm-Gg: ASbGncsW8RzH0Yq0YT1Y1LGJCEIiG5Zoja7qgT4mS9pK0nDTSGA6IYmIip7PyampKZo
 mAwY+Ln4C4meVEA23ORPQ+dF2bbWGOat31QTlSR9/52ua+rkasE/RgE/Sn6PxStRU+acwnsvORD
 qgc1JBhPr1KN76xlc+0aynCdg2hrVMKLAEXmGKzInLWsp7qs6TJe7s/iqDjQtyIgmMJ9Er6eTFK
 7uUHbTPuSPXnR1+xbvJVZGDMY6NrEwoRt2BcjN+szNdSeN9egLy1Um6FuWZDBLLQhDtXAT6+Rmv
 FPK75l+EeWU8+yuOGR3Dn6NdGymWOUAbvKNc6AXSc8hBLwytjBxhZOg6lQ==
X-Google-Smtp-Source: AGHT+IHy4R1pysrhxzZHf8PsIff+cJIi5Kt3lbwGj1TI7jFN2ZmDtBraZqUWWgeIc5QjfTBBwo1w6Q==
X-Received: by 2002:a05:6a21:6d82:b0:1f5:8eec:e50a with SMTP id
 adf61e73a8af0-1f5c12c7864mr4910034637.31.1741977574981; 
 Fri, 14 Mar 2025 11:39:34 -0700 (PDT)
Received: from [192.168.1.67] ([38.39.164.180])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af56ea7bd0csm3027381a12.47.2025.03.14.11.39.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Mar 2025 11:39:34 -0700 (PDT)
Message-ID: <ee814e2f-c461-4cc2-889d-16bb2df44fdf@linaro.org>
Date: Fri, 14 Mar 2025 11:39:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/17] make system memory API available for common code
Content-Language: en-US
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Paul Durrant <paul@xen.org>,
 Peter Xu <peterx@redhat.com>, alex.bennee@linaro.org,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-riscv@nongnu.org,
 manos.pitsidianakis@linaro.org, Palmer Dabbelt <palmer@dabbelt.com>,
 kvm@vger.kernel.org, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Weiwei Li <liwei1518@gmail.com>
References: <20250314173139.2122904-1-pierrick.bouvier@linaro.org>
 <5951f731-b936-42eb-b3ff-bc66ef9c9414@linaro.org> <Z9R2mjfaNcsSuQWq@l14>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <Z9R2mjfaNcsSuQWq@l14>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x102a.google.com
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

On 3/14/25 11:34, Anthony PERARD wrote:
> On Fri, Mar 14, 2025 at 10:33:08AM -0700, Pierrick Bouvier wrote:
>> Hi,
>>
>> one patch is missing review:
>> [PATCH v5 12/17] hw/xen: add stubs for various functions.
> 
> My "Acked-by" wasn't enough? Feel free try change it to "Reviewed-by"
> instead.
> 

Those are differents. From what I understand, Reviewed implies Acked, 
but the opposite is not true. If it was, they would be equivalent.
Thanks.

> Cheers,
> 


