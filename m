Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nyyvy-0004cK-Je
	for mharc-qemu-riscv@gnu.org; Wed, 08 Jun 2022 12:53:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyyvx-0004b6-Gq
 for qemu-riscv@nongnu.org; Wed, 08 Jun 2022 12:53:29 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:33625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyyvi-0000Oo-8p
 for qemu-riscv@nongnu.org; Wed, 08 Jun 2022 12:53:29 -0400
Received: by mail-pf1-x42a.google.com with SMTP id w21so18880497pfc.0
 for <qemu-riscv@nongnu.org>; Wed, 08 Jun 2022 09:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=+58fz43SXUyyc+VnJwcaDad68Lr2mJNR9L1z85R1GzI=;
 b=PN0FD975b3aJMh4XqSOA7SfGmtK2BkXsdsQ2BS6XxyjhuMR2O9zmwzUaVQQZPvGcQu
 ceI6dC2TBGd1z3Cwu0g5HdjRPwB61gNg18jCPsVTnq7jwbEAVS+ouvAwvTJ1g0CIZtGw
 46VI9oZKpGQMH36tOKofR/vrqD3pvo8iHhX6ORKkJt3qrOYnUHI7s8QionR/oYdT5+O+
 JeyD5t1U3xebQsmH/I42sqo6nA4xHa0IpawRSfExSGnebHZVa1kXpeDifPid3etKtB9t
 S1SBk2u5i4cx1Kf616M0/xJFy2TPiTEGP3ZHPukV+VG9i3pvXGylOnOJ+IJdFXX8CYJ1
 f7Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+58fz43SXUyyc+VnJwcaDad68Lr2mJNR9L1z85R1GzI=;
 b=MxAQ4Bk0EKgvy9uEDA+kAHqwDoJVkOBtilgWy3bTuUuli8bYjL/i7KGqAvviOobRAR
 7A+9Y/1JNKeDwS23O3MBA6RIuVuDREyOYSFdRSDqjPaVirTqG0nfLmspejUwzdMMxuJF
 eqjZOG3AKy4SfqFN5iHtLwvDLdd0IeJJwilJxk58R5DR6laFocAXgygsHMYqMExHfMB6
 sqYEqOrcpe3WNORc1pgSe5niDbDplOgRCpKCOK21UHZcBatmJ5RPcDSgblXNNPIpBD15
 A1H+DFC9BR/J64dO4z8YQMTpUZzRHH3phuLdSw9Z9yyWnP/IbJMVhPJrJgEXv2ezQ0+e
 2EKg==
X-Gm-Message-State: AOAM532YYfyQKL7YT1GtG1Z7OLw8rgi7jk95/MQCBwzGpEI3GgIr2ROR
 Q0i7BOwkXZOb5vfjbCxP2nWCkg==
X-Google-Smtp-Source: ABdhPJx8kJGsrQPKHO5LID7SXKhSxLXuzdzAfovVLevpD4tYGaR7JsNkA6XPJlWEc4FqNuMIQxLNVw==
X-Received: by 2002:aa7:88cc:0:b0:51c:319e:772c with SMTP id
 k12-20020aa788cc000000b0051c319e772cmr11195326pff.41.1654707192243; 
 Wed, 08 Jun 2022 09:53:12 -0700 (PDT)
Received: from ?IPV6:2602:ae:1547:e101:6812:d08e:b22c:43d7?
 ([2602:ae:1547:e101:6812:d08e:b22c:43d7])
 by smtp.gmail.com with ESMTPSA id
 v10-20020aa7850a000000b0051868418b06sm13110379pfn.35.2022.06.08.09.53.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jun 2022 09:53:11 -0700 (PDT)
Message-ID: <6455580a-7344-8531-cd2c-708f8ddfb04b@linaro.org>
Date: Wed, 8 Jun 2022 09:53:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v4 4/4] target/riscv: Force disable extensions if priv
 spec version does not match
Content-Language: en-US
To: Anup Patel <apatel@ventanamicro.com>,
 Peter Maydell <peter.maydell@linaro.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
References: <20220608161405.729964-1-apatel@ventanamicro.com>
 <20220608161405.729964-5-apatel@ventanamicro.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220608161405.729964-5-apatel@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
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
X-List-Received-Date: Wed, 08 Jun 2022 16:53:30 -0000

On 6/8/22 09:14, Anup Patel wrote:
> +    struct isa_ext_data isa_edata_arr[] = {

static const?


r~

