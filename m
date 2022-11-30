Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p0Kgz-0004uP-W9
	for mharc-qemu-riscv@gnu.org; Wed, 30 Nov 2022 05:51:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0Kgp-0004sC-Nz
 for qemu-riscv@nongnu.org; Wed, 30 Nov 2022 05:51:52 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0Kgm-0007Ci-DX
 for qemu-riscv@nongnu.org; Wed, 30 Nov 2022 05:51:43 -0500
Received: by mail-wm1-x336.google.com with SMTP id m19so3746195wms.5
 for <qemu-riscv@nongnu.org>; Wed, 30 Nov 2022 02:51:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=F/QMPNnwC1L8+xAh/udqpCveipXq509FkVBevq44/ek=;
 b=qfpI/fE348EkLunToe/74s0Ag4OPVMOdbm5kGQXiOAFyxp+/epyrH2WrxE6uZDi2ON
 JfH5i/Pp0vCX73MlpQM5HIMBSpTKqaha5KM4mXdTji/udBtJ/ETX6gd/AzKtp8J6xF9t
 GvzJ/qmhD3NTE+cpV+Ad0Sn0YWQ/qFCdBfUKg8qT1eBy+1HUp7jAydYt1iUEJVRrPTDT
 BCDFiNAFykHLSGteIxHusadzLaAB0VFAn6F4sKTm3zhj2r0Sr4BwdRsU+sMmmsn+0zRj
 ST1kER3d2QiRJ4Bt1PwTH7wAXu8qICF7j+R4L17UMrwTzg0yWznn6YD2s9kvsmxltpQ1
 CuEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=F/QMPNnwC1L8+xAh/udqpCveipXq509FkVBevq44/ek=;
 b=XUxqC7ZkxLyYpw8GruoFicRzUNIh28KAOixMOPufAm8h4Lk6RyZs8Whl+LMfD2LNC2
 kVDjcC+0gOd1i/idIwi2cNv1kVy2kfr3PCM4SQyPcj67ZeR5KNK19xMH8FJP0q10MipZ
 M5XayqkZYU66riOfDyRwvYe92e4RN1O9/iME94+8QsQIcmG+OAyyBZK0SF/7xTt921NP
 or3qeiro7r5ZPO1nz+/X7zsOyuB8svC0WtNVDDb0k9K62RGHyI0FH3YV5dXHSf/9Nc/1
 qcdJPP9ekgj8uDTpKtTumTHmWiqYP9NAEQLfq6ryPbtxjDD+5wh59pTDQVcyOaQ+Q2ji
 w/NQ==
X-Gm-Message-State: ANoB5pn24aJNPW6HxHtEShhMrjzV0Eif73x1gjBeruCIc8F6Tyy4tMeu
 fT4vd2Y7QJIO4CSgtfebXbqt2w==
X-Google-Smtp-Source: AA0mqf4h5Z0DON51/TPhlRUJGzxjlKlsfmR1mms/uUZgqzIvOLIpv/MB4clINIsI91xgNJvZAdHAHg==
X-Received: by 2002:a1c:2b81:0:b0:3b4:88ba:a74c with SMTP id
 r123-20020a1c2b81000000b003b488baa74cmr30873431wmr.77.1669805498330; 
 Wed, 30 Nov 2022 02:51:38 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 p18-20020adfce12000000b00242271fd2besm1134448wrn.89.2022.11.30.02.51.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Nov 2022 02:51:37 -0800 (PST)
Message-ID: <0f9b0728-d6b5-a37b-2dcb-7b7fbee876a3@linaro.org>
Date: Wed, 30 Nov 2022 11:51:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH for-8.0 00/19] Convert most CPU classes to 3-phase reset
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Michael Rolnik <mrolnik@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Taylor Simpson <tsimpson@quicinc.com>, Song Gao <gaosong@loongson.cn>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Laurent Vivier
 <laurent@vivier.eu>, Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 Stafford Horne <shorne@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org
References: <20221124115023.2437291-1-peter.maydell@linaro.org>
 <51024464-6fd6-4181-633d-1e261c19917a@linaro.org>
In-Reply-To: <51024464-6fd6-4181-633d-1e261c19917a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.258,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Wed, 30 Nov 2022 10:51:52 -0000

On 24/11/22 14:46, Philippe Mathieu-Daudé wrote:
> On 24/11/22 12:50, Peter Maydell wrote:
>> This patchset converts the TYPE_CPU base class and most subclasses
>> to use 3-phase reset. (The exception is s390, which is doing
>> something a bit odd with its reset, so the conversion there isn't
>> going to be simple like these others. So I'll do that one
>> separately.)
Note, we can then remove scripts/coccinelle/cpu-reset.cocci.

