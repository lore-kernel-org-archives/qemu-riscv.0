Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mG7Vh-00044A-IM
	for mharc-qemu-riscv@gnu.org; Tue, 17 Aug 2021 18:24:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mG7Vf-00043i-Pn; Tue, 17 Aug 2021 18:24:39 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:46996)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mG7Ve-0003L5-EL; Tue, 17 Aug 2021 18:24:39 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 h24-20020a1ccc180000b029022e0571d1a0so471386wmb.5; 
 Tue, 17 Aug 2021 15:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=La2XNtwsoqf6TVEt7iBNEed0xsqhfNl7IrDtDJqpbbk=;
 b=gDh/H3UvWJHPXmNbmWlzWbaKOzYJ+Ytv8liQBuDzbU4EEyetq71lL+tSfPHwZXVlc5
 3FngOppqO4OLqDWoxglBWuAB/UV27czeZmsQoSqX7PNnuajbf4GlTK/ULxaFyVQHW3Pz
 XXvsYhSNap/UVgAEfpwD6Vm40vGZJeIFM8XWgiZrp9L+1Qx83+CWkr5IAU5KFgcE6Bpg
 nn2wOBbRKAqNDqwWRstzrxOLhWkE/V2h9fKv4wnANfSzLBaIHhA3eYae4h+JCRP3iia6
 GsNvAuXRjOg2L9vhQfPQ7PulsgWf5P3BMgatbQnV+pK6ZauA5WM3IB7tQyFY3jSa19FB
 FrtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=La2XNtwsoqf6TVEt7iBNEed0xsqhfNl7IrDtDJqpbbk=;
 b=h9TkELQvxAR65aOMlBuzVemsAFfxaYDs8SC/uBA77iRT0Tjq/IgN3DBOGPhJ7byMtv
 lu8tObk5PXpU2AwxuCWIm1JGtw/2+4O0BQv99u9eLW5GHQPzI+QgK9NHKXiAUAXtakxR
 LQZwaXtBuZcXIMxpmJGg+0q3HN0ZtuNzqDBZHrICo2NSYRwner1NIRdtExyYSqT1cMBp
 gEFcxfu0b4JxIREVMvKu+E5ccQwi1QEsdojZJURe7WP814SPP/qRoWBkNTpm87XIJeC/
 F//cS3JirppCUZO2B0JPXby60qZOguPqEnwGW7/8w64oA9P0/ID0NgR18jEnLL3WhJlu
 GLgQ==
X-Gm-Message-State: AOAM530/BoGUYjlK2mY9Dz9PTLMKjYvn4G+q+KONlc716cHvbTEK/Err
 vCXKTAjYaNgtvbZHT6eh7so=
X-Google-Smtp-Source: ABdhPJxQAfFoGeNMR48DQKuhZsa/IMwb0DEmUfpQOK5eGkDtWVvhhozT9r/h4Evkyfmtoko1h68SXg==
X-Received: by 2002:a05:600c:4f13:: with SMTP id
 l19mr5223813wmq.171.1629239076668; 
 Tue, 17 Aug 2021 15:24:36 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id d4sm4238169wrc.34.2021.08.17.15.24.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Aug 2021 15:24:36 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v2 20/21] target/riscv: Tidy trans_rvh.c.inc
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Alistair.Francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 zhiwei_liu@c-sky.com
References: <20210817211803.283639-1-richard.henderson@linaro.org>
 <20210817211803.283639-21-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <ba8b22ea-fab9-7643-ff2d-e5f432bea768@amsat.org>
Date: Wed, 18 Aug 2021 00:24:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210817211803.283639-21-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.961,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 17 Aug 2021 22:24:40 -0000

On 8/17/21 11:18 PM, Richard Henderson wrote:
> Exit early if check_access fails.
> Split out do_hlv, do_hsv, do_hlvx subroutines.
> Use dest_gpr, get_gpr in the new subroutines.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/riscv/insn32.decode              |   1 +
>  target/riscv/insn_trans/trans_rvh.c.inc | 266 +++++-------------------
>  2 files changed, 57 insertions(+), 210 deletions(-)

Nice diffstat ;)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

