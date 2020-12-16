Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kpYWS-0000nH-Si
	for mharc-qemu-riscv@gnu.org; Wed, 16 Dec 2020 10:15:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpYWN-0000jC-7w
 for qemu-riscv@nongnu.org; Wed, 16 Dec 2020 10:15:19 -0500
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231]:43154)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpYWJ-0003Tx-BQ
 for qemu-riscv@nongnu.org; Wed, 16 Dec 2020 10:15:18 -0500
Received: by mail-oi1-x231.google.com with SMTP id q25so27823334oij.10
 for <qemu-riscv@nongnu.org>; Wed, 16 Dec 2020 07:15:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QXN6MjN8Ea2iNpDuLmu/O57nxAWwa8JZF33A19pTEZQ=;
 b=N2NP7fe3W12zw5MSm/4M47qXaG4ChsJslBglVbVObvDEQrIajjb7oihQuxe1cgo8HM
 4qErdxWAeUqTrHwcPrpCpBhyq/Nmu3UfceRCrM7d7VxyxveL8z34BO5ABuU3KSkmU7Gs
 5J1Asp9VTjdJdDWhnGV+yL2olFhijOF/yKKZr/X9Uhgbl8cN4ezsbwRX+uGCbn2JQgWQ
 a84DjbemWgOzmm69B/uDmrtQ1wHf/ftFnQTOVGD/yL5VAnBR6nftn9hpW/aS/Tp6U3Nm
 EV1ilQBzKVw8/GNy9AhE3m+laWnYwLcy7o0fZ0MF4weq9K0R5PRAj6P6UfCKgaK+5Zso
 vMMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QXN6MjN8Ea2iNpDuLmu/O57nxAWwa8JZF33A19pTEZQ=;
 b=Hy43zGzo3xghBpgWo4vLtkBGTQOxwjw/cjyawrVodW4DGW2ADvPyilkG7DsutuYmhL
 eBPQjEeMhVsi9fWBXngt/4sz41bYK4mPGmARq9sQcnkCCYWRIT0Rdz2PQSR03p7S5Pzp
 gpHYqSo1WYqL5DBKpIQvcDaa2fnSCk4RkH/Edx755eG/Heo8kVgzkYZ6ttp3JLXCRmg9
 VFH9eT2rgFZ3kagRM6diy5/zY9WguvJlE0ZfizCCU4VVEpNE0lAVRwpVL+OERw0xe1yx
 2BNMy17w7WbGc87KTa2Qaz/9WSAWwEcoI87c/ggFCMsLzJlY03sahDlX4XCbiQRov5TR
 j7Zw==
X-Gm-Message-State: AOAM530nd3Fn/BcR7t4fgVBwYHY/QtkqBN7vAJfXsdilUTi0HPUB+1S9
 f1jbM8cdbHgpRNgnCC7cpI/AXw==
X-Google-Smtp-Source: ABdhPJxztdjWvQcqH3qDDgsYDRb/ksyUwGGrou8BbUiYcma0FswXdGtNsC2gRZ0kPjBTRK2OpShqNw==
X-Received: by 2002:aca:4b16:: with SMTP id y22mr2264426oia.148.1608131714038; 
 Wed, 16 Dec 2020 07:15:14 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id t24sm578851oou.4.2020.12.16.07.15.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Dec 2020 07:15:13 -0800 (PST)
Subject: Re: [RFC v2 01/15] target/riscv: reformat @sh format encoding for
 B-extension
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Kito Cheng <kito.cheng@sifive.com>
References: <20201216020150.3157-1-frank.chang@sifive.com>
 <20201216020150.3157-2-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e8de8cf1-b888-79e1-93ba-7c157b012930@linaro.org>
Date: Wed, 16 Dec 2020 09:15:11 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201216020150.3157-2-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x231.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Wed, 16 Dec 2020 15:15:19 -0000

On 12/15/20 8:01 PM, frank.chang@sifive.com wrote:
> From: Kito Cheng <kito.cheng@sifive.com>
> 
> Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/insn32.decode | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

