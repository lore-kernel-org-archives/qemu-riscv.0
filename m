Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m1kuC-0000WL-VV
	for mharc-qemu-riscv@gnu.org; Fri, 09 Jul 2021 03:26:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m1ku8-0000Pj-BU; Fri, 09 Jul 2021 03:26:32 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:42801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m1ku6-0004UN-Vu; Fri, 09 Jul 2021 03:26:32 -0400
Received: by mail-wr1-x435.google.com with SMTP id r11so5528616wro.9;
 Fri, 09 Jul 2021 00:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=IKeBBaChRJh8PNVnzQ1F/t8ynPR6rUI/nW4P8qURvJI=;
 b=BwvAFmskSOmKS2//1Bbb1uY7zuYo0rSMSS8Lx+BNsRVlWlUAvvmjAe7EH0ufxQse8c
 +nAY9Pwveh1F4ON6Z6QCzoFd4V70SVOeCaNVyvsGKSnuqxnPBw6vtsA0AF8WbkZWcGIP
 9vi4n8NeRLV3lRM47M/wI1zxp612pOZhNtd7bx1v4mo3oUfHzTLGYJm0+3kQT0l2V3KJ
 GkTPE8cbAgjIVvx4MPdlTSsP4mREyRHT35mWv7QZ/TKDSp1XhQVuzrihpe9CgmVlh3QE
 iqxar6ZNX3C78z8/S54yA2xXAnMgKzNTk/xkD/unY8ScrbBazhcF1pw/gK/xakh+q/SQ
 QAIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IKeBBaChRJh8PNVnzQ1F/t8ynPR6rUI/nW4P8qURvJI=;
 b=EQs397pqUnUMuyHLB3mHK6vve6fR8vzC/InyJy0MhA+FbI9lGn/oDGddM0TyxUZ/wn
 BWKTWEBWmXf4PESSh8Lmt8CymNrAIPNS3QnWNz92CL+Pww8OO7rtWX/91zNhCGy92Ki2
 EoObnPsSEHVWe4sFJ1vncAw8dnmrECcXQJD9eRUPFW5ZY1ej9K5KsMexZMTufdpoK/XD
 5LKpqAJaYj1UXK8gLFWdMOzzUUedn7KOOfLkylKabuufocoSP7sxmt0/byYiF8a1wUWD
 dDJyQ//2yxkuNMLsFR/ZCBv64bLzAvPDYRyHLipYMyzbon1lFa7ffsh6WP1r9b/zuR7k
 cakA==
X-Gm-Message-State: AOAM532pO2Z/YIx2/Q6ANjFCqgCApRFbqfCQzrG8A8vSCclBYqKeUkAz
 OCDfAcUMDMDZZ+qX2+Hv4tk=
X-Google-Smtp-Source: ABdhPJw2Lu0pzC7ZHJ/n4OWweQK/srv/hXgcoIzF2/V6RJX1Iq+n0EANs3OroPN7S/I/WyjKBWLUhA==
X-Received: by 2002:a5d:6c65:: with SMTP id r5mr40429405wrz.395.1625815589388; 
 Fri, 09 Jul 2021 00:26:29 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id s7sm4422470wrp.97.2021.07.09.00.26.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jul 2021 00:26:28 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v1 5/5] hw/intc: ibex_timer: Convert the timer to use
 RISC-V CPU GPIO lines
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair23@gmail.com
References: <37f8680b1ae39de82f9594d8e7a0d9596de9be8b.1625801410.git.alistair.francis@wdc.com>
 <85c77d5c22719a8a93561f5fbe4d0bc0d63b6266.1625801410.git.alistair.francis@wdc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <c989d787-adab-6992-0dac-e31338f4aead@amsat.org>
Date: Fri, 9 Jul 2021 09:26:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <85c77d5c22719a8a93561f5fbe4d0bc0d63b6266.1625801410.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Fri, 09 Jul 2021 07:26:33 -0000

On 7/9/21 5:31 AM, Alistair Francis wrote:
> Instead of using riscv_cpu_update_mip() let's instead use the new RISC-V
> CPU GPIO lines to set the timer MIP bits.
> 
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  include/hw/timer/ibex_timer.h |  2 ++
>  hw/riscv/opentitan.c          |  3 +++
>  hw/timer/ibex_timer.c         | 17 ++++++++++++-----
>  3 files changed, 17 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

