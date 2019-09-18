Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iAPVX-0000hQ-5k
	for mharc-qemu-riscv@gnu.org; Tue, 17 Sep 2019 22:15:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39529)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iAPVU-0000gP-6K
 for qemu-riscv@nongnu.org; Tue, 17 Sep 2019 22:15:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iAPVS-0002z6-St
 for qemu-riscv@nongnu.org; Tue, 17 Sep 2019 22:15:47 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:46550)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iAPVS-0002yY-Lf
 for qemu-riscv@nongnu.org; Tue, 17 Sep 2019 22:15:46 -0400
Received: by mail-pl1-x644.google.com with SMTP id q24so2358618plr.13
 for <qemu-riscv@nongnu.org>; Tue, 17 Sep 2019 19:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=j5Qdb4MVg4K9KoBnRSLFjcWGZY7Kl5JniJEtWO44C8s=;
 b=pxNdq4ZN7lvRqSihs8FpZKRPkV6CpL3mmPvC44ULQzVNsnhr28Ix6H/KyKUq5uCphm
 OEOGpVdONFggB0kshy8Cf3sT305lR64E2lQQqW5U0j+VlxZHF3OQg3IKJw8UZI+1f3LT
 BqOkFaCN2GnjVSYfLI+MEHwD29Hdj5/UFnggj5JnvnC3aTI10/vMidiiD2n9Wk7yKndV
 5E+v0h60Ev08tAtvYd4v5C6g1M9jkshqmXM4ujd3OyigAYCv06IBlziWTzp0Sz54g6N9
 lD3PubhRbo84ni0K1VfMpHKo5oNbYUTezEdPJY67XIA3uJKGKSO4FxJM8yCa61t8f2fu
 BXLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=j5Qdb4MVg4K9KoBnRSLFjcWGZY7Kl5JniJEtWO44C8s=;
 b=Z+9+HD9+Kxnid7YZad/uHARU79if9KIRSOXAEt7VO1/DRvr0KKe9lbjoJfhrVFFBdZ
 KclKnPTE60HQQzLB0MVe9joVM6NxSyA4HrSXkq5rXCiHGnZIwGgb8HY8cbf1DSCSVeBM
 01JX1W7n9xwKJ5Wk1/loBpQKs5TpaLPFoPsmqQMIIxVeY3MUzmCkHiOXljn2tDm0Nsue
 Cc/C7YW8lLmXguxomtvRFy4C3Ie4taNRC334wHbAUigyQdbMok4T/sOj6kv9RCmPFoBb
 esoW0QKTGyj+tZQ7wqLodTlIeny8jLlu76MdryzLCX6g4TBb2FjobPvJ11onWfcuXAli
 Zl1Q==
X-Gm-Message-State: APjAAAVqjApCHbXBjSx/O1JilB3kDnoN/8yk+WdH1+O7jX+IuNJPvkcM
 5WGrFfZ2C+b1EKuBXOq8VtTk9w==
X-Google-Smtp-Source: APXvYqxDw8ItyD4mbkSpwjK4/aE51dhapmiI8FW7RgcAgcajSiDUaTX3PrJe4ZP89IJUtPFglEFuyw==
X-Received: by 2002:a17:902:d685:: with SMTP id
 v5mr1728593ply.15.1568772945061; 
 Tue, 17 Sep 2019 19:15:45 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id k1sm4112442pfi.132.2019.09.17.19.15.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 17 Sep 2019 19:15:44 -0700 (PDT)
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: peter.maydell@linaro.org, palmer@sifive.com, alistair23@gmail.com
References: <cover.1568762497.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <d9e037ec-828a-29df-de8d-723198cd96ff@linaro.org>
Date: Tue, 17 Sep 2019 19:15:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <cover.1568762497.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::644
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v1 0/2] RISC-V: Convert to
 do_transaction_failed hook
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
X-List-Received-Date: Wed, 18 Sep 2019 02:15:49 -0000

On 9/17/19 4:22 PM, Alistair Francis wrote:
> Palmer Dabbelt (2):
>   RISC-V: Handle bus errors in the page table walker
>   RISC-V: Implement cpu_do_transaction_failed

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

