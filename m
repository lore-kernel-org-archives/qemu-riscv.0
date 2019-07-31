Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hssW5-0003Ew-TV
	for mharc-qemu-riscv@gnu.org; Wed, 31 Jul 2019 13:35:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36971)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hssW3-0003EY-Qy
 for qemu-riscv@nongnu.org; Wed, 31 Jul 2019 13:35:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hssW2-00079K-Sg
 for qemu-riscv@nongnu.org; Wed, 31 Jul 2019 13:35:55 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:35980)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hssW2-00078j-LO
 for qemu-riscv@nongnu.org; Wed, 31 Jul 2019 13:35:54 -0400
Received: by mail-pf1-x444.google.com with SMTP id r7so32266632pfl.3
 for <qemu-riscv@nongnu.org>; Wed, 31 Jul 2019 10:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JprkFZG+B7lsQyizGQWAjBZCNRt08yRpbp4jzY2Xmw8=;
 b=A+OiYnMyEJiJgxJajenHptTJyg9iXXiPXxKNnKx1J1qXjv8RBwpV2MSJHNwvdux6Er
 3swA6XW+h1AJIGEH5KrBeifG3XGCt4gIpzku+dSCKTIjIlo3s6rV1dIg0hF2ZsdceNAn
 VCDZmVm/GmxyA2bUnhsU+nWLSZPLfBY/YAFQWB2m9p6iYgOu/3j96LdYnLLUyTQU89OP
 ME1GFFG2ITks3MqXa6zRlK6rkVEmiH2kvC+KmTAO6cmjQHSWX3c1vpgXPdho3wc2X96b
 gq67UWKXq0fFEx+oMtT+1msReMOAmyAChwHE4ZfXLpXhAlAvCGK99FHtajRXQ1glwzf4
 q64g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JprkFZG+B7lsQyizGQWAjBZCNRt08yRpbp4jzY2Xmw8=;
 b=GiJFdbxwy9EqgFhBqSkAC0AVc9Myp2l/J9lb6ZlezE2xZ6T58MGcIAdXuVymCZLz2G
 yt/UuqG7cKnerWJo7H6AYDjO/9/DcrcfvVIIJZt1qgDmn52Am+w+Uzqv0tCMMQnmHQSP
 qE6HZ+kBnHRTvKSG36qXXs9WPOGaiDo7PauwrsUY2TEsTpv7US7H5Y+bKGek1iWNUWTG
 JGDHPzRyzd2pJmdXZlyF7ajyd5f2tZLs7WxFG/PJOj1y6lb6CDMsBJX06Vs6P5JMvXMx
 mJnowLe2tAY5NfCABgL+bHRrj6CYxyRlMgcEdCGHv16PO0kjVucKyClldEThyUWtMLqj
 MD9A==
X-Gm-Message-State: APjAAAX2bzoXs1zZw/ugUiWpppUxQhGwno05FHnLiLQLEBE6oeqzUNUy
 dectv7SLXbpWeMce770rW6+dZ/giinU=
X-Google-Smtp-Source: APXvYqxYERyQfQCpRFNnk7YcRP24HtAq0RkMTNUCFiGZ/xjUV1rhsm0cKWFyoIf9EasFiz2BtZNjyg==
X-Received: by 2002:a63:d23:: with SMTP id c35mr114266663pgl.376.1564594552770; 
 Wed, 31 Jul 2019 10:35:52 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id j5sm60150622pgp.59.2019.07.31.10.35.51
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 31 Jul 2019 10:35:51 -0700 (PDT)
To: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis
 <Alistair.Francis@wdc.com>, Palmer Dabbelt <palmer@sifive.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 QEMU devel <qemu-devel@nongnu.org>, QEMU riscv <qemu-riscv@nongnu.org>
References: <1564577101-29020-1-git-send-email-bmeng.cn@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <581a0284-c658-265f-1b0f-6f4be5406cee@linaro.org>
Date: Wed, 31 Jul 2019 10:35:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1564577101-29020-1-git-send-email-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::444
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH] riscv: rv32: Root page table
 address can be larger than 32-bit
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 31 Jul 2019 17:35:56 -0000

On 7/31/19 5:45 AM, Bin Meng wrote:
> -    target_ulong base;
> +    hwaddr base;
...
> -        target_ulong pte_addr = base + idx * ptesize;
> +        hwaddr pte_addr = base + idx * ptesize;

I believe that you either need

    base + (hwaddr)idx * ptesize

or change the type of idx to hwaddr above.

Otherwise the multiply overflows before it gets promoted with the add.


r~

