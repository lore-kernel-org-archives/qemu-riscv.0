Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n1F6D-0002sC-2a
	for mharc-qemu-riscv@gnu.org; Sat, 25 Dec 2021 17:01:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n1F5q-0002I1-1k
 for qemu-riscv@nongnu.org; Sat, 25 Dec 2021 17:00:50 -0500
Received: from [2607:f8b0:4864:20::435] (port=36359
 helo=mail-pf1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n1F5m-0007xk-Lk
 for qemu-riscv@nongnu.org; Sat, 25 Dec 2021 17:00:45 -0500
Received: by mail-pf1-x435.google.com with SMTP id v13so10411185pfi.3
 for <qemu-riscv@nongnu.org>; Sat, 25 Dec 2021 14:00:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=huojoUY6Ut1L3Ad37ePmEFVp69bi+GgWjz+LBsWI8I4=;
 b=rG+QkeLACkFycXwmZ5gZsUUhOQ2vo8/N+jGlESo/TA+K7euFt/wx6gejtG/8EFBFFX
 tdLWDukH1kSvYGafxWHM9ORtGWJCy7TOtuxg2m8A2Nzt4M2e6bAMkK8m0qhPPDObMreX
 6Lg1DekmCOss6wyFNVNRDH4IpxQxSJ4VCMKJAYwKxd9AZDTvnhnTC9lmgMfVuxyn4xBV
 6Toqq0gIKTOXlKVN9UAPdgCbF5kffYZGPS3+MviVRX+5g1M8p0xzGpFz07/npPyApWP9
 reHFJjPP/G94/9JJM7QVfD1K3eaUmDs1XJdWXzol9RwhiPwJYyQx72g4HeFztC3ERhM1
 W+9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=huojoUY6Ut1L3Ad37ePmEFVp69bi+GgWjz+LBsWI8I4=;
 b=nLmj0d6TrgydgA8lCvT3IvUmpGauFfTrQiW+2XjGCYLQo5L/oDSB238llJVnmIfWUC
 uH/DL6jWQBoB2uK5Y8znyQLmEUd8j92khLM9BH90XkRuHToaS3vPrwj+Oq2wAhmfxxp7
 uqageBRxKmAvznYfbfCKILuvr0+U5o+83mR2+7HtJZOxWpsTTQlRjN6Z87pJukju7LrF
 LxLjy3U3/4rSvhXjzWXw/vhn0qV0UDPjkaVisVB8PQwM6BWY4IQwXjct6sEq5vU9Ymwt
 Yj+gmTfDkfKBmjMSiKzTWCPcggW3ap7lXdEcQYE5fWMaqes4fI1UyTfmJfw8IAQF0Av4
 0z7w==
X-Gm-Message-State: AOAM533fZe8P79Ag1YCOGB7hKKcUHTkLUWV+8WliaHlyB7EKWta9d91y
 3WT1afkQyTXZXLJYwvai8s7odQ==
X-Google-Smtp-Source: ABdhPJyBrzkTXsAt6/bxvyH0Tl1viRjUYGyzfh69C/tpIJ/k7V0xHFxGrnjd0OK3bZ7vbUTNuVTkMw==
X-Received: by 2002:a65:5547:: with SMTP id t7mr10700549pgr.510.1640469632299; 
 Sat, 25 Dec 2021 14:00:32 -0800 (PST)
Received: from [172.20.100.20] ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id u3sm12977478pfk.82.2021.12.25.14.00.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Dec 2021 14:00:31 -0800 (PST)
Subject: Re: [PATCH 2/6] target/riscv: add support for unique fpr read/write
 with support for zfinx
To: liweiwei <liweiwei@iscas.ac.cn>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, ardxwe@gmail.com
References: <20211224034915.17204-1-liweiwei@iscas.ac.cn>
 <20211224034915.17204-3-liweiwei@iscas.ac.cn>
 <ec5adcb4-3090-50e2-4981-38149e120249@linaro.org>
 <2acd9ead-d9e8-46be-b306-2aa26ced06b5@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <be0bf212-5200-2f25-8b9e-5f7fe2941ccd@linaro.org>
Date: Sat, 25 Dec 2021 14:00:29 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <2acd9ead-d9e8-46be-b306-2aa26ced06b5@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::435
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.196,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Sat, 25 Dec 2021 22:00:51 -0000

On 12/24/21 7:13 PM, liweiwei wrote:
> In RV64 case, this should be nan-boxing value( upper bits are all ones).  However, zfinx 
> will not check nan-boxing of source, the upper 32 bits have no effect on the final result. 
> So I think both zero-extended or sign-extended are OK.

There is no nanboxing in zfinx at all -- values are sign-extended.


r~

