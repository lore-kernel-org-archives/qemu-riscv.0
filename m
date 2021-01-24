Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l3j9Q-0003Qd-Kj
	for mharc-qemu-riscv@gnu.org; Sun, 24 Jan 2021 12:26:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l3j9P-0003QK-Rf; Sun, 24 Jan 2021 12:26:11 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:34523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l3j9O-0004uJ-BY; Sun, 24 Jan 2021 12:26:11 -0500
Received: by mail-wm1-x332.google.com with SMTP id o10so9301381wmc.1;
 Sun, 24 Jan 2021 09:26:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=W8MMeSQ8q9L8iyYg2f4t6l4U5l8fjW6EZGzgFKN/23k=;
 b=E3xPqF2lfwBZuP5LClcN3veIJ1RyjvM/mBnHH/inBvTBfvzEoEAgfQf1zOPAvhtfMO
 E7Rr+bqLLwENJDxQnKQ4YL5cVXz3bIv0qvsgZAszyZeczry4wCJctj+gUTeOqN/gkXXx
 /ZQMCFcckDOHzKqPNjSZAuFEQ2ydEVTP4/STE7eQvKsCsDbrQ6yBR1J05S8y078cawL0
 rqkkbgm+tuwoGJZ65w+THhwm8s7VKbOYPPqyMovZ8JAM87L+iy0DVc7PstmuTAbC4MZ+
 iaiYiZtRei+o04h9OW2lPRJ4TRnEZ5/UmklsBC4x2gD6rLEfh32GKc+MT1fnE/FBmPs5
 Lkcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=W8MMeSQ8q9L8iyYg2f4t6l4U5l8fjW6EZGzgFKN/23k=;
 b=p84gEXNxjNZQoVZdA6eUbtsCjG168dBJgcXHVhj8w07X0fXrGuCWadlOJBGMZBo0Py
 arL+y37P4w95It2aRjfXGYq/BujC925czPax9I6W0JlrFXotJ8aTpqOy165NnyF75FZQ
 BbIe7RsQtnb+JUaGd3UImvawq9DBnr6fHiaPJYXeXu25Gys5IrdYurA+8HGgmP1wyGoQ
 wliXFFxclZlbEs/fJJSb9+EChvqZWGyn1vNw9DRldU6heJDtLY0DDFBdMtpFA8O+PYze
 YoZV3umDp+cmRlLldBEYXx9aPPIbJVmjfaJsdICI7uLFXwTdAHsxZY8Pnt1O1rnznMWx
 IicA==
X-Gm-Message-State: AOAM532a4n6io1QLYmOt6BGIEFH7uTLm0jInFKLfo7WV5mG1fgmoktVX
 FRvuRv2qDPRqbGqV7ZzeuqE=
X-Google-Smtp-Source: ABdhPJwDauzkXi4zcjU+joDHQPtsomyAgxBTDG26HY7qaPKdw/IiFxCIZYhTZMtjkecWsck/hqd42Q==
X-Received: by 2002:a1c:bc8b:: with SMTP id m133mr3096098wmf.58.1611509167273; 
 Sun, 24 Jan 2021 09:26:07 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id y6sm18970568wrp.6.2021.01.24.09.26.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Jan 2021 09:26:06 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v2 08/25] hw/sd: ssi-sd: Add a state representing Nac
To: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, qemu-block@nongnu.org, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
References: <20210123104016.17485-1-bmeng.cn@gmail.com>
 <20210123104016.17485-9-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <94f29240-6713-9045-0146-19ff9355d682@amsat.org>
Date: Sun, 24 Jan 2021 18:26:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210123104016.17485-9-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Sun, 24 Jan 2021 17:26:12 -0000

On 1/23/21 11:39 AM, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> Per the "Physical Layer Specification Version 8.00" chapter 7.5.2,
> "Data Read", there is a minimum 8 clock cycles (Nac) after the card
> response and before data block shows up on the data out line. This
> applies to both single and multiple block read operations.
> 
> Current implementation of single block read already satisfies the
> timing requirement as in the RESPONSE state after all responses are
> transferred the state remains unchanged. In the next 8 clock cycles
> it jumps to DATA_START state if data is ready.
> 
> However we need an explicit state when expanding our support to
> multiple block read in the future. Let's add a new state PREP_DATA
> explicitly in the ssi-sd state machine to represent Nac.
> 
> Note we don't change the single block read state machine to let it
> jump from RESPONSE state to DATA_START state as that effectively
> generates a 16 clock cycles Nac, which might not be safe. As the
> spec says the maximum Nac shall be calculated from several fields
> encoded in the CSD register, we don't want to bother updating CSD
> to ensure our Nac is within range to complicate things.

As I don't have access to that part of the spec, I'm going to trust you.

Acked-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> 
> ---
> 
> Changes in v2:
> - new patch: add a state representing Nac
> 
>  hw/sd/ssi-sd.c | 5 +++++
>  1 file changed, 5 insertions(+)

