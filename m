Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1irOQq-0001fF-8u
	for mharc-qemu-riscv@gnu.org; Tue, 14 Jan 2020 10:48:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45751)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1irOQn-0001d0-5G
 for qemu-riscv@nongnu.org; Tue, 14 Jan 2020 10:48:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1irOQm-0004r4-5D
 for qemu-riscv@nongnu.org; Tue, 14 Jan 2020 10:48:37 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:39101)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1irOQl-0004pc-VR
 for qemu-riscv@nongnu.org; Tue, 14 Jan 2020 10:48:36 -0500
Received: by mail-pg1-x532.google.com with SMTP id b137so6570617pga.6
 for <qemu-riscv@nongnu.org>; Tue, 14 Jan 2020 07:48:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=AOnGMNKFHNkSKQ3aU1D5WOp68/Etcml3eqjqkGkHH/0=;
 b=IQ0kzFcL5HjLsbhccanDtswrS879Tss11AMlegr6EqpycAdwO2bHv/mGaYdaNBnfO7
 500fFQbmyfr8OeZCo1RXO7O5vcM7Kh8Hd8iB4szTImvaTMKzkEHestNU+rHM8DEnh9Zy
 iWetEKYCKN0mvx73TepHc0waIb4mk09CKMQZsn16VndNoOW2Keg5GktOvzWqjyB7fycc
 m44eo2ybaZEcrYStgqrGDVtETZpec29aIXvh64+vxCxQnM4s2HbQorJLr0HQvrSYAoLD
 3RCMeMEj6dH60Wkbff4pjJWkDZToY0xVhO4DTzfsQ984NMpfz/1ZIKQBPcr9mirnIZK5
 7yMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AOnGMNKFHNkSKQ3aU1D5WOp68/Etcml3eqjqkGkHH/0=;
 b=Ck8xfCk7gCXTGsxhKjMNpGHnHwdY/xF9Y8b3zI1geyOb7K8k3Mx0YL2l3qf8igRNlI
 AhETHaPVZ8A8R5ZyXO5Q7mktH0dTd4l52ryhzE3Iyo2aYCi8jJUUX9FL7lJuemJAXGKK
 gIW98CH3p3mtIxjtiNJkqCEICYROmdy4MlmlWJgHsyRcM5u9yr7FpWUKG9LTpvnPMQ0j
 CcoXoKWz3LM96ZYui8MQIH+0Fk0rnUd7CJQCuXwcR+tplyd6UeP4OYij34JqGKLhrlNp
 kgNXLE746Cl/EXDcfI1Dqr7AEAboJLoatPrcK9DVx1oxFdiGuUr8btbGYVxFF1EApBy+
 E5hw==
X-Gm-Message-State: APjAAAUa2MLCYu21Kl19IXoiMWdeg5YfWTm3b1yOoUfrKMbAKdM4rEJb
 8JsisWdlToQwh6BWlh1v8ObcyA==
X-Google-Smtp-Source: APXvYqwLeoabO+vpym5fsrslCI8xQioJghsBd9J3riqFoPqNDRV9fViHR2LFRRe0N/t43KitY8CfvA==
X-Received: by 2002:a63:7985:: with SMTP id
 u127mr27155097pgc.169.1579016914890; 
 Tue, 14 Jan 2020 07:48:34 -0800 (PST)
Received: from [192.168.3.43] (rrcs-66-91-136-155.west.biz.rr.com.
 [66.91.136.155])
 by smtp.gmail.com with ESMTPSA id q22sm19131473pfg.170.2020.01.14.07.48.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jan 2020 07:48:34 -0800 (PST)
Subject: Re: [PATCH v2 2/3] target/riscv: fsd/fsw doesn't dirty FP state
To: shihpo.hung@sifive.com, qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
References: <1578996840-14863-1-git-send-email-shihpo.hung@sifive.com>
 <1578996840-14863-2-git-send-email-shihpo.hung@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9a94696f-832b-2870-644e-e1859313bf42@linaro.org>
Date: Tue, 14 Jan 2020 05:48:30 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <1578996840-14863-2-git-send-email-shihpo.hung@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::532
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
X-List-Received-Date: Tue, 14 Jan 2020 15:48:38 -0000

On 1/14/20 12:13 AM, shihpo.hung@sifive.com wrote:
> Signed-off-by: ShihPo Hung <shihpo.hung@sifive.com>
> ---
>  target/riscv/insn_trans/trans_rvd.inc.c | 1 -
>  target/riscv/insn_trans/trans_rvf.inc.c | 1 -
>  2 files changed, 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

