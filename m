Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l1iZt-0007Nl-GP
	for mharc-qemu-riscv@gnu.org; Mon, 18 Jan 2021 23:25:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1iZr-0007Ky-Bk; Mon, 18 Jan 2021 23:25:11 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:38493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1iZp-0001te-O7; Mon, 18 Jan 2021 23:25:11 -0500
Received: by mail-ej1-x62f.google.com with SMTP id 6so26613313ejz.5;
 Mon, 18 Jan 2021 20:25:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6RTWHpp3weCfpgjyGh0WYfmP3pNdF4pR3VX/AjwiBjc=;
 b=dPh0YDyQe+IH31nihm6YHkw/7W27xAlBsku/5R6ZbNmDRQ9U+buRW8uq5+YopDvpYA
 IoW17XxRpuYzd8mxMu2F+im+SV5plIggZNP6Zl52L91Rv7rFHiWY7D+IOWWV+vf/Cevg
 1BZ83wcFzAUUtMYD8EzpHj1ByyxOV+iT9CRG6K+N3M6BMcLrcOu5EP6ypu2Mf8wdf1+Y
 fCcREJnnt+qQRHbISe39PTDJRIhMvcuRE8+FnW/5O1ELgaBowKJPhmsn2AsnSsX5RQXt
 vYpb0RIbeVK46d+5sfKa3bcjPJGoPzdSOGU4+l5rvGiz2dJOyAM2ksp2RVRZtGdcSgfz
 /glw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6RTWHpp3weCfpgjyGh0WYfmP3pNdF4pR3VX/AjwiBjc=;
 b=Df3sL4XP33Coi2AlvooQtpG2rI4Fw6YY7CpEtE7n4F9BkwHLwrMP7S+1ipTHgho9w3
 OIDRBSMXayhW12yJqmga4qwsOmj3XKM9PPDtIAf47UWvIPR10Z6AVU4KSLEVDB/ltNTZ
 c94WpFiBZaBnGba/FZtxj0BfHLF5QsCDriXRAH2eh6xFPSaO/I3r2EYFA1GIFtyuxPAx
 MDxIBODYq7ZfjRhuZyAlq8j+sKC73uGJTqu0SIRIUIPDw6HDmMmJY/VAzYUTlnblwLUp
 QNcRf921dW+CnZjg22EDpjvgyQGt3Divw1XqsLmxNO0/GZ+B5ml9SSbvWi+xZrVrmxAL
 a5LA==
X-Gm-Message-State: AOAM533GA0Pf95I3lrYHE+dwQNQQmWMk6b3OzvFNGSMnGvyGzZijlruh
 iSIHxRqiXw1LlrIIiBrIC923ptR9BXA=
X-Google-Smtp-Source: ABdhPJwFZUiMThLCeicMxZOtgdx1nty4s7VFv5EZL/GxWppVGThDcUGRMYNxzcEZs7SQjrPWsFu3XQ==
X-Received: by 2002:a17:906:f98f:: with SMTP id
 li15mr1748301ejb.123.1611030307463; 
 Mon, 18 Jan 2021 20:25:07 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id s21sm9937384ejz.87.2021.01.18.20.25.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Jan 2021 20:25:06 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH] hw/misc: sifive_u_otp: Use error_report() when block
 operation fails
To: Bin Meng <bmeng.cn@gmail.com>, Peter Maydell <peter.maydell@linaro.org>,
 Green Wan <green.wan@sifive.com>, Alistair Francis <alistair.francis@wdc.com>
Cc: Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
References: <1611026585-29971-1-git-send-email-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <653fba5b-7ac2-983b-880a-6e7fd0059509@amsat.org>
Date: Tue, 19 Jan 2021 05:25:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <1611026585-29971-1-git-send-email-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.194,
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
X-List-Received-Date: Tue, 19 Jan 2021 04:25:11 -0000

On 1/19/21 4:23 AM, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> At present when blk_pread() / blk_pwrite() fails, a guest error
> is logged, but this is not really a guest error. Change to use
> error_report() instead.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 
>  hw/misc/sifive_u_otp.c | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

