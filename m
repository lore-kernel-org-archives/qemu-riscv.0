Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n3OAM-0000ru-Rs
	for mharc-qemu-riscv@gnu.org; Fri, 31 Dec 2021 15:06:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n3OAI-0000mM-5T
 for qemu-riscv@nongnu.org; Fri, 31 Dec 2021 15:06:16 -0500
Received: from [2607:f8b0:4864:20::1036] (port=34556
 helo=mail-pj1-x1036.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n3OAG-0000hg-NT
 for qemu-riscv@nongnu.org; Fri, 31 Dec 2021 15:06:13 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 v13-20020a17090a088d00b001b0e3a74cf7so18261994pjc.1
 for <qemu-riscv@nongnu.org>; Fri, 31 Dec 2021 12:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FuzZSVbhcQ0CA2x3SDM7NGDD6+Kzvi7uwLuUd00z16c=;
 b=Pi5C6WIH+4/ik4DjLqGLBlmp8klPfUWicD3x9v1xTags+kB5y0maqTd2sF2nZx3Kj5
 N8BTDq8QJF4waatiLhVY43h6MQYYmAzq0xJ1IdedKiFvqPCenL0R9J63TGJoluG+1bVM
 0xXuMy3sLsRxdRmPjZPC3kbH/xwFFFjtncnfTGgzBvDuPEZ6XzRiOR8Q7RPkY0bykA8a
 KXZ5nGvJZtuK38Mwy9C7PexJyhDzSKe/5POi8m08eVM0T6BdptqXEPWDcKF1SXQeNe1O
 HDZ/W6ZWR414GhlM4xRqwh3ApqSd9OVBSQmCbu5UdcIVqIf56yDRlyCPpDm0UNj5lV/B
 2xtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FuzZSVbhcQ0CA2x3SDM7NGDD6+Kzvi7uwLuUd00z16c=;
 b=AyV2xsm7ktpdxZpNPEq9yMzVYvM4/i9QxUmpnfmA7zAX/bMvQavUi11tithIiFmmsQ
 VpLW0l+JlKNvuAwxguBJ70EL9CqQQi9R/r1W1/0NASOeAMbhZ2nda32Mn7oeTqoMvbmH
 Z/0Dj6fPuSTuGz0PzdnwtrIrBqm/H6TUZdwv/I3pl7+E0ebkku69s7CL6sF/vHSros3d
 2WxZ4x0MwWQ8/kYxAlzBRDtXDyiy8TdWYiUSDmwp5kbXbbigBf+G1X50ul3btxHN27Pv
 DnrrEoDZ3rcqcPpWNNDAyUkjU99ZJBYxpEgX+lz0MA/llMdK68CTVBb/uLYYenLQoHRt
 eH0A==
X-Gm-Message-State: AOAM530DLiTk+rLrCIg0vH8ncm4L3tf9ybyfzHXHFFNiUAMQs4yVMIqo
 ZH7wz1Nh9DOfeoLigUbxIctAmAxOzGNmEw==
X-Google-Smtp-Source: ABdhPJzb2p0Dxvvjg7zX8OvChwyscUZlWSH6wJVclJgO3IJoPGMYfjFzDw/ffMPB3T4ihL1BdMKS+g==
X-Received: by 2002:a17:90b:4c48:: with SMTP id
 np8mr44667690pjb.51.1640981171484; 
 Fri, 31 Dec 2021 12:06:11 -0800 (PST)
Received: from ?IPv6:2601:1c0:6101:be80:9312:6940:7d21:4efb?
 ([2601:1c0:6101:be80:9312:6940:7d21:4efb])
 by smtp.gmail.com with ESMTPSA id b65sm30275743pfg.209.2021.12.31.12.06.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Dec 2021 12:06:11 -0800 (PST)
Subject: Re: [PATCH v2 3/6] target/riscv: add support for zfinx
To: Weiwei Li <liweiwei@iscas.ac.cn>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, ardxwe@gmail.com
References: <20211231032337.15579-1-liweiwei@iscas.ac.cn>
 <20211231032337.15579-4-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a522f7f6-b6ad-02de-dabc-0511740aef83@linaro.org>
Date: Fri, 31 Dec 2021 12:06:09 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211231032337.15579-4-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1036
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.024,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Fri, 31 Dec 2021 20:06:17 -0000

On 12/30/21 7:23 PM, Weiwei Li wrote:
> +    if (reg_num != 0) {
> +        switch (get_ol(ctx)) {

Oh, you should be using get_xl here and elsewhere in this patch, not get_ol.


r~

